DROP DATABASE IF EXISTS MetalK_WebCenter;
CREATE DATABASE  MetalK_WebCenter;

USE MetalK_WebCenter;

-- DECLARE TABLES
DROP TABLE IF EXISTS solicitudes;
CREATE TABLE solicitudes(
	soli_id INT NOT NULL,
    soli_date INT NOT NULL,
    soli_plane VARCHAR(2843) NOT NULL,
    soli_technicalVisit BOOLEAN NOT NULL,
    soli_address VARCHAR(2843) NOT NULL,
    clin_id INT NOT NULL
);

 DROP TABLE IF EXISTS products;
 CREATE TABLE products(
	prod_id INT NOT NULL ,
    prod_price DOUBLE NOT NULL,
    prod_time INT NOT NULL, 
    cate_id INT NOT NULL
 );

DROP TABLE IF EXISTS categories;
CREATE TABLE categories(
	cate_id INT NOT NULL,
    cate_name VARCHAR(32) NOT NULL,
    cate_description VARCHAR(128) NOT NULL,
    cate_icon VARCHAR(2843) NOT NULL
);

DROP TABLE IF EXISTS tags;
CREATE TABLE tags(
	tag_id INT NOT NULL ,
    tag_name VARCHAR(32) NOT NULL,
    tag_description VARCHAR(128) NOT NULL,
    tagg_id INT NOT NULL
);

DROP TABLE IF EXISTS tag_groups;
CREATE TABLE tag_groups  (
	tagg_id INT NOT NULL ,
    tagg_title VARCHAR(32) NOT NULL,
	tagg_descripton VARCHAR(128) NOT NULL,
    tagg_icon VARCHAR(2843) NOT NULL
);

DROP TABLE IF EXISTS tags_by_cartegory;
CREATE TABLE  tags_by_cartegory(
	tbca_id INT NOT NULL ,
    cate_id INT NOT NULL,
    tag_id INT NOT NULL
);

DROP TABLE IF EXISTS product_tags;
CREATE TABLE product_tags(
	prta_id INT NOT NULL ,
    prod_id INT NOT NULL,
	tag_id  INT NOT NULL
);

DROP TABLE IF EXISTS product_pictures;
CREATE TABLE product_pictures(
	prpi_id INT NOT NULL ,
    prpi_route INT NOT NULL,
	prod_id  INT NOT NULL
);

DROP TABLE IF EXISTS clients;
CREATE TABLE clients(
	clin_id INT NOT NULL ,
    clin_name VARCHAR(64) NOT NULL,
	clin_phone  VARCHAR(16) NOT NULL
);

DROP TABLE IF EXISTS admins;
CREATE TABLE admins(
	admi_id INT NOT NULL ,
    admi_name VARCHAR(64) NOT NULL,
	admi_phone  VARCHAR(16) NOT NULL,
    admi_password VARCHAR(256) NOT NULL
);

DROP TABLE IF EXISTS enterprice;
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
ALTER TABLE solicitudes MODIFY COLUMN soli_id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE solicitudes MODIFY COLUMN soli_id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE solicitudes MODIFY COLUMN soli_id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE solicitudes MODIFY COLUMN soli_id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE solicitudes MODIFY COLUMN soli_id INT AUTO_INCREMENT PRIMARY KEY;

-- FOREING KEYS 
ALTER TABLE solicitudes ADD CONSTRAINT FOREIGN KEY (clin_id) REFERENCES clients(clin_id)


