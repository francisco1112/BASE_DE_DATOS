CREATE TABLE CLIENTE
(
	dni VARCHAR2(10),
	nombre VARCHAR2(30),
	apellidos VARCHAR2(30),
	fecha_nacimiento DATE,
	direccion VARCHAR2 (30),
	CONSTRAINT pk_cliente PRIMARY KEY (dni)
);

CREATE TABLE CATEGORIA
(
	nombre VARCHAR2(30),
	CONSTRAINT pk_categoria PRIMARY KEY (nombre)

);

CREATE TABLE PRODUCTO
(
	nombre VARCHAR2 (30),
	precio NUMBER(5,2),
	cantidad NUMBER (10),
	nombre_cat VARCHAR2(30) NOT NULL,
	CONSTRAINT pk_producto PRIMARY KEY (nombre),
	CONSTRAINT fk1_producto FOREIGN KEY (nombre_cat) REFERENCES CATEGORIA(nombre)
);

CREATE TABLE COMPRA 
(
	dni VARCHAR2(10),
	nombre VARCHAR2(30),
	fecha DATE,
	CONSTRAINT pk_compra PRIMARY KEY (dni, nombre, fecha),
	CONSTRAINT fk1_compra FOREIGN KEY (dni) REFERENCES CLIENTE(dni),
	CONSTRAINT fk2_compra FOREIGN KEY (nombre) REFERENCES PRODUCTO(nombre)
	
);

