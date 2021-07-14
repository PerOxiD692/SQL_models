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