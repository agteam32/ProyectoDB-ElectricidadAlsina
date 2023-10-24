
#Script db electricidad alsina#
#Tabla Estado#
INSERT INTO estado( valor,activo) VALUES
('Rechazado',1),
('EnProceso',1),
('Pagado',1);
##Select * from estado;

#tabla tipo de pago#
INSERT INTO tipo_de_pago( valor,activo) VALUES
('Efectivo',1),
('Tarjeta',1),
('Cheque',1);
##select * from tipo_de_pago;

#tabla vendedores#
INSERT INTO vendedores( nombre, apellido, email,dni) VALUES
( 'Alberto', 'Nuñez','alberti@gmail.com','20255698'),
( 'Rodrigo', 'Forclaz','rodrigo@gmail.com','30564897'),
( 'Maria', 'Paz','maria@gmail.com','45789654'),
('Florencia', 'Arletaz','florencia@gmail.com','45789456'),
('Carla', 'Ramos','carla@gmail.com','31456789');
##select * from vendedores;

#tabla probedores#
INSERT INTO proveedores( nombre, codigo,fecha_alta_proveedor) VALUES
( 'Alic', '2020ALI1289','2020-02-10'),
( 'Cambre', '2020CAM5897','2020-02-10'),
( 'Abb', '2020ABB4578','2020-02-10'),
('Cpi', '2020CPI5687','2020-02-10'),
('Samet', '2020SAM1245','2020-02-10');
##select * from proveedores;


