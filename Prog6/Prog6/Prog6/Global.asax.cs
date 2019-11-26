using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Prog6
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

            //Prog3
            Application["Prog3_Index"] = 0;
            Application["Prog3_ID"] = "";

            //Prog5
            Application["Prog5_CurrentUser"] = "";
            Data.SQLProductClass.setupProdAdapter();

            //Prog6
            Application["Prog6_CartTotal"] = Double.Parse("0.00");
        }
        void Application_End(object sender, EventArgs e)
        {
            Data.SQLCheckoutClass.getShoppingCartData();
            Data.SQLCheckoutClass.DeleteShoppingCart();
        }
        void Session_End(object sender, EventArgs e)
        {
            Data.SQLCheckoutClass.getShoppingCartData();
            Data.SQLCheckoutClass.DeleteShoppingCart();
        }
    }
}