using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;

namespace RosieWEB.Pages
{
    public partial class UserRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["compId"] = 1; //APAGAR ISSO
        }

        //Cadastro do Usuario da Empresa
        [WebMethod]
        public static bool RegisterUser(string userName, string userPassword, string userEmail, string userType)
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlCommand registerUser = new SqlCommand($"INSERT INTO Usuario VALUES ({HttpContext.Current.Session["compId"]}, '{userName}', '{userEmail}', '{userType}', '{userPassword}')", conn))
                {
                    SqlDataReader rd = registerUser.ExecuteReader();
                    if (rd.RecordsAffected > 0)
                    {
                        return true;
                    }
                }
            }
            return false;
        }
    }
}