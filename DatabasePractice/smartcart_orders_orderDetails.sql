/*
OrderDetails

OrderDetailID (Primary Key)
OrderID (Foreign Key referencing Orders table)
ProductID (Foreign Key referencing Products table)
Quantity
UnitPrice
TotalPrice (can be calculated based on UnitPrice * Quantity)*/

USE smartcart_project;
CREATE TABLE orders(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    orderDate DATE,
    DeliveryAddress varchar(256),
    total_amount DECIMAL(10,2),
    status VARCHAR(256) DEFAULT 'PENDING',
    CONSTRAINT fk_customer_id_of_orders_from_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    INDEX idx_customer_id (customer_id),
    INDEX idx_orderDate (orderDate)
);

CREATE TABLE orderDetails(
	orderdetail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    CONSTRAINT fk_corder_id_of_orderDetails_from_orders FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_product_id_of_orderDetails_from_products FOREIGN KEY (product_id) REFERENCES products(product_id),
    INDEX idx_orderDetails_order_id (order_id),
    INDEX idx_orderDetails_product_id (product_id)
);

CREATE TABLE wishlist (
    wishlist_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    CONSTRAINT fk_customer_id_for_wishlist_from_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_product_id_for_wishlist_from_products FOREIGN KEY (product_id) REFERENCES products(product_id),
    INDEX idx_customer_product (customer_id, product_id) 
);