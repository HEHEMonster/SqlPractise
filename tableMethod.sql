CREATE FUNCTION GetStudent(@id int)
RETURNS TABLE 
AS RETURN
(
    SELECT * FROM Students where id=@id
)