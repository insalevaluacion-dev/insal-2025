-- CREATE DATABASE INSAL_DB;
-- USE INSAL_DB;

CREATE TABLE IF NOT EXISTS `niveles` (
  `nivel_id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`nivel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;insert into `niveles` (`descripcion`, `nivel_id`, `nombre`) values ('Criterios para evaluación de Expo de Logros', 1, '1');
insert into `niveles` (`descripcion`, `nivel_id`, `nombre`) values ('Criterios para evaluación de Expotecnia para primeros años', 2, '2');
insert into `niveles` (`descripcion`, `nivel_id`, `nombre`) values ('Criterios para evaluación de Expotecnia de segundos años', 3, '3');
insert into `niveles` (`descripcion`, `nivel_id`, `nombre`) values ('Criterios de evaluación para Expotecnia de terceros años', 4, '4');

CREATE TABLE IF NOT EXISTS `criterios` (
  `criterio_id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `porcentaje` decimal(10,0) NOT NULL,
  `nivel_id` int unsigned NOT NULL,
  PRIMARY KEY IF NOT EXISTS (`criterio_id`),
  KEY `criterios_niveles_FK` (`nivel_id`),
  CONSTRAINT `criterios_niveles_FK` FOREIGN KEY (`nivel_id`) REFERENCES `niveles` (`nivel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (1, 1,  'Presentación', 'La presentación personal (corte de cabello es el adecuado para la ocasión, su vestuario de manera ordenada, limpia y de acuerdo con el proyecto; se dirige de forma adecuada y respetuosa).', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (2, 1,  'Diseño', 'Defiende su proyecto de forma coherente, creativa e innovadora.', '20');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (3, 1,  'Funcionamiento y aplicación', 'El trabajo presentado está de acuerdo con el contenido programático del área de estudio.', '30');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (4, 1,  'Dominio y control', 'En la defensa del proyecto presenta seguridad, fluidez y dominio del contenido.', '30');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (5, 1,  'Imagen y ambientación', 'La imágen del stand está de acuerdo con el tema desarrollado; su ambietación es agradable haciendo buen uso de los recursos.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (6, 2,  'Presentación', 'La presentación personal (corte de cabello, el peinado es adecuado, usa vestuario de manera ordenada, limpia y de acuerdo al proyecto que se está exponiendo; se dirige de forma educada y respetuosa).', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (7, 2,  'Diseño y contenido', 'La exposición y defensa de la idea de negocio se hace de forma coherente, con creatividad, innovador y lo puede defender.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (8, 2,  'Descripción', 'Explica de manera clara la descripción del negocio: nombre y ubicación del negocio.', '5');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (9, 2,  'Organigrama', 'Explica el organigrama de integrantes del equipo de manera clara y concisa.', '5');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (10, 2, 'Resumen',  'Presenta un resúmen del proyecto: a qué se va a dedicar, cúales son sus productos principales, precio y proveedores.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (11, 2, 'Ventana de oportunidad',  'Explica la ventana de oportunidad en el mercado (demanda insatisfecha) y socios clave del negocio.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (12, 2, 'Objetivo y misión',  'Presenta el objetivo, la misión, visión, valores y principios de su idea de negocio.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (13, 2, 'Funcionamiento y aplicación',  'El proyecto presentado, está enfocado de acuerdo al ámbito de desarrollo de las competencias del bachillerato técnico que estudia: Desarrollan ideas de negocio implementando creatividad, trabajo en equipo y liderazgo.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (14, 2, 'Informe impreso',  'Presenta informe impreso del emprendimiento.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (15, 2, 'Expresión y dominio',  'Presenta seguridad, fluidez y dominio del proyecto, al explicar cada parte del contenido.', '20');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (16, 2, 'Imagen y ambientación',  'La imágen y la ambientación del stand es la apropiada para el proyecto mostrado, haciendo uso correcto de los recursos.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (17, 3, 'Presentación',  'La presentación personal (corte de cabello adecuado, el peinado es adecuado, usa vestuario de manera ordenada, limpia y de acuerdo al proyecto que se está exponiendo; se dirige de forma adecuada y respetuosa).', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (18, 3, 'Diseño y contenido',  'La exposición y defensa de la idea de negocio se hace de forma coherente, con creatividad, innovador y puede defenderlo.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (19, 3, 'Descripción',  'Explica de manera clara la descripción del negocio: identificación del negocio, resúmen del proyecto, socios, actividades claves, objetivo, misión, visión y valores de la empresariales.', '5');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (20, 3, 'Plan de producción',  'Explica el plan de producción: base de proveedores, proceso de compra, proceso de producción, control de calidad.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (21, 3, 'Plan de mercadeo',  'Presenta un resúmen del plan de mercadeo: principales competidores, condiciones del mercado, lista de productos/servicios a ofrecer.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (22, 3, 'Plan de organización',  'Presenta el plan de organización: organización y estructura de la gestión.', '5');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (23, 3, 'Plan financiero',  'Presenta el plan financiero de su negocio: estimación de costos, cálculo del precio de venta y punto de equilibrio.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (24, 3, 'Funcionamiento y aplicación',  'El proyecto presentado está enfocado de acuerdo al ámbito de desarrollo de las competencias del bachillerato técnico que estudia: Desarrollan ideas de negocio implementando creatividad, trabajo en equipo y liderazgo.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (25, 3, 'Informe impreso',  'Presenta informe impreso del emprendimiento.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (26, 3, 'Expresión y dominio',  'Presenta seguridad, fluidez, y dominio del proyecto, al explicar cada parte del contenido.', '20');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (27, 3, 'Imagen y ambientación',  'La imágen y la ambientación del stand es la apropiada para el proyecto mostrado, haciendo uso correcto de los recursos.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (28, 4, 'Presentación',  'La presentación personal (corte de cabello, el peinado es adecuado, usa vestuario de manera ordenada, limpia y de acuedo al proyecto que se está exponiendo; se dirige de forma adecuada y respetuosa).', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (29, 4, 'Diseño y contenido',  'La exposición y defensa de la idea de negocio se hace de forma coherente, con creatividad, innovador y puede defenderlo.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (30, 4, 'Descripción',  'Explica de manera clara la descripción del negocio: identificación del negocio, resúmen del proyecto, socios, actividades claves, objetivo, misión, visión y valores empresariales.', '5');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (31, 4, 'Plan de producción',  'Explica el plan de producción: base de proveedores, proceso de compra, proceso de producción, control de calidad, distribución en planta.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (32, 4, 'Plan de mercadeo',  'Presenta un resúmen del plan de mercadeo: principales competidores, condiciones del mercado, lista de productos/servicios a ofrecer, propuesta de valor del producto, variables de mercado y proceso de venta.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (33, 4, 'Plan de organización',  'Presenta plan de organización: cuadro de los integrantes del equipo, organización y estructura de la gestión.', '5');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (34, 4, 'Plan financiero',  'Presenta el plan financiero de su negocio: Estimación de costos, cálculo de precio de venta y punto de equilibrio, proyección en ventas y plan de inversión.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (35, 4, 'Modelo CANVAS',  'Presenta modelo CANVAS.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (36, 4, 'Funcionamiento y aplicación',  'El proyecto presentado está enfocado de acuerdo al ámbito de desarrollo de las competencias del bachillerato técnico que estudia: desarrolla ideas de negocio implementando creatividad, trabajo en equipo y liderazgo.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (37, 4, 'Informe impreso',  'Presenta informe impreso del emprendimiento.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (38, 4, 'Expresión y dominio',  'Presenta seguridad, fluidez y dominio del proyecto al explicar cada parte del contenido.', '10');
insert into `criterios` (`criterio_id`, `nivel_id`, `nombre`, `descripcion`, `porcentaje`) values (39, 4, 'Imagen y ambientación',  'La imágen y la ambientación del stand es la apropiada para el proyecto mostrado, haciendo uso correcto de los recursos.', '10');

CREATE TABLE IF NOT EXISTS `grados` (
  `grado_id` int unsigned NOT NULL AUTO_INCREMENT,
  `año` varchar(5) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `seccion` varchar(5) NOT NULL,
  PRIMARY KEY (`grado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('2', 1, 'DS', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('2', 2, 'AC', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('2', 3, 'LyA', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('1', 4, 'APS', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('2', 5, 'SE', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('1', 6, 'G', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('1', 7, 'G', 'B');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('1', 8, 'G', 'C');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('1', 9, 'G', 'D');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('1', 10, 'G', 'E');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('1', 11, 'APS', 'B');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('1', 12, 'SE', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('1', 13, 'LyA', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('1', 14, 'AC', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('1', 15, 'DS', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('1', 16, 'DS', 'B');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('1', 17, 'DG', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('2', 18, 'G', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('2', 19, 'G', 'B');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('2', 20, 'G', 'C');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('2', 21, 'G', 'D');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('2', 22, 'DG', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('2', 23, 'APS', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('2', 24, 'APS', 'B');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('3', 25, 'DS', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('3', 26, 'AC', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('3', 27, 'LyA', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('3', 28, 'APS', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('3', 29, 'APS', 'B');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('3', 30, 'DG', 'A');
insert into `grados` (`año`, `grado_id`, `nombre`, `seccion`) values ('3', 31, 'SE', 'A');

CREATE TABLE IF NOT EXISTS `evaluadores` (
  `evaluador_id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(65) NOT NULL,
  `email` varchar(65) NOT NULL,
  PRIMARY KEY (`evaluador_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `proyectos` (
  `proyecto_id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `grado_id` int unsigned NOT NULL,
  `nota` float DEFAULT NULL,
  `nivel` int NOT NULL,
  `nivel_id` int unsigned NOT NULL,
  PRIMARY KEY (`proyecto_id`),
  KEY `proyectos_grados_FK` (`grado_id`),
  KEY `proyectos_niveles_FK` (`nivel_id`),
  CONSTRAINT `proyectos_grados_FK` FOREIGN KEY (`grado_id`) REFERENCES `grados` (`grado_id`),
  CONSTRAINT `proyectos_niveles_FK` FOREIGN KEY (`nivel_id`) REFERENCES `niveles` (`nivel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `estudiantes` (
  `estudiante_id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(125) NOT NULL,
  `proyecto_id` int unsigned NOT NULL,
  `grado_id` int unsigned NOT NULL,
  `asistencia` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`estudiante_id`),
  KEY `estudiantes_proyectos_FK` (`proyecto_id`),
  KEY `estudiantes_grados_FK` (`grado_id`),
  CONSTRAINT `estudiantes_grados_FK` FOREIGN KEY (`grado_id`) REFERENCES `grados` (`grado_id`),
  CONSTRAINT `estudiantes_proyectos_FK` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`proyecto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `evaluaciones` (
  `evaluacion_id` int unsigned NOT NULL AUTO_INCREMENT,
  `evaluador_id` int unsigned NOT NULL,
  `proyecto_id` int unsigned NOT NULL,
  `fecha_evaluacion` datetime NOT NULL,
  `nota_evaluacion` decimal(4,1) DEFAULT NULL,
  PRIMARY KEY (`evaluacion_id`),
  KEY `evaluaciones_evaluadores_FK` (`evaluador_id`),
  KEY `evaluaciones_proyectos_FK` (`proyecto_id`),
  CONSTRAINT `evaluaciones_evaluadores_FK` FOREIGN KEY (`evaluador_id`) REFERENCES `evaluadores` (`evaluador_id`),
  CONSTRAINT `evaluaciones_proyectos_FK` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`proyecto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `evaluacion_criterios` (
  `id_evaluacion_criterio` int NOT NULL AUTO_INCREMENT,
  `criterio_id` int unsigned NOT NULL,
  `evaluacion_id` int unsigned DEFAULT NULL,
  `puntuacion` decimal(4,1) NOT NULL,
  PRIMARY KEY (`id_evaluacion_criterio`),
  KEY `evaluacion_criterios_criterios_FK` (`criterio_id`),
  KEY `evaluacion_criterios_evaluaciones_FK` (`evaluacion_id`),
  CONSTRAINT `evaluacion_criterios_criterios_FK` FOREIGN KEY (`criterio_id`) REFERENCES `criterios` (`criterio_id`),
  CONSTRAINT `evaluacion_criterios_evaluaciones_FK` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluaciones` (`evaluacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
