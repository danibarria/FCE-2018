CREATE TABLE Docente(
    legajo int not null,
    fecha_nacimiento date,
    nombre varchar(30),
    apellido varchar (30),
    direccion varchar(60),
    idAspirante int not null,
    idLocalidad int not null,
    constraint pk_Docente primary key (legajo),
    constraint fk_Aspirante foreign key (idAspirante) references Aspirante,
    constraint fk_Localidad foreign key (idLocalidad) references Localidad
);

CREATE TABLE DocenteAntecedente(
    legajo int not null,
    idAspirante int not null,
    constraint fk_Docente foreign key (legajo) references Docente,
    constraint fk_Aspirante foreign key (idAspirante) references Aspirante 
);

CREATE TABLE MotivoBaja(
    idMotivo int not null,
    descripcion varchar(60),
    constraint pk_MotivoBaja primary key (idMotivo)
);

CREATE TABLE MotivoBajaDocente(
    legajo int not null,
    idMotivo int not null,
    constraint fk_Docente foreign key (legajo) references Docente,
    constraint pk_MotivoBaja foreign key (idMotivo) references MotivoBaja    
);

CREATE TABLE Antecedente(
    idAntecedente int not null,
    descripcion varchar(50),
    legajo int not null,
    constraint pk_Antecedente primary key (idAntecedente), 
    constraint fk_Docente foreign key (legajo) references Docente,
);

CREATE TABLE AntecedenteRealizoActividadAcademica(
    idAntecedente int not null,
    idActividadAcademica int not null,
    fecha_desde date,
    fecha_hasta date,
    constraint fk_Antecedente foreign key (idAntecedente) references Antecedente,
    constraint fk_ActividadAcademica foreign key (idActividadAcademica) references ActividadAcademica
);

CREATE TABLE AntecedenteRealizoActividadProfesional(
    idAntecedente int not null,
    idActividadProfesional int not null,
    fecha_desde date,
    fecha_hasta date,
    constraint fk_Antecedente foreign key (idAntecedente) references Antecedente,
    constraint fk_ActividadProfesional foreign key (idActividadProfesional) references ActividadProfesional        
);

CREATE TABLE ActividadAcademica(
    idActividadAcademica int not null,
    descripcion varchar(30),
    esAsignatura boolean,
    idEspacioDisciplinario int not null,
    constraint pk_ActividadAcademica primary key (idActividadAcademica),
    constraint fk_EspacioDisciplinario foreign key (idEspacioDisciplinario) references EspacioDisciplinario    
);

CREATE TABLE ActividadProfesional(
    idActividadProfesional int not null,
    descripcion varchar(30),
    idEspacioDisciplinario int not null,
    constraint pk_ActividadProfesional primary key (idActividadProfesional),
    constraint fk_EspacioDisciplinario foreign key (idEspacioDisciplinario) references EspacioDisciplinario    
);

CREATE TABLE Dimension(
    idDimension int not null,
    descripcion varchar(60)
    constraint pk_Dimension primary key (idDimension)
);

CREATE TABLE PeriodoActividad(
    idPeriodoActividad int not null,
    fecha_desde date,
    fecha_hasta date,
    legajo int not null,
    idDesignacion int not null,
    constraint pk_PeriodoActividad primary key (idPeriodoActividad),
    constraint fk_Docente foreign key (legajo) references Docente,
    constraint fk_Designacion foreign key (idDesignacion) references Designacion
);


CREATE TABLE EspacioDisciplinario(
    idEspacioDisciplinario int not null,
    descripcion varchar(60),
    constraint pk_EspacioDisciplinario primary key (idEspacioDisciplinario)
);

CREATE TABLE PlanMejora(
    idPlan int not null,
    descripcion varchar(120),
    constraint pk_PlanMejora primary key (idPlan)
);

CREATE TABLE PlanMejoraPeriodoActividad(
    idPeriodoActividad int not null,
    idPlan int not null,
    fecha_desde date,
    fecha_hasta date,
    constraint fk_PeriodoActividad foreign key (idPeriodoActividad) references PeriodoActividad,
    constraint fk_PlanMejora foreign key (idPlan) references PlanMejora
);

CREATE TABLE Aspirante(
    idAspirante int not null,
    nombre varchar(30),
    apellido varchar(30),
    direccion varchar(90),
    constraint pk_Aspirante primary key (idAspirante)
);

CREATE TABLE Asignacion(
    idAsignacion int not null,
    cantidad_horas int not null,
    idActividadAcademica int not null,
    constraint pk_Asignacion primary key (idAsignacion),
    constraint fk_ActividadAcademica foreign key (idActividadAcademica) references ActividadAcademica
);

CREATE TABLE AsignacionDesignacion(
    idAsignacion int not null,
    idDesignacion int not null,
    constraint fk_Asignacion foreign key (idAsignacion) references Asignacion,
    constraint fk_Designacion foreign key (idDesignacion) references Designacion
);

CREATE TABLE AsistenciaDiaria(
    idAsistencia int not null,
    fecha date,
    idPeriodoActividad int not null,
    constraint pk_Asistencia primary key (idAsistencia),
    constraint fk_PeriodoActividad foreign key (idPeriodoActividad) references PeriodoActividad
);

CREATE TABLE DetalleAsistenciaDiaria(
    idAsistencia int not null,
    renglon int not null,
    hora_inicio date,
    hora_fin date,
    idActividadAcademica int not null,
    constraint fk_Asistencia foreign key (idAsistencia) references Asistencia,
    constraint fk_ActividadAcademica foreign key (idActividadAcademica) references ActividadAcademica
);

CREATE TABLE Licencia(
    idLicencia int not null,
    descripcion varchar(120),
    fecha_desde date,
    fecha_hasta date,
    idPeriodoActividad int not null,
    constraint pk_Licencia primary key (idLicencia),
    constraint fk_PeriodoActividad foreign key (idPeriodoActividad)
);

CREATE TABLE Dedicacion(
    idDedicacion int not null,
    descripcion varchar(120),
    cantidad_horas int not null,
    precio float,
    constraint pk_Dedicacion primary key (idDedicacion)
);

CREATE TABLE TipoDocente(
    idTipoDocente int not null,
    antiguedad int not null,
    precio float not null, /* precio de la hora catedra*/
    enCarreraAcademica boolean, /*si / no */
    tipoRegularidad int not null,
    constraint pk_TipoDocente primary key (idTipoDocente),
    constraint fk_TipoRegular foreign key (tipoRegularidad) references TipoRegular
);

CREATE TABLE TipoRegular(
    /*esto es por tipo Regular / interino */
    idTipoRegular int not null,
    descripcion varchar(30)
);

