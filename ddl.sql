CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    customer_address VARCHAR(200)
)

CREATE TABLE ticket(
    ticket_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    ticket_price NUMERIC(8, 2)
)

CREATE TABLE movies(
    movie_id SERIAL PRIMARY KEY,
    ticket_id INTEGER NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id),
    seats INTEGER NOT NULL,
    theater_id INTEGER NOT NULL 
)
CREATE TABLE concessions(
    item_id SERIAL PRIMARY KEY,
    concessions_name VARCHAR(50),
    concessions_price NUMERIC,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
    
)

ALTER TABLE concessions
DROP customer_id;

ALTER TABLE concessions
ADD ticket_id INTEGER NOT NULL;

ALTER TABLE concessions
ADD FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id);

ALTER TABLE movies
DROP ticket_id;

ALTER TABLE movies
ADD ticket_id INTEGER NOT NULL;

ALTER TABLE movies
ADD FOREIGN KEY (ticket_id) REFERENCES concessions(ticket_id),


