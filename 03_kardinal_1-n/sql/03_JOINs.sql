-- 03. SECELTS

-- Einzeltabellen
SELECT * FROM cats;
SELECT * FROM kittens;

-- INNER JOIN 1 | Gesamte Kombi Tabelle
SELECT * FROM cats INNER JOIN kittens
ON cats.id = kittens.cats_id; 

-- INNER JOIN 2 | Verwandschaft
-- "X ist die Mutter von Y"
SELECT cat_name AS Mutter, kitten_name AS Kind,
CONCAT(cat_name, " ist die Mutter von ", kitten_name) AS Verwandschaft
FROM cats INNER JOIN kittens
ON cats.id = kittens.cats_id;


-- Inner Join 3 / Wie viel Kinder haben die Katzen?
SELECT
    cat_name AS Mutter,
    COUNT(cat_name) AS "Anzahl Kinder",
    CONCAT(cat_name, " ist die Mutter von ", kitten_name) AS Verwandschaft
FROM cats INNER JOIN kittens
on cats.id = kittens.cats_id
GROUP BY cat_name # Wichtig bei Kombi Aggr. /Nicht-Aggr.
;
