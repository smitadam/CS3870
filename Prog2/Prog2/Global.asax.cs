using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Prog2
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            //Prog2
            Application["Prog2_ProductID"] = "";
            Application["Prog2_ProductPrice"] = "";
            Application["Prog2_ProductQuantity"] = "";
            Application["Prog2_Computed"] = false;
        }
    }
}