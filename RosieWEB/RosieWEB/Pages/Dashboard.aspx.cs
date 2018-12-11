using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using RosieWEB.Model;

namespace RosieWEB
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ID_PC"] = 2;
        }

        [WebMethod]
        public static double AtualizarCpu()
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();
            
            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlCommand cpuOneQuery = new SqlCommand("SELECT TOP 1 Usage_Cpu FROM CpuData ORDER BY ID_cpu DESC", conn))
                {
                    return (double)cpuOneQuery.ExecuteScalar();
                }
            }
        }

        [WebMethod]
        public static List<string> FirstChartDatas()
        {
            List<string> firstDatas = new List<string>();
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlCommand cpuFirstDatasQuery = new SqlCommand($"SELECT TOP 10 Usage_Cpu FROM CpuData WHERE ID_PC = {HttpContext.Current.Session["ID_PC"]} ORDER BY ID_Cpu ASC", conn))
                {
                    JavaScriptSerializer serialize = new JavaScriptSerializer();
                    CpuChart cpuChart = new CpuChart();
                    SqlDataReader rd = cpuFirstDatasQuery.ExecuteReader();
                    while (rd.Read())
                    {
                        cpuChart.CpuDatas.Add(rd.GetDouble(0));
                    }

                    firstDatas.Add(serialize.Serialize(cpuChart));

                    return firstDatas;
                }
            }
        }
    }
}