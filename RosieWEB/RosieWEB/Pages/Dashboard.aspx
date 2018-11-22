<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="RosieWEB.Dashboard" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Rosie - Dashboard</title>

    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet" />

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet" />

    <!--  Fonts   -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>

            <div class="wrapper">
                <div class="sidebar" data-background-color="white" data-active-color="danger">
                    <div class="sidebar-wrapper" style="background-color: #181A1C">
                        <div class="logo">
                            <a href="Dashboard.aspx" class="simple-text" style="color: #127486">Rosie
                            </a>
                        </div>

                        <ul class="nav">
                            <li>
                                <a href="Dashboard.aspx">
                                    <i class="ti-panel" style="color: #127486"></i>
                                    <p style="color: #127486">Dashboard</p>
                                </a>
                            </li>
                            <li>
                                <a href="Table.aspx">
                                    <i class="ti-user" style="color: #127486"></i>
                                    <p style="color: #127486">Computadores</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="main-panel">
                    <nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar bar1"></span>
                                    <span class="icon-bar bar2"></span>
                                    <span class="icon-bar bar3"></span>
                                </button>
                                <a class="navbar-brand" href="#">Dashboard</a>
                            </div>
                        </div>
                    </nav>


                    <div class="content">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="col-lg-3 col-sm-6">
                                    <div class="card">
                                        <div class="content">
                                            <div class="row">
                                                <div class="col-xs-5">
                                                    <div class="icon-big icon-warning text-center">
                                                        <i class="ti-server">
                                                            <img <%--src="assets\img\CPU.png"--%> /></i>
                                                    </div>
                                                </div>
                                                <div class="col-xs-7">
                                                    <div class="numbers">
                                                        <p>Cpu Usage</p>
                                                        <label data-dados="cpu" id="CPU">0</label><br />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="footer">
                                                <hr />
                                                <div class="stats">
                                                    <i class="ti-reload"></i>Updated now
                                   
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="card">
                                        <div class="content">
                                            <div class="row">
                                                <div class="col-xs-5">
                                                    <div class="icon-big icon-success text-center">
                                                        <i class="ti-wallet">
                                                            <img <%--src="assets\img\Disco.png"--%> /></i>
                                                    </div>
                                                </div>
                                                <div class="col-xs-7">
                                                    <div class="numbers">
                                                        <p>Disk Usage</p>
                                                        <label data-dados="disk">0</label><br />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="footer">
                                                <hr />
                                                <div class="stats">
                                                    <i class="ti-reload"></i>Updated now
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="card">
                                        <div class="content">
                                            <div class="row">
                                                <div class="col-xs-5">
                                                    <div class="icon-big icon-danger text-center">
                                                        <i class="ti-pulse">
                                                            <img <%--src="assets\img\Memoria.png"--%> /></i>
                                                    </div>
                                                </div>
                                                <div class="col-xs-7">
                                                    <div class="numbers">
                                                        <p>Memory Usage</p>
                                                        <label data-dados="memory">0</label><br />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="footer">
                                                <hr />
                                                <div class="stats">
                                                    <i class="ti-reload"></i>Updated now
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="card">
                                        <div class="header">
                                            <h4 class="title">CPU</h4>
                                            <p class="category">Last Campaign Performance</p>
                                        </div>
                                        <div class="content">
                                            <div class="Grafico">
                                                <canvas data-chart="cpuChart"></canvas>
                                            </div>
                                            <div class="footer">
                                                <hr />
                                                <div class="stats">
                                                    <i class="ti-timer"></i>Tempo real
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card">
                                        <div class="header">
                                            <h4 class="title">Disco</h4>
                                            <p class="category">Last Campaign Performance</p>
                                        </div>
                                        <div class="content">
                                            <div class="Grafico">
                                                <canvas data-chart="diskChart"></canvas>
                                            </div>
                                            <div class="footer">
                                                <hr>
                                                <div class="stats">
                                                    <i class="ti-timer"></i>Tempo real
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card">
                                        <div class="header">
                                            <h4 class="title">Memoria</h4>
                                            <p class="category">Last Campaign Performance</p>
                                        </div>
                                        <div class="content">
                                            <div class="Grafico">
                                                <canvas data-chart="memoryChart"></canvas>
                                            </div>
                                            <div class="footer">
                                                <hr>
                                                <div class="stats">
                                                    <i class="ti-timer"></i>Tempo real
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <footer class="footer">
                        <div class="container-fluid">
                            <div class="copyright pull-right">
                                &copy;
                                <script>document.write(new Date().getFullYear())</script>
                                , made with <i class="fa fa-heart heart"></i>by <a href="http://www.creative-tim.com">Creative Tim</a>
                            </div>
                        </div>
                    </footer>

                </div>
            </div>
            <!--end-->
        </div>
    </form>
</body>

<script>
    var $cpu = document.querySelector("[data-dados=cpu]") || undefined
    var $disk = document.querySelector("[data-dados=disk]") || undefined
    var $memory = document.querySelector("[data-dados=memory]") || undefined

    var ctxCpuChart = document.querySelector('[data-chart="cpuChart"]').getContext('2d')
    var cpuChart = new Chart(ctxCpuChart, {
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
            }
        }
    })

    var ctxDiskChart = document.querySelector('[data-chart="diskChart"]').getContext('2d')
    var diskChart = new Chart(ctxDiskChart, {
        type: 'line',
        data: {
            labels: [],
            datasets: [{
                label: 'DiskUsage',
                backgroundColor: 'rgba(33, 255, 84, 30%)',
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
                            if (dataType === 'TB') {
                                return `${Math.round(value)} TB`

                            } else if (dataType === 'GB') {
                                return `${Math.round(value)} GB`

                            } else if (dataType === 'MB') {
                                return `${Math.round(value)} MB`

                            } else {
                                return `${value} Bytes`
                            }
                        }
                    }
                }]
            }
        }
    })

    var ctxMemoryChart = document.querySelector('[data-chart="memoryChart"]').getContext('2d')
    var memoryChart = new Chart(ctxMemoryChart, {
        type: 'line',
        data: {
            labels: [],
            datasets: [{
                label: 'MemoryUsage',
                backgroundColor: 'rgba(106, 250, 252, 30%)',
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
                            if (dataType === 'TB') {
                                return `${Math.round(value)} TB`

                            } else if (dataType === 'GB') {
                                return `${Math.round(value)} GB`

                            } else if (dataType === 'MB') {
                                return `${Math.round(value)} MB`

                            } else {
                                return `${value} Bytes`
                            }
                        }
                    }
                }]
            }
        }
    })

    var loopCpu;

    function AtualizaCpu() {
        PageMethods.AtualizarCpu(function (data) { $cpu.innerHTML = data }, fnerrorcallback)
        loopCpu = setTimeout(AtualizaCpu, 2000)
    }

    var loopDisk;

    function AtualizaDisk() {
        PageMethods.AtualizarDisco(function (data) { $disk.innerHTML = data }, fnerrorcallback)
        loopDisk = setTimeout(AtualizaDisk, 2000)
    }

    var loopMemory

    function AtualizaMemory() {
        PageMethods.AtualizarMemoria(function (data) { $memory.innerHTML = data }, fnerrorcallback)
        loopMemory = setTimeout(AtualizaMemory, 2000)
    }

    function fnerrorcallback(result) {
        alert(result.statusText);
    }

    var dataType;
    var y = 0

    function roundBytesData(data) {
        if (data >= 1000000000000) {
            dataType = 'TB'
            return Math.round(data / 1000000000000)

        } else if (data >= 1000000000) {
            dataType = 'GB'
            return Math.round(data / 1000000000)

        } else if (data >= 1000000) {
            dataType = 'MB'
            return Math.round(data / 1000000)

        } else {
            dataType = 'Bytes'
            return data
        }
    }

    function updateDiskChart() {
        //Ao Iniciar o Gráfico na tela, pega os primeiros 10 Dados do Banco e Exibe no Grafico
        if (y === 0) {
            PageMethods.AtualizarDiskFirst(function (datas) {
                datas.forEach(function (data) {
                    diskChart.data.labels.push(y++)
                    diskChart.data.datasets[0].data.push(roundBytesData(data))
                })
                diskChart.update()
            }, fnerrorcallback)
        }
        /*---*/
        //Inicia a Atualização dos dados do grafico com uma função de callback (onSucess) do WebMethod do C#
        PageMethods.AtualizarDisk(attData, fnerrorcallback)
        /*---*/
        //Função de callback chamado pelo WebMethod acima, que atualiza os dados no grafico com o parametro de retorno do WebMethod do C#
        function attData(data) {
            data = roundBytesData(data)
            var dataLength = diskChart.data.datasets[0].data.length
            var dataSetData = diskChart.data.datasets[0].data
            //Verifica se o dado pego do Banco de Dados não é igual aos ultimos 3 dados do gráfico (ou seja, confirma se o dado esta sendo atualizado)
            if (data !== dataSetData[dataLength - 1] || data !== dataSetData[dataLength - 2] || data !== dataSetData[dataLength - 3]) {
                diskChart.data.datasets[0].data.push(data)
                diskChart.data.labels.push(y++)
                //Verifica se o Eixo X do gráfico passou de 10 Itens, se sim, exclui o primeiro dado do grafico
                if (diskChart.data.labels.length > 10) {
                    diskChart.data.labels.shift()
                    diskChart.data.datasets[0].data.shift(1)
                }
                /*---*/
                //Atualiza o gráfico com os novos dados
                diskChart.update()
                /*---*/
            }
            /*---*/
            //Invoca um loop da função asíncronamente a cada 3 segundos
            setTimeout(updateDiskChart, 3000)
            /*--*/
        }
        /*---*/
    }

    function testeDisk(data, datas) {


        datas.forEach(function (data) {
            diskChart.data.labels.push(y++)
            diskChart.data.datasets[0].data.push(roundBytesData(data))
        })
        diskChart.update()


        data = roundBytesData(data)
        console.log(data)
        var dataLength = diskChart.data.datasets[0].data.length
        var dataSetData = diskChart.data.datasets[0].data
        //Verifica se o dado pego do Banco de Dados não é igual aos ultimos 3 dados do gráfico (ou seja, confirma se o dado esta sendo atualizado)
        if (data !== dataSetData[dataLength - 1] || data !== dataSetData[dataLength - 2] || data !== dataSetData[dataLength - 3]) {
            diskChart.data.datasets[0].data.push(data)
            diskChart.data.labels.push(y++)
            //Verifica se o Eixo X do gráfico passou de 10 Itens, se sim, exclui o primeiro dado do grafico
            if (diskChart.data.labels.length > 10) {
                diskChart.data.labels.shift()
                diskChart.data.datasets[0].data.shift(1)
            }
            /*---*/
            //Atualiza o gráfico com os novos dados
            diskChart.update()
            /*---*/
        }
    }

    var x = 0

    function updateCpuChart() {
        //Ao Iniciar o Gráfico na tela, pega os primeiros 10 Dados do Banco e Exibe no Grafico
        if (x === 0) {
            PageMethods.AtualizarCpuFirst(function (datas) {
                datas.forEach(function (data) {
                    cpuChart.data.labels.push(x++)
                    cpuChart.data.datasets[0].data.push(data)
                })
                cpuChart.update()
            }, fnerrorcallback)
        }
        /*---*/
        //Inicia a Atualização dos dados do grafico com uma função de callback (onSucess) do WebMethod do C#
        PageMethods.AtualizarCpu(attData, fnerrorcallback)
        /*---*/
        //Função de callback chamado pelo WebMethod acima, que atualiza os dados no grafico com o parametro de retorno do WebMethod do C#
        function attData(data) {
            var dataLength = cpuChart.data.datasets[0].data.length
            var dataSetData = cpuChart.data.datasets[0].data
            //Verifica se o dado pego do Banco de Dados não é igual aos ultimos 3 dados do gráfico (ou seja, confirma se o dado esta sendo atualizado)
            if (data !== dataSetData[dataLength - 1] || data !== dataSetData[dataLength - 2] || data !== dataSetData[dataLength - 3]) {
                cpuChart.data.datasets[0].data.push(data)
                cpuChart.data.labels.push(x++)
                //Verifica se o Eixo X do gráfico passou de 10 Itens, se sim, exclui o primeiro dado do grafico
                if (cpuChart.data.labels.length > 10) {
                    cpuChart.data.labels.shift()
                    cpuChart.data.datasets[0].data.shift(1)
                }
                /*---*/
                //Atualiza o gráfico com os novos dados
                cpuChart.update()
                /*---*/
            }
            /*---*/
            //Invoca um loop da função asíncronamente a cada 3 segundos
            setTimeout(updateCpuChart, 3000)
            /*--*/
        }
        /*---*/
    }

    var z = 0

    function updateMemoryChart() {
        //Ao Iniciar o Gráfico na tela, pega os primeiros 10 Dados do Banco e Exibe no Grafico
        if (z === 0) {
            PageMethods.AtualizarMemoryFirst(function (datas) {
                datas.forEach(function (data) {
                    memoryChart.data.labels.push(z++)
                    memoryChart.data.datasets[0].data.push(roundBytesData(data))
                })
                memoryChart.update()
            }, fnerrorcallback)
        }
        /*---*/
        //Inicia a Atualização dos dados do grafico com uma função de callback (onSucess) do WebMethod do C#
        PageMethods.AtualizarMemory(attData, fnerrorcallback)
        /*---*/
        //Função de callback chamado pelo WebMethod acima, que atualiza os dados no grafico com o parametro de retorno do WebMethod do C#
        function attData(data) {
            data = roundBytesData(data)
            var dataLength = memoryChart.data.datasets[0].data.length
            var dataSetData = memoryChart.data.datasets[0].data
            //Verifica se o dado pego do Banco de Dados não é igual aos ultimos 3 dados do gráfico (ou seja, confirma se o dado esta sendo atualizado)
            if (data !== dataSetData[dataLength - 1] || data !== dataSetData[dataLength - 2] || data !== dataSetData[dataLength - 3]) {
                memoryChart.data.datasets[0].data.push(data)
                memoryChart.data.labels.push(z++)
                //Verifica se o Eixo X do gráfico passou de 10 Itens, se sim, exclui o primeiro dado do grafico
                if (memoryChart.data.labels.length > 10) {
                    memoryChart.data.labels.shift()
                    memoryChart.data.datasets[0].data.shift(1)
                }
                /*---*/
                //Atualiza o gráfico com os novos dados
                memoryChart.update()
                /*---*/
            }
            /*---*/
            //Invoca um loop da função asíncronamente a cada 3 segundos
            setTimeout(updateMemoryChart, 3000)
            /*--*/
        }
        /*---*/
    }
    updateMemoryChart()
    updateDiskChart()
    updateCpuChart()
</script>

<!--   Core JS Files   -->
<script src="assets/js/jquery.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="assets/js/bootstrap-checkbox-radio.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose REMOVER-->
<script src="assets/js/paper-dashboard.js"></script>


<script type="text/javascript">
    $(document).ready(function () {

        $.notify({
            icon: 'ti-gift',
            message: "Bem-vindo ao Dashboard <b>Rosie</b>."

        }, {
                type: 'success',
                timer: 4000
            });

    });
</script>
</html>
