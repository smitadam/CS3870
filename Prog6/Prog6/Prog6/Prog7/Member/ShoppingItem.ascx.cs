using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prog6.Prog7.Member
{
    public partial class ShoppingItem : System.Web.UI.UserControl
    {
        private string _theID, _theName;
        private double _thePrice, _theCost;
        private int _theQuantity;

        public string TheID
        {
            set
            {
                _theID = value.ToString();
            }
            get
            {
                return _theID;
            }
        }

        public string TheName
        {
            set
            {
                _theName = value.ToString();
            }
            get
            {
                return _theName;
            }
        }

        public int TheQuantity
        {
            set
            {
                _theQuantity = value;
            }
            get
            {
                return _theQuantity;
            }
        }

        public double ThePrice
        {
            set
            {
                _thePrice = value;
            }
            get
            {
                return _thePrice;
            }
        }

        public double TheCost
        {
            set
            {
                _theCost = value;
            }
            get
            {
                return _theCost;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            txtID.Text = _theID;
            txtName.Text = _theName;
            txtPrice.Text = string.Format("{0:C}", _thePrice);
            txtQuantity.Text = _theQuantity.ToString();
            txtCost.Text = string.Format("{0:C}", _theCost);
        }
    }
}