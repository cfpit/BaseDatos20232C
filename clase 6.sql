-- funciones agrupadas
use pubs;

-- listar la fecha en la q ingreso el 1er empleado
select min(hire_date) from employee;

-- listar el precio del libro mas caro
select max(price) from titles;

-- el promedio de horas trabajadas por mes por todos 
-- los empleados
select	avg(job_lvl) from employee;

select	round(avg(job_lvl), 2) from employee;-- 86.37
select	truncate(avg(job_lvl), 2) from employee;-- 86.37

select round(1.23678, 2) from dual;-- 1.24
select truncate(1.23678, 2) from dual;-- 1.23

-- listar el precio total de todos los titulos
select sum(price) as total from titles;

-- listar la cantidad de empleados que ingresaron entre
-- 1990 y 1994
select 	count(emp_id) 'cantidad de empleados'
from	employee
where	year(hire_date) between 1990 and 1994;-- 35

-- en una sola query reuno todas las funciones agrupadas
select	max(price) 'libro mas caro',
		min(price) 'libro mas barato',
		avg(price) promedio,
		sum(price) total,
		count(title_id) cantidad
from	titles;

-- Agrupaciones
-- listar la cantidad de titulos agrupados por categoria

select version();-- 10.4.21-MariaDB


select		type categoria,
			count(title_id) 'cantidad de titulos'
from		titles
group by	type;

/*
				2
business 		4
mod_cook 		2
popular_comp 	3
psychology 		5
trad_cook 		3

*/




-- listar la cantidad de titulos agrupados por categoria
-- que no sean de cocina
select		type categoria,
			count(title_id) 'cantidad de titulos'
from		titles
where		type not like '%cook%'
group by	type;

/*
				2
business 		4
popular_comp 	3
psychology 		5
*/

-- listar la cantidad de titulos agrupados por categoria
-- que no sean de cocina. Informar solo aquellas categorias
-- cuya cantidad de titulos pertenecientes sea mayor que 2.
-- Ordenar por cantidad en forma descendente. De todo lo anterior,
-- mostrar solo los 2 primeros registros.
select		type categoria,
			count(title_id) 'cantidad de titulos'
from		titles
where		type not like '%cook%'
group by	type
having		count(title_id) > 2
order by	2 desc
limit		2;

/*
psychology 		5
business 		4
*/














