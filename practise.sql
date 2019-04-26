CREATE PROCEDURE SearchData(@id INT, @name VARCHAR(30) output)
WITH ENCRYPTION
AS
SET NOCOUNT ON
BEGIN
    SELECT @name=Name
    FROM my_student
    where id=@id
END