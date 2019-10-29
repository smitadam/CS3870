CREATE TABLE [dbo].[Product]
(
	[ProductID] NCHAR(4) NOT NULL PRIMARY KEY, 
    [ProductName] NVARCHAR(50) NOT NULL, 
    [UnitPrice] SMALLMONEY NOT NULL, 
    [Description] NVARCHAR(MAX) NULL
)
