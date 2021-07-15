-- 03. SELECTS
USE mydb;

-- Einzeltabellen
SELECT * FROM cats;
SELECT * FROM servants;
SELECT * FROM products;
SELECT * FROM purchases;

-- INNER JOIN 1 | Kombi (servants + Products + Cats)
SELECT * FROM purchases 
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN  products ON products.id = purchases.products_id;

-- Welche Artikel hat Dieter gekauft?
SELECT 
	# servant_name AS "Diener",
    # product_name AS "Artikel"
    CONCAT(servant_name, " kauft ", product_name, ".") AS "Kaufhandlung"
FROM purchases
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
WHERE servant_name ="Dieter";

-- Wieviele Produkte hat Dieter gekauft?
SELECT 
	CONCAT(servant_name, " kauft ", COUNT(product_name), " Produkte.") AS "Kaufhandlung"
FROM purchases
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
WHERE servant_name ="Dieter"; 

-- Wie viel Geld hat Dieter ausgegeben?
SELECT 
	CONCAT(servant_name, " gibt ", SUM(product_price), " € für seinen Einkauf aus.") AS "Kaufhandlung"
FROM purchases
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
WHERE servant_name ="Dieter"; 

-- Kombi Aggregiert / Nicht Aggregiert
SELECT
	servant_name AS "Diener",
    sum(product_price) AS "Gesamtkosten"
FROM purchases
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
GROUP BY servant_name # wichtig bei Aggregation!
HAVING servant_name = "Dieter";


-- Wer hat das Produkt X gekauft?
-- Irgendwas mit Lachs / Irgendwas mit Sauce (LIKE)
-- Spalten: Diener und Produkt
SELECT
	servant_name AS "DIENER",
    product_name AS "Produkte mit Soße oder Lachs"
FROM purchases
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
WHERE product_name LIKE "%Lachs%" OR product_name LIKE "%Sauce%";
