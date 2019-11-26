using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prog6.Admin
{
    public partial class SetRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Data.SQLUserClass.setupUserDataAdapter();
            if (Application["Prog5_CurrentUser"].ToString() == "")
            {
                Response.Redirect("/Login.aspx");
            }
            else
            {
                lblLoginName.Text = Application["Prog5_CurrentUser"].ToString();
                btnLoginStatus.Text = "Logout";
            }
            Data.SQLUserClass.getUserData();
            Data.SQLRoleClass.getRoleData();
        }
        protected void btnLoginStatus_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
            Application["Prog5_CurrentUser"] = "";
        }

        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            try
            {
                string temp_user_name = ddUsers.SelectedValue.ToString();
                Data.SQLUserClass.DeleteUser(temp_user_name.Trim());
                ddUsers.Items.RemoveAt(ddUsers.SelectedIndex);
                txtMessage.Text = "User " + temp_user_name.Trim() + " has been deleted.";
            }
            catch(Exception ex)
            {
                txtMessage.Text = ex.Message.ToString();
            }

        }

        protected void btnAddUserToRole_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddRole_Click(object sender, EventArgs e)
        {
            try
            {
                string temp_role_name = txtRole.Text.ToString();
                Data.SQLRoleClass.InsertRole(temp_role_name, "true");
                ddSelectRole.Items.Add(temp_role_name);
                txtMessage.Text = "Role " + temp_role_name.Trim() + " has been added.";
            }
            catch (Exception Ex)
            {
                txtMessage.Text = Ex.Message.ToString();
            }
        }

        protected void btnRemoveRole_Click(object sender, EventArgs e)
        {
            try
            {
                string temp_role_name = txtRole.Text.ToString();
                Data.SQLRoleClass.DeleteRole(temp_role_name);

                if(ddSelectRole.Items.Contains(ddSelectRole.Items.FindByText(temp_role_name)))
                {
                    ddSelectRole.Items.Remove(ddSelectRole.Items.FindByText(temp_role_name));
                    txtMessage.Text = "Role " + temp_role_name.Trim() + " has been removed.";
                }
                else
                {
                    Exception ex = new Exception();
                    throw ex;
                }
            }
            catch(Exception Ex)
            {
                txtMessage.Text = "The specified role was not found. Delete query aborted.";
            }
        }

        protected void btnRemoveUserFromRole_Click(object sender, EventArgs e)
        {

        }
    }
}