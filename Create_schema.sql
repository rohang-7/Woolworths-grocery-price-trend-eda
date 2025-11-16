-- ============================================
-- 0.1 Select database
-- ============================================
CREATE DATABASE IF NOT EXISTS woolworths_eda;
USE woolworths_eda;

-- At this point after creating a database we will upload our csv file which has a list of products and their prices for the last 6 months. 
-- I have extracted the data from - auscost.com.au (CHECK README FILE FOR PROPER EXPLAINATION)
-- called daily_groceries with columns:
-- Time (TEXT) and 12 DOUBLE columns.

-- ============================================
-- 0.2 Add a proper DATE column based on Time
--     (run this ONCE after import)
-- ============================================
ALTER TABLE daily_groceries
ADD COLUMN date DATE;

UPDATE daily_groceries
SET date = STR_TO_DATE(Time, '%d/%m/%Y');

-- Check the names of the columns
SHOW COLUMNS FROM daily_groceries;

ALTER TABLE daily_groceries
MODIFY COLUMN date DATE FIRST;


-- Optional cleanup: if you no longer need the original Time text
-- ALTER TABLE daily_groceries DROP COLUMN Time;

ALTER TABLE daily_groceries
DROP COLUMN Time;

SELECT * FROM daily_groceries
limit 5;

