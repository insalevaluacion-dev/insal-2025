//require('dotenv').config();
const express = require('express');
const mysql = require('mysql2');
const path = require('path');
const session = require('express-session');
const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({
  secret: '11708',
  resave: false,
  saveUninitialized: false,
  cookie: { secure: false, httpOnly: true }
}));
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

const conexion = mysql.createConnection({
  host: 'shinkansen.proxy.rlwy.net',
  user: 'root',
  password: 'DxVaiNRIdWmfBOhQLvpyuFgDrkrfDDnl',
  database: 'railway',
  port: '47888'
});

conexion.connect((err) => {
  if (err) {
    console.error('No se pudo conectar por esta razón: ', err);
    return;
  }
  console.log('Conexión exitosa');
});

app.get('/', (req, res) => {
  res.render('index');
});

app.post('/enviarEvaluador', (req, res) => {
  const { nombreEvaluador, email } = req.body;

  if (!nombreEvaluador || !email) {
    return res.status(400).json({ mensaje: 'Nombre y email son requeridos' });
  }

  const insertar1 = 'INSERT INTO evaluadores (nombre, email) VALUES (?, ?)';
  const valores1 = [nombreEvaluador, email];

  conexion.query(insertar1, valores1, (err, resultado1) => {
    if (err) {
      return res.status(500).json({ mensaje: 'No se guardaron los datos' });
    }
    const evaluadorId = resultado1.insertId;

    req.session.datosEvaluador = {
      id: evaluadorId,
      nombreEvaluador,
      email
    };

    res.redirect('/html/seleccion2.html');
  });
});

app.get('/html/seleccion2.html', (req, res) => {
  if (!req.session.datosEvaluador) {
    return res.redirect('/');
  }
  res.sendFile(path.join(__dirname, 'public/html/seleccion2.html'));
});

app.post('/guardar-nivel', (req, res) => {
  const { numNivel } = req.body;
  if (!numNivel || ![1, 2, 3, 4].includes(Number(numNivel))) {
    return res.status(400).json({ mensaje: 'Nivel no válido' });
  }
  req.session.numNivel = numNivel;
  res.json({ mensaje: 'Nivel guardado correctamente' });
});

app.get('/obtener-nivel', (req, res) => {
  if (!req.session.numNivel) {
    return res.status(400).json({ mensaje: 'No se ha seleccionado un nivel' });
  }
  res.json({
    numNivel: req.session.numNivel,
    idProyecto: req.session.idProyecto,
    nombreProyecto: req.session.nombreProyecto,
    evaluacionId: req.session.evaluacionId
  });
});

app.get('/grados/anos/:numNivel', (req, res) => {
  const numNivel = Number(req.params.numNivel);
  if (!numNivel || ![1, 2, 3, 4].includes(numNivel)) {
    return res.status(400).json({ mensaje: 'Nivel no válido' });
  }
  const query = `
        SELECT DISTINCT g.año 
        FROM grados g
        JOIN proyectos p ON g.grado_id = p.grado_id
        WHERE p.nivel_id = ?
        ORDER BY g.año
    `;
  conexion.query(query, [numNivel], (err, results) => {
    if (err) {
      return res.status(500).json({ mensaje: 'Error al obtener años' });
    }
    const años = results.map(row => row.año);
    res.json({ años });
  });
});

app.get('/grados/nombres/:numNivel/:ano', (req, res) => {
  const numNivel = Number(req.params.numNivel);
  const ano = req.params.ano;
  if (!numNivel || !ano) {
    return res.status(400).json({ mensaje: 'Parámetros no válidos' });
  }
  const query = `
        SELECT DISTINCT g.nombre
        FROM grados g
        JOIN proyectos p ON g.grado_id = p.grado_id
        WHERE p.nivel_id = ? AND g.año = ?
        ORDER BY g.nombre
    `;
  conexion.query(query, [numNivel, ano], (err, results) => {
    if (err) {
      return res.status(500).json({ mensaje: 'Error al obtener nombres' });
    }
    const nombres = results.map(row => {
      const nombreCompleto = {
        'G': 'General',
        'DS': 'Desarrollo de Software',
        'DG': 'Diseño Gráfico',
        'APS': 'Atención Primaria en Salud',
        'SE': 'Sistemas Eléctricos',
        'LyA': 'Logística y Aduanas',
        'AC': 'Administrativo Contable'
      }[row.nombre] || row.nombre;
      return nombreCompleto;
    });
    res.json({ nombres });
  });
});

app.get('/grados/secciones/:numNivel/:ano/:nombre', (req, res) => {
  const numNivel = Number(req.params.numNivel);
  const ano = req.params.ano;
  const nombre = req.params.nombre;
  if (!numNivel || !ano || !nombre) {
    return res.status(400).json({ mensaje: 'Parámetros no válidos' });
  }
  const query = `
        SELECT DISTINCT g.seccion
        FROM grados g
        JOIN proyectos p ON g.grado_id = p.grado_id
        WHERE p.nivel_id = ? AND g.año = ? AND g.nombre = ?
        ORDER BY g.seccion
    `;
  conexion.query(query, [numNivel, ano, nombre], (err, results) => {
    if (err) {
      return res.status(500).json({ mensaje: 'Error al obtener secciones' });
    }
    const secciones = results.map(row => row.seccion);
    res.json({ secciones });
  });
});

app.get('/proyectos/:numNivel/:ano/:nombre/:seccion', (req, res) => {
  const numNivel = Number(req.params.numNivel);
  const ano = req.params.ano;
  const nombre = req.params.nombre;
  const seccion = req.params.seccion;
  if (!numNivel || !ano || !nombre || !seccion) {
    return res.status(400).json({ mensaje: 'Parámetros no válidos' });
  }
  const query = `
        SELECT p.proyecto_id, p.nombre
        FROM proyectos p
        JOIN grados g ON p.grado_id = g.grado_id
        LEFT JOIN (
            SELECT proyecto_id, COUNT(*) as count
            FROM evaluaciones
            GROUP BY proyecto_id
        ) e ON p.proyecto_id = e.proyecto_id
        WHERE p.nivel_id = ? AND g.año = ? AND g.nombre = ? AND g.seccion = ?
        AND (e.count IS NULL OR e.count < 3)
    `;
  conexion.query(query, [numNivel, ano, nombre, seccion], (err, results) => {
    if (err) {
      return res.status(500).json({ mensaje: 'Error al obtener los proyectos' });
    }
    res.json({ proyectos: results });
  });
});

app.post('/guardar-proyecto', (req, res) => {
  const { idProyecto, nombreProyecto } = req.body;
  if (!idProyecto || !nombreProyecto) {
    return res.status(400).json({ mensaje: 'Proyecto no válido' });
  }
  req.session.idProyecto = idProyecto;
  req.session.nombreProyecto = nombreProyecto;
  delete req.session.evaluacionId;
  res.json({ mensaje: 'Proyecto guardado correctamente' });
});

app.get('/html/formulario.html', (req, res) => {
  if (!req.session.numNivel || !req.session.datosEvaluador || !req.session.idProyecto) {
    return res.redirect('/html/seleccion2.html');
  }
  res.sendFile(path.join(__dirname, 'public/html/formulario.html'));
});

app.get('/obtener-evaluador', (req, res) => {
  const datos = req.session.datosEvaluador;
  if (!datos) {
    return res.status(400).json({ mensaje: 'No se ha registrado un evaluador' });
  }
  res.json({ evaluadorId: datos.id, nombreEvaluador: datos.nombreEvaluador, email: datos.email });
});

app.get('/criterios', (req, res) => {
  const numNivel = req.session.numNivel;
  if (!numNivel) {
    return res.status(400).json({ mensaje: 'No se ha seleccionado un nivel' });
  }
  const query = 'SELECT criterio_id, nombre, descripcion, porcentaje FROM criterios WHERE nivel_id = ?';
  conexion.query(query, [numNivel], (err, results) => {
    if (err) {
      return res.status(500).json({ mensaje: 'Error al obtener los criterios' });
    }
    res.json({ criterios: results });
  });
});

app.get('/estudiantes/:proyectoId', (req, res) => {
  const proyectoId = Number(req.params.proyectoId);
  if (!proyectoId) {
    return res.status(400).json({ mensaje: 'proyectoId no válido' });
  }

  const queryCount = `
        SELECT COUNT(*) as count
        FROM evaluaciones
        WHERE proyecto_id = ?
    `;
  conexion.query(queryCount, [proyectoId], (err, countResults) => {
    if (err) {
      return res.status(500).json({ mensaje: 'Error al verificar evaluaciones' });
    }

    const evaluacionCount = countResults[0].count;
    if (evaluacionCount >= 3) {
      return res.json({ estudiantes: [], evaluacionesCompletas: true });
    }

    const query = `
            SELECT estudiante_id, nombre
            FROM estudiantes
            WHERE proyecto_id = ? AND asistencia = 0
        `;
    conexion.query(query, [proyectoId], (err, results) => {
      if (err) {
        return res.status(500).json({ mensaje: 'Error al obtener estudiantes' });
      }
      res.json({ estudiantes: results, evaluacionesCompletas: false });
    });
  });
});

app.post('/guardar-asistencia', (req, res) => {
  const { estudianteIds } = req.body;
  const proyectoId = req.session.idProyecto;

  if (!proyectoId || !estudianteIds || !Array.isArray(estudianteIds)) {
    return res.status(400).json({ mensaje: 'Datos incompletos' });
  }

  if (estudianteIds.length === 0) {
    return res.status(200).json({ mensaje: 'No se seleccionaron estudiantes' });
  }

  const query = 'UPDATE estudiantes SET asistencia = 1 WHERE estudiante_id = ? AND proyecto_id = ?';
  let completedQueries = 0;
  const totalQueries = estudianteIds.length;

  estudianteIds.forEach(estudianteId => {
    conexion.query(query, [estudianteId, proyectoId], (err) => {
      if (err) {
        return res.status(500).json({ mensaje: 'Error al guardar asistencia' });
      }
      completedQueries++;
      if (completedQueries === totalQueries) {
        res.status(200).json({ mensaje: 'Asistencia guardada correctamente' });
      }
    });
  });
});

app.post('/guardar-evaluacion', (req, res) => {
  const { evaluaciones } = req.body;
  const evaluadorId = req.session.datosEvaluador?.id;
  const proyectoId = req.session.idProyecto;

  if (!evaluadorId || !proyectoId || !evaluaciones || !Array.isArray(evaluaciones)) {
    return res.status(400).json({ mensaje: 'Datos incompletos' });
  }

  const queryCriterios = 'SELECT criterio_id, porcentaje FROM criterios WHERE criterio_id IN (?)';
  const criterioIds = evaluaciones.map(e => e.criterio_id);

  conexion.query(queryCriterios, [criterioIds], (err, criteriosResults) => {
    if (err) {
      return res.status(500).json({ mensaje: 'Error al obtener criterios' });
    }

    let totalPuntuacion = 0;
    evaluaciones.forEach(evaluacion => {
      const criterio = criteriosResults.find(c => c.criterio_id === evaluacion.criterio_id);
      if (criterio) {
        totalPuntuacion += (evaluacion.puntuacion * criterio.porcentaje / 100);
      }
    });

    totalPuntuacion = totalPuntuacion > 10 ? 10 : totalPuntuacion;

    conexion.beginTransaction(err => {
      if (err) {
        return res.status(500).json({ mensaje: 'Error al iniciar transacción' });
      }

      const queryEvaluacion = 'INSERT INTO evaluaciones (evaluador_id, proyecto_id, fecha_evaluacion, nota_evaluacion) VALUES (?, ?, NOW(), ?)';
      conexion.query(queryEvaluacion, [evaluadorId, proyectoId, totalPuntuacion], (err, result) => {
        if (err) {
          return conexion.rollback(() => {
            return res.status(500).json({ mensaje: 'Error al guardar en evaluaciones' });
          });
        }

        const evaluacionId = result.insertId;
        req.session.evaluacionId = evaluacionId;

        const queryCriterios = 'INSERT INTO evaluacion_criterios (criterio_id, puntuacion, evaluacion_id) VALUES (?, ?, ?)';
        let completedQueries = 0;
        const totalQueries = evaluaciones.length;

        evaluaciones.forEach(({ criterio_id, puntuacion }) => {
          conexion.query(queryCriterios, [criterio_id, puntuacion, evaluacionId], (err) => {
            if (err) {
              return conexion.rollback(() => {
                return res.status(500).json({ mensaje: 'Error al guardar evaluación criterio' });
              });
            }
            completedQueries++;
            if (completedQueries === totalQueries) {
              const queryCount = 'SELECT COUNT(*) as count, AVG(nota_evaluacion) as promedio FROM evaluaciones WHERE proyecto_id = ?';
              conexion.query(queryCount, [proyectoId], (err, results) => {
                if (err) {
                  return conexion.rollback(() => {
                    return res.status(500).json({ mensaje: 'Error al contar evaluaciones' });
                  });
                }

                const count = results[0].count;
                if (count >= 3) {
                  const promedio = results[0].promedio;
                  const queryUpdate = 'UPDATE proyectos SET nota = ? WHERE proyecto_id = ?';
                  conexion.query(queryUpdate, [promedio, proyectoId], (err) => {
                    if (err) {
                      return conexion.rollback(() => {
                        return res.status(500).json({ mensaje: 'Error al actualizar nota del proyecto' });
                      });
                    }
                    conexion.commit(err => {
                      if (err) {
                        return conexion.rollback(() => {
                          return res.status(500).json({ mensaje: 'Error al confirmar transacción' });
                        });
                      }
                      res.status(200).json({ mensaje: 'Evaluación guardada correctamente', redirect: '/html/resumen.html' });
                    });
                  });
                } else {
                  conexion.commit(err => {
                    if (err) {
                      return conexion.rollback(() => {
                        return res.status(500).json({ mensaje: 'Error al confirmar transacción' });
                      });
                    }
                    res.status(200).json({ mensaje: 'Evaluación guardada correctamente', redirect: '/html/resumen.html' });
                  });
                }
              });
            }
          });
        });
      });
    });
  });
});

app.get('/evaluacion-criterios/:evaluacionId', (req, res) => {
  const evaluacionId = Number(req.params.evaluacionId);
  if (!evaluacionId) {
    return res.status(400).json({ mensaje: 'evaluacionId no válido' });
  }

  const query = `
        SELECT ec.criterio_id, c.nombre, c.descripcion, ec.puntuacion, c.porcentaje
        FROM evaluacion_criterios ec
        JOIN criterios c ON ec.criterio_id = c.criterio_id
        WHERE ec.evaluacion_id = ?
    `;
  conexion.query(query, [evaluacionId], (err, results) => {
    if (err) {
      return res.status(500).json({ mensaje: 'Error al obtener los criterios evaluados' });
    }
    res.json({ criterios: results });
  });
});

app.get('/html/resumen.html', (req, res) => {
  if (!req.session.datosEvaluador || !req.session.evaluacionId) {
    return res.redirect('/html/seleccion2.html');
  }
  res.sendFile(path.join(__dirname, 'public/html/resumen.html'));
});

app.post('/limpiar-sesion', (req, res) => {
  const datosEvaluador = req.session.datosEvaluador;
  req.session.numNivel = null;
  req.session.idProyecto = null;
  req.session.nombreProyecto = null;
  req.session.evaluacionId = null;
  req.session.datosEvaluador = datosEvaluador;
  res.json({ mensaje: 'Sesión limpiada correctamente' });
});

app.get('/proyecto/:id', (req, res) => {
  const proyectoId = req.params.id;
  conexion.query('SELECT nombre FROM proyectos WHERE proyecto_id = ?', [proyectoId], (error, results) => {
    if (error) {
      return res.status(500).json({ error: 'Error en el servidor' });
    }
    res.json(results.length > 0 ? { nombre: results[0].nombre } : { error: 'Proyecto no encontrado' });
  });
});

//app.listen(3000, () => {
//    console.log('Servidor corriendo en http://localhost:3000');
//});

app.listen(3000, '0.0.0.0', () => {
  console.log('Servidor en http://0.0.0.0:3000');
});   
