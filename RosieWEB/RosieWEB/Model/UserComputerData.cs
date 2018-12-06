using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RosieWEB.Model
{
    public class UserComputerData
    {
        public string UserPcName { get; set; }
        public double UserCpuUsage { get; set; }
        public string UserCpuName { get; set; }
        public int UserCpuTime { get; set; }
        public int UserCpuLogical { get; set; }
        public int UserCpuPhysical { get; set; }
        public long UserDiskUsage { get; set; }
        public long UserMemoryUsage { get; set; }
        public string UserOSFamily { get; set; }
        public int UserOSBitness { get; set; }
        public int UserOSProcesses { get; set; }
        public int UserOSThreads { get; set; }
        public string UserOSVersion { get; set; }
        public string UserOSManufacturer { get; set; }
    }
}