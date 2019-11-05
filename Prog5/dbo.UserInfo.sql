CREATE TABLE [dbo].[UserInfo] (
    [Id]       NVARCHAR (50) NOT NULL,
    [Name]     NCHAR (30)    NOT NULL,
    [Email]    NCHAR (30)    NOT NULL,
    [Password] NCHAR (15)    NOT NULL,
    [userID]   NCHAR (15)    NOT NULL, 
    CONSTRAINT [PK_UserInfo] PRIMARY KEY ([userID])
);

