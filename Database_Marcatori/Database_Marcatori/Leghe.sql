CREATE TABLE [dbo].[Leghe]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Id_Nazione] INT NULL, 
    [Nome] NCHAR(50) NULL, 
    [Squadre] NCHAR(50) NULL, 
    CONSTRAINT [FK_Leghe_Nazioni] FOREIGN KEY ([Id_Nazione]) REFERENCES [Nazioni]([Id])
)
