CREATE INDEX idx_tickets_book_ref_ticket_no ON tickets(book_ref, ticket_no) INCLUDE (passenger_id);
CREATE INDEX idx_tf_ticket_flight_amount ON ticket_flights(ticket_no, flight_id, amount);
CREATE INDEX idx_flights_dep_arr_aircraft ON flights(departure_airport, arrival_airport, aircraft_code);
CREATE INDEX idx_ticket_flights_ticket_no_flight_id_amount ON ticket_flights (ticket_no, flight_id) INCLUDE (amount);
CREATE INDEX idx_tickets_book_ref_ticket_no ON tickets (book_ref, ticket_no);
CREATE INDEX idx_boarding_passes_covering ON boarding_passes (ticket_no) INCLUDE (flight_id, boarding_no);
CREATE INDEX idx_airports_data_code_city ON airports_data (airport_code) INCLUDE (city);
CREATE INDEX idx_flights_arr_dep_airport ON flights (arrival_airport, departure_airport)
INCLUDE (aircraft_code, flight_id);
