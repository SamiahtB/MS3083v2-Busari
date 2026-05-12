#!/bin/bash

# Load CSV data into AutoNation database
psql -U student -h localhost -d AutoNation_Dealership_Database << 'SQL'

\copy AutoNation_Dealership_Database.Vehicles (VEHICLE_ID, MAKE, MODEL, VIN_NUMBER, YEAR, USED_OR_NEW, CAR_LINK) FROM '/workspaces/MS3083v2-Busari/data/autonation/vehicles.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Engine (ENGINE_ID, ENGINE_NAME, ENGINE_TYPE, HORSEPOWER, TORQUE, TRANSMISSION_TYPE, DRIVE_TYPE) FROM '/workspaces/MS3083v2-Busari/data/autonation/engine.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Fuel (FUEL_ID, FUEL_TYPE, TANK_CAPACITY, MPG_CITY) FROM '/workspaces/MS3083v2-Busari/data/autonation/fuel.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Wheels (WHEEL_ID, FRONT_WHEEL_SIZE, REAR_WHEEL_SIZE, WHEEL_TYPE) FROM '/workspaces/MS3083v2-Busari/data/autonation/wheels.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Tires (TIRE_ID, FRONT_TIRE_SIZE, REAR_TIRE_SIZE) FROM '/workspaces/MS3083v2-Busari/data/autonation/tires.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Brakes (BRAKES_ID, BRAKE_TYPE, BRAKE_ABS_SYSTEM_TYPE) FROM '/workspaces/MS3083v2-Busari/data/autonation/brakes.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Steering (STEERING_ID, STEERING_SYSTEM_TYPE, TURNING_DIAMETER) FROM '/workspaces/MS3083v2-Busari/data/autonation/steering.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Suspension (SUSPENSION_ID, FRONT_SUSPENSION_TYPE, REAR_SUSPENSION_TYPE) FROM '/workspaces/MS3083v2-Busari/data/autonation/suspension.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Exterior (EXTERIOR_ID, CAR_LENGTH, CAR_WIDTH, WHEEL_BASE, CAR_COLOR, BODY_STYLE, NUMBER_OF_DOORS, HEADLIGHT_TYPE) FROM '/workspaces/MS3083v2-Busari/data/autonation/exterior.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Interior (INTERIOR_ID, KEYLESS_ENTRY, SEAT_MATERIAL, SEATING_CAPACITY, ENTERTAINMENT_SYSTEM, CRUISE_CONTROL, AUTO_LOCK, STEERING_WHEEL_MATERIAL, BACK_CAMERA) FROM '/workspaces/MS3083v2-Busari/data/autonation/interior.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Cargo_Area (CARGO_AREA_ID, CARGO_VOLUME) FROM '/workspaces/MS3083v2-Busari/data/autonation/cargo.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Weight (WEIGHT_ID, CURB_WEIGHT) FROM '/workspaces/MS3083v2-Busari/data/autonation/weight.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Emissions (EMISSIONS_ID, EMISSIONS_PER_YEAR) FROM '/workspaces/MS3083v2-Busari/data/autonation/emissions.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Cost (COST_ID, TOTAL_PRICE, TITLE_APPLICATION_FEE, DEALER_FEE, VEHICLE_REGISTRATION_FEE, LICENSE_PLATE_COST) FROM '/workspaces/MS3083v2-Busari/data/autonation/cost.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Salesperson (SALESPERSON_ID, FIRST_NAME, LAST_NAME, EXPERIENCE_YEARS, COMMISSION_RATE) FROM '/workspaces/MS3083v2-Busari/data/autonation/salesperson.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Customers (CUSTOMER_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, ADDRESS, CITY, STATE, ZIP_CODE) FROM '/workspaces/MS3083v2-Busari/data/autonation/customers.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Sales (SALES_ID, VEHICLE_ID, PURCHASE_DATE, PAYMENT_FINANCED, PAYMENT_METHOD, SALESPERSON_ID, CUSTOMER_ID, COMMISSION) FROM '/workspaces/MS3083v2-Busari/data/autonation/sales.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Transactions (TRANSACTION_ID, SALES_ID, CUSTOMER_ID, SALES_PERSON_ID, TRANSACTION_DATE, AMOUNT_PAID, PAYMENT_METHOD, DOWN_PAYMENT, PAID_IN_FULL, TAX_AMOUNT, TOTAL_WITH_TAX) FROM '/workspaces/MS3083v2-Busari/data/autonation/transactions.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Financing (FINANCING_ID, SALES_ID, DOWN_PAYMENT, AMOUNT_FINANCED, INTEREST_RATE, LOAN_TERMS_MONTHS, MONTHLY_PAYMENT, LENDER_NAME, LOAN_START_DATE) FROM '/workspaces/MS3083v2-Busari/data/autonation/financing.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Warranty (WARRANTY_ID, SALES_ID, WARRANTY_TYPE, DURATION_MONTHS, MILEAGE, COST, START_DATE, EXPIRATION_DATE, COVERAGE_DETAILS) FROM '/workspaces/MS3083v2-Busari/data/autonation/warranty.csv' WITH (FORMAT csv, HEADER true);

\copy AutoNation_Dealership_Database.Features_Bridge (VEHICLE_ID, ENGINE_ID, FUEL_ID, WHEEL_ID, TIRE_ID, BRAKES_ID, STEERING_ID, SUSPENSION_ID, EXTERIOR_ID, INTERIOR_ID, CARGO_ID, WEIGHT_ID, EMISSIONS_ID, COST_ID) FROM '/workspaces/MS3083v2-Busari/data/autonation/features_bridge.csv' WITH (FORMAT csv, HEADER true);

SQL
