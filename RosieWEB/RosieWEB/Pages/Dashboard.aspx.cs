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
        [WebMethod]
        public static List<string> GetRosieData()
        {
            List<string> datas = new List<string>();
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlCommand cpuFirstDatasQuery = new SqlCommand($"SELECT TOP 1 CpuUsage, CpuName, CpuTime, CpuLogical, CpuPhysical, DiskTotal, DiskUsable, MemoryTotal, MemoryUsable, OSFamily, OSBitness, OSProcesses, OSThreads, OSVersion, OSManufacturer FROM ComputerData WHERE Computer = {HttpContext.Current.Session["ID_PC"]}", conn))
                {
                    JavaScriptSerializer serialize = new JavaScriptSerializer();
                    RosieDataResponse dataResponse = new RosieDataResponse();
                    SqlDataReader rd = cpuFirstDatasQuery.ExecuteReader();
                    if (rd.Read())
                    {
                        dataResponse.CpuUsage = rd.GetDouble(0);
                        dataResponse.CpuName = rd.GetString(1);
                        dataResponse.CpuUpTime = rd.GetInt32(2);
                        dataResponse.CpuLogicalCount = rd.GetInt32(3);
                        dataResponse.CpuPhysicalCount = rd.GetInt32(4);
                        dataResponse.DiskTotal = rd.GetInt64(5);
                        dataResponse.DiskUsable = rd.GetInt64(6);
                        dataResponse.MemoryTotal = rd.GetInt64(7);
                        dataResponse.MemoryUsable = rd.GetInt64(8);
                        dataResponse.OsSystem = rd.GetString(9);
                        dataResponse.OsBitness = rd.GetInt32(10);
                        dataResponse.OsProcessCount = rd.GetInt32(11);
                        dataResponse.OsThreadCount = rd.GetInt32(12);
                        dataResponse.OsVersion = rd.GetString(13);
                        dataResponse.OsManufacturer = rd.GetString(14);
                    }

                    datas.Add(serialize.Serialize(dataResponse));

                    return datas;
                }
            }
        }
    }
}
