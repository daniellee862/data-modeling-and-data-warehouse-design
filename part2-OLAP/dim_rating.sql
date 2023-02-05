\c topmodelsql

DROP TABLE IF EXISTS dim_ratings;

CREATE TABLE dim_ratings (
    rating_id SERIAL PRIMARY KEY,
    rating INT
);

INSERT INTO dim_ratings
(rating)
SELECT DISTINCT rating FROM models;

SELECT * FROM dim_ratings;