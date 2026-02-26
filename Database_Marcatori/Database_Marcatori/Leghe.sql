CREATE TABLE [dbo].[Leghe]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Id_Nazione] INT NULL, 
    [Nome] VARCHAR(200) NULL, 
    [Squadre] VARCHAR(200) NULL, 
    CONSTRAINT [FK_Leghe_Nazioni] FOREIGN KEY ([Id_Nazione]) REFERENCES [Nazioni]([Id])
)
