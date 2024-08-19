DROP DATABASE IF EXISTS MetalK_WebCenter;
CREATE DATABASE  MetalK_WebCenter;

USE MetalK_WebCenter;

-- DECLARE TABLES
CREATE TABLE solicitudes(
	soli_id INT NOT NULL,
    soli_date INT NOT NULL,
    soli_plane VARCHAR(2843) NOT NULL,
    soli_technicalVisit BOOLEAN NOT NULL,
    soli_address VARCHAR(2843) NOT NULL,
    clie_id INT NOT NULL
);

 CREATE TABLE products(
	prod_id INT NOT NULL ,
    prod_price DOUBLE NOT NULL,
    prod_time INT NOT NULL, 
    cate_id INT NOT NULL,
    soli_id INT NOT NULL
 );

CREATE TABLE categories(
	cate_id INT NOT NULL,
    cate_name VARCHAR(32) NOT NULL,
    cate_description VARCHAR(128) NOT NULL,
    cate_icon VARCHAR(2843) NOT NULL
);

CREATE TABLE tags(
	tag_id INT NOT NULL ,
    tag_name VARCHAR(32) NOT NULL,
    tag_description VARCHAR(128) NOT NULL,
    tagg_id INT NOT NULL
);

CREATE TABLE tag_groups  (
	tagg_id INT NOT NULL ,
    tagg_title VARCHAR(32) NOT NULL,
	tagg_descripton VARCHAR(128) NOT NULL,
    tagg_icon VARCHAR(2843) NOT NULL
);

CREATE TABLE  tags_by_category(
	tbca_id INT NOT NULL ,
    cate_id INT NOT NULL,
    tag_id INT NOT NULL
);

CREATE TABLE product_tags(
	prta_id INT NOT NULL ,
    prod_id INT NOT NULL,
	tag_id  INT NOT NULL
);

CREATE TABLE product_pictures(
	prpi_id INT NOT NULL ,
    prpi_route INT NOT NULL,
	prod_id  INT NOT NULL
);

CREATE TABLE clients(
	clie_id INT NOT NULL ,
    clie_name VARCHAR(64) NOT NULL,
	clie_phone  VARCHAR(16) NOT NULL
);

CREATE TABLE admins(
	admi_id INT NOT NULL ,
    admi_name VARCHAR(64) NOT NULL,
	admi_phone  VARCHAR(16) NOT NULL,
    admi_password VARCHAR(256) NOT NULL
);

CREATE TABLE enterprice(
	ente_id INT NOT NULL ,
    ente_name VARCHAR(64),
    ente_slogan VARCHAR(128),
    ente_description VARCHAR(256),
    ente_logo VARCHAR(2843),
    ente_address VARCHAR(256)
); 

-- ADD CONSTRINTS
-- PRIMARY KEYS
ALTER TABLE solicitudes MODIFY COLUMN soli_id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE products MODIFY COLUMN prod_id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE clients MODIFY COLUMN clie_id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE product_pictures MODIFY COLUMN prpi_id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE product_tags MODIFY COLUMN prta_id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE categories MODIFY COLUMN cate_id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE tags_by_category MODIFY COLUMN tbca_id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE tags MODIFY COLUMN tag_id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE tag_groups MODIFY COLUMN tagg_id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE enterprice MODIFY COLUMN ente_id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE admins MODIFY COLUMN admi_id INT AUTO_INCREMENT PRIMARY KEY;

-- FOREING KEYS 
ALTER TABLE solicitudes ADD CONSTRAINT FOREIGN KEY (clie_id) REFERENCES clients(clie_id);
ALTER TABLE products ADD CONSTRAINT FOREIGN KEY (soli_id) REFERENCES solicitudes(soli_id);
ALTER TABLE products ADD CONSTRAINT FOREIGN KEY (cate_id)  REFERENCES categories(cate_id);
ALTER TABLE product_pictures ADD CONSTRAINT FOREIGN KEY (prod_id) REFERENCES products(prod_id);
ALTER TABLE product_tags ADD CONSTRAINT FOREIGN KEY (prod_id) REFERENCES products(prod_id);
ALTER TABLE product_tags ADD CONSTRAINT FOREIGN KEY (tag_id) REFERENCES tags(tag_id);
ALTER TABLE tags_by_category ADD CONSTRAINT FOREIGN KEY (cate_id) REFERENCES categories(cate_id);
ALTER TABLE tags_by_category ADD CONSTRAINT FOREIGN KEY (tag_id) REFERENCES tags(tag_id);
ALTER TABLE tags ADD CONSTRAINT FOREIGN KEY (tagg_id) REFERENCES tag_groups(tagg_id);
 
-- CRUD clients
DELIMITER //
CREATE PROCEDURE createClient(name VARCHAR(36),cellphone VARCHAR(16))
BEGIN
	INSERT INTO clients(clie_name,clie_phone)
    VALUES (name,cellphone);
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE readAllClients()
BEGIN
	SELECT *
	FROM clients;
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE updateClients(IN id INT,IN name VARCHAR(64),IN cellphone VARCHAR(16))
BEGIN
	-- IF id = NULL THEN
      
    -- END IF;
	IF name != NULL THEN
		UPDATE clients c 
		SET c.clie_name = name 
		WHERE c.clie_id = id;
    END IF;
	IF cellphone != NULL THEN
		UPDATE clients c 
		SET c.clie_phone = cellphone 
		WHERE c.clie_id = id;
    END IF;
END;
// DELIMITER ;
-- CALL createClient("Salomon",345673892);
-- CALL updateClients(1,"Juan",NULL);

DELIMITER //
CREATE PROCEDURE  deleteClient(id INT)
BEGIN
	DELETE FROM clients c WHERE c.id = id; 
END;
// DELIMITER ;

-- CRUD solicitude
DELIMITER //
CREATE PROCEDURE createSolicutude()
BEGIN
END;
// DELIMITER ;
  



