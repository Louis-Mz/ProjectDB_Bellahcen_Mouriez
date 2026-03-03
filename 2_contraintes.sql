USE private_aviation_company;

-- ### Employee Constraints ###
-- hire date is after birth date :
ALTER TABLE Employee ADD CONSTRAINT chk_employee_dates CHECK (E_hiredate > E_birthdate);

-- specific status values :
ALTER TABLE Employee ADD CONSTRAINT chk_employee_status CHECK (E_status IN ('Active', 'Suspended', 'Retired'));

-- ### Plane Constraints ###
-- specific plane status values
ALTER TABLE Plane ADD CONSTRAINT chk_plane_status CHECK (PL_status IN ('Active', 'Maintenance', 'Unavailable', 'Retired'));

-- ### Flight Constraints ###
-- scheduled arrival must be after scheduled departure
ALTER TABLE Flight ADD CONSTRAINT chk_flight_schedule CHECK (F_scheduledarrivaldatetime > F_scheduleddeparturedatetime);

-- actual arrival must be after actual departure
ALTER TABLE Flight
ADD CONSTRAINT chk_flight_actual CHECK ((F_actualdeparturedatetime IS NULL OR F_actualarrivaldatetime IS NULL) OR (F_actualarrivaldatetime > F_actualdeparturedatetime));

-- there is not a negative number of passengers
ALTER TABLE Flight ADD CONSTRAINT chk_flight_passengers CHECK (F_passengersonboard >= 0);

-- specific flight status
ALTER TABLE Flight ADD CONSTRAINT chk_flight_status CHECK (F_status IN ('Scheduled', 'Delayed', 'Cancelled', 'In Air', 'Completed'));

-- ### Other Constraints ###
-- capacity and range must be positive
ALTER TABLE Model ADD CONSTRAINT chk_model_capacity CHECK (M_capacity > 0);
ALTER TABLE Model ADD CONSTRAINT chk_model_range CHECK (M_maxrange > 0);