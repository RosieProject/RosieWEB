using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RosieWEB.Model
{
    public class RosieDataResponse
    {
        public double cpuUsage { get; set; }
        public string cpuName { get; set; }
        public int cpuUpTime { get; set; }
        public int cpuLogicalCount { get; set; }
        public int cpuPhysicalCount { get; set; }
        public long memoryTotal { get; set; }
        public long memoryUsable { get; set; }
        public long diskTotal { get; set; }
        public long diskUsable { get; set; }
        public string osSystem { get; set; }
        public int osBitness { get; set; }
        public int osProcessCount { get; set; }
        public int osThreadCount { get; set; }
        public string osVersion { get; set; }
        public string osManufacturer { get; set; }
    }
}