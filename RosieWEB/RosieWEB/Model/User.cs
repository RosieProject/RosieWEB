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
        public long userDisk { get; set; }
        public long userMemory { get; set; }
    }
}