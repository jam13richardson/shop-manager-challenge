TRUNCATE TABLE items, orders RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO items (item_name, unit_price, quantity) VALUES ('Chutney', 3, 200);
INSERT INTO items (item_name, unit_price, quantity) VALUES ('Ben & Jerrys', 5, 500);
INSERT INTO orders (customer_name, item_name, order_date, item_id) VALUES ('Jamie','Chutney', '01-4-2023', 1);
INSERT INTO orders (customer_name, item_name, order_date, item_id) VALUES ('Ian', 'Coke', '03-12-2023', 2);