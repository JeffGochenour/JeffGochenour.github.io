using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OpenQA.Selenium;


namespace ArchersTrainingTestFramework
{
    public static class LoginPage
    {
        private static string homePage = "Home Page - Archers Training";

        public static bool IsLoggedIn(string pageName)
        {
            return Browser.Title == homePage;
        }
        //IWebElement cheese = driver.FindElement(By.LinkText("admin@jg.com"));
        //assert browser.page_source.find("admin@jg.com");
        //IWebElement element = driver.findElement(By.id("elementID"));
        //element.Text;

        //string userName;

        //public static bool IsLoggedIn(string userName) {
        //    IWebElement loggedUserName = Driver.FindElement(By.Id(userName)); }

        public static void GoTo()
        {
            Driver.Instance.Navigate().GoToUrl("http://localhost:64650/Account/Login");
        }

        public static LoginCommand LoginAs(string userName)
        {
            return new LoginCommand(userName);
        }

        public class LoginCommand
        {
            private string password;
            private string userName;


            public LoginCommand(string userName)
            {
                this.userName = userName;

            }

            public LoginCommand WithPassword(string password)
            {
                this.password = password;
                return this;
            }

            public void Login()
            {
                var emailInput = Driver.Instance.FindElement(By.Id("Email"));
                emailInput.SendKeys(userName);

                var passwordInput = Driver.Instance.FindElement(By.Id("Password"));
                passwordInput.SendKeys(password);

                var loginButton = Driver.Instance.FindElement(By.XPath("//form/div/div/div[1]/div/div[4]/div/button"));
                loginButton.Click();

            }
        }
    }
}
