using Rosie;
using System;
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
    }
}