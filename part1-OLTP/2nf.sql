\c topmodelsql

DROP TABLE IF EXISTS second_nf;

DROP TABLE IF EXISTS brands;

CREATE TABLE brands AS
(SELECT 
    model_id
    , brands
FROM first_nf);


CREATE TABLE second_nf AS
(SELECT 
distinct model_id,
model_name,
area,
price_per_event,
category,
agent,
trait,
rating,
event_date,
revenue
FROM first_nf
ORDER BY model_id
);

SELECT * FROM brands;
SELECT * FROM second_nf; 