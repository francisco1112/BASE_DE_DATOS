DROP TABLE PUBLICACIONES CASCADE CONSTRAINT;
DROP TABLE EDITORIAL CASCADE CONSTRAINT;
DROP TABLE LIBRO_AUTOR CASCADE CONSTRAINT;
DROP TABLE LIBRO CASCADE CONSTRAINT;
DROP TABLE AUTOR CASCADE CONSTRAINT;
DROP TABLE TEMA CASCADE CONSTRAINT;

CREATE TABLE TEMA 
(
	cod_tema NUMBER (20),
	denominacion VARCHAR2 (30),
	cod_tema_padre NUMBER (20) NOT NULL,
	CONSTRAINT pk_tema PRIMARY KEY (cod_tema),
	CONSTRAINT fk_tema FOREIGN KEY (cod_tema_padre) REFERENCES TEMA(cod_tema)
);

CREATE TABLE AUTOR 
(
	cod_autor VARCHAR2 (30),
	nombre VARCHAR2 (30),
	f_nacimiento DATE,
	libro_principal VARCHAR2 (30) NOT NULL,
	CONSTRAINT pk_autor PRIMARY KEY (cod_autor)
);


CREATE TABLE LIBRO 
(
	cod_libro VARCHAR2(30),
	titulo VARCHAR2(30),
	f_creacion DATE,
	cod_tema NUMBER(30) NOT NULL,
	autor_principal VARCHAR2(30) NOT NULL,
	CONSTRAINT pk_libro PRIMARY KEY (cod_libro),
	CONSTRAINT fk1_libro FOREIGN KEY (cod_tema) REFERENCES TEMA(cod_tema)
	
);

CREATE TABLE LIBRO_AUTOR
(
	cod_libro VARCHAR2 (30),
	cod_autor VARCHAR2 (30) NOT NULL,
	orden VARCHAR2 (30),
	CONSTRAINT pk_libro_autor PRIMARY KEY (cod_libro, cod_autor),
	CONSTRAINT fk_libro_autor FOREIGN KEY (cod_libro) REFERENCES LIBRO(cod_libro),
	CONSTRAINT fk1_libro_autor FOREIGN KEY (cod_autor) REFERENCES AUTOR(cod_autor)
	
);

CREATE TABLE EDITORIAL
(
	cod_editorial VARCHAR2(30),
	denominacion VARCHAR2(30),
	CONSTRAINT pk_editorial PRIMARY KEY (cod_editorial)
);

CREATE TABLE PUBLICACIONES
(
	cod_editorial VARCHAR2(30),
	cod_libro VARCHAR2(30) NOT NULL,
	precio NUMBER(5,2),
	f_publicacion DATE DEFAULT SYSDATE,
	CONSTRAINT pk_publicaciones PRIMARY KEY (cod_editorial, cod_libro),
	CONSTRAINT fk1_publicaciones FOREIGN KEY (cod_libro) REFERENCES LIBRO(cod_libro),
	CONSTRAINT fk2_publicaciones FOREIGN KEY (cod_editorial) REFERENCES EDITORIAL(cod_editorial) ON DELETE CASCADE

);



ALTER TABLE AUTOR ADD CONSTRAINT fk1_autor FOREIGN KEY (libro_principal) REFERENCES LIBRO(cod_libro);
ALTER TABLE LIBRO ADD CONSTRAINT fk2_libro FOREIGN KEY (autor_principal) REFERENCES AUTOR(cod_autor);

ALTER TABLE LIBRO_AUTOR ADD CONSTRAINT ck1_libro_autor CHECK (orden BETWEEN 1 AND 5);
ALTER TABLE TEMA ADD CONSTRAINT ck1_tema CHECK (cod_tema<cod_tema_padre);
ALTER TABLE PUBLICACIONES ADD CONSTRAINT ck1_publicaciones CHECK (precio>0);







