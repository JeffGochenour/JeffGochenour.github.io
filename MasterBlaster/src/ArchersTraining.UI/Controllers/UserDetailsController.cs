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
    public class UserDetailsController : Controller
    {
        private ArchersTrainingEntities db = new ArchersTrainingEntities();
        [Authorize]
        // GET: UserDetails
        public ActionResult Index()
        {
            var user = User.Identity.GetUserId();
            var currentUserId = User.Identity.GetUserId();
            var userManager = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var usernow = userManager.FindById(currentUserId);

            if (User.IsInRole("Archer"))
            {
                var userDetails = db.UserDetails.Where(u => u.UserID == user).Include(u => u.AspNetUser);
                return View(userDetails.ToList());
            }
            else
            {
                var userDetails = db.UserDetails.Include(u => u.AspNetUser);
                return View(userDetails.ToList());
            }
        }

        // GET: UserDetails/Details/5
        [Authorize]
        public ActionResult Details(int? id)
        {

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            return View(userDetail);
        }
        [Authorize(Roles = "Admin")]
        // GET: UserDetails/Create
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName");
            return View();
        }
        [Authorize(Roles = "Admin")]
        // POST: UserDetails/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,UserID,TopImage,BackImage,FrontImage,Notes")] UserDetail userDetail, HttpPostedFileBase topimg, HttpPostedFileBase backimg, HttpPostedFileBase frontimg)
        {
            if (ModelState.IsValid)
            {
                string imageName = "NoImage.jpg";
                string imageName1 = "NoImage.jpg";
                string imageName2 = "NoImage.jpg";
                string ext = imageName.Substring(imageName.LastIndexOf('.'));
                string[] goodExts = { ".jpeg", ".jpg", ".gif", ".png" };

                if (topimg != null)
                {
                    imageName = topimg.FileName;
                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName = Guid.NewGuid() + ext;
                        topimg.SaveAs(Server.MapPath("~/Content/assets/pages/img/user/" + imageName));
                    }
                    else
                    {
                        imageName = "NoImage.jpg";
                    }
                }

                if (backimg != null)
                {
                    imageName1 = backimg.FileName;
                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName1 = Guid.NewGuid() + ext;
                        topimg.SaveAs(Server.MapPath("~/Content/assets/pages/img/user/" + imageName1));
                    }
                    else
                    {
                        imageName1 = "NoImage.jpg";
                    }
                }

                if (frontimg != null)
                {
                    imageName2 = frontimg.FileName;
                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName2 = Guid.NewGuid() + ext;
                        frontimg.SaveAs(Server.MapPath("~/Content/assets/pages/img/user/" + imageName2));
                    }
                    else
                    {
                        imageName2 = "NoImage.jpg";
                    }
                }
                userDetail.TopImage = imageName;
                userDetail.BackImage = imageName1;
                userDetail.FrontImage = imageName2;
                db.UserDetails.Add(userDetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName", userDetail.UserID);
            return View(userDetail);
        }
        [Authorize]
        // GET: UserDetails/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName", userDetail.UserID);
            return View(userDetail);
        }
        [Authorize]
        // POST: UserDetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,UserID,TopImage,BackImage,FrontImage,Notes")] UserDetail userDetail, HttpPostedFileBase topimg, HttpPostedFileBase backimg, HttpPostedFileBase frontimg)
        {
            if (ModelState.IsValid)
            {
                if (topimg != null)
                {
                    string imageName = topimg.FileName;
                    string ext = imageName.Substring(imageName.LastIndexOf('.'));//only takes .and ext
                    string[] goodExts = { ".jpeg", ".jpg", ".gif", ".png" };
                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName = Guid.NewGuid() + ext;
                        topimg.SaveAs(Server.MapPath("~/Content/assets/pages/img/user/" + imageName));
                        userDetail.TopImage = imageName;
                    }
                }

                if (backimg != null)
                {
                    string imageName1 = backimg.FileName;
                    string ext = imageName1.Substring(imageName1.LastIndexOf('.'));//only takes .and ext
                    string[] goodExts = { ".jpeg", ".jpg", ".gif", ".png" };
                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName1 = Guid.NewGuid() + ext;
                        backimg.SaveAs(Server.MapPath("~/Content/assets/pages/img/user/" + imageName1));
                        userDetail.BackImage = imageName1;
                    }
                }

                if (frontimg != null)
                {
                    string imageName2 = frontimg.FileName;
                    string ext = imageName2.Substring(imageName2.LastIndexOf('.'));//only takes .and ext
                    string[] goodExts = { ".jpeg", ".jpg", ".gif", ".png" };
                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName2 = Guid.NewGuid() + ext;
                        frontimg.SaveAs(Server.MapPath("~/Content/assets/pages/img/user/" + imageName2));
                        userDetail.FrontImage = imageName2;
                    }
                }

                db.Entry(userDetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName", userDetail.UserID);
            return View(userDetail);
        }
        [Authorize(Roles = "Admin")]
        // GET: UserDetails/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            return View(userDetail);
        }
        [Authorize(Roles = "Admin")]
        // POST: UserDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            UserDetail userDetail = db.UserDetails.Find(id);
            db.UserDetails.Remove(userDetail);
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
