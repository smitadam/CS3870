using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prog5
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SQLCheckoutClass.getShoppingCartData();
            if (Application["Prog5_CurrentUser"].ToString() == "")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblLoginName.Text = Application["Prog5_CurrentUser"].ToString();
                btnLoginStatus.Text = "Logout";
            }
        }

        protected void btnLoginStatus_Click(object sender, EventArgs e)
        {
            SQLCheckoutClass.DeleteShoppingCart();
            Response.Redirect("Login.aspx");
            Application["Prog5_CurrentUser"] = "";
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            SQLCheckoutClass.DeleteShoppingCart();
            Response.Redirect("Login.aspx");
            Application["Prog5_CurrentUser"] = "";
        }
    }
}