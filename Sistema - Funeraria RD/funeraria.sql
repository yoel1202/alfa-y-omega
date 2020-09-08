-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-09-2020 a las 01:49:29
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `funeraria`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Buscar_Difunto` ()  BEGIN
 declare Datos Varchar(60);
	
Select * From Difunto Where Dni like CONCAT(Datos, '%') Or Nombres Like CONCAT(Datos, '%') Or Apellidos Like CONCAT(Datos, '%') Or Nombres+' '+Apellidos Like CONCAT(Datos, '%') Or Apellidos +' '+Nombres Like CONCAT(Datos, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Loguear` (`Usuario` VARCHAR(20), `Clave` VARCHAR(10), `Mensaje` VARCHAR(100))  begin

 	if(not exists(Select * from Usuario where Usuario=@Usuario))then

 	set Mensaje='El usuario Ingresado no Existe';

 	else 

 		

 			if(not exists(Select * from Usuario where Usuario=@Usuario and Clave=@Clave)) then

 			set Mensaje='La clave ingresada es incorrecta';

 			else 

 				

 					if((Select Estado from Personal where Codigo_Personal=(Select Codigo_Personal from Usuario where Usuario=@Usuario))='Inactivo') then

 					set Mensaje='Acceso Denegado, este usuario tiene estado Inactivo';

 						else 

 						

 							Select * from Usuario where Usuario=@Usuario and Clave=Clave ;

 							set Mensaje='Logueado Correctamente';

 						END IF;

 				END IF;

 		END IF;

 end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Verificar_Existe_Parentesco` ()  BEGIN
 declare Codigo_Difunto Int ;

 		Select COUNT(Codigo_Difunto) From Parentesco WHere Codigo_Difunto=Codigo_Difunto;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Codigo_Cliente` int(11) NOT NULL,
  `Tipo_Persona` varchar(15) NOT NULL,
  `Tipo_Documento` char(6) NOT NULL,
  `Documento` varchar(11) NOT NULL,
  `Nombres` varchar(150) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Telefono` varchar(70) NOT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `Codigo_color` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `Codigo_Compras` int(11) NOT NULL,
  `Codigo_Proveedor` int(11) NOT NULL,
  `Fecha_Compra` date NOT NULL,
  `Tipo_Documento` varchar(20) NOT NULL,
  `Serie` char(3) NOT NULL,
  `Nro_Documento` varchar(7) NOT NULL,
  `Total` decimal(19,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `Codigo_Detalle_Compras` int(11) NOT NULL,
  `Codigo_Compras` int(11) NOT NULL,
  `Codigo_Item` int(11) NOT NULL,
  `Precio_Compra` decimal(19,4) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Igv` decimal(19,4) NOT NULL,
  `Sub_Total` decimal(19,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_item`
--

CREATE TABLE `detalle_item` (
  `Codigo_Detalle_Item` int(11) NOT NULL,
  `Codigo_Item` int(11) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Color` varchar(50) NOT NULL,
  `Material` varchar(20) NOT NULL,
  `Stock` int(11) NOT NULL,
  `RutaImagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_plan_funerario`
--

CREATE TABLE `detalle_plan_funerario` (
  `Codigo_Detalle_Plan_Funerario` int(11) NOT NULL,
  `Codigo_Plan_Funerario` int(11) NOT NULL,
  `Codigo_Item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `CodigoDetalleVenta` int(11) NOT NULL,
  `Codigo_Ventas` int(11) NOT NULL,
  `Codigo_Item` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio_Venta` decimal(19,4) NOT NULL,
  `Igv` decimal(19,4) NOT NULL,
  `Dscto` decimal(19,4) DEFAULT 0.0000,
  `Sub_Total` decimal(19,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `difunto`
--

CREATE TABLE `difunto` (
  `Codigo_Difunto` int(11) NOT NULL,
  `Dni` char(8) NOT NULL,
  `Nombres` varchar(60) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Fecha_Fallecimiento` date NOT NULL,
  `Hora` time NOT NULL,
  `Causa_Muerte` varchar(200) DEFAULT NULL,
  `Lugar_Fallecimiento` varchar(100) DEFAULT NULL,
  `Estado_Civil` varchar(15) NOT NULL,
  `Ruta_Acta_Difunto` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_venta`
--

CREATE TABLE `informacion_venta` (
  `Codigo_Informacion_Venta` int(11) NOT NULL,
  `Codigo_Ventas` int(11) NOT NULL,
  `Dirección_Velatorio` varchar(120) NOT NULL,
  `Cementerio` varchar(120) NOT NULL,
  `Dirección_Sepelio` varchar(120) NOT NULL,
  `Fecha_Sepelio` date NOT NULL,
  `Hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

CREATE TABLE `item` (
  `Codigo_Item` int(11) NOT NULL,
  `Codigo_Tipo_Item` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Precio` decimal(19,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE `material` (
  `Codigo_material` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco`
--

CREATE TABLE `parentesco` (
  `Codigo_Parentesco` int(11) NOT NULL,
  `Codigo_Cliente` int(11) NOT NULL,
  `Codigo_Difunto` int(11) NOT NULL,
  `Descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `Codigo_Personal` int(11) NOT NULL,
  `Dni` char(8) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Cargo` varchar(50) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Telefono` varchar(70) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Estado` varchar(100) NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_funerario`
--

CREATE TABLE `plan_funerario` (
  `Codigo_Plan_Funerario` int(11) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Precio` decimal(19,4) NOT NULL,
  `RutaImagen` varchar(100) NOT NULL,
  `Estado` varchar(10) NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Codigo_Proveedor` int(11) NOT NULL,
  `RUC` char(11) NOT NULL,
  `Razon_Social` varchar(200) NOT NULL,
  `Representante` varchar(150) NOT NULL,
  `Celular_Representante` varchar(12) DEFAULT NULL,
  `Telefono_Empresa` varchar(70) DEFAULT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_item`
--

CREATE TABLE `tipo_item` (
  `Codigo_Tipo_Item` int(11) NOT NULL,
  `Descripción` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Codigo_Usuario` int(11) NOT NULL,
  `Codigo_Personal` int(11) NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Clave` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `Codigo_Ventas` int(11) NOT NULL,
  `Codigo_Cliente` int(11) NOT NULL,
  `Codigo_Personal` int(11) NOT NULL,
  `Tipo_Documento` varchar(20) NOT NULL,
  `Serie` char(3) NOT NULL,
  `NroComprobante` char(7) NOT NULL,
  `FechaVenta` date NOT NULL,
  `Total` decimal(19,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Codigo_Cliente`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`Codigo_color`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`Codigo_Compras`),
  ADD KEY `FK__Compras__Codigo___45F365D3` (`Codigo_Proveedor`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`Codigo_Detalle_Compras`),
  ADD KEY `FK__Detalle_C__Codig__49C3F6B7` (`Codigo_Compras`),
  ADD KEY `FK__Detalle_C__Codig__4AB81AF0` (`Codigo_Item`);

--
-- Indices de la tabla `detalle_item`
--
ALTER TABLE `detalle_item`
  ADD PRIMARY KEY (`Codigo_Detalle_Item`),
  ADD KEY `FK__Detalle_I__Codig__29572725` (`Codigo_Item`);

--
-- Indices de la tabla `detalle_plan_funerario`
--
ALTER TABLE `detalle_plan_funerario`
  ADD PRIMARY KEY (`Codigo_Detalle_Plan_Funerario`),
  ADD KEY `FK__Detalle_P__Codig__2F10007B` (`Codigo_Plan_Funerario`),
  ADD KEY `FK__Detalle_P__Codig__300424B4` (`Codigo_Item`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`CodigoDetalleVenta`),
  ADD KEY `FK__Detalle_V__Codig__52593CB8` (`Codigo_Ventas`),
  ADD KEY `FK__Detalle_V__Codig__534D60F1` (`Codigo_Item`);

--
-- Indices de la tabla `difunto`
--
ALTER TABLE `difunto`
  ADD PRIMARY KEY (`Codigo_Difunto`);

--
-- Indices de la tabla `informacion_venta`
--
ALTER TABLE `informacion_venta`
  ADD PRIMARY KEY (`Codigo_Informacion_Venta`),
  ADD UNIQUE KEY `Codigo_Ventas` (`Codigo_Ventas`);

--
-- Indices de la tabla `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`Codigo_Item`),
  ADD KEY `FK__Item__Codigo_Tip__267ABA7A` (`Codigo_Tipo_Item`);

--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`Codigo_material`);

--
-- Indices de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD PRIMARY KEY (`Codigo_Parentesco`),
  ADD UNIQUE KEY `Codigo_Difunto` (`Codigo_Difunto`),
  ADD KEY `FK__Parentesc__Codig__403A8C7D` (`Codigo_Cliente`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`Codigo_Personal`);

--
-- Indices de la tabla `plan_funerario`
--
ALTER TABLE `plan_funerario`
  ADD PRIMARY KEY (`Codigo_Plan_Funerario`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Codigo_Proveedor`);

--
-- Indices de la tabla `tipo_item`
--
ALTER TABLE `tipo_item`
  ADD PRIMARY KEY (`Codigo_Tipo_Item`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Codigo_Usuario`),
  ADD UNIQUE KEY `Codigo_Personal` (`Codigo_Personal`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`Codigo_Ventas`),
  ADD KEY `FK__Ventas__Codigo_C__4D94879B` (`Codigo_Cliente`),
  ADD KEY `FK__Ventas__Codigo_P__4E88ABD4` (`Codigo_Personal`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `FK__Compras__Codigo___45F365D3` FOREIGN KEY (`Codigo_Proveedor`) REFERENCES `proveedor` (`Codigo_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `FK__Detalle_C__Codig__49C3F6B7` FOREIGN KEY (`Codigo_Compras`) REFERENCES `compras` (`Codigo_Compras`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Detalle_C__Codig__4AB81AF0` FOREIGN KEY (`Codigo_Item`) REFERENCES `item` (`Codigo_Item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_item`
--
ALTER TABLE `detalle_item`
  ADD CONSTRAINT `FK__Detalle_I__Codig__29572725` FOREIGN KEY (`Codigo_Item`) REFERENCES `item` (`Codigo_Item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_plan_funerario`
--
ALTER TABLE `detalle_plan_funerario`
  ADD CONSTRAINT `FK__Detalle_P__Codig__2F10007B` FOREIGN KEY (`Codigo_Plan_Funerario`) REFERENCES `plan_funerario` (`Codigo_Plan_Funerario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Detalle_P__Codig__300424B4` FOREIGN KEY (`Codigo_Item`) REFERENCES `item` (`Codigo_Item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `FK__Detalle_V__Codig__52593CB8` FOREIGN KEY (`Codigo_Ventas`) REFERENCES `ventas` (`Codigo_Ventas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Detalle_V__Codig__534D60F1` FOREIGN KEY (`Codigo_Item`) REFERENCES `item` (`Codigo_Item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `informacion_venta`
--
ALTER TABLE `informacion_venta`
  ADD CONSTRAINT `FK__Informaci__Codig__5812160E` FOREIGN KEY (`Codigo_Ventas`) REFERENCES `ventas` (`Codigo_Ventas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK__Item__Codigo_Tip__267ABA7A` FOREIGN KEY (`Codigo_Tipo_Item`) REFERENCES `tipo_item` (`Codigo_Tipo_Item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD CONSTRAINT `FK__Parentesc__Codig__403A8C7D` FOREIGN KEY (`Codigo_Cliente`) REFERENCES `cliente` (`Codigo_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Parentesc__Codig__412EB0B6` FOREIGN KEY (`Codigo_Difunto`) REFERENCES `difunto` (`Codigo_Difunto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK__Usuario__Codigo` FOREIGN KEY (`Codigo_Personal`) REFERENCES `personal` (`Codigo_Personal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `FK__Ventas__Codigo_C__4D94879B` FOREIGN KEY (`Codigo_Cliente`) REFERENCES `cliente` (`Codigo_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Ventas__Codigo_P__4E88ABD4` FOREIGN KEY (`Codigo_Personal`) REFERENCES `personal` (`Codigo_Personal`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
