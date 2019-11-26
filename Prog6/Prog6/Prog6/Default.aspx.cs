using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prog6
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
            Response.Redirect("Login.aspx");
            Application["Prog5_CurrentUser"] = "";
        }
    }
}