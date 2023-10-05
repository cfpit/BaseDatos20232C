create database relaciones;

use relaciones;

create table sucursales(suc_id int, suc_nombre varchar(20));
create table empleados(emp_id int, emp_nombre varchar(20),suc_id int);

insert into sucursales values(1,'Centro'),(2,'Congreso'),(3,'Almagro'),(4,'Palermo');
insert into empleados values(1,'Juan',1),(2,'Carlos',2),(3,'Jose',2),(4,'Maria',null);

select * from sucursales;
select * from empleados;

-- listar el nombre de las sucursales y de los empleados que en ellas trabajan.
-- inner join
select		suc_nombre,
			emp_nombre
from		empleados
inner join	sucursales
on			empleados.suc_id = sucursales.suc_id;

-- variante
select		s.suc_nombre,
			e.emp_nombre
from		empleados as e
inner join	sucursales s
on			e.suc_id = s.suc_id;

-- variante no ANSI
select		s.suc_nombre,
			e.emp_nombre
from		empleados as e, sucursales s
where		e.suc_id = s.suc_id;


-- listar el nombre de las sucursales que no tienen empleados
-- outer join
-- tabla ppal: sucursales / tabla secundaria: empleados
select		s.suc_nombre
			-- , e.*
-- from		sucursales s left outer join empleados e
from		empleados e right join sucursales s 
on			s.suc_id = e.suc_id
where		emp_id is null;-- pk de la tabla secundaria debe ser nula


-- listar el nombre de los empleados que no trabajan en ninguna sucursal
-- outer join
select		e.emp_nombre
			-- , s.*
from		sucursales s right outer join empleados e
on			s.suc_id = e.suc_id
where		s.suc_id is null;


-- producto cartesiano
select		*
from		sucursales
cross join	empleados;

-- variante no ANSI
select	*
from	sucursales, empleados;






