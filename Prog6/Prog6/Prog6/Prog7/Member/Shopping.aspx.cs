using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prog6.Prog7.Member
{
    public partial class Shopping : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Application["Prog5_CurrentUser"].ToString() == "")
            {
                Response.Redirect("../../Login.aspx");
            }
            else
            {
                lblLoginName.Text = Application["Prog5_CurrentUser"].ToString();
                btnLoginStatus.Text = "Logout";
            }

            Data.SQLProductClass.getAllProducts();
            Data.SQLCheckoutClass.getShoppingCartData();

            if (!IsPostBack && (bool)Application["Prog2_Computed"])
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
                txtName.ReadOnly = true;
                //SetFocus(btnReset);
                btnCompute.Text = "Clear";
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }
        }

        protected void btnCompute_Click(object sender, EventArgs e)
        {
            const int COL_1 = 0;
            const int COL_2 = 1;
            const int COL_3 = 2;
            if (btnCompute.Text == "Calculate")
            {
                for (int i = 0; i < Data.SQLProductClass.tblProduct.Rows.Count; i++)
                {
                    if (Data.SQLProductClass.tblProduct.Rows[i][COL_1].ToString() == txtID.Text)
                    {
                        Application["Prog2_ProductPrice"] = Data.SQLProductClass.tblProduct.Rows[i][COL_3];
                        Application["Prog2_ProductName"] = Data.SQLProductClass.tblProduct.Rows[i][COL_2].ToString();
                        Application["Prog2_ProductID"] = Data.SQLProductClass.tblProduct.Rows[i][COL_1].ToString();

                        txtName.Text = Data.SQLProductClass.tblProduct.Rows[i][COL_2].ToString();
                        txtID.Text = Data.SQLProductClass.tblProduct.Rows[i][COL_1].ToString();
                        txtPrice.Text = Data.SQLProductClass.tblProduct.Rows[i][COL_3].ToString();
                    }
                }

                if (txtQuantity.Text == "")
                {
                    lblQuantityError.Text = "Enter a Quantity please!";
                    lblQuantityError.Visible = true;
                }
                else if (int.Parse(txtQuantity.Text) < 0)
                {
                    lblQuantityError.Text = "Quanity must be a non-negative integer!";
                    lblQuantityError.Visible = true;
                }
                else
                {
                    lblQuantityError.Visible = false;
                    CalculateTotals();

                    Application["Prog2_ProductPrice"] = txtPrice.Text;
                    Application["Prog2_ProductQuantity"] = txtQuantity.Text;
                    Application["Prog2_ProductID"] = txtID.Text;
                    Application["Prog2_Computed"] = true;
                    lblQuantityError.Visible = false;
                    btnAddCart.Enabled = true;
                }
            }
            else
                Reset();
            
        }

        protected void Reset()
        {
            txtID.Text = "";
            txtPrice.Text = "";
            txtQuantity.Text = "";
            txtSubTotal.Text = "";
            txtTax.Text = "";
            txtGrandTotal.Text = "";
            txtName.Text = "";
            btnCompute.Text = "Calculate";

            txtName.ReadOnly = false;
            txtID.ReadOnly = false;
            txtPrice.ReadOnly = false;
            txtQuantity.ReadOnly = false;
            SetFocus(txtID);

            Application["Prog2_Computed"] = false;
            lblQuantityError.Visible = false;
        }
        protected void btnLoginStatus_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../Login.aspx");
            Application["Prog5_CurrentUser"] = "";
        }

        protected void btnAddCart_Click(object sender, EventArgs e)
        {
            btnAddCart.Enabled = false;
            Application["Prog6_CartTotal"] = Double.Parse(Application["Prog6_CartTotal"].ToString()) + Double.Parse(txtGrandTotal.Text, System.Globalization.NumberStyles.Currency);
            Data.SQLCheckoutClass.InsertProduct(txtID.Text, txtName.Text, Double.Parse(txtQuantity.Text), txtPrice.Text, txtGrandTotal.Text);
            Reset();
        }
    }
}