CREATE TABLE [dbo].[Squadre]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Id_Lega] INT NULL, 
    [Nome] NCHAR(50) NULL, 
    [Soprannome] NCHAR(50) NULL, 
    [Punti] INT NULL, 
    [Modulo] INT NULL, 
    CONSTRAINT [FK_Squadre_Leghe] FOREIGN KEY ([Id_Lega]) REFERENCES [Leghe]([Id])
)
