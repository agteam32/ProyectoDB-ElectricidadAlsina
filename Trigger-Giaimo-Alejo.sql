
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
