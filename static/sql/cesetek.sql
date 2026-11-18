-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2026 a las 19:58:29
-- Versión del servidor: 8.0.45
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cesetek`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contiene`
--

CREATE TABLE `contiene` (
  `id_contiene` int NOT NULL,
  `id_pedido` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL,
  `fecha` datetime NOT NULL,
  `estatus` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `total` float NOT NULL,
  `id_usuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `id_usuario` int NOT NULL,
  `nombre` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `categoria` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `existencias` int NOT NULL,
  `imagen` varchar(20) COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `realiza`
--

CREATE TABLE `realiza` (
  `id_realiza` int NOT NULL,
  `id_usuario` int NOT NULL,
  `perfil` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `id_pedido` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requiere`
--

CREATE TABLE `requiere` (
  `id_requiere` int NOT NULL,
  `id_pedido` int NOT NULL,
  `id_servicio` int NOT NULL,
  `id_usuario` int NOT NULL,
  `perfil` varchar(20) COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_pedido` int NOT NULL,
  `tipo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `especificaciones` text COLLATE utf8mb3_spanish_ci NOT NULL,
  `estatus` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `imagen` varchar(20) COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `id_usuario`, `id_pedido`, `tipo`, `especificaciones`, `estatus`, `imagen`) VALUES
(1, 9, 17, 'InstalaciÃ³n de cÃ¡maras CCTV', 'InstalaciÃ³n de 4 cÃ¡maras bala exteriores 1080p con visiÃ³n nocturna y DVR', 'Completado', 'Cam_CCTV_Bala_01.jpg'),
(2, 10, 20, 'InstalaciÃ³n de cÃ¡maras CCTV', 'InstalaciÃ³n de 8 cÃ¡maras IP 4MP con grabador NVR de 16 canales y disco de 4 TB', 'Completado', 'Cam_CCTV_IP_02.jpg'),
(3, 9, 16, 'Soporte tÃ©cnico', 'ActualizaciÃ³n de firmware y respaldo de configuraciÃ³n en equipos de red', 'Completado', 'Sop_Firmware_03.jpg'),
(4, 4, 1, 'Redes y cableado', 'ConfiguraciÃ³n de red WiFi empresarial con 3 puntos de acceso y switch PoE', 'Completado', 'Red_WiFi_04.jpg'),
(5, 2, 15, 'InstalaciÃ³n de cÃ¡maras CCTV', 'InstalaciÃ³n de 4 cÃ¡maras bala exteriores 1080p con visiÃ³n nocturna y DVR', 'Pendiente', 'Cam_CCTV_Bala_05.jpg'),
(6, 6, 7, 'Mantenimiento preventivo', 'Mantenimiento de barrera vehicular, lubricaciÃ³n y calibraciÃ³n de motor', 'En proceso', 'Mant_Barrera_06.jpg'),
(7, 7, 17, 'Control de acceso', 'InstalaciÃ³n de torniquete bidireccional con lector de tarjetas de proximidad', 'Completado', 'Torniquete_07.jpg'),
(8, 2, 18, 'Mantenimiento preventivo', 'Mantenimiento de barrera vehicular, lubricaciÃ³n y calibraciÃ³n de motor', 'Completado', 'Mant_Barrera_08.jpg'),
(9, 3, 19, 'Control de acceso', 'InstalaciÃ³n de torniquete bidireccional con lector de tarjetas de proximidad', 'En proceso', 'Torniquete_09.jpg'),
(10, 6, 12, 'Soporte tÃ©cnico', 'ActualizaciÃ³n de firmware y respaldo de configuraciÃ³n en equipos de red', 'Completado', 'Sop_Firmware_10.jpg'),
(11, 10, 18, 'InstalaciÃ³n de cÃ¡maras CCTV', 'InstalaciÃ³n de 4 cÃ¡maras bala exteriores 1080p con visiÃ³n nocturna y DVR', 'Completado', 'Cam_CCTV_Bala_11.jpg'),
(12, 9, 20, 'InstalaciÃ³n de cÃ¡maras CCTV', 'InstalaciÃ³n de 4 cÃ¡maras bala exteriores 1080p con visiÃ³n nocturna y DVR', 'Cancelado', 'Cam_CCTV_Bala_12.jpg'),
(13, 5, 14, 'Alarma y detecciÃ³n', 'InstalaciÃ³n de cerco elÃ©ctrico perimetral de 40 metros con energizador', 'Completado', 'Cerco_Elec_13.jpg'),
(14, 9, 1, 'Alarma y detecciÃ³n', 'InstalaciÃ³n de cerco elÃ©ctrico perimetral de 40 metros con energizador', 'Completado', 'Cerco_Elec_14.jpg'),
(15, 1, 17, 'Soporte tÃ©cnico', 'DiagnÃ³stico y reparaciÃ³n de falla en grabador de video, sin seÃ±al en canales 3 y 5', 'Cancelado', 'Sop_Grabador_15.jpg'),
(16, 10, 14, 'InstalaciÃ³n de cÃ¡maras CCTV', 'InstalaciÃ³n de cÃ¡mara PTZ con zoom Ã³ptico 30x en estacionamiento', 'Completado', 'Cam_PTZ_16.jpg'),
(17, 2, 15, 'Alarma y detecciÃ³n', 'InstalaciÃ³n de panel de alarma con 8 sensores de movimiento y sirena exterior', 'Completado', 'Alarma_Panel_17.jpg'),
(18, 5, 18, 'Mantenimiento preventivo', 'RevisiÃ³n y mantenimiento de sistema de alarma y baterÃ­as de respaldo', 'En proceso', 'Mant_Alarma_18.jpg'),
(19, 9, 16, 'Control de acceso', 'InstalaciÃ³n de videoportero IP con apertura remota desde celular', 'Completado', 'Videoportero_19.jpg'),
(20, 4, 10, 'Alarma y detecciÃ³n', 'InstalaciÃ³n de sensores de humo y detecciÃ³n de incendio en bodega', 'Completado', 'Det_Incendio_20.jpg'),
(21, 3, 20, 'InstalaciÃ³n de cÃ¡maras CCTV', 'InstalaciÃ³n de 8 cÃ¡maras IP 4MP con grabador NVR de 16 canales y disco de 4 TB', 'En revisiÃ³n', 'Cam_CCTV_IP_21.jpg'),
(22, 8, 12, 'Soporte tÃ©cnico', 'ActualizaciÃ³n de firmware y respaldo de configuraciÃ³n en equipos de red', 'En revisiÃ³n', 'Sop_Firmware_22.jpg'),
(23, 8, 15, 'Control de acceso', 'InstalaciÃ³n de videoportero IP con apertura remota desde celular', 'Completado', 'Videoportero_23.jpg'),
(24, 7, 18, 'Soporte tÃ©cnico', 'Reemplazo de fuente de poder y reconfiguraciÃ³n de control de acceso', 'Completado', 'Sop_Fuente_24.jpg'),
(25, 6, 15, 'InstalaciÃ³n de cÃ¡maras CCTV', 'InstalaciÃ³n de 4 cÃ¡maras bala exteriores 1080p con visiÃ³n nocturna y DVR', 'En revisiÃ³n', 'Cam_CCTV_Bala_25.jpg'),
(26, 9, 9, 'InstalaciÃ³n de cÃ¡maras CCTV', 'InstalaciÃ³n de 4 cÃ¡maras bala exteriores 1080p con visiÃ³n nocturna y DVR', 'Completado', 'Cam_CCTV_Bala_26.jpg'),
(27, 8, 3, 'InstalaciÃ³n de barrera vehicular', 'InstalaciÃ³n de barrera vehicular con lector de tarjetas RFID para estacionamiento', 'Completado', 'Barrera_RFID_27.jpg'),
(28, 2, 7, 'Alarma y detecciÃ³n', 'InstalaciÃ³n de sensores de humo y detecciÃ³n de incendio en bodega', 'Completado', 'Det_Incendio_28.jpg'),
(29, 8, 1, 'Alarma y detecciÃ³n', 'InstalaciÃ³n de panel de alarma con 8 sensores de movimiento y sirena exterior', 'Pendiente', 'Alarma_Panel_29.jpg'),
(30, 9, 3, 'Alarma y detecciÃ³n', 'InstalaciÃ³n de cerco elÃ©ctrico perimetral de 40 metros con energizador', 'Completado', 'Cerco_Elec_30.jpg'),
(31, 2, 20, 'InstalaciÃ³n de barrera vehicular', 'InstalaciÃ³n de barrera de acceso vehicular automÃ¡tica con brazo de 4 metros y control remoto', 'Pendiente', 'Barrera_Veh_31.jpg'),
(32, 6, 5, 'Redes y cableado', 'ConfiguraciÃ³n de red WiFi empresarial con 3 puntos de acceso y switch PoE', 'Pendiente', 'Red_WiFi_32.jpg'),
(33, 10, 16, 'Mantenimiento preventivo', 'RevisiÃ³n y mantenimiento de sistema de alarma y baterÃ­as de respaldo', 'Completado', 'Mant_Alarma_33.jpg'),
(34, 8, 19, 'InstalaciÃ³n de barrera vehicular', 'InstalaciÃ³n de barrera de acceso vehicular automÃ¡tica con brazo de 4 metros y control remoto', 'Pendiente', 'Barrera_Veh_34.jpg'),
(35, 9, 10, 'Redes y cableado', 'InstalaciÃ³n de enlace inalÃ¡mbrico punto a punto de 200 metros', 'Pendiente', 'Enlace_PtP_35.jpg'),
(36, 3, 19, 'Mantenimiento preventivo', 'Mantenimiento preventivo de sistema CCTV, limpieza de cÃ¡maras y revisiÃ³n de grabador', 'En proceso', 'Mant_CCTV_36.jpg'),
(37, 3, 17, 'Alarma y detecciÃ³n', 'InstalaciÃ³n de sensores de humo y detecciÃ³n de incendio en bodega', 'Completado', 'Det_Incendio_37.jpg'),
(38, 2, 13, 'Alarma y detecciÃ³n', 'InstalaciÃ³n de panel de alarma con 8 sensores de movimiento y sirena exterior', 'Cancelado', 'Alarma_Panel_38.jpg'),
(39, 6, 1, 'InstalaciÃ³n de cÃ¡maras CCTV', 'InstalaciÃ³n de 4 cÃ¡maras bala exteriores 1080p con visiÃ³n nocturna y DVR', 'Pendiente', 'Cam_CCTV_Bala_39.jpg'),
(40, 5, 15, 'Alarma y detecciÃ³n', 'InstalaciÃ³n de sensores de humo y detecciÃ³n de incendio en bodega', 'En proceso', 'Det_Incendio_40.jpg'),
(41, 8, 19, 'InstalaciÃ³n de cÃ¡maras CCTV', 'InstalaciÃ³n de 4 cÃ¡maras bala exteriores 1080p con visiÃ³n nocturna y DVR', 'Completado', 'Cam_CCTV_Bala_41.jpg'),
(42, 10, 17, 'InstalaciÃ³n de barrera vehicular', 'InstalaciÃ³n de barrera de acceso vehicular automÃ¡tica con brazo de 4 metros y control remoto', 'En proceso', 'Barrera_Veh_42.jpg'),
(43, 8, 20, 'Redes y cableado', 'ConfiguraciÃ³n de red WiFi empresarial con 3 puntos de acceso y switch PoE', 'En proceso', 'Red_WiFi_43.jpg'),
(44, 9, 13, 'Mantenimiento preventivo', 'Mantenimiento preventivo de sistema CCTV, limpieza de cÃ¡maras y revisiÃ³n de grabador', 'Pendiente', 'Mant_CCTV_44.jpg'),
(45, 1, 18, 'Mantenimiento preventivo', 'Mantenimiento preventivo de sistema CCTV, limpieza de cÃ¡maras y revisiÃ³n de grabador', 'En revisiÃ³n', 'Mant_CCTV_45.jpg'),
(46, 4, 16, 'InstalaciÃ³n de cÃ¡maras CCTV', 'InstalaciÃ³n de 4 cÃ¡maras bala exteriores 1080p con visiÃ³n nocturna y DVR', 'Completado', 'Cam_CCTV_Bala_46.jpg'),
(47, 9, 7, 'InstalaciÃ³n de cÃ¡maras CCTV', 'InstalaciÃ³n de 8 cÃ¡maras IP 4MP con grabador NVR de 16 canales y disco de 4 TB', 'Completado', 'Cam_CCTV_IP_47.jpg'),
(48, 3, 6, 'Redes y cableado', 'Cableado estructurado categorÃ­a 6 con 12 nodos y rack de comunicaciones', 'En proceso', 'Cableado_C6_48.jpg'),
(49, 7, 3, 'Alarma y detecciÃ³n', 'InstalaciÃ³n de cerco elÃ©ctrico perimetral de 40 metros con energizador', 'En proceso', 'Cerco_Elec_49.jpg'),
(50, 3, 9, 'InstalaciÃ³n de barrera vehicular', 'InstalaciÃ³n de barrera vehicular con lector de tarjetas RFID para estacionamiento', 'Completado', 'Barrera_RFID_50.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb3_spanish_ci NOT NULL,
  `correo` varchar(150) COLLATE utf8mb3_spanish_ci NOT NULL,
  `clave` varchar(200) COLLATE utf8mb3_spanish_ci NOT NULL,
  `perfil` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT 'U'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `correo`, `clave`, `perfil`) VALUES
(1, 'Omar Anthony Rodriguez Fregoso', 'omar.rodriguez3528@alumnos.udg.mx', 'scrypt:32768:8:1$30YWgS8InH5e5UpN$0c104c2f9b7ffec7e7adcfea09ad68209b7a0751974db4a5b32a4515c73019838063dae679d40879a48fe831fc9b66d2a46b7469190b48bd8b097a621e09c62c', 'A'),
(2, 'ponyo1', 'rodp@gmail.com', 'scrypt:32768:8:1$fkSEKB1ypoH5ntFJ$078a4cb0885b3fd0ab90034a8c1e4b8af030c07f42122e807eee3b3cee614a29c9d8c9d630e43bf51a44ae6c4b9cd6f536a9f002d547f1f38d2bdba942cfa246', 'U');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contiene`
--
ALTER TABLE `contiene`
  ADD PRIMARY KEY (`id_contiene`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `realiza`
--
ALTER TABLE `realiza`
  ADD PRIMARY KEY (`id_realiza`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `requiere`
--
ALTER TABLE `requiere`
  ADD PRIMARY KEY (`id_requiere`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contiene`
--
ALTER TABLE `contiene`
  MODIFY `id_contiene` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `realiza`
--
ALTER TABLE `realiza`
  MODIFY `id_realiza` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `requiere`
--
ALTER TABLE `requiere`
  MODIFY `id_requiere` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contiene`
--
ALTER TABLE `contiene`
  ADD CONSTRAINT `contiene_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `realiza` (`id_pedido`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `contiene` (`id_producto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `realiza`
--
ALTER TABLE `realiza`
  ADD CONSTRAINT `realiza_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `requiere`
--
ALTER TABLE `requiere`
  ADD CONSTRAINT `requiere_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `requiere_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
