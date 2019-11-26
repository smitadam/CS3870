using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prog6.Member
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Data.SQLCheckoutClass.getShoppingCartData();
            if (Application["Prog5_CurrentUser"].ToString() == "")
            {
                Response.Redirect("/Login.aspx");
            }
            else
            {
                lblLoginName.Text = Application["Prog5_CurrentUser"].ToString();
                btnLoginStatus.Text = "Logout";
            }
            txtTotal.Text = String.Format("{0:c}", Application["Prog6_CartTotal"]);
        }
        protected void btnLoginStatus_Click(object sender, EventArgs e)
        {
            Data.SQLCheckoutClass.DeleteShoppingCart();
            Response.Redirect("Login.aspx");
            Application["Prog5_CurrentUser"] = "";
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Data.SQLCheckoutClass.DeleteShoppingCart();
            Response.Redirect("Login.aspx");
            Application["Prog5_CurrentUser"] = "";
            Application["Prog6_CartTotal"] = "$0.00";
        }
    }
}