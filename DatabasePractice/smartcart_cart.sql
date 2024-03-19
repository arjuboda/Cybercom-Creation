
USE smartcart_project;

CREATE TABLE shoppingCart(
 cart_id INT AUTO_INCREMENT PRIMARY KEY,
 customer_id INT,
 product_id INT,
 quantity INT,
 total_price DECIMAL(10,2),
 dateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 CONSTRAINT fk_customer_id_from_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
 CONSTRAINT fk_product_id_from_products FOREIGN KEY (product_id) REFERENCES products(product_id),
 INDEX idx_customer_id (customer_id),
 INDEX idx_product_id (product_id),
 INDEX idx_dateAdded (dateAdded)
);

select * from shoppingCart;