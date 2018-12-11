using Rosie;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web;
using System.Security.Cryptography;
using System.Text;

namespace RosieWEB.Pages
{
    public partial class Cadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Verifica se o Usuario já existe
        [WebMethod]
        public static string SearchAdminUser(string compName, string adminName, string adminEmail, string adminPassword, string adminPassword2)
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlCommand searchAdminUser = new SqlCommand($"SELECT u.ID_Usuario, e.Nome_Empresa, u.Nome_Usuario FROM Usuario AS u INNER JOIN Empresa AS e ON u.ID_EMPRESA = e.ID_EMPRESA WHERE u.Nome_Usuario = '{adminName}' AND u.Senha_Usuario = '{adminPassword}' AND e.Nome_Empresa = '{compName}'", conn))
                {
                    SqlDataReader rd = searchAdminUser.ExecuteReader();
                    if (rd.HasRows)
                    {
                        return "Existe";
                    }
                    else
                    {
                        return RegisterCorpAdmin(compName, adminName, adminEmail, adminPassword);
                    }
                }
            }
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




        //Cadastro da Empresa e Usuario Admin Principal
        private static string RegisterCorpAdmin(string compName, string adminName, string adminEmail, string adminPassword)
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                int corpId;
                conn.Open();
                using (SqlCommand registerCorp = new SqlCommand($"INSERT INTO Empresa OUTPUT INSERTED.ID_Empresa VALUES ('{compName}', '{adminEmail}')", conn))
                {
                    corpId = (int)registerCorp.ExecuteScalar();
                }
               // String senhaCript = ComputeSha256Hash(adminPassword);
                using (SqlCommand registerAdmin = new SqlCommand($"INSERT INTO Usuario (Nome_Usuario, Email_Usuario, Senha_Usuario, Tipo_Usuario, ID_Empresa) " +
                    $"OUTPUT INSERTED.ID_USUARIO " +
                    $"VALUES ('{adminName}', '{adminEmail}', '{ComputeSha256Hash(adminPassword)}', 'Admin', {corpId})", conn)) {
                    HttpContext.Current.Session["ID_User"] = registerAdmin.ExecuteScalar();
                }
                using (SqlCommand registerPC = new SqlCommand($"INSERT INTO Computador (PC_Nome, ID_Usuario) " +
                    $"OUTPUT INSERTED.ID_PC" +
                    $"VALUES ('{adminName}', {HttpContext.Current.Session["ID_User"]})", conn))
                {
                    HttpContext.Current.Session["ID_PC"] = registerPC.ExecuteScalar();
                }
            }
            return "Sucesso";
        }
    }
}