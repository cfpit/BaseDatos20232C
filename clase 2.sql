-- Esto es un comentario de linea

/*
	Esto es un
    comentario
    de bloque
*/

-- selecciono la base por defecto
use negocio;

-- muestro las tablas de la base seleccionada
show tables;

-- muestro la estructura de la tabla productos
describe productos;

-- comando SELECT (queries)
-- listar todos los campos de la tabla clientes
select * from clientes;-- * significa todos los campos

-- listar nombre, apellido y telefono de los clientes
select 	concat(nombre,' ',apellido) as cliente,
		telefono
from 	clientes;

-- listar articulo, precio y la marca de los productos
select 	articulo, precio, marca from productos;

-- columnas agregadas y uso de alias
select 	21 IVA,
		3 * 4 as calculo,
        'esto es un comentario',
		articulo, 
		precio, 
        round(precio * 1.21, 2) as 'precio con IVA',
        truncate(precio * 1.21, 2) as 'precio con IVA',
        marca 
from 	productos;

/*
	operadores aritmeticos: + - * /
    
    operadores relacionales: >  <   >=   <=  =  !=  <>
    
    operadores logicos: and   or  not
*/



















