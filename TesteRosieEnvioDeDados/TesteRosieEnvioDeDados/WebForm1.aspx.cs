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
        public static List<double> AtualizarCpuFirst()
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

                    return data;
                }
            }
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
        public static List<long> AtualizarDiskFirst()
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlCommand diskTenQuery = new SqlCommand("SELECT TOP 10 Usage_Disk FROM DiskData ORDER BY Id_Disk DESC", conn))
                {
                    List<long> data = new List<long>();
                    SqlDataReader rd = diskTenQuery.ExecuteReader();
                    while (rd.Read())
                    {
                        data.Add((long)rd.GetValue(0));
                    }

                    return data;
                }
            }
        }

        [WebMethod]
        public static long AtualizarDisk()
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlCommand diskOneQuery = new SqlCommand("SELECT TOP 1 Usage_Disk FROM DiskData ORDER BY Id_Disk DESC", conn))
                {
                    return (long)diskOneQuery.ExecuteScalar();
                }
            }
        }

        [WebMethod]
        public static List<long> AtualizarMemoryFirst()
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlCommand memoryTenQuery = new SqlCommand("SELECT TOP 10 Usage_Memoria FROM MemoryData ORDER BY Id_Memory DESC", conn))
                {
                    List<long> data = new List<long>();
                    SqlDataReader rd = memoryTenQuery.ExecuteReader();
                    while (rd.Read())
                    {
                        data.Add((long)rd.GetValue(0));
                    }

                    return data;
                }
            }
        }

        [WebMethod]
        public static long AtualizarMemory()
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlCommand memoryOneQuery = new SqlCommand("SELECT TOP 1 Usage_Memoria FROM MemoryData ORDER BY Id_Memory DESC", conn))
                {
                    return (long)memoryOneQuery.ExecuteScalar();
                }
            }
        }
    }
}