
-- ============================================================

-- MS3083 Assignment 3

-- Name: Samiaht Busari   Date: March 29, 2026

-- ============================================================


-- SECTION 1: Schema;

CREATE SCHEMA busari;


-- SECTION 2: Table Creation;
CREATE TABLE Busari.INGREDIENT(
    ingredient_id SERIAL PRIMARY KEY,
    ingredient_name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_of_measure VARCHAR(10) NOT NULL,
    reorder_threshold DECIMAL (10, 2) NOT NULL,
    unit_cost DECIMAL(10, 2) NOT NULL,
    lead_time INT NOT NULL,
    supplier_id INT NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (supplier_id) REFERENCES Busari.SUPPLIER(supplier_id)
);

-- Made an error with data type for unit_of_measure, should be VARCHAR instead of INT.;
ALTER TABLE Busari.INGREDIENT 
ALTER COLUMN unit_of_measure TYPE VARCHAR(20);


CREATE TABLE Busari.SUPPLIER(
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(50) NOT NULL,
    contact_name VARCHAR(50) NOT NULL,
    cell_number VARCHAR(20) NOT NULL,
    email_address VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    is_preffered BOOLEAN NOT NULL DEFAULT FALSE
);

-- Made an error with spelling.;
ALTER TABLE Busari.SUPPLIER
RENAME COLUMN is_preffered TO is_preferred;


CREATE TABLE Busari.INVENTORY(
    inventory_id SERIAL PRIMARY KEY,
    ingredient_id INT NOT NULL,
    quantity_on_hand DECIMAL(10, 2) NOT NULL,
    last_count_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    supplier_id INT NOT NULL,
    FOREIGN KEY (ingredient_id) REFERENCES Busari.INGREDIENT(ingredient_id),
    FOREIGN KEY (supplier_id) REFERENCES Busari.SUPPLIER(supplier_id)
);

-- Made an error in table- this is to correct. ALTER TABLE Busari.INVENTORY
ALTER TABLE Busari.INVENTORY
ADD COLUMN quantity_reserved DECIMAL(10, 2) NOT NULL DEFAULT 0,
ADD COLUMN expiration_date timestamp,
DROP COLUMN supplier_id,
ADD COLUMN location_id INT NOT NULL;


CREATE TABLE Busari.LOCATION(
    location_id SERIAL PRIMARY KEY,
    location_name VARCHAR(50) NOT NULL,
    storage_type VARCHAR(50) NOT NULL,
    temperature_zone VARCHAR(50) NOT NULL,
    capacity_unit INT NOT NULL,
    current_utilization_pct DECIMAL(10, 2) NOT NULL,
    aisle_selection VARCHAR(50) NOT NULL
);

ALTER TABLE Busari.LOCATION
ADD COLUMN current_utilization DECIMAL(10, 2) NOT NULL,
DROP COLUMN current_utilization_pct;

CREATE TABLE Busari.PURCHASE_ORDER(
    purchase_order_id SERIAL PRIMARY KEY,
    supplier_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expected_delivery_date DATE,
    actual_delivery_date DATE,
    quantity_ordered DECIMAL(10, 2) NOT NULL,
    unit_price_at_order DECIMAL(10, 2) NOT NULL,
    total_order_cost DECIMAL(10, 2) NOT NULL,
    delivery_status VARCHAR(50) NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES Busari.SUPPLIER(supplier_id),
    FOREIGN KEY (ingredient_id) REFERENCES Busari.INGREDIENT(ingredient_id)
);

--made an error with column names;
ALTER TABLE Busari.PURCHASE_ORDER
RENAME COLUMN purchase_order_id TO order_id;

ALTER TABLE Busari.PURCHASE_ORDER
RENAME delivery_status to order_status;



-- SECTION 3: Data Insertion;
COPY Busari.SUPPLIER (supplier_id, supplier_name, contact_name, cell_number, email_address, city, state, is_preferred) FROM '/workspaces/MS3083v2-Busari/data/Canes_Inventory/Supplier.csv' WITH (FORMAT csv, HEADER true);
COPY Busari.INGREDIENT (ingredient_id, ingredient_name, category, unit_of_measure, reorder_threshold, unit_cost, lead_time, supplier_id, is_active) 
FROM '/workspaces/MS3083v2-Busari/data/Canes_Inventory/Ingredients.csv' 
WITH (FORMAT csv, HEADER true, NULL '');
COPY Busari.LOCATION (location_id, location_name, storage_type, temperature_zone, capacity_unit, current_utilization, aisle_selection) FROM '/workspaces/MS3083v2-Busari/data/Canes_Inventory/Location.csv' WITH (FORMAT csv, HEADER true);
COPY Busari.INVENTORY (inventory_id, ingredient_id, location_id, quantity_on_hand, quantity_reserved, last_count_date, expiration_date) FROM '/workspaces/MS3083v2-Busari/data/Canes_Inventory/Inventory.csv' WITH (FORMAT csv, HEADER true, NULL'null');
COPY Busari.PURCHASE_ORDER (order_id, supplier_id, ingredient_id, order_date, expected_delivery_date, actual_delivery_date, quantity_ordered, unit_price_at_order, total_order_cost, order_status) FROM '/workspaces/MS3083v2-Busari/data/Canes_Inventory/Purchase_Order.csv' WITH (FORMAT csv, HEADER true, NULL'');


-- Reset sequences so future INSERTs get the right IDs;
SELECT setval('Busari.ingredient_ingredient_id_seq', (SELECT MAX(ingredient_id) FROM Busari.INGREDIENT));
SELECT setval('Busari.supplier_supplier_id_seq',     (SELECT MAX(supplier_id)   FROM Busari.SUPPLIER));
SELECT setval('Busari.inventory_inventory_id_seq',   (SELECT MAX(inventory_id)  FROM Busari.INVENTORY));
SELECT setval('Busari.location_location_id_seq',     (SELECT MAX(location_id)   FROM Busari.LOCATION));
SELECT setval('Busari.purchase_order_purchase_order_id_seq',  (SELECT MAX(order_id)      FROM Busari.PURCHASE_ORDER));


-- SECTION 4: Verification Queries  (Q1 through Q6);
-- VERIFY: Row counts;
SELECT COUNT(*) FROM Busari.INGREDIENT;
SELECT COUNT(*) FROM Busari.SUPPLIER;
SELECT COUNT(*) FROM Busari.INVENTORY;
SELECT COUNT(*) FROM Busari.LOCATION;
SELECT COUNT(*) FROM Busari.PURCHASE_ORDER;

-- VERIFY: Full ingredient list;
SELECT *
FROM Busari.INGREDIENT
ORDER BY ingredient_name ASC;

-- VERIFY: Inventory with ingredient names;
SELECT i.ingredient_name, inv.quantity_on_hand, inv.expiration_date, inv.location_id
FROM Busari.INVENTORY inv
JOIN Busari.INGREDIENT i ON inv.ingredient_id = i.ingredient_id;

-- VERIFY: Inventory with location names;
SELECT inv.ingredient_id, inv.quantity_on_hand, l.location_name, l.storage_type
FROM Busari.INVENTORY inv
JOIN Busari.LOCATION l ON inv.location_id = l.location_id;

-- VERIFY: Purchase orders with supplier and ingredient;
SELECT s.supplier_name, i.ingredient_name, po.order_date, po.quantity_ordered, po.order_status
FROM Busari.PURCHASE_ORDER po
JOIN Busari.SUPPLIER s ON po.supplier_id = s.supplier_id
JOIN Busari.INGREDIENT i ON po.ingredient_id = i.ingredient_id;


-- VERIFY: Foreign key enforcement
-- INSERT INTO Busari.INVENTORY (ingredient_id, location_id, quantity_on_hand, quantity_reserved, last_count_date)
-- VALUES (9999, 1, 10.00, 0.00, CURRENT_TIMESTAMP);
-- PostgreSQL would produce a "foreign key violation" error because ingredient_id 9999 does not exist in the INGREDIENT table.


/*

-- SECTION 5: Reflection;
==========================================================

REFLECTION  —  MS3083 Assignment 3

Name: Samiaht Busari

==========================================================



Q1 — Data Type Decision: Walk through one data type decision that made you stop and think. What were your options? What did you choose and why?

One data type decision that made me stop and think was for the "unit_of_measure" column in the INGREDIENT table. Initially, I had it set as an INT because I had assumed typically 
when you measure something it is comes back as a numeric value, which would not have been appropriate for this situation  since units of measure are typically represented as text (e.g., "lbs", "gallon", "ozs"). 
I had to change it to VARCHAR by making an "ALTER TABLE" edit  to allow for the correct representation of the data. This decision was important because using the wrong data type made it impossible for me to insert my csv file and it wasn't until I made the edit that I was able to proceed. 
Likewise, not editing the datatype could lead to further data integrity issues and make it difficult to query the database effectively.



Q2 — INVENTORY Foreign Keys Explained: INVENTORY has two foreign keys. In plain English — not SQL syntax — explain what each one enforces and what business problem it prevents.

The first foreign key in the INVENTORY table is "ingredient_id", which references the "ingredient_id" in the INGREDIENT table. This foreign key enforces that every inventory record must be associated with the correct ingredient/item. It prevents the business problem of having inventory records that reference non-existent ingredients or the incorrect ingredient, which could lead to confusion and errors in inventory management.
The second foreign key is "location_id", which references the "location_id" in the LOCATION table. This foreign key ensures that every inventory record is associated with a valid storage location. It prevents the business problem of having inventory records that reference non-existent or incorrect storage locations, which could lead to issues with tracking where ingredients are stored and managing space effectively.


Q3 — How the Three-Table JOIN Works: Q5 required joining three tables. Walk through the logic step by step — what is being matched to what, and why does the order of the JOINs matter (or not)?
In Q5, we are joining the PURCHASE_ORDER table with the SUPPLIER and INGREDIENT tables. The logic is as follows:
1. We start with the PURCHASE_ORDER table, which contains information about each purchase order, including the supplier_id and ingredient_id.
2. We join the PURCHASE_ORDER table with the SUPPLIER table using the supplier_id. This allows us to retrieve the supplier_name for each purchase order, which is important for understanding who the supplier is for each order.
3. Next, we join the resulting table with the INGREDIENT table using the ingredient_id. This allows us to retrieve the ingredient_name for each purchase order, which is important for understanding what ingredient is being ordered.
The order of the JOINs does not matter  because we are joining on different keys (supplier_id and ingredient_id) that aren't dependent on each other. As long as we correctly specify the JOIN conditions, we can join the tables in any order and still get the correct results.




Q4 — Scaling to New Locations: If Raising Cane's opened five new restaurant locations, what would change in your database? Which tables get new rows? Would any table need a new column or would the current design handle it? Compare to what would break if you tried to do this with your five separate Excel files.
If Rasing Cane's opened 5 new restaurant locations, somethings that would change in my database design would be the addition of purchase order and inventory would need new records to keep track of data for the new location and to avoid mixing the data from location one. In addition, in some sheets restaurant_id will need to be added when identifying information to better understand which location's data is being interpreted. 
If we were using five separate Excel files, we would likely need to create new files for each new location, which would lead to data fragmentation and make it difficult to aggregate and analyze data across all locations. Additionally, we would need to ensure that the structure of each Excel file is consistent, which can be error-prone and time-consuming to manage as the number of locations increases.


*/