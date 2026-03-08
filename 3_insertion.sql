-- =====================================================
-- FIRST PASS: Top-Level Employees, Models, Airports, Roles, Planes, Flights, Maintenance
-- =====================================================

-- 1. Insert Models
INSERT INTO Model (M_name, M_capacity, M_maxrange) VALUES
('Boeing 737', 189, 5600),
('Airbus A320', 180, 6100),
('Boeing 787', 242, 13600),
('Airbus A350', 300, 15000),
('Embraer E190', 114, 4500);

-- 2. Insert Airports
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

-- 3. Insert Roles
INSERT INTO Role (R_id, R_name) VALUES
('R1', 'Pilot'),
('R2', 'Co-pilot'),
('R3', 'Cabin crew'),
('R4', 'Maintenance technician'),
('R5', 'Administrative staff');

-- 4. Insert Top-Level Employees (no manager)
INSERT INTO Employee (E_id, E_lastname, E_firstname, E_birthdate, E_salary, E_status, E_hiredate, E_id_pilot) VALUES
('E001','Smith','John','1975-02-15','95000','Active','2000-06-01', NULL),
('E010','Wong','Li','1978-04-23','92000','Active','2002-07-10', NULL),
('E020','Patel','Raj','1976-11-12','94000','Active','2001-03-15', NULL),
('E030','Garcia','Maria','1979-09-05','91000','Active','2003-05-20', NULL),
('E040','Brown','James','1980-01-30','90000','Active','2004-01-10', NULL);

-- 5. Insert Planes
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
('PL010',2020,'Active','Embraer E190','HND');

-- 6. Insert Flights (using correct airport column names)
INSERT INTO Flight 
(F_id, F_scheduleddeparturedatetime, F_scheduledarrivaldatetime, F_actualdeparturedatetime, F_actualarrivaldatetime, F_status, F_passengersonboard, A_id_departure, A_id_arrival, PL_id)
VALUES
('F001','2026-03-10 08:00:00','2026-03-10 12:00:00','2026-03-10 08:05:00','2026-03-10 12:10:00','Completed',180,'JFK','LHR','PL001'),
('F002','2026-03-11 09:00:00','2026-03-11 13:30:00',NULL,NULL,'Scheduled',150,'CDG','FRA','PL003'),
('F003','2026-03-12 14:00:00','2026-03-12 18:00:00','2026-03-12 14:15:00','2026-03-12 18:05:00','Completed',200,'DXB','SYD','PL006');

-- 7. Insert Maintenance (sample)
INSERT INTO Maintenance (PL_id, M_id, M_date) VALUES
('PL001','M001','2025-12-01'),
('PL003','M002','2026-01-15'),
('PL004','M003','2025-11-20'),
('PL006','M004','2026-02-10'),
('PL008','M005','2026-01-25');