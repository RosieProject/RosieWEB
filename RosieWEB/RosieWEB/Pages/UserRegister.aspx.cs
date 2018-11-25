using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;

namespace RosieWEB.Pages
{
    public partial class UserRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static bool CadastrarUsuario()
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlCommand cpuTenQuery = new SqlCommand("SELECT TOP 10 Usage_Cpu FROM CpuData ORDER BY ID_cpu DESC", conn))
                {
                    List<double> data = new List<double>();
                    SqlDataReader rd = cpuTenQuery.ExecuteReader();
                    while (rd.Read())
                    {
                        data.Add((double)rd.GetValue(0));
                    }
                }
            }
            return true;
        }
    }
}