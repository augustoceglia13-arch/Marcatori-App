CREATE TABLE [dbo].[Partite]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Id_Squadra_Casa] INT NULL, 
    [Id_Squadra_Ospite] INT NULL, 
    [Data] DATE NULL, 
    CONSTRAINT [FK_Partite_Squadre_Casa] FOREIGN KEY ([Id_Squadra_Casa]) REFERENCES [Squadre]([Id]), 
    CONSTRAINT [FK_Partite_Squadre_Ospite] FOREIGN KEY ([Id_Squadra_Ospite]) REFERENCES [Squadre]([Id])
)
