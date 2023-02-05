CREATE TABLE third_nf
( 
    model_id SERIAL PRIMARY KEY,
    model_name VARCHAR(100),
    area VARCHAR(50),
    price_per_event FLOAT,
    agent_category_id INT REFERENCES agent_categories(agent_category_id),
    brand_id INT REFERENCES brands(brand_id),
    trait VARCHAR(60),
    rating INT, 
    event_date TEXT, 
    revenue  FLOAT
);

CREATE TABLE agent_categories
(
    agent_category_id SERIAL PRIMARY KEY,
    category VARCHAR(100),
    agent VARCHAR(50)
);

CREATE TABLE brands
(   brand_id SERIAL PRIMARY KEY,
    model_id INT REFERENCES third_nf(model_id),
    brand TEXT
);