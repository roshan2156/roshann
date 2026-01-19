--CAST – Cast a value of one type to another.
SELECT CAST(123.45 AS INT) AS CastResult;

--CONVERT – Convert a value of one type to another.
SELECT CONVERT(VARCHAR(10), GETDATE(), 120) AS ConvertResult;

--CHOOSE – Return one of the two values based on the result of the first argument.
SELECT CHOOSE(2, 'Apple', 'Banana', 'Cherry') AS ChooseResult;

--ISNULL – Replace NULL with a specified value.
SELECT ISNULL(NULL, 'Default Value') AS IsNullResult;  

--ISNUMERIC – Check if an expression is a valid numeric type.
SELECT ISNUMERIC('12345') AS IsNumericResult,  
       ISNUMERIC('ABC') AS IsNumericResult2;    

--IIF – Add if-else logic to a query.
SELECT IIF(5 > 10, 'Yes', 'No') AS IifResult;

--TRY_CAST – Cast a value of one type to another and return NULL if the cast fails.
SELECT TRY_CAST('123' AS INT) AS TryCastResult,          
       TRY_CAST('ABC' AS INT) AS TryCastFail;          


--TRY_CONVERT – Convert a value of one type to another and return the value to be translated into the specified type. It returns NULL if the cast fails.
SELECT TRY_CONVERT(DATE, '2026-01-09', 120) AS TryConvertResult;  

--TRY_PARSE – Convert a string to a date/time or a number and return NULL if the conversion fails.
SELECT TRY_PARSE('2026-01-09' AS DATE USING 'en-US') AS TryParseResult;  

--Convert datetime to string – Show you how to convert a datetime value to a string in a specified format.
SELECT CONVERT(VARCHAR, GETDATE(), 120) AS DateToString;

--Convert string to datetime – Describe how to convert a string to a datetime value.
SELECT CONVERT(DATETIME, '2026-01-09 15:30:00', 120) AS StringToDateTime;  

--Convert datetime to date – Convert a datetime to a date.
SELECT CAST(GETDATE() AS DATE) AS DateOnly;  

--GENERATE_SERIES() – Generate a series of numbers within a specific range.
SELECT value AS SeriesNumber
FROM GENERATE_SERIES(1,5);