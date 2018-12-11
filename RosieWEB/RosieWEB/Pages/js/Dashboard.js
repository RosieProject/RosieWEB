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
    
    /*---------------------------CHARTS POPULATE LOGIC---------------------------*/
    const FirstChartDatas = () => {
        PageMethods.FirstChartDatas(FirstChartDatasResponse)
    }

    const FirstChartDatasResponse = (response) => {
        JSON.parse(response[0]).CpuDatas.forEach(function (data) {
            cpuChart.data.labels.push(y++)
            cpuChart.data.datasets[0].data.push(data)
        })
        cpuChart.update()
    }

    const FirstChartDatasError = (error) => {
        alert('Houve um erro na requisição' + error)
    }

    /*------------------------------PAGE LOAD LOGIG-------------------------------*/
    const OnLoadFunctions = () => {
        FirstChartDatas()
    }

    win.onload = OnLoadFunctions()
})(document, window)