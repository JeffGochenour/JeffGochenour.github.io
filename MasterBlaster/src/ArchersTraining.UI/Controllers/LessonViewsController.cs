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
    public class LessonViewsController : Controller
    {
        private ArchersTrainingEntities db = new ArchersTrainingEntities();
        [Authorize]
        // GET: LessonViews
        public ActionResult Index()
        {
            var user = User.Identity.GetUserId();
            var currentUserId = User.Identity.GetUserId();
            var userManager = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var usernow = userManager.FindById(currentUserId);

            if (User.IsInRole("Archer"))
            {
                var lessonViews = db.LessonViews.Where(l => l.UserID == user).Include(l => l.Lesson);
                return View(lessonViews.ToList());
            }
            else
            {
                var lessonViews = db.LessonViews.Include(l => l.AspNetUser).Include(l => l.Lesson);
                return View(lessonViews.ToList());
            }
        }
        [Authorize(Roles = "Admin, Coach")]
        // GET: LessonViews/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LessonView lessonView = db.LessonViews.Find(id);
            if (lessonView == null)
            {
                return HttpNotFound();
            }
            return View(lessonView);
        }
        [Authorize(Roles = "Admin")]
        // GET: LessonViews/Create
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName");
            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonName");
            return View();
        }
        [Authorize(Roles = "Admin")]
        // POST: LessonViews/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LessonViewID,UserID,LessonID,DateViewed")] LessonView lessonView)
        {
            if (ModelState.IsValid)
            {
                db.LessonViews.Add(lessonView);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName", lessonView.UserID);
            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonName", lessonView.LessonID);
            return View(lessonView);
        }
        [Authorize(Roles = "Admin")]
        // GET: LessonViews/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LessonView lessonView = db.LessonViews.Find(id);
            if (lessonView == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName", lessonView.UserID);
            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonName", lessonView.LessonID);
            return View(lessonView);
        }
        [Authorize(Roles = "Admin")]
        // POST: LessonViews/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LessonViewID,UserID,LessonID,DateViewed")] LessonView lessonView)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lessonView).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName", lessonView.UserID);
            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonName", lessonView.LessonID);
            return View(lessonView);
        }
        [Authorize(Roles = "Admin")]
        // GET: LessonViews/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LessonView lessonView = db.LessonViews.Find(id);
            if (lessonView == null)
            {
                return HttpNotFound();
            }
            return View(lessonView);
        }
        [Authorize(Roles = "Admin")]
        // POST: LessonViews/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LessonView lessonView = db.LessonViews.Find(id);
            db.LessonViews.Remove(lessonView);
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
