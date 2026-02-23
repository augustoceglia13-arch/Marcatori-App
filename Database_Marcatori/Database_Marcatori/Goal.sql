CREATE TABLE [dbo].[Goal]
(
	[Id_Marcatore] INT NOT NULL PRIMARY KEY, 
    [Id_partita] INT NULL, 
    [N_goal] INT NULL, 
    CONSTRAINT [FK_Goal_Marcatori] FOREIGN KEY ([Id_Marcatore]) REFERENCES [Marcatori]([Id]), 
    CONSTRAINT [FK_Goal_Partite] FOREIGN KEY ([Id_partita]) REFERENCES [Partite]([Id])
)
