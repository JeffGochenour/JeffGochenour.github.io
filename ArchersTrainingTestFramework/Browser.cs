using OpenQA.Selenium.Chrome;
using OpenQA.Selenium;
using System;

namespace ArchersTrainingTestFramework
{
    public static class Browser
    {
        static IWebDriver webDriver = new ChromeDriver(@"c:\Libraries\");

        public static string Title
        { get { return webDriver.Title; } }

        public static ISearchContext Driver
        { get { return webDriver; } }


        public static void GoTo(string url)
        {
            webDriver.Url = url;
        }

        public static void Close()
        {
            webDriver.Close();
        }
    }
}