-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.25-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para maki
CREATE DATABASE IF NOT EXISTS `maki` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `maki`;

-- Volcando estructura para tabla maki.alumno
CREATE TABLE IF NOT EXISTS `alumno` (
  `id_alumno` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(32) DEFAULT NULL,
  `apellidos` varchar(64) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `hora_registro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_alumno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla maki.alumno: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` (`id_alumno`, `nombre`, `apellidos`, `fecha_nac`, `hora_registro`) VALUES
	(1, 'jose', 'rojas reyes', '1991-08-02', '2017-11-12 21:08:58'),
	(2, 'esmeralda', 'rosas renteria', '2017-11-12', '2017-11-12 21:10:07'),
	(3, 'carla', 'abarca sanchez', '1985-05-30', '2017-11-12 21:10:49'),
	(4, 'luis', 'martinez rios', '1990-12-24', '2017-11-12 21:11:20');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;

-- Volcando estructura para tabla maki.asignatura
CREATE TABLE IF NOT EXISTS `asignatura` (
  `id_asignatura` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `profesor` int(11) NOT NULL,
  PRIMARY KEY (`id_asignatura`),
  KEY `profesor_asignatura` (`profesor`),
  CONSTRAINT `profesor_asignatura` FOREIGN KEY (`profesor`) REFERENCES `profesor` (`id_profesor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla maki.asignatura: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `asignatura` DISABLE KEYS */;
INSERT INTO `asignatura` (`id_asignatura`, `nombre`, `profesor`) VALUES
	(2, 'matematicas', 1),
	(3, 'vectorial', 3),
	(4, 'algoritmos', 4),
	(5, 'base de datos', 2);
/*!40000 ALTER TABLE `asignatura` ENABLE KEYS */;

-- Volcando estructura para tabla maki.matricula
CREATE TABLE IF NOT EXISTS `matricula` (
  `alumno` int(11) NOT NULL,
  `asignatura` int(11) NOT NULL,
  `fecha` year(4) NOT NULL,
  `nota` int(11) DEFAULT NULL,
  PRIMARY KEY (`alumno`,`asignatura`,`fecha`),
  KEY `asignatura_matriculada` (`asignatura`),
  CONSTRAINT `alumno_matriculado` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`id_alumno`),
  CONSTRAINT `asignatura_matriculada` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`id_asignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla maki.matricula: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` (`alumno`, `asignatura`, `fecha`, `nota`) VALUES
	(1, 4, '2016', 7),
	(2, 2, '2015', 8);
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;

-- Volcando estructura para tabla maki.profesor
CREATE TABLE IF NOT EXISTS `profesor` (
  `id_profesor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_profesor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla maki.profesor: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` (`id_profesor`, `nombre`, `apellidos`) VALUES
	(1, 'jaime', 'reyes'),
	(2, 'fabiola', 'botello'),
	(3, 'barranco', 'jimenez'),
	(4, 'varinia', 'aveldaño');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
