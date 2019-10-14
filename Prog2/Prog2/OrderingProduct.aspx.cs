using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Prog2
{
    public partial class OrderingProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack && (bool)Application["Prog2_Computed"])
            {
                txtID.Text = (string)Application["Prog2_ProductID"];
                txtQuantity.Text = (string)Application["Prog2_ProductQuantity"];
                txtPrice.Text = (string)Application["Prog2_ProductPrice"];
                CalculateTotals();
            }

            txtID.Focus();
        }

        protected void CalculateTotals()
        {
            try
            {
                Double price = Double.Parse(txtPrice.Text);
                int quantity = int.Parse(txtQuantity.Text);

                Double subTotal = price * (Double)quantity;
                Double tax = 0.055f * subTotal;
                Double grandTotal = subTotal + tax;

                txtSubTotal.Text = String.Format("{0:c}", subTotal);
                txtTax.Text = String.Format("{0:c}", tax);
                txtGrandTotal.Text = String.Format("{0:c}", grandTotal);

                txtID.ReadOnly = true;
                txtPrice.ReadOnly = true;
                txtQuantity.ReadOnly = true;
                SetFocus(btnReset);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }
        }

        protected void btnCompute_Click(object sender, EventArgs e)
        {
            CalculateTotals();

            Application["Prog2_ProductPrice"]= txtPrice.Text;
            Application["Prog2_ProductQuantity"] = txtQuantity.Text;
            Application["Prog2_ProductID"] = txtID.Text;
            Application["Prog2_Computed"] = true;

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtID.Text = "";
            txtPrice.Text = "";
            txtQuantity.Text = "";
            txtSubTotal.Text = "";
            txtTax.Text = "";
            txtGrandTotal.Text = "";

            txtID.ReadOnly = false;
            txtPrice.ReadOnly = false;
            txtQuantity.ReadOnly = false;
            SetFocus(txtID);

            Application["Prog2_Computed"] = false;

        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderingProduct.aspx");
        }
    }
}