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
        public ActionResult Campionati()
        {
            //string connectionString = "Server=localhost;Database=Marcatori;Trusted_Connection=True;uid=sa;password=lapassword";
            //IEnumerable<Campionato> listaCampionati;
            //using (IDbConnection connection = new SqlConnection(connectionString))
            //{
            //    string sql = @"SELECT 
            //                      Id,
            //                   Nome,
            //                   DataInizio,
            //                   DataFine
            //               FROM Campionati";
            //    connection.Open();
            //    listaCampionati = connection.Query<Campionato>(sql);
            //}
            return View();
        }

        public IActionResult Nazioni()
        {
            
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
                  
    }
}
