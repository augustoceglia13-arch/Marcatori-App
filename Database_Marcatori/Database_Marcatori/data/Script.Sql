/*--1- Lista dei campionati per nazione, quindi select DI nazione e campionato, ordinati per numero partite, quindi in testa i campionati con più partite 
2- Lista dei marcatori filtrati per squadra. Quindi select dei dati del marcatore, numero goal totale con filtro su IDSquadra (dal sito che faremo poi mi aspetto che se clicco su una squadra vedo subito i marcatori che hanno fatto più goal e le loro info), + stessa query filtrabile però per livelli più alti, quindi campionato e nazione.
*/ 

SELECT * FROM [dbo].[Nazioni] N
INNER JOIN [dbo].[Leghe] L ON L.Id_Nazione = N.Id
WHERE N.Nome = 'Italia'

SELECT * FROM [dbo].[Nazioni] N
SELECT * FROM  [dbo].[Leghe] L WHERE nome like '%lig%'

SELECT * FROM [dbo].[Squadre] S
INNER JOIN [dbo].[Leghe] L ON S.Id_Lega = L.Id
WHERE L.Nome = 'SERIE A' 






SELECT * FROM [dbo].[Nazioni] N
INNER JOIN [dbo].[Leghe] L ON L.Id_Nazione = N.Id
WHERE N.Nome = 'Italia'

SELECT 
Nazione = N.Nome,
Lega = L.Nome,
Partita = REPLACE(SC.Nome + ' - ' + SO.Nome,' ','')
FROM [dbo].[Partite] P 
INNER JOIN [dbo].[Squadre] Sc ON P.Id_Squadra_Casa = SC.Id
INNER JOIN [dbo].[Squadre] SO ON P.Id_Squadra_Ospite= So.Id
INNER JOIN [dbo].[Leghe] L ON L.Id = SC.Id_Lega and L.Id = SO.Id_Lega
INNER JOIN [dbo].[Nazioni] N ON N.Id = L.Id_Nazione
WHERE N.Nome = 'Italia'


SELECT TOP 5
Nazione = N.Nome,
Lega = L.Nome,
NumPartite = COUNT(*)
FROM [dbo].[Partite] P 
INNER JOIN [dbo].[Squadre] Sc ON P.Id_Squadra_Casa = SC.Id
INNER JOIN [dbo].[Squadre] SO ON P.Id_Squadra_Ospite= So.Id
INNER JOIN [dbo].[Leghe] L ON L.Id = SC.Id_Lega and L.Id = SO.Id_Lega
INNER JOIN [dbo].[Nazioni] N ON N.Id = L.Id_Nazione
WHERE N.Nome = 'Italia'
GROUP BY
	N.Nome,
 L.Nome
 ORDER BY COUNT(*) DESC

SELECT 
    M.Id,
    M.Nome,
    M.Cognome,
    M.Id_Squadra,SC.Nome,
    COUNT(*) AS TotaleGoal
FROM dbo.Marcatori M
INNER JOIN dbo.Partite P ON M.Id = P.Id
INNER JOIN dbo.Squadre SC ON M.Id_Squadra = SC.Id
INNER JOIN dbo.Leghe L ON L.Id = SC.Id_Lega

GROUP BY 
    M.Id,
    M.Nome,
    M.Cognome,
    M.Id_Squadra,SC.Nome
ORDER BY TotaleGoal DESC 


            