SELECT * FROM ventas
;
#1-Mostrar Las ventas de un mes Especifico#
Select  fecha_venta as Fecha,total_venta as Total from ventas
where fecha_venta BETWEEN '2021-05-01'and '2021-05-31'
order by  fecha_venta asc;
#2-Agrupar las ventas por dia y sumarlas#
Select fecha_venta ,sum(total_venta)  as Total from ventas
where fecha_venta BETWEEN '2021-05-01'and '2021-05-31'
group by fecha_venta with rollup;
#3-Promedio de ventas de un mes espcifico #
Select avg(total_venta) as promedio_venta from ventas
where fecha_venta BETWEEN '2021-05-01'and '2021-05-31';

select * from vendedores;

#4 Ventas discriminadas por vendedor#
Select u.fecha_venta as fecha , u.total_venta as total, v.nombre as Nombre_Vendedor,v.apellido as Apellido_Vendedor
from ventas u
 left join vendedores v
on u.id_vendedor = v.id
where fecha_venta 
BETWEEN '2021-05-01'and '2021-05-31'
order by nombre asc;

#5conteo de las ventas de un mes y agrupado por vendedor#
select vendedores, count(*) as VentasMes
from
(Select  v.nombre as Vendedores,u.total_venta 
from ventas u
 left  join vendedores v
on u.id_vendedor = v.id
where month (u.fecha_venta)=5 and year (u.fecha_venta)='2021') as mytable 
group by vendedores with rollup;




