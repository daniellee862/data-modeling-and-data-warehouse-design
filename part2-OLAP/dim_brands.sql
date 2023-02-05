\c topmodelsql

DROP TABLE IF EXISTS fact_event_brand;
DROP TABLE IF EXISTS dim_brands;

CREATE TABLE dim_brands (
    brand_id SERIAL PRIMARY KEY,
    brand TEXT
);

INSERT INTO dim_brands
(brand)
SELECT DISTINCT UNNEST(string_to_array(brand, ', ' )) FROM models;

SELECT * FROM dim_brands;





CREATE TABLE fact_event_brand (
    brand_id INT REFERENCES dim_brands(brand_id),
    event_id INT REFERENCES fact_events(event_id)
);

INSERT INTO fact_event_brand (
    brand_id, event_id
) 
SELECT brand_id, event_id 
FROM (
    SELECT event_id, UNNEST(string_to_array(brand, ', ' )) AS unnested_brands 
    FROM models m
    JOIN fact_events fe ON m.model_id = fe.old_model_id
    ) AS tt
JOIN dim_brands db ON tt.unnested_brands = db.brand;

SELECT * FROM fact_event_brand;


ALTER TABLE fact_events DROP column old_model_id;

SELECT * FROM fact_events;