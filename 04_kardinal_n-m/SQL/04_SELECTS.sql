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

-- Wie oft wurde ein Produkt gekauft?
SELECT
    product_name AS "Produkt",
    COUNT(product_name) AS "Anzahl"
FROM purchases
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
GROUP BY product_name ORDER BY Anzahl DESC;

-- Welche Umsätze hatte das Produkt?
SELECT
    product_name AS "Produkt",
    COUNT(product_name) AS "Anzahl",
    SUM(product_price) AS "UMSATZ"
FROM purchases
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
GROUP BY product_name ORDER BY UMSATZ DESC;

-- Berechnung in gleicher Tabelle
SELECT
	product_name AS Produkt,
    product_price AS Preis,
    count(product_name) AS Anzahl,
    count(product_name) * product_price AS Umsatz
FROM purchases
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
GROUP BY Produkt,Preis
ORDER BY Umsatz DESC
;

/*  Lösung B: Berechnung mit tmp-Tabelle
DROP TABLE IF EXISTS tmp;
CREATE TABLE tmp
(
	product_name VARCHAR(45) NOT NULL,
    product_price DECIMAL(4,2) NOT NULL,
    anzahl INT NOT NULL
);
-- tmp: Struktur
DESCRIBE tmp;
-- Daten aus SELECT in Tabelle tmp
INSERT INTO tmp
SELECT
	product_name AS Produkt,
    product_price AS Preis,
    count(product_name) AS Anzahl
FROM purchases 
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
GROUP BY product_name,product_price
;
-- tmp: Inhalte
SELECT * FROM tmp;
-- Berechnung Umsätze
SELECT
	product_name AS Produkt,
    product_price AS Preis,
	Anzahl,
    Anzahl * product_price AS Umsatz
FROM tmp
ORDER BY Umsatz DESC;
*/


-- Wer bekommt den Lachs?
-- Ansatz: Produkt --> Diener : cats_id --> cat: Name
-- Lösung Tabelle
SELECT 
	servant_name AS "DIENER",
    product_name AS "PRODUKT",
    cat_name AS "HERRSCHER"
FROM purchases
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
INNER JOIN cats ON cats.id = servants.cats_id
WHERE product_name LIKE "%Lachs%";

-- Lösung String
SELECT 
    CONCAT(servant_name, " der Diener von ", cat_name," kauft, ",product_name, " für seinen Herrscher!") AS "Wer bekommt den Lachs?"
FROM purchases
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
INNER JOIN cats ON cats.id = servants.cats_id
WHERE product_name LIKE "%Lachs%";

