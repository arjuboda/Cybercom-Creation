create database productDetails;
use productDetails;


-- product table 
create table products(
	product_id int primary key,
    name varchar(256) ,
    description varchar(256),
    price int
);

describe products;

insert into products 
(product_id,name,description,price)
values
(1,'bulb','smart bulb',39),
(2,'fan','new electic fan',500),
(3,'bottel','best quality plastic bottel',69),
(4,'phone','smart phone',200);

ALTER TABLE products
MODIFY COLUMN name VARCHAR(256) NOT NULL,
MODIFY COLUMN price int NOT NULL;

 select * from products;
 
 
 -- category table
 create table categoryDetails(
	categoryID int primary key,
    categoryName varchar(256) unique not null,
    categoryDescreption varchar(256)
 );
 
 insert into categoryDetails
 (categoryID,categoryName,categoryDescreption)
 values
 (1,'Electric','device use electricity for working' ),
(2,'smartDevice','use sensor for work smartly' ), 
(3,'plastic','biodegradable plastic is used ' );

 select * from categoryDetails;


-- product-category table
CREATE TABLE Product_Category (
    ProductID INT,
    CategoryID INT,
    FOREIGN KEY (ProductID) REFERENCES products(product_id),
    FOREIGN KEY (CategoryID) REFERENCES categoryDetails(categoryID)
);

INSERT INTO Product_Category (ProductID, CategoryID)
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (3, 3),
       (4,  2);
 select * from Product_Category;      
       
SELECT p.product_id, p.name AS product_name, p.description, p.price, 
       cd.categoryID, cd.categoryName, cd.categoryDescreption
FROM products p
INNER JOIN Product_Category pc ON p.product_id = pc.ProductID
INNER JOIN categoryDetails cd ON pc.CategoryID = cd.categoryID;
