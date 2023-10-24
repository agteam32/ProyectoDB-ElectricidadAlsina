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

#VIEW  TODOS LOS ARTICULOS  POR PROVEEDOR#
SELECT * FROM articulos;
SELECT * FROM proveedores;

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