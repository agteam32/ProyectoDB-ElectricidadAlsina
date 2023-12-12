

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
 

 SELECT Nombre,precio_unitario, A_por_rango_precio(precio_unitario) as Rango_de_precio
 FROM  articulos 
 
 
 