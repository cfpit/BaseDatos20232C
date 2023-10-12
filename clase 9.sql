-- Ejercitacion Base Pubs Parte 3
use pubs;
-- 32. Mostrar el nombre del libro y el 	
-- la cual lo publicó sólo de las editoriales que tengan 
-- residencia en USA. Mostrar un apodo para cada columna. 

-- se usa inner join
-- titles y publishers se relacionan por el pub_id
select		t.title libro,
			p.pub_name as editorial
from		titles as t
inner join	publishers p
on			t.pub_id = p.pub_id
where		p.country = 'usa';

-- 34. Mostrar el nombre y apellido del autor y el nombre de 
-- los libros publicados por el mismo. 
-- Mostrar un apodo para cada columna. Ordenar por la primera 
-- columna de la consulta. 
-- inner join
-- autores y libros
select	concat(a.au_fname,' ',a.au_lname) as autor,
		t.title libro
from	authors a
inner join	titleauthor ta on (a.au_id = ta.au_id)
inner join	titles t on (t.title_id = ta.title_id)
order by	1;

-- 35. Mostrar los libros junto a su autor y su editorial. 
-- Se debe mostrar los datos en una unica columna de la 
-- siguiente manera con los siguientes textos literales: 
-- 'El libro XXXXXXXXXXXXX fue escrito por XXXXXXXXXXXXX y 
-- publicado por la editorial XXXXXXXXXXXXX'
select	concat('El libro ', t.title, ' fue escrito por ',a.au_fname,' ',a.au_lname, ' y 
 publicado por la editorial ', p.pub_name) as info
from	authors a
inner join	titleauthor ta on (a.au_id = ta.au_id)
inner join	titles t on (t.title_id = ta.title_id)
inner join	publishers p on (t.pub_id = p.pub_id);

-- 36. Mostrar el nombre de las editoriales que no hayan publicado ningún libro. 
-- outer join
-- tabla ppal: publishers / tabla secundaria: titles
select	p.pub_name editorial
		-- , t.* -- todos los campos de la tabla secundaria
from	publishers p left join titles t
on		p.pub_id = t.pub_id
where	t.title_id is null;-- PK de la tabla secundaria q sea nula

-- 38. Mostrar el nombre y apellido de los empleados y la descripción del 
-- trabajo que realiza. Basar la relación en el nivel de trabajo. 
select		concat(e.fname,' ',e.lname) as empleado,
			j.job_desc 'descripción del trabajo'
from		employee e
inner join	jobs j on (j.job_id = e.job_id)
-- where		e.job_lvl between j.min_lvl and j.max_lvl;
where		e.job_lvl between 100 and 200;










    



