/*
	operadores aritmeticos: + - * /
    
    operadores relacionales: >  <   >=   <=  =  !=  <>
    
    operadores logicos: and   or  not
*/

select 3 * 4;-- 12

-- filtro de registros (clausula WHERE)
select * from titles;

-- listar todos los titulos cuyo precio
-- sea mayor o igual a 10 U$s.
select * from titles where price >= 10;

-- listar todos los titulos cuyo precio
-- este entre  10 y 20 U$s.
select * from titles where price >= 10 and price <= 20;

-- alternativa
-- operador de rango between. Incluye extremos
select * from titles where price between 10 and 20;

-- listar todos los titulos cuyo precio
-- NO este entre  10 y 20 U$s.
-- not between NO Incluye extremos
select * from titles where price not between 10 and 20;

-- listar nombre y apellido de los empleados 
-- que trabajan 60, 80 o 100 horas al mes
select 	concat(fname,' ',lname) as empleado ,
		job_lvl as 'horas trabajadas por mes'
from 	employee
where	job_lvl = 60 or job_lvl = 80 or job_lvl = 100;

-- alternativa 
-- operador de lista IN
select 	*
from 	employee
where	job_lvl in (60, 80, 100);

-- la negacion
-- -- listar los empleados 
-- que NO trabajen ni 80 ni 100 horas al mes
select 	*
from 	employee
where	job_lvl not in (80, 100);

-- listar los empleados cuya terminacion de apellido sea ez
-- operador de similitud LIKE
-- % significa comodin de cualquier cantidad de caracteres
select	*
from	employee
-- where	lname like '%ez';
where	lname not like '%ez';-- negacion

-- listar los empleados cuyo nombre empiece con m
select	*
from	employee
where	fname like 'm%';

-- listar los empleados cuyo nombre empiece con m,
-- el 2do caracter sea cualquiera, el 3er caracter
-- sea r y que siga de cualquier manera.
-- el guion bajo (_) es comodin de 1 solo caracter
select	*
from	employee
where	fname like 'm_r%';

-- ordenamiento
-- listar el precio de los libros ordenados
-- clausula order by (ordenado por)
select		* 
from 		titles 
-- order by 	price desc;-- de mayor a menor
-- order by 	price asc;-- de menor a mayor 
order by 	price;-- por defecto es ascendente

-- listar los empleados ordenados alfabeticamente 
-- por apellido
select		*
from		employee
order by	lname;-- por defecto ascendente = alfabetico

-- listar los libros ordenados por precio descendente.
-- En caso de igualdad de precio, desempata por fecha de
-- publicacion del mas antiguo al mas reciente
select		*
from		titles
order by	price desc, pubdate asc;
























