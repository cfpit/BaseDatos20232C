-- Comandos DDL y DML

create database tienda;

use tienda;

create table clientes(
	codigoCliente int primary key auto_increment,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    edad tinyint,
    fechaNac date,
    mail varchar(50),
    direccion varchar(30),
    telefono varchar(20),
    sexo enum('hombre','mujer','no binario')
);

-- veo la estructura de la tabla clientes
describe clientes; 

-- insert simplificado: 
-- Deben estar TODOS los valores de los campos
-- Mantener el orden de los valores de los campos
insert into clientes values(null,'Juan','Perez',25,'2000-12-07','jp@gmail.com','Rivadavia 3842 CABA','911',1);

select * from clientes;

-- insert extendido
-- No es necesario que esten todos los valores de los campos, sino solo los que conozco
-- No es necesario mantener el orden de los valores segun el orden de los campos en la tabla
insert into clientes(nombre, apellido, telefono, sexo) values('Maria','Garcia','107',2);

select * from clientes;

-- insert multiple
insert into clientes values
(null,'Lionel','Messi',36,'1987-06-21','lm@yahoo.com','Poralla 123 Miami','100',1),
(null,'Pedro','Picapiedra',50,'1973-09-15','pp@gmail.com','Piedras 444 CABA','103',1);

select * from clientes;

-- update
-- Modificar la direccion y el telefono de Pedro Picapiedra
update 	clientes 
set 	direccion = 'medrano 162 CABA', telefono = '110'
-- where	nombre = 'Pedro' and apellido = 'Picapiedra';
where	codigoCliente = 4;

select * from clientes;


-- delete
-- Eliminar a Pedro Picapiedra
delete from clientes where codigoCliente = 4;

select * from clientes;

-- alter
-- permite modificar la estructura de un objeto de la base de datos
-- (por ej.: agregar o quitar campos de una tabla)
-- Agregar el campo saldo a la tabla de clientes
alter table clientes
-- add column saldo float;-- agrego una columna a la tabla
-- add saldo float;
-- modify column saldo double;-- cambio propiedad de columna
drop column saldo;-- elimino columna de la tabla

describe clientes;

-- renombrar la tabla
rename table clientes to amigos;

show tables;

-- elimino la tabla amigos
drop table amigos;

show tables;

-- elimino la base
drop database tienda;




















