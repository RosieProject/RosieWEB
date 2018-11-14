using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TesteRosieEnvioDeDados
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string AtualizarCpu()
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlDataAdapter cpuQuery = new SqlDataAdapter("SELECT * FROM CpuData ORDER BY Id_Cpu DESC", conn))
                {
                    DataTable dt = new DataTable();
                    cpuQuery.Fill(dt);

                    var dado = Convert.ToString(dt.Rows[0][1]);
                    return dado;
                }
            }
        }

        [WebMethod]
        public static string AtualizarDisco()
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlDataAdapter diskQuery = new SqlDataAdapter("SELECT * FROM DiskData ORDER BY Id_Disk DESC", conn))
                {
                    DataTable dt = new DataTable();
                    diskQuery.Fill(dt);

                    return Convert.ToString(dt.Rows[0][1]);
                }
            }
            
        }

        [WebMethod]
        public static string AtualizarMemoria()
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlDataAdapter memoryQuery = new SqlDataAdapter("SELECT * FROM memoryData ORDER BY Id_Memory DESC", conn))
                {
                    DataTable dt = new DataTable();
                    memoryQuery.Fill(dt);

                    return Convert.ToString(dt.Rows[0][1]);
                }
            }
        }
    }
}