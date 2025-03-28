CREATE INDEX idx_airports_data_airport_code ON airports_data(airport_code);
CREATE INDEX idx_aircrafts_data_aircraft_code ON aircrafts_data(aircraft_code);
CREATE INDEX idx_flights_scheduled_arrival ON flights(scheduled_arrival DESC);
CREATE INDEX idx_boarding_passes_ticket_flight ON boarding_passes(ticket_no, flight_id);
CREATE INDEX idx_ticket_flights_ticket_flight ON ticket_flights(ticket_no, flight_id);
CREATE INDEX idx_flights_departure_scheduled ON flights(departure_airport, scheduled_departure);
CREATE INDEX idx_tickets_passenger_name_no ON tickets(
    passenger_name,
    ticket_no
);
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



CREATE INDEX idx_flights_dep_sched_arr_status ON flights(
    departure_airport, 
    scheduled_departure, 
    arrival_airport, 
    status
) WHERE status <> 'Cancelled';

CREATE INDEX idx_flights_dep_arr_sched_actual ON flights(
    departure_airport, 
    arrival_airport, 
    scheduled_departure
) INCLUDE (actual_arrival) 
WHERE actual_arrival IS NOT NULL;

CREATE INDEX idx_boarding_passes_flight_id_ticket ON boarding_passes(flight_id, ticket_no);

CREATE INDEX idx_tf_flight_id_fare_amount ON ticket_flights(flight_id, fare_conditions) 
INCLUDE (amount) 
WHERE fare_conditions = 'Economy';

CREATE INDEX idx_flights_dep_arr_sched_filtered ON flights(
    departure_airport, 
    arrival_airport, 
    scheduled_departure
) WHERE status <> 'Cancelled';
CREATE INDEX idx_flights_optimized2 ON flights(actual_departure, flight_id, aircraft_code)
WHERE actual_departure >= '2012-01-01 00:00:00'
    AND actual_departure < '2017-12-31 23:59:59';
CREATE INDEX idx_tickets_book_ref_ticket_no_v2 ON tickets(book_ref, ticket_no) INCLUDE (passenger_id);
CREATE INDEX idx_tf_ticket_flight_amount ON ticket_flights(ticket_no, flight_id, amount);
CREATE INDEX idx_flights_dep_arr_aircraft ON flights(departure_airport, arrival_airport, aircraft_code);
CREATE INDEX idx_ticket_flights_ticket_no_flight_id_amount ON ticket_flights (ticket_no, flight_id) INCLUDE (amount);
CREATE INDEX idx_tickets_book_ref_ticket_no ON tickets (book_ref, ticket_no);
CREATE INDEX idx_boarding_passes_covering ON boarding_passes (ticket_no) INCLUDE (flight_id, boarding_no);
CREATE INDEX idx_airports_data_code_city ON airports_data (airport_code) INCLUDE (city);
CREATE INDEX idx_flights_arr_dep_airport ON flights (arrival_airport, departure_airport)
INCLUDE (aircraft_code, flight_id);
