CREATE PROCEDURE SearchData(@id INT,
    @name VARCHAR(30) output)
WITH ENCRYPTION
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRAN
            DECLARE @name2 VARCHAR(30)
            SET @name2='6666'
            SELECT @name=Name
            FROM my_student
            where id=@id

            INSERT INTO my_student  (id,name,age) values(@id,@name2,11)
            SELECT @@IDENTITY  -- 返回插入ID
            SELECT @@ROWCOUNT -- 返回受影响行数
        COMMIT TRAN
    END TRY
    BEGIN CATCH------------有异常被捕获
        IF @@TRANCOUNT > 0---------------判断有没有事务
        BEGIN
            ROLLBACK TRAN----------回滚事务
        END 
        EXEC YourLogErrorProcedure-----------记录存储过程执行时的错误信息，自定义
    END CATCH--------结束异常处理
END