

SELECT * FROM daily_groceries ORDER BY date LIMIT 5;


/* =========================
   1. Basic Checks
========================= */

-- 1.1 Date coverage
SELECT
    MIN(date) AS first_date,
    MAX(date) AS last_date,
    COUNT(*) AS total_days
FROM daily_groceries;

-- 1.2 Missing values
SELECT
    SUM(`_18_Large_Cage_Free_Eggs_900g` IS NULL)                AS eggs_missing,
    SUM(`_Unsweetened_Almond_Life_Milk_UHT_1L` IS NULL)         AS almond_life_missing,
    SUM(`_Lactose_Lite_Long_Life_Milk_UHT_1L` IS NULL)          AS lactose_missing,
    SUM(`_Red_Onions_Bag_1kg` IS NULL)                          AS red_onions_missing,
    SUM(`_Onion_Brown_Bag_1kg` IS NULL)                         AS brown_onions_missing,
    SUM(`Heinz_Ravioli_With_Creamy_Tomato_350g` IS NULL)        AS ravioli_missing,
    SUM(`Dolmio_Herbs_Tomato_Pasta_Sauce_500g` IS NULL)         AS pasta_sauce_missing,
    SUM(`_Chicken_Tikka_Masala_With_Rice_350g` IS NULL)         AS tikka_missing,
    SUM(`Leggos_Sundried_Tomato_Pesto_190g` IS NULL)            AS pesto_missing
FROM daily_groceries;

-- 1.3 Summary stats
SELECT
    AVG(`_18_Large_Cage_Free_Eggs_900g`)                AS avg_eggs,
    AVG(`_Unsweetened_Almond_Life_Milk_UHT_1L`)         AS avg_almond_life,
    AVG(`_Lactose_Lite_Long_Life_Milk_UHT_1L`)          AS avg_lactose,
    AVG(`_Red_Onions_Bag_1kg`)                          AS avg_red_onions,
    AVG(`_Onion_Brown_Bag_1kg`)                         AS avg_brown_onions,
    AVG(`Heinz_Ravioli_With_Creamy_Tomato_350g`)        AS avg_ravioli,
    AVG(`Dolmio_Herbs_Tomato_Pasta_Sauce_500g`)         AS avg_pasta_sauce,
    AVG(`_Chicken_Tikka_Masala_With_Rice_350g`)         AS avg_tikka,
    AVG(`Leggos_Sundried_Tomato_Pesto_190g`)            AS avg_pesto
FROM daily_groceries;


/* =========================
   2. Price trends (all products)
========================= */

SELECT
    date,
    `_18_Large_Cage_Free_Eggs_900g`,
    `_Unsweetened_Almond_Life_Milk_UHT_1L`,
    `_Lactose_Lite_Long_Life_Milk_UHT_1L`,
    `_Red_Onions_Bag_1kg`,
    `_Onion_Brown_Bag_1kg`,
    Heinz_Ravioli_With_Creamy_Tomato_350g,
    Dolmio_Herbs_Tomato_Pasta_Sauce_500g,
    `_Chicken_Tikka_Masala_With_Rice_350g`,
    Leggos_Sundried_Tomato_Pesto_190g
FROM daily_groceries
ORDER BY date;


/* =========================
   3. Biggest Increase & Drop
========================= */

SELECT * FROM (

    SELECT '18 Large Cage Free Eggs 900g' AS product,
        (MAX(`_18_Large_Cage_Free_Eggs_900g`) - MIN(`_18_Large_Cage_Free_Eggs_900g`)) AS price_change
    FROM daily_groceries

    UNION ALL
    SELECT 'Unsweetened Almond Life Milk UHT 1L',
        (MAX(`_Unsweetened_Almond_Life_Milk_UHT_1L`) - MIN(`_Unsweetened_Almond_Life_Milk_UHT_1L`))
    FROM daily_groceries

    UNION ALL
    SELECT 'Lactose Lite Long Life Milk UHT 1L',
        (MAX(`_Lactose_Lite_Long_Life_Milk_UHT_1L`) - MIN(`_Lactose_Lite_Long_Life_Milk_UHT_1L`))
    FROM daily_groceries

    UNION ALL
    SELECT 'Red Onions Bag 1kg',
        (MAX(`_Red_Onions_Bag_1kg`) - MIN(`_Red_Onions_Bag_1kg`))
    FROM daily_groceries

    UNION ALL
    SELECT 'Onion Brown Bag 1kg',
        (MAX(`_Onion_Brown_Bag_1kg`) - MIN(`_Onion_Brown_Bag_1kg`))
    FROM daily_groceries

    UNION ALL
    SELECT 'Heinz Ravioli With Creamy Tomato 350g',
        (MAX(Heinz_Ravioli_With_Creamy_Tomato_350g) - MIN(Heinz_Ravioli_With_Creamy_Tomato_350g))
    FROM daily_groceries

    UNION ALL
    SELECT 'Dolmio Herbs Tomato Pasta Sauce 500g',
        (MAX(Dolmio_Herbs_Tomato_Pasta_Sauce_500g) - MIN(Dolmio_Herbs_Tomato_Pasta_Sauce_500g))
    FROM daily_groceries

    UNION ALL
    SELECT 'Chicken Tikka Masala With Rice 350g',
        (MAX(`_Chicken_Tikka_Masala_With_Rice_350g`) - MIN(`_Chicken_Tikka_Masala_With_Rice_350g`))
    FROM daily_groceries

    UNION ALL
    SELECT 'Leggos Sundried Tomato Pesto 190g',
        (MAX(Leggos_Sundried_Tomato_Pesto_190g) - MIN(Leggos_Sundried_Tomato_Pesto_190g))
    FROM daily_groceries

) AS price_changes
ORDER BY price_change DESC;







/* =========================
   4. Volatility (std deviation)
========================= */

SELECT * FROM (

    SELECT 'Eggs' AS product,
           STDDEV_SAMP(`_18_Large_Cage_Free_Eggs_900g`) AS vol
    FROM daily_groceries

    UNION ALL
    SELECT 'Almond Life Milk',
           STDDEV_SAMP(`_Unsweetened_Almond_Life_Milk_UHT_1L`)
    FROM daily_groceries

    UNION ALL
    SELECT 'Lactose Milk',
           STDDEV_SAMP(`_Lactose_Lite_Long_Life_Milk_UHT_1L`)
    FROM daily_groceries

    UNION ALL
    SELECT 'Red Onions',
           STDDEV_SAMP(`_Red_Onions_Bag_1kg`)
    FROM daily_groceries

    UNION ALL
    SELECT 'Brown Onions',
           STDDEV_SAMP(`_Onion_Brown_Bag_1kg`)
    FROM daily_groceries

    UNION ALL
    SELECT 'Ravioli',
           STDDEV_SAMP(Heinz_Ravioli_With_Creamy_Tomato_350g)
    FROM daily_groceries

    UNION ALL
    SELECT 'Pasta Sauce',
           STDDEV_SAMP(Dolmio_Herbs_Tomato_Pasta_Sauce_500g)
    FROM daily_groceries

    UNION ALL
    SELECT 'Chicken Tikka',
           STDDEV_SAMP(`_Chicken_Tikka_Masala_With_Rice_350g`)
    FROM daily_groceries

    UNION ALL
    SELECT 'Pesto',
           STDDEV_SAMP(Leggos_Sundried_Tomato_Pesto_190g)
    FROM daily_groceries

) AS volatility
ORDER BY vol DESC;



/* =========================
   5. Weekly averages
========================= */

SELECT YEARWEEK(date) AS week,
    AVG(_18_Large_Cage_Free_Eggs_900g) AS eggs_avg,
    AVG(_Unsweetened_Almond_Life_Milk_UHT_1L) AS almond_avg,
    AVG(_Lactose_Lite_Long_Life_Milk_UHT_1L) AS lactose_avg,
    AVG(_Red_Onions_Bag_1kg) AS red_onion_avg,
    AVG(_Onion_Brown_Bag_1kg) AS brown_onion_avg,
    AVG(Heinz_Ravioli_With_Creamy_Tomato_350g) AS ravioli_avg,
    AVG(Dolmio_Herbs_Tomato_Pasta_Sauce_500g) AS pasta_avg,
    AVG(_Chicken_Tikka_Masala_With_Rice_350g) AS tikka_avg,
    AVG(Leggos_Sundried_Tomato_Pesto_190g) AS pesto_avg
FROM daily_groceries
GROUP BY YEARWEEK(date)
ORDER BY week;


/* =========================
   6. Basket cost over time
========================= */

SELECT
    date,
    (
        `_18_Large_Cage_Free_Eggs_900g` +
        `_Unsweetened_Almond_Life_Milk_UHT_1L` +
        `_Lactose_Lite_Long_Life_Milk_UHT_1L` +
        `_Red_Onions_Bag_1kg` +
        `_Onion_Brown_Bag_1kg` +
        Heinz_Ravioli_With_Creamy_Tomato_350g +
        Dolmio_Herbs_Tomato_Pasta_Sauce_500g +
        `_Chicken_Tikka_Masala_With_Rice_350g` +
        Leggos_Sundried_Tomato_Pesto_190g
    ) AS basket_total
FROM daily_groceries
ORDER BY date;


/* =========================
   7. Compare two products
========================= */

SELECT
    date,
    `_Unsweetened_Almond_Life_Milk_UHT_1L`  AS almond_life,
    `_Lactose_Lite_Long_Life_Milk_UHT_1L`    AS lactose
FROM daily_groceries
ORDER BY date;

/* =========================
   8. Add Month-over-Month Inflation (%)
========================= */

SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    AVG(`_Red_Onions_Bag_1kg`) AS avg_red_onion,
    LAG(AVG(`_Red_Onions_Bag_1kg`)) OVER (ORDER BY DATE_FORMAT(date, '%Y-%m')) AS prev_month,
    (AVG(`_Red_Onions_Bag_1kg`) - LAG(AVG(`_Red_Onions_Bag_1kg`)) OVER (ORDER BY DATE_FORMAT(date, '%Y-%m'))) 
        / LAG(AVG(`_Red_Onions_Bag_1kg`)) OVER (ORDER BY DATE_FORMAT(date, '%Y-%m')) * 100 AS MoM_inflation
FROM daily_groceries
GROUP BY month;

