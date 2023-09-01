# Total number of homes_sold by city:
SELECT t1.city, COUNT(*) AS total_homes_sold
FROM housing_details as t1
INNER JOIN dates_price as t2 ON t1.id = t2.id
WHERE t2.status = 'Sold'
GROUP BY t1.city;

# Total number of houses sold by home_type:
SELECT t1.home_type, COUNT(t2.status) AS sold
FROM housing_details as t1
INNER JOIN dates_price as t2 ON t1.id = t2.id
WHERE t2.status='Sold'
GROUP BY t1.home_type;


# Average listing_price by home_type:
SELECT t1.home_type, AVG(t2.listing_price) AS avg_listing_price
FROM housing_details as t1
INNER JOIN dates_price as t2 ON t1.id = t2.id
GROUP BY t1.home_type;


# Costliest house sold by city:
SELECT t1.city, MAX(t2.actual_sold_price) AS price
FROM housing_details as t1
INNER JOIN dates_price as t2 ON t1.id = t2.id
GROUP BY t1.city
LIMIT 5;

# Costliest house sold by city desc order:
SELECT t1.city, SUM(t2.actual_sold_price) AS price
FROM housing_details as t1
INNER JOIN dates_price as t2 ON t1.id = t2.id
GROUP BY t1.city
ORDER BY price DESC
LIMIT 5;


# City having highest avg listing_price:
SELECT t1.city, AVG(t2.listing_price) AS avg_listing_price
FROM housing_details as t1
JOIN dates_price as t2 ON t1.id = t2.id
GROUP BY t1.city
ORDER BY avg_listing_price DESC
LIMIT 5;

# Average house_size by city:
SELECT city, AVG(house_size) AS avg_house_size
FROM  housing_details as t1
GROUP BY city;

# Total acreage of homes_sold by city:
SELECT t1.city, SUM(t1.acre_lot) AS total_acreage
FROM  housing_details as t1
JOIN dates_price as t2 ON t1.id = t2.id
WHERE t2.status = 'Sold'
GROUP BY t1.city;




# DASHBOARD
# Sum of actual_sold_price by city:
SELECT t1.city, SUM(t2.actual_sold_price) AS price
FROM housing_details as t1
INNER JOIN dates_price as t2 ON t1.id = t2.id
GROUP BY t1.city
LIMIT 5;

# Average of house_size:
SELECT AVG(HOUSE_SIZE)
FROM housing_details;

# Average of actual_sold_price:
SELECT AVG(actual_sold_price)
FROM dates_price;

# Count of home_type by city:
SELECT city,count(home_type)
FROM housing_details
GROUP BY city
Order by count(home_type) DESC;

# Sum of acre_lot by city:
SELECT city,sum(acre_lot)
FROM housing_details
GROUP BY city
Order by sum(acre_lot) DESC;


# AVG of population by city:
SELECT t3.city,AVG(t3.zip_cde_population) AS avg_population
FROM population as t3
GROUP BY t3.city;


# AVG of house_size by city:
SELECT city,AVG(house_size)
FROM housing_details
GROUP BY city
Order by AVG(house_size) DESC;