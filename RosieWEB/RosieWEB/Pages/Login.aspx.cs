using Rosie;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RosieWEB.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Trocar para Esse e Testar
        [WebMethod]
        public static bool SearchUser(string email, string senha)
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlCommand searchUser = new SqlCommand($"SELECT ID_Usuario, ID_Empresa, Email_Usuario, Senha_Usuario FROM Usuario WHERE Email_Usuario = '{email}' AND Senha_Usuario = '{senha}'", conn))
                {
                    SqlDataReader rd = searchUser.ExecuteReader();
                    if (rd.HasRows)
                    {
                        HttpContext.Current.Session["compId"] = rd.GetValue(1);
                        HttpContext.Current.Session["usrLoggedId"] = rd.GetValue(0);
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }
    }
}