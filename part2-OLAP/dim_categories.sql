\c topmodelsql

DROP TABLE IF EXISTS dim_categories;

CREATE TABLE dim_categories (
    category_id SERIAL PRIMARY KEY,
    category VARCHAR(100)
);

INSERT INTO dim_categories
(category)
SELECT DISTINCT category FROM models;

SELECT * FROM dim_categories;