using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Prog5
{
    public class SQLCheckoutClass
    {
        private const string ConStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"'J:\Web Protocols\Prog5\UserInfo.mdf';" + "Integrated Security=True;Connect Timeout=30";
        private static System.Data.SqlClient.SqlDataAdapter cartAdapter;
        private static System.Data.SqlClient.SqlCommand cartCmd = new System.Data.SqlClient.SqlCommand();
        private static System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection();
        public static System.Data.DataTable tblShoppingCart = new System.Data.DataTable("ShoppingCart");

        public static void setupShoppingCartAdapter()
        {
            con.ConnectionString = ConStr;
            cartCmd.Connection = con;
            cartCmd.CommandType = System.Data.CommandType.Text;
            cartCmd.CommandText = "Select * from ShoppingCart order by ProductID";

            cartAdapter = new System.Data.SqlClient.SqlDataAdapter(cartCmd);

            cartAdapter.FillSchema(tblShoppingCart, System.Data.SchemaType.Source);

        }

        public static void getShoppingCartData()
        {
            if (cartAdapter == null)
                setupShoppingCartAdapter();

            cartCmd.CommandText = "Select * from ShoppingCart order by ProductID";

            try
            {
                if (!(tblShoppingCart == null))
                    tblShoppingCart.Clear();
                cartAdapter.Fill(tblShoppingCart);
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                con.Close();
            }
        }

        public static void DeleteShoppingCart()
        {
            cartCmd.CommandText = "Delete FROM ShoppingCart";

            try
            {
                con.Open();
                cartCmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        public static void InsertProduct(string theID, string newName, double newQuantity, string newPrice, string cost)
        {
            cartCmd.CommandText = "INSERT INTO ShoppingCart(ProductID, ProductName, Quantity, UnitPrice, Cost) values('" + theID + "', '" +
                                  newName + "', " +
                                  newQuantity + ", '" + newPrice + "', '" + cost + "')";


            try
            {
                con.Open();
                cartCmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}