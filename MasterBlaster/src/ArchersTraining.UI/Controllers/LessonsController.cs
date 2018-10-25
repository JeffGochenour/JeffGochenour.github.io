using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ArchersTraining.DATA;//added
using Microsoft.AspNet.Identity;//added
using ArchersTraining.Models;//added
using Microsoft.AspNet.Identity.Owin;//added
using System.Web.Security;
using System.Net.Mail;

namespace ArchersTraining.UI.Controllers
{

    public class LessonsController : Controller
    {


        private ArchersTrainingEntities db = new ArchersTrainingEntities();

        [Authorize(Roles = "Admin, Coach")]
        // GET: Lessons
        public ActionResult Index()
        {
            var lessons = db.Lessons.Include(l => l.Cours);
            return View(lessons.ToList());
        }
        [Authorize]
        // Get: lessons by course
        public ActionResult LessonbyCourse(int? id)
        {

            var lessons = db.Lessons.Where(l => l.CourseID == id && l.IsActive == true);
            return View(lessons.ToList());
        }
        [Authorize]
        // GET: Lessons/Details/5
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
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }

            LessonView lv = new LessonView();
            lv.LessonID = lesson.LessonID;
            lv.UserID = user;
            lv.DateViewed = DateTime.Now;


            if (User.IsInRole("Archer"))
            {
                var lvbyuser = (from x in db.LessonViews where x.LessonID == lv.LessonID && x.UserID == lv.UserID select x).FirstOrDefault();

                if (lvbyuser == null)
                {
                    db.LessonViews.Add(lv); db.SaveChanges();
                }
                //    var lescompincrse = from l in db.Lessons join LV in db.LessonViews on l.LessonID equals LV.LessonID where l.CourseID == lesson.CourseID && LV.UserID == lv.UserID select l;

                //    var lesactincrse = from la in db.Lessons where la.CourseID == lesson.CourseID && la.IsActive == true select la;

                //    CourseCompletion cisc = new CourseCompletion();
                //    cisc.DateCompleted = DateTime.Now;
                //    cisc.UserID = user;
                //    cisc.CourseID = lesson.CourseID;

                //    var comCrse = from lc in db.Courses where lc.CourseID == lesson.CourseID select lc;


                //    if (lescompincrse.Count() == lesactincrse.Count())
                //    {
                //        db.CourseCompletions.Add(cisc);
                //        db.SaveChanges();


                //        MailMessage msg = new MailMessage(
                //       "no-reply@jeffgochenour.com",
                //       "jeffgochenour@outlook.com",
                //       "Course Complete",
                //       string.Format("{0} {1} - course completion.", usernow.FirstName, usernow.LastName));
                //        msg.IsBodyHtml = true;
                //        msg.Priority = MailPriority.High;
                //        SmtpClient client = new SmtpClient("mail.jeffgochenour.com");
                //        client.Credentials = new NetworkCredential("no-reply@jeffgochenour.com", "j.3745g.");
                //        client.Send(msg);
                //    }
                //}
            }

            return View(lesson);
        }

        #region Quizzes

        public ActionResult Beginnings()
        {

            return View();
        }

        public ActionResult Execution()
        {

            return View();
        }

        public ActionResult Fitness()
        {

            return View();
        }

        public ActionResult Mental()
        {

            return View();
        }

        public ActionResult Practice()
        {

            return View();
        }

        public ActionResult Tuning()
        {

            return View();
        }

        public ActionResult Results()
        {

            return View();
        }
        #endregion

        [Authorize(Roles = "Admin")]
        // GET: Lessons/Create
        public ActionResult Create()
        {
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "Name");
            return View();
        }
        [Authorize(Roles = "Admin")]
        // POST: Lessons/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LessonID,LessonName,CourseID,Introduction,VideoUrl,PdfFileName,IsActive")] Lesson lesson, HttpPostedFileBase pdfUpload)
        {
            if (ModelState.IsValid)
            {
                lesson.IsActive = true;
                string pdfname = "No.pdf";
                if (pdfUpload != null)
                {
                    pdfname = pdfUpload.FileName;
                    string ext = pdfname.Substring(pdfname.LastIndexOf('.'));
                    string[] allowedexts = { ".pdf" };

                    if (allowedexts.Contains(ext.ToLower()))
                    {
                        pdfname = Guid.NewGuid() + ext;
                        pdfUpload.SaveAs(Server.MapPath("~/Content/LessonPdf/" + pdfname));
                    }
                    else
                    {
                        pdfname = "No.pdf";
                    }
                }
                lesson.PdfFileName = pdfname;

                db.Lessons.Add(lesson);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "Name", lesson.CourseID);
            return View(lesson);
        }

        // GET: Lessons/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "Name", lesson.CourseID);
            return View(lesson);
        }

        // POST: Lessons/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LessonID,LessonName,CourseID,Introduction,VideoUrl,PdfFileName,IsActive")] Lesson lesson)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lesson).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "Name", lesson.CourseID);
            return View(lesson);
        }
        [Authorize(Roles = "Admin, Coach")]
        // GET: Lessons/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            return View(lesson);
        }
        [Authorize(Roles = "Admin, Coach")]
        // POST: Lessons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Lesson lesson = db.Lessons.Find(id);
            db.Lessons.Remove(lesson);
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
