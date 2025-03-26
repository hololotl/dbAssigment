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
