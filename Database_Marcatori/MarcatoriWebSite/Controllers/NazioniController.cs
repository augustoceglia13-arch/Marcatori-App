namespace MarcatoriWebSite.Controllers;

using MarcatoriWebSite.Models;
using Microsoft.AspNetCore.Mvc;

    public class NazioniController : Controller
    {
        public IActionResult Index()
        {
            var nazioni = new List<Nazione>
            {
                new Nazione { Nome = "Italia", CountryCode = "it" },
                new Nazione { Nome = "Francia", CountryCode = "fr" },
                new Nazione { Nome = "Germania", CountryCode = "de" },
                new Nazione { Nome = "Spagna", CountryCode = "es" },
                new Nazione { Nome = "Inghilterra", CountryCode = "gb" },
                new Nazione { Nome = "Albania", CountryCode = "al" },
                new Nazione { Nome = "Austria", CountryCode = "at" },
                new Nazione { Nome = "Belgio", CountryCode = "be" },
                new Nazione { Nome = "Bulgaria", CountryCode = "bg" },
                new Nazione { Nome = "Croazia", CountryCode = "hr" },
                new Nazione { Nome = "Danimarca", CountryCode = "dk" },
                new Nazione { Nome = "Grecia", CountryCode = "gr" },
                new Nazione { Nome = "Norvegia", CountryCode = "no" },
                new Nazione { Nome = "Paesi Bassi", CountryCode = "nl" },
                new Nazione { Nome = "Portogallo", CountryCode = "pt" },
                new Nazione { Nome = "Repubblica Ceca", CountryCode = "cz" },
                new Nazione { Nome = "Romania", CountryCode = "ro" },
                new Nazione { Nome = "Scozia", CountryCode = "gb" },
                new Nazione { Nome = "Serbia", CountryCode = "rs" },
                new Nazione { Nome = "Svezia", CountryCode = "se" },
                new Nazione { Nome = "Svizzera", CountryCode = "ch" },
                new Nazione { Nome = "Turchia", CountryCode = "tr" },
                new Nazione { Nome = "Ucraina", CountryCode = "ua" },
                new Nazione { Nome = "Ungheria", CountryCode = "hu" }
            };

            return View(nazioni);
        }
    }
