
create table products(
	product_id int auto_increment primary key ,
    product_name varchar(256),
    description varchar(256),
    price int,
    category_id int,
    image varchar(256),
    constraint fk_category_id_from_category foreign key (category_id) references categories(category_id)
);


create table categories(
	category_id int auto_increment primary key,
    category_name varchar(256),
    category_description varchar(256)
);