create database vehiculos;

use vehiculos;


CREATE TABLE VEHICULOS
(
	matricula VARCHAR (7),
	marca VARCHAR (10) NOT NULL,
	modelo VARCHAR (10) NOT NULL,
	fecha_compra DATE,
	precio_dia DECIMAL (5,2),
	CONSTRAINT pk_vehiculos PRIMARY KEY (matricula),
	/*CONSTRAINT ck_vehiculos CHECK (EXTRACT(YEAR FROM fecha_compra)>2001),*/
	CONSTRAINT ck1_vehiculos CHECK (precio_dia>0)
	
);

CREATE TABLE CLIENTES
(
	DNI VARCHAR (10),
	nombre VARCHAR (30) NOT NULL,
	nacionalidad VARCHAR (30),
	fecha_nacimiento DATE,
	direccion VARCHAR (50),
	CONSTRAINT pk_clientes PRIMARY KEY (DNI)
);

CREATE TABLE ALQUILERES
(
	matricula VARCHAR (7),
	DNI VARCHAR (10),
	fecha_hora DATE,
	num_dias INTEGER(2) NOT NULL,
	kilometros INTEGER (4) DEFAULT 0,
	CONSTRAINT pk_alquileres PRIMARY KEY (matricula, DNI, fecha_hora),
	CONSTRAINT fk_alquileres FOREIGN KEY (matricula) REFERENCES VEHICULOS(matricula),
	CONSTRAINT fk1_alquileres FOREIGN KEY (DNI) REFERENCES CLIENTES(DNI)
	
);

ALTER TABLE VEHICULOS ADD total_kilometros INTEGER(10);
ALTER TABLE CLIENTES ADD CONSTRAINT ck_clientes CHECK (regexp_like(DNI, '^[0-9]{8}-[A-Z|a-z]{1}$'));
ALTER TABLE VEHICULOS ADD CONSTRAINT ck2_vehiculos CHECK (regexp_like(matricula, '^[0-9]{4}[A-Z]{3}$'));





/*CHECK (campo IN ('copa', 'liga'))
--CHECK (campo NOT IN ('copa', 'liga'))
--CHECK (campo LIKE  'copa'OR  campo LIKE 'liga'))
--CHECK (campo LIKE  'C%' OR  campo LIKE '%L'))*/
