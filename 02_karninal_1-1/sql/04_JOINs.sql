-- SELECTS

-- EINZELTABELLEN
SELECT * FROM mydb.cats;
SELECT * FROM mydb.servants;

-- Kreuzprodukt (Kartesisches Produkt)
SELECT * FROM mydb.cats JOIN mydb.servants;

-- INNER JOIN 1 | Gesamte Tabelle
SELECT * FROM mydb.cats INNER JOIN mydb.servants
ON cats.id = servants.cats_id;

-- INNER JOIN 2 | Ausgewählte Spalten (Wer dient wem?)
-- Wer dient Grizabella?
-- Wem dient Junaid?
SELECT 
cat_name AS KATZE,
servant_name AS DIENER
FROM mydb.cats INNER JOIN mydb.servants
ON cats.id = servants.cats_id
# WHERE cat_name = "Grizabella"
WHERE servant_name = "Junaid";


-- INNER JOIN 2a | Wer dient wem?
-- "X ist der Diener von Y"
SELECT
CONCAT(servant_name, " ist der Diener von ", cat_name, ".") AS Dienstverhältnis
FROM mydb.cats INNER JOIN mydb.servants
ON cats.id = servants.cats_id;
# WHERE cat_name = "Grizabella"
# WHERE servant_name = "Junaid";
# WHERE servant_name = "Holger";

-- INNER JOIN 3 | Dienstzeit
SELECT
	servant_name AS DIENER,
    cat_name AS HERRSCHER,
    yrs_served AS DIENSTZEIT
FROM mydb.cats INNER JOIN mydb.servants
ON cats.id = servants.cats_id
ORDER BY yrs_served DESC;

-- INNER JOIN 4 | Dienstzeit
-- "X - der Diener von Y - ist der Diener mit der längsten Dienstzeit" // MAX()
SELECT 
servant_name AS "DIENER",
MAX(yrs_served) AS "DIENSTZEIT",
cat_name AS "HERRSCHER",
CONCAT(servant_name, " der Diener von ", cat_name, ", ist der Diener mit der längsten Dienstzeit.") AS "Ausgabe String"
FROM mydb.cats INNER JOIN mydb.servants
ON cats.id = servants.cats_id;

SELECT
CONCAT(servant_name, " der Diener von ", cat_name, ", ist der Diener mit der längsten Dienstzeit.") AS "Ausgabe String"
FROM mydb.cats INNER JOIN mydb.servants
ON cats.id = servants.cats_id
WHERE yrs_served = (SELECT MAX(yrs_served) FROM mydb.servants);


