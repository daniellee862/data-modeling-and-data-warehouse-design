\c topmodelsql

DROP TABLE IF EXISTS dim_traits;

CREATE TABLE dim_traits (
    trait_id SERIAL PRIMARY KEY,
    trait VARCHAR(60)
);

INSERT INTO dim_traits
(trait)
SELECT DISTINCT trait FROM models;

SELECT * FROM dim_traits;