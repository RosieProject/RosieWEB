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
    public partial class Table : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public bool SearchUser(string login, string senha)
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlCommand searchUser = new SqlCommand($"SELECT u.ID_Usuario, e.Nome_Empresa, u.Nome_Usuario FROM Usuario AS u INNER JOIN Empresa AS e ON u.ID_EMPRESA = e.ID_EMPRESA WHERE u.Nome_Usuario = '{login}' AND u.Senha_Usuario = '{senha}'", conn))
                {
                    SqlDataReader rd = searchUser.ExecuteReader();
                    if (rd.HasRows)
                    {
                        Session["compId"] = rd.GetValue(1).ToString();
                        return true;
                    }
                }
            }
            return false;
        }
    }
}