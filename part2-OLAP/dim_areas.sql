\c topmodelsql

DROP TABLE IF EXISTS dim_areas;

CREATE TABLE dim_areas (
    area_id SERIAL PRIMARY KEY, 
    area VARCHAR(50)
);

INSERT INTO dim_areas (
    area
)
    SELECT DISTINCT area
    from models ;



SELECT * FROM dim_areas;