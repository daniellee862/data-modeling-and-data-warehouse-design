\c topmodelsql

--DROP TABLE IF EXISTS dim_brands;
--DROP TABLE IF EXISTS fact_event_brand;
DROP TABLE IF EXISTS fact_events;

CREATE TABLE fact_events (
    event_id SERIAL PRIMARY KEY,
    model_id INT REFERENCES dim_models(model_id),
    old_model_id INT, 
    area_id INT REFERENCES dim_areas(area_id),
    category_id INT REFERENCES dim_categories(category_id),
    agent_id INT REFERENCES dim_agents(agent_id),
    trait_id INT REFERENCES dim_traits(trait_id),
    rating_id INT REFERENCES dim_ratings(rating_id),
    date_id INT REFERENCES dim_dates(date_id),
    revenue FLOAT
);



INSERT INTO fact_events
(model_id, old_model_id, area_id, category_id, agent_id, trait_id, rating_id, date_id, revenue)
SELECT dm.model_id, m.model_id, area_id, category_id, agent_id, trait_id, rating_id, date_id, revenue
FROM models m 
JOIN dim_models dm ON m.model_name = dm.model_name
JOIN dim_areas da ON m.area = da.area
JOIN dim_categories dc ON m.category = dc.category
JOIN dim_agents dg ON m.agent = dg.agent
JOIN dim_traits dt ON m.trait = dt.trait
JOIN dim_ratings dr ON m.rating = dr.rating
JOIN dim_dates dd ON m.event_date = dd.event_date; 


SELECT * FROM fact_events;

