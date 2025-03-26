CREATE INDEX idx_ticket_flights_fare_conditions_flight_id ON ticket_flights (fare_conditions, flight_id);
CREATE INDEX idx_flights_flight_id ON flights(flight_id);
CREATE INDEX idx_ticket_flights_flight_id ON ticket_flights(flight_id);
CREATE INDEX idx_flights_aircraft_code ON flights(aircraft_code);
CREATE INDEX idx_seats_aircraft_code ON seats(aircraft_code);
CREATE INDEX idx_flights_covering ON flights(flight_id) 
INCLUDE (departure_airport, arrival_airport, scheduled_departure, scheduled_arrival, flight_no, status, aircraft_code);
CREATE INDEX idx_ticket_flights_covering ON ticket_flights(flight_id, fare_conditions) 
INCLUDE (amount);
CREATE INDEX idx_seats_covering ON seats(aircraft_code, fare_conditions);
CREATE INDEX idx_flights_composite ON flights (
    departure_airport,
    scheduled_departure,
    status,
    arrival_airport
) WHERE status <> 'Cancelled';
CREATE INDEX idx_tf_fare_conditions ON ticket_flights(fare_conditions)
WHERE fare_conditions = 'Economy';
CREATE INDEX idx_seats_composite ON seats(aircraft_code, fare_conditions)
WHERE fare_conditions = 'Economy';
CREATE INDEX idx_flights_dep_arr_status_sched ON flights(departure_airport, arrival_airport, status, scheduled_departure);
CREATE INDEX idx_flights_dep_sched_arr ON flights(departure_airport, scheduled_departure, arrival_airport, status);
CREATE INDEX idx_ticket_flights_flight_id_fare ON ticket_flights(flight_id, fare_conditions);
CREATE INDEX idx_seats_aircraft_fare ON seats(aircraft_code, fare_conditions);
CREATE INDEX idx_flights_dep_arr_sched_status ON flights(departure_airport, arrival_airport, scheduled_departure, status);
