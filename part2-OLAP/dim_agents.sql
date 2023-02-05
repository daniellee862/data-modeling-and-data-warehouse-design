\c topmodelsql

DROP TABLE IF EXISTS dim_agents;

CREATE TABLE dim_agents (
    agent_id SERIAL PRIMARY KEY,
    agent VARCHAR(50)
);

INSERT INTO dim_agents
(agent)
SELECT DISTINCT agent FROM models;

SELECT * FROM dim_agents;