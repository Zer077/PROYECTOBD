
--Trabajo BD 

DROP TABLE MATRICULADO;
DROP TABLE IMPARTE;
DROP TABLE ASIGNATURA;
DROP TABLE ALUMNO;
DROP TABLE PROFESOR;
DROP TABLE PROVINCIA;
DROP TABLE AUDITORIA;

CREATE TABLE PROVINCIA 
(
	ID_PROV NUMBER NOT NULL , 
	NOMBRE VARCHAR2(100) NOT NULL , 
	CONSTRAINT PK_PROVINCIA PRIMARY KEY (ID_PROV)
);
  
CREATE TABLE PROFESOR 
(	
	ID_PROF NUMBER NOT NULL , 
	NOMBRE VARCHAR2(100) NOT NULL , 
	APELLIDOS VARCHAR2(100) NOT NULL , 
	DNI VARCHAR(9) NOT NULL,
	NACIDO_EN NUMBER, 
	CONSTRAINT PK_PROFESOR PRIMARY KEY (ID_PROF),
  CONSTRAINT FK_PROFESOR_PROVINCIA FOREIGN KEY (NACIDO_EN) REFERENCES PROVINCIA (ID_PROV) 
);
  

CREATE TABLE ALUMNO 
(	
	ID_ALUM NUMBER NOT NULL , 
	DNI VARCHAR2(9) NOT NULL , 
	NOMBRE VARCHAR2(100) NOT NULL , 
	APELLIDOS VARCHAR2(100) NOT NULL , 
	FECHA_NAC DATE, 
	NACIDO_EN NUMBER, 
	CONSTRAINT PK_ALUMNO PRIMARY KEY (ID_ALUM),
	CONSTRAINT FK_ALUMNO_PROVICIA FOREIGN KEY (NACIDO_EN) REFERENCES PROVINCIA (ID_PROV) 
);


CREATE TABLE ASIGNATURA 
(
	ID_ASIG NUMBER NOT NULL , 
	NOMBRE VARCHAR2(100) NOT NULL , 
	CONSTRAINT PK_ASIGNATURA PRIMARY KEY (ID_ASIG)
);
  

CREATE TABLE IMPARTE 
(	
	ID_PROF NUMBER NOT NULL , 
	ID_ASIG NUMBER NOT NULL , 
	CONSTRAINT PK_IMPARTE PRIMARY KEY (ID_PROF, ID_ASIG), 
	CONSTRAINT FK_IMPARTE_PROFESOR FOREIGN KEY (ID_PROF) REFERENCES PROFESOR (ID_PROF) ON DELETE CASCADE , 
	CONSTRAINT FK_IMPARTE_ASIGNATURA FOREIGN KEY (ID_ASIG) REFERENCES ASIGNATURA (ID_ASIG) ON DELETE CASCADE 
);

CREATE TABLE MATRICULADO
(
	ID_ALUM NUMBER NOT NULL, 
	ID_ASIG NUMBER NOT NULL, 
	NOTA1 NUMBER(4,2),
    FECHA1 DATE,
	NOTA2 NUMBER(4,2),
    FECHA2 DATE,
	NOTA3 NUMBER(4,2),
    FECHA3 DATE,
	CONSTRAINT PK_MATRICULADO PRIMARY KEY (ID_ALUM, ID_ASIG),
  CONSTRAINT FK_MATRICULADO_ASIGNATURA FOREIGN KEY (ID_ASIG) REFERENCES ASIGNATURA (ID_ASIG) ON DELETE CASCADE , 
	CONSTRAINT FK_MATRICULADO_ALUMNO FOREIGN KEY (ID_ALUM) REFERENCES ALUMNO (ID_ALUM) ON DELETE CASCADE
);

CREATE TABLE AUDITORIA(
    TABLA VARCHAR2(100),
    USUARIO VARCHAR2(100),
    FECHA DATE,
    TIPO VARCHAR2(100),
    ANTIGUOSDATOS VARCHAR2(4000),
    NUEVOSDATOS VARCHAR2(4000)
);


INSERT INTO PROVINCIA (ID_PROV, NOMBRE) VALUES (1, 'Almeria');
INSERT INTO PROVINCIA (ID_PROV, NOMBRE) VALUES (2, 'Cadiz');
INSERT INTO PROVINCIA (ID_PROV, NOMBRE) VALUES (3, 'Cordoba');
INSERT INTO PROVINCIA (ID_PROV, NOMBRE) VALUES (4, 'Granada');
INSERT INTO PROVINCIA (ID_PROV, NOMBRE) VALUES (5, 'Huelva');
INSERT INTO PROVINCIA (ID_PROV, NOMBRE) VALUES (6, 'Jaen');
INSERT INTO PROVINCIA (ID_PROV, NOMBRE) VALUES (7, 'Malaga');
INSERT INTO PROVINCIA (ID_PROV, NOMBRE) VALUES (8, 'Sevilla');

INSERT INTO PROFESOR (ID_PROF, NOMBRE, APELLIDOS, NACIDO_EN, DNI) VALUES (1, 'Alvaro', 'Acebedo', 8, '78293485F');
INSERT INTO PROFESOR (ID_PROF, NOMBRE, APELLIDOS, NACIDO_EN, DNI) VALUES (2, 'Manuel', 'Gutierrez', 2, '69298485J');
INSERT INTO PROFESOR (ID_PROF, NOMBRE, APELLIDOS, NACIDO_EN, DNI) VALUES (3, 'Celia', 'Villa', 8, '23293465L');
INSERT INTO PROFESOR (ID_PROF, NOMBRE, APELLIDOS, NACIDO_EN, DNI) VALUES (4, 'Maria', 'Mu�oz', 3, '19298885N');

INSERT INTO ALUMNO (ID_ALUM, DNI, NOMBRE, APELLIDOS, FECHA_NAC, NACIDO_EN) VALUES (1, '28756358V', 'Juan', 'Veloso', TO_DATE('11/02/1977','DD/MM/YYYY'), 8);
INSERT INTO ALUMNO (ID_ALUM, DNI, NOMBRE, APELLIDOS, FECHA_NAC, NACIDO_EN) VALUES (2, '28956157L', 'Sonia', 'Sanchez', TO_DATE('24/08/1981','DD/MM/YYYY'), 8);
INSERT INTO ALUMNO (ID_ALUM, DNI, NOMBRE, APELLIDOS, FECHA_NAC, NACIDO_EN) VALUES (3, '27568011D', 'Cristina', 'Abascal', TO_DATE('08/06/1980','DD/MM/YYYY'), 2);
INSERT INTO ALUMNO (ID_ALUM, DNI, NOMBRE, APELLIDOS, FECHA_NAC, NACIDO_EN) VALUES (4, '28754685C', 'Manuel', 'Perez', TO_DATE('04/06/1974','DD/MM/YYYY'), 8);
INSERT INTO ALUMNO (ID_ALUM, DNI, NOMBRE, APELLIDOS, FECHA_NAC, NACIDO_EN) VALUES (5, '28546821Y', 'Manuel', 'Bueno', TO_DATE('19/12/1985','DD/MM/YYYY'), 2);
INSERT INTO ALUMNO (ID_ALUM, DNI, NOMBRE, APELLIDOS, FECHA_NAC, NACIDO_EN) VALUES (6, '27656981Y', 'Jose Antonio', 'Montero', TO_DATE('25/07/1990','DD/MM/YYYY'), 3);
INSERT INTO ALUMNO (ID_ALUM, DNI, NOMBRE, APELLIDOS, FECHA_NAC, NACIDO_EN) VALUES (7, '58324542B', 'Juan Jose', 'Sanchez', TO_DATE('01/11/1992','DD/MM/YYYY'), 2);
INSERT INTO ALUMNO (ID_ALUM, DNI, NOMBRE, APELLIDOS, FECHA_NAC, NACIDO_EN) VALUES (8, '56846315M', 'Sandra', 'Valles', TO_DATE('05/01/1985','DD/MM/YYYY'), 3);
INSERT INTO ALUMNO (ID_ALUM, DNI, NOMBRE, APELLIDOS, FECHA_NAC, NACIDO_EN) VALUES (9, '28468215X', 'Sara', 'Merida', TO_DATE('09/09/1986','DD/MM/YYYY'), 8);
INSERT INTO ALUMNO (ID_ALUM, DNI, NOMBRE, APELLIDOS, FECHA_NAC, NACIDO_EN) VALUES (10, '27684214Z', 'Laura', 'Gutierrez', TO_DATE('9/04/1987','DD/MM/YYYY'), 8);
INSERT INTO ALUMNO (ID_ALUM, DNI, NOMBRE, APELLIDOS, FECHA_NAC, NACIDO_EN) VALUES (11, '28896443S', 'Inmaculada', 'Garcia', TO_DATE('21/03/1989','DD/MM/YYYY'), 8);

INSERT INTO ASIGNATURA (ID_ASIG, NOMBRE) VALUES (1, 'Redes');
INSERT INTO ASIGNATURA (ID_ASIG, NOMBRE) VALUES (2, 'Sistemas');
INSERT INTO ASIGNATURA (ID_ASIG, NOMBRE) VALUES (3, 'Ingles');

INSERT INTO IMPARTE (ID_PROF, ID_ASIG) VALUES (1, 1);
INSERT INTO IMPARTE (ID_PROF, ID_ASIG) VALUES (2, 1);
INSERT INTO IMPARTE (ID_PROF, ID_ASIG) VALUES (3, 2);

INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (1, 1, 4, 6, 8);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (2, 1, 5, 5, 5);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (2, 3, 10, 9, 7);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (3, 1, 10, 8, 9);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (4, 1, 3, 3, 4);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (4, 3, 0, 0, 0);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (5, 1, 1, 4, 8);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (5, 3, 8, 4, 4);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (6, 1, 5, 2, 7);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (7, 1, 5, 5, 5);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (7, 2, 7, 5, 6);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (7, 3, 6, 7, 7);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (8, 1, 4, 6, 5);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (8, 2, 4, 5, 6);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (9, 2, 7, 7, 7);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (9, 3, 6, 7, 8);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3) VALUES (10, 2, 9, 5, 5);
INSERT INTO MATRICULADO (ID_ALUM, ID_ASIG, NOTA1,FECHA1, NOTA2,FECHA2, NOTA3, FECHA3) VALUES (11, 1, 9,'12/04/2019', 5,'12/04/2019', 5,'12/04/2019' );


COMMIT;





--PROCEDIMIENTO DE QUE INSERTAR


/*Procedimiento que permite elegir que queremos insertar, llama a las funciones y estas insertan los datos en la tabla.*/
CREATE OR REPLACE PROCEDURE INSERTARDATOS (OPCION NUMBER) IS

BEGIN
CASE OPCION
WHEN 1 THEN
IF ALUMNOS (17, '12345678Q', 'Manuel', 'Fern�ndez', '19/10/1984', 1)=TRUE THEN 
    DBMS_OUTPUT.PUT_LINE ('El alumno se ha insertado correctamente');
ELSE 
    DBMS_OUTPUT.PUT_LINE ('El alumno no se ha podido insertar');
END IF;
WHEN 2 THEN
IF PROFESORES (5, 'Joaqu�n', 'S�nchez', '12345678J', 3)=TRUE THEN
    DBMS_OUTPUT.PUT_LINE ('El profesor se ha insertado correctamente');
ELSE
    DBMS_OUTPUT.PUT_LINE ('El profesor no se ha podido insertar');
END IF;
WHEN 3 THEN
IF MATRICULADOS (11, 3, 4, 6, 6)=TRUE THEN
    DBMS_OUTPUT.PUT_LINE ('Se ha matriculado correctamente');
ELSE 
    DBMS_OUTPUT.PUT_LINE ('No se ha podido matricular');
END IF;
END CASE;
END INSERTARDATOS;
/




--FUNCION DE INSERTAR ALUMNO***abraham***


CREATE OR REPLACE FUNCTION ALUMNOS (ID_ALUM NUMBER, DNI VARCHAR2, NOMBRE VARCHAR2, APELLIDOS VARCHAR2, FECHA_NAC DATE, NACIDO_EN NUMBER)
RETURN BOOLEAN IS
BEGIN
INSERT INTO ALUMNO VALUES (ID_ALUM, DNI, NOMBRE, APELLIDOS, FECHA_NAC, NACIDO_EN);

RETURN TRUE;

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN 
        DBMS_OUTPUT.PUT_LINE ('El alumno no se ha podido insertar');
    WHEN VALUE_ERROR THEN 
        DBMS_OUTPUT.PUT_LINE ('El alumno no se ha podido insertar');       
END ALUMNOS;
/





--FUNCION DE INSERTAR PROFESOR

/*Funci�n que permite insertar datos en la tabla "profesor", se le pasar�n unos par�metros que introduce el usuario y estos
son los que se insertan en la tabla.*/***abraham***
CREATE OR REPLACE FUNCTION PROFESORES (ID_PROF NUMBER, NOMBRE VARCHAR2, APELLIDOS VARCHAR2, DNI VARCHAR2, NACIDO_EN NUMBER)
RETURN BOOLEAN IS
BEGIN
INSERT INTO PROFESOR VALUES (ID_PROF, NOMBRE, APELLIDOS, DNI, NACIDO_EN);
RETURN TRUE;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN 
        DBMS_OUTPUT.PUT_LINE ('El alumno no se ha podido insertar');
    WHEN VALUE_ERROR THEN 
        DBMS_OUTPUT.PUT_LINE ('El alumno no se ha podido insertar');
END PROFESORES;
/







--FUNCION DE INSERTAR MATRICULADO

/*Funci�n que permite insertar datos en la tabla "matriculado", se le pasar�n unos par�metros que introduce el usuario y estos
son los que se insertan en la tabla.*/***abraham***
CREATE OR REPLACE FUNCTION MATRICULADOS (ID_ALUM NUMBER, ID_ASIG NUMBER, NOTA1 NUMBER, NOTA2 NUMBER, NOTA3 NUMBER)
RETURN BOOLEAN IS
BEGIN
INSERT INTO MATRICULADO VALUES (ID_ALUM, ID_ASIG, NOTA1, NOTA2, NOTA3);
RETURN TRUE;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN 
        DBMS_OUTPUT.PUT_LINE ('El alumno no se ha podido insertar');
    WHEN VALUE_ERROR THEN 
        DBMS_OUTPUT.PUT_LINE ('El alumno no se ha podido insertar');
END MATRICULADOS;
/








--permite modificar la nota siempre que no hayan pasado 7 dias o en caso contrario que seas director*****Jose Angel Atoche****
CREATE OR REPLACE PROCEDURE CAMBIODENOTA(ALUMNO NUMBER, ASIGNATURA NUMBER, OPCION NUMBER, NOTA NUMBER) IS 


    FECHA DATE;
    CURSOR FECHAN1 IS
        SELECT FECHA1 FROM MATRICULADO WHERE ID_ALUM=ALUMNO AND ID_ASIG=ASIGNATURA;
    REGISTRO1 FECHAN1%ROWTYPE;

    CURSOR FECHAN2 IS
       SELECT FECHA2 FROM MATRICULADO WHERE ID_ALUM=ALUMNO AND ID_ASIG=ASIGNATURA;
    REGISTRO2 FECHAN2%ROWTYPE;

    CURSOR FECHAN3 IS
        SELECT FECHA3 FROM MATRICULADO WHERE ID_ALUM=ALUMNO AND ID_ASIG=ASIGNATURA;
    REGISTRO3 FECHAN3%ROWTYPE;

BEGIN

    CASE

        WHEN OPCION=1 THEN
            OPEN FECHAN1;
                FETCH FECHAN1 INTO REGISTRO1;
                FECHA:= REGISTRO1.FECHA1;
            CLOSE FECHAN1;
            
        WHEN OPCION=2 THEN 
            OPEN FECHAN2;
                FETCH FECHAN2 INTO REGISTRO2;
                FECHA:= REGISTRO2.FECHA2;
            CLOSE FECHAN2;


        WHEN OPCION=3 THEN 
            OPEN FECHAN3;
                FETCH FECHAN3 INTO REGISTRO3;
                FECHA:= REGISTRO3.FECHA3;
            CLOSE FECHAN3;


    END CASE;

    IF(COMPROBACIONFECHAYUSUARIO(FECHA)=TRUE) THEN

        CASE

            WHEN OPCION=1 THEN UPDATE MATRICULADO SET NOTA1=NOTA WHERE ID_ALUM=ALUMNO;   
COMMIT;
            WHEN OPCION=2 THEN UPDATE MATRICULADO SET NOTA2=NOTA WHERE ID_ALUM=ALUMNO;  
COMMIT;
            WHEN OPCION=3 THEN UPDATE MATRICULADO SET NOTA3=NOTA WHERE ID_ALUM=ALUMNO;  
COMMIT;

        END CASE;

    END IF;

EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('introducte los datos correctamente por favor');

END CAMBIODENOTA;
/



CREATE OR REPLACE FUNCTION COMPROBACIONFECHAYUSUARIO(FECHA DATE)
RETURN BOOLEAN IS
BEGIN

    IF (USER='DIRECTOR') THEN
            RETURN TRUE;
    END IF;     
        
    IF (SYSDATE BETWEEN FECHA AND FECHA+7 ) THEN
        RETURN TRUE;
    ELSE              
        RETURN FALSE;
    END IF;
 
END COMPROBACIONFECHAYUSUARIO;
/




















--VER DATOS DE LA TABLA QUE se PIDA*****Jose Angel Atoche****

CREATE OR REPLACE PROCEDURE VERTABLA(V1 NUMBER) IS

    CURSOR N1 IS SELECT ID_PROV ,NOMBRE  FROM PROVINCIA;
    CURSOR N2 IS SELECT ID_PROF ,NOMBRE ,APELLIDOS ,DNI ,NACIDO_EN  FROM PROFESOR;
    CURSOR N3 IS SELECT ID_ALUM ,DNI ,NOMBRE ,APELLIDOS ,FECHA_NAC ,NACIDO_EN  FROM ALUMNO;
    CURSOR N4 IS SELECT ID_ALUM ,ID_ASIG ,NOTA1 ,FECHA1 ,NOTA2 ,FECHA2 ,NOTA3 ,FECHA3  FROM MATRICULADO;
    CURSOR N5 IS SELECT ID_ASIG ,NOMBRE  FROM ASIGNATURA;
    CURSOR N6 IS SELECT ID_PROF ,ID_ASIG  FROM IMPARTE;
    REGISTRO1 N1%ROWTYPE;
    REGISTRO2 N2%ROWTYPE;
    REGISTRO3 N3%ROWTYPE;
    REGISTRO4 N4%ROWTYPE;
    REGISTRO5 N5%ROWTYPE;
    REGISTRO6 N6%ROWTYPE;

BEGIN
        DBMS_OUTPUT.PUT_LINE ('1.PROVINCIA');
        DBMS_OUTPUT.PUT_LINE ('2.PROFESOR');
        DBMS_OUTPUT.PUT_LINE ('3.ALUMNO');
        DBMS_OUTPUT.PUT_LINE ('4.MATRICULADO');
        DBMS_OUTPUT.PUT_LINE ('5.ASIGNATURA');
        DBMS_OUTPUT.PUT_LINE ('6.IMPARTE');
        
        CASE
            WHEN V1=1 THEN 
                OPEN N1;
                    LOOP
                    FETCH N1 INTO REGISTRO1;
                        EXIT  WHEN N1%NOTFOUND;
                        DBMS_OUTPUT.PUT_LINE ('provincia: ' || REGISTRO1.ID_PROV || ' nombre: '|| REGISTRO1.NOMBRE);
                    END LOOP;
                CLOSE N1;

            WHEN V1=2 THEN 
                OPEN N2;
                    LOOP
                        FETCH N2 INTO REGISTRO2;
                        EXIT  WHEN N2%NOTFOUND;
                        DBMS_OUTPUT.PUT_LINE('ID: '||REGISTRO2.ID_PROF || ' nombre: '||REGISTRO2.NOMBRE || ' APELLIDO: '||REGISTRO2.APELLIDOS || ' DNI: '||REGISTRO2.DNI || ' Nacido en: '||REGISTRO2.NACIDO_EN);
                    END LOOP;

                CLOSE N2;

            WHEN V1=3 THEN 
                OPEN N3;

                    LOOP
                        FETCH N3 INTO REGISTRO3;
                        EXIT  WHEN N3%NOTFOUND;
                        DBMS_OUTPUT.PUT_LINE('ID: '||REGISTRO3.ID_ALUM  || ' DNI: '||REGISTRO3.DNI || ' nombre: '|| REGISTRO3.NOMBRE || ' APELLIDO: '||REGISTRO3.APELLIDOS || ' FECHA: '||REGISTRO3.FECHA_NAC || ' NACIDO EN: '||REGISTRO3.NACIDO_EN);
                    END LOOP;

                CLOSE N3;

            WHEN V1=4 THEN 
            OPEN N4;

                LOOP
                    FETCH N4 INTO REGISTRO4;
                    EXIT  WHEN N4%NOTFOUND;
                    DBMS_OUTPUT.PUT_LINE('ID ALUMNO: '||REGISTRO4.ID_ALUM || ' ID ASIGNATURA: '||REGISTRO4.ID_ASIG || ' NOTA1: '||REGISTRO4.NOTA1 || ' FECHA1: '||REGISTRO4.FECHA1 ||' nOTA2: '|| REGISTRO4.NOTA2 || ' FECHA2: '||REGISTRO4.FECHA2 || ' noTA3: '||REGISTRO4.NOTA3 || ' FECHA3: '||REGISTRO4.FECHA3);
                END LOOP;

            CLOSE N4;          

            WHEN V1=5 THEN 
                OPEN N5;

                    LOOP
                        FETCH N5 INTO REGISTRO5;
                        EXIT  WHEN N5%NOTFOUND;
                        DBMS_OUTPUT.PUT_LINE('ID ASIGNATURA: '||REGISTRO5.ID_ASIG || ' nombre: '||REGISTRO5.NOMBRE);
                    END LOOP;

                CLOSE N5;

            WHEN V1=6 THEN 
                OPEN N6;

                    LOOP
                        FETCH N6 INTO REGISTRO6;
                        EXIT  WHEN N6%NOTFOUND;
                        DBMS_OUTPUT.PUT_LINE('ID PROFESOR: '||REGISTRO6.ID_PROF || ' ID ASIGNATURA: '||REGISTRO6.ID_ASIG);
                    END LOOP;

                CLOSE N6;

            ELSE DBMS_OUTPUT.PUT_LINE('Numero invalido');
        END CASE;

EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Numero invalido');


END VERTABLA;
/






--Saca los porcentajes de aprobados y suspensos de la asignatura*****Jose Angel Atoche****
CREATE OR REPLACE PROCEDURE PORCENTAJES(ASIGNATURAELEGIDA VARCHAR2) IS 

    TOTAL NUMBER(20);
    SUSPENSOS NUMBER(20):=0;
    APROBADOS NUMBER(20):=0;
    
    CURSOR ALUMNOSNOTA IS
        SELECT A.ID_ALUM, SUM(NOTA1+NOTA2+NOTA3)/3 AS NOTAFINAL FROM MATRICULADO M, ALUMNO A WHERE ID_ASIG=ASIGNATURAELEGIDA AND A.ID_ALUM=M.ID_ALUM GROUP BY A.ID_ALUM;
    REGISTRO ALUMNOSNOTA%ROWTYPE;

    --llamar funcion nota media con alumno y asignatura
    CURSOR ALUMNOSTOTALES IS
    SELECT COUNT(A.ID_ALUM) AS TOTALES FROM MATRICULADO M, ALUMNO A WHERE ID_ASIG=ASIGNATURAELEGIDA AND A.ID_ALUM=M.ID_ALUM;
    REGISTRO1 ALUMNOSTOTALES%ROWTYPE;


BEGIN

    OPEN ALUMNOSTOTALES;
    
        FETCH ALUMNOSTOTALES INTO REGISTRO1;
        TOTAL:=REGISTRO1.TOTALES;
        
    CLOSE ALUMNOSTOTALES;

    OPEN ALUMNOSNOTA;
    
        LOOP
            FETCH ALUMNOSNOTA INTO REGISTRO;
            EXIT WHEN ALUMNOSNOTA%NOTFOUND;
            IF (REGISTRO.NOTAFINAL>=5) THEN
                APROBADOS:=APROBADOS+1;
            ELSE SUSPENSOS:=SUSPENSOS+1;
            END IF;
        END LOOP;

    CLOSE ALUMNOSNOTA;
    

    DBMS_OUTPUT.PUT_LINE('aprobado: '|| (APROBADOS/TOTAL)*100 || '%');
    DBMS_OUTPUT.PUT_LINE('suspensos: '|| (SUSPENSOS/TOTAL)*100 || '%');

EXCEPTION
    WHEN  OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('errror inesperado ');

END PORCENTAJES;
/









--Auditorias, inserta en una auditoria la tabla editada, como fue editada, el usuario y hora de edicion y nuevos y antiguos datos*****jose angel atoche*****


CREATE OR REPLACE TRIGGER AUDITORIAALUMNO
AFTER INSERT OR  DELETE OR UPDATE  ON ALUMNO
FOR EACH ROW
BEGIN
IF UPDATING THEN
	INSERT INTO AUDITORIA VALUES ('ALUMNO', USER, SYSDATE,'UPDATE',  :OLD.ID_ALUM || ' ' || :OLD.NOMBRE || ' ' || :OLD.APELLIDOS || ' ' || :OLD.DNI || ' ' || :OLD.FECHA_NAC || ' ' || :OLD.NACIDO_EN, :NEW.NOMBRE || ' ' || :NEW.DNI || ' ' || :NEW.APELLIDOS || ' ' || :NEW.FECHA_NAC || ' ' || :NEW.NACIDO_EN );
COMMIT;
END IF;

IF DELETING THEN
	INSERT INTO AUDITORIA VALUES ('ALUMNO', USER, SYSDATE,'DELETE',  :OLD.ID_ALUM || ' ' || :OLD.NOMBRE || ' ' || :OLD.APELLIDOS || ' ' || :OLD.DNI || ' ' || :OLD.FECHA_NAC || ' ' || :OLD.NACIDO_EN, :NEW.NOMBRE || ' ' || :NEW.DNI || ' ' || :NEW.APELLIDOS || ' ' || :NEW.FECHA_NAC || ' ' || :NEW.NACIDO_EN );
COMMIT;
END IF;

IF INSERTING THEN
	INSERT INTO AUDITORIA  VALUES ('ALUMNO', USER, SYSDATE,'INSERT', :OLD.ID_ALUM || ' ' || :OLD.NOMBRE || ' ' || :OLD.APELLIDOS || ' ' || :OLD.DNI || ' ' || :OLD.FECHA_NAC || ' ' || :OLD.NACIDO_EN, :NEW.NOMBRE || ' ' || :NEW.DNI || ' ' || :NEW.APELLIDOS || ' ' || :NEW.FECHA_NAC || ' ' || :NEW.NACIDO_EN );
COMMIT;
END IF;

END AUDITORIAALUMNO;
/



CREATE OR REPLACE TRIGGER AUDITORIAPROFESOR
AFTER INSERT OR  DELETE OR UPDATE  ON PROFESOR
FOR EACH ROW

BEGIN
    IF UPDATING THEN
        INSERT INTO AUDITORIA VALUES ('PROFESOR', USER, SYSDATE,'UPDATE', :OLD.ID_PROF  || ' ' ||  :OLD.NOMBRE ||' '||:OLD.APELLIDOS  || ' ' ||  :OLD.DNI  || ' ' || :OLD.NACIDO_EN,    :NEW.ID_PROF  || ' ' ||  :NEW.NOMBRE || ' ' ||  :OLD.APELLIDOS  || ' ' ||  :NEW.DNI  || ' ' || :NEW.NACIDO_EN);
    COMMIT;
END IF;
    
    IF DELETING THEN
        INSERT INTO AUDITORIA VALUES ('PROFESOR', USER, SYSDATE,'DELETE',  :OLD.ID_PROF  || ' ' ||  :OLD.NOMBRE ||' '||:OLD.APELLIDOS  || ' ' ||  :OLD.DNI  || ' ' || :OLD.NACIDO_EN,    :NEW.ID_PROF  || ' ' ||  :NEW.NOMBRE || ' ' ||  :OLD.APELLIDOS  || ' ' ||  :NEW.DNI  || ' ' || :NEW.NACIDO_EN);
    COMMIT;
END IF;
    
    IF INSERTING THEN
        INSERT INTO AUDITORIA VALUES ('PROFESOR', USER, SYSDATE,'INSERT',  :OLD.ID_PROF  || ' ' ||  :OLD.NOMBRE ||' '||:OLD.APELLIDOS  || ' ' ||  :OLD.DNI  || ' ' || :OLD.NACIDO_EN,    :NEW.ID_PROF  || ' ' ||  :NEW.NOMBRE || ' ' ||  :OLD.APELLIDOS  || ' ' ||  :NEW.DNI  || ' ' || :NEW.NACIDO_EN);
    COMMIT;
END IF;

END AUDITORIAPROFESOR;
/



CREATE OR REPLACE TRIGGER AUDITORIAPROVINCIA
AFTER INSERT OR  DELETE OR UPDATE  ON PROVINCIA
FOR EACH ROW

BEGIN
    IF UPDATING THEN
        INSERT INTO AUDITORIA VALUES ('PROVINCIA', USER, SYSDATE,'UPDATE', :OLD.ID_PROV   || ' ' ||  :OLD.NOMBRE,  :NEW.ID_PROV || ' ' || :NEW.NOMBRE );
    COMMIT;
END IF;
    
    IF DELETING THEN
        INSERT INTO AUDITORIA  VALUES ('PROVINCIA', USER, SYSDATE,'DELETE',  :OLD.ID_PROV   || ' ' ||  :OLD.NOMBRE,  :NEW.ID_PROV || ' ' || :NEW.NOMBRE );
    COMMIT;
END IF;
    
    IF INSERTING THEN
        INSERT INTO AUDITORIA VALUES ('PROVINCIA', USER, SYSDATE,'INSERT',  :OLD.ID_PROV   || ' ' ||  :OLD.NOMBRE,  :NEW.ID_PROV || ' ' || :NEW.NOMBRE );
    COMMIT;
END IF;

END AUDITORIAPROVINCIA;
/

CREATE OR REPLACE TRIGGER AUDITORIAASIGNATURA
AFTER INSERT OR  DELETE OR UPDATE  ON ASIGNATURA
FOR EACH ROW

BEGIN
    IF UPDATING THEN
        INSERT INTO AUDITORIA VALUES ('ASIGNATURA', USER, SYSDATE,'UPDATE',  :OLD.ID_ASIG   || ' ' ||  :OLD.NOMBRE,  :NEW.ID_ASIG || ' ' || :NEW.NOMBRE  );
   COMMIT;
 END IF;
    
    IF DELETING THEN
        INSERT INTO AUDITORIA  VALUES ('ASIGNATURA', USER, SYSDATE,'DELETE',   :OLD.ID_ASIG   || ' ' ||  :OLD.NOMBRE,  :NEW.ID_ASIG || ' ' || :NEW.NOMBRE );
   COMMIT;
 END IF;
    
    IF INSERTING THEN
        INSERT INTO AUDITORIA  VALUES ('ASIGNATURA', USER, SYSDATE,'INSERT',   :OLD.ID_ASIG   || ' ' ||  :OLD.NOMBRE,  :NEW.ID_ASIG || ' ' || :NEW.NOMBRE );
  COMMIT;
  END IF;

END AUDITORIAASIGNATURA;
/

CREATE OR REPLACE TRIGGER AUDITORIAMATRICULADO
AFTER INSERT OR  DELETE OR UPDATE  ON MATRICULADO
FOR EACH ROW

BEGIN
    IF UPDATING THEN
        INSERT INTO AUDITORIA  VALUES ('MATRICULADO', USER, SYSDATE,'UPDATE', :OLD.ID_ALUM || ' ' || :OLD.ID_ASIG  || ' ' || :OLD.NOTA1  || ' ' || :OLD.FECHA1  || ' ' || :OLD.NOTA2  || ' ' || :OLD.FECHA2  || ' ' || :OLD.NOTA3  || ' ' || :OLD.FECHA3,     :NEW.ID_ALUM || ' ' || :NEW.ID_ASIG  || ' ' || :NEW.NOTA1  || ' ' || :NEW.FECHA1  || ' ' || :NEW.NOTA2  || ' ' || :NEW.FECHA2  || ' ' || :NEW.NOTA3  || ' ' || :NEW.FECHA3);
   COMMIT;
 END IF;
    
    IF DELETING THEN
        INSERT INTO AUDITORIA  VALUES ('MATRICULADO', USER, SYSDATE,'DELETE',  :OLD.ID_ALUM || ' ' || :OLD.ID_ASIG  || ' ' || :OLD.NOTA1  || ' ' || :OLD.FECHA1  || ' ' || :OLD.NOTA2  || ' ' || :OLD.FECHA2  || ' ' || :OLD.NOTA3  || ' ' || :OLD.FECHA3,     :NEW.ID_ALUM || ' ' || :NEW.ID_ASIG  || ' ' || :NEW.NOTA1  || ' ' || :NEW.FECHA1  || ' ' || :NEW.NOTA2  || ' ' || :NEW.FECHA2  || ' ' || :NEW.NOTA3  || ' ' || :NEW.FECHA3);
  COMMIT;
  END IF;
    
    IF INSERTING THEN
        INSERT INTO AUDITORIA  VALUES ('MATRICULADO', USER, SYSDATE,'INSERT',  :OLD.ID_ALUM || ' ' || :OLD.ID_ASIG  || ' ' || :OLD.NOTA1  || ' ' || :OLD.FECHA1  || ' ' || :OLD.NOTA2  || ' ' || :OLD.FECHA2  || ' ' || :OLD.NOTA3  || ' ' || :OLD.FECHA3,     :NEW.ID_ALUM || ' ' || :NEW.ID_ASIG  || ' ' || :NEW.NOTA1  || ' ' || :NEW.FECHA1  || ' ' || :NEW.NOTA2  || ' ' || :NEW.FECHA2  || ' ' || :NEW.NOTA3  || ' ' || :NEW.FECHA3);
   COMMIT;
 END IF;

END AUDITORIAMATRICULADO;
/

CREATE OR REPLACE TRIGGER AUDITORIAIMPARTE
AFTER INSERT OR  DELETE OR UPDATE  ON IMPARTE
FOR EACH ROW


BEGIN
    IF UPDATING THEN
        INSERT INTO AUDITORIA  VALUES ('IMPARTE', USER, SYSDATE,'UPDATE',  :OLD.ID_PROF || ' ' || :OLD.ID_ASIG,  :NEW.ID_PROF || ' ' || :NEW.ID_ASIG);
  COMMIT;
  END IF;
    
    IF DELETING THEN
        INSERT INTO AUDITORIA   VALUES ('IMPARTE', USER, SYSDATE,'DELETE', :OLD.ID_PROF || ' ' || :OLD.ID_ASIG,  :NEW.ID_PROF || ' ' || :NEW.ID_ASIG);
  COMMIT;
  END IF;
    
    IF INSERTING THEN
        INSERT INTO AUDITORIA   VALUES ('IMPARTE', USER, SYSDATE,'INSERT', :OLD.ID_PROF || ' ' || :OLD.ID_ASIG,  :NEW.ID_PROF || ' ' || :NEW.ID_ASIG);
 COMMIT;.
   END IF;

END AUDITORIAIMPARTE;
/














--7         

/*Funci�n que devuelve la nota media de un alumno en una asignatura, se introducir�n los valores del nombre y apellido del alumno, y la asignatura deseada*/
CREATE OR REPLACE FUNCTION NOTA_MEDIA_ALUM (NOM_ALU VARCHAR2, APE_ALU VARCHAR2, ASIG VARCHAR2)
RETURN VARCHAR2 IS
    ID_ALUM NUMBER(2);
    ALUMNO VARCHAR2(40);
    ASIGNATURA VARCHAR2(20);
    NOTA NUMBER(4,2);
    CURSOR C1 IS SELECT AL.ID_ALUM ,AL.APELLIDOS || ', ' || AL.NOMBRE AS ALUMNO, A.NOMBRE AS ASIGNATURA, ROUND((SUM(M.NOTA1+M.NOTA2+M.NOTA3)/3),2) AS NOTA_MEDIA
FROM ALUMNO AL, ASIGNATURA A, MATRICULADO M
    WHERE AL.ID_ALUM=M.ID_ALUM
    AND A.ID_ASIG=M.ID_ASIG
    AND AL.NOMBRE=NOM_ALU
    AND AL.APELLIDOS=APE_ALU
    AND A.NOMBRE=ASIG
    GROUP BY AL.ID_ALUM, AL.APELLIDOS, AL.NOMBRE, A.NOMBRE;
BEGIN
OPEN C1; 
LOOP
  FETCH C1 INTO ID_ALUM,ALUMNO,ASIGNATURA,NOTA;
  IF C1%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('DATOS INCORRECTOS');
    EXIT;    
  ELSE 
  RETURN ('ID: '||ID_ALUM||'   NOMBRE: '||ALUMNO||'   ASIGNATURA: '||ASIGNATURA||'   NOTA MEDIA: '||NOTA);
  END IF;
END LOOP;
CLOSE C1;
END NOTA_MEDIA_ALUM;
/



















/*Funci�n que devuelve el promedio de notas de todos los alumnos en una asignatura, se introducir� el nombre de la asignatura y nos devolver� los datos deseados*/***abraham***
CREATE OR REPLACE FUNCTION NOTA_MEDIA_ASIG (ASIG VARCHAR2)
RETURN VARCHAR2 IS
    ASIGNATURA VARCHAR2(20);
    NOTA NUMBER(4,2);
    CURSOR C1 IS SELECT A.NOMBRE AS ASIGNATURA, ROUND((SUM(M.NOTA1+M.NOTA2+M.NOTA3)/(COUNT(M.NOTA1)+COUNT(M.NOTA2)+COUNT(M.NOTA3))),2) AS NOTA_MEDIA_CLASE
                 FROM MATRICULADO M,ASIGNATURA A
                    WHERE A.ID_ASIG=M.ID_ASIG
                    AND A.NOMBRE=ASIG
                    GROUP BY A.NOMBRE;
BEGIN
OPEN C1; 
LOOP
  FETCH C1 INTO ASIGNATURA,NOTA;
  IF C1%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('DATOS INCORRECTOS');
    EXIT;    
  ELSE 
  RETURN ('ASIGNATURA: '||ASIGNATURA||'   NOTA MEDIA: '||NOTA);
  END IF;
END LOOP;
CLOSE C1;
END NOTA_MEDIA_ASIG ;
/



