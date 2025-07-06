Create database POS_Analytics ;

use POS_Analytics ;

CREATE TABLE pos_sales_data (
    date DATE,
    product_id VARCHAR(10),
    brand VARCHAR(50),
    channel VARCHAR(50),
    region VARCHAR(50),
    units_sold INT,
    unit_price DECIMAL(5,2),
    promo_flag VARCHAR(5)
);

INSERT INTO pos_sales_data VALUES 
('2025-06-01', 'P101', 'Colgate', 'Modern Trade', 'North', 1200, 55.00, 'Yes'),
('2025-06-01', 'P102', 'Pepsodent', 'General Trade', 'West', 800, 49.00, 'No'),
('2025-06-02', 'P101', 'Colgate', 'General Trade', 'South', 900, 53.00, 'No'),
('2025-06-02', 'P103', 'Sensodyne', 'Modern Trade', 'East', 650, 60.00, 'Yes');

CREATE TABLE syndicated_market_data (
    date DATE,
    brand VARCHAR(50),
    market_share DECIMAL(5,2),
    distribution_percent DECIMAL(5,2),
    avg_price DECIMAL(5,2)
);

INSERT INTO syndicated_market_data VALUES 
('2025-06-01', 'Colgate', 36.2, 92.3, 53.00),
('2025-06-01', 'Pepsodent', 28.5, 87.1, 49.00),
('2025-06-01', 'Sensodyne', 14.3, 76.5, 61.00),
('2025-06-02', 'Colgate', 35.8, 91.9, 54.00);

-- Total Units Sold and Revenue per Brand --

SELECT 
    brand,
    SUM(units_sold) AS total_units,
    SUM(units_sold * unit_price) AS total_revenue
FROM pos_sales_data
GROUP BY brand;

-- Average Selling Price per Brand --

SELECT 
    brand,
    ROUND(AVG(unit_price), 2) AS avg_selling_price
FROM pos_sales_data
GROUP BY brand;

-- Total Sales per Region --

SELECT 
    region,
    SUM(units_sold * unit_price) AS total_revenue
FROM pos_sales_data
GROUP BY region;

--   Promo vs Non-Promo Sales Breakdown ---

SELECT 
    brand,
    promo_flag,
    SUM(units_sold) AS total_units,
    SUM(units_sold * unit_price) AS total_revenue
FROM pos_sales_data
GROUP BY brand, promo_flag;

--  Market Share Trends Over Time  --

SELECT 
    date,
    market_share
FROM syndicated_market_data
WHERE brand = 'Colgate'
ORDER BY date;

--  Brands with Distribution < 90%  --

SELECT 
    brand,
    distribution_percent,
    date
FROM syndicated_market_data
WHERE distribution_percent < 90
ORDER BY distribution_percent ASC;

--  Sales Contribution by Channel  --  

SELECT 
    channel,
    SUM(units_sold) AS total_units,
    SUM(units_sold * unit_price) AS total_revenue
FROM pos_sales_data
GROUP BY channel;

-- Decline in Market Share (Day over Day) --

SELECT 
    brand,
    date,
    market_share - LAG(market_share) OVER 
      (PARTITION BY brand ORDER BY date) AS daily_change
FROM syndicated_market_data;

--  Join POS and Market Data for Combined Brand View --

SELECT 
    p.date,
    p.brand,
    SUM(p.units_sold) AS total_units_sold,
    SUM(p.units_sold * p.unit_price) AS total_revenue,
    m.market_share,
    m.distribution_percent
FROM
    pos_sales_data p
        JOIN
    syndicated_market_data m ON p.date = m.date AND p.brand = m.brand
GROUP BY p.date , p.brand , m.market_share , m.distribution_percent;

--  Average Price vs. Market Price Deviation --  

SELECT 
    p.brand,
    ROUND(AVG(p.unit_price), 2) AS avg_transaction_price,
    m.avg_price AS market_avg_price,
    ROUND(AVG(p.unit_price) - m.avg_price, 2) AS price_gap
FROM pos_sales_data p
JOIN syndicated_market_data m
    ON p.brand = m.brand AND p.date = m.date
GROUP BY p.brand, m.avg_price;


