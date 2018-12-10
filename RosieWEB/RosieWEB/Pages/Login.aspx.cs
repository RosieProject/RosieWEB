using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;

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
                using (SqlCommand searchUser = new SqlCommand($"SELECT ID_Usuario, ID_Empresa, Nome_Usuario Email_Usuario, Senha_Usuario FROM Usuario WHERE Email_Usuario = '{email}' AND Senha_Usuario = '{senha}'", conn))
                {
                    SqlDataReader rd = searchUser.ExecuteReader();
                    if (rd.Read())
                    {
                        HttpContext.Current.Session["userID"] = rd.GetValue(0);
                        HttpContext.Current.Session["compID"] = rd.GetValue(1);
                        HttpContext.Current.Session["userName"] = rd.GetValue(2);

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