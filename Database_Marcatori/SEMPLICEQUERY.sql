DELETE FROM [dbo].[Goal]
DELETE FROM [dbo].[Marcatori]
DELETE FROM	[dbo].[Partite]	
DELETE FROM [dbo].[Squadre]
DELETE FROM [dbo].[Leghe]
DELETE FROM [dbo].[Nazioni] 

SELECT * FROM [dbo].[Nazioni] 
SELECT Id FROM [dbo].[Leghe]
WHERE Id_Nazione = SELECT * FROM [dbo].[Nazioni] 

SELECT Id FROM [dbo].[Squadre]
WHERE Id_Lega = SELECT Id FROM [dbo].[Leghe]

SELECT Id_Squadra_Casa, Id_Squadra_Ospite FROM [dbo].[Partite]	
WHERE Id_Squadra_Casa = SELECT Id FROM [dbo].[Squadre]
OR Id_Squadra_Ospite = SELECT Id FROM [dbo].[Squadre]

SELECT Id FROM [dbo].[Marcatori]
WHERE Id_Squadra = SELECT Id_Squadra_Casa FROM [dbo].[Partite]	
OR Id_Squadra = SELECT Id_Squadra_Ospite FROM [dbo].[Partite]	
AND Id_squadra = SELECT Id FROM [dbo].[Squadre]

SELECT Id_Marcatore FROM [dbo].[Goal]  