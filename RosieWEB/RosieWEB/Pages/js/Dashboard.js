(function (doc, win) {
    /*-------------------------------PAGE/DATA ELEMENTS-------------------------------*/
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

    /*-------------------------------CHART ELEMENTS------------------------------*/
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
    const cpuChartLabels = cpuChart.data.labels
    const cpuChartData = cpuChart.data.datasets[0].data

    const memoryDogChartDesign = {
        type: 'doughnut',
        data: {
            labels: ['Total', 'Usado', 'Disponivel'],
            datasets: [{
                data: [20, 30],
                backgroundColor: ["#212121", "#8e5ea2"]
            }]
        },
        options: {
            maintainAspectRatio: false,
            elements: {
                center: {
                    text: '50% Usado',
                    color: '#FF6384', // Default is #000000
                    fontStyle: 'Arial', // Default is Arial
                    sidePadding: 20 // Defualt is 20 (as a percentage)
                }
            }
        }
    }
    var memoryChart = new Chart($ctxMemoryDogChart, memoryDogChartDesign)

    const diskDogChartDesign = {
        type: 'doughnut',
        data: {
            labels: ['Total', 'Usado', 'Disponivel'],
            datasets: [{
                data: [20, 30],
                backgroundColor: ["#212121", "#8e5ea2"]
            }]
        },
        options: {
            maintainAspectRatio: false,
            elements: {
                center: {
                    text: '50% Usado',
                    color: '#FF6384', // Default is #000000
                    fontStyle: 'Arial', // Default is Arial
                    sidePadding: 20 // Defualt is 20 (as a percentage)
                }
            }
        }
    }
    var diskChart = new Chart($ctxDiskDogChart, diskDogChartDesign)

    /*---------------------------CHARTS FIRST POPULATE LOGIC---------------------------*/
    const FirstChartDatas = () => {
        PageMethods.FirstChartDatas(FirstChartDatasResponse)
    }

    const FirstChartDatasResponse = (response) => {
        const datas = JSON.parse(response[0]).CpuDatas
        PopulateCpuChart(datas)
    }

    const PopulateCpuChart = (datas) => {
        datas.forEach(function (data) {
            cpuChartLabels.push(cpuChartData.length)
            cpuChartData.push(data)
        })
        cpuChart.update()
    }

    const FirstChartDatasError = (error) => {
        alert('Houve um erro na requisição' + error)
    }

    /*----------------------------------DATA QUERY LOGIC--------------------------------*/
    const RosieDataQuery = () => {
        PageMethods.GetRosieData(RosieDataResponse)
    }

    const RosieDataResponse = (response) => {
        const rosieData = JSON.parse(response[0])

        PageUpdateElements(rosieData)
    }

    const PageUpdateElements = (rosieData) => {
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
        $lblDiskUsage.innerHTML = bytesToSize(rosieData.DiskTotal - rosieData.DiskUsable)
        $lblMemoryUsage.innerHTML = bytesToSize(rosieData.MemoryTotal - rosieData.MemoryUsable)
    }

    /*--------------------------------HELPERS-------------------------------------*/
    //Change Metrics
    function bytesToSize(bytes) {
        var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB']
        if (bytes == 0) return '0 Byte'
        var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)))
        return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i]
    }
    //Chart Inside Text Config
    Chart.pluginService.register({
        beforeDraw: function (chart) {
            if (chart.config.options.elements.center) {
                //Get ctx from string
                var ctx = chart.chart.ctx;

                //Get options from the center object in options
                var centerConfig = chart.config.options.elements.center;
                var fontStyle = centerConfig.fontStyle || 'Arial';
                var txt = centerConfig.text;
                var color = centerConfig.color || '#000';
                var sidePadding = centerConfig.sidePadding || 20;
                var sidePaddingCalculated = (sidePadding / 100) * (chart.innerRadius * 2)
                //Start with a base font of 30px
                ctx.font = "30px " + fontStyle;

                //Get the width of the string and also the width of the element minus 10 to give it 5px side padding
                var stringWidth = ctx.measureText(txt).width;
                var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

                // Find out how much the font can grow in width.
                var widthRatio = elementWidth / stringWidth;
                var newFontSize = Math.floor(30 * widthRatio);
                var elementHeight = (chart.innerRadius * 2);

                // Pick a new font size so it will not be larger than the height of label.
                var fontSizeToUse = Math.min(newFontSize, elementHeight);

                //Set font settings to draw it correctly.
                ctx.textAlign = 'center';
                ctx.textBaseline = 'middle';
                var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
                var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
                ctx.font = fontSizeToUse + "px " + fontStyle;
                ctx.fillStyle = color;

                //Draw text in center
                ctx.fillText(txt, centerX, centerY);
            }
        }
    });
    /*------------------------------PAGE LOAD LOGIC-------------------------------*/
    const OnLoadFunctions = () => {
        FirstChartDatas()
        RosieDataQuery()
    }

    win.onload = OnLoadFunctions()
})(document, window)