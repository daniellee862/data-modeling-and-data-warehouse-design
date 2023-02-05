\c topmodelsql

DROP TABLE IF EXISTS first_nf;
CREATE TABLE first_nf AS
(SELECT 
model_id,
model_name,
area,
price_per_event,
category,
agent,
UNNEST(string_to_array(brand, ', ')) AS brands,
trait,
rating,
event_date,
revenue
FROM models
);


SELECT * FROM first_nf; 