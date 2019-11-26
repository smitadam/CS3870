using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Prog6.Data
{
    public class SQLProductClass
    {
        private const string ConStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"'J:\Web Protocols\Prog3\UWPCS3870.mdf';" + "Integrated Security=True;Connect Timeout=30";
        private static System.Data.SqlClient.SqlDataAdapter prodAdapter;
        private static System.Data.SqlClient.SqlCommand prodCmd = new System.Data.SqlClient.SqlCommand();
        private static System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection();
        public static System.Data.DataTable tblProduct = new System.Data.DataTable("Product");

        public static void setupProdAdapter()
        {
            con.ConnectionString = ConStr;
            prodCmd.Connection = con;
            prodCmd.CommandType = System.Data.CommandType.Text;
            prodCmd.CommandText = "Select * from Product order by ProductID";

            prodAdapter = new System.Data.SqlClient.SqlDataAdapter(prodCmd);

            prodAdapter.FillSchema(tblProduct, System.Data.SchemaType.Source);

        }

        public static void getAllProducts()
        {
            if (prodAdapter == null)
                setupProdAdapter();

            prodCmd.CommandText = "Select * from Product order by ProductID";

            try
            {
                if (!(tblProduct == null))
                    tblProduct.Clear();
                prodAdapter.Fill(tblProduct);
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
        public static void UpdateProduct(string theID, string newName, double newPrice, string newDesc)
        {
            prodCmd.CommandText = "Update Product " +
                                  "Set ProductName = '" + newName + "', " +
                                  "UnitPrice = " + newPrice + ", " +
                                  "Description = '" + newDesc + "' " +
                                  "Where ProductID = '" + theID + "'";

            try
            {
                con.Open();
                prodCmd.ExecuteNonQuery();
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

        public static void DeleteProduct(string ID)
        {
            prodCmd.CommandText = "Delete Product " +
                                  "Where ProductID = '" + ID + "'";

            try
            {
                con.Open();
                prodCmd.ExecuteNonQuery();
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

        public static void InsertProduct(string theID, string newName, double newPrice, string newDesc)
        {
            prodCmd.CommandText = "INSERT INTO Product(ProductID, ProductName, UnitPrice, Description) values('" + theID + "', '" +
                                  newName + "', " +
                                  newPrice + ", '" + newDesc + "')";


            try
            {
                con.Open();
                prodCmd.ExecuteNonQuery();
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