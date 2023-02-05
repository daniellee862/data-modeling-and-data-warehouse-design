\c topmodelsql

DROP TABLE IF EXISTS dim_dates;

CREATE TABLE dim_dates (
    date_id SERIAL PRIMARY KEY,
    event_date VARCHAR(50)
);

INSERT INTO dim_dates
(event_date)
SELECT DISTINCT event_date FROM models;

SELECT * FROM dim_dates;