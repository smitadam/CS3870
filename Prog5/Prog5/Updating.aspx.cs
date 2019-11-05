using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prog5
{
    public partial class Updating : System.Web.UI.Page
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
        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            try
            {
                txtMessage.Text = "Record Inserted.";
            }
            catch (Exception Ex)
            {
                txtMessage.Text = Ex.Message.ToString();
            }
        }

        protected void DetailsView1_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
        {
            try
            {
                txtMessage.Text = "Record Deleted.";
            }
            catch (Exception Ex)
            {
                txtMessage.Text = Ex.Message.ToString();
            }
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            try
            {
                txtMessage.Text = "Record Updated.";
            }
            catch (Exception Ex)
            {
                txtMessage.Text = Ex.Message.ToString();
            }
        }

        protected void btnLoginStatus_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
            Application["Prog5_CurrentUser"] = "";
        }
    }
}