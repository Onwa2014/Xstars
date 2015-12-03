-- DROP TABLE IF EXISTS `Taxi_associations`;
-- CREATE TABLE Taxi_associations (
--     id int not null auto_increment,
--     taxiAssociation_name varchar(100),
--     primary key(id)    
-- )ENGINE=InnoDB;

-- DROP TABLE IF EXISTS 'Ranks';
-- CREATE TABLE Ranks (
-- 	id int not null auto_increment,
-- 	Rank_name varchar(100),
-- 	primary key(id),
-- 	association_id int(100),
-- 	FOREIGN KEY(association_id) REFERENCES Taxi_associations(id)

-- )ENGINE=InnoDB;


-- -- DROP TABLE IF EXISTS 'Location';
-- -- CREATE TABLE Location(
-- -- 	id int not null auto_increment,
-- -- 	primary key(id),
-- -- 	latitude int(100),
-- -- 	longitude int(100),
-- -- 	locOne_time datetime,
-- --     date DATE
	
-- -- )ENGINE=InnoDB;



-- DROP TABLE IF EXISTS 'Issues';
-- CREATE TABLE Issues(
-- 	id int not null auto_increment,
-- 	primary key(id),
-- 	description varchar(100),
-- 	date DATE,
-- 	association_id int(100),
-- 	rank_id int(100),
	
-- 	start_location_latitude decimal(20,10),
-- 	start_location_longitude decimal(20,10),
-- 	start_location_time bigint,

-- 	end_location_latitude decimal(20,10),
-- 	end_location_longitude decimal(20,10),
-- 	end_location_time bigint,
-- 	speed decimal(20.10),

	
-- 	FOREIGN KEY(association_id) REFERENCES Taxi_associations(id),
-- 	FOREIGN KEY(rank_id) REFERENCES Ranks(id)

-- )ENGINE=InnoDB;


-- -- DROP TABLE IF EXISTS 'fin_Location';
-- -- CREATE TABLE fin_Location(
-- -- 	id int not null auto_increment,
-- -- 	primary key(id),
-- -- 	latitudes int(100),
-- -- 	longitudes int(100),
-- -- 	locTwo_time time,
-- --     date DATE
	


INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('Uncedo');
INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('CATA');
INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('SANTAGO');
INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('PENINSULA TAXI ');
INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('WESTERN CAPE METERED');
INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('GARDEN ROUTE');

INSERT INTO Issues (description,association_id,rank_id,association_id,date,start_location_latitude,start_location_longitude,start_location_time,end_location_latitude,end_location_longitude,end_location_time,speed,) VALUES ('');
INSERT INTO Issues (description,association_id,rank_id,association_id,date,start_location_latitude,start_location_longitude,start_location_time,end_location_latitude,end_location_longitude,end_location_time,speed,) VALUES ('');
INSERT INTO Issues (description,association_id,rank_id,association_id,date,start_location_latitude,start_location_longitude,start_location_time,end_location_latitude,end_location_longitude,end_location_time,speed,) VALUES ('');
INSERT INTO Issues (description,association_id,rank_id,association_id,date,start_location_latitude,start_location_longitude,start_location_time,end_location_latitude,end_location_longitude,end_location_time,speed,) VALUES ('');
INSERT INTO Issues (description,association_id,rank_id,association_id,date,start_location_latitude,start_location_longitude,start_location_time,end_location_latitude,end_location_longitude,end_location_time,speed,) VALUES ('');
INSERT INTO Issues (description,association_id,rank_id,association_id,date,start_location_latitude,start_location_longitude,start_location_time,end_location_latitude,end_location_longitude,end_location_time,speed,) VALUES ('');


INSERT INTO Ranks (Rank_name) VALUES ('Langa');
INSERT INTO Ranks (Rank_name) VALUES ('Khayelitsha');
INSERT INTO Ranks (Rank_name) VALUES ('Cape Town');
INSERT INTO Ranks (Rank_name) VALUES ('Gugulethu ');
INSERT INTO Ranks (Rank_name) VALUES ('BELLVILLE');
INSERT INTO Ranks (Rank_name) VALUES ('DUNOON');
