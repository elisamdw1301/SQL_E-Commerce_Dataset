-- DATA CLEANING

-- 1. Remove extra spaces
CREATE OR REPLACE TABLE `FinalProject.customer_detail_cleaned` AS  -- Create a new table 
  SELECT  -- Selecting data 
    registration_date,  -- Selecting the `registration_date` column
    dob,  -- Selecting the `dob` column
    TRIM(`customer_id `) AS customer_id,  -- Removing extra spaces in the `customer_id` column
    TRIM(`customer_name `) AS customer_name,  -- Removing extra spaces in the `customer_name` column
    TRIM(`customer_type `) AS customer_type,  -- Removing extra spaces in the `customer_type` column
    TRIM(`province `) AS province,  -- Removing extra spaces in the `province` column
    TRIM(`registration_channel `) AS registration_channel  -- Removing extra spaces in the `registration_channel` column
  FROM 
    `FinalProject.customer_detail`;  -- Retrieving data from the `customer_detail` table

-- 2. Handling NULL values in the province column
SELECT  -- Selecting data
  customer_id,  -- Selecting the `customer_id` column
  COALESCE(province, 'UNKNOWN') AS province_cleaned   -- Replacing the NULL value in the `province` column with `UNKNOWN`
FROM 
  `FinalProject.customer_detail_cleaned`;  -- Retrieving data from the `customer_detail_cleaned` table

-- 3. Handling NULL values in date columns
SELECT  -- Selecting data
  *,  -- Selecting all data
  COALESCE(order_date, CAST('2000-01-01 00:00:00 UTC' AS TIMESTAMP)) AS order_date_cleaned -- Replacing the NULL value in the `order_date` column with a new date 
FROM 
  `FinalProject.order_detail`  -- Retrieving data from the `order_detail` table
