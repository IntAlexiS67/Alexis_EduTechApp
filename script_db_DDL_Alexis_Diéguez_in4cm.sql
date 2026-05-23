-- Alexis Enrique Diéguez Sánchez carnet 2023463

-- drop database if exists db_DDL_Alexis_Diéguez_in4cm;
create database db_DDL_Alexis_Diéguez_in4cm;
use db_DDL_Alexis_Diéguez_in4cm;

-- TABLA CATEGORIAS
create table categorias(
    tipo_categoria int primary key,
    nombre text not null
);

-- TABLA CURSOS
create table cursos(
    codigo_curso int primary key,
    titulo_curso text not null,
    duracion_total varchar(100) not null,
    descripcion text not null,
    tipo_categoria int,
    
    constraint fk_categorias
    foreign key (tipo_categoria)
    references categorias(tipo_categoria)
);

-- TABLA INSTRUCTORES
create table instructores(
    dni int primary key,
    nombre text not null,
    especialidad text not null,
    codigo_curso int,

    constraint fk_instructores_cursos
    foreign key (codigo_curso)
    references cursos(codigo_curso)
);

-- TABLA ESTUDIANTE
create table estudiante(
    id_estudiante int primary key,
    nombre text not null,
    correo text not null
);

-- TABLA MODULO
create table modulo(
    id_modulo int primary key,
    nombre text not null
);

-- TABLA DETALLE ESTUDIANTE
create table detalle_estudiante(
    id_detalle_estudiante int primary key,
    id_estudiante int,
    codigo_curso int,
    fecha_inscripcion date,
    progreso_actual varchar(100),

    constraint fk_detalle_estudiante
    foreign key (id_estudiante)
    references estudiante(id_estudiante),

    constraint fk_detalle_curso
    foreign key (codigo_curso)
    references cursos(codigo_curso)
);

-- TABLA DETALLE MODULOS
create table detalle_modulos(
    id_detalle_modulos int primary key,
    id_modulo int,
    codigo_curso int,

    constraint fk_modulo
    foreign key (id_modulo)
    references modulo(id_modulo),

    constraint fk_detalle_modulo_curso
    foreign key (codigo_curso)
    references cursos(codigo_curso)
);
 


use db_DDL_Alexis_Diéguez_in4cm;


-- /PROCEDIMIENTOS ALMACENADOS/

-- CATEGORIAS

delimiter //
create procedure sp_agregar_categoria(
    in _tipo_categoria int,
    in _nombre text
)
begin
    insert into categorias(tipo_categoria, nombre)
    values(_tipo_categoria, _nombre);
end //
delimiter ;

delimiter //
create procedure sp_listar_categorias()
begin
    select * from categorias;
end //
delimiter ;

delimiter //
create procedure sp_buscar_categoria(
    in _tipo_categoria int
)
begin
    select * from categorias
    where tipo_categoria = _tipo_categoria;
end //
delimiter ;

delimiter //
create procedure sp_actualizar_categoria(
    in _tipo_categoria int,
    in _nombre text
)
begin
    update categorias
    set nombre = _nombre
    where tipo_categoria = _tipo_categoria;
end //
delimiter ;

delimiter //
create procedure sp_eliminar_categoria(
    in _tipo_categoria int
)
begin
    delete from categorias
    where tipo_categoria = _tipo_categoria;
end //
delimiter ;

-- CURSOS
delimiter //
create procedure sp_agregar_curso(
    in _codigo_curso int,
    in _titulo_curso text,
    in _duracion_total varchar(100),
    in _descripcion text,
    in _tipo_categoria int
)
begin
    insert into cursos(codigo_curso, titulo_curso, duracion_total, descripcion, tipo_categoria)
    values(_codigo_curso, _titulo_curso, _duracion_total, _descripcion, _tipo_categoria);
end //
delimiter ;

delimiter //
create procedure sp_listar_cursos()
begin
    select * from cursos;
end //
delimiter ;

delimiter //
create procedure sp_buscar_curso(
    in _codigo_curso int
)
begin
    select * from cursos
    where codigo_curso = _codigo_curso;
end //
delimiter ;

delimiter //
create procedure sp_actualizar_curso(
    in _codigo_curso int,
    in _titulo_curso text,
    in _duracion_total varchar(100),
    in _descripcion text
)
begin
    update cursos
    set titulo_curso = _titulo_curso,
        duracion_total = _duracion_total,
        descripcion = _descripcion
    where codigo_curso = _codigo_curso;
end //
delimiter ;

delimiter //
create procedure sp_eliminar_curso(
    in _codigo_curso int
)
begin
    delete from cursos
    where codigo_curso = _codigo_curso;
end //
delimiter ;


-- INSTRUCTORES
delimiter //
create procedure sp_agregar_instructor(
    in _dni int,
    in _nombre text,
    in _especialidad text,
    in _codigo_curso int
)
begin
    insert into instructores(dni, nombre, especialidad, codigo_curso)
    values(_dni, _nombre, _especialidad, _codigo_curso);
end //
delimiter ;

delimiter //
create procedure sp_listar_instructores()
begin
    select * from instructores;
end //
delimiter ;

delimiter //
create procedure sp_buscar_instructor(
    in _dni int
)
begin
    select * from instructores
    where dni = _dni;
end //
delimiter ;

delimiter //
create procedure sp_actualizar_instructor(
    in _dni int,
    in _nombre text,
    in _especialidad text
)
begin
    update instructores
    set nombre = _nombre,
        especialidad = _especialidad
    where dni = _dni;
end //
delimiter ;

delimiter //
create procedure sp_eliminar_instructor(
    in _dni int
)
begin
    delete from instructores
    where dni = _dni;
end //
delimiter ;


-- ESTUDIANTE
delimiter //
create procedure sp_agregar_estudiante(
    in _id_estudiante int,
    in _nombre text,
    in _correo text
)
begin
    insert into estudiante(id_estudiante, nombre, correo)
    values(_id_estudiante, _nombre, _correo);
end //
delimiter ;

delimiter //
create procedure sp_listar_estudiantes()
begin
    select * from estudiante;
end //
delimiter ;

delimiter //
create procedure sp_buscar_estudiante(
    in _id_estudiante int
)
begin
    select * from estudiante
    where id_estudiante = _id_estudiante;
end //
delimiter ;

delimiter //
create procedure sp_actualizar_estudiante(
    in _id_estudiante int,
    in _nombre text,
    in _correo text
)
begin
    update estudiante
    set nombre = _nombre,
        correo = _correo
    where id_estudiante = _id_estudiante;
end //
delimiter ;

delimiter //
create procedure sp_eliminar_estudiante(
    in _id_estudiante int
)
begin
    delete from estudiante
    where id_estudiante = _id_estudiante;
end //
delimiter ;


-- MODULO
delimiter //
create procedure sp_agregar_modulo(
    in _id_modulo int,
    in _nombre text
)
begin
    insert into modulo(id_modulo, nombre)
    values(_id_modulo, _nombre);
end //
delimiter ;

delimiter //
create procedure sp_listar_modulos()
begin
    select * from modulo;
end //
delimiter ;

delimiter //
create procedure sp_buscar_modulo(
    in _id_modulo int
)
begin
    select * from modulo
    where id_modulo = _id_modulo;
end //
delimiter ;

delimiter //
create procedure sp_actualizar_modulo(
    in _id_modulo int,
    in _nombre text
)
begin
    update modulo
    set nombre = _nombre
    where id_modulo = _id_modulo;
end //
delimiter ;

delimiter //
create procedure sp_eliminar_modulo(
    in _id_modulo int
)
begin
    delete from modulo
    where id_modulo = _id_modulo;
end //
delimiter ;

-- DETALLE ESTUDIANTE
delimiter //
create procedure sp_agregar_detalle_estudiante(
    in _id_detalle_estudiante int,
    in _id_estudiante int,
    in _codigo_curso int,
    in _fecha_inscripcion date,
    in _progreso_actual varchar(100)
)
begin
    insert into detalle_estudiante(id_detalle_estudiante, id_estudiante, codigo_curso, fecha_inscripcion, progreso_actual)
    values(_id_detalle_estudiante, _id_estudiante, _codigo_curso, _fecha_inscripcion, _progreso_actual);
end //
delimiter ;

delimiter //
create procedure sp_listar_detalle_estudiante()
begin
    select * from detalle_estudiante;
end //
delimiter ;

delimiter //
create procedure sp_buscar_detalle_estudiante(
    in _id_detalle_estudiante int
)
begin
    select * from detalle_estudiante
    where id_detalle_estudiante = _id_detalle_estudiante;
end //
delimiter ;

delimiter //
create procedure sp_actualizar_detalle_estudiante(
    in _id_detalle_estudiante int,
    in _fecha_inscripcion date,
    in _progreso_actual varchar(100)
)
begin
    update detalle_estudiante
    set fecha_inscripcion = _fecha_inscripcion,
        progreso_actual = _progreso_actual
    where id_detalle_estudiante = _id_detalle_estudiante;
end //
delimiter ;

delimiter //
create procedure sp_eliminar_detalle_estudiante(
    in _id_detalle_estudiante int
)
begin
    delete from detalle_estudiante
    where id_detalle_estudiante = _id_detalle_estudiante;
end //
delimiter ;

-- DETALLE MODULOS
delimiter //
create procedure sp_agregar_detalle_modulos(
    in _id_detalle_modulos int,
    in _id_modulo int,
    in _codigo_curso int
)
begin
    insert into detalle_modulos(id_detalle_modulos, id_modulo, codigo_curso)
    values(_id_detalle_modulos, _id_modulo, _codigo_curso);
end //
delimiter ;

delimiter //
create procedure sp_listar_detalle_modulos()
begin
    select * from detalle_modulos;
end //
delimiter ;

delimiter //
create procedure sp_buscar_detalle_modulos(
    in _id_detalle_modulos int
)
begin
    select * from detalle_modulos
    where id_detalle_modulos = _id_detalle_modulos;
end //
delimiter ;

delimiter //
create procedure sp_actualizar_detalle_modulos(
    in _id_detalle_modulos int,
    in _id_modulo int,
    in _codigo_curso int
)
begin
    update detalle_modulos
    set id_modulo = _id_modulo,
        codigo_curso = _codigo_curso
    where id_detalle_modulos = _id_detalle_modulos;
end //
delimiter ;

delimiter //
create procedure sp_eliminar_detalle_modulos(
    in _id_detalle_modulos int
)
begin
    delete from detalle_modulos
    where id_detalle_modulos = _id_detalle_modulos;
end //
delimiter ;

-- VISTAS 
create view vw_listar_categorias as
select tipo_categoria, nombre
from categorias;

create view vw_estudiantes as
select id_estudiante, nombre, correo
from estudiante;

create view vw_listar_cursos as
select C.codigo_curso, C.titulo_curso, C.duracion_total,
       C.descripcion, CA.nombre as categoria
from cursos C
inner join categorias CA
on C.tipo_categoria = CA.tipo_categoria;

create view vw_listar_instructores as
select I.dni, I.nombre, I.especialidad, C.titulo_curso
from instructores I
inner join cursos C
on I.codigo_curso = C.codigo_curso;

create view vw_listar_detalle_estudiante as
select E.nombre, E.correo, C.titulo_curso,
       DE.fecha_inscripcion, DE.progreso_actual
from detalle_estudiante DE
inner join estudiante E
on DE.id_estudiante = E.id_estudiante
inner join cursos C
on DE.codigo_curso = C.codigo_curso;

create view vw_listar_detalle_modulos as
select M.nombre as modulo, C.titulo_curso
from detalle_modulos DM
inner join modulo M
on DM.id_modulo = M.id_modulo
inner join cursos C
on DM.codigo_curso = C.codigo_curso;

create view vw_listar_estudiantes as
select E.nombre as estudiante,
       C.titulo_curso,
       DE.progreso_actual
from estudiante E
inner join detalle_estudiante DE
on E.id_estudiante = DE.id_estudiante
inner join cursos C
on DE.codigo_curso = C.codigo_curso;

create view vw_listar_modulos as
select id_modulo, nombre
from modulo;

-- //CALL AGREGAR//

-- CATEGORIAS
call sp_agregar_categoria(21, 'Cloud Computing');
call sp_agregar_categoria(22, 'Desarrollo Móvil');
call sp_agregar_categoria(23, 'Ofimática');
call sp_agregar_categoria(24, 'Marketing Digital');
call sp_agregar_categoria(25, 'Edición Multimedia');
call sp_agregar_categoria(26, 'Robótica');
call sp_agregar_categoria(27, 'Análisis de Datos');
call sp_agregar_categoria(28, 'Big Data');
call sp_agregar_categoria(29, 'Videojuegos');
call sp_agregar_categoria(30, 'Electrónica');
call sp_agregar_categoria(31, 'Diseño UX/UI');
call sp_agregar_categoria(32, 'Linux');
call sp_agregar_categoria(33, 'Automatización');
call sp_agregar_categoria(34, 'Programación Web');
call sp_agregar_categoria(35, 'Testing QA');
call sp_agregar_categoria(36, 'IoT');
call sp_agregar_categoria(37, 'DevOps');
call sp_agregar_categoria(38, 'Blockchain');
call sp_agregar_categoria(39, 'Realidad Virtual');
call sp_agregar_categoria(40, 'Redes');

-- CURSOS
call sp_agregar_curso(121, 'AWS Essentials', '45 horas', 'Servicios básicos en la nube', 21);
call sp_agregar_curso(122, 'Android Studio', '55 horas', 'Apps móviles Android', 22);
call sp_agregar_curso(123, 'Excel Profesional', '30 horas', 'Funciones avanzadas de Excel', 23);
call sp_agregar_curso(124, 'SEO y SEM', '40 horas', 'Posicionamiento web', 24);
call sp_agregar_curso(125, 'Adobe Premiere', '35 horas', 'Edición de video digital', 25);
call sp_agregar_curso(126, 'Arduino Básico', '45 horas', 'Introducción a robótica', 26);
call sp_agregar_curso(127, 'Power BI', '50 horas', 'Visualización de datos', 27);
call sp_agregar_curso(128, 'Hadoop', '60 horas', 'Procesamiento Big Data', 28);
call sp_agregar_curso(129, 'Unity 3D', '55 horas', 'Creación de videojuegos', 29);
call sp_agregar_curso(130, 'Electrónica Digital', '40 horas', 'Circuitos digitales', 30);
call sp_agregar_curso(131, 'Figma UX/UI', '35 horas', 'Diseño de interfaces', 31);
call sp_agregar_curso(132, 'Linux Server', '50 horas', 'Administración Linux', 32);
call sp_agregar_curso(133, 'Automatización Industrial', '65 horas', 'Control automático', 33);
call sp_agregar_curso(134, 'JavaScript Avanzado', '45 horas', 'Desarrollo web moderno', 34);
call sp_agregar_curso(135, 'Testing Manual', '30 horas', 'Pruebas QA', 35);
call sp_agregar_curso(136, 'IoT con ESP32', '55 horas', 'Internet de las cosas', 36);
call sp_agregar_curso(137, 'Docker y Kubernetes', '60 horas', 'DevOps profesional', 37);
call sp_agregar_curso(138, 'Blockchain Básico', '50 horas', 'Criptografía y blockchain', 38);
call sp_agregar_curso(139, 'VR Development', '70 horas', 'Realidad virtual avanzada', 39);
call sp_agregar_curso(140,'CCNA Básico', '50 horas', 'Fundamentos de redes', 40);

-- INSTRUCTORES
call sp_agregar_instructor(1021,'Brayan Castillo','JavaScript',121);
call sp_agregar_instructor(1022,'Natalia Ponce','React',122);
call sp_agregar_instructor(1023,'Oscar Martínez','SQL Server',123);
call sp_agregar_instructor(1024,'Karen López','Ethical Hacking',124);
call sp_agregar_instructor(1025,'Samuel Fuentes','Python',125);
call sp_agregar_instructor(1026,'Andrea Morales','SEO',126);
call sp_agregar_instructor(1027,'José Hernández','Cisco',127);
call sp_agregar_instructor(1028,'Paola Ramos','Flutter',128);
call sp_agregar_instructor(1029,'Cristian Díaz','Excel Avanzado',129);
call sp_agregar_instructor(1030,'Tatiana Ruiz','Azure',130);
call sp_agregar_instructor(1031,'Mauricio León','Deep Learning',131);
call sp_agregar_instructor(1032,'Silvia Castro','Power BI',132);
call sp_agregar_instructor(1033,'Raúl Gómez','Figma',133);
call sp_agregar_instructor(1034,'Melissa Torres','Kubernetes',134);
call sp_agregar_instructor(1035,'Julio Reyes','Game Design',135);
call sp_agregar_instructor(1036,'Monica Herrera','Smart Contracts',136);
call sp_agregar_instructor(1037,'Felipe Cruz','Fotografía Pro',137);
call sp_agregar_instructor(1038,'Daniela Vega','After Effects',138);
call sp_agregar_instructor(1039,'Hugo Silva','Animación 3D',139);
call sp_agregar_instructor(1040,'Ivette Morales','Arduino',140);

-- ESTUDIANTE
call sp_agregar_estudiante(21,'Kevin Ramos','kevin@gmail.com');
call sp_agregar_estudiante(22,'Laura Méndez','laura@gmail.com');
call sp_agregar_estudiante(23,'Miguel Herrera','miguel@gmail.com');
call sp_agregar_estudiante(24,'Paula Castro','paula@gmail.com');
call sp_agregar_estudiante(25,'Raúl Díaz','raul@gmail.com');
call sp_agregar_estudiante(26,'Andrea Flores','andrea@gmail.com');
call sp_agregar_estudiante(27,'Fernando Gómez','fernando@gmail.com');
call sp_agregar_estudiante(28,'Patricia León','patricia2@gmail.com');
call sp_agregar_estudiante(29,'Cristina Morales','cristina@gmail.com');
call sp_agregar_estudiante(30,'José Ramírez','jose@gmail.com');
call sp_agregar_estudiante(31,'Camilo Torres','camilo@gmail.com');
call sp_agregar_estudiante(32,'Daniela Pérez','daniela@gmail.com');
call sp_agregar_estudiante(33,'Héctor Ruiz','hector@gmail.com');
call sp_agregar_estudiante(34,'Verónica Silva','veronica@gmail.com');
call sp_agregar_estudiante(35,'Tomás Castillo','tomas@gmail.com');
call sp_agregar_estudiante(36,'Gabriela Ramos','gabriela@gmail.com');
call sp_agregar_estudiante(37,'Luis Fernández','luisf@gmail.com');
call sp_agregar_estudiante(38,'Mariana Soto','mariana@gmail.com');
call sp_agregar_estudiante(39,'Eduardo Vega','eduardo@gmail.com');
call sp_agregar_estudiante(40,'Carolina Cruz','carolina@gmail.com');

-- MODULO
call sp_agregar_modulo(21,'Introducción Avanzada');
call sp_agregar_modulo(22,'Sintaxis');
call sp_agregar_modulo(23,'Operadores');
call sp_agregar_modulo(24,'Matrices');
call sp_agregar_modulo(25,'Métodos');
call sp_agregar_modulo(26,'Interfaces');
call sp_agregar_modulo(27,'Herencia');
call sp_agregar_modulo(28,'Frameworks');
call sp_agregar_modulo(29,'APIs REST');
call sp_agregar_modulo(30,'Responsive Design');
call sp_agregar_modulo(31,'Microservicios');
call sp_agregar_modulo(32,'Debugging');
call sp_agregar_modulo(33,'Firewall');
call sp_agregar_modulo(34,'CI/CD');
call sp_agregar_modulo(35,'Performance');
call sp_agregar_modulo(36,'Redes Neuronales');
call sp_agregar_modulo(37,'Azure Cloud');
call sp_agregar_modulo(38,'Virtualización');
call sp_agregar_modulo(39,'Control de Versiones');
call sp_agregar_modulo(40,'Presentación Final');

-- DETALLE_ESTUDIANTE
call sp_agregar_detalle_estudiante(21,21,121,'2026-02-01','15%');
call sp_agregar_detalle_estudiante(22,22,122,'2026-02-02','25%');
call sp_agregar_detalle_estudiante(23,23,123,'2026-02-03','35%');
call sp_agregar_detalle_estudiante(24,24,124,'2026-02-04','45%');
call sp_agregar_detalle_estudiante(25,25,125,'2026-02-05','55%');
call sp_agregar_detalle_estudiante(26,26,126,'2026-02-06','65%');
call sp_agregar_detalle_estudiante(27,27,127,'2026-02-07','75%');
call sp_agregar_detalle_estudiante(28,28,128,'2026-02-08','85%');
call sp_agregar_detalle_estudiante(29,29,129,'2026-02-09','95%');
call sp_agregar_detalle_estudiante(30,30,130,'2026-02-10','100%');
call sp_agregar_detalle_estudiante(31,31,131,'2026-02-11','10%');
call sp_agregar_detalle_estudiante(32,32,132,'2026-02-12','20%');
call sp_agregar_detalle_estudiante(33,33,133,'2026-02-13','30%');
call sp_agregar_detalle_estudiante(34,34,134,'2026-02-14','40%');
call sp_agregar_detalle_estudiante(35,35,135,'2026-02-15','50%');
call sp_agregar_detalle_estudiante(36,36,136,'2026-02-16','60%');
call sp_agregar_detalle_estudiante(37,37,137,'2026-02-17','70%');
call sp_agregar_detalle_estudiante(38,38,138,'2026-02-18','80%');
call sp_agregar_detalle_estudiante(39,39,139,'2026-02-19','90%');
call sp_agregar_detalle_estudiante(40,40,140,'2026-02-20','100%');

-- DETALLE_MODULOS
call sp_agregar_detalle_modulos(21,21,121);
call sp_agregar_detalle_modulos(22,22,122);
call sp_agregar_detalle_modulos(23,23,123);
call sp_agregar_detalle_modulos(24,24,124);
call sp_agregar_detalle_modulos(25,25,125);
call sp_agregar_detalle_modulos(26,26,126);
call sp_agregar_detalle_modulos(27,27,127);
call sp_agregar_detalle_modulos(28,28,128);
call sp_agregar_detalle_modulos(29,29,129);
call sp_agregar_detalle_modulos(30,30,130);
call sp_agregar_detalle_modulos(31,31,131);
call sp_agregar_detalle_modulos(32,32,132);
call sp_agregar_detalle_modulos(33,33,133);
call sp_agregar_detalle_modulos(34,34,134);
call sp_agregar_detalle_modulos(35,35,135);
call sp_agregar_detalle_modulos(36,36,136);
call sp_agregar_detalle_modulos(37,37,137);
call sp_agregar_detalle_modulos(38,38,138);
call sp_agregar_detalle_modulos(39,39,139);
call sp_agregar_detalle_modulos(40,40,140);

-- =========================================
-- CALLS PROCEDIMIENTOS BUSCAR
-- =========================================

call sp_buscar_categoria(20);
call sp_buscar_curso(103);
call sp_buscar_instructor(1023);
call sp_buscar_estudiante(25);
call sp_buscar_modulo(10);
call sp_buscar_detalle_estudiante(15);
call sp_buscar_detalle_modulos(23);

-- CALLS PROCEDIMIENTOS ACTUALIZAR

call sp_actualizar_categoria(20,'Redes Empresariales');
call sp_actualizar_curso(131,'CCNA Enterprise','70 horas','Curso avanzado empresarial Cisco');
call sp_actualizar_instructor(1021,'Brayan Castillo','C++');
call sp_actualizar_estudiante(21,'Kevin Ramos Pérez','kevinramos@gmail.com');
call sp_actualizar_modulo(21,'Introducción Profesional');
call sp_actualizar_detalle_estudiante(21,'2026-03-01','45%');
call sp_actualizar_detalle_modulos(21,24,104);

-- CALL LISTAR
call sp_listar_categorias();
call sp_listar_cursos();
call sp_listar_instructores();
call sp_listar_estudiantes();
call sp_listar_modulos();
call sp_listar_detalle_modulos();
call sp_listar_detalle_estudiante();

-- CALLS PROCEDIMIENTOS ELIMINAR

call sp_eliminar_categoria(39);
call sp_eliminar_curso(1020);
call sp_eliminar_instructor(1040);
call sp_eliminar_estudiante(40);
call sp_eliminar_modulo(38);
call sp_eliminar_detalle_estudiante(38);
call sp_eliminar_detalle_modulos(38);

select * from categorias ;
select * from cursos ;
select * from instructores;
select * from modulo ;
select * from estudiante ;
select * from detalle_estudiante ;
select * from detalle_modulos ;