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
    USED_OR_NEW  VARCHAR NOT NULL,
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
    TANK_CAPACITY DECIMAL(2,1) NOT NULL,
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
    REAR_TIRE_SIZE VARCHAR(100) NOT NULL,
    WHEEL_TYPE VARCHAR(100) NOT NULL
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
    TURNING_DIAMETER DECIMAL (2,2) NOT NULL
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
    CAR_LENGTH DECIMAL(3,2) NOT NULL,
    CAR_WIDTH DECIMAL(2,2) NOT NULL,
    WHEEL_BASE DECIMAL(3,2) NOT NULL,
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
    CARGO_VOLUME DECIMAL(3,2) NOT NULL
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
    EMISSIONS_PER_YEAR DECIMAL(2,1) NOT NULL
);

-- ============================================================================
-- TASK 1.13: CREATE THE COST TABLE 
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Cost(
    COST_ID    SERIAL PRIMARY KEY,
    TOTAL_PRICE DECIMAL(6,2) NOT NULL,
    TITLE_APPLICATION_FEE DECIMAL(6,2) NOT NULL,
    DEALER_FEE DECIMAL(6,2) NOT NULL,
    VEHICLE_REGISTRATION_FEE DECIMAL(6,2) NOT NULL,
    LICENSE_PLATE_COST DECIMAL(6,2) NOT NULL
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
    ZIP_CODE VARCHAR(10) NOT NULL,
    SALES_ID INT REFERENCES AutoNation_Dealership_Database.Sales(SALES_ID)
);

-- ============================================================================
-- TASK 1.16: CREATE THE FINANCING TABLE 
-- ============================================================================

CREATE TABLE AutoNation_Dealership_Database.Financing(
    FINANCING_ID      SERIAL PRIMARY KEY,
    SALES_ID          INT REFERENCES AutoNation_Dealership_Database.Sales(SALES_ID),
    DOWN_PAYMENT      DECIMAL(6,2) NOT NULL,
    AMOUNT_FINANCED   DECIMAL(6,2) NOT NULL,
    INTEREST_RATE     DECIMAL(2,2) NOT NULL,
    LOAN_TERMS_MONTHS INT,
    MONTHLY_PAYMENT   DECIMAL(5,2) NOT NULL,
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
    WHEEL_ID       INT NOT NULL,
    TIRE_ID        INT NOT NULL,
    BRAKES_ID       INT NOT NULL,
    STEERING_ID     INT NOT NULL,
    SUSPENSION_ID   INT NOT NULL
    EXTERIOR_ID     INT NOT NULL,
    INTERIOR_ID     INT NOT NULL,
    CARGO_ID        INT NOT NULL,
    WEIGHT_ID       INT NOT NULL,
    EMISSIONS_ID    INT NOT NULL,
    COST_ID         INT NOT NULL,
    PRIMARY KEY (VEHICLE_ID, ENGINE_ID, FUEL_ID, WHEELS_ID, TIRES_ID, BRAKES_ID, STEERING_ID, EXTERIOR_ID, INTERIOR_ID, CARGO_ID, WEIGHT_ID, EMISSIONS_ID, COST_ID),
    CONSTRAINT fk_vehicle    FOREIGN KEY (VEHICLE_ID)    REFERENCES AutoNation_Dealership_Database.Vehicles(VEHICLE_ID),
    CONSTRAINT fk_engine     FOREIGN KEY (ENGINE_ID)     REFERENCES AutoNation_Dealership_Database.Engine(ENGINE_ID),
    CONSTRAINT fk_fuel       FOREIGN KEY (FUEL_ID)       REFERENCES AutoNation_Dealership_Database.Fuel(FUEL_ID),
    CONSTRAINT fk_wheels     FOREIGN KEY (WHEEL_ID)     REFERENCES AutoNation_Dealership_Database.Wheels(WHEEL_ID),
    CONSTRAINT fk_tires      FOREIGN KEY (TIRE_ID)      REFERENCES AutoNation_Dealership_Database.Tires(TIRES_ID),
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

    COPY AutoNation_Dealership_Database.Vehicles (VEHICLE_ID, MAKE, MODEL, VIN_NUM, YEAR, USED_OR_NEW, CAR_LINK) FROM '/workspaces/MS3083-Busari-V2/data/autonation/vehicle.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Engine (ENGINE_ID, ENGINE_NAME, ENGINE_TYPE, HORSEPOWER, TORQUE, TRANSMISSION_TYPE, DRIVE_TYPE) FROM '/workspaces/MS3083-Busari-V2/data/autonation/engine.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Fuel (FUEL_ID, FUEL_TYPE, TANK_CAPACITY, MPG_CITY) FROM '/workspaces/MS3083-Busari-V2/data/autonation/fuel.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Wheels (WHEEL_ID, FRONT_WHEEL_SIZE, REAR_WHEEL_SIZE, WHEEL_TYPE) FROM '/workspaces/MS3083-Busari-V2/data/autonation/wheels.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Tires (TIRE_ID, FRONT_ TIRE_SIZE, REAR_ TIRE_SIZE) FROM '/workspaces/MS3083-Busari-V2/data/autonation/tires.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Brakes (BRAKES_ID, BRAKE_TYPE, BRAKE_ABS_SYSTEM_TYPE) FROM '/workspaces/MS3083-Busari-V2/data/autonation/brakes.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Steering (STEERING_ID, STEERING_SYSTEM_TYPE, TURNING_DIAMETER) FROM '/workspaces/MS3083-Busari-V2/data/autonation/steering.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Suspension (SUSPENSION_ID, FRONT_SUSPENSION_TYPE, REAR_SUSPENSION_TYPE) FROM '/workspaces/MS3083-Busari-V2/data/autonation/suspension.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Exterior (EXTERIOR_ID, CAR_LENGTH, CAR_WIDTH, WHEEL_BASE, CAR_ COLOR, BODY_STYLE, NUMBER_OF_DOORS, HEADLIGHT_TYPE) FROM '/workspaces/MS3083-Busari-V2/data/autonation/exterior.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Interior (INTERIOR_ID, KEYLESS_ENTRY, SEAT_MATERIAL, SEATING_CAPACITY, ENTERTAINMENT_SYSTEM, CRUISE_CONTROL, AUTOLOCK, STEERING_WHEEL_TYPE, BACK_CAMERA) FROM '/workspaces/MS3083-Busari-V2/data/autonation/interior.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Cargo (CARGO_AREA_ID, CARGO_VOLUME) FROM '/workspaces/MS3083-Busari-V2/data/autonation/cargo.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Weight (WEIGHT_ID, CURB_WEIGHT) FROM '/workspaces/MS3083-Busari-V2/data/autonation/weight.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Emissions (EMISSIONS_ID, EMISSIONS_PER_YEAR ) FROM '/workspaces/MS3083-Busari-V2/data/autonation/emissions.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Cost (COST_ID, TOTAL_PRICE, TITLE_APPLICATION_FEE, DEALER_FEE, VEHICLE_REGISTRATION_FEE, LICENSE_PLATE_COST) FROM '/workspaces/MS3083-Busari-V2/data/autonation/cost.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Salesperson (SALES_PERSON_ID, SALES_PERSON_FIRST_NAME, SALES_PERSON_LAST_NAME, EXPERIENCE_YEARS) FROM '/workspaces/MS3083-Busari-V2/data/autonation/salesperson.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Sales (SALES_ID, VEHICLE_ID, FINANCING_ID, PURCHASE_DATE, PAYMENT_FINANCED, PAYMENT_METHOD, SALES_PERSON_ID) FROM '/workspaces/MS3083-Busari-V2/data/autonation/sales.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Transactions (TRANSACTION_ID, SALES_ID, TRANSACTION_DATE, AMOUNT_PAID, PAYMENT_METHOD, DOWN_PAYMENT, PAID_IN_FULL) FROM '/workspaces/MS3083-Busari-V2/data/autonation/transactions.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Customers (CUSTOMER_ID, SALES_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, ADDRESS, CITY, STATE, ZIP_CODE) FROM '/workspaces/MS3083-Busari-V2/data/autonation/customers.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Financing (FINANCING_ID, SALES_ID, DOWN_PAYMENT, AMOUNT_FINANCED, INTEREST_RATE, LOAN_TERMS_MONTHS, MONTHLY_PAYMENT, LENDER_NAME, LOAN_START_DATE) FROM '/workspaces/MS3083-Busari-V2/data/autonation/financing.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Warranty (WARRANTY_ID, SALES_ID , WARRANTY_TYPE, DURATION_MONTHS, MILEAGE,COST) FROM '/workspaces/MS3083-Busari-V2/data/autonation/warranty.csv' WITH (FORMAT csv, HEADER true);

    COPY AutoNation_Dealership_Database.Features_Bridge (VEHICLE_ID, ENGINE_ID, FUEL_ID, WHEELS_ID, TIRES_ID, BRAKES_ID, STEERING_ID, SUSPENSION_ID, EXTERIOR_ID, INTERIOR_ID, CARGO_ID, WEIGHT_ID, EMISSIONS_ID, COST_ID) FROM '/workspaces/MS3083-Busari-V2/data/autonation/features_bridge.csv' WITH (FORMAT csv, HEADER true);

-- ============================================================================
-- TASK 3.2: VERIFY THE DATA (Checking for row counts)
-- ============================================================================



-- ############################################################################
--
--     PART 4: BASIC QUERIES
--
-- ############################################################################


-- ############################################################################
--
--     PART 5: ADVANCED QUERIES
--
-- ############################################################################