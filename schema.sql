CREATE TABLE Events (
    event_id INTEGER PRIMARY KEY,
    event_name TEXT,
    event_type TEXT,
    event_date DATE,
    venue TEXT,
    capacity INTEGER
);

CREATE TABLE Attendees (
    attendee_id INTEGER PRIMARY KEY,
    name TEXT,
    city TEXT,
    signup_date DATE
);

CREATE TABLE TicketSales (
    sale_id INTEGER PRIMARY KEY,
    attendee_id INTEGER,
    event_id INTEGER,
    quantity INTEGER,
    sale_date DATE,
    FOREIGN KEY (attendee_id) REFERENCES Attendees(attendee_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

CREATE TABLE MarketingSpend (
    spend_id INTEGER PRIMARY KEY,
    attendee_id INTEGER,
    spend_amount DECIMAL(7,2),
    FOREIGN KEY (attendee_id) REFERENCES Attendees(attendee_id)
);
