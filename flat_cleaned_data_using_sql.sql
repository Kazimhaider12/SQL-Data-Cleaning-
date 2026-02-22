create database Practice;

USE Practice;

SELECT * FROM flat_uncleaned;

SET SQL_SAFE_UPDATES = 0; -- Safe mode off

UPDATE flat_uncleaned SET 
    property_name = TRIM(property_name),
    areaWithType = TRIM(areaWithType),
    square_feet = TRIM(square_feet),
    transaction = TRIM(transaction),
    status = TRIM(status),
    floor = TRIM(floor),
    furnishing = TRIM(furnishing),
    facing = TRIM(facing),
    description = TRIM(description),
    price_per_sqft = TRIM(price_per_sqft),
    price = TRIM(price);



UPDATE flat_uncleaned SET transaction = NULL WHERE transaction = '';
UPDATE flat_uncleaned SET status = NULL WHERE status = '';
UPDATE flat_uncleaned SET floor = NULL WHERE floor = '';
UPDATE flat_uncleaned SET furnishing = NULL WHERE furnishing = '';
UPDATE flat_uncleaned SET facing = NULL WHERE facing = '';
UPDATE flat_uncleaned SET description = NULL WHERE description = '';
UPDATE flat_uncleaned SET price_per_sqft = NULL WHERE price_per_sqft = '';


UPDATE flat_uncleaned SET transaction = 'Unknown' WHERE transaction IS NULL;
UPDATE flat_uncleaned SET status = 'Unknown' WHERE status IS NULL;
UPDATE flat_uncleaned SET furnishing = 'Unknown' WHERE furnishing IS NULL;
UPDATE flat_uncleaned SET facing = 'Unknown' WHERE facing IS NULL;

UPDATE flat_uncleaned
SET square_feet = REPLACE(square_feet, ' sqft', '');

UPDATE flat_uncleaned
SET square_feet = REPLACE(square_feet, 'sqft', '');

ALTER TABLE flat_uncleaned
ADD square_feet_clean INT;

UPDATE flat_uncleaned
SET square_feet_clean =
CAST(
    TRIM(REPLACE(square_feet, 'sqft', ''))
AS DECIMAL(10,2))
WHERE square_feet LIKE '%sqft%';


UPDATE flat_uncleaned
SET square_feet_clean =
CAST(
    TRIM(REPLACE(square_feet, 'sqm', ''))
AS DECIMAL(10,2)) * 10.7639
WHERE square_feet LIKE '%sqm%';

UPDATE flat_uncleaned
SET square_feet_clean =
CASE
    WHEN square_feet LIKE '%sqft%' THEN
        CAST(REPLACE(square_feet, 'sqft', '') AS DECIMAL(10,2))

    WHEN square_feet LIKE '%sqm%' THEN
        CAST(REPLACE(square_feet, 'sqm', '') AS DECIMAL(10,2)) * 10.7639

    WHEN square_feet REGEXP '^[0-9]+(\\.[0-9]+)?$' THEN
        CAST(square_feet AS DECIMAL(10,2))

    ELSE NULL
END;



UPDATE flat_uncleaned
SET price_per_sqft = REPLACE(price_per_sqft, '₹', '');

UPDATE flat_uncleaned
SET price_per_sqft = REPLACE(price_per_sqft, ',', '');

UPDATE flat_uncleaned
SET price_per_sqft = REPLACE(price_per_sqft, ' per sqft', '');


ALTER TABLE flat_uncleaned
ADD price_per_sqft_clean INT;

UPDATE flat_uncleaned
SET price_per_sqft = REPLACE(price_per_sqft, 'â‚¹', '');

UPDATE flat_uncleaned
SET price_per_sqft = REPLACE(price_per_sqft, '₹', '');

UPDATE flat_uncleaned
SET price_per_sqft = REPLACE(price_per_sqft, ',', '');

UPDATE flat_uncleaned
SET price_per_sqft = REPLACE(price_per_sqft, ' per sqft', '');

UPDATE flat_uncleaned
SET price = REPLACE(price, '₹', '');

UPDATE flat_uncleaned
SET price = REPLACE(price, ' Lac', '');

UPDATE flat_uncleaned
SET price = REPLACE(price, 'Lac', '');

ALTER TABLE flat_uncleaned
ADD price_inr BIGINT;

UPDATE flat_uncleaned
SET price_inr = CAST(price AS DECIMAL(10,2)) * 100000;

ALTER TABLE flat_uncleaned
ADD floor_number INT;

ALTER TABLE flat_uncleaned 
DROP COLUMN price_per_sqft_clean;

ALTER TABLE flat_uncleaned 
DROP COLUMN price_inr;

ALTER TABLE flat_uncleaned 
DROP COLUMN floor_number;

SELECT * FROM flat_uncleaned;

select * from flat_uncleaned
where facing is null;
