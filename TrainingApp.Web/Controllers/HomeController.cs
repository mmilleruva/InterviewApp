using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RestSharp;
using TrainingApp.Core;
using TrainingApp.GitHubService;

namespace TrainingApp.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            using (var context = new TrainingAppContainer())
            {

                return View(context.TrainingCategories.ToList());
            }
            
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Test()
        {
            var githubService = new GitHubServiceImpl(new HttpBasicAuthenticator("mmilleruva", "fWnpzj5M"));
                var commits = githubService.GetCommits("mmilleruva", "sample_app");

                return View(commits);
        }
    }
}
