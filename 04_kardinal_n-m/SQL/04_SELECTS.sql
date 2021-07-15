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
# WHERE servant_name ="Dieter"; 
WHERE servants_id = 2;

