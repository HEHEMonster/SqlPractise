CREATE FUNCTION student(@name varchar(20))
RETURNS INT 
AS 
BEGIN 
    declare @sid int
    SELECT @sid=id from student where name=@name
    RETURN @sid
END
