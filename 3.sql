CREATE INDEX idx_flights_optimized2 ON flights(actual_departure, flight_id, aircraft_code)
WHERE actual_departure >= '2012-01-01 00:00:00'
    AND actual_departure < '2017-12-31 23:59:59';
