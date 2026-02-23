CREATE TABLE [dbo].[Nazioni]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Id_Continente] INT NULL, 
    [Nome] NCHAR(50) NULL, 
    CONSTRAINT [FK_Nazioni_Continenti] FOREIGN KEY ([Id_Continente]) REFERENCES [Continenti]([Id])
)
