CREATE DATABASE IF NOT EXISTS qsr;
USE qsr;
CREATE TABLE IF NOT EXISTS menu(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    item varchar(255) not null,
    description varchar(500),
    category varchar(255),
    price float,
    currency varchar(5),
    image_url varchar(500),
    is_available INTEGER default 1
);

CREATE TABLE IF NOT EXISTS customer_order(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    total_items INTEGER,
    total_amount FLOAT,
    status varchar(255) default 'Payment Pending',
    order_datetime TIMESTAMP default CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS customer_order_details(
    order_id INTEGER,
    item varchar(255),
    quantity INTEGER NOT NULL,
    amount FLOAT NOT NULL,
    PRIMARY KEY(order_id, item)
);

CREATE TABLE IF NOT EXISTS  kitchen_order(
    order_id INTEGER,
    item VARCHAR(255),
    quantity INTEGER NOT NULL,
    PRIMARY KEY(order_id, item)
);



INSERT INTO menu(item, description, category, price, currency, image_url)
 SELECT * FROM (SELECT 'Chicken Burger', 'burger', 'Burgers', 5.0, 'USD', '/assets/default/burger.jpg') as tmp_name
 WHERE NOT EXISTS (SELECT item FROM menu where item = 'Chicken Burger');
INSERT INTO menu(item, description, category, price, currency, image_url)
 SELECT * FROM (SELECT 'Veg Burger', 'burger', 'Burgers', 3.5, 'USD', '/assets/default/burger.jpg') as tmp_name
 WHERE NOT EXISTS (SELECT item FROM menu where item = 'Veg Burger');
INSERT INTO menu(item, description, category, price, currency, image_url)
 SELECT * FROM (SELECT 'Chicken Pizza', 'pizza', 'Pizzas', 5.5, 'USD', '/assets/default/pizza.jpg') as tmp_name
 WHERE NOT EXISTS (SELECT item FROM menu where item = 'Chicken Pizza');
INSERT INTO menu(item, description, category, price, currency, image_url)
 SELECT * FROM (SELECT 'Veg Pizza', 'pizza', 'Pizzas', 4.5, 'USD', '/assets/default/pizza.jpg') as tmp_name
 WHERE NOT EXISTS (SELECT item FROM menu where item = 'Veg Pizza');
INSERT INTO menu(item, description, category, price, currency, image_url)
 SELECT * FROM (SELECT 'Coke', 'cold drink', 'Beverages', 1.5, 'USD', '/assets/default/coke.jpg') as tmp_name
 WHERE NOT EXISTS (SELECT item FROM menu where item = 'Coke');
INSERT INTO menu(item, description, category, price, currency, image_url)
 SELECT * FROM (SELECT 'Coffee', 'hot drink', 'Beverages', 2.5, 'USD', '/assets/default/coffee.jpg') as tmp_name
 WHERE NOT EXISTS (SELECT item FROM menu where item = 'Coffee');
