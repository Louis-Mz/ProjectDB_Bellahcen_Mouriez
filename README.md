# ProjectDB_Bellahcen_Mouriez

# Private Aviation Company – MERISE Requirements Phase

This document describes the operational and business rules, along with the raw data dictionary, for a private aviation company operating commercial-style private flights (similar in structure to commercial airlines like Air France, but specialized in private aviation). The content reflects operational/business perspectives rather than technical database design.

## 1️⃣ Business Rules

These rules define how the company operates in practice.

### General Operations
- The company operates private flights between airports worldwide.
- Each flight is operated by one specific aircraft, which belongs to the company.
- Aircraft have unique registration numbers and defined passenger capacities.
- Aircraft require regular maintenance checks.
- A flight cannot be scheduled if the aircraft is under maintenance.
- A flight must have at least one pilot assigned.
- A flight must have at least one cabin crew member when passengers are onboard.
- Employees can only be assigned to flights if their certifications are valid.

### Employees
- Every employee has a unique employee number.
- Employees belong to one professional category:
  - Pilot, Co-pilot, Cabin crew, Maintenance technician, Administrative staff.
- Pilots are certified for specific aircraft models.
- Employees have a hiring date.
- Employment statuses include: active, suspended, retired.
- An employee may be assigned to multiple flights.
- A flight may involve several employees.

### Aircraft
- Each aircraft has:
  - A unique registration number
  - Model
  - Manufacturing year
  - Maximum passenger capacity
  - Range (maximum flight distance)
- Aircraft are assigned to a single base airport.
- Aircraft have a current operational status: active, under maintenance, unavailable.
- Maintenance operations are recorded with dates.
- An aircraft can undergo multiple maintenance operations over time.

### Airports
- Each airport has:
  - Unique IATA code
  - Name
  - City
  - Country
- Flights depart from one airport and arrive at another.
- An airport may serve as a base for multiple aircraft.
- Multiple flights can depart from or arrive at the same airport.

### Flights
- Each flight has a unique flight number.
- Flight details include:
  - Scheduled departure & arrival date/time
  - Departure and arrival airports
- Flight status can be: scheduled, delayed, cancelled, completed.
- Flight delays and durations are recorded.
- Each flight is operated by one aircraft only.
- Crew must be assigned before departure.
- Number of passengers cannot exceed aircraft capacity.
- Actual departure and arrival times are recorded.

## 2️⃣ Raw Data Dictionary

This table lists all identified data items without implying any database structure.

| Data Item                        | Type         | Size |
| -------------------------------- | ------------ | ---- |
| Employee number                  | Alphanumeric | 10   |
| Employee last name               | Alphabetic   | 50   |
| Employee first name              | Alphabetic   | 50   |
| Employee date of birth           | Date         | 10   |
| Employee hire date               | Date         | 10   |
| Employee professional category   | Alphabetic   | 30   |
| Employee status                  | Alphabetic   | 20   |
| Pilot license number             | Alphanumeric | 20   |
| Pilot license expiry date        | Date         | 10   |
| Aircraft registration number     | Alphanumeric | 15   |
| Aircraft model name              | Alphanumeric | 50   |
| Aircraft manufacturing year      | Numeric      | 4    |
| Aircraft passenger capacity      | Numeric      | 3    |
| Aircraft maximum range (km)      | Numeric      | 6    |
| Aircraft operational status      | Alphabetic   | 20   |
| Maintenance date                 | Date         | 10   |
| Maintenance description          | Alphanumeric | 255  |
| Airport IATA code                | Alphabetic   | 3    |
| Airport name                     | Alphanumeric | 100  |
| Airport city                     | Alphabetic   | 50   |
| Airport country                  | Alphabetic   | 50   |
| Flight number                    | Alphanumeric | 10   |
| Scheduled departure datetime     | DateTime     | 19   |
| Scheduled arrival datetime       | DateTime     | 19   |
| Actual departure datetime        | DateTime     | 19   |
| Actual arrival datetime          | DateTime     | 19   |
| Flight status                    | Alphabetic   | 20   |
| Delay duration (minutes)         | Numeric      | 4    |
| Number of passengers onboard     | Numeric      | 3    |
| Aircraft base airport code       | Alphabetic   | 3    |
| Crew flight assignment role      | Alphabetic   | 30   |

Total data items: 31

Total data items: 31
