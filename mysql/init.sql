CREATE DATABASE IF NOT EXISTS logs;
CREATE USER IF NOT EXISTS 'tr'@'localhost' IDENTIFIED BY 'tr';
GRANT USAGE ON *.* TO 'tr'@'localhost';
FLUSH PRIVILEGES;
USE logs;
DROP TABLE IF EXISTS `tr.logs`;
CREATE TABLE `tr.logs` (id INT NOT NULL AUTO_INCREMENT,
date DATETIME, 
remoteIP VARCHAR(15),
host VARCHAR(15),
request VARCHAR(30),
query VARCHAR(10),
method VARCHAR(10),
status INT,
userAgent VARCHAR(150),
referer VARCHAR(10),
XForwardedFor VARCHAR(10),
PRIMARY KEY (id,date), KEY (date)) 
PARTITION BY RANGE( YEAR(date) ) (
    PARTITION p2016 VALUES LESS THAN (2017),
    PARTITION p2017 VALUES LESS THAN (2018),
    PARTITION p2018 VALUES LESS THAN (2019),
    PARTITION p2019 VALUES LESS THAN (2020),
    PARTITION p9999 VALUES LESS THAN MAXVALUE
);
