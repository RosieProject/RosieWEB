using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using RosieWEB.Model;

namespace RosieWEB.Pages
{
    public partial class Table : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [WebMethod]
        public static List<string> SearchUser()
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlCommand searchUser = new SqlCommand($"SELECT Empresa, Usuario, DiskTotal, DiskUsable, MemoryTotal, MemoryUsable, CpuUsage, PC FROM UserComputerData WHERE Empresa = {HttpContext.Current.Session["compID"]}", conn))
                {
                    JavaScriptSerializer serialize = new JavaScriptSerializer();
                    List<string> usersList = new List<string>();
                    SqlDataReader rd = searchUser.ExecuteReader();
                    while (rd.Read())
                    {
                        UserStatus user = new UserStatus();
                        user.userName = rd.GetString(1);
                        user.userDisk = rd.GetInt64(2) - rd.GetInt64(3);
                        user.userMemory = rd.GetInt64(4) - rd.GetInt64(5);
                        user.userCpu = rd.GetDouble(6);
                        user.userComputer = rd.GetInt32(7);

                        usersList.Add(serialize.Serialize(user));
                    }
                    return usersList;
                }
            }
        }

        [WebMethod]
        public static string SaveComputer(int idComputer)
        {
            return (HttpContext.Current.Session["ID_PC"] = idComputer).ToString();
        }
    }
}