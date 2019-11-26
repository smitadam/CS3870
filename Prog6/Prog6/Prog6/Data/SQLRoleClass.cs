using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Prog6.Data
{
    public class SQLRoleClass
    {
        private const string ConStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + @"'J:\Web Protocols\Prog5\UserInfo.mdf';" + "Integrated Security=True;Connect Timeout=30";
        private static System.Data.SqlClient.SqlDataAdapter roleAdapter;
        private static System.Data.SqlClient.SqlCommand roleCmd = new System.Data.SqlClient.SqlCommand();
        private static System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection();
        public static System.Data.DataTable tblRoleData = new System.Data.DataTable("UserData");

        public static void setupRoleAdapter()
        {
            con.ConnectionString = ConStr;
            roleCmd.Connection = con;
            roleCmd.CommandType = System.Data.CommandType.Text;
            roleCmd.CommandText = "Select * from RoleInfo order by RoleName";

            roleAdapter = new System.Data.SqlClient.SqlDataAdapter(roleCmd);

            roleAdapter.FillSchema(tblRoleData, System.Data.SchemaType.Source);

        }

        public static void getRoleData()
        {
            if (roleAdapter == null)
                setupRoleAdapter();

            roleCmd.CommandText = "Select * from RoleInfo order by RoleName";

            try
            {
                if (!(tblRoleData == null))
                    tblRoleData.Clear();
                roleAdapter.Fill(tblRoleData);
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

        public static void DeleteRole(string ID)
        {
            roleCmd.CommandText = "Delete RoleInfo " +
                                  "Where RoleName = '" + ID + "'";

            try
            {
                con.Open();
                roleCmd.ExecuteNonQuery();
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

        public static void InsertRole(string name , string isRemoveable)
        {
            roleCmd.CommandText = "INSERT INTO RoleInfo(RoleName, Removeable) values('" + name + "', '" +
                                  isRemoveable + "')";


            try
            {
                con.Open();
                roleCmd.ExecuteNonQuery();
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