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
            Session["ID_EMPRESA"] = 1;
        }

        [WebMethod]
        public static List<string> SearchUser(string login, string senha)
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlCommand searchUser = new SqlCommand($"SELECT * FROM UserComputerData WHERE Empresa ={HttpContext.Current.Session["ID_EMPRESA"]}", conn))
                {
                    JavaScriptSerializer serialize = new JavaScriptSerializer();
                    List<string> usersList = new List<string>();
                    SqlDataReader rd = searchUser.ExecuteReader();
                    while (rd.Read())
                    {
                        User user = new User();
                        user.userName = rd.GetString(0);
                        user.userCpu = rd.GetDouble(1);
                        user.userDisk = rd.GetInt32(2);
                        user.userMemory = rd.GetInt32(3);
                        user.userStatus = rd.GetString(4);

                        usersList.Add(serialize.Serialize(user));
                        return usersList;
                    }
                }
            }
            return null;
        }
    }
}