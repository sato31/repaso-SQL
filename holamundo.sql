CREATE DATABASE holamundo;
SHOW DATABASES; #MUESTRA LAS BDD ALMACENADAS EN EL SISTEMA

USE holamundo;	#PARA UTILIZAR LA BASE DE DATOS ESPECIFICADA

CREATE TABLE animales ( 	#CREA LA TABLA ANIMALES
id INT,						#ID TIPO INT
tipo varchar(255),			#TIPO ES UNA CADENA DE HASTA 255 CARACTERES
estado varchar(255),
PRIMARY KEY (id)			#SE ESPECIFICA QUE LA PRIMARY KEY ES EL ID
);

INSERT INTO animales(tipo, estado) #INSERTAR VALORES EN LA TABLA
VALUES('chanchito','feliz');

ALTER TABLE animales MODIFY COLUMN id int auto_increment;

show create table animales;

CREATE TABLE `animales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

#INSERT (AGREGAR DATOS)
INSERT INTO animales(tipo, estado) #INSERTAR VALORES EN LA TABLA
VALUES('chanchito','feliz');
INSERT INTO animales(tipo, estado) #INSERTAR VALORES EN LA TABLA
VALUES('dragón','feliz');
INSERT INTO animales(tipo, estado) #INSERTAR VALORES EN LA TABLA
VALUES('felipe','triste');

#SELECT (CONSULTAS)
SELECT * FROM ANIMALES;					#CONSULTAR TODOS LOS REGISTROS DE LA TABLA
SELECT * FROM ANIMALES WHERE id = 1;	#CONSULTAR EL REGISTRO CON ID = 1
SELECT * FROM ANIMALES where estado = 'feliz' AND tipo = 'chanchito';	#CONSULTA COMBINADA: MUESTRA REGISTROS CON ESTADO = FELIZ Y TIPO = CHANCHITO
SELECT * FROM ANIMALES where estado = 'feliz' AND tipo = 'chanchito';	#NO DEUVELVE NINGÚN REGISTRO YA QUE NINGUN VALOR CUMPLE CON AMBOS ARGUMENTOS

#UPDATE (ACTUALIZAR DATOS)
UPDATE animales SET estado = 'feliz' WHERE id = 3; #ACTUALIZA TABLA ANIMALES: PONE 'FELIZ' EL ESTADO DEL ID = 3
SELECT * FROM animales;

#DELETE (ELIMINAR DATOS)
DELETE FROM animales WHERE estado = 'feliz';
#Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.
#To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

DELETE FROM animales WHERE id =3;
SELECT * FROM animales;

UPDATE animales SET estado = 'feliz' WHERE tipo = 'dragon'
#TAMBIEN ARROJA EL ERROR 1175, POR LO QUE HAY QUE ESPECIFICAR EL ID PARA ACTUALIZAR Y ELIMINAR








