CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employe_data`()
BEGIN
select * from employe;
END