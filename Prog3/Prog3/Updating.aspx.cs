using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prog3
{
    public partial class Updating : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SQLDataClass.getAllProducts();
            this.DataBind();
            if(!IsPostBack)
                DisplayRow((int)Application["Prog3_Index"]);
        }

        private void DisplayRow(int index)
        {
            System.Data.DataRow row = SQLDataClass.tblProduct.Rows[index];

            txtID.Text = row[0].ToString();
            txtName.Text = row[1].ToString();
            txtPrice.Text = string.Format("{0:C}", row[2]);
            txtDescription.Text = row[3].ToString();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            int index = (int)Application["Prog3_Index"] + 1;
            if (index > SQLDataClass.tblProduct.Rows.Count - 1)
                index = SQLDataClass.tblProduct.Rows.Count - 1;
            Application["Prog3_Index"] = index;
            DisplayRow(index);
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            int index = (int)Application["Prog3_Index"] - 1;
            if (index < 0)
                index = 0;
            Application["Prog3_index"] = index;
            DisplayRow(index);
        }

        protected void btnFirst_Click(object sender, EventArgs e)
        {
            Application["Prog3_Index"] = 0;
            DisplayRow((int)Application["Prog3_Index"]);
        }

        protected void btnLast_Click(object sender, EventArgs e)
        {
            Application["Prog3_Index"] = SQLDataClass.tblProduct.Rows.Count - 1;
            DisplayRow((int)Application["Prog3_Index"]);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string theID = txtID.Text;
                string newName = txtName.Text;
                double newPrice = double.Parse(txtPrice.Text.Replace("$", ""));
                string newDesc = txtDescription.Text;
                SQLDataClass.UpdateProduct(theID, newName, newPrice, newDesc);
                txtMessage.Text = "Record updated.";
                SQLDataClass.getAllProducts();
            }
            catch(Exception ex)
            {
                txtMessage.Text = "Product Not Updated: " + ex.Message;
            }
        }
        protected void clearTextFields()
        {
            txtID.Text = "";
            txtDescription.Text = "";
            txtName.Text = "";
            txtPrice.Text = "";
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (btnAdd.Text == "Add")
            {
                btnDelete.Enabled = false;
                btnNext.Enabled = false;
                btnPrevious.Enabled = false;
                btnFirst.Enabled = false;
                btnLast.Enabled = false;
                btnUpdate.Enabled = false;
                btnAdd.Text = "Save";
                clearTextFields();
            }
            else
            {
                btnDelete.Enabled = true;
                btnNext.Enabled = true;
                btnPrevious.Enabled = true;
                btnFirst.Enabled = true;
                btnLast.Enabled = true;
                btnUpdate.Enabled = true;
                try
                {
                    btnAdd.Text = "Add";
                    string theID = txtID.Text;
                    string newName = txtName.Text;
                    double newPrice = double.Parse(txtPrice.Text.Replace("$", ""));
                    string newDesc = txtDescription.Text;

                    SQLDataClass.InsertProduct(theID, newName, newPrice, newDesc);
                    txtMessage.Text = "Record added.";
                    SQLDataClass.getAllProducts();
                }
                catch (Exception ex)
                {
                    txtMessage.Text = "Product Not Added: " + ex.Message;
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string theID = txtID.Text;
                SQLDataClass.DeleteProduct(theID);
                txtMessage.Text = "Record deleted.";
                SQLDataClass.getAllProducts();

                int index = (int)Application["Prog3_Index"] - 1;
                if (index < 0)
                    index = 0;
                Application["Prog3_index"] = index;
                DisplayRow(index);
            }
            catch (Exception ex)
            {
                txtMessage.Text = "Product Not Deleted: " + ex.Message;
            }
        }
    }
}