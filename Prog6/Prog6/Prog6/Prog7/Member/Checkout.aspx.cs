using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Prog6.Prog7.Member
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Data.SQLCheckoutClass.getShoppingCartData();
            if (Application["Prog5_CurrentUser"].ToString() == "")
            {
                Response.Redirect("../../Login.aspx");
            }
            else
            {
                lblLoginName.Text = Application["Prog5_CurrentUser"].ToString();
                btnLoginStatus.Text = "Logout";
                ShoppingItem item;
                Control theForm = this.Form;

                System.Data.DataRow row;
                double total = 0;

                for (int i = 0; i < Data.SQLCheckoutClass.tblShoppingCart.Rows.Count; i++)
                {
                    row = Data.SQLCheckoutClass.tblShoppingCart.Rows[i];
                    item = (ShoppingItem)LoadControl("ShoppingItem.ascx");
                    item.TheID = row[0].ToString();
                    item.TheName = row[1].ToString();
                    item.TheQuantity = int.Parse(row[2].ToString());
                    item.ThePrice = double.Parse(row[3].ToString());
                    item.TheCost = double.Parse(row[4].ToString());

                    total += item.TheCost;
                    theForm.Controls.Add(item);
                }
                txtTotal.Text = string.Format("{0:C}", total);
            }
            //txtTotal.Text = String.Format("{0:c}", Application["Prog6_CartTotal"]);
        }
        protected void btnLoginStatus_Click(object sender, EventArgs e)
        {
            Data.SQLCheckoutClass.DeleteShoppingCart();
            Response.Redirect("../../Login.aspx");
            Application["Prog5_CurrentUser"] = "";
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Data.SQLCheckoutClass.DeleteShoppingCart();
            txtTotal.Text = Application["Prog6_CartTotal"].ToString();
            Response.Redirect("/Default.aspx");
            Application["Prog5_CurrentUser"] = "";
            Application["Prog6_CartTotal"] = "$0.00";

        }
    }
}