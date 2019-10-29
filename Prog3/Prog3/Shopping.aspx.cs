using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prog3
{
    public partial class Shopping : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SQLDataClass.getAllProducts();
            this.DataBind();

            //txtID.Text = (string)Application["Prog2_ProductID"];
            //txtQuantity.Text = (string)Application["Prog2_ProductQuantity"];
            //txtPrice.Text = Application["Prog2_ProductPrice"].ToString();
           
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
            const int COL_1 = 0;
            const int COL_2 = 1;
            const int COL_3 = 2;

   
            for (int i = 0; i < SQLDataClass.tblProduct.Rows.Count; i++)
            {
                if (SQLDataClass.tblProduct.Rows[i][COL_1].ToString() == txtID.Text)
                {
                    Application["Prog2_ProductPrice"] = SQLDataClass.tblProduct.Rows[i][COL_3];
                    Application["Prog2_ProductName"] = SQLDataClass.tblProduct.Rows[i][COL_2].ToString();
                    Application["Prog2_ProductID"] = SQLDataClass.tblProduct.Rows[i][COL_1].ToString();

                    txtName.Text = SQLDataClass.tblProduct.Rows[i][COL_2].ToString();
                    txtID.Text = SQLDataClass.tblProduct.Rows[i][COL_1].ToString();
                    txtPrice.Text = string.Format("{0:C}", SQLDataClass.tblProduct.Rows[i][COL_3].ToString());
                }
            }


            if(txtQuantity.Text == "")
            {
                lblQuantityError.Text = "Enter a Quantity please!";
                lblQuantityError.Visible = true;
            }
            else if(int.Parse(txtQuantity.Text) < 0)
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
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtID.Text = "";
            txtPrice.Text = "";
            txtQuantity.Text = "";
            txtSubTotal.Text = "";
            txtTax.Text = "";
            txtGrandTotal.Text = "";
            txtName.Text = "";

            txtID.ReadOnly = false;
            txtPrice.ReadOnly = false;
            txtQuantity.ReadOnly = false;
            SetFocus(txtID);

            Application["Prog2_Computed"] = false;

            lblQuantityError.Visible = false;
        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {
            //not needed
        }
        private void DisplayRow(int index)
        {
            System.Data.DataRow row = SQLDataClass.tblProduct.Rows[(int)Application["Prog3_Index"]];

            txtID.Text = row[0].ToString();
            txtName.Text = row[1].ToString();
            txtPrice.Text = string.Format("{0:C}", row[2]);
        }

        protected void txtID_TextChanged(object sender, EventArgs e)
        {
            //NOT USED
        }
    }
}