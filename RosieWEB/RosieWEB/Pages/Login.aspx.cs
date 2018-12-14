using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;
using System.Security.Cryptography;
using System.Text;

namespace RosieWEB.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        static string ComputeSha256Hash(string rawData)
        {
            // Create a SHA256 
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array 
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convert byte array to a string 
                StringBuilder builder = new StringBuilder();

                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }

                return builder.ToString();
            }
        }

        //Trocar para Esse e Testar
        [WebMethod]
        public static bool SearchUser(string email, string senha)
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                string senhaCript = ComputeSha256Hash(senha);

                conn.Open();
                using (SqlCommand searchUser = new SqlCommand($"SELECT ID_Usuario, ID_Empresa, Nome_Usuario, Email_Usuario, Senha_Usuario FROM Usuario WHERE Email_Usuario = '{email}' AND Senha_Usuario = '{senhaCript}'", conn))
                {
                    SqlDataReader rd = searchUser.ExecuteReader();
                    if (rd.Read())
                    {
                        HttpContext.Current.Session["userID"] = rd.GetValue(0);
                        HttpContext.Current.Session["compID"] = rd.GetValue(1);
                        HttpContext.Current.Session["userName"] = rd.GetValue(2);

                        return true;
                    }
                }

                return false;
            }
        }
    }
}