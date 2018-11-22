CREATE TABLE Localidad(
    idLocalidad serial,
    nombre varchar(60),
    constraint pk_Localidad primary key (idLocalidad)
);

CREATE TABLE Aspirante(
    idAspirante int not null, /*dni*/
    nombre varchar(30),
    apellido varchar(30),
    direccion varchar(90),
    constraint pk_Aspirante primary key (idAspirante)
);

CREATE TABLE Antecedente(
    idAntecedente serial,
    descripcion varchar(50),
    -- legajo int not null,
    constraint pk_Antecedente primary key (idAntecedente)
    -- constraint fk_Docente foreign key (legajo) references Docente
);

CREATE TABLE Docente(
    legajo serial,
    fecha_nacimiento date,
    nombre varchar(30),
    apellido varchar (30),
    direccion varchar(60),
    idAspirante int not null,
    idLocalidad int not null,
    idAntecedente int not null,
    constraint pk_Docente primary key (legajo),
    constraint fk_Aspirante foreign key (idAspirante) references Aspirante,
    constraint fk_Localidad foreign key (idLocalidad) references Localidad,
    constraint fk_Antecedente foreign key (idAntecedente) references Antecedente
);

CREATE TABLE Profesor(
    idProfesor serial,
    precio float,
    constraint pk_Profesor primary key (idProfesor)
);


CREATE TABLE Categoria(
    idCategoria serial,
    tipoProfesor int not null, /* profesor, auxiliar*/
    constraint pk_Categoria primary key (idCategoria),
    constraint fk_tipo foreign key (tipoProfesor) references Profesor
);

CREATE TABLE Dedicacion(
    idDedicacion serial,
    descripcion varchar(120),
    cantidad_horas int not null,
    precio float,
    constraint pk_Dedicacion primary key (idDedicacion)
);

CREATE TABLE TipoRegular(
    /*esto es por tipo Regular / interino */
    idTipoRegular serial,
    descripcion varchar(30),
    constraint pk_TipoRegular primary key (idTipoRegular)
);

CREATE TABLE TipoDocente(
    idTipoDocente serial,
    antiguedad int not null,
    precio float not null, /* precio de la hora catedra*/
    enCarreraAcademica boolean, /*si / no */
    tipoRegularidad int not null,
    constraint pk_TipoDocente primary key (idTipoDocente),
    constraint fk_TipoRegular foreign key (tipoRegularidad) references TipoRegular
);

CREATE TABLE Designacion(
    idDesignacion serial, 
    fecha_inicio date,
    fecha_fin date,
    idTipoDocente int not null,
    idCategoria int not null,
    idDedicacion int not null,
    constraint pk_Designacion primary key (idDesignacion),
    constraint fk_TipoDocente foreign key (idTipoDocente) references TipoDocente,
    constraint fk_Categoria foreign key (idCategoria) references Categoria,
    constraint fk_Dedicacion foreign key (idDedicacion) references Dedicacion
);

CREATE TABLE EspacioDisciplinario(
    idEspacioDisciplinario serial,
    descripcion varchar(60),
    constraint pk_EspacioDisciplinario primary key (idEspacioDisciplinario)
);

CREATE TABLE ActividadAcademica(
    idActividadAcademica serial,
    descripcion varchar(30),
    esAsignatura boolean,
    idEspacioDisciplinario int not null,
    constraint pk_ActividadAcademica primary key (idActividadAcademica),
    constraint fk_EspacioDisciplinario foreign key (idEspacioDisciplinario) references EspacioDisciplinario    
);

CREATE TABLE ActividadProfesional(
    idActividadProfesional serial,
    descripcion varchar(30),
    idEspacioDisciplinario int not null,
    constraint pk_ActividadProfesional primary key (idActividadProfesional),
    constraint fk_EspacioDisciplinario foreign key (idEspacioDisciplinario) references EspacioDisciplinario    
);

-- CREATE TABLE DocenteAntecedente(
--     legajo int not null,
--     idAspirante int not null,
--     constraint fk_Docente foreign key (legajo) references Docente,
--     constraint fk_Aspirante foreign key (idAspirante) references Aspirante 
-- );

CREATE TABLE MotivoBaja(
    idMotivo serial,
    descripcion varchar(60),
    constraint pk_MotivoBaja primary key (idMotivo)
);

CREATE TABLE MotivoBajaDocente(
    legajo int not null,
    idMotivo int not null,
    fecha date not null,
    constraint fk_Docente foreign key (legajo) references Docente,
    constraint fk_MotivoBaja foreign key (idMotivo) references MotivoBaja    
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

CREATE TABLE Dimension(
    idDimension serial,
    descripcion varchar(60),
    constraint pk_Dimension primary key (idDimension)
);

CREATE TABLE PeriodoActividad(
    idPeriodoActividad serial,
    fecha_desde date,
    fecha_hasta date,
    legajo int not null,
    idDesignacion int not null,
    constraint pk_PeriodoActividad primary key (idPeriodoActividad),
    constraint fk_Docente foreign key (legajo) references Docente,
    constraint fk_Designacion foreign key (idDesignacion) references Designacion
);

CREATE TABLE PlanMejora(
    idPlan serial,
    descripcion varchar(120),
    idPeriodoActividad int not null,
    constraint pk_PlanMejora primary key (idPlan),
    constraint fk_PeriodoActividad foreign key (idPeriodoActividad) references PeriodoActividad
);

CREATE TABLE PlanMejoraPeriodoActividad(
    idPeriodoActividad int not null,
    idPlan int not null,
    fecha_desde date,
    fecha_hasta date,
    constraint fk_PeriodoActividad foreign key (idPeriodoActividad) references PeriodoActividad,
    constraint fk_PlanMejora foreign key (idPlan) references PlanMejora
);

CREATE TABLE Asignacion(
    idAsignacion serial,
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
    idAsistencia serial,
    fecha date not null,
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
    constraint fk_Asistencia foreign key (idAsistencia) references AsistenciaDiaria,
    constraint fk_ActividadAcademica foreign key (idActividadAcademica) references ActividadAcademica
);

CREATE TABLE Licencia(
    idLicencia serial,
    descripcion varchar(120),
    fecha_desde date,
    fecha_hasta date,
    idPeriodoActividad int not null,
    constraint pk_Licencia primary key (idLicencia),
    constraint fk_PeriodoActividad foreign key (idPeriodoActividad) references PeriodoActividad
);


CREATE TABLE Jurado(
    idJurado serial,
    fecha_creacion timestamp,
    completo boolean,
    constraint pk_Jurado primary key (idJurado)
);

CREATE TABLE CategoriaProfesor(
    idCategoria int not null,
    idProfesor int not null,
    constraint fk_Categoria foreign key (idCategoria) references Categoria,
    constraint fk_Profesor foreign key (idProfesor) references Profesor
);

CREATE TABLE tipoProfesor(
    idTipo serial,
    descripcion varchar(50), /*profesor , auxiliar*/
    constraint pk_tipoProfesor primary key (idTipo)
);

CREATE TABLE TipoAuxiliar(
    /*JTP, AUXILIAR 1era, Auxiliar 2da*/
    idTipoAuxiliar serial,
    descripcion varchar(20),
    constraint pk_idTipoAuxiliar primary key (idTipoAuxiliar)
);

CREATE TABLE Auxiliar(
    idAuxiliar serial,
    precio float,
    TipoAuxiliar int not null, /*JTP, AUXILIAR 1era, Auxiliar 2da*/ 
    constraint pk_Auxiliar primary key (idAuxiliar),
    constraint fk_TipoAuxiliar foreign key (TipoAuxiliar) references TipoAuxiliar
);

CREATE TABLE CategoriaAuxiliar(
    idCategoria int not null,
    idAuxiliar int not null,
    constraint fk_Categoria foreign key (idCategoria) references Categoria,
    constraint fk_Auxiliar foreign key (idAuxiliar) references Auxiliar
);

CREATE TABLE EncuestaDocente(
    idEncuesta serial,
    resultado boolean,
    fecha date,
    -- idEvaluacionInterino int not null,
    constraint pk_Encuesta primary key (idEncuesta)
    -- constraint fk_EvaluacionInterino foreign key (idEvaluacionInterino) references EvaluacionInterino
);

CREATE TABLE InformeCatedra(
    idInforme serial,
    descripcion varchar(120),
    resultado boolean, 
    fecha date,
    -- idEvaluacionInterino int not null,
    constraint pk_InformeCatedra primary key (idInforme)
    -- constraint fk_EvaluacionInterino foreign key (idEvaluacionInterino) references EvaluacionInterino
);

CREATE TABLE EvaluacionInterino(
    idEvaluacion serial,
    observacion varchar(60),
    resultado boolean,
    fecha date,
    idEncuestaDocente int not null,
    idInformeCatedra int not null,
    idPeriodoActividad int not null,
    constraint pk_EvaluacionInterino primary key (idEvaluacion),
    constraint fk_EncuestaDocente foreign key (idEncuestaDocente)references EncuestaDocente,
    constraint fk_InformeCatedra foreign key (idInformeCatedra)references InformeCatedra,
    constraint fk_PeriodoActividad foreign key (idPeriodoActividad)references PeriodoActividad
);

-- CREATE TABLE PlanMejoraInterino(
--     idPlan int not null,
--     idEvaluacion int not null,
--     constraint fk_Plan foreign key (idPlan) references PlanMejora,
--     constraint fk_Evaluacion foreign key (idEvaluacion) references EvaluacionInterino
-- );

CREATE TABLE Tema(
    idTema serial,
    nombre varchar(60),
    detalle_tema varchar(120),
    -- idActividadAcademica int not null,
    constraint pk_Tema primary key (idTema)
    -- constraint fk_ActividadAcademica foreign key (idActividadAcademica) references ActividadAcademica
);

CREATE TABLE Concurso(
    idConcurso serial,
    fecha_inicio_estimado date,
    fecha_fin_estimado date,
    fecha_inicio date,
    fecha_fin date,
    observacion text,
    idJurado int not null,
    idAsignatura int not null,
    idTema int not null,
    constraint pk_Concurso primary key(idConcurso),
    constraint fk_Jurado foreign key (idJurado) references Jurado,
    constraint fk_Asignatura foreign key (idAsignatura) references ActividadAcademica,
    constraint fk_Tema foreign key (idTema) references Tema
);

CREATE TABLE DetalleConcurso(
    idConcurso serial,
    idDetalleConcurso int not null,
    renglon int not null,
    posicion int not null,
    puntaje int not null,
    observacion text,
    fecha_inscripcion date not null,
    constraint pk_Detalle primary key(idDetalleConcurso),
    constraint fk_Concurso foreign key (idConcurso) references Concurso
);

CREATE TABLE AspiranteConcurso(
    idAspirante int not null,
    idConcurso int not null,
    fecha_inscripcion date not null,
    constraint fk_Aspirante foreign key (idAspirante) references Aspirante,
    constraint fk_Concurso foreign key (idConcurso) references Concurso
);

CREATE TABLE AlumnoAutorizado(
    nroMatricula int not null,
    nombre varchar(40),
    apellido varchar(40),
    anio_cursando int,
    constraint pk_AlumnoAutorizado primary key (nroMatricula) 
);

CREATE TABLE Profesional(
    idProfesional serial,
    nombre varchar(60),
    apellido varchar(60),
    idLocalidad int not null,
    constraint pk_Profesional primary key (idProfesional),
    constraint fk_Localidad foreign key (idLocalidad) references Localidad
);

CREATE TABLE JuradoProfesional(
    idJurado int not null,
    idProfesional int not null,
    fecha date,
    constraint fk_Jurado foreign key (idJurado) references Jurado,
    constraint fk_Profesional foreign key (idProfesional) references Profesional    
);

CREATE TABLE JuradoAlumnoAutorizado(
    idJurado int not null,
    nroMatricula int not null,
    fecha date,
    constraint fk_Jurado foreign key (idJurado) references Jurado,
    constraint fk_AlumnoAutorizado foreign key (nroMatricula) references AlumnoAutorizado
);

CREATE TABLE JuradoDocente(
    idJurado int not null,
    legajo int not null,
    fecha date,
    constraint fk_Jurado foreign key (idJurado) references Jurado,
    constraint fk_Docente foreign key (legajo) references Docente
);




CREATE TABLE AsignacionEspacioDisciplinario(
    idDesignacion int not null,
    idEspacioDisciplinario int not null,
    constraint fk_Designacion foreign key (idDesignacion) references Designacion,
    constraint fk_EspacioDisciplinario foreign key (idEspacioDisciplinario) references EspacioDisciplinario
);