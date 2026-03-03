using System.Data;
using System.Diagnostics;
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
            string connectionString = "Server=localhost;Database=Marcatori;Trusted_Connection=True;uid=sa;password=lapassword";
            IEnumerable<Campionato> listaCampionati;
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"SELECT 
                                  Id,
                               Nome,
                               DataInizio,
                               DataFine
                           FROM Campionati";
                connection.Open();
                listaCampionati = connection.Query<Campionato>(sql);
            }
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
