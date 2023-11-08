#VISTAS#

#VENTAS POR VENDEDOR TOTAL#
SELECT * FROM vendedores;
SELECT * FROM ventas;
#VENTAS POR VENDEDOR TOTAL#
CREATE VIEW Ventas_por_Vendedor  AS
(SELECT nombre, apellido,v.id,v.fecha_venta,v.total_venta
FROM vendedores ve
JOIN ventas v
ON ve.id= v.id_vendedor);
SELECT * FROM Ventas_por_Vendedor ;

#VIEW CLIENTES ACTIVOS#
SELECT * FROM cliente;

CREATE VIEW clientes_activos AS
(SELECT nombre,apellido,activo
FROM cliente
WHERE activo=1);
SELECT * FROM clientes_activos;

#WIEW TODOS LOS ARTICULOS SEPARADOS POR PROVEEDORES#
CREATE VIEW articulos_provedores AS
(SELECT a.nombre,a.precio_compra,p.nombre as proveedor
FROM articulos a
JOIN proveedores p
ON a.id= p.id);
SELECT * FROM articulos_provedores;
#VIEW  TODOS LOS ARTICULOS  QUE CONTENGAN CAJA EN LA DESCRIPCION#
CREATE VIEW articulos_que_contenga_caja AS
(SELECT  nombre, codigo,precio_compra 
FROM articulos 
WHERE nombre like '%CAJA%');

SELECT * FROM articulos_que_contenga_caja;
#VIEW  TODAS LAS VENTAS POR CLIENTE Y TOTALIZADAS#
SELECT * FROM ventas;
SELECT * FROM cliente;

CREATE VIEW  ventas_por_Cliente AS
(SELECT  c.nombre, c.apellido,v.total_venta
FROM cliente c
JOIN ventas v
ON c.id = v.id_cliente
GROUP BY c.nombre, c.apellido,v.total_venta
ORDER BY total_venta);
select * from ventas_por_cliente;


#FUNCIONES#
#Funcion para sacar el precio de venta de un producto#
DELIMITER $$
CREATE FUNCTION `calcular_precio_de_venta` (costo_producto INT, margen float) RETURNS float
    NO SQL
BEGIN
	DECLARE resultado FLOAT;
    DECLARE pv int;
    SET pv = 1;
	SET resultado = costo_producto / (pv-margen);
    RETURN resultado;
END
$$

SELECT calcular_precio_de_venta(50,0.30) AS Precio_de_venta;


select *  from articulos;

#Funcion que nos permite descrimiar por rango de precios de los articulos#
delimiter //
create function A_por_rango_precio(
   precio_unitario float)
   returns varchar(30)
   deterministic
begin
	case 
    when precio_unitario<3000 then
      return 'producto precio bajo';
    when precio_unitario>=3000 and precio_unitario<5000 then
      return 'Producto precio medio';
    when precio_unitario>=5000 then
      return 'Producto precio alto';
	end case; 
 end //
 delimiter ;
 
 #SP#
 #Sp que nos sirve para visualizar las ventas por un determindado monto que debo ingresar por parametro#
DELIMITER $$
CREATE PROCEDURE `Sp_ventas` (
IN v_ventas int (255))
BEGIN
   select fecha_venta,id_vendedor,total_venta,id_cliente
     from ventas
     where total_venta>= v_ventas;
END
$$

call sp_ventas (15000);

#Sp que trae todo los clientes que esten activos#
delimiter //
create procedure sp_cliente_activo()
begin
   select nombre,apellido,dni
     from cliente
   where activo=1;
end //
delimiter ;
Call sp_cliente_activo;

#TRIGGERS#
#se crea esta nueva tabla para guardar los logs de la tabla cliente#

CREATE TABLE `acciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `accion` VARCHAR(45) NULL,
  `fecha` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));
  
  #se crea este triggers para cuando en la tabla cliente se registra uno nuevo registro, este mismo inserte un log con la fecha  y hora del regisrto insertado#
delimiter //
create trigger tr_log_tabla_cliente after insert on cliente
for each row 
begin
  insert into acciones(accion) value ('Se creo un registro en cliente');
end//
delimiter ;

#trigger nos da un log de cada insert que haya en la tabla vendedores#
delimiter //  
CREATE TRIGGER tr_alerta_nuevo_vendedor
BEFORE INSERT
 ON vendedores
FOR EACH ROW 
BEGIN 
INSERT INTO ACCIONES (accion) VALUE ('se creo un registro en vendedores');
  END//
  delimiter ;

INSERT INTO `alsina`.`vendedores` (id,`nombre`, `apellido`, `email`, `dni`)
 VALUES (NULL,'Lorena', 'Perez', 'Perez@hotmail.com', '40895977');
 
   SELECT * FROM VENDEDORES;
  select * from acciones;
