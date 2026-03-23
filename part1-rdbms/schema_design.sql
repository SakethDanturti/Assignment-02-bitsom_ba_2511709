select * from assignment2.orders;
CREATE TABLE ORDER_LINE_1NF (
    order_id VARCHAR(20),
    product_id VARCHAR(20),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_city VARCHAR(100),
    product_name VARCHAR(100),
    category VARCHAR(100),
    unit_price DECIMAL(10,2),
    quantity INT,
    order_date DATE,
    sales_rep_id VARCHAR(20),
    sales_rep_name VARCHAR(100),
    sales_rep_email VARCHAR(100),
    office_address VARCHAR(255),
    PRIMARY KEY (order_id, product_id)
);

CREATE TABLE CUSTOMERS_2NF (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_city VARCHAR(100)
);

CREATE TABLE SALES_REPS_2NF (
    sales_rep_id VARCHAR(20) PRIMARY KEY,
    sales_rep_name VARCHAR(100),
    sales_rep_email VARCHAR(100),
    office_address VARCHAR(255)
);

CREATE TABLE PRODUCTS_2NF (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100),
    unit_price DECIMAL(10,2)
);

CREATE TABLE ORDERS_2NF (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    order_date DATE,
    sales_rep_id VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS_2NF(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES SALES_REPS_2NF(sales_rep_id)
);

CREATE TABLE ORDER_ITEMS_2NF (
    order_id VARCHAR(20),
    product_id VARCHAR(20),
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES ORDERS_2NF(order_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCTS_2NF(product_id)
);

CREATE TABLE CUSTOMERS (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100),
    customer_city VARCHAR(100)
);

CREATE TABLE SALES_REPS (
    sales_rep_id VARCHAR(20) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100),
    office_address VARCHAR(255)
);

CREATE TABLE PRODUCTS (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(100),
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE ORDERS_1 (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    order_date DATE NOT NULL,
    sales_rep_id VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES SALES_REPS(sales_rep_id)
);

CREATE TABLE ORDER_ITEMS (
    order_id VARCHAR(20) NOT NULL,
    product_id VARCHAR(20) NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES ORDERS_1(order_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id)
);

INSERT INTO CUSTOMERS (customer_id, customer_name, customer_email, customer_city) VALUES
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C006', 'Neha Gupta', 'neha@gmail.com', 'Delhi'),
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');

INSERT INTO SALES_REPS (sales_rep_id, sales_rep_name, sales_rep_email, office_address) VALUES
('SR02', 'Sneha Kapoor', 'sneha@company.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR01', 'Arjun Rao', 'arjun@company.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR03', 'Meera Iyer', 'meera@company.com', 'South Zone, MG Road, Bangalore - 560001');

INSERT INTO PRODUCTS (product_id, product_name, category, unit_price) VALUES
('P004', 'Notebook', 'Stationery', 120.00),
('P007', 'Pen Set', 'Stationery', 250.00),
('P005', 'Headphones', 'Electronics', 3200.00),
('P003', 'Desk Chair', 'Furniture', 8500.00),
('P006', 'Standing Desk', 'Furniture', 22000.00);

INSERT INTO ORDERS_1 (order_id, customer_id, order_date, sales_rep_id) VALUES
('ORD1027', 'C002', '2023-11-02', 'SR02'),
('ORD1114', 'C001', '2023-08-06', 'SR01'),
('ORD1153', 'C006', '2023-02-14', 'SR01'),
('ORD1002', 'C002', '2023-01-17', 'SR02'),
('ORD1118', 'C006', '2023-11-10', 'SR02');

INSERT INTO ORDER_ITEMS (order_id, product_id, quantity) VALUES
('ORD1027', 'P004', 4),
('ORD1114', 'P007', 2),
('ORD1153', 'P007', 3),
('ORD1002', 'P005', 1),
('ORD1118', 'P007', 5);