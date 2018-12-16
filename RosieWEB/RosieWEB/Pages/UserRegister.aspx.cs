using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services;

namespace RosieWEB.Pages
{
    public partial class UserRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null || Session["userID"].Equals(""))
            {
                Response.Redirect("Login.aspx");
            }
        }

        //Cadastro do Usuario da Empresa
        [WebMethod]
        public static bool RegisterUser(string userName, string userPassword, string userEmail, string userType)
        {
            string strConn = ConfigurationManager.ConnectionStrings["connectRosie"].ToString();
            int userId = 0;
            int userPC = 0;

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlCommand registerUser = new SqlCommand($"INSERT INTO Usuario (Nome_Usuario, Email_Usuario, Senha_Usuario, Tipo_Usuario, ID_Empresa) " +
                    $"OUTPUT INSERTED.ID_USUARIO " +
                    $"VALUES ('{userName}', '{userEmail}', '{ComputeSha256Hash(userPassword)}', 'Normal', {HttpContext.Current.Session["compID"]})", conn))
                {
                    userId = (int)registerUser.ExecuteScalar();
                }
                using (SqlCommand registerPC = new SqlCommand($"INSERT INTO Computador (PC_Nome, ID_Usuario) " +
                    $"OUTPUT INSERTED.ID_PC VALUES ('{userName}', {userId})", conn))
                {
                    userPC = (int)registerPC.ExecuteScalar();
                }
                using (SqlCommand registerFirstData = new SqlCommand($"BEGIN TRANSACTION INSERT INTO CpuData (ID_PC, Usage_Cpu, Name_Cpu, UpTime_Cpu, LogicalProcessor_Cpu, PhysicalProcessor_Cpu) VALUES ({userPC}, DEFAULT, 'null', DEFAULT, DEFAULT, DEFAULT) INSERT INTO DiskData (ID_PC, Usable_Disk, Total_Disk) VALUES ({userPC}, DEFAULT, DEFAULT) INSERT INTO MemoryData (ID_PC, Usable_Memory, Total_Memory) VALUES ({userPC}, DEFAULT, DEFAULT) INSERT INTO OSData (ID_PC, OS_Family, Bitness_OS, ProcessCount_OS, ThreadCount_OS, Version_OS, Manufacturer_OS) VALUES ({userPC}, 'null', DEFAULT, DEFAULT, DEFAULT, 'null', 'null') COMMIT", conn))
                {
                    registerFirstData.ExecuteNonQuery();
                }
            }
            return false;
        }

        [WebMethod]
        public static bool CheckAdmin()
        {
            if (HttpContext.Current.Session["userType"].Equals("Admin"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private static string ComputeSha256Hash(string rawData)
        {
            // Create a SHA256 
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array 
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convert byte array to a string 
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }

                return builder.ToString();
            }
        }
    }
}