using Rosie;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web;

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
                using (SqlCommand registerAdmin = new SqlCommand($"INSERT INTO Usuario (Nome_Usuario, Email_Usuario, Senha_Usuario, Tipo_Usuario, ID_Empresa) " +
                    $"OUTPUT INSERTED.ID_USUARIO " +
                    $"VALUES ('{adminName}', '{adminEmail}', '{adminPassword}', 'Admin', {corpId})", conn)) {
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