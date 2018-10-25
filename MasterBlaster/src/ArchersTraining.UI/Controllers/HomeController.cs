using ArchersTraining.UI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;


namespace ArchersTraining.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
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

        [HttpPost]
        public ActionResult Contact(ContactViewModel contact)
        {
            string body = string.Format("Name: {0}<br/>Email: {1}<br/>Subject: {2}<br/>Message: {3}<br/>",
                contact.Name,
                contact.Email,
                contact.Subject,
                contact.Message
                );
            MailMessage msg = new MailMessage(
                "no-reply@jeffgochenour.com",
                "jeffgochenour@outlook.com",
                contact.Subject,
                body
                );

            msg.IsBodyHtml = true;
            msg.CC.Add("gochenour69@gmail.com");
            msg.Priority = MailPriority.High;

            SmtpClient client = new SmtpClient("mail.jeffgochenour.com");
            client.Credentials = new NetworkCredential("no-reply@jeffgochenour.com", "j.3745g.");

            //using (client)
            //{
            //    try
            //    {
            //        client.Send(msg);
            //    }
            //    catch (Exception ex)
            //    {

            //        ViewBag.ErrorMessage = "There was an error sending your message. Please try again.";
            //        return View();
            //    }
                return View("ContactConfirmation", contact);
            //}//end using
        }//end httppost action result
    }//end class
}//end namespace