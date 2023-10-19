create database operaciones;

use operaciones;

create table A (pais varchar(30));
create table B (pais varchar(30));

insert into A values('Argentina'),('Brasil'),('Uruguay');
insert into B values('Argentina'),('Colombia'),('Venezuela');

select * from A;
select * from B;


-- union
select 	pais from A
union
select 	pais from B;

-- union all
select 	pais from A
union all
select 	pais from B;

-- intersect

-- en SQL Server
/*
select 	pais from A
intersect
select 	pais from B;
*/

SELECT A.pais
FROM A
WHERE A.pais IN (SELECT B.pais FROM B);

-- except

-- en SQL Server
/*
select 	pais from A
except
select 	pais from B;
*/
-- A except B
SELECT 	DISTINCT *
FROM 	A
WHERE NOT EXISTS
		(
			SELECT NULL 
			FROM B
			WHERE A.pais = b.pais
		);

-- B except A
SELECT 	DISTINCT *
FROM 	B
WHERE NOT EXISTS
		(
			SELECT NULL 
			FROM A
			WHERE B.pais = A.pais
		);


-- 40. Listar todas las ciudades mencionadas en la base de datos.
use pubs;

select	city from stores
union
select	city from publishers
union
select	city from authors;


-- Ejercicios sobre consultas relacionadas Base Negocio

 -- 1) Listar la cantidad de clientes que hicieron alguna compra en 
 -- el segundo semestre de 2017. 
select 	count(idcliente) 'cantidad de clientes'
from	facturas
where	year(fecha) = 2017 and month(fecha) between 7 and 12;

  -- 2) Informar la cantidad de compras por cliente. Informar el 
-- nombre y apellido en una única columna de dichos clientes. 
-- Ordenar por cantidad de compras en forma descendente.
select		concat(c.nombre,' ',c.apellido) as cliente,
			count(f.idcliente) cantidad
from		clientes c
inner join	facturas f on (c.idcliente = f.idcliente)
group by	cliente
order by	2 desc;

  -- 3) Informar las ventas por artículo. Cuál es el artículo 
-- más comprado? Ordenar por cantidad de ventas del más vendido 
-- al menos vendido.
select		articulo,
			count(f.idproducto) cantidad
from		facturas f
inner join	productos p on (p.idproducto = f.idproducto)
group by	articulo
order by	2 desc
limit		1;

-- 4) Listar nombre y apellido de los clientes que compraron pantalones.
-- Indicar cuando lo compraron y cuanto pagaron.
select		concat(c.nombre,' ',c.apellido) as cliente,
			p.articulo,
            p.precio,
            f.fecha
from		productos p
inner join	facturas f on (p.idproducto = f.idproducto)
inner join	clientes c on (c.idcliente = f.idcliente)
where		p.articulo like '%pantalon%'		
order by	2 desc
limit		1;


