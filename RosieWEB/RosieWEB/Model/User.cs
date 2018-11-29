using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RosieWEB.Model
{
    public class User
    {
        public string userName { get; set; }
        public double userCpu { get; set; }
        public int userDisk { get; set; }
        public int userMemory { get; set; }
        public string userStatus { get; set; }
    }
}