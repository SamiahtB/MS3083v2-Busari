-- ============================================================================
-- Project: AutoNation Car Database
-- ============================================================================
--
-- Student Name:  Samiaht Busari + Tireni Oni 
-- Date:         May 11, 2026
-- Course:       MS 3083 — Data Management in Business Analytics 


-- ############################################################################
--
--     PART 1: CREATE THE SCHEMA AND TABLES 
--
-- ############################################################################
DROP SCHEMA IF EXISTS AutoNation_Dealership_Database CASCADE;
CREATE SCHEMA AutoNation_Dealership_Database;


-- ============================================================================
-- TASK 1.2: CREATE THE VEHICLE TABLE
-- ============================================================================
CREATE TABLE AutoNation_Dealership_Database.Vehicles (
    VEHICLE_ID    SERIAL PRIMARY KEY,
    MAKE VARCHAR(100)  NOT NULL,
    MODEL   VARCHAR(100)  NOT NULL,
    VIN_NUMBER  VARCHAR(17) NOT NULL,
    YEAR    INT NOT NULL,
    USED_OR_NEW  VARCHAR(20) NOT NULL,
    CAR_LINK TEXT NOT NULL
);

-- ============================================================================
-- TASK 1.3: CREATE THE ENGINE TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Engine (
    ENGINE_ID    SERIAL PRIMARY KEY,
    ENGINE_NAME VARCHAR(100)  NOT NULL,
    ENGINE_TYPE  VARCHAR(100) NOT NULL,
    HORSEPOWER  VARCHAR(100) NOT NULL,
    TORQUE     VARCHAR(100) NOT NULL,
    TRANSMISSION_TYPE  VARCHAR(100) NOT NULL,
    DRIVE_TYPE VARCHAR(100) NOT NULL
);

-- ============================================================================
-- TASK 1.4: CREATE THE FUEL TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Fuel (
    FUEL_ID    SERIAL PRIMARY KEY,
    FUEL_TYPE VARCHAR(100)  NOT NULL,
    TANK_CAPACITY DECIMAL(5,2) NOT NULL,
    MPG_CITY   VARCHAR(100) NOT NULL
);

-- ============================================================================
-- TASK 1.5: CREATE THE WHEELS TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Wheels (
    WHEEL_ID    SERIAL PRIMARY KEY,
    FRONT_WHEEL_SIZE VARCHAR(100)  NOT NULL,
    REAR_WHEEL_SIZE VARCHAR(100) NOT NULL,
    WHEEL_TYPE VARCHAR(100) NOT NULL
);

-- ============================================================================
-- TASK 1.6: CREATE THE TIRES TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Tires (
    TIRE_ID    SERIAL PRIMARY KEY,
    FRONT_TIRE_SIZE VARCHAR(100)  NOT NULL,
    REAR_TIRE_SIZE VARCHAR(100) NOT NULL
);

-- ============================================================================
-- TASK 1.7: CREATE THE BRAKES TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Brakes (
    BRAKES_ID    SERIAL PRIMARY KEY,
    BRAKE_TYPE VARCHAR(100)  NOT NULL,
    BRAKE_ABS_SYSTEM_TYPE VARCHAR(100) NOT NULL
);

-- ============================================================================
-- TASK 1.8: CREATE THE STEERING TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Steering (
    STEERING_ID    SERIAL PRIMARY KEY,
    STEERING_SYSTEM_TYPE TEXT  NOT NULL,
    TURNING_DIAMETER DECIMAL (5,2) NOT NULL
);


-- ============================================================================
-- TASK 1.9: CREATE THE SUSPENSION TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Suspension (
    SUSPENSION_ID    SERIAL PRIMARY KEY,
    FRONT_SUSPENSION_TYPE VARCHAR(100)  NOT NULL,
    REAR_SUSPENSION_TYPE VARCHAR(100) NOT NULL
);

-- ============================================================================
-- TASK 1.10: CREATE THE EXTERIOR TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Exterior (
    EXTERIOR_ID    SERIAL PRIMARY KEY,
    CAR_LENGTH DECIMAL(6,2) NOT NULL,
    CAR_WIDTH DECIMAL(6,2) NOT NULL,
    WHEEL_BASE DECIMAL(6,2) NOT NULL,
    CAR_COLOR VARCHAR(70)  NOT NULL,
    BODY_STYLE VARCHAR(70) NOT NULL,
    NUMBER_OF_DOORS INT NOT NULL,
    HEADLIGHT_TYPE VARCHAR(70) NOT NULL
);

-- ============================================================================
-- TASK 1.11: CREATE THE INTERIOR TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Interior (
    INTERIOR_ID    SERIAL PRIMARY KEY,
    KEYLESS_ENTRY BOOLEAN NOT NULL,
    SEAT_MATERIAL VARCHAR(100)  NOT NULL,
    SEATING_CAPACITY INT NOT NULL,
    ENTERTAINMENT_SYSTEM TEXT NOT NULL,
    CRUISE_CONTROL BOOLEAN NOT NULL,
    AUTO_LOCK BOOLEAN NOT NULL,
    STEERING_WHEEL_MATERIAL VARCHAR(100) NOT NULL,
    BACK_CAMERA BOOLEAN NOT NULL
);

-- ============================================================================
-- TASK 1.12: CREATE THE CARGO  TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Cargo_Area (
    CARGO_AREA_ID    SERIAL PRIMARY KEY,
    CARGO_VOLUME DECIMAL(6,2) NOT NULL
);

-- ============================================================================
-- TASK 1.13: CREATE THE WEIGHT TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Weight(
    WEIGHT_ID    SERIAL PRIMARY KEY,
    CURB_WEIGHT INT NOT NULL
);

-- ============================================================================
-- TASK 1.13: CREATE THE EMISSIONS TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Emissions(
    EMISSIONS_ID    SERIAL PRIMARY KEY,
    EMISSIONS_PER_YEAR DECIMAL(6,2) NOT NULL
);

-- ============================================================================
-- TASK 1.13: CREATE THE COST TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Cost(
    COST_ID    SERIAL PRIMARY KEY,
    TOTAL_PRICE DECIMAL(10,2) NOT NULL,
    TITLE_APPLICATION_FEE DECIMAL(10,2) NOT NULL,
    DEALER_FEE DECIMAL(10,2) NOT NULL,
    VEHICLE_REGISTRATION_FEE DECIMAL(10,2) NOT NULL,
    LICENSE_PLATE_COST DECIMAL(10,2) NOT NULL
);

-- ============================================================================
-- TASK 1.13: CREATE THE SALESPERSON TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Salesperson(
    SALESPERSON_ID   SERIAL PRIMARY KEY,
    FIRST_NAME VARCHAR(100)  NOT NULL,
    LAST_NAME VARCHAR(100)  NOT NULL,
    EXPERIENCE_YEARS INT NOT NULL
);

-- ============================================================================
-- TASK 1.13: CREATE THE SALES TABLE 
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Sales (
    SALES_ID          SERIAL PRIMARY KEY,
    VEHICLE_ID        INT REFERENCES AutoNation_Dealership_Database.Vehicles(VEHICLE_ID),
    PURCHASE_DATE     DATE,
    PAYMENT_METHOD    VARCHAR(100),
    PAYMENT_FINANCED  BOOLEAN,
    SALESPERSON_ID    INT REFERENCES AutoNation_Dealership_Database.Salesperson(SALESPERSON_ID)
);

-- ============================================================================
-- TASK 1.14: CREATE THE TRANSACTION TABLE 
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Transaction (
    TRANSACTION_ID   SERIAL PRIMARY KEY,
    SALES_ID         INT REFERENCES AutoNation_Dealership_Database.Sales(SALES_ID),
    TRANSACTION_DATE DATE NOT NULL,
    AMOUNT_PAID      DECIMAL(6,2) NOT NULL,
    PAYMENT_METHOD   VARCHAR(100) NOT NULL,
    DOWN_PAYMENT     BOOLEAN NOT NULL,
    PAID_IN_FULL     BOOLEAN NOT NULL
);

ALTER TABLE AutoNation_Dealership_Database.Transaction
    ADD COLUMN tax_amount        DECIMAL(6,2) NOT NULL DEFAULT 0,
    ADD COLUMN total_with_tax    DECIMAL(6,2) NOT NULL DEFAULT 0,
    ADD COLUMN sales_person_id   INT REFERENCES AutoNation_Dealership_Database.Salesperson(SALESPERSON_ID),
    ADD COLUMN customer_id       INT REFERENCES AutoNation_Dealership_Database.Customers(CUSTOMER_ID);
-- ============================================================================
-- TASK 1.15: CREATE THE CUSTOMERS TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Customers(
    CUSTOMER_ID   SERIAL PRIMARY KEY,
    FIRST_NAME VARCHAR(100)  NOT NULL,
    LAST_NAME VARCHAR(100)  NOT NULL,
    EMAIL VARCHAR(100)  NOT NULL,
    PHONE_NUMBER VARCHAR(15) NOT NULL,
    ADDRESS TEXT NOT NULL,
    CITY VARCHAR(100) NOT NULL,
    STATE VARCHAR(100) NOT NULL,
    ZIP_CODE VARCHAR(10) NOT NULL
);

-- ============================================================================
-- TASK 1.13: CREATE THE SALES TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Sales (
    SALES_ID          SERIAL PRIMARY KEY,
    VEHICLE_ID        INT REFERENCES AutoNation_Dealership_Database.Vehicles(VEHICLE_ID),
    PURCHASE_DATE     DATE,
    PAYMENT_METHOD    VARCHAR(100),
    PAYMENT_FINANCED  BOOLEAN,
    SALESPERSON_ID    INT REFERENCES AutoNation_Dealership_Database.Salesperson(SALESPERSON_ID),
    CUSTOMER_ID       INT REFERENCES AutoNation_Dealership_Database.Customers(CUSTOMER_ID)
);

-- ============================================================================
-- TASK 1.16: CREATE THE FINANCING TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Financing(
    FINANCING_ID      SERIAL PRIMARY KEY,
    SALES_ID          INT REFERENCES AutoNation_Dealership_Database.Sales(SALES_ID),
    DOWN_PAYMENT      DECIMAL(10,2) NOT NULL,
    AMOUNT_FINANCED   DECIMAL(10,2) NOT NULL,
    INTEREST_RATE     DECIMAL(5,2) NOT NULL,
    LOAN_TERMS_MONTHS INT,
    MONTHLY_PAYMENT   DECIMAL(10,2) NOT NULL,
    LENDER_NAME       VARCHAR(100),
    LOAN_START_DATE   DATE
);

-- ============================================================================
-- TASK 1.17: CREATE THE WARRANTY TABLE
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Warranty(
    WARRANTY_ID     SERIAL PRIMARY KEY,
    SALES_ID     INT REFERENCES AutoNation_Dealership_Database.Sales(SALES_ID),
    WARRANTY_TYPE   VARCHAR(100) NOT NULL,
    DURATION_MONTHS  INT NOT NULL,
    MILEAGE INT NOT NULL,
    COST   DECIMAL(5,2) NOT NULL
);



-- ############################################################################
--
--     PART 2: INSERT BRIDGE TABLE
--
-- ############################################################################

CREATE TABLE AutoNation_Dealership_Database.Features_Bridge(
    VEHICLE_ID      INT NOT NULL,
    ENGINE_ID       INT NOT NULL,
    FUEL_ID         INT NOT NULL,
    WHEEL_ID        INT NOT NULL,
    TIRE_ID         INT NOT NULL,
    BRAKES_ID       INT NOT NULL,
    STEERING_ID     INT NOT NULL,
    SUSPENSION_ID   INT NOT NULL,
    EXTERIOR_ID     INT NOT NULL,
    INTERIOR_ID     INT NOT NULL,
    CARGO_ID        INT NOT NULL,
    WEIGHT_ID       INT NOT NULL,
    EMISSIONS_ID    INT NOT NULL,
    COST_ID         INT NOT NULL,
    PRIMARY KEY (VEHICLE_ID),
    CONSTRAINT fk_vehicle    FOREIGN KEY (VEHICLE_ID)    REFERENCES AutoNation_Dealership_Database.Vehicles(VEHICLE_ID),
    CONSTRAINT fk_engine     FOREIGN KEY (ENGINE_ID)     REFERENCES AutoNation_Dealership_Database.Engine(ENGINE_ID),
    CONSTRAINT fk_fuel       FOREIGN KEY (FUEL_ID)       REFERENCES AutoNation_Dealership_Database.Fuel(FUEL_ID),
    CONSTRAINT fk_wheel      FOREIGN KEY (WHEEL_ID)      REFERENCES AutoNation_Dealership_Database.Wheels(WHEEL_ID),
    CONSTRAINT fk_tire       FOREIGN KEY (TIRE_ID)       REFERENCES AutoNation_Dealership_Database.Tires(TIRE_ID),
    CONSTRAINT fk_brakes     FOREIGN KEY (BRAKES_ID)     REFERENCES AutoNation_Dealership_Database.Brakes(BRAKES_ID),
    CONSTRAINT fk_steering   FOREIGN KEY (STEERING_ID)   REFERENCES AutoNation_Dealership_Database.Steering(STEERING_ID),
    CONSTRAINT fk_suspension FOREIGN KEY (SUSPENSION_ID) REFERENCES AutoNation_Dealership_Database.Suspension(SUSPENSION_ID),
    CONSTRAINT fk_exterior   FOREIGN KEY (EXTERIOR_ID)   REFERENCES AutoNation_Dealership_Database.Exterior(EXTERIOR_ID),
    CONSTRAINT fk_interior   FOREIGN KEY (INTERIOR_ID)   REFERENCES AutoNation_Dealership_Database.Interior(INTERIOR_ID),
    CONSTRAINT fk_cargo      FOREIGN KEY (CARGO_ID)      REFERENCES AutoNation_Dealership_Database.Cargo_Area(CARGO_AREA_ID),
    CONSTRAINT fk_weight     FOREIGN KEY (WEIGHT_ID)     REFERENCES AutoNation_Dealership_Database.Weight(WEIGHT_ID),
    CONSTRAINT fk_emissions  FOREIGN KEY (EMISSIONS_ID)  REFERENCES AutoNation_Dealership_Database.Emissions(EMISSIONS_ID),
    CONSTRAINT fk_cost       FOREIGN KEY (COST_ID)       REFERENCES AutoNation_Dealership_Database.Cost(COST_ID)
);

-- ############################################################################
--
--     PART 3.1 : LOAD DATA FROM CSV FILES  
--
-- ############################################################################

     COPY AutoNation_Dealership_Database.Vehicles (VEHICLE_ID, MAKE, MODEL, VIN_NUM, YEAR, USED_OR_NEW, CAR_LINK) FROM '/workspaces/MS3083v2-Busari/data/autonation/vehicle.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Engine (ENGINE_ID, ENGINE_NAME, ENGINE_TYPE, HORSEPOWER, TORQUE, TRANSMISSION_TYPE, DRIVE_TYPE) FROM '/workspaces/MS3083v2-Busari/data/autonation/engine.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Fuel (FUEL_ID, FUEL_TYPE, TANK_CAPACITY, MPG_CITY) FROM '/workspaces/MS3083v2-Busari/data/autonation/fuel.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Wheels (WHEEL_ID, FRONT_WHEEL_SIZE, REAR_WHEEL_SIZE, WHEEL_TYPE) FROM '/workspaces/MS3083v2-Busari/data/autonation/wheels.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Tires (TIRE_ID, FRONT_TIRE_SIZE, REAR_TIRE_SIZE) FROM '/workspaces/MS3083v2-Busari/data/autonation/tires.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Brakes (BRAKES_ID, BRAKE_TYPE, BRAKE_ABS_SYSTEM_TYPE) FROM '/workspaces/MS3083v2-Busari/data/autonation/brakes.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Steering (STEERING_ID, STEERING_SYSTEM_TYPE, TURNING_DIAMETER) FROM '/workspaces/MS3083v2-Busari/data/autonation/steering.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Suspension (SUSPENSION_ID, FRONT_SUSPENSION_TYPE, REAR_SUSPENSION_TYPE) FROM '/workspaces/MS3083v2-Busari/data/autonation/suspension.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Exterior (EXTERIOR_ID, CAR_LENGTH, CAR_WIDTH, WHEEL_BASE, CAR_COLOR, BODY_STYLE, NUMBER_OF_DOORS, HEADLIGHT_TYPE) FROM '/workspaces/MS3083v2-Busari/data/autonation/exterior.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Interior (INTERIOR_ID, KEYLESS_ENTRY, SEAT_MATERIAL, SEATING_CAPACITY, ENTERTAINMENT_SYSTEM, CRUISE_CONTROL, AUTO_LOCK, STEERING_WHEEL_MATERIAL, BACK_CAMERA) FROM '/workspaces/MS3083v2-Busari/data/autonation/interior.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Cargo_Area (CARGO_AREA_ID, CARGO_VOLUME) FROM '/workspaces/MS3083v2-Busari/data/autonation/cargo.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Weight (WEIGHT_ID, CURB_WEIGHT) FROM '/workspaces/MS3083v2-Busari/data/autonation/weight.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Emissions (EMISSIONS_ID, EMISSIONS_PER_YEAR) FROM '/workspaces/MS3083v2-Busari/data/autonation/emissions.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Cost (COST_ID, TOTAL_PRICE, TITLE_APPLICATION_FEE, DEALER_FEE, VEHICLE_REGISTRATION_FEE, LICENSE_PLATE_COST) FROM '/workspaces/MS3083v2-Busari/data/autonation/cost.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Salesperson (SALESPERSON_ID, FIRST_NAME, LAST_NAME, EXPERIENCE_YEARS, COMMISSION_RATE) FROM '/workspaces/MS3083v2-Busari/data/autonation/salesperson.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Customers (CUSTOMER_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, ADDRESS, CITY, STATE, ZIP_CODE) FROM '/workspaces/MS3083v2-Busari/data/autonation/customers.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Sales (SALES_ID, VEHICLE_ID, PURCHASE_DATE, PAYMENT_FINANCED, PAYMENT_METHOD, SALESPERSON_ID, CUSTOMER_ID) FROM '/workspaces/MS3083v2-Busari/data/autonation/sales.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Transactions (TRANSACTION_ID, SALES_ID, CUSTOMER_ID, SALES_PERSON_ID, TRANSACTION_DATE, AMOUNT_PAID, PAYMENT_METHOD, DOWN_PAYMENT, PAID_IN_FULL, TAX_AMOUNT, TOTAL_WITH_TAX) FROM '/workspaces/MS3083v2-Busari/data/autonation/transactions.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Financing (FINANCING_ID, SALES_ID, DOWN_PAYMENT, AMOUNT_FINANCED, INTEREST_RATE, LOAN_TERMS_MONTHS, MONTHLY_PAYMENT, LENDER_NAME, LOAN_START_DATE) FROM '/workspaces/MS3083v2-Busari/data/autonation/financing.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Warranty (WARRANTY_ID, SALES_ID, WARRANTY_TYPE, DURATION_MONTHS, MILEAGE, COST, START_DATE, EXPIRATION_DATE, COVERAGE_DETAILS) FROM '/workspaces/MS3083v2-Busari/data/autonation/warranty.csv' WITH (FORMAT csv, HEADER true);

COPY AutoNation_Dealership_Database.Features_Bridge (VEHICLE_ID, ENGINE_ID, FUEL_ID, WHEEL_ID, TIRE_ID, BRAKES_ID, STEERING_ID, SUSPENSION_ID, EXTERIOR_ID, INTERIOR_ID, CARGO_ID, WEIGHT_ID, EMISSIONS_ID, COST_ID) FROM '/workspaces/MS3083v2-Busari/data/autonation/features_bridge.csv' WITH (FORMAT csv, HEADER true);



-- ============================================================================
-- TASK 3.2: VERIFY THE DATA (Checking for row counts)
-- ============================================================================

    SELECT 'Vehicles' AS table_name,       COUNT(*) AS row_count FROM AutoNation_Dealership_Database.Vehicles
    UNION ALL
    
    SELECT 'Engine',                       COUNT(*) FROM AutoNation_Dealership_Database.Engine
    UNION ALL

    SELECT 'Fuel',                         COUNT(*) FROM AutoNation_Dealership_Database.Fuel
    UNION ALL

    SELECT 'Wheels',                       COUNT(*) FROM AutoNation_Dealership_Database.Wheels
    UNION ALL

    SELECT 'Tires',                        COUNT(*) FROM AutoNation_Dealership_Database.Tires
    UNION ALL

    SELECT 'Brakes',                       COUNT(*) FROM AutoNation_Dealership_Database.Brakes
    UNION ALL

    SELECT 'Steering',                     COUNT(*) FROM AutoNation_Dealership_Database.Steering
    UNION ALL

    SELECT 'Suspension',                   COUNT(*) FROM AutoNation_Dealership_Database.Suspension
    UNION ALL

    SELECT 'Exterior',                     COUNT(*) FROM AutoNation_Dealership_Database.Exterior
    UNION ALL

    SELECT 'Interior',                     COUNT(*) FROM AutoNation_Dealership_Database.Interior
    UNION ALL

    SELECT 'Cargo_Area',                   COUNT(*) FROM AutoNation_Dealership_Database.Cargo_Area
    UNION ALL

    SELECT 'Weight',                       COUNT(*) FROM AutoNation_Dealership_Database.Weight
    UNION ALL

    SELECT 'Emissions',                    COUNT(*) FROM AutoNation_Dealership_Database.Emissions
    UNION ALL

    SELECT 'Cost',                         COUNT(*) FROM AutoNation_Dealership_Database.Cost
    UNION ALL

    SELECT 'Salesperson',                  COUNT(*) FROM AutoNation_Dealership_Database.Salesperson
    UNION ALL

    SELECT 'Sales',                        COUNT(*) FROM AutoNation_Dealership_Database.Sales
    UNION ALL

    SELECT 'Transaction',                  COUNT(*) FROM AutoNation_Dealership_Database.Transaction
    UNION ALL

    SELECT 'Customers',                    COUNT(*) FROM AutoNation_Dealership_Database.Customers
    UNION ALL

    SELECT 'Financing',                    COUNT(*) FROM AutoNation_Dealership_Database.Financing
    UNION ALL

    SELECT 'Warranty',                     COUNT(*) FROM AutoNation_Dealership_Database.Warranty
    UNION ALL

    SELECT 'Features_Bridge',              COUNT(*) FROM AutoNation_Dealership_Database.Features_Bridge
    ORDER BY table_name;


-- ############################################################################
--     PART 4.1: BASIC QUERIES (Cars sold in the last month)
-- ############################################################################
SELECT
    v.year                              AS vehicle_year,
    v.make                              AS make,
    v.model                             AS model,
    t.amount_paid                       AS sale_price,
    t.tax_amount                        AS tax,
    t.total_with_tax                    AS total_amount,
    CONCAT(sp.first_name, ' ', sp.last_name)  AS salesperson_name,
    CONCAT(c.first_name, ' ', c.last_name)    AS customer_name,
    t.transaction_date                  AS sale_date
FROM AutoNation_Dealership_Database.Transaction t
JOIN AutoNation_Dealership_Database.Sales s        ON t.sales_id = s.sales_id
JOIN AutoNation_Dealership_Database.Vehicles v     ON s.vehicle_id = v.vehicle_id
JOIN AutoNation_Dealership_Database.Salesperson sp ON t.sales_person_id = sp.salesperson_id
JOIN AutoNation_Dealership_Database.Customers c    ON t.customer_id = c.customer_id
WHERE t.transaction_date >= CURRENT_DATE - INTERVAL '30 days'
ORDER BY t.transaction_date DESC;

-- ############################################################################
--     PART 4.2: BASIC QUERIES (Cars still in stock)
-- ############################################################################


-- ############################################################################
--
--     PART 5: ADVANCED QUERIES
--
-- ############################################################################
/* 
    1.	Customer Financing Summary – Show each customer’s name, the vehicle they purchased, whether they paid cash or financed, and if financed, show the loan amount, interest rate, term, and monthly payment. Use a CASE statement to display "Cash" or "Financed" in a payment method column.
    2.	Above-Average Sales – Use a subquery to find all sales where the sale price was above the average sale price across all transactions. Show the vehicle, salesperson, customer, and sale price.
    3.	Full Transaction Detail – Write a single query that JOINs at least 4 tables to produce a complete transaction report showing: vehicle year/make/model, customer name, salesperson name, sale date, sale price, tax, total, warranty type (if any), and commission amount.
    4.	Top Salesperson by Revenue – Use GROUP BY with HAVING to find salespersons whose total sales revenue exceeds a threshold (choose a reasonable amount based on your data). Show their name, total revenue, total commission, and number of cars sold.
    5.	Inventory Value Report – Write a query that shows the total value of all vehicles still in stock (unsold), grouped by body style. Use a subquery to exclude sold vehicles. Show the body style, number of vehicles, and total listing price value.

*/

-- ############################################################################
--     5.1: Customer Financing Summary
-- ############################################################################
SELECT 
    c.first_name || ' ' || c.last_name AS customer_name,
    CONCAT(v.year, ' ', v.make, ' ', v.model) AS purchased_vehicle,
    CASE
        WHEN s.payment_financed = true THEN 'Financed'
        ELSE 'Cash'
    END AS payment_method,
    f.amount_financed, 
    f.interest_rate, 
    f.loan_terms_months, 
    f.monthly_payment
FROM AutoNation_Dealership_Database.Sales s
JOIN AutoNation_Dealership_Database.Customers c ON s.customer_id = c.customer_id
JOIN AutoNation_Dealership_Database.Vehicles v ON s.vehicle_id = v.vehicle_id
JOIN AutoNation_Dealership_Database.Financing f ON s.sales_id = f.sales_id;

-- ############################################################################
--     5.2: Above-Average Sales
-- ############################################################################
SELECT
    CONCAT(v.year, ' ', v.make, ' ', v.model) AS vehicle,
    CONCAT(sp.first_name, ' ', sp.last_name) AS salesperson,
    CONCAT(c.first_name, ' ', c.last_name) AS customer,
    t.amount_paid AS sale_price
FROM AutoNation_Dealership_Database.Transaction t
JOIN AutoNation_Dealership_Database.Sales s ON t.sales_id = s.sales_id
JOIN AutoNation_Dealership_Database.Vehicles v ON s.vehicle_id = v.vehicle_id
JOIN AutoNation_Dealership_Database.Salesperson sp ON t.sales_person_id = sp.salesperson_id
JOIN AutoNation_Dealership_Database.Customers c ON t.customer_id = c.customer_id
WHERE t.amount_paid > (
    SELECT AVG(amount_paid) FROM AutoNation_Dealership_Database.Transaction
)
ORDER BY t.amount_paid DESC;

-- ############################################################################
--     5.3: Full Transaction Detail
-- ############################################################################
SELECT
    CONCAT(v.year, ' ', v.make, ' ', v.model) AS vehicle,
    CONCAT(c.first_name, ' ', c.last_name) AS customer,
    CONCAT(sp.first_name, ' ', sp.last_name) AS salesperson,
    t.transaction_date AS sale_date,
    t.amount_paid AS sale_price,
    t.tax_amount AS tax,
    t.total_with_tax AS total,
    COALESCE(w.warranty_type, 'No Warranty') AS warranty_type,
    ROUND(t.amount_paid * (sp.commission_rate / 100), 2) AS commission_amount
FROM AutoNation_Dealership_Database.Transaction t
JOIN AutoNation_Dealership_Database.Sales s ON t.sales_id = s.sales_id
JOIN AutoNation_Dealership_Database.Vehicles v ON s.vehicle_id = v.vehicle_id
JOIN AutoNation_Dealership_Database.Salesperson sp ON t.sales_person_id = sp.salesperson_id
JOIN AutoNation_Dealership_Database.Customers c ON t.customer_id = c.customer_id
LEFT JOIN AutoNation_Dealership_Database.Warranty w ON s.sales_id = w.sales_id
ORDER BY t.transaction_date DESC;

-- ############################################################################
--     5.4: Top Salesperson by Revenue
-- ############################################################################
SELECT
    CONCAT(sp.first_name, ' ', sp.last_name) AS salesperson_name,
    SUM(t.amount_paid) AS total_revenue,
    SUM(t.amount_paid * (sp.commission_rate / 100)) AS total_commission,
    COUNT(DISTINCT t.sales_id) AS cars_sold
FROM AutoNation_Dealership_Database.Salesperson sp
LEFT JOIN AutoNation_Dealership_Database.Transaction t ON sp.salesperson_id = t.sales_person_id
GROUP BY sp.salesperson_id, sp.first_name, sp.last_name, sp.commission_rate
HAVING SUM(t.amount_paid) > 50000
ORDER BY total_revenue DESC;

-- ############################################################################
--     5.5: Inventory Value Report
-- ############################################################################
SELECT
    e.body_style,
    COUNT(v.vehicle_id) AS vehicle_count,
    SUM(c.total_price) AS total_listing_value
FROM AutoNation_Dealership_Database.Vehicles v
JOIN AutoNation_Dealership_Database.Features_Bridge fb ON v.vehicle_id = fb.vehicle_id
JOIN AutoNation_Dealership_Database.Exterior e ON fb.exterior_id = e.exterior_id
JOIN AutoNation_Dealership_Database.Cost c ON fb.cost_id = c.cost_id
WHERE v.vehicle_id NOT IN (
    SELECT DISTINCT vehicle_id FROM AutoNation_Dealership_Database.Sales
)
GROUP BY e.body_style
ORDER BY total_listing_value DESC;