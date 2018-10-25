using System.Web.Optimization;

namespace ArchersTraining
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js",
                        "~/Scripts/jquery.cookie-1.4.1.min.js",
                        "~/Content/assets/plugins/jquery-migrate.min.js",
                        "~/Content/assets/corporate/scripts/back-to-top.js"
                        ));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));


            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js",
                      "~/Scripts/respond.min.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/assets/plugins/font-awesome/css/font-awesome.min.css",
                      "~/Content/assets/plugins/bootstrap/css/bootstrap.min.css",
                      "~/Content/site.css"));

            bundles.Add(new StyleBundle("~/Content/theme").Include(
                      "~/Content/assets/pages/css/components.css",
                      "~/Content/assets/pages/css/slider.css",
                      "~/Content/assets/corporate/css/style.css",
                      "~/Content/assets/corporate/css/style-responsive.css",
                      "~/Content/assets/corporate/css/themes/red.css",
                      "~/Content/assets/corporate/css/custom.css")); 
        }
    }
}
