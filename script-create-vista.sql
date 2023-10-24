use gammers_model;
#vista %webnode.com #
select * from usuarios_mail;
CREATE VIEW Usuarios_mail AS
(SELECT first_name, last_name  apellido  FROM system_user
	WHERE email like '%webnode.com%'
);
select * from game;
select * from play;
#mostrar todos los datos de los juegos que han compleado #


 select * from vista_juegos_completados;
CREATE OR REPLACE VIEW Vista_juegos_completados AS
(SELECT g.name,p.id_game,p.completed
FROM game g 
join play p
 on g.id_game = p.id_game
	WHERE p.completed= true
);