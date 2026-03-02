

select IDPartita = p.id, Partita = sc.Nome + ' - ' +so.Nome,mc.Id,mc.Nome,mc.Cognome,CAST(rand()*10 AS INT)
from[dbo].Partite p
inner join dbo.Squadre sc on sc.id= p.Id_Squadra_Casa
inner join [dbo].[Marcatori] mc on mc.Id_Squadra = sc.Id
inner join dbo.Squadre so on so.id= p.Id_Squadra_Ospite
where p.id = 1

select * from [dbo].[Goal]
select * from [dbo].Partite -- aggiungere un campo dataMatch

select CAST(rand()*10 AS INT)

INSERT INTO [dbo].[Goal]
select mc.Id,p.Id,CAST(rand()*10 AS INT)
from[dbo].Partite p
inner join dbo.Squadre sc on sc.id= p.Id_Squadra_Casa
inner join [dbo].[Marcatori] mc on mc.Id_Squadra = sc.Id
inner join dbo.Squadre so on so.id= p.Id_Squadra_Ospite
where p.id = 1