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


#Sp para insertar nuevos clientes a la hora de realizar una compra sin ser clientes de la empresa#
DELIMITER //
CREATE PROCEDURE sp_add_CLIENTE(IN CLIENTE_NOMBRE VARCHAR(45), IN CLIENTE_APELLIDO VARCHAR(45), CLIENTE_EMAIL VARCHAR(45), CLIENTE_DNI VARCHAR(45),ID_VENDEDOR INT,FECHA_VENTA DATE,TOTAL_VENTA FLOAT,ID_ESTADO INT, ID_TIPO_PAGO INT)
BEGIN
    DECLARE CLIENTE INT DEFAULT 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION, NOT FOUND, SQLWARNING    
		BEGIN
			ROLLBACK;
			SELECT 'Error';
		END;

	START TRANSACTION;
		IF NOT EXISTS(SELECT id FROM cliente WHERE NOMBRE = CLIENTE_NOMBRE AND APELLIDO = CLIENTE_APELLIDO AND EMAIL = CLIENTE_EMAIL AND DNI = CLIENTE_DNI) THEN        
        BEGIN
			INSERT INTO CLIENTE (NOMBRE,APELLIDO,EMAIL,DNI) VALUES (CLIENTE_NOMBRE, CLIENTE_APELLIDO,CLIENTE_EMAIL,CLIENTE_DNI);
			SET CLIENTE = LAST_INSERT_ID();
        END;
        ELSE        
			SELECT id INTO CLIENTE FROM cliente WHERE NOMBRE = CLIENTE_NOMBRE AND APELLIDO = CLIENTE_APELLIDO AND EMAIL = CLIENTE_EMAIL AND DNI = CLIENTE_DNI ;        
        END IF;
        
        INSERT INTO VENTAS(FECHA_VENTA,ID_VENDEDOR,TOTAL_VENTA, ID_CLIENTE, ID_ESTADO,ID_TIPO_PAGO)
        VALUES (FECHA_VENTA,ID_VENDEDOR,TOTAL_VENTA,CLIENTE,ID_ESTADO,ID_TIPO_PAGO);

        SELECT 'Congrates!, successfully executed.';
    COMMIT;
END; //

DELIMITER ;

CALL sp_add_CLIENTE('NICOLAS','PERFUMO','PERFU@GMAIL','12369989',8,'2023-01-12',78998,1,2);
select * from cliente;
select * from ventas;
select * from vendedores