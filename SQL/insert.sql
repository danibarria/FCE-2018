insert into Localidad(nombre) values ('Trelew');
insert into Localidad(nombre) values ('Rawson');
insert into Localidad(nombre) values ('Puerto Madryn');
insert into Localidad(nombre) values ('Tecka');

insert into Aspirante(idaspirante, nombre, apellido, direccion) values (12346,'Carlos', 'Irigoyen', 'Pietroveli 173');
insert into Aspirante(idaspirante, nombre, apellido, direccion) values (12345,'Pewen', 'Sugar', 'Cuba 908');
insert into Aspirante(idaspirante, nombre, apellido, direccion) values (12344,'Jose', 'Dama', 'Calle Falsa 123');
insert into Aspirante(idaspirante, nombre, apellido, direccion) values (21213,'Elsa', 'Biondo', 'Mitre 124');
insert into Aspirante(idaspirante, nombre, apellido, direccion) values (12312,'Merli', 'Bergeron', 'Marconi 200');

-- CREATE TABLE Antecedente(
--     idAntecedente serial,
--     descripcion varchar(50),
--     -- legajo int not null,
--     constraint pk_Antecedente primary key (idAntecedente)
--     -- constraint fk_Docente foreign key (legajo) references Docente
-- );

insert into Antecedente(descripcion) values ('antecedentes de juan');
insert into Antecedente(descripcion) values ('antecedentes de pablo');
insert into Antecedente(descripcion) values ('antecedentes de andres');

insert into Docente(fecha_nacimiento, nombre, apellido, direccion, idaspirante, idlocalidad, idantecedente ) 
values ('12-12-2018','Juan', 'Minujin', 'Winter 33', 12344,1,1);

insert into Docente(fecha_nacimiento, nombre, apellido, direccion, idaspirante, idlocalidad, idantecedente) 
values ('12-12-2011','Pablo', 'Neruda', 'Pecoraro 1432', 21213,1,2);

insert into Docente(fecha_nacimiento, nombre, apellido, direccion, idaspirante, idlocalidad, idantecedente) 
values ('11-11-2011','Andres', 'Ovich', 'San Martin 285', 12312,2,3);

insert into TipoRegular(descripcion) values('Regular');
insert into TipoRegular(descripcion) values('Interino');

insert into tipoProfesor(descripcion) values('Profesor');
insert into tipoProfesor(descripcion) values('Auxiliar');

insert into tipoAuxiliar(descripcion) values('JTP');
insert into tipoAuxiliar(descripcion) values('Auxiliar 1er');
insert into tipoAuxiliar(descripcion) values('Auxiliar 2da');






