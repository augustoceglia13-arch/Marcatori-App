CREATE TABLE [dbo].[Marcatori]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Id_Squadra] INT NULL, 
    [Nome] NCHAR(50) NULL, 
    [Cognome] NCHAR(50) NULL, 
    [Nazionalità] NCHAR(50) NULL, 
    CONSTRAINT [FK_Marcatori_Squadre] FOREIGN KEY ([Id_Squadra]) REFERENCES [Squadre]([Id])
)
