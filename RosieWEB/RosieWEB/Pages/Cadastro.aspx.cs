using Rosie;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;

namespace RosieWEB.Pages
{
    public partial class Cadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCadastro_Click(object sender, EventArgs e)
        {
            Usuario.Criar(TxtEmail.Text, TxtNome.Text, TxtSenha.Text);
            Usuario.Validar();

        }
        [WebMethod]
        public static void Iniciar(string userId, string userName, string userEmail)
        {
            SqlConnection conexao = new SqlConnection("Server=tcp:luizcarlos.database.windows.net,1433;Initial Catalog=Meu_Primeiro_banco_de_dados;Persist Security Info=False;User ID=luizca95;Password=Monforte1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");


            using (conexao)
            {
                conexao.Open();
                SqlCommand comando = conexao.CreateCommand();
                comando.CommandText = $"insert into google (userID, userName, userEmail) values ('{userId}', '{userName}','{userEmail}')";



                comando.ExecuteNonQuery();

            }
        }

        //Trocar para Esse e Testar
        //Verifica se o Usuario já existe
        [WebMethod]
        public bool SearchAdminUser(string compName, string compEmail, string adminName, string adminEmail, string adminPassword)
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
                        //Mostrar Mensagem de Usuário já existente.
                    }
                    else
                    {
                        RegisterCorpAdmin(compName, compEmail, adminName, adminEmail, adminPassword);
                        return true;
                    }
                }
            }
            return false;
        }

        //Trocar para Esse e Testar
        //Cadastro da Empresa e Usuario Admin Principal
        [WebMethod]
        private bool RegisterCorpAdmin(string compName, string compEmail, string adminName, string adminEmail, string adminPassword)
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                string corpId;
                conn.Open();
                using (SqlCommand registerCorp = new SqlCommand($"INSERT INTO Empresa VALUES ('{compName}', '{compEmail}')", conn))
                {
                    corpId = registerCorp.ExecuteScalar().ToString();
                }

                using (SqlCommand registerAdmin = new SqlCommand($"INSERT INTO Usuario VALUES ({corpId}, '{adminName}', '{adminEmail}', 'Admin', '{adminPassword}')", conn))
                {
                    Response.Redirect("Login.aspx");
                }
            }
            return false;
        }
    }
}