using System;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

namespace ArchersTrainingTestFramework
{
    public class Driver
{
    public static IWebDriver Instance { get; internal set; }

    public static void Initialize()
    {
        Instance = new ChromeDriver(@"c:\Libraries\");
        Instance.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);
    }

}
}