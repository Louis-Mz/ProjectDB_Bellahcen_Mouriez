USE private_aviation_company;

-- =====================================================
-- 1. Reference Tables (Models, Airports, Roles)
-- =====================================================

INSERT INTO Model (M_name, M_capacity, M_maxrange) VALUES
('Boeing 737', 189, 5600),
('Airbus A320', 180, 6100),
('Boeing 787', 242, 13600),
('Airbus A350', 300, 15000),
('Embraer E190', 114, 4500);

INSERT INTO Airport (A_id, A_name, A_city, A_country) VALUES
('JFK', 'John F. Kennedy International', 'New York', 'USA'),
('LHR', 'Heathrow', 'London', 'UK'),
('CDG', 'Charles de Gaulle', 'Paris', 'France'),
('FRA', 'Frankfurt Airport', 'Frankfurt', 'Germany'),
('NRT', 'Narita International', 'Tokyo', 'Japan'),
('DXB', 'Dubai International', 'Dubai', 'UAE'),
('SYD', 'Sydney Kingsford Smith', 'Sydney', 'Australia'),
('GRU', 'São Paulo–Guarulhos', 'São Paulo', 'Brazil'),
('YYZ', 'Toronto Pearson', 'Toronto', 'Canada'),
('HND', 'Tokyo Haneda', 'Tokyo', 'Japan');

INSERT INTO Role (R_id, R_name) VALUES
('R1', 'Pilot'),
('R2', 'Co-pilot'),
('R3', 'Cabin crew'),
('R4', 'Maintenance technician'),
('R5', 'Administrative staff');

-- =====================================================
-- 2. Employees (70 rows required)
-- =====================================================
-- Top level Managers (No pilot_id)
INSERT INTO Employee (E_id, E_lastname, E_firstname, E_birthdate, E_salary, E_status, E_hiredate, E_id_pilot) VALUES
('E001', 'Smith', 'John', '1975-02-15', '150000', 'Active', '2000-06-01', NULL),
('E002', 'Doe', 'Jane', '1978-05-20', '145000', 'Active', '2001-08-15', NULL),
('E003', 'Dubois', 'Pierre', '1970-11-10', '160000', 'Active', '1998-03-12', NULL);

-- Pilots and Co-Pilots (Managed by E001)
INSERT INTO Employee (E_id, E_lastname, E_firstname, E_birthdate, E_salary, E_status, E_hiredate, E_id_pilot) VALUES
('E004', 'Skywalker', 'Luke', '1980-01-01', '95000', 'Active', '2010-01-01', 'E001'),
('E005', 'Solo', 'Han', '1975-03-15', '98000', 'Active', '2005-05-20', 'E001'),
('E006', 'Vader', 'Darth', '1965-06-06', '120000', 'Active', '1990-12-01', 'E001'),
('E007', 'Kenobi', 'Obiwan', '1970-07-07', '110000', 'Retired', '1995-07-07', 'E001'),
('E008', 'Dameron', 'Poe', '1990-09-09', '85000', 'Active', '2015-09-09', 'E001'),
('E009', 'Yeager', 'Chuck', '1950-02-13', '100000', 'Retired', '1980-01-01', 'E001'),
('E010', 'Earhart', 'Amelia', '1985-07-24', '92000', 'Active', '2012-03-15', 'E001'),
('E011', 'Sullenberger', 'Chesley', '1960-01-23', '105000', 'Active', '1999-11-05', 'E001'),
('E012', 'Lindbergh', 'Charles', '1982-02-04', '88000', 'Active', '2014-06-10', 'E001'),
('E013', 'Ride', 'Sally', '1983-05-26', '90000', 'Active', '2013-08-20', 'E001');

-- Cabin Crew (Managed by E002) - Bulk Insert for volume
INSERT INTO Employee (E_id, E_lastname, E_firstname, E_birthdate, E_salary, E_status, E_hiredate, E_id_pilot) VALUES
('E014', 'Muller', 'Hans', '1990-01-01', '45000', 'Active', '2018-01-01', 'E002'),
('E015', 'Schmidt', 'Anna', '1992-02-02', '46000', 'Active', '2019-02-02', 'E002'),
('E016', 'Rossi', 'Mario', '1993-03-03', '44000', 'Active', '2020-03-03', 'E002'),
('E017', 'Bianchi', 'Luigi', '1994-04-04', '45500', 'Active', '2021-04-04', 'E002'),
('E018', 'Tanaka', 'Ken', '1995-05-05', '47000', 'Active', '2022-05-05', 'E002'),
('E019', 'Kim', 'Min', '1991-06-06', '48000', 'Active', '2017-06-06', 'E002'),
('E020', 'Lee', 'Bruce', '1988-07-07', '50000', 'Active', '2015-07-07', 'E002'),
('E021', 'Garcia', 'Sofia', '1996-08-08', '43000', 'Active', '2023-08-08', 'E002'),
('E022', 'Martinez', 'Carlos', '1989-09-09', '49000', 'Active', '2016-09-09', 'E002'),
('E023', 'Ivanov', 'Dimitri', '1985-10-10', '52000', 'Active', '2014-10-10', 'E002'),
('E024', 'Popov', 'Alexei', '1986-11-11', '51000', 'Active', '2013-11-11', 'E002'),
('E025', 'Nielsen', 'Freja', '1997-12-12', '42000', 'Active', '2024-01-12', 'E002'),
('E026', 'Jensen', 'Lars', '1980-01-13', '55000', 'Active', '2010-01-13', 'E002'),
('E027', 'Silva', 'Joao', '1981-02-14', '54000', 'Active', '2011-02-14', 'E002'),
('E028', 'Santos', 'Maria', '1982-03-15', '53000', 'Active', '2012-03-15', 'E002'),
('E029', 'OConnor', 'Liam', '1983-04-16', '56000', 'Active', '2009-04-16', 'E002'),
('E030', 'Murphy', 'Sarah', '1984-05-17', '57000', 'Active', '2008-05-17', 'E002');

-- Technicians and Admin (Managed by E003)
INSERT INTO Employee (E_id, E_lastname, E_firstname, E_birthdate, E_salary, E_status, E_hiredate, E_id_pilot) VALUES
('E031', 'Bernard', 'Lucas', '1985-06-18', '60000', 'Active', '2015-06-18', 'E003'),
('E032', 'Petit', 'Chloe', '1986-07-19', '61000', 'Active', '2016-07-19', 'E003'),
('E033', 'Robert', 'Thomas', '1987-08-20', '62000', 'Active', '2017-08-20', 'E003'),
('E034', 'Richard', 'Manon', '1988-09-21', '63000', 'Active', '2018-09-21', 'E003'),
('E035', 'Durand', 'Lea', '1989-10-22', '35000', 'Active', '2019-10-22', 'E003'), -- Admin
('E036', 'Leroy', 'Camille', '1990-11-23', '36000', 'Active', '2020-11-23', 'E003'), -- Admin
('E037', 'Moreau', 'Enzo', '1991-12-24', '37000', 'Active', '2021-12-24', 'E003'), -- Admin
('E038', 'Simon', 'Louis', '1992-01-25', '38000', 'Active', '2022-01-25', 'E003'), -- Admin
('E039', 'Laurent', 'Gabriel', '1993-02-26', '65000', 'Active', '2014-02-26', 'E003'),
('E040', 'Lefebvre', 'Alice', '1994-03-27', '66000', 'Active', '2013-03-27', 'E003');

-- Filling the rest to reach 70
INSERT INTO Employee (E_id, E_lastname, E_firstname, E_birthdate, E_salary, E_status, E_hiredate, E_id_pilot) VALUES
('E041', 'Michel', 'Raphael', '1995-04-28', '40000', 'Suspended', '2023-04-28', 'E003'),
('E042', 'David', 'Arthur', '1996-05-29', '40000', 'Active', '2023-05-29', 'E002'),
('E043', 'Bertrand', 'Jules', '1997-06-30', '40000', 'Active', '2023-06-30', 'E002'),
('E044', 'Roux', 'Mathis', '1998-07-01', '40000', 'Active', '2023-07-01', 'E002'),
('E045', 'Vincent', 'Adam', '1999-08-02', '40000', 'Active', '2023-08-02', 'E002'),
('E046', 'Fournier', 'Victor', '2000-09-03', '40000', 'Active', '2023-09-03', 'E002'),
('E047', 'Morel', 'Paul', '2001-10-04', '40000', 'Active', '2023-10-04', 'E002'),
('E048', 'Girard', 'Marc', '1980-11-05', '95000', 'Active', '2010-11-05', 'E001'), -- Pilot
('E049', 'Andre', 'Luc', '1981-12-06', '95000', 'Active', '2011-12-06', 'E001'), -- Pilot
('E050', 'Lefevre', 'Jean', '1982-01-07', '95000', 'Active', '2012-01-07', 'E001'), -- Pilot
('E051', 'Mercier', 'Pierre', '1983-02-08', '40000', 'Active', '2023-02-08', 'E002'),
('E052', 'Dupont', 'Marie', '1984-03-09', '40000', 'Active', '2023-03-09', 'E002'),
('E053', 'Lambert', 'Sophie', '1985-04-10', '40000', 'Active', '2023-04-10', 'E002'),
('E054', 'Bonnet', 'Julie', '1986-05-11', '40000', 'Active', '2023-05-11', 'E002'),
('E055', 'Francois', 'Laura', '1987-06-12', '40000', 'Active', '2023-06-12', 'E002'),
('E056', 'Martinez', 'Lucia', '1988-07-13', '40000', 'Active', '2023-07-13', 'E002'),
('E057', 'Legrand', 'Isabelle', '1989-08-14', '40000', 'Active', '2023-08-14', 'E002'),
('E058', 'Garnier', 'Charlotte', '1990-09-15', '40000', 'Active', '2023-09-15', 'E002'),
('E059', 'Faure', 'Emilie', '1991-10-16', '40000', 'Active', '2023-10-16', 'E002'),
('E060', 'Rousseau', 'Clara', '1992-11-17', '40000', 'Active', '2023-11-17', 'E002'),
('E061', 'Blanc', 'Emma', '1993-12-18', '40000', 'Active', '2023-12-18', 'E002'),
('E062', 'Guerin', 'Ines', '1994-01-19', '40000', 'Active', '2023-01-19', 'E002'),
('E063', 'Boyer', 'Jade', '1995-02-20', '40000', 'Active', '2023-02-20', 'E002'),
('E064', 'Chevalier', 'Louise', '1996-03-21', '40000', 'Active', '2023-03-21', 'E002'),
('E065', 'Mathieu', 'Zoe', '1997-04-22', '40000', 'Active', '2023-04-22', 'E002'),
('E066', 'Clement', 'Alice', '1998-05-23', '40000', 'Active', '2023-05-23', 'E002'),
('E067', 'Morin', 'Lina', '1999-06-24', '40000', 'Active', '2023-06-24', 'E002'),
('E068', 'Nicolas', 'Mila', '2000-07-25', '40000', 'Active', '2023-07-25', 'E002'),
('E069', 'Henry', 'Lea', '2001-08-26', '40000', 'Active', '2023-08-26', 'E002'),
('E070', 'Roussel', 'Rose', '2002-09-27', '40000', 'Active', '2023-09-27', 'E002');

-- =====================================================
-- 3. Planes (20 rows required)
-- =====================================================
INSERT INTO Plane (PL_id, PL_manufacturingyear, PL_status, M_name, A_id) VALUES
('PL001',2010,'Active','Boeing 737','JFK'),
('PL002',2012,'Active','Airbus A320','LHR'),
('PL003',2015,'Maintenance','Boeing 787','CDG'),
('PL004',2018,'Active','Airbus A350','FRA'),
('PL005',2008,'Retired','Embraer E190','NRT'),
('PL006',2011,'Active','Boeing 737','DXB'),
('PL007',2013,'Active','Airbus A320','SYD'),
('PL008',2016,'Maintenance','Boeing 787','GRU'),
('PL009',2019,'Active','Airbus A350','YYZ'),
('PL010',2020,'Active','Embraer E190','HND'),
('PL011',2021,'Active','Boeing 737','JFK'),
('PL012',2022,'Active','Boeing 737','JFK'),
('PL013',2019,'Unavailable','Airbus A320','CDG'),
('PL014',2018,'Active','Airbus A320','CDG'),
('PL015',2017,'Active','Boeing 787','DXB'),
('PL016',2016,'Active','Boeing 787','LHR'),
('PL017',2023,'Active','Airbus A350','FRA'),
('PL018',2024,'Active','Airbus A350','SYD'),
('PL019',2015,'Maintenance','Embraer E190','NRT'),
('PL020',2014,'Active','Embraer E190','HND');

-- =====================================================
-- 4. Flights (50 rows required)
-- =====================================================
INSERT INTO Flight 
(F_id, F_scheduleddeparturedatetime, F_scheduledarrivaldatetime, F_actualdeparturedatetime, F_actualarrivaldatetime, F_status, F_passengersonboard, A_id_departure, A_id_arrival, PL_id)
VALUES
('F001','2024-03-10 08:00:00','2024-03-10 12:00:00','2024-03-10 08:05:00','2024-03-10 12:10:00','Completed',180,'JFK','LHR','PL001'),
('F002','2024-03-11 09:00:00','2024-03-11 13:30:00',NULL,NULL,'Scheduled',150,'CDG','FRA','PL014'),
('F003','2024-03-12 14:00:00','2024-03-12 18:00:00','2024-03-12 14:15:00','2024-03-12 18:05:00','Completed',200,'DXB','SYD','PL006'),
('F004','2024-03-13 10:00:00','2024-03-13 14:00:00','2024-03-13 10:00:00','2024-03-13 14:00:00','Completed',100,'JFK','CDG','PL001'),
('F005','2024-03-14 11:00:00','2024-03-14 15:00:00','2024-03-14 11:10:00','2024-03-14 15:15:00','Completed',120,'LHR','FRA','PL002'),
('F006','2024-03-15 12:00:00','2024-03-15 16:00:00','2024-03-15 12:05:00','2024-03-15 16:05:00','Completed',130,'CDG','NRT','PL004'),
('F007','2024-03-16 13:00:00','2024-03-16 17:00:00','2024-03-16 13:10:00','2024-03-16 17:15:00','Completed',140,'FRA','DXB','PL004'),
('F008','2024-03-17 14:00:00','2024-03-17 18:00:00','2024-03-17 14:15:00','2024-03-17 18:20:00','Completed',150,'NRT','SYD','PL004'),
('F009','2024-03-18 15:00:00','2024-03-18 19:00:00','2024-03-18 15:20:00','2024-03-18 19:25:00','Completed',160,'DXB','GRU','PL015'),
('F010','2024-03-19 16:00:00','2024-03-19 20:00:00','2024-03-19 16:25:00','2024-03-19 20:30:00','Completed',170,'SYD','YYZ','PL018'),
('F011','2024-03-20 17:00:00','2024-03-20 21:00:00','2024-03-20 17:30:00','2024-03-20 21:35:00','Completed',180,'GRU','HND','PL009'),
('F012','2024-03-21 18:00:00','2024-03-21 22:00:00','2024-03-21 18:35:00','2024-03-21 22:40:00','Completed',190,'YYZ','JFK','PL009'),
('F013','2024-03-22 19:00:00','2024-03-22 23:00:00','2024-03-22 19:40:00','2024-03-22 23:45:00','Completed',200,'HND','LHR','PL010'),
('F014','2024-03-23 20:00:00','2024-03-24 00:00:00','2024-03-23 20:45:00','2024-03-24 00:50:00','Completed',210,'JFK','CDG','PL011'),
('F015','2024-03-24 21:00:00','2024-03-25 01:00:00','2024-03-24 21:50:00','2024-03-25 01:55:00','Completed',220,'LHR','FRA','PL016'),
('F016','2024-03-25 22:00:00','2024-03-26 02:00:00','2024-03-25 22:55:00','2024-03-26 03:00:00','Completed',230,'CDG','NRT','PL014'),
('F017','2024-03-26 23:00:00','2024-03-27 03:00:00',NULL,NULL,'Scheduled',240,'FRA','DXB','PL017'),
('F018','2024-03-27 00:00:00','2024-03-27 04:00:00',NULL,NULL,'Scheduled',100,'NRT','SYD','PL020'),
('F019','2024-03-28 01:00:00','2024-03-28 05:00:00',NULL,NULL,'Scheduled',110,'DXB','GRU','PL006'),
('F020','2024-03-29 02:00:00','2024-03-29 06:00:00',NULL,NULL,'Scheduled',120,'SYD','YYZ','PL007'),
('F021','2024-03-30 03:00:00','2024-03-30 07:00:00',NULL,NULL,'Scheduled',130,'GRU','HND','PL009'),
('F022','2024-03-31 04:00:00','2024-03-31 08:00:00',NULL,NULL,'Scheduled',140,'YYZ','JFK','PL009'),
('F023','2024-04-01 05:00:00','2024-04-01 09:00:00',NULL,NULL,'Scheduled',150,'HND','LHR','PL010'),
('F024','2024-04-02 06:00:00','2024-04-02 10:00:00',NULL,NULL,'Scheduled',160,'JFK','CDG','PL011'),
('F025','2024-04-03 07:00:00','2024-04-03 11:00:00',NULL,NULL,'Scheduled',170,'LHR','FRA','PL016'),
('F026','2024-04-04 08:00:00','2024-04-04 12:00:00',NULL,NULL,'Scheduled',180,'CDG','NRT','PL013'),
('F027','2024-04-05 09:00:00','2024-04-05 13:00:00',NULL,NULL,'Scheduled',190,'FRA','DXB','PL004'),
('F028','2024-04-06 10:00:00','2024-04-06 14:00:00',NULL,NULL,'Scheduled',200,'NRT','SYD','PL005'),
('F029','2024-04-07 11:00:00','2024-04-07 15:00:00',NULL,NULL,'Scheduled',210,'DXB','GRU','PL015'),
('F030','2024-04-08 12:00:00','2024-04-08 16:00:00',NULL,NULL,'Scheduled',220,'SYD','YYZ','PL018'),
('F031','2024-04-09 13:00:00','2024-04-09 17:00:00',NULL,NULL,'Scheduled',230,'GRU','HND','PL008'),
('F032','2024-04-10 14:00:00','2024-04-10 18:00:00',NULL,NULL,'Scheduled',240,'YYZ','JFK','PL009'),
('F033','2024-04-11 15:00:00','2024-04-11 19:00:00',NULL,NULL,'Scheduled',100,'HND','LHR','PL020'),
('F034','2024-04-12 16:00:00','2024-04-12 20:00:00',NULL,NULL,'Scheduled',110,'JFK','CDG','PL012'),
('F035','2024-04-13 17:00:00','2024-04-13 21:00:00',NULL,NULL,'Scheduled',120,'LHR','FRA','PL002'),
('F036','2024-04-14 18:00:00','2024-04-14 22:00:00',NULL,NULL,'Scheduled',130,'CDG','NRT','PL014'),
('F037','2024-04-15 19:00:00','2024-04-15 23:00:00',NULL,NULL,'Scheduled',140,'FRA','DXB','PL017'),
('F038','2024-04-16 20:00:00','2024-04-17 00:00:00',NULL,NULL,'Scheduled',150,'NRT','SYD','PL020'),
('F039','2024-04-17 21:00:00','2024-04-18 01:00:00',NULL,NULL,'Scheduled',160,'DXB','GRU','PL006'),
('F040','2024-04-18 22:00:00','2024-04-19 02:00:00',NULL,NULL,'Scheduled',170,'SYD','YYZ','PL007'),
('F041','2024-04-19 23:00:00','2024-04-20 03:00:00',NULL,NULL,'Scheduled',180,'GRU','HND','PL009'),
('F042','2024-04-20 00:00:00','2024-04-20 04:00:00',NULL,NULL,'Scheduled',190,'YYZ','JFK','PL009'),
('F043','2024-04-21 01:00:00','2024-04-21 05:00:00',NULL,NULL,'Scheduled',200,'HND','LHR','PL010'),
('F044','2024-04-22 02:00:00','2024-04-22 06:00:00',NULL,NULL,'Scheduled',210,'JFK','CDG','PL001'),
('F045','2024-04-23 03:00:00','2024-04-23 07:00:00',NULL,NULL,'Scheduled',220,'LHR','FRA','PL002'),
('F046','2024-04-24 04:00:00','2024-04-24 08:00:00',NULL,NULL,'Scheduled',230,'CDG','NRT','PL014'),
('F047','2024-04-25 05:00:00','2024-04-25 09:00:00',NULL,NULL,'Scheduled',240,'FRA','DXB','PL017'),
('F048','2024-04-26 06:00:00','2024-04-26 10:00:00',NULL,NULL,'Scheduled',100,'NRT','SYD','PL020'),
('F049','2024-04-27 07:00:00','2024-04-27 11:00:00',NULL,NULL,'Scheduled',110,'DXB','GRU','PL015'),
('F050','2024-04-28 08:00:00','2024-04-28 12:00:00',NULL,NULL,'Scheduled',120,'SYD','YYZ','PL007');

-- =====================================================
-- 5. Linking Tables (Crucial for queries)
-- =====================================================

-- Pilot Certifications (Assigning models to pilots)
-- E004 to E013 are Pilots/Co-Pilots
INSERT INTO is_certified_for (E_id, M_name) VALUES
('E004', 'Boeing 737'), ('E004', 'Airbus A320'),
('E005', 'Boeing 737'), ('E005', 'Boeing 787'),
('E006', 'Airbus A350'), ('E006', 'Airbus A320'),
('E007', 'Embraer E190'),
('E008', 'Airbus A350'), ('E008', 'Boeing 787'),
('E009', 'Boeing 737'),
('E010', 'Airbus A320'), ('E010', 'Embraer E190'),
('E011', 'Boeing 737'), ('E011', 'Airbus A320'), ('E011', 'Airbus A350'),
('E012', 'Boeing 787'),
('E013', 'Airbus A350'),
('E048', 'Boeing 737'), ('E048', 'Boeing 787'),
('E049', 'Airbus A320'), ('E049', 'Airbus A350');

-- Works_in (Assigning crew to flights)
-- Flight F001 (Boeing 737) - Needs certified pilot
INSERT INTO Works_in (E_id, F_id, R_id) VALUES 
('E004', 'F001', 'R1'), ('E005', 'F001', 'R2'), ('E014', 'F001', 'R3'),
('E006', 'F002', 'R1'), ('E010', 'F002', 'R2'), ('E015', 'F002', 'R3'),
('E005', 'F003', 'R1'), ('E012', 'F003', 'R2'), ('E016', 'F003', 'R3'),
('E004', 'F004', 'R1'), ('E011', 'F004', 'R2'), ('E017', 'F004', 'R3'),
('E010', 'F005', 'R1'), ('E006', 'F005', 'R2'), ('E018', 'F005', 'R3'),
('E006', 'F006', 'R1'), ('E008', 'F006', 'R2'), ('E019', 'F006', 'R3'),
('E013', 'F007', 'R1'), ('E008', 'F007', 'R2'), ('E020', 'F007', 'R3'),
('E006', 'F008', 'R1'), ('E013', 'F008', 'R2'), ('E021', 'F008', 'R3'),
('E012', 'F009', 'R1'), ('E005', 'F009', 'R2'), ('E022', 'F009', 'R3'),
('E008', 'F010', 'R1'), ('E013', 'F010', 'R2'), ('E023', 'F010', 'R3');
-- (Adding entries for remaining flights to ensure queries return data)
INSERT INTO Works_in (E_id, F_id, R_id) VALUES 
('E048', 'F011', 'R1'), ('E049', 'F011', 'R2'), ('E024', 'F011', 'R3'),
('E048', 'F012', 'R1'), ('E049', 'F012', 'R2'), ('E025', 'F012', 'R3'),
('E010', 'F013', 'R1'), ('E007', 'F013', 'R2'), ('E026', 'F013', 'R3'),
('E011', 'F014', 'R1'), ('E004', 'F014', 'R2'), ('E027', 'F014', 'R3'),
('E012', 'F015', 'R1'), ('E005', 'F015', 'R2'), ('E028', 'F015', 'R3');

-- =====================================================
-- 6. Maintenance (30 records required)
-- =====================================================
INSERT INTO Maintenance (PL_id, M_id, M_date) VALUES
('PL001','M001','2023-12-01'), ('PL001','M002','2024-01-01'),
('PL002','M003','2023-11-01'), ('PL003','M004','2024-02-15'),
('PL003','M005','2024-03-01'), ('PL004','M006','2023-10-20'),
('PL006','M007','2024-02-10'), ('PL008','M008','2024-01-25'),
('PL008','M009','2024-02-28'), ('PL010','M010','2024-01-10'),
('PL011','M011','2024-02-01'), ('PL012','M012','2024-02-05'),
('PL013','M013','2023-12-25'), ('PL014','M014','2023-09-30'),
('PL015','M015','2024-01-20'), ('PL016','M016','2024-01-21'),
('PL017','M017','2024-01-22'), ('PL018','M018','2024-01-23'),
('PL019','M019','2024-01-24'), ('PL020','M020','2024-01-25'),
('PL001','M021','2023-08-01'), ('PL002','M022','2023-07-01'),
('PL004','M023','2023-06-01'), ('PL006','M024','2023-05-01'),
('PL007','M025','2023-04-01'), ('PL009','M026','2023-03-01'),
('PL009','M027','2023-02-01'), ('PL011','M028','2023-01-01'),
('PL015','M029','2022-12-01'), ('PL017','M030','2022-11-01');