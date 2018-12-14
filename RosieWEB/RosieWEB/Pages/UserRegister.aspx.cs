using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services;

namespace RosieWEB.Pages
{
    public partial class UserRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null || Session["userID"].Equals(""))
            {
                Response.Redirect("Login.aspx");
            }
        }

        //Cadastro do Usuario da Empresa
        [WebMethod]
        public static bool RegisterUser(string userName, string userPassword, string userEmail, string userType)
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();
            int userId = 0;

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlCommand registerUser = new SqlCommand($"INSERT INTO Usuario (Nome_Usuario, Email_Usuario, Senha_Usuario, Tipo_Usuario, ID_Empresa) " +
                    $"OUTPUT INSERTED.ID_USUARIO " +
                    $"VALUES ('{userName}', '{userEmail}', '{ComputeSha256Hash(userPassword)}', 'Normal', {HttpContext.Current.Session["compID"]})", conn))
                {
                    userId = (int)registerUser.ExecuteScalar();
                }
                using (SqlCommand registerPC = new SqlCommand($"INSERT INTO Computador (PC_Nome, ID_Usuario) " +
                    $"VALUES ('{userName}', {userId})", conn))
                {
                    registerPC.ExecuteNonQuery();
                }
            }
            return false;
        }

        private static string ComputeSha256Hash(string rawData)
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
    }
}