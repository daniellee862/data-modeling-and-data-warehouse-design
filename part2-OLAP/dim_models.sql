\c topmodelsql

DROP TABLE IF EXISTS dim_models;

CREATE TABLE dim_models (
  model_id SERIAL PRIMARY KEY,
  model_name VARCHAR(100),
  price_per_event FLOAT
);

INSERT INTO dim_models 
(model_name, price_per_event)
SELECT model_name, price_per_event
FROM models;


SELECT * FROM dim_models;


