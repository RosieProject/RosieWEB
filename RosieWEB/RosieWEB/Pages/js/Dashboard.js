(function (doc, win) {


    /*-------------------------------CHART COMPONENTS------------------------------*/
    const $ctxCpuLineChart = doc.querySelector('[data-chart="cpuLineChart"]').getContext('2d')
    const $ctxMemoryDogChart = doc.querySelector('[data-chart="memoryDogChart"]').getContext('2d')
    const $ctxDiskDogChart = doc.querySelector('[data-chart="diskDogChart"]').getContext('2d')

    /*-----------------------------------CHARTS---------------------------------*/
    const cpuLineChartDesign = {
        type: 'line',
        data: {
            labels: [],
            datasets: [{
                label: 'CpuUsage',
                backgroundColor: 'rgba(221, 66, 76, 30%)',
                borderColor: 'rgb(40, 40, 40)',
                data: []
            }]
        },
        options: {
            animation: {
                duration: 500
            },
            legend: {
                onClick: function () { return }
            },
            scales: {
                yAxes: [{
                    ticks: {
                        callback: function (value, index, values) {
                            return `${value}%`
                        }
                    }
                }]
            },
            maintainAspectRatio: false
        }
    }
    var cpuChart = new Chart($ctxCpuLineChart, cpuLineChartDesign)

    const memoryDogChartDesign = {
        type: 'doughnut',
        data: {
            labels: ['Total', 'Usado', 'Disponivel'],
            datasets: [{
                data: [20, 30],
                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850"]
            }]
        },
        options: {
            maintainAspectRatio: false
        }
    }
    var memoryChart = new Chart($ctxMemoryDogChart, memoryDogChartDesign)

    const diskDogChartDesign = {
        type: 'doughnut',
        data: {
            labels: ['Total', 'Usado', 'Disponivel'],
            datasets: [{
                data: [20, 30],
                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850"]
            }]
        },
        options: {
            maintainAspectRatio: false
        }
    }
    var diskChart = new Chart($ctxDiskDogChart, diskDogChartDesign)
    
    /*---------------------------CHARTS FIRST POPULATE LOGIC---------------------------*/
    const FirstChartDatas = () => {
        PageMethods.FirstChartDatas(FirstChartDatasResponse)
    }

    const FirstChartDatasResponse = (response) => {
        /*JSON.parse(response[0]).CpuDatas.forEach(function (data) {
            cpuChart.data.labels.push(y++)
            cpuChart.data.datasets[0].data.push(data)
        })*/
        cpuChart.update()
    }

    const FirstChartDatasError = (error) => {
        alert('Houve um erro na requisição' + error)
    }

    /*----------------------------------DATA QUERY LOGIC--------------------------------*/
    const $lblOSFamily = doc.querySelector('[data-os-labels="osFamily"]')
    const $lblOSBitness = doc.querySelector('[data-os-labels="osBitness"]')
    const $lblOSProcesses = doc.querySelector('[data-os-labels="osProcesses"]')
    const $lblOSThreads = doc.querySelector('[data-os-labels="osThreads"]')
    const $lblOSVersion = doc.querySelector('[data-os-labels="osVersion"]')
    const $lblOSManufacturer = doc.querySelector('[data-os-labels="osManufacturer"]')

    const $lblCPUName = doc.querySelector('[data-cpu-labels="cpuName"]')
    const $lblCPUUpTime = doc.querySelector('[data-cpu-labels="cpuUpTime"]')
    const $lblCPULogical = doc.querySelector('[data-cpu-labels="cpuLogical"]')
    const $lblCPUPhysical = doc.querySelector('[data-cpu-labels="cpuPhysical"]')

    const $lblCpuUsage = doc.querySelector('[data-dados="cpuUnique"]')
    const $lblDiskUsage = doc.querySelector('[data-dados="diskUnique"]')
    const $lblMemoryUsage = doc.querySelector('[data-dados="memoryUnique"]')

    const RosieDataQuery = () => {
        PageMethods.GetRosieData(RosieDataResponse)
    }

    const RosieDataResponse = (response) => {
        const rosieData = JSON.parse(response[0])

        $lblOSFamily.innerHTML = rosieData.OsSystem
        $lblOSBitness.innerHTML = rosieData.OsBitness
        $lblOSProcesses.innerHTML = rosieData.OsProcessCount
        $lblOSThreads.innerHTML = rosieData.OsThreadCount
        $lblOSVersion.innerHTML = rosieData.OsVersion
        $lblOSManufacturer.innerHTML = rosieData.OsManufacturer

        $lblCPUName.innerHTML = rosieData.CpuName
        $lblCPUUpTime.innerHTML = rosieData.CpuUpTime
        $lblCPULogical.innerHTML = rosieData.CpuLogicalCount
        $lblCPUPhysical.innerHTML = rosieData.CpuPhysicalCount

        $lblCpuUsage.innerHTML = rosieData.CpuUsage
        $lblDiskUsage.innerHTML = rosieData.DiskTotal - rosieData.DiskUsable
        $lblMemoryUsage.innerHTML = rosieData.MemoryTotal - rosieData.MemoryUsable
    }

    /*------------------------------PAGE LOAD LOGIG-------------------------------*/
    const OnLoadFunctions = () => {
        FirstChartDatas()
        RosieDataQuery()
    }

    win.onload = OnLoadFunctions()
})(document, window)