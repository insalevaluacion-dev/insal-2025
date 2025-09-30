document.addEventListener('DOMContentLoaded', async () => {
    const selectEvento = document.getElementById('evento');
    const selectAño = document.getElementById('año');
    const labelAño = document.getElementById('label-año');
    const selectNombre = document.getElementById('nombre');
    const selectSeccion = document.getElementById('seccion');
    const botonBuscar = document.getElementById('buscar-proyectos');
    const modalProyectos = document.getElementById('modal-proyectos');
    const contenedorProyectos = document.getElementById('contenedor-proyectos');
    const nombresMap = {
        'General': 'G',
        'Desarrollo de Software': 'DS',
        'Diseño Gráfico': 'DG',
        'Atención Primaria en Salud': 'APS',
        'Sistemas Eléctricos': 'SE',
        'Logística y Aduanas': 'LyA',
        'Administrativo Contable': 'AC'
    };

    selectEvento.addEventListener('change', async () => {
        const [numNivel, año, nombreEvento] = selectEvento.value.split('|') || [];
        selectAño.disabled = true;
        selectNombre.disabled = true;
        selectSeccion.disabled = true;
        selectAño.innerHTML = '<option value="" hidden>Seleccione un año</option>';
        selectNombre.innerHTML = '<option value="" hidden>Seleccione un grado</option>';
        selectSeccion.innerHTML = '<option value="" hidden>Seleccione una sección</option>';
        botonBuscar.disabled = true;
        labelAño.style.display = 'none';
        selectAño.style.display = 'none';

        if (!numNivel) return;

        const respuestaNivel = await fetch('/guardar-nivel', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ numNivel })
        });
        const nivelData = await respuestaNivel.json();
        console.log('Respuesta /guardar-nivel:', nivelData);

        if (numNivel === '1') {
            labelAño.style.display = 'block';
            selectAño.style.display = 'block';
            const respuestaAños = await fetch(`/grados/anos/${numNivel}`, {
                method: 'GET',
                headers: { 'Content-Type': 'application/json' }
            });
            const añosData = await respuestaAños.json();
            console.log('Respuesta /grados/anos:', añosData);
            if (añosData.años?.length > 0) {
                añosData.años.forEach(año => {
                    const option = document.createElement('option');
                    option.value = año;
                    option.textContent = año;
                    selectAño.appendChild(option);
                });
                selectAño.disabled = false;
            }
        } else {
            selectAño.value = año;
            cargarNombres(numNivel, año);
        }
    });

    selectAño.addEventListener('change', async () => {
        const numNivel = selectEvento.value.split('|')[0];
        const año = selectAño.value;
        selectNombre.disabled = true;
        selectSeccion.disabled = true;
        selectNombre.innerHTML = '<option value="" hidden>Seleccione un grado</option>';
        selectSeccion.innerHTML = '<option value="" hidden>Seleccione una sección</option>';
        botonBuscar.disabled = true;

        if (!numNivel || !año) return;

        cargarNombres(numNivel, año);
    });

    async function cargarNombres(numNivel, año) {
        const respuestaNombres = await fetch(`/grados/nombres/${numNivel}/${encodeURIComponent(año)}`, {
            method: 'GET',
            headers: { 'Content-Type': 'application/json' }
        });
        const nombresData = await respuestaNombres.json();
        console.log('Respuesta /grados/nombres:', nombresData);
        if (nombresData.nombres?.length > 0) {
            nombresData.nombres.forEach(nombre => {
                const option = document.createElement('option');
                option.value = nombre;
                option.textContent = nombre;
                selectNombre.appendChild(option);
            });
            selectNombre.disabled = false;
        }
    }

    selectNombre.addEventListener('change', async () => {
        const [numNivel] = selectEvento.value.split('|');
        const año = selectAño.value || selectEvento.value.split('|')[1];
        const nombre = nombresMap[selectNombre.value] || selectNombre.value;
        selectSeccion.disabled = true;
        selectSeccion.innerHTML = '<option value="" hidden>Seleccione una sección</option>';
        botonBuscar.disabled = true;

        if (!numNivel || !año || !nombre) return;

        const respuestaSecciones = await fetch(`/grados/secciones/${numNivel}/${encodeURIComponent(año)}/${encodeURIComponent(nombre)}`, {
            method: 'GET',
            headers: { 'Content-Type': 'application/json' }
        });
        const seccionesData = await respuestaSecciones.json();
        console.log('Respuesta /grados/secciones:', seccionesData);
        if (seccionesData.secciones?.length > 0) {
            seccionesData.secciones.forEach(seccion => {
                const option = document.createElement('option');
                option.value = seccion;
                option.textContent = seccion;
                selectSeccion.appendChild(option);
            });
            selectSeccion.disabled = false;
        }
    });

    selectSeccion.addEventListener('change', () => {
        const [numNivel] = selectEvento.value.split('|');
        const año = selectAño.value || selectEvento.value.split('|')[1];
        if (numNivel && año && selectNombre.value && selectSeccion.value) {
            botonBuscar.disabled = false;
        }
    });

    botonBuscar.addEventListener('click', async () => {
        const [numNivel] = selectEvento.value.split('|');
        const año = selectAño.value || selectEvento.value.split('|')[1];
        const nombre = nombresMap[selectNombre.value] || selectNombre.value;
        const seccion = selectSeccion.value;

        const respuestaProyectos = await fetch(`/proyectos/${numNivel}/${encodeURIComponent(año)}/${encodeURIComponent(nombre)}/${encodeURIComponent(seccion)}`, {
            method: 'GET',
            headers: { 'Content-Type': 'application/json' }
        });
        const proyectosData = await respuestaProyectos.json();
        console.log('Respuesta /proyectos:', proyectosData);
        contenedorProyectos.innerHTML = '';

        if (proyectosData.proyectos?.length > 0) {
            const proyectosHTML = proyectosData.proyectos.map(proyecto => `
                <div class="grupo__element">
                    <p>${proyecto.nombre}</p>
                    <div class="principal__element--button">
                        <button class="btn centrar" onclick="guardarProyecto(${proyecto.proyecto_id}, '${proyecto.nombre}')">
                            Evaluar
                            <span class="material-symbols-outlined">
                                arrow_right_alt
                            </span>
                        </button>
                    </div>
                </div>
            `).join('');
            
            contenedorProyectos.innerHTML = proyectosHTML;
            modalProyectos.style.display = 'block';
            void modalProyectos.offsetWidth;
            modalProyectos.classList.add('active');
        } else {
            contenedorProyectos.innerHTML = 'No hay proyectos disponibles para estos filtros.';
            modalProyectos.style.display = 'block';
            void modalProyectos.offsetWidth;
            modalProyectos.classList.add('active');
        }
    });
});

async function guardarProyecto(idProyecto, nombreProyecto) {
    const response = await fetch('/guardar-proyecto', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ idProyecto, nombreProyecto })
    });
    const result = await response.json();
    if (response.ok) {
        window.location.href = '/html/formulario.html';
    }
}

function cerrarModalProyectos() {
    const modal = document.getElementById('modal-proyectos');
    modal.classList.remove('active');
    setTimeout(() => {
        modal.style.display = 'none';
    }, 300);
}
