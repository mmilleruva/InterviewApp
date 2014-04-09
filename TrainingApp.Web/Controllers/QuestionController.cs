using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TrainingApp.Core;

namespace TrainingApp.Web.Controllers
{
    public class QuestionController : Controller
    {
        //
        // GET: /Question/
        TrainingAppContainer context;

        public QuestionController(TrainingAppContainer containter)
        {
            this.context = containter;
        }

        public ActionResult Index(string category)
        {
            if (category !=null)
            {
                return View(context.Questions
                .Where(q => q.TrainingCategory.Category == category)
                .ToList());
            }
                return View(context.Questions.ToList());
        }

    }
}
