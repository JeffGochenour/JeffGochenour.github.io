using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ArchersTraining.DATA;
using Microsoft.AspNet.Identity;//added
using ArchersTraining.Models;//added
using Microsoft.AspNet.Identity.Owin;//added
using System.Web.Security;
using System.Net.Mail;


namespace ArchersTraining.UI.Controllers
{
    public class CourseCompletionsController : Controller
    {
        private ArchersTrainingEntities db = new ArchersTrainingEntities();
        [Authorize]
        // GET: CourseCompletions
        public ActionResult Index()
        {
            var user = User.Identity.GetUserId();
            var currentUserId = User.Identity.GetUserId();
            var userManager = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var usernow = userManager.FindById(currentUserId);

            if (User.IsInRole("Archer"))
            {
                var lessonViews = db.CourseCompletions.Where(c => c.UserID == user).Include(c => c.Cours);
                return View(lessonViews.ToList());
            }
            else
            {
                var courseCompletions = db.CourseCompletions.Include(c => c.AspNetUser).Include(c => c.Cours);
                return View(courseCompletions.ToList());
            }
        }

        public ActionResult QuizUpdate(int id)
        {
            var user = User.Identity.GetUserId();
            var currentUserId = User.Identity.GetUserId();
            var userManager = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var usernow = userManager.FindById(currentUserId);

            CourseCompletion cc = new CourseCompletion();
            cc.CourseID = id;
            cc.UserID = user;
            cc.DateCompleted = DateTime.Now;

            if (User.IsInRole("Archer"))
            {
                var cvbyuser = (from x in db.CourseCompletions where x.CourseID == cc.CourseID && x.UserID == cc.UserID select x).FirstOrDefault();

                if (cvbyuser == null)
                {
                    db.CourseCompletions.Add(cc); db.SaveChanges();

                    MailMessage msg = new MailMessage(
                      "no-reply@jeffgochenour.com",
                      "jeffgochenour@outlook.com",
                      "Course Complete",
                      string.Format("{0} {1} - course completion.", usernow.FirstName, usernow.LastName));
                    msg.IsBodyHtml = true;
                    msg.Priority = MailPriority.High;
                    SmtpClient client = new SmtpClient("mail.jeffgochenour.com");
                    client.Credentials = new NetworkCredential("no-reply@jeffgochenour.com", "j.3745g.");
                    client.Send(msg);
                }

            }
            return RedirectToAction("Index");
            //return View("Index");
        }
        // GET: CourseCompletions/Details/5
        public ActionResult Details(int? id)
        {
            var user = User.Identity.GetUserId();
            var currentUserId = User.Identity.GetUserId();
            var userManager = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var usernow = userManager.FindById(currentUserId);

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CourseCompletion courseCompletion = db.CourseCompletions.Find(id);
            if (courseCompletion == null)
            {
                return HttpNotFound();
            }


            return View(courseCompletion);
        }
        [Authorize(Roles = "Admin")]
        // GET: CourseCompletions/Create
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName");
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "Name");
            return View();
        }
        [Authorize(Roles = "Admin")]
        // POST: CourseCompletions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CourseCompletionID,UserID,CourseID,DateCompleted")] CourseCompletion courseCompletion)
        {
            if (ModelState.IsValid)
            {
                db.CourseCompletions.Add(courseCompletion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName", courseCompletion.UserID);
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "Name", courseCompletion.CourseID);
            return View(courseCompletion);
        }
        [Authorize(Roles = "Admin")]
        // GET: CourseCompletions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CourseCompletion courseCompletion = db.CourseCompletions.Find(id);
            if (courseCompletion == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName", courseCompletion.UserID);
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "Name", courseCompletion.CourseID);
            return View(courseCompletion);
        }
        [Authorize(Roles = "Admin")]
        // POST: CourseCompletions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CourseCompletionID,UserID,CourseID,DateCompleted")] CourseCompletion courseCompletion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(courseCompletion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName", courseCompletion.UserID);
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "Name", courseCompletion.CourseID);
            return View(courseCompletion);
        }
        [Authorize(Roles = "Admin")]
        // GET: CourseCompletions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CourseCompletion courseCompletion = db.CourseCompletions.Find(id);
            if (courseCompletion == null)
            {
                return HttpNotFound();
            }
            return View(courseCompletion);
        }
        [Authorize(Roles = "Admin")]
        // POST: CourseCompletions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CourseCompletion courseCompletion = db.CourseCompletions.Find(id);
            db.CourseCompletions.Remove(courseCompletion);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
