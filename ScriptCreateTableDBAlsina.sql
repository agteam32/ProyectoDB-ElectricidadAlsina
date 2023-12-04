CREATE SCHEMA Alsina;
USE alsina;
CREATE TABLE `vendedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dni` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `cliente` (
  `id` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `activo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

CREATE TABLE `tipo_de_pago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valor` varchar(20) DEFAULT NULL,
  `activo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `fecha_alta_proveedor` date DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `estado` (
  `id` int NOT NULL,
  `valor` varchar(20) DEFAULT NULL,
  `activo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;


CREATE TABLE `articulos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `precio_unitario` float DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`)
) ;




CREATE TABLE `fichacliente` (
  `id` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `primera_compra` date DEFAULT NULL,
  `ultima_compra` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `fichacliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
);

CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_venta` date DEFAULT NULL,
  `id_vendedor` int DEFAULT NULL,
  `total_venta` float DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `id_tipo_pago` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_vendedor` (`id_vendedor`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_estado` (`id_estado`),
  KEY `id_tipo_pago` (`id_tipo_pago`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id`),
  CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `ventas_ibfk_4` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`),
  CONSTRAINT `ventas_ibfk_5` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_de_pago` (`id`)
) ;


CREATE TABLE `pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `id_venta` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_venta` (`id_venta`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`)
);



CREATE TABLE `detallepedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `id_articulo` int DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id`)
) ;




