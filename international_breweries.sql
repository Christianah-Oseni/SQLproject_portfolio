/* A1. Within the space of the last three years, what was the profit worth of the breweries, inclusive of the anglophone and the francophone territories? */

SELECT sum (profit) total_profit 
FROM csv_table;


/* A2. Compare the total profit between these two territories in order for the territory manager, Mr. Stone to make a strategic decision that will aid profit maximization in 2626.*/

SELECT case 
when countries in ('Nigeria', 'Ghana') then 'Anglophone'
else 'Francophone'
end territories, sum (profit) total_profit
from csv_table
GROUP BY territories
ORDER BY total_profit desc;


/* A3. What country generated the highest profit in 2019 */

SELECT countries, sum (profit) total_profit 
FROM csv_table
where years = 2019
GROUP BY countries
ORDER BY total_profit desc limit 1;


/* A4. Help him find the year with the highest profit. */

SELECT years, sum (profit) total_profit 
FROM csv_table
GROUP BY years
ORDER BY total_profit desc limit 1;


/* A5. Which month in the three years was the least profit generated? */

SELECT months, sum (profit) total_profit 
FROM csv_table
GROUP BY months
ORDER BY total_profit asc limit 1;


/* A6. What was the minimum profit in the month of December 2018? */

SELECT months, profit 
from csv_table 
where months = 'December' and years = 2018
ORDER BY profit asc limit 1;


/* A7. Compare the profit for each of the months in 2019 */

SELECT months, sum (profit) total_profit 
FROM csv_table 
where years = 2019
GROUP BY months
ORDER BY total_profit desc;


/* A8. Which particular brand generated the highest profit in Senegal? */

SELECT brands, sum (profit) total_profit 
FROM csv_table 
where countries = 'Senegal'
GROUP BY brands
ORDER BY total_profit desc limit 1;


/* B1. Within the last two years, the brand manager wants to know the top three brands consumed in the francophone countries*/

SELECT brands, sum (quantity) total_quantity 
FROM csv_table 
where years <> 2017 and countries not in ('Nigeria', 'Ghana')
GROUP BY brands
ORDER BY total_quantity desc limit 3;


/* B2. Find out the top two choice of consumer brands in Ghana */

SELECT brands, sum (quantity) total_quantity 
FROM csv_table
where countries = 'Ghana'
GROUP BY brands
ORDER BY total_quantity desc limit 2;


/* B3. Find out the details of beers consumed in the past three years in the most oil rich country in West Africa. */

SELECT * 
FROM csv_table 
where countries = 'Nigeria' and brands not in ('beta malt', 'grand malt');


/* B4. Favorites malt brand in Anglophone region between 2018 and 2019 */

SELECT brands, sum (quantity) total_quantity 
FROM csv_table 
where years <> 2017 and brands LIKE '%malt' and countries in ('Nigeria', 'Ghana') 
GROUP BY brands 
ORDER BY total_quantity desc limit 1;


/* B5. Which brands sold the highest in 2019 in Nigeria? */

SELECT brands, sum (quantity) total_quantity 
FROM csv_table 
where countries = 'Nigeria' and years = 2019
GROUP BY brands
ORDER BY total_quantity desc limit 1;


/* B6. Favorites brand in South South region in Nigeria */

SELECT brands, sum (quantity) total_quantity 
FROM csv_table 
where region = 'southsouth' and countries = 'Nigeria'
GROUP BY brands
ORDER BY total_quantity desc limit 1;


/* B7. Beer consumption in Nigeria */

SELECT brands, sum (quantity) total_quantity_consumed 
FROM csv_table 
where brands not in ('beta malt', 'grand malt') and countries = 'Nigeria' 
GROUP BY brands 
ORDER BY total_quantity_consumed desc;


/* B8. Level of consumption of Budweiser in the regions in Nigeria */

SELECT region, sum (quantity) total_quantity_consumed 
FROM csv_table 
where brands = 'budweiser' and countries = 'Nigeria'
GROUP BY region
ORDER BY total_quantity_consumed desc;


/* B9. Level of consumption of Budweiser in the regions in Nigeria in 2019 (Decision on Promo) */

SELECT region, sum (quantity) total_quantity_consumed 
FROM csv_table
where brands = 'budweiser' and countries = 'Nigeria' and years = 2019
GROUP BY region
ORDER BY total_quantity_consumed desc;


/* C1. Country with the highest consumption of beer. */

SELECT countries, sum (quantity) total_quantity_consumed 
FROM csv_table 
where brands not in ('beta malt', 'grand malt')
GROUP BY countries
ORDER BY total_quantity_consumed desc limit 1;


/* C2. Highest sales personnel of Budweiser in Senegal */

SELECT sales_rep, sum (quantity) total_quantity_sold 
FROM csv_table 
where brands = 'budweiser' and countries = 'Senegal'
GROUP BY sales_rep
ORDER BY total_quantity_sold desc limit 1;


/* C3. Country with the highest profit of the fourth quarter in 2019 */

SELECT countries, sum (profit) total_profit 
FROM csv_table 
where months in ('October', 'November', 'December') and years = 2019
GROUP BY countries
ORDER BY total_profit desc limit 1;


