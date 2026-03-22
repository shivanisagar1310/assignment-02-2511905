
CREATE DATABASE IF NOT EXISTS retail_store;
USE retail_store;

CREATE TABLE customers (
    customer_id VARCHAR(16) PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(124)
);

CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(16) PRIMARY KEY,
    sales_rep_name VARCHAR(255) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(255) NOT NULL
);

CREATE TABLE products (
    product_id VARCHAR(16) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders ( 
    order_id VARCHAR(16) PRIMARY KEY,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    customer_id VARCHAR(16) NOT NULL,
    product_id VARCHAR(16) NOT NULL,
    sales_rep_id VARCHAR(16) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

INSERT INTO customers VALUES
('C002','Priya Sharma','priya@gmail.com','Delhi'),
('C003','Amit Verma','amit@gmail.com','Bangalore'),
('C005','Vikram Singh','vikram@gmail.com','Mumbai'),
('C006','Neha Gupta','neha@gmail.com','Delhi'),
('C007','Rahul Mehta','rahul@gmail.com','Pune');

INSERT INTO sales_reps VALUES
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point'),
('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place'),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore'),
('SR04', 'Sneha Iyer', 'sneha@corp.com','Chennai Office'),
('SR05', 'Arjun Rao', 'arjun@corp.com', 'Hyderabad Office');

INSERT INTO products VALUES
('P003','Desk Chair','Furniture', 8500.00),
('P005','Headphones','Electronics', 3200.00),
('P007','Pen Set','Stationery', 250.00),
('P008','Notebook','Stationery', 100.00),
('P009','Mouse','Electronics', 500.00);

INSERT INTO orders VALUES
('ORD1002',1,'2023-01-17','C002','P005','SR02'),
('ORD1118',5,'2023-11-10','C006','P007','SR02'),
('ORD1132',5,'2023-03-07','C003','P007','SR02'),
('ORD1037',2,'2023-03-06','C002','P007','SR03'),
('ORD1075',3,'2023-04-18','C005','P003','SR03');
