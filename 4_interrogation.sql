-- =====================================
-- ANNUAL OPERATIONAL AUDIT – AIRLINE
-- =====================================

-- =====================================
-- 1. Personnel Analysis
-- =====================================

-- Active employees (ordered by salary descending)
select E_id, E_firstname, E_lastname, E_salary
from Employee
where E_status = 'active'
order by E_salary desc;

-- Employees born between 1980 and 1995
select E_id, E_firstname, E_lastname
from Employee
where E_birthdate between '1980-01-01' and '1995-12-31'
order by E_birthdate;

-- Employees whose last name starts with 'M'
select E_id, E_firstname, E_lastname
from Employee
where E_lastname like 'M%'
order by E_lastname, E_firstname;

-- Employees earning more than the average salary
select E.E_lastname, E.E_firstname, E.E_salary
from Employee E
where E.E_salary > (
    select avg(cast(E_salary as decimal(10,2)))
    from Employee
);

-- Employees not working on any flight
select E_lastname, E_firstname
from Employee E
where not exists (
    select W.E_id
    from Works_in W
    where E.E_id = W.E_id
);

-- Average salary per employee status
select E_status, avg(cast(E_salary as decimal(10,2))) as average_salary
from Employee
group by E_status;

-- =====================================
-- 2. Flight Analysis
-- =====================================

-- Flights that occurred between two dates
select F_id, PL_id, F_actualdeparturedatetime, F_status
from Flight
where F_actualdeparturedatetime between '2025-01-01 00:00:00' and '2026-01-01 00:00:00'
order by F_actualdeparturedatetime;

-- Distinct flight statuses
select distinct F_status
from Flight;

-- Number of flights per airplane
select PL_id, count(*)
from Flight
group by PL_id
having count(*) > 50;

-- Number of flights per departure airport
select A.A_id, count(F.F_id) as total_flights
from Airport A
join Flight F on A.A_id = F.A_id_1
group by A.A_id
order by total_flights desc;

-- Flights with airplane information
select F.F_actualdeparturedatetime, F.F_actualarrivaldatetime, P.PL_id
from Flight F
join Plane P on P.PL_id = F.PL_id
order by F_actualdeparturedatetime;

-- Flights with airplane model used
select F.F_id, M.M_name as model
from Flight F
join Plane P on F.PL_id = P.PL_id
join Model M on P.M_name = M.M_name
order by F.F_actualdeparturedatetime;

-- Flights using airplanes with capacity above the average
select F.F_id
from Flight F
join Plane P on F.PL_id = P.PL_id
join Model M on P.M_name = M.M_name
where M.M_capacity > (
    select avg(M_capacity)
    from Model
);

-- =====================================
-- 3. Airplane Analysis
-- =====================================

-- Total passengers transported per airplane
select P.PL_id, sum(F.F_passengersonboard)
from Plane P
join Flight F on P.PL_id = F.PL_id
group by P.PL_id
having sum(F.F_passengersonboard) > 10000;

-- Airplanes that never had maintenance
select P.PL_id
from Plane P
where not exists (
    select M.PL_id
    from Maintenance M
    where P.PL_id = M.PL_id
);

-- Airplanes with more maintenance than any other airplane
select PL_id
from Maintenance
group by PL_id
having count(*) > all (
    select count(*)
    from Maintenance
    group by PL_id
);

-- =====================================
-- 4. Maintenance Analysis
-- =====================================

-- Number of maintenance interventions per airplane
select P.PL_id, count(M.PL_id)
from Plane P
join Maintenance M on P.PL_id = M.PL_id
group by P.PL_id
having count(M.PL_id) >= 2;

-- List of airplanes and their maintenance (including airplanes without maintenance)
select P.PL_id, M.M_id
from Plane P
left join Maintenance M on P.PL_id = M.PL_id;

-- =====================================
-- 5. Roles and Certifications
-- =====================================

-- Number of employees per role
select R.R_id, R_name, count(W.R_id)
from Role R
join Works_in W on R.R_id = W.R_id
group by R.R_id, R.R_name
having count(W.R_id) > 10;

-- Employees and their roles on flights
select E.E_lastname, E.E_firstname, F.F_id as flight_id, R.R_name as role
from Employee E
join Works_in W on E.E_id = W.E_id
join Role R on W.R_id = R.R_id
join Flight F on F.F_id = W.F_id
order by E.E_lastname, E.E_firstname, F.F_actualdeparturedatetime;

-- Pilots and models they are certified for
select E.E_lastname, E.E_firstname, M.M_name
from Employee E
join is_certified_for I on E.E_id = I.E_id
join Model M on M.M_name = I.M_name
where E.E_id_pilot is null
order by E.E_lastname, E.E_firstname;

-- =====================================
-- 6. Airport Analysis
-- =====================================

-- Airports located in specific countries
select A_name, A_city
from Airport
where A_country in ('France','Germany','Spain')
order by A_city;

-- Airplane models used for all flights from a given airport (CDG)
select P.M_name
from Plane P
join Flight F on P.PL_id = F.PL_id
where F.A_id = 'CDG'
group by P.M_name
having count(distinct F.F_id) = (
    select count(*)
    from Flight
    where A_id = 'CDG'
);

-- =====================================
-- 7. Airplane Model Capacity Analysis
-- =====================================

-- Models with capacity greater than at least one other model
select M_name
from Model
where M_capacity > any (
    select M_capacity
    from Model
);