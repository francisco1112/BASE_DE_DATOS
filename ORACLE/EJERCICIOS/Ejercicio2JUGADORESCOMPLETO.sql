CREATE TABLE EQUIPOS
(
	cod_equipo VARCHAR2 (4),
	nombre VARCHAR2 (30) NOT NULL,
	localidad VARCHAR2 (15),
	CONSTRAINT pk_equipos PRIMARY KEY (cod_equipo)
);

CREATE TABLE JUGADORES
(
	cod_jugador VARCHAR2 (4),
	nombre VARCHAR2 (30) NOT NULL,
	fecha_nacimiento DATE,
	demarcacion VARCHAR2 (10),
	cod_equipo VARCHAR2 (4),
	CONSTRAINT pk_jugadores PRIMARY KEY (cod_jugador),
	CONSTRAINT fk_jugadores FOREIGN KEY (cod_equipo) REFERENCES EQUIPOS(cod_equipo)
);

CREATE TABLE PARTIDOS
(
	cod_partido VARCHAR2 (4),
	cod_equipo_local VARCHAR2 (4),
	cod_equipo_visitante VARCHAR2 (4),
	fecha DATE,
	competicion VARCHAR2 (4),
	jornada VARCHAR2 (20),
	CONSTRAINT pk_partidos PRIMARY KEY (cod_partido),
	CONSTRAINT fk_partidos FOREIGN KEY (cod_equipo_local) REFERENCES EQUIPOS(cod_equipo),
	CONSTRAINT fk1_partidos FOREIGN KEY (cod_equipo_visitante) REFERENCES EQUIPOS(cod_equipo),
	CONSTRAINT ck_partidos CHECK ((EXTRACT(MONTH FROM fecha)!=7 AND EXTRACT(MONTH FROM fecha)!=8)),
	CONSTRAINT ck1_partidos CHECK (competicion LIKE  'Copa' OR  competicion LIKE 'Liga')
);

CREATE TABLE INCIDENCIAS
(
	num_incidencia VARCHAR2 (6) NOT NULL,
	cod_partido VARCHAR2 (4),
	cod_jugador VARCHAR2 (4),
	minuto NUMBER (2),
	tipo VARCHAR2 (20),
	CONSTRAINT pk_incidencias PRIMARY KEY (num_incidencia),
	CONSTRAINT fk_incidencias FOREIGN KEY (cod_partido) REFERENCES PARTIDOS(cod_partido),
	CONSTRAINT fk1_incidencias FOREIGN KEY (cod_jugador) REFERENCES JUGADORES(cod_jugador),
	CONSTRAINT ck_incidencias CHECK (minuto BETWEEN 1 AND 100)
);

ALTER TABLE JUGADORES ADD CONSTRAINT ck_jugadores CHECK (regexp_like (nombre, '^[A-Z]'));
ALTER TABLE JUGADORES ADD CONSTRAINT ck1_jugadores CHECK (demarcacion LIKE  'Portero' OR  demarcacion LIKE 'Defensa' OR demarcacion LIKE 'Medio' OR demarcacion LIKE 'Delantero');
ALTER TABLE EQUIPOS ADD CONSTRAINT ck_equipos CHECK (regexp_like (cod_equipo, '^[0-9]'));
ALTER TABLE EQUIPOS ADD goles_marcados NUMBER(3);

