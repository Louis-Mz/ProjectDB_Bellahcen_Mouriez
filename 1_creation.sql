CREATE DATABASE IF NOT EXISTS private_aviation_company;
USE private_aviation_company;

CREATE TABLE Employee (
    E_id CHAR(10) NOT NULL,
    E_lastname VARCHAR(50) NOT NULL,
    E_firstname VARCHAR(50) NOT NULL,
    E_birthdate DATE NOT NULL,
    E_salary VARCHAR(50) NOT NULL,
    E_status VARCHAR(50) NOT NULL,
    E_hiredate DATE NOT NULL,
    E_id_pilot CHAR(10), -- here it's NULLABLE because the manager has no manager.
    PRIMARY KEY (E_id),
	FOREIGN KEY (E_id_pilot) REFERENCES Employee(E_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Airport (
    A_id CHAR(3) NOT NULL,
    A_name VARCHAR(100) NOT NULL,
    A_city VARCHAR(50) NOT NULL,
    A_country VARCHAR(50) NOT NULL,
    PRIMARY KEY (A_id)
);

CREATE TABLE Model (
    M_name VARCHAR(50) NOT NULL,
    M_capacity INT NOT NULL,
    M_maxrange INT NOT NULL,
    PRIMARY KEY (M_name)
);

CREATE TABLE Role (
    R_id CHAR(10) NOT NULL,
    R_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (R_id)
);

CREATE TABLE Plane (
    PL_id CHAR(15) NOT NULL,
    PL_manufacturingyear INT,
    PL_status VARCHAR(20) NOT NULL,
    M_name VARCHAR(50) NOT NULL,
    A_id CHAR(3) NOT NULL,
    PRIMARY KEY (PL_id),
	FOREIGN KEY (M_name) REFERENCES Model(M_name) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (A_id) REFERENCES Airport(A_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Flight (
    F_id CHAR(10) NOT NULL,
    F_scheduleddeparturedatetime DATETIME NOT NULL,
    F_scheduledarrivaldatetime DATETIME NOT NULL,
    F_actualdeparturedatetime DATETIME,
    F_actualarrivaldatetime DATETIME,
    F_status VARCHAR(20) NOT NULL,
    F_passengersonboard INT,
    A_id_departure CHAR(3) NOT NULL, -- #A_id in LDM
    A_id_arrival CHAR(3) NOT NULL, -- #A_id_1 in LDM
    PL_id CHAR(15) NOT NULL,
    PRIMARY KEY (F_id),
    FOREIGN KEY (A_id_departure) REFERENCES Airport(A_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (A_id_arrival) REFERENCES Airport(A_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (PL_id) REFERENCES Plane(PL_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Maintenance (
    PL_id CHAR(15) NOT NULL,
    M_id VARCHAR(50) NOT NULL,
    M_date DATE NOT NULL,
    PRIMARY KEY (PL_id, M_id),
	FOREIGN KEY (PL_id) REFERENCES Plane(PL_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Works_in (
    E_id CHAR(10) NOT NULL,
    F_id CHAR(10) NOT NULL,
    R_id CHAR(10) NOT NULL,
    PRIMARY KEY (E_id, F_id, R_id),
    FOREIGN KEY (E_id) REFERENCES Employee(E_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (F_id) REFERENCES Flight(F_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (R_id) REFERENCES Role(R_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE is_certified_for (
    E_id CHAR(10) NOT NULL,
    M_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (E_id, M_name),
    FOREIGN KEY (E_id) REFERENCES Employee(E_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (M_name) REFERENCES Model(M_name) ON DELETE CASCADE ON UPDATE CASCADE
);