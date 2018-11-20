/*1. Quien resultó "seleccionado" para un determinado concurso. */

SELECT Concurso.fecha_inicio, Concurso.fecha_fin, DetalleConcurso.posicion, puntaje,Aspirante.nombre, Aspirante.apellido 
FROM ((Concurso INNER JOIN DetalleConcurso 
ON Concurso.idConcurso = DetalleConcurso.idConcurso 
WHERE DetalleConcurso.posicion = 1)
INNER JOIN Aspirante 
ON Aspirante.codigo = DetalleConcurso.idAspirante) 

/*2. Cuál es la calificación definitiva (a fin de cuatrimestre, o del año dependiendo la materia) de un docente en determinada asignatura.*/

/*3. LISTADO: Docentes que actualmente están con licencia y la especificación del motivo*/
SELECT Docente.nombre, docente.apellido, Licencia.fecha_desde, Licencia.fecha_hasta, Licencia.descripcion FROM 
((Licencia INNER JOIN PeriodoActividad 
ON Licencia.idPeriodoActividad = PeriodoActividad.idPeriodoActividad    /*todos las licencias*/
WHERE Licencia.fecha_desde >= '01/01/2012' && Licencia.fecha_desde <= '31/01/2012' ) /*licencias desde fecha ficticia inicio hasta fin*/ 
INNER JOIN Docente 
ON Docente.legajo = PeriodoActividad.legajo) /*Join de los docen3*/


/*4. Cuántos y cuáles son los docentes asignados a determinada materia. (Listado del equipo docente de una materia).*/
SELECT Dpcente.Nombre,  FROM ((((((((ActividadAcademica 
WHERE ActividadAcademica.descripcion='Sistemas Operativos' && ActividadAcademica.esAsignatura = TRUE)
INNER JOIN Asignacion ON ActividadAcademica.codigo = Asignacion.codigo)
INNER JOIN AsignacionDesignacion ON AsignacionDesignacion.codigo = Asignacion.codigo)
INNER JOIN Designacion ON Designacion.codigo = AsignacionDesignacion.codigo)
-- INNER JOIN Categoria ON Designacion.codigo = Categoria.idDesignacion)
INNER JOIN DesignacionPeriodoActividad ON Designacion.codigo = DesignacionPeriodoActividad.codigo)
INNER JOIN PeriodoActividad ON PeriodoActividad.codigo = DesignacionPeriodoActividad.codigo)
INNER JOIN Docente ON Periodo.codigo = Docente.legajo)