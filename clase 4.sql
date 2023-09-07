-- ordenamiento
use pubs;

-- listar los libros ordenados por precio descendente. 
-- En caso de igualdad de precio, desempata la fecha de 
-- publicacion
select		*
from		titles
-- order by	price desc, pubdate;
order by	5 desc, 10;-- sigue el orden de los campos en la tabla

describe titles;-- veo la estructura de la tabla


-- listar el nombre, el precio y la categoria de los libros 
-- que no sean de cocina. Ordenar por precio descendente. En caso 
-- de igualdad de precio, desempata la categoria en forma alfabetica.
select		title as libro,
			price precio,
            type categoria
from		titles
where		type not like '%cook%'
-- order by	price desc, type;
-- order by	2 desc, 3;
order by	precio desc, categoria;

-- Del ultimo resultset, listar los 5 primeros registros
select		title as libro,
			price precio,
            type categoria
from		titles
where		type not like '%cook%'
-- order by	price desc, type;
-- order by	2 desc, 3;
order by	precio desc, categoria
limit		5;

-- listar desde el 3er titulo hasta el 8vo titulo
select 	*
from	titles
limit	2 , 6;

-- Clausula distinct
-- lista los diferentes valores(sin repeticiones) de un campo.
select type categoria from titles;

select distinct type categoria from titles;
select distinct (type) categoria from titles;


-- Operador de nulidad IS NULL
-- Listar los libros cuyo precio no esten definidos
select * from titles where price is null;

-- Listar los libros cuyo precio si esten definidos
select * from titles where price is not null;

-- reemplazar precios nulos por cero y notas nulas por
-- "sin comentarios"
select 	title libro,
		price precio,
        notes as notas,
        ifnull(price,0) 'precio sin nulos',
        ifnull(notes,'sin comentarios') 'notas sin nulos'
from 	titles;

-- operador de similitud RLIKE
-- listar el nombre de los empleados q empiece con m
select	* from employee where fname like 'm%';
select	* from employee where fname rlike '^m';
-- ^ : acento circunflejo o frances


-- listar el nombre de los empleados q NO empiece con m
select	* from employee where fname not like 'm%';
select	* from employee where fname not rlike '^m';
select	* from employee where fname rlike '^[^m]';

-- listar el nombre de los empleados q empiece con a o p
select	* from employee where fname rlike '^[a,p]';

-- listar el nombre de los empleados q empiece desde la a 
-- hasta la j
select	* from employee where fname rlike '^[a-j]';

-- listar el apellido de los empleados q termine con z
select	* from employee where lname rlike 'z$';

-- listar los empleados cuyo nombre empiece con m,
-- el 2do caracter sea cualquiera, el 3er caracter
-- sea r y que siga de cualquier manera.
-- el guion bajo (_) es comodin de 1 solo caracter
select	*
from	employee
where	fname like 'm_r%';

select	*
from	employee
where	fname rlike '^m.r.*$';

-- el . del rlike es igual al _ del like
-- el .* del rlike es igual al % del like

-- listar los empleados q ingresaron en 1990
select	* from employee where year(hire_date) = 1990;

-- listar los empleados q ingresaron entre 1990 y 1992
select	* 
from 	employee 
where 	year(hire_date) between 1990 and 1992;

-- listar los empleados q ingresaron en 1990 y 1994
select	* 
from 	employee 
where 	year(hire_date) in (1990, 1994);

-- listar los empleados q ingresaron en el 2do semestre  de 1994
select	* 
from 	employee 
where 	year(hire_date) = 1994 and month(hire_date) between 7 and 12;























