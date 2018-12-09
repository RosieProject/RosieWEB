using Rosie;
using System;
using System.Collections.Generic;
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