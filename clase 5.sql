-- Ejercitación Base Pubs

-- 1. Posicionar el Analizador de Consultas en la base de datos PUBS.
use pubs;
-- 4. Mostrar la estructura de la tabla STORES. 
describe stores;
-- 6. Mostrar el código, nombre completo y fecha de ingreso de los empleados que 
-- trabajan para la editorial 877. Tener en cuenta que el nombre completo es el 
-- resultado de la concatenación del nombre y apellido. Las columnas deben estar 
-- apodadas según las siguientes leyendas: "Número de Empleado", "Nombre de Empleado" 
-- y "Fecha de Inicio".
SELECT	emp_id 'Número de Empleado',
		concat(fname , ' ' , lname) 'Nombre de Empleado',
        hire_date 'Fecha de Inicio'
FROM	employee
WHERE	pub_id = '0877';

-- 9. Listar los países de residencia de las editoriales. 
-- Evitar las repeticiones.

-- sin evitar repeticiones
select country from publishers;
-- evitando repeticiones con la clausula distinct
select distinct country from publishers;

-- 11.Listar todos los empleados de la editorial número 877. 
-- Ordenar por nivel de trabajo descendente y por fecha de 
-- incorporación ascendente
select		*
from		employee
where		pub_id = '0877'
order by	job_lvl desc, hire_date asc;

-- 12. Listar el número, apellido, nombre y teléfono de los autores 
-- que NO tengan contrato y que su estado de residencia sea California (CA). 
select	au_id 'numero de autor',
		au_lname apellido,
        au_fname nombre,
        phone telefono
from	authors
where	contract = 0 and state = 'ca';


/*
	13.	Listar los empleados cuyo año de incorporación fue 1990
    y cuyo nivel  de trabajo esté entre 100 Y 200. 
*/
select	*
from	employee
where	year(hire_date) = 1990 and job_lvl between 100 and 200;

-- 14. Listar los libros vendidos cuya condición de pago es sobre facturación 
-- y cuya cantidad de venta esté entre 13 y 40. No utilizar el operador BETWEEN.
select	*
from	sales
-- where	payterms like '%invoice%' and qty between 13 and 40;
where	payterms like '%invoice%' and qty >= 13 and qty <= 40;

/*
	16. Listar el título y precio de los libros de cocina cuyo título no figure 
    la palabra "sushi". Ordenar por precio descendente. 
*/
select 		title as libro,
			price as precio
from		titles
where		type like '%cook%' and title not like '%sushi%'
order by	price desc;

/*
	20.	 Listar todas las facturas que su condición de pago 
    es a 30 días que hayan facturado durante el año 1992 y 1993 
    ó los que su condición de pago es a 60 días que han facturado 
    durante el segundo semestre del año 1994. Ordenar la consulta 
    por código de libro.
    
    valores del campo payterms: Net 60, Net 30, ON invoice

*/
select 	* 
from 	sales
where	payterms = 'net 30' and year(ord_date) in (1992,1993)
or		payterms = 'net 60' and year(ord_date) = 1994 and month(ord_date) >= 7;











