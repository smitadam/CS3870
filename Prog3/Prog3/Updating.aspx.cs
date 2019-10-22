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
    }
}