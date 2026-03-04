using System.Data;
using System.Diagnostics;
using Dapper;
using MarcatoriWebSite.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace MarcatoriWebSite.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
    
            return View();
        }
        public ActionResult Campionati()
        {
            string connectionString = "Server=localhost;Database=Marcatori;TrustServerCertificate=true;Integrated Security = SSPI";
            IEnumerable<Campionato> listaCampionati;
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"
SELECT TOP 5
    IDNazione = N.Id,
    Nazione = N.Nome,
    IDLega = L.Id,
    Lega = L.Nome,
    NumPartite = COUNT(*)
FROM 
    [dbo].[Partite] P 
    INNER JOIN [dbo].[Squadre] Sc ON P.Id_Squadra_Casa = SC.Id
    INNER JOIN [dbo].[Squadre] SO ON P.Id_Squadra_Ospite= So.Id
    INNER JOIN [dbo].[Leghe] L ON L.Id = SC.Id_Lega and L.Id = SO.Id_Lega
    INNER JOIN [dbo].[Nazioni] N ON N.Id = L.Id_Nazione
GROUP BY
	N.Id,
	L.Id,
	N.Nome,
	L.Nome
 ORDER BY COUNT(*) DESC";

                connection.Open();
                listaCampionati = connection.Query<Campionato>(sql);
            }
            return View(listaCampionati);
        }

        public IActionResult Nazioni()
        {
            string connectionString = "Server=localhost;Database=Marcatori;TrustServerCertificate=true;Integrated Security = SSPI";
            IEnumerable<Nazione> listaNazioni;
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"
SELECT 
    IDNazione = N.Id,
    Nome = N.Nome,
    CountryCode = N.CountryCode, 
    NumPartite = COUNT(*)
FROM 
    [dbo].[Partite] P 
    INNER JOIN [dbo].[Squadre] SC ON P.Id_Squadra_Casa = SC.Id
    INNER JOIN [dbo].[Squadre] SO ON P.Id_Squadra_Ospite = SO.Id
    INNER JOIN [dbo].[Leghe] L ON L.Id = SC.Id_Lega AND L.Id = SO.Id_Lega
    INNER JOIN [dbo].[Nazioni] N ON N.Id = L.Id_Nazione
GROUP BY
    N.Id,
    N.Nome,
    N.CountryCode        
ORDER BY 
    COUNT(*) DESC";

                connection.Open();
                listaNazioni = connection.Query<Nazione>(sql);
            }
            return View(listaNazioni);

        } 

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
                  
    }
}
