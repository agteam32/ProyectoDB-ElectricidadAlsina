CREATE SCHEMA alsina;
USE alsina;

create TABLE tipo_de_pago(
	id INT, 
    valor VARCHAR(20),
     activo BIT
    
);

CREATE TABLE tipo_de_pago(
	id INT, 
	valor varchar(20),
    activo bit
 
);

CREATE TABLE ventas(
	id INT, 
    fecha_venta DATE,
    id_vendedor INT,
    total_venta FLOAT
);
CREATE TABLE mediospago(
	id INT, 
    efectivo VARCHAR(20),
    tarjeta VARCHAR(20),
    cheque VARCHAR(20)
);


CREATE TABLE vendedores(
	id INT, 
    nombre VARCHAR(45),
    apellido VARCHAR(45),
    email VARCHAR(45),
    dni VARCHAR(45)
);

CREATE TABLE pedido(
	id INT, 
    fecha DATE,
    id_cliente INT,
	country VARCHAR(45),
    pagado BOOLEAN
);
CREATE TABLE detallepedido(
	id INT, 
    precio FLOAT,
    cantidad INT,
	id_articulo INT,
    id_pedido INT
);
CREATE TABLE articulos(
	id INT, 
    nombre VARCHAR(45),
    codigo VARCHAR(100),
	precio_unitario FLOAT,
    id_proveedor INT
);
CREATE TABLE proveedores(
	id INT, 
    nombre VARCHAR(45),
    codigo VARCHAR(100),
	fecha_alta_proveedor DATE
);