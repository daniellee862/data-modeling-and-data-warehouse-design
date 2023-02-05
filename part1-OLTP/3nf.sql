\c topmodelsql

DROP TABLE IF EXISTS third_nf;


DROP TABLE IF EXISTS agent_categories;
CREATE TABLE agent_categories
(
    agent_category_id SERIAL PRIMARY KEY,
    category VARCHAR(100),
    agent VARCHAR(50)
);

INSERT INTO agent_categories
(category, agent)
(
SELECT
DISTINCT category,
         agent
FROM second_nf 
);


CREATE TABLE third_nf AS
(SELECT 
DISTINCT model_id,
model_name,
area,
price_per_event,
agent_category_id,
trait,
rating,
event_date,
revenue
FROM second_nf 
JOIN agent_categories 
ON second_nf.category = agent_categories.category 
AND second_nf.agent = agent_categories.agent
);


SELECT * FROM agent_categories;
SELECT * FROM third_nf;