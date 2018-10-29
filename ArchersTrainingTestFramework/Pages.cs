using OpenQA.Selenium;
using OpenQA.Selenium.Support.PageObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArchersTrainingTestFramework
{
    public static class Pages
    {
        public static HomePage HomePage
        {
            get
            {
                var homePage = new HomePage();
                PageFactory.InitElements(Browser.Driver, homePage);
                return homePage;
            }
        }
    }

    public class HomePage
    {
        static string Url = "http://localhost:64650/";
        public static string PageTitle = "Home Page - Archers Training";

        [FindsBy(How = How.LinkText, Using = "Login/Register")]
        private IWebElement loginLink;

        private static string LoginPageTitle = "Log in - Archers Training";

        

        public void SelectLogin(string pageName)
        {
            loginLink.Click();
            var login = Browser.Driver.FindElement(By.LinkText(pageName));
            login.Click();
        }

        public void GoTo()
        {
            Browser.GoTo(Url);
        }

        public bool IsAt()
        {
            return Browser.Title == PageTitle;
        }

        public bool IsAtLoginPage(string pageName)
        {
            return Browser.Title == LoginPageTitle;
        }

        //public bool IsLoggedIn(string pageName)
        //{
        //    return Browser.Title == PageTitle;
        //}
    }
}