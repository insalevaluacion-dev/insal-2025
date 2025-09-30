document.addEventListener('DOMContentLoaded', async () => {
    const nombreProyectoElement = document.getElementById('nombre-proyecto');
    const modalAsistencia = document.getElementById('modal-asistencia');
    const listaEstudiantes = document.getElementById('lista-estudiantes');
    const formularioEvaluacion = document.getElementById('formulario-evaluacion');
    const contenedorCriterios = document.createElement('div');
    contenedorCriterios.classList.add('contenedor-criterios');
    formularioEvaluacion.appendChild(contenedorCriterios);

    const respuestaNivel = await fetch('/obtener-nivel', {
        method: 'GET',
        headers: { 'Content-Type': 'application/json' }
    });
    const nivelData = await respuestaNivel.json();
    console.log('Respuesta /obtener-nivel:', nivelData);
    if (!nivelData.idProyecto || !nivelData.numNivel) {
        window.location.href = '/html/seleccion2.html';
        return;
    }

    const proyectoId = nivelData.idProyecto;
    const numNivel = nivelData.numNivel;

    // Obtener y mostrar el nombre del proyecto
    const respuestaProyecto = await fetch(`/proyecto/${proyectoId}`);
    const proyectoData = await respuestaProyecto.json();
    nombreProyectoElement.textContent = proyectoData.nombre 
        ? `Nombre del proyecto: ${proyectoData.nombre}` 
        : 'Nombre del proyecto: No disponible';

    const respuestaCriterios = await fetch('/criterios', {
        method: 'GET',
        headers: { 'Content-Type': 'application/json' }
    });
    const criteriosData = await respuestaCriterios.json();
    console.log('Respuesta /criterios:', criteriosData);
    if (criteriosData.criterios?.length > 0) {
        contenedorCriterios.innerHTML = '<h4>Criterios de Evaluación</h4>';
        criteriosData.criterios.forEach(criterio => {
            const div = document.createElement('div');
            div.classList.add('criterio');
            div.innerHTML = `
            <div class="titulo__criterio" onclick="AbrirDescripcion(this)">
                ${criterio.nombre}
                <span class="material-symbols-outlined flecha">
                    stat_minus_1
                </span>
                <div><p>(${criterio.porcentaje}%)</p></div>
            </div>
            <p for="criterio-${criterio.criterio_id}" class="descripcion">
                ${criterio.descripcion} (${criterio.porcentaje}%):
            </p>
            <md-outlined-text-field 
                autocomplete="none" 
                id="criterio-${criterio.criterio_id}" 
                name="criterio-${criterio.criterio_id}" 
                label="Nota asignada" 
                type="number" 
                min="1.0" 
                max="10.0" 
                step="0.1" 
                required 
                pattern="^\d+(\.\d{0,1})?$"
                inputmode="decimal" 
                class="input_text-field" 
                supporting-text="La calificación debe ser entre 1.0 y 10.0 puntos (un decimal)">
            </md-outlined-text-field>
            `;
            contenedorCriterios.appendChild(div);
        });
        const submitButton = document.createElement('button');
        submitButton.classList.add('btn');
        submitButton.classList.add('centrar');
        submitButton.type = 'button';
        submitButton.innerHTML = `
            Enviar evaluación
            <span class="material-symbols-outlined">send</span>
        `;
        submitButton.onclick = () => guardarEvaluacion();
        contenedorCriterios.appendChild(submitButton);
    } else {
        contenedorCriterios.innerHTML = '<p>No hay criterios disponibles para este nivel.</p>';
    }

    const respuestaEstudiantes = await fetch(`/estudiantes/${proyectoId}`, {
        method: 'GET',
        headers: { 'Content-Type': 'application/json' }
    });
    const estudiantesData = await respuestaEstudiantes.json();
    console.log('Respuesta /estudiantes:', estudiantesData);

    if (estudiantesData.estudiantes.length > 0 && !estudiantesData.evaluacionesCompletas) {
        estudiantesData.estudiantes.forEach(estudiante => {
            const li = document.createElement('li');
            li.innerHTML = `
                <label class="estudiante-checkbox">
                    <md-checkbox 
                        name="estudiante" 
                        value="${estudiante.estudiante_id}"
                        touch-target="wrapper">
                    </md-checkbox>
                    ${estudiante.nombre}
                </label>
            `;
            listaEstudiantes.appendChild(li);
        });
        modalAsistencia.style.display = 'block';
        void modalAsistencia.offsetWidth;
        modalAsistencia.classList.add('active');
    } else {
        modalAsistencia.style.display = 'none';
    }
});

function guardarAsistencia() {
    const checkboxes = document.querySelectorAll('#formulario-asistencia md-checkbox[name="estudiante"]');
    const estudianteIds = Array.from(checkboxes)
        .filter(checkbox => checkbox.checked)
        .map(checkbox => Number(checkbox.value));

    fetch('/guardar-asistencia', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ estudianteIds })
    })
        .then(response => response.json())
        .then(data => {
            console.log('Respuesta /guardar-asistencia:', data);
            cerrarModalAsistencia();
        });
}

function cerrarModalAsistencia() {
    const modal = document.getElementById('modal-asistencia');
    modal.classList.remove('active');
    setTimeout(() => {
        modal.style.display = 'none';
    }, 300);
}

function guardarEvaluacion() {
    const criteriosInputs = document.querySelectorAll('#formulario-evaluacion md-outlined-text-field[name^="criterio-"]');
    const evaluaciones = [];

    fetch('/criterios', {
        method: 'GET',
        headers: { 'Content-Type': 'application/json' }
    })
        .then(response => response.json())
        .then(criteriosData => {
            if (!criteriosData.criterios?.length) {
                return;
            }

            let totalPuntuacion = 0;
            let valid = true;

            let firstInvalidField = null;
            criteriosInputs.forEach(input => {
                const criterioId = Number(input.id.replace('criterio-', ''));
                const puntuacion = Number(input.value);
                const isEmpty = !input.value || input.value.trim() === '';
                const isOutOfRange = !isEmpty && (puntuacion < 1 || puntuacion > 10);
                const hasValidDecimals = /^\d+(\.\d{0,1})?$/.test(input.value);
                const isInvalid = isEmpty || isOutOfRange || isNaN(puntuacion) || !hasValidDecimals;

                if (isInvalid) {
                    valid = false;
                    input.error = true;
                    
                    // Guardar la primera ocurrencia de cualquier error
                    if (!firstInvalidField) {
                        firstInvalidField = input;
                        // Establecer el mensaje de error apropiado
                        if (isEmpty) {
                            input.errorText = "Este campo es requerido";
                        } else if (isOutOfRange) {
                            input.errorText = "La calificación debe estar entre 1.0 y 10.0";
                        } else if (!hasValidDecimals) {
                            input.errorText = "Solo se permite un decimal";
                        }
                    }
                    return;
                }
                input.error = false;
                input.errorText = "";

                evaluaciones.push({ criterio_id: criterioId, puntuacion });
                const criterio = criteriosData.criterios.find(c => c.criterio_id === criterioId);
                if (criterio) {
                    totalPuntuacion += (puntuacion * criterio.porcentaje / 100);
                }
            });

            if (!valid || evaluaciones.length === 0) {
                if (firstInvalidField) {
                    firstInvalidField.focus();
                    firstInvalidField.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    // Mostrar mensaje de error al usuario
                    const errorMessage = firstInvalidField.errorText || "Por favor, revise este campo";
                    firstInvalidField.supporting = errorMessage;
                }
                return;
            }

            totalPuntuacion = totalPuntuacion > 10 ? 10 : totalPuntuacion;

            fetch('/guardar-evaluacion', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ evaluaciones, totalPuntuacion })
            })
                .then(response => response.json())
                .then(data => {
                    console.log('Respuesta /guardar-evaluacion:', data);
                    if (data.redirect) {
                        window.location.href = data.redirect;
                    }
                });
        });
}

function limpiarSeleccion() {
    fetch('/limpiar-sesion', {
        method: 'POST'
    })
        .then(response => response.json())
        .then(data => {
            console.log('Sesión limpiada:', data);
            window.location.href = '/html/seleccion2.html';
        });
}
