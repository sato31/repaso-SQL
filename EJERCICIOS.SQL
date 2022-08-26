USE SAKILA;
SHOW TABLES FROM SAKILA;

#EJERCICIOS
-- Consulta store_id, first_name y last_name de la tabla customer de la base de datos sakila
-- Cambia el nombre de las columnas store_id, first_name y last_name a Tienda, Nombre y Apellido respectivamente.
SELECT STORE_ID AS TIENDA, FIRST_NAME AS NOMBRE, LAST_NAME AS APELLIDO FROM CUSTOMER; 

-- Ordena de manera descendente la columna Apellido
SELECT STORE_ID AS TIENDA, FIRST_NAME AS NOMBRE, LAST_NAME AS APELLIDO FROM CUSTOMER ORDER BY APELLIDO DESC;

-- Consulta la tabla payment de la base de datos sakila.
-- ¿Cuál es la cantidad mas baja y mas alta de la columna amount?
SELECT MAX(AMOUNT), MIN(AMOUNT) FROM PAYMENT;
select distinct amount from sakila.payment order by amount asc;

-- Consulta description, release_year de la tabla film de la base de datos sakila.
-- Filtra la información donde title sea IMPACT ALADDIN
SELECT DESCRIPTION, RELEASE_YEAR FROM SAKILA.FILM WHERE TITLE = 'IMPACT ALADDIN';

-- Consulta la tabla payment de la base de datos sakila.
-- Filtra la información donde amount sea mayor a 0.99.
SELECT * FROM SAKILA.PAYMENT WHERE AMOUNT > 0.99;

-- Consulta la tabla payment de la base de datos sakila.
-- Filtra la información donde customer_id sea igual a 36, amount sea mayor a 0.99 y staff_id sea igual a 1.
SELECT * FROM SAKILA.PAYMENT WHERE CUSTOMER_ID = 36 AND AMOUNT > 0.99 AND STAFF_ID = 1;

-- Consulta la tabla rental de la base de datos sakila.
-- Filtra la información donde staff_id no sea 1, customer_id sea mayor a 250 y inventory_id sea menor de 100.
SELECT * FROM SAKILA.RENTAL WHERE NOT STAFF_ID = 1 AND CUSTOMER_ID > 250 AND INVENTORY_ID < 100; 

-- IN
SELECT * FROM SAKILA.CUSTOMER WHERE FIRST_NAME IN ('MARY','PATRICIA');
SELECT * FROM SAKILA.FILM WHERE SPECIAL_FEATURES IN ('TRAILERS', 'TRAILERS,DELETED SCENES') AND RATING IN('G','NC-17') AND LENGTH > 100;
SELECT * FROM SAKILA.CATEGORY WHERE NAME NOT IN ('ACTION', 'ANIMATION', 'CHILDREN');

-- Consulta la tabla film_text de la base de datos sakila.
-- Filtra la información donde title  sea ZORRO ARK, VIRGIN DAISY, UNITED PILOT
SELECT * FROM SAKILA.FILM_TEXT WHERE TITLE IN ('ZORRO ARK', 'VIRGIN DAISY', 'UNITED PILOT');  

-- Consulta la tabla city de la base de datos sakila.
-- Filtra la información donde city sea Chiayi, Dongying, Fukuyama y Kilis.
SELECT * FROM SAKILA.CITY WHERE CITY IN ('CHIAYI', 'DONGYING', 'FUKUYAMA', 'KILIS');

-- Consulta la tabla payment de la base de datos sakila.
-- Filtra la información donde amount esté entre 2.99 y 4.99, staff_id sea igual a 2 y customer_id sea 1 y 2.
SELECT * FROM SAKILA.PAYMENT WHERE (AMOUNT BETWEEN 2.99 AND 4.99) AND STAFF_ID = 2 AND CUSTOMER_ID IN (1, 2);

-- Consulta la tabla address de la base de datos sakila.
-- Filtra la información donde city_id esté entre 300 y 350, 
SELECT * FROM SAKILA.ADDRESS WHERE CITY_ID BETWEEN 300 AND 350;

-- Consulta la tabla film de la base de datos sakila.
-- Filtra la información donde rental_rate esté entre 0.99 y 2.99, length sea menor igual de 50  y replacement_cost sea menor de 20.
SELECT * FROM SAKILA.FILM WHERE (RENTAL_RATE BETWEEN 0.99 AND 2.99) AND LENGTH <= 50 AND REPLACEMENT_COST < 20;

-- Consulta la tabla film de la base de datos sakila.
-- Filtra la información donde release_year sea igual a 2006  y title empiece con ALI.
SELECT * FROM SAKILA.FILM WHERE RELEASE_YEAR = 2006 AND TITLE LIKE 'ALI%';

-- Consulta la tabla address de la base de datos sakila.
-- Realiza un INNER JOIN con las tablas city y country
-- Mostrar las columnas address, city, country
SELECT A.ADDRESS, C.CITY, CO.COUNTRY FROM SAKILA.ADDRESS A
INNER JOIN SAKILA.CITY C ON (A.CITY_ID = C.CITY_ID)
INNER JOIN SAKILA.COUNTRY CO ON (C.COUNTRY_ID = CO.COUNTRY_ID);

-- Consulta la tabla customer de la base de datos sakila.
-- Realiza un LEFT JOIN con las tablas store y address
-- Mostrar las columnas first_name, address, store_id
SELECT C.FIRST_NAME, A.ADDRESS, S.STORE.ID FROM SAKILA.CUSTOMER C
LEFT JOIN SAKILA.STORE S ON (C.STORE_ID = S.STORE_ID)
LEFT JOIN SAKILA.ADDRESS A ON (C.ADDRESS_ID = A.ADDRESS);

-- Consulta la tabla rental de la base de datos sakila.
-- Realiza un INNER JOIN con la tabla staff
-- Mostrar las columnas rental_id, first_name
SELECT R.RENTAL_ID, S.FIRST_NAME FROM SAKILA.RENTAL R
INNER JOIN SAKILA.STAFF S ON (R.STAFF_ID = S.STAFF_ID); 

-- SUMA DE UNA COLUMNA
SELECT SUM(AMOUNT) FROM SAKILA.PAYMENT;

-- SUMAR COLUMNAS
SELECT INVENTORY_ID + FILM_ID + STORE_ID FROM SAKILA.INVENTORY;

-- COUNT (CONTAR REGISTROS)
SELECT COUNT(*) FROM SAKILA.ACTOR;

-- FUNCION PROMEDIO
SELECT AVG(RENTAL_DURATION) FROM SAKILA.FILM;

-- MAX Y MIN
SELECT MAX(LENGTH) FROM SAKILA.FILM;
SELECT MIN(LENGTH) FROM SAKILA.FILM;

-- Consulta la tabla rental de la base de datos sakila.
-- Realiza un COUNT de  la columna rental_id
SELECT COUNT(RENTAL_ID) FROM SAKILA.RENTAL;

-- Consulta la tabla payment de la base de datos sakila.
-- Realiza un MAX de la columna amount
SELECT MAX(AMOUNT) FROM SAKILA.PAYMENT;

-- GROUP BY
SELECT LAST_NAME, COUNT(LAST_NAME) FROM SAKILA.ACTOR GROUP BY LAST_NAME;

-- JUNTA LAS TABLAS CUSTOMER Y PAYMENT, AGRUPA POR ID Y MUESTRA LA SUMA DE LOS MONTOS DE CADA COMPRADOR
SELECT C.CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME,
SUM(AMOUNT)
FROM SAKILA.PAYMENT P
INNER JOIN SAKILA.CUSTOMER C ON (C.CUSTOMER_ID = P.CUSTOMER_ID) 
GROUP BY CUSTOMER_ID;

-- Consulta la tabla rental de la base de datos sakila.
-- Realiza un MAX de  la columna rental_date 
SELECT * FROM SAKILA.RENTAL;
SELECT CUSTOMER_ID, MAX(RENTAL_DATE)FROM SAKILA.RENTAL GROUP BY CUSTOMER_ID;

--- HAVING 
SELECT LAST_NAME, COUNT(*) 
FROM SAKILA.ACTOR 
GROUP BY 1 
HAVING COUNT(*) > 3;

SELECT C.CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME, SUM(P.AMOUNT) FROM SAKILA.PAYMENT P
INNER JOIN SAKILA.CUSTOMER C 
ON (P.CUSTOMER_ID = C.CUSTOMER_ID)
GROUP BY 1
HAVING SUM(P.AMOUNT) < 60
ORDER BY SUM(P.AMOUNT) DESC;

-- Consulta la tabla actor de la base de datos sakila.
-- Realiza un COUNT de  last_name
-- Mostrar cuando el COUNT sea mayor de 2
SELECT LAST_NAME, COUNT(LAST_NAME) FROM SAKILA.ACTOR
GROUP BY LAST_NAME 
HAVING COUNT(LAST_NAME) > 2;












 








 






