DROP SCHEMA if exists isosceles;

CREATE DATABASE  if NOT exists isosceles;
USE isosceles;

CREATE TABLE if NOT exists isosceles.tipo_id (
		id_tipo INT NOT NULL AUTO_INCREMENT,
		tipo_id	VARCHAR (50) NOT NULL,
        PRIMARY KEY (id_tipo)
);

CREATE TABLE if NOT exists isosceles.pais (
		id_pais	INT NOT NULL AUTO_INCREMENT,
		pais 	VARCHAR (50) NOT NULL DEFAULT 'Sin Datos',
        PRIMARY KEY(id_pais)
);
	
    CREATE TABLE if NOT exists isosceles.region (
		id_region	INT NOT NULL AUTO_INCREMENT,
        id_pais INT NOT NULL,
		region	VARCHAR(100) NOT NULL DEFAULT 'Sin Datos',
        PRIMARY KEY (id_region)
);

CREATE TABLE if NOT exists isosceles.rubro(
		id_rubro  INT NOT NULL AUTO_INCREMENT,
        rubro  VARCHAR (50) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_rubro)
);

CREATE TABLE if NOT exists isosceles.tipo_cuenta(
		id_tipo_cuenta INT NOT NULL AUTO_INCREMENT,
        nomb_cuenta VARCHAR (50) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_tipo_cuenta)
);

CREATE TABLE if not exists isosceles.marca(
		id_marca INT NOT NULL AUTO_INCREMENT,
		nonb_marca	VARCHAR (50),
		PRIMARY KEY (id_marca)
);

CREATE TABLE if NOT exists isosceles.entidad_emisora(
		id_entidad INT NOT NULL AUTO_INCREMENT,
        nomb_entidad VARCHAR (50) NOT NULL DEFAULT 'Sin Datos',
        PRIMARY KEY (id_entidad)
);

	CREATE TABLE if NOT exists isosceles.tarjeta(
		id_tarjeta INT NOT NULL AUTO_INCREMENT,
        nomb_tarjeta VARCHAR (50) NOT NULL DEFAULT 'Sin DatosS',
        PRIMARY KEY (id_tarjeta)
);

	CREATE TABLE if NOT exists isosceles.tipo_tarjeta(
		id_tipo_tarjeta INT NOT NULL AUTO_INCREMENT,
        tipo_tarjeta VARCHAR (50) NOT NULL DEFAULT 'Sin Datos',
        PRIMARY KEY (id_tipo_tarjeta)
);

CREATE TABLE isosceles.producto(
		id_producto INT NOT NULL AUTO_INCREMENT,
        nomb_producto 	VARCHAR (100),
        sku VARCHAR (100) DEFAULT 'Sin sku',
		PRIMARY KEY (id_producto)
);

CREATE TABLE if NOT exists isosceles.usuario (
		id_usuario	INT NOT NULL AUTO_INCREMENT,
		id_tusuario		INT,
		nombre		VARCHAR(30) DEFAULT 'Sin Datos',
		apellido	VARCHAR(40) DEFAULT 'Sin Datos',
        fecha_nac	DATE,
        PRIMARY KEY (id_usuario)
);

CREATE TABLE IF NOT EXISTS isosceles.nomb_usuario (id_nomb_usuario INT NOT NULL AUTO_INCREMENT
,	id_usuario INT NOT NULL
,	nomb_usuario VARCHAR (150)
,	PRIMARY KEY (id_nomb_usuario)
);

CREATE TABLE IF NOT EXISTS isosceles.contrasena (id_contrasena INT NOT NULL AUTO_INCREMENT
,	id_usuario INT NOT NULL
,	contrasena 	VARCHAR (150)
, 	PRIMARY KEY (id_contrasena)
);

CREATE TABLE if NOT exists isosceles.info_personal (
		id_personal INT NOT NULL AUTO_INCREMENT,
        id_tipo INT NOT NULL,
        id_usuario	INT NOT NULL,
		num_personal	VARCHAR(30) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_personal)
);

 CREATE TABLE if NOT exists isosceles.domicilios (
		id_domi  INT NOT NULL AUTO_INCREMENT,
        id_usuario	INT NOT NULL,
        id_pais  INT NOT  NULL,
        id_region	INT NOT NULL,
        domicilio	VARCHAR(50) NOT NULL DEFAULT 'Sin Datos',
        codigo_post  VARCHAR (35),
        PRIMARY KEY (id_domi)
);

 CREATE TABLE if NOT exists isosceles.tipo_usuario (
		id_tusuario INT NOT NULL AUTO_INCREMENT,
        categoria  VARCHAR (100) NOT NULL,
        comision DECIMAL (5,2) DEFAULT '0.00',
        PRIMARY KEY (id_tusuario)
);

CREATE TABLE if NOT exists isosceles.info_finan_usuario(
		id_finan INT NOT NULL AUTO_INCREMENT,
        id_usuario INT NOT NULL,
        id_entidad INT NOT NULL,
        id_tipo_cuenta INT NOT NULL,
        num_cuenta VARCHAR (30) DEFAULT 'Sin Datos',
        alias VARCHAR (50) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_finan)
);

	CREATE TABLE if NOT exists isosceles.info_finan_tarjetas_usuario(
		id_info_tarjeta INT NOT NULL AUTO_INCREMENT,
        id_usuario INT NOT NULL,
        id_entidad INT NOT NULL,
        id_tipo_tarjeta INT NOT NULL,
        id_tarjeta INT NOT NULL,
        num_tarjeta VARCHAR (25) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_info_tarjeta)
);
	
  
 CREATE TABLE if NOT exists isosceles.contacto_tel(
		id_contacto INT NOT NULL AUTO_INCREMENT,
        id_usuario	INT,
        num_tel VARCHAR(30) DEFAULT 'Sin Datos',
        PRIMARY KEY (id_contacto)
);

CREATE TABLE if NOT exists isosceles.email_contacto(
		id_e_contacto INT NOT NULL AUTO_INCREMENT,
        id_usuario	INT,
        email VARCHAR (50) DEFAULT 'Noinformado@.ggggg',
        PRIMARY KEY (id_e_contacto)
);

CREATE TABLE if NOT exists categoria(
		id_categoria INT NOT NULL AUTO_INCREMENT,
        categoria VARCHAR (100) DEFAULT 'Sin Sub-rubro',
        PRIMARY KEY (id_categoria)
);

 CREATE TABLE if not exists isosceles.ingreso_pro(
		id_ingreso INT NOT NULL AUTO_INCREMENT,
		id_usuario INT NOT NULL,
		id_rubro INT NOT NULL,
        id_categoria INT NOT NULL,
        id_marca INT NOT NULL,
        id_producto  INT NOT NULL,
		unidades INT,
		precio DECIMAL (9,2),
		descripcion VARCHAR (200),
		PRIMARY KEY (id_ingreso)
);

CREATE TABLE if not exists isosceles.egreso_pro(
		id_engreso INT NOT NULL AUTO_INCREMENT,
		id_usuario INT NOT NULL,
		id_rubro INT NOT NULL,
        id_categoria INT NOT NULL,
        id_marca 	INT NOT NULL,
        id_producto INT NOT NULL,
        fpago	INT NOT NULL,
        envio 	INT NOT NULL,
        unidades INT,
		PRIMARY KEY (id_engreso)
);

DROP TABLE IF EXISTS isosceles.saldos_usuarios;
CREATE TABLE IF NOT EXISTS isosceles.saldos_usuarios (
	id_saldo INT NOT NULL AUTO_INCREMENT
,	id_usuario INT
,	saldo DECIMAL (9,2)
,	PRIMARY KEY (id_saldo)
);

USE isosceles;
DROP TABLE IF EXISTS historico_retiros_usuarios;
CREATE TABLE IF NOT EXISTS isosceles.historico_retiros_usuarios (id_historico INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,	id_usuario INT
,	id_finan INT
,	saldo_viejo DECIMAL (9,2)
,	saldo_actual DECIMAL (9,2)
,	retiro DECIMAL (9,2)
,   fecha_hora TIMESTAMP
);

						-- DECLARACION DE LAS FK DE TODAS LAS TABLAS
  ALTER TABLE isosceles.contacto_tel
	ADD CONSTRAINT `fk_telusuario` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE;   
    
  ALTER TABLE isosceles.email_contacto
	ADD CONSTRAINT `fk_emailusuario` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)ON DELETE CASCADE ON UPDATE CASCADE;
                        
  ALTER TABLE isosceles.saldos_usuarios
	ADD CONSTRAINT `fk_saldousuario` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE;
    
ALTER TABLE isosceles.historico_retiros_usuarios
	ADD CONSTRAINT `fk_retirousuario` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_retirocuenta` FOREIGN KEY (id_finan) REFERENCES info_finan_usuario (id_finan) ON DELETE CASCADE;
			

ALTER TABLE isosceles.usuario
	ADD CONSTRAINT `fk_tipousuario` FOREIGN KEY (id_tusuario) REFERENCES tipo_usuario (id_tusuario) ON DELETE CASCADE;
    
ALTER TABLE  isosceles.nomb_usuario
	ADD CONSTRAINT `fk_nomb_usuario` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE;
    
ALTER TABLE  isosceles.contrasena
  ADD CONSTRAINT `fk_contra_usuario` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE;
 

ALTER TABLE isosceles.region
	ADD CONSTRAINT `fk_regpais` FOREIGN KEY (id_pais) REFERENCES pais (id_pais) ON DELETE CASCADE;
 
    
ALTER TABLE isosceles.info_personal    
    ADD CONSTRAINT `fk_tipo` FOREIGN KEY (id_tipo) REFERENCES tipo_id (id_tipo) ON DELETE CASCADE,
	ADD CONSTRAINT `fk_usuariotipo` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE;

    
ALTER TABLE isosceles.domicilios
	ADD CONSTRAINT `fk_domiusua` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE,
	ADD  CONSTRAINT `fk_dompais` FOREIGN KEY (id_pais) REFERENCES pais (id_pais) ON DELETE CASCADE,
	ADD CONSTRAINT `fk_domiregion` FOREIGN KEY (id_region) REFERENCES region (id_region) ON DELETE CASCADE;
    
     
ALTER TABLE isosceles.info_finan_usuario
     ADD CONSTRAINT `fk_finausuario` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE,
	 ADD CONSTRAINT `fk_finanemisor` FOREIGN KEY (id_entidad) REFERENCES entidad_emisora (id_entidad) ON DELETE CASCADE,
	 ADD CONSTRAINT `fk_finantipo` FOREIGN KEY (id_tipo_cuenta) REFERENCES tipo_cuenta (id_tipo_cuenta) ON DELETE CASCADE;
     
ALTER TABLE isosceles.info_finan_tarjetas_usuario
     ADD CONSTRAINT `fk_tarjeusua` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE,
	 ADD CONSTRAINT `fk_tarjemi` FOREIGN KEY (id_entidad) REFERENCES entidad_emisora (id_entidad) ON DELETE CASCADE,
	 ADD CONSTRAINT `fk_tarjetipo` FOREIGN KEY (id_tipo_tarjeta) REFERENCES tipo_tarjeta (id_tipo_tarjeta) ON DELETE CASCADE,
	 ADD CONSTRAINT `fk_tarjeta` FOREIGN KEY (id_tarjeta) REFERENCES tarjeta (id_tarjeta) ON DELETE CASCADE;


ALTER TABLE isosceles.ingreso_pro 
	ADD CONSTRAINT `fk_ingrusuario` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_ingrubro`  FOREIGN KEY (id_rubro) REFERENCES rubro (id_rubro) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_ingcategoria` FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_ingmarca`  FOREIGN KEY (id_marca) REFERENCES marca (id_marca) ON DELETE CASCADE,	
    ADD CONSTRAINT `fk_ingproduc` FOREIGN KEY (id_producto) REFERENCES producto (id_producto) ON DELETE CASCADE;
	
    
ALTER TABLE isosceles.egreso_pro
	ADD CONSTRAINT `fk_usuario_egreso` FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `fk_rubro_egreso` FOREIGN KEY  (id_rubro) REFERENCES rubro (id_rubro) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_categoria_egreso` FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_marca_egreso` FOREIGN KEY (id_marca) REFERENCES marca (id_marca) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_prod_egreso`  FOREIGN KEY (id_producto) REFERENCES producto (id_producto) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_fpago_egreso` FOREIGN KEY (fpago) REFERENCES info_finan_tarjetas_usuario (id_info_tarjeta) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_envio_egreso` FOREIGN KEY (envio) REFERENCES  domicilios (id_domi) ON DELETE CASCADE;
    
						-- MODIFICACIONES 
		-- PARA AUMENTAR LA CANTIDAD DE CARACTERES DE LA COLUMNA REGION 
	SET FOREIGN_KEY_CHECKS = 0;
	USE isosceles;
	ALTER TABLE region
	MODIFY COLUMN region VARCHAR (100); 
	SET FOREIGN_KEY_CHECKS = 1;
    
    
    	-- PARA AUMENTAR LA CANTIDAD DE CARACTERES DE LA COLUMNA TIPO_ID
    ALTER TABLE isosceles.tipo_id
    MODIFY COLUMN tipo_id  VARCHAR (50);
    
  -- FUNCION QUE DEVUELVE EL NOMBRE COMPLETO DE LOS USUARIOS INGRESANDO EL ID_USUARIO
USE isosceles;
DROP FUNCTION IF EXISTS `nombre_completo`;

DELIMITER $$
USE isosceles$$
CREATE FUNCTION `nombre_completo` (usuario INT)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
	DECLARE v_id_usuario INT;
	DECLARE v_nombre VARCHAR(100);
    DECLARE v_apellido VARCHAR(100);
    DECLARE v_completo VARCHAR(100);
    SET v_id_usuario = (SELECT id_usuario FROM usuario ORDER BY id_usuario DESC LIMIT 1);
    SET v_nombre = (SELECT nombre FROM usuario WHERE id_usuario = usuario);
    SET v_apellido = (SELECT apellido FROM usuario WHERE id_usuario = usuario);
    
		IF usuario <= v_id_usuario 	THEN
			SET v_completo = concat(v_nombre, ' ', v_apellido);
        ELSE
			SET v_completo = 'Valor fuera de rango';
		END IF;
    RETURN v_completo;
END$$
DELIMITER ;



-- FUNCION PAR AVER SI EXISTE LA CATEGORIA DE USUARIO DEL 1 AL 6 SON EXISTENTES

USE `isosceles`;
DROP function IF EXISTS `existe_categoria_usuario`;
DELIMITER $$
USE `isosceles`$$
CREATE FUNCTION `existe_categoria_usuario` (nuevo_cate_usuario INT)
RETURNs VARCHAR (150)
READS SQL DATA

BEGIN
	DECLARE nivel VARCHAR (150) ;
	DECLARE nuevo_nivel VARCHAR (150);
	DECLARE mensaje VARCHAR(150);
	DECLARE niv VARCHAR (150);
	SET niv= (CONCAT('Nivel',' ',nuevo_cate_usuario));
	SET nivel= (SELECT categoria FROM tipo_usuario WHERE (niv = categoria));
	SET nuevo_nivel = niv;
		IF nuevo_nivel = nivel THEN
			SET mensaje = 'Error,nivel existente';
		ELSE
			SET mensaje ='Es posible crear este nuevo nivel';	
		END IF;
        RETURN mensaje;
END$$

DELIMITER ;		
            
-- FUNCION PARA EL CALCULO DE COMISIOPNES POR VENTA A MEJORAR EL USUARIO Y LA COMISION HASTA AHORA FUNCIONA ASI

USE isosceles;
DROP FUNCTION IF EXISTS  `calculo_comisiones`;
DELIMITER $$
USE isosceles$$
CREATE FUNCTION `calculo_comisiones` (ingreso_usuario VARCHAR (100), precio DECIMAL (9,2), unidades INT)
RETURNS DECIMAL (9,2)
READS SQL DATA
BEGIN
DECLARE var_usuario 	INT;
DECLARE comision DECIMAL (9,2);
SET var_usuario = (SELECT existe_nomb_usuario (ingreso_usuario)); 
	IF var_usuario = 1 THEN
		SET comision = ((precio * unidades) * 0.20);
	ELSEIF var_usuario = 2 THEN
		SET comision = ((precio * unidades) * 0.18);
    ELSEIF var_usuario = 3 THEN
		SET comision = ((precio * unidades) * 0.15);
    ELSEIF var_usuario = 4 THEN
		SET comision = ((precio * unidades) * 0.10);
    ELSEIF var_usuario = 5 THEN
		SET comision = ((precio * unidades) * 0.05); 
    ELSEIF var_usuario = 6 THEN
		SET comision = ((precio * unidades) * 0.03);    
    ELSE 
    SET comision = 0.00;
    END IF;
    RETURN comision;
END$$
DELIMITER ;

-- FUNCION PARA VER SI ESXITE MARCA 
USE isosceles;
DROP FUNCTION IF EXISTS `existe_marca`;

DELIMITER $$
USE isosceles$$
CREATE FUNCTION `existe_marca` (nomb_marca VARCHAR (100))
RETURNS INT 
READS SQL DATA
BEGIN
DECLARE v_marca VARCHAR (100);
DECLARE regresa INT;
DECLARE v_id_marca INT;
SET v_marca = (SELECT nonb_marca FROM marca WHERE nomb_marca = nonb_marca); 
SET v_id_marca = (SELECT id_marca FROM marca WHERE nonb_marca = v_marca);
	IF LCASE(v_marca) = LCASE(nomb_marca) THEN
    SET regresa =v_id_marca;
    ELSE 
    SET regresa =0;
END IF;
RETURN regresa;
END $$
DELIMITER ;



-- FUNCION PARA VER SI ESXITE PRODUCTO
USE isosceles;
DROP FUNCTION IF EXISTS `existe_producto`;

DELIMITER $$
USE isosceles$$
CREATE FUNCTION `existe_producto` (var_nomb_producto VARCHAR (100))
RETURNS INT 
READS SQL DATA
BEGIN
DECLARE v_producto VARCHAR (100);
DECLARE regresa INT;
DECLARE v_id_producto INT;
SET v_producto = (SELECT nomb_producto FROM producto WHERE nomb_producto = var_nomb_producto); 
SET v_id_producto = (SELECT id_producto FROM producto WHERE nomb_producto = v_producto);
	IF LCASE(v_producto) = LCASE(var_nomb_producto) THEN
    SET regresa =v_id_producto;
    ELSE 
    SET regresa =0;
END IF;
RETURN regresa;
END $$
DELIMITER ;


-- FUNCION PARA SABER SI EXISTE EL NOMBRE DE USUARIO
USE isosceles;
DROP FUNCTION IF EXISTS `existe_nomb_usuario`;

DELIMITER $$
USE isosceles$$
CREATE FUNCTION `existe_nomb_usuario` (var_nomb_usuario VARCHAR (100))
RETURNS INT 
READS SQL DATA
BEGIN
DECLARE v_usuario VARCHAR (100);
DECLARE regresa INT;
DECLARE v_id_usuario INT;
SET v_usuario= (SELECT nomb_usuario FROM nomb_usuario WHERE nomb_usuario = var_nomb_usuario); 
SET v_id_usuario = (SELECT id_nomb_usuario FROM nomb_usuario WHERE nomb_usuario = v_usuario);
	IF  EXISTS (SELECT LCASE(nomb_usuario) FROM nomb_usuario WHERE (LCASE(v_usuario) = LCASE(var_nomb_usuario))) THEN
    SET regresa =v_id_usuario;
    ELSE 
    SET regresa =0;
END IF;
RETURN regresa;
END $$
DELIMITER ;


-- FUNCION PASA SABER SI EXISTE EL TIPO DE IDENTIFICACION EJEMPLO PASAPORTE Y QUE ID LE CORESPONDE

USE isosceles;
DROP FUNCTION IF EXISTS `tipo_de_identificacion`;
DELIMITER $$
USE isosceles$$
CREATE FUNCTION `tipo_de_identificacion` (identificacion VARCHAR (100))
RETURNS VARCHAR (100)
READS SQL DATA
BEGIN
DECLARE var_identi INT;
DECLARE v_identi VARCHAR (100);
DECLARE mensaje VARCHAR (100);
SET @var_identi = (SELECT id_tipo FROM tipo_id WHERE tipo_id = identificacion);
-- SET v_identi = (SELECT tipo_id FROM tipo_id WHERE tipo_id = identificacion);
	IF EXISTS (SELECT LCASE(tipo_id) FROM tipo_id WHERE LCASE(tipo_id) = LCASE(identificacion)) THEN  
		SET mensaje =@var_identi;
        ELSE
        SET mensaje =0;
        END IF;
RETURN mensaje;
END$$
DELIMITER ;
-- FUNCION PARA VER SI CORRESPONDE LA REGION AL PAIS  FUNCIONA 

USE `isosceles`;
DROP function IF EXISTS `existe_region_enpais`;
DELIMITER $$
USE `isosceles`$$
CREATE FUNCTION `existe_region_enpais` (ingreso_pais VARCHAR (100), ingreso_region VARCHAR (150))
RETURNS INT
READS SQL DATA

BEGIN
	DECLARE var_pais INT ;
    DECLARE var_region INT;
    DECLARE mensaje VARCHAR(150);
    SET var_pais = (SELECT id_pais FROM pais WHERE (LCASE(pais) = LCASE(ingreso_pais)));
	SET var_region= (SELECT id_region FROM region WHERE (LCASE(region) = LCASE(ingreso_region) AND  (id_pais = var_pais))) ;
		IF  EXISTS (SELECT id_region FROM region WHERE (id_region = var_region)) THEN 
			SET mensaje = var_region;
		ELSE
			SET mensaje =0;	
		END IF;
        RETURN mensaje;
END$$

DELIMITER ;		        

-- FUNCION QUE PERMITYE SABER SI LA CATEGORIA EXISTE
USE isosceles;
DROP FUNCTION IF EXISTS `existe_categoria`;

DELIMITER $$
USE isosceles$$
CREATE FUNCTION `existe_categoria` (ingreso_categoria VARCHAR (100))
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE var_id_categoria INT;
	DECLARE respuesta INT;
    SET var_id_categoria = (SELECT id_categoria FROM categoria WHERE LCASE(categoria) = LCASE(ingreso_categoria));
		IF var_id_categoria <> 0  	THEN
			SET respuesta = var_id_categoria;
        ELSE
			SET respuesta = 0;
		END IF;
    RETURN respuesta;
END$$
DELIMITER ;

-- FUNCION QUE PERMITYE SABER SI EL RUBRO EXISTE
USE isosceles;
DROP FUNCTION IF EXISTS `existe_rubro`;

DELIMITER $$
USE isosceles$$
CREATE FUNCTION `existe_rubro` (ingreso_rubro VARCHAR (100))
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE var_id_rubro INT;
	DECLARE respuesta INT;
    SET var_id_rubro = (SELECT id_rubro FROM rubro WHERE LCASE(rubro) = LCASE(ingreso_rubro));
		IF var_id_rubro <> 0  	THEN
			SET respuesta = var_id_rubro;
        ELSE
			SET respuesta = 0;
		END IF;
    RETURN respuesta;
END$$
DELIMITER ;




-- FUNCION QUE PERMITE SABER EL SALDO EN CUENTA DEL USUARIO
USE isosceles;
DROP FUNCTION IF EXISTS `saldo_en_cuenta`;

DELIMITER $$
USE isosceles$$
CREATE FUNCTION `saldo_en_cuenta` (ingreso_usuario VARCHAR (100))
RETURNS DECIMAL (9,2)
READS SQL DATA
BEGIN
	DECLARE var_saldo_actual DECIMAL (9,2);
	DECLARE respuesta DECIMAL (9,2);
    DECLARE var_usuario INT;
		SET var_usuario = (SELECT existe_nomb_usuario (ingreso_usuario));
		SET var_saldo_actual = (SELECT saldo FROM saldos_usuarios  WHERE id_usuario = var_usuario);
		IF var_usuario = 0	THEN
			SET respuesta = 0;
		ELSE
			SET respuesta = var_saldo_actual;
		 END IF;
    RETURN respuesta;
END$$
DELIMITER ;


-- DEVUELVE EL ID_INGRESO DEL PRODUCTO QUE CUMPLE CON LAS CONDICIONES DE CANTIDAD Y PRECIO
USE `isosceles`;
DROP function IF EXISTS `producto_mas_barato`;
DELIMITER $$
USE `isosceles`$$
CREATE FUNCTION `producto_mas_barato` (ingrese_producto VARCHAR (150),cantidad INT)
RETURNS INT
READS SQL DATA

BEGIN
	 DECLARE var_producto INT ;
	-- DECLARE nuevo_nivel VARCHAR (150);
	 DECLARE mensaje INT;
	DECLARE resultado INT;
   SET var_producto = (SELECT existe_producto (ingrese_producto)); 
   SET resultado = (SELECT id_ingreso FROM ingreso_pro WHERE (id_producto = var_producto AND unidades > cantidad)  ORDER BY precio ASC LIMIT 1);
	 			SET mensaje = resultado;
        RETURN mensaje;
END$$
DELIMITER ;		  
    
-- SP PARA INGRESAR NUEVA CATEGORIA DE USUARIO SI NO EXISTE, DEL 1 AL 6 SON LAS EXISTENTES

USE `isosceles`;
DROP PROCEDURE IF EXISTS `agregar_nueva_categoria`;
DELIMITER $$
USE `isosceles`$$
CREATE PROCEDURE `agregar_nueva_categoria` (IN nueva_cate_usuario INT)
READS SQL DATA

BEGIN
	DECLARE nivel VARCHAR (150) ;
	DECLARE nuevo_nivel VARCHAR (150);
	DECLARE mensaje VARCHAR(150);
	DECLARE niv VARCHAR (150);
	SET niv= (CONCAT('Nivel',' ',nueva_cate_usuario));
	SET nivel= (SELECT categoria FROM tipo_usuario WHERE (niv = categoria));
	SET nuevo_nivel = niv;
		IF nuevo_nivel = nivel THEN
			SET mensaje = 'Error,nivel existente';
		ELSE
			INSERT INTO tipo_usuario(categoria) VALUES (nuevo_nivel);
            SET mensaje = 'Nuevo nivel de usuario creado';	
		END IF;
        SELECT mensaje;
END$$

DELIMITER ;		

            
 -- SP PARA LA CARGA DE NUEVOS USUARIOS TOMANDO COMO PARAMETRO PARA LA CARGA QUE EL TIPO DE ID(Pasaporte) T SU NUMEROS
    -- COMBINADOS NO ESTEN REGISTRADOS
    -- EJEMPLO nue_tipoid Pasaporte  numid_nuev 330306423 DEBE NO HACER LA CARGA DE DATOS
     --   Cedula de Identidad   252562474  DEBE NO HACER LA CARGA DE DATOS   
     -- SE DEBEN RESPETAR LAS MAYUSCULAS, NO PUDE CORREGIR ESO
     
     
USE `isosceles`;
DROP PROCEDURE IF EXISTS `ingresar_nuevo_usuario`;
DELIMITER $$
USE `isosceles`$$
CREATE PROCEDURE `ingresar_nuevo_usuario` (nue_tipoid VARCHAR (50), numid_nuev VARCHAR (30),n_usuario VARCHAR (50), nombre VARCHAR (50), 
								  apellido VARCHAR (150), fecha_nac DATE, password VARCHAR (150))

READS SQL DATA

BEGIN
	DECLARE tipoidexist VARCHAR (150) ;
    DECLARE numidexist VARCHAR (150);
    DECLARE usuarioexist VARCHAR (150);
    DECLARE mensaje VARCHAR(150);
    DECLARE nuevo_id INT;
	SET tipoidexist = (SELECT id_tipo FROM tipo_id WHERE LCASE(tipo_id = nue_tipoid));
	SET numidexist = (SELECT num_personal FROM info_personal WHERE (num_personal = numid_nuev));
	SET usuarioexist = (SELECT nomb_usuario FROM nomb_usuario WHERE LCASE(n_usuario = nomb_usuario)); 
		IF ((SELECT tipo_de_identificacion (nue_tipoid)) AND  numidexist = numid_nuev  ) THEN
			SET mensaje = "Tipo de identificacion y numero, ya registrados";
		ELSEIF (SELECT existe_nomb_usuario(n_usuario)) THEN
               SET mensaje = "Nombre de usuario ya existe, igrese otro"; 
		ELSE
              INSERT INTO usuario (id_tusuario,nombre,apellido,fecha_nac)
              VALUES (1,LCASE(nombre),LCASE(apellido),fecha_nac);
			  SET nuevo_id = (SELECT id_usuario FROM usuario ORDER BY id_usuario DESC LIMIT 1);
              INSERT INTO info_personal (id_tipo,id_usuario,num_personal)
					 VALUES (@var_identi,nuevo_id,numid_nuev);
			  INSERT INTO isosceles.nomb_usuario(id_usuario,nomb_usuario)
					VALUES (nuevo_id,LCASE(n_usuario));
			  INSERT INTO isosceles.contrasena (id_usuario,contrasena)
					VALUES (nuevo_id,password);
            SET mensaje = 'Se procedio a la creacion del nuevo usuario';
         END IF;    
		SELECT mensaje;
END$$
DELIMITER ;                

-- STORED PARA CAMBIAR LA CONTRASEÑA DE UN USUARIO

USE `isosceles`;
DROP PROCEDURE IF EXISTS `modifica_contrasena_usuario`;
DELIMITER $$
USE `isosceles`$$
CREATE PROCEDURE `modifica_contrasena_usuario` (ingusuario VARCHAR (100), contrasena_actual VARCHAR (100),
											   contrasena_nueva VARCHAR (100))
READS SQL DATA

BEGIN
	DECLARE v_id_usuario INT;
	DECLARE v_usuario VARCHAR (150) ;
	DECLARE v_contrasena VARCHAR (150);
    DECLARE var_usuario VARCHAR (100);
	DECLARE mensaje VARCHAR(150);
	SET @v_id_usuario= (SELECT id_usuario FROM nomb_usuario WHERE nomb_usuario = ingusuario);
	SET v_contrasena= (SELECT contrasena FROM contrasena WHERE id_usuario = @v_id_usuario);
    SET var_usuario = (SELECT nomb_usuario FROM nomb_usuario WHERE id_usuario = @v_id_usuario);
			IF 	(ingusuario = var_usuario AND contrasena_actual = v_contrasena)THEN
				  SET SQL_SAFE_UPDATES=0;
				  UPDATE contrasena SET contrasena = contrasena_nueva 
                  WHERE id_usuario = @v_id_usuario;
                  SET SQL_SAFE_UPDATES=1;
                  SET mensaje = ' Se procedio al cambio de la contraseña';
			 ELSE    
				SET mensaje = 'Usuario o contraseña incorrectos';	
                END IF;
                SELECT mensaje;
END$$
DELIMITER ;


-- STORED PARA CAMBIAR EL NOMBRE DE USUARIO 

USE `isosceles`;
DROP PROCEDURE IF EXISTS `modifica_nombre_usuario`;
DELIMITER $$
USE `isosceles`$$
CREATE PROCEDURE `modifica_nombre_usuario` (ingusuario VARCHAR (100), contrasena VARCHAR (100),
											   nuevo_usuario VARCHAR (100))
READS SQL DATA

BEGIN
	DECLARE var_id_usuario INT;
	DECLARE var_usuario VARCHAR (150) ;
	DECLARE var_contrasena VARCHAR (150);
    DECLARE v_usuario VARCHAR (100);
	DECLARE mensaje VARCHAR(150);
    DECLARE respuesta INT;
    SET respuesta= (SELECT existe_nomb_usuario(ingusuario));
	SET @var_id_usuario= (SELECT id_usuario FROM nomb_usuario WHERE nomb_usuario = ingusuario);
	SET var_contrasena= (SELECT contrasena FROM contrasena WHERE id_usuario = @var_id_usuario);
	SET v_usuario = (SELECT nomb_usuario FROM nomb_usuario WHERE id_usuario = @var_id_usuario);
            IF respuesta = 0 THEN 
				SET mensaje = 'Usuario inexistente';	
            ELSEIF 	(ingusuario = v_usuario AND contrasena = var_contrasena) THEN
				SET SQL_SAFE_UPDATES=0;
				UPDATE nomb_usuario SET nomb_usuario = nuevo_usuario 
				WHERE id_usuario = @var_id_usuario;
				SET SQL_SAFE_UPDATES=1;
				SET mensaje = 'Se procedio al cambio de nombre de usuario';	
		 END IF;
         SELECT mensaje;
END$$

DELIMITER ;		

  USE `isosceles`;
DROP PROCEDURE IF EXISTS `retiro_saldo_en_cuenta`;
DELIMITER $$
USE `isosceles`$$
CREATE PROCEDURE `retiro_saldo_en_cuenta` (IN ingreso_usuario VARCHAR (100),IN monto_retiro DECIMAL (9,2),IN cuenta VARCHAR (150))
READS SQL DATA

BEGIN
	DECLARE var_cuenta_comp INT;
	DECLARE var_usuario INT;
    DECLARE var_saldo_actual DECIMAL (9,2);
	DECLARE var_diferencia 	DECIMAL (9,2);    
	DECLARE mensaje  TEXT DEFAULT  'Error :';
	DECLARE var_cuenta INT ;
    
        SET @var_usuario = (SELECT existe_nomb_usuario (ingreso_usuario));
        SET var_saldo_actual = (SELECT saldo_en_cuenta (ingreso_usuario));
        SET var_diferencia = (var_saldo_actual - monto_retiro);
		SET @var_cuenta = (SELECT id_finan FROM info_finan_usuario WHERE num_cuenta = cuenta);	
        SET var_cuenta_comp = (SELECT id_finan FROM info_finan_usuario WHERE id_usuario = @var_usuario);
				IF @var_usuario = 0 THEN
					SET mensaje = 'Error Usuario Inexistente' ;
				ELSEIF @var_cuenta IS NULL THEN
					SET mensaje = 'Numero de cuenta inexistente';
                ELSEIF @var_cuenta = var_cuenta_comp THEN 
					IF var_saldo_actual >= monto_retiro THEN 
					 SET SQL_SAFE_UPDATES=0;
					 UPDATE saldos_usuarios SET saldo = var_diferencia
					 WHERE id_usuario = @var_usuario;
					 INSERT INTO `historico_retiros_usuarios` (id_usuario,id_finan,saldo_viejo,saldo_actual,retiro,fecha_hora)
								VALUES (@var_usuario,@var_cuenta,var_saldo_actual,var_diferencia,monto_retiro,NOW()); 
					 SET SQL_SAFE_UPDATES=1;
					 SET mensaje = 'Operacion realizada';
                     ELSE 
                    SET mensaje = 'Monto superior al disponible '; 
                    END IF;
                 ELSE 
					SET mensaje = 'La cuenta no corresponde al usuario';   
				END IF;	
                    SELECT mensaje AS 'Mensaje';
END$$
DELIMITER ;		         

USE `isosceles`;
DROP PROCEDURE IF EXISTS `eliminar_usuario`;
DELIMITER $$
USE `isosceles`$$
CREATE PROCEDURE `eliminar_usuario` (ingusuario VARCHAR (100), contrasena VARCHAR (100))
											   
READS SQL DATA

BEGIN
	DECLARE v_id_usuario INT;
	DECLARE v_usuario VARCHAR (150) ;
	DECLARE v_contrasena VARCHAR (150);
    DECLARE var_usuario VARCHAR (100);
	DECLARE mensaje VARCHAR(150);
	SET @v_id_usuario= (SELECT id_usuario FROM nomb_usuario WHERE nomb_usuario = ingusuario);
	SET v_contrasena= (SELECT contrasena FROM contrasena WHERE id_usuario = @v_id_usuario);
    SET var_usuario = (SELECT nomb_usuario FROM nomb_usuario WHERE id_usuario = @v_id_usuario);
			IF 	ingusuario = var_usuario  THEN
				  IF contrasena = v_contrasena THEN
				  DELETE FROM usuario 
                  WHERE id_usuario = @v_id_usuario;
                  SET mensaje = 'Se elimino al usuario';
                  ELSE 
                  SET  mensaje = 'Contraseña incorrectos';
                  END IF;
			 ELSE    
				SET mensaje = 'Usuario inexistente';	
            END IF;    
                SELECT mensaje;
END$$
DELIMITER ;    

-- TRIGGER PARA CUANDO SE INGRESAN NUEVAS CATEGORIAS DE USUARIOS FUNCIONA

USE isosceles;
DROP TABLE IF EXISTS isosceles.add_nuevas_categorias_usuario;
CREATE TABLE IF NOT EXISTS add_nuevas_categorias_usuario (id_tr_add_usus INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,	categoria VARCHAR (100)
,   usuario VARCHAR(100)
,   fecha_hora TIMESTAMP
);

DROP TRIGGER IF EXISTS `tr_add_nuevas_categorias_usuario`;
CREATE TRIGGER `tr_add_nuevas_categorias_usuario`
AFTER INSERT ON `tipo_usuario`
FOR EACH ROW
INSERT INTO `add_nuevas_categorias_usuario` (categoria,usuario,fecha_hora)
VALUES ((SELECT categoria FROM tipo_usuario ORDER BY categoria DESC LIMIT 1),SESSION_USER(), CURRENT_TIMESTAMP()); 



-- TRIGGER PARA GUARDAR LAS MIDIFICACIONES DE LAS CONTRASEÑAS DE LOS USUARIOS FUNCIONA

 USE isosceles;
 DROP TABLE IF EXISTS isosceles.modify_contra__nomb_usuario;
 CREATE TABLE isosceles.modify_contra_nomb_usuario (id_modify_pass_nomb_uesr INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,	id_usuario INT
,	viejo_usuario  VARCHAR (100) DEFAULT 'Sin cambios'
,	nuevo_usuario VARCHAR (100)  DEFAULT 'Sin cambios'
,	vieja_contra  VARCHAR (100)  DEFAULT 'Sin cambios'
,	nueva_contra VARCHAR (100)   DEFAULT 'Sin cambios'
,	fecha	DATETIME
 );

DROP TRIGGER IF EXISTS `tr_modify_contra_usuario`;
CREATE TRIGGER `tr_modify_contra_usuario`
AFTER UPDATE ON `contrasena`
FOR EACH ROW
INSERT INTO `modify_contra_nomb_usuario` (id_usuario,vieja_contra,nueva_contra,fecha)
	VALUES ((SELECT id_usuario FROM usuario WHERE id_usuario = @var_id_usuario),
			(SELECT OLD.contrasena FROM usuario WHERE id_usuario = @v_id_usuario),
			(SELECT NEW.contrasena FROM usuario WHERE id_usuario = @v_id_usuario),NOW());
	-- @v_id_usuario traido desde store procedure `modifica_contrasena_usuario`



-- TRIGGER PARA GUARDAR LAS MIDIFICACIONES DE LOS CAMBIOS DE NOMBRE SE USUARIO
USE isosceles; 
DROP TRIGGER IF EXISTS `tr_modify_nombre_usuario`;
CREATE TRIGGER `tr_modify_nombre_usuario`
BEFORE UPDATE ON `nomb_usuario`
FOR EACH ROW
INSERT INTO `modify_contra_nomb_usuario` (id_usuario,viejo_usuario,nuevo_usuario,fecha)
VALUES ((SELECT id_usuario FROM usuario WHERE id_usuario = @var_id_usuario),
		(SELECT OLD.nomb_usuario FROM nomb_usuario WHERE id_usuario = @var_id_usuario),
        (SELECT NEW.nomb_usuario FROM nomb_usuario WHERE id_usuario = @var_id_usuario),NOW());
	 

-- TRIGGER PARA ALMACER LOS INGRESOS DE NUEVOS USUARIOS

USE isosceles;
DROP TABLE IF EXISTS isosceles.add_nuevos_usuario;
CREATE TABLE IF NOT EXISTS add_nuevos_usuario (id_tr_add_nuevos_usus INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,	id_usuario INT
-- ,   usuario VARCHAR(100)
,	nombre VARCHAR (100)
,	apellido VARCHAR (100)
,   fecha_hora TIMESTAMP
);

DROP TRIGGER IF EXISTS `tr_add_nuevos_usuario`;
CREATE TRIGGER `tr_add_nuevos_usuario`
AFTER INSERT ON `usuario`
FOR EACH ROW
INSERT INTO `add_nuevos_usuario` (id_usuario,nombre,apellido,fecha_hora)
VALUES ((SELECT id_usuario FROM usuario ORDER BY id_usuario DESC LIMIT 1),(SELECT nombre FROM usuario ORDER BY id_usuario DESC LIMIT 1),
(SELECT apellido FROM usuario ORDER BY id_usuario DESC LIMIT 1),
        NOW()); 

-- VISTA QUE MUESTRA LOS PRIMERO 50 PRODUCTOS CON MAS STOCK
CREATE OR REPLACE VIEW listado_prouctos_mas_stock AS
(SELECT 
unidades
,MAX(precio) AS precio_mas_alto
,MIN(precio) AS precio_mas_bajo
,AVG(precio) AS precio_promedio
,descripcion
,p.nomb_producto
FROM ingreso_pro i
INNER JOIN producto p 
ON (p.id_producto = i.id_producto)
GROUP BY i.id_producto
ORDER BY SUM(unidades) DESC LIMIT 50
);

 -- DATOS PARA GENERAR ETIQUETA DE ENVIOS
CREATE OR REPLACE VIEW datos_envio AS
(SELECT 
	nombre_completo (u.id_usuario) AS Nombre_y_Apellido
, 	pais
,	region
,	domicilio	
,	codigo_post
,	p.nomb_producto
FROM egreso_pro e
	INNER JOIN usuario u
	ON (e.id_usuario = u.id_usuario)
    INNER JOIN domicilios d
    ON (envio = d.id_domi)
    INNER JOIN region r
    ON (d.id_region = r.id_region)
    INNER JOIN pais s
    ON (d.id_pais = s.id_pais)
    INNER JOIN producto p
    ON (e.id_producto = p.id_producto)
);  
      
  -- 	DATOS DE CONTACTO DE LOS USUARIOS MENOR NIVEL 3 SIN TELEFONO
CREATE OR REPLACE VIEW contacto_usuario_menor_nivel3 AS 
(SELECT 
nombre_completo (u.id_usuario) AS Nombre_y_Apellido
,email
,num_tel
FROM email_contacto e
	INNER JOIN usuario u
		ON e.id_usuario = u.id_usuario
	INNER JOIN contacto_tel t
		ON e.id_usuario = t.id_usuario
WHERE id_tusuario < 3 AND num_tel LIKE '%sin%'
);  

-- LA MISMA MUESTRA LOS TIPOS DE CUENTAS POSIBLES PARA CADA USUARIO Y LA COMISION DE CADA UNA
USE isosceles;
CREATE OR REPLACE VIEW tipos_de_usuarios AS
(SELECT categoria, comision
FROM tipo_usuario
);
    
 -- TOTAL DE USUARIOS POR PAIS
CREATE OR REPLACE VIEW report_usuarios_por_pais AS
(SELECT(COUNT(DISTINCT id_usuario)) AS usuarios_por_pais
, pais
FROM domicilios a
	INNER JOIN pais b
	ON (a.id_pais = b.id_pais)
    GROUP BY a.id_pais 
);  

 -- TOTAL DE USUARIOS POR CATEGORIAS PARA GRAFICOS
CREATE OR REPLACE VIEW report_usuarios_por_nivel AS
(SELECT COUNT(a.id_tusuario) AS total_usuarios_por_nivel
, categoria
FROM usuario a
	INNER JOIN tipo_usuario b
	ON (a.id_tusuario = b.id_tusuario)
    GROUP BY a.id_tusuario 
);  


 -- TOTAL EN FORMAS DE PAGO por tarjeta y banco
CREATE OR REPLACE VIEW report_formas_de_pago_por_entidad AS
(SELECT COUNT(a.id_tipo_tarjeta) AS medios_pago_por_entidad
, tipo_tarjeta
, nomb_entidad
FROM tipo_tarjeta a
	INNER JOIN info_finan_tarjetas_usuario b
	ON (a.id_tipo_tarjeta = b.id_tipo_tarjeta)
    INNER JOIN egreso_pro
    ON (fpago = id_info_tarjeta)
    INNER JOIN entidad_emisora c
    ON (b.id_entidad = c.id_entidad)
    GROUP BY nomb_entidad 
    ORDER BY medios_pago_por_entidad ASC 
);  


-- TOTAL EN FORMAS DE PAGO por tarjeta utilizados
CREATE OR REPLACE VIEW report_medios_pago AS
(SELECT COUNT(a.id_tipo_tarjeta) AS medios_pago
, tipo_tarjeta
FROM tipo_tarjeta a
	INNER JOIN info_finan_tarjetas_usuario b
	ON (a.id_tipo_tarjeta = b.id_tipo_tarjeta)
    INNER JOIN egreso_pro
    ON (fpago = id_info_tarjeta)
    GROUP BY tipo_tarjeta
);  

-- LISTADO DE LOS 20 PRODUCTOS MAS VENDIDOS INFORMACION QUE SALE DE LA TABLA EGRESO
CREATE OR REPLACE VIEW report_top_20_productos AS
(SELECT SUM(unidades) AS top_20_productos_mas_vendidos
, nomb_producto
, a.id_producto
FROM egreso_pro a
	 INNER JOIN producto b
	 ON (a.id_producto = b.id_producto)
     GROUP BY b.id_producto 
     ORDER BY top_20_productos DESC LIMIT 20
);  

USE isosceles;
-- GENERAR REPORTE COMPRAS PROMEDIO POR NIVEL DE USUARIO POR UNIDADES
CREATE OR REPLACE VIEW report_avg_por_nivel_usuario_ AS
(SELECT AVG(UNIDADES) AS avg_por_nivel_unidades
, categoria
FROM egreso_pro a
	 INNER JOIN tipo_usuario 
	 ON (a.id_usuario = id_tusuario)
     GROUP BY a.id_usuario
     ORDER BY AVG_POR_NIVEL_UNIDADES ASC 
);  

-- GENERAR REPORTE COMPRAS PROMEDIO POR PAIS POR UNIDADES

CREATE OR REPLACE VIEW report_avg_unidades_por_pais_ AS
(SELECT AVG(UNIDADES) AS avg_unidades_por_pais
, pais
FROM egreso_pro a
	 INNER JOIN domicilios b
	 ON (envio = id_domi)
     INNER JOIN pais c
     ON (b.id_pais = c.id_pais)
     GROUP BY b.id_pais
     ORDER BY AVG_UNIDADES_POR_PAIS ASC
);  

-- VISTA PARA REPORTE DE NUEVOS USUARIOS VER EL TEMA DE PODER HACERLO POR MES//AÑO O CUALQUIER OTRA COSA
CREATE OR REPLACE VIEW reporte_nuevos_usuarios AS
(SELECT COUNT(id_tr_add_nuevos_usus) AS Nuevos_usuarios FROM add_nuevos_usuario  
);   