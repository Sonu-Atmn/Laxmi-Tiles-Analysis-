--checking null values
CREATE PROCEDURE CheckNullValues
    @TableName NVARCHAR(128)
AS
BEGIN

    DECLARE @sql NVARCHAR(MAX);

    SELECT @sql =
        STRING_AGG(
            'SELECT ''' + name + ''' AS ColumnName, COUNT(*) AS NullCount
             FROM ' + QUOTENAME(@TableName) + '
             WHERE ' + QUOTENAME(name) + ' IS NULL',
            ' UNION ALL '
        )
    FROM sys.columns
    WHERE object_id = OBJECT_ID(@TableName);

    EXEC sp_executesql @sql;

END;


exec CheckNullValues 'customers'