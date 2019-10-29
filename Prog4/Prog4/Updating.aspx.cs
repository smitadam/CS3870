using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prog4
{
    public partial class Shopping2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            catch(Exception Ex)
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
    }
}