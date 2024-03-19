use practice;

DELIMITER //

CREATE PROCEDURE CRUDExample (
    IN action VARCHAR(10),
    IN id_param INT,
    IN name_param VARCHAR(255),
    IN age_param INT
)
BEGIN
	IF action = 'create' THEN
		IF NOT EXISTS (SELECT * FROM information_schema.tables WHERE table_name = 'crudProcedure') THEN
			CREATE TABLE crudProcedure (
				id INT auto_increment primary key,
				name VARCHAR(255) DEFAULT NULL,
				age INT DEFAULT NULL
			);
		END IF;
   ELSEIF action = 'insert' THEN
        INSERT INTO crudProcedure (id,name, age) VALUES (id_param,name_param, age_param);
	ELSEIF action = 'select' THEN
        select * from crudProcedure;
    ELSEIF action = 'update' THEN
        UPDATE crudProcedure SET name = name_param, age = age_param WHERE id = id_param;
    ELSEIF action = 'delete' THEN
        DELETE FROM crudProcedure WHERE id = id_param;
    ELSE
        SELECT 'Invalid action';
    END IF;
END //

DELIMITER ;

CALL CRUDExample('create', NULL, NULL, NULL);
CALL CRUDExample('insert', 3, 'Happy', 09);
CALL CRUDExample('update', 1, 'Jane', 35);
CALL CRUDExample('delete', 4, NULL, NULL);
CALL CRUDExample('select',null,null,null);




select * from crudProcedure;
drop procedure CRUDExample;
drop table crudProcedure;
insert into crudProcedure (name,age) value ('John',29),('Marry',31);





/* ********************************************************************************************** */

delimiter // 

CREATE PROCEDURE createExmpl()
BEGIN
	IF NOT EXISTS (SELECT * FROM information_schema.tables WHERE table_name = 'crudProcedure2') THEN
    CREATE TABLE crudProcedure2 (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(256),
        age INT
    );
    end if;
END;
drop PROCEDURE insertExmpl

CREATE PROCEDURE insertExmpl(IN id_param INT, IN name_param VARCHAR(256), IN age_param INT)
BEGIN
    INSERT INTO crudProcedure2 (id, name, age) VALUES (id_param, name_param, age_param);
END;

CREATE PROCEDURE updateExmpl(IN id_param INT, IN name_param VARCHAR(256), IN age_param INT)
BEGIN
    UPDATE crudProcedure2 SET name = name_param, age = age_param WHERE id = id_param;
END;
CREATE PROCEDURE deleteExmpl(IN id_param INT)
BEGIN
    DELETE FROM crudProcedure2 WHERE id = id_param;
END;

create procedure tableCrudProcedure2(
	IN action VARCHAR(10), 
     IN id_param INT,
    IN name_param VARCHAR(256), 
    IN age_param INT
)
BEGIN
    IF action = 'create' THEN
        CALL createExmpl();
    ELSEIF action = 'insert' THEN
        CALL insertExmpl(id_param,name_param, age_param);
    ELSEIF action = 'update' THEN
        CALL updateExmpl(id_param, name_param, age_param);
	ELSEIF action = 'select' THEN
        select * from crudProcedure2;
    ELSEIF action = 'delete' THEN
        CALL deleteExmpl(id_param);
    ELSE
        SELECT 'Invalid action';
    END IF;
END;

delimiter ;

CALL tableCrudProcedure2('create', NULL, NULL, NULL);
CALL tableCrudProcedure2('insert', 03,'Merry', 25);
CALL tableCrudProcedure2('update', 1, 'Joy', 45);
CALL tableCrudProcedure2('delete', 3, NULL, NULL);
CALL tableCrudProcedure2('select',null,null,null);
CALL tableCrudProcedure2('create', NULL, NULL, NULL);

drop  procedure tableCrudProcedure2;