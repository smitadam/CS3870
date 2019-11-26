using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace Prog6
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserInfoConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Data.SQLCheckoutClass.getShoppingCartData();
            Data.SQLCheckoutClass.DeleteShoppingCart();
            //   int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            //  if(temp == 1)
            //  {
            //      Response.Write("User already exists!");
            //    }
            //   conn.Close();

            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                //ConStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"'J:\Web Protocols\Prog3\UWPCS3870.mdf';" + "Integrated Security=True;Connect Timeout=30";
                System.Data.SqlClient.SqlDataAdapter userDataAdapter;
                System.Data.SqlClient.SqlCommand userDataCmd = new System.Data.SqlClient.SqlCommand();
                System.Data.DataTable tblUserData = new System.Data.DataTable("UserData");

                userDataCmd.Connection = conn;
                userDataCmd.CommandType = System.Data.CommandType.Text;
                userDataCmd.CommandText = "Select * from UserData order by userID";

                userDataAdapter = new System.Data.SqlClient.SqlDataAdapter(userDataCmd);

                userDataAdapter.FillSchema(tblUserData, System.Data.SchemaType.Source);
                userDataAdapter.Fill(tblUserData);

                string passwordInput = txtPassword.Text;
                string userNameInput = txtUserName.Text;

                for (int i = 0; i < tblUserData.Rows.Count; i++)
                {
                    if (userNameInput == tblUserData.Rows[i][0].ToString().Trim() && passwordInput == tblUserData.Rows[i][3].ToString().Trim())
                    {
                        Application["Prog5_CurrentUser"] = userNameInput;
                        Response.Write("Login Successful!");
                        Response.Redirect("Default.aspx");
                    }
                }

                throw new Exception();

            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "Your login attempt was not successful. Please try again.";
                lblErrorMessage.Visible = true;
            }
        }
    }
}