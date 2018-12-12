using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RosieWEB.Model
{
    public class RosieDataResponse
    {
        public double CpuUsage { get; set; }
        public string CpuName { get; set; }
        public int CpuUpTime { get; set; }
        public int CpuLogicalCount { get; set; }
        public int CpuPhysicalCount { get; set; }
        public long MemoryTotal { get; set; }
        public long MemoryUsable { get; set; }
        public long DiskTotal { get; set; }
        public long DiskUsable { get; set; }
        public string OsSystem { get; set; }
        public int OsBitness { get; set; }
        public int OsProcessCount { get; set; }
        public int OsThreadCount { get; set; }
        public string OsVersion { get; set; }
        public string OsManufacturer { get; set; }
    }
}