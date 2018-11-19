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
    descripcion varchar(30),
    constraint pk_TipoRegular primary key (idTipoRegular)
);


CREATE TABLE Categoria(
    idCategoria int not null,
    tipoProfesor int not null, /* profesor, auxiliar*/
    constraint pk_Categoria primary key (idCategoria),
    constraint fk_tipo foreign key (tipoProfesor) references Profesor
);

CREATE TABLE CategoriaProfesor(
    idCategoria int not null,
    idProfesor int not null,
    constraint fk_Categoria foreign key (idCategoria) references Categoria,
    constraint fk_Profesor foreign key (idProfesor) references Profesor
);

CREATE TABLE CategoriaAuxiliar(
    idCategoria int not null,
    idAuxiliar int not null,
    constraint fk_Categoria foreign key (idCategoria) references Categoria,
    constraint fk_Auxiliar foreign key (idAuxiliar) references Auxiliar
);

CREATE TABLE Profesor(
    idProfesor int not null,
    precio float,
    constraint pk_Profesor primary key (idProfesor)
);

CREATE TABLE tipoProfesor(
    idTipo int not null,
    descripcion varchar(50), /*profesor , auxiliar*/
    constraint pk_tipoInterino primary key (idTipo)
);

CREATE TABLE Auxiliar(
    idAuxiliar int not null,
    precio float,
    TipoAuxiliar int not null, /*JTP, AUXILIAR 1era, Auxiliar 2da*/ 
    constraint pk_Auxiliar primary key (idAuxiliar),
    constraint fk_TipoAuxiliar foreign key (TipoAuxiliar) references TipoAuxiliar
);

CREATE TABLE TipoAuxiliar(
    /*JTP, AUXILIAR 1era, Auxiliar 2da*/
    idTipoAuxiliar int not null,
    descripcion varchar(20),
    constraint pk_idTipoAuxiliar primary key (idTipoAuxiliar)
);

CREATE TABLE EvaluacionInterino(
    idEvaluacion int not null,
    observacion varchar(60),
    resultado boolean,
    fecha date,
    constraint pk_EvaluacionInterino primary key (idEvaluacion)
);

CREATE TABLE PlanMejoraInterino(
    idPlan int not null,
    idEvaluacion int not null,
    constraint fk_Plan foreign key (idPlan) references PlanMejora,
    constraint fk_Evaluacion foreign key (idEvaluacion) references EvaluacionInterino
);

CREATE TABLE Concurso(
    idConcurso int not null,
    fecha_inicio_estimado date,
    fecha_inicio date,
    fecha_fin_estimado date,
    fecha_fin date,
    idJurado int not null,
    fecha_estimada date
    fecha date,
    idTema int not null,
    idActividadAcademica int not null,
    constraint pk_Concurso primary key(idConcurso),
    constraint fk_Jurado foreign key (idJurado) references Jurado,
    constraint fk_Tema foreign key (idTema) references Tema,
    constraint fk_ActividadAcademica foreign key (idActividadAcademica) references Actividad Academica
);

CREATE TABLE DetalleConcurso(
    idConcurso int not null,
    idDetalleConcurso int not null,
    fecha_inscripcion date not null,
    constraint pk_Detalle primary key(idDetalleConcurso),
    constraint fk_Concurso foreign key (idConcurso) references Concurso
);

