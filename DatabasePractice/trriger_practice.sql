use practice;
CREATE TABLE example_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data VARCHAR(50),
    created_at TIMESTAMP
);
CREATE TABLE example_table2 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data VARCHAR(50)
);

DELIMITER //

CREATE TRIGGER update_timestamp_trigger BEFORE INSERT ON example_table
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END;
//

DELIMITER ;

insert into example_table (data) value ('new data2');
select * from example_table;

-- ALTER TABLE example_table ADD COLUMN modified_at TIMESTAMP DEFAULT NULL;

DELIMITER //

CREATE TRIGGER data_update_trriger AFTER UPDATE ON example_table
FOR EACH ROW
BEGIN
    IF OLD.data != NEW.data THEN
        INSERT INTO example_table2 (data)
        VALUES (NEW.data);
    END IF;
END;
//

DELIMITER ;

update example_table set data='new data' where id=1;
select * from example_table;
select * from example_table2;