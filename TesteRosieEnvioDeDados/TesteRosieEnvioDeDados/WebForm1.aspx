<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TesteRosieEnvioDeDados.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!----->
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>Paper Dashboard by Creative Tim</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet" />

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet" />

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div>

            <asp:Button runat="server" Text="Start" OnClientClick="AtualizarDados();return false;" />
            <asp:Button runat="server" Text="Stop" OnClientClick="Stop();return false;" />

            <!--start-->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>

            <div class="wrapper">
                <div class="sidebar" data-background-color="white" data-active-color="danger">

                    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

                    <div class="sidebar-wrapper" style="background-color: #181A1C">
                        <div class="logo">
                            <a href="http://www.creative-tim.com" class="simple-text" style="color: #127486">Rosie
                </a>
                        </div>
                        <ul class="nav">
                            <li class="active">
                                <a href="dashboard.html">
                                    <i class="ti-panel" style="color: #127486"></i>
                                    <p style="color: #127486">Dashboard</p>
                                </a>
                            </li>
                        </ul>
                        <ul class="nav">
                            <li class="active">
                                <a href="dashboard.html">
                                    <i class="ti-panel" style="color: #127486"></i>
                                    <p style="color: #127486">Dashboard</p>
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

                            <asp:Button runat="server" Text="Start" OnClientClick="AtualizarDados();return false;" />
                            <asp:Button runat="server" Text="Stop" OnClientClick="Stop();return false;" />

                            <div class="row">
                                <div class="col-lg-3 col-sm-6">
                                    <div class="card">
                                        <div class="content">
                                            <div class="row">
                                                <div class="col-xs-5">
                                                    <div class="icon-big icon-warning text-center">
                                                        <i class="ti-server">
                                                            <img src="assets\img\CPU.png" /></i>
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
                                                            <img src="assets\img\Disco.png" /></i>
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
                                                            <img src="assets\img\Memoria.png" /></i>
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
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="header">
                                            <h4 class="title">CPU</h4>
                                            <p class="category">Last Campaign Performance</p>
                                        </div>
                                        <div class="content">
                                            <div class="Grafico">
                                                <canvas data-chart="grafico1"></canvas>
                                                <script>
                                                    var ctxChart1 = document.querySelector('[data-chart="grafico1"').getContext('2d')
                                                    var cpuChart1 = new Chart(ctxChart1, {
                                                        type: 'line',
                                                        data: {
                                                            labels: [],
                                                            datasets: [{
                                                                borderColor: 'black',
                                                                data: []
                                                            }]
                                                        },
                                                        options: {}
                                                    })
                                                    var i = 0
                                                    function updateChart1() {

                                                        cpuChart1.data.labels.push(i++)
                                                        
                                                        if (cpuChart1.data.labels.length > 15) {
                                                            cpuChart1.data.labels.shift()
                                                            cpuChart1.data.datasets[0].data.shift()
                                                        }
                                                        cpuChart1.update()
                                                        setTimeout(updateChart1, 500)

                                                    }
                                                    function fnerrorcallback(result) {
                                                        alert(result.statusText);
                                                    }
                                                    updateChart1()
                                                </script>
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
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="header">
                                            <h4 class="title">Disco</h4>
                                            <p class="category">Last Campaign Performance</p>
                                        </div>
                                        <div class="content">
                                            <div class="Grafico">
                                                <canvas data-chart="grafico2"></canvas>
                                                <script>
                                                    var ctxChart2 = document.querySelector('[data-chart="grafico2"').getContext('2d')
                                                    var cpuChart2 = new Chart(ctxChart2, {
                                                        type: 'line',
                                                        data: {
                                                            labels: [],
                                                            datasets: [{
                                                                borderColor: 'black',
                                                                data: []
                                                            }]
                                                        },
                                                        options: {}
                                                    })

                                                    var x = 0

                                                    function updateChart2() {

                                                        cpuChart2.data.labels.push(x++)
                                                        PageMethods.AtualizarMemoria(function (data) { cpuChart2.data.datasets[0].data.push((Number)(data)) }, fnerrorcallback)
                                                        if (cpuChart2.data.labels.length > 15) {
                                                            cpuChart2.data.labels.shift()
                                                            cpuChart2.data.datasets[0].data.shift()
                                                        }
                                                        cpuChart2.update()
                                                        setTimeout(updateChart2, 500)

                                                    }

                                                    updateChart2()
                                                </script>
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

                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="header">
                                            <h4 class="title">Memoria</h4>
                                            <p class="category">Last Campaign Performance</p>
                                        </div>
                                        <div class="content">
                                            <div class="Grafico">
                                                <canvas data-chart="grafico3"></canvas>
                                                <script>
                                                    var ctxChart3 = document.querySelector('[data-chart="grafico3"').getContext('2d')
                                                    var cpuChart3 = new Chart(ctxChart3, {
                                                        type: 'line',
                                                        data: {
                                                            labels: [],
                                                            datasets: [{
                                                                borderColor: 'black',
                                                                data: []
                                                            }]
                                                        },
                                                        options: {}
                                                    })

                                                    var z = 0

                                                    function updateChart3() {

                                                        cpuChart3.data.labels.push(z++)
                                                        cpuChart3.data.datasets[0].data.push(Math.random())
                                                        if (cpuChart3.data.labels.length > 15) {
                                                            cpuChart3.data.labels.shift()
                                                            cpuChart3.data.datasets[0].data.shift()
                                                        }
                                                        cpuChart3.update()
                                                        setTimeout(updateChart3, 500)

                                                    }

                                                    updateChart3()
                                                </script>
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

    var loopCpu;
    var loopDisk;
    var loopMemory;
    AtualizarDados()
    function AtualizarDados() {
        AtualizaCpu()
        AtualizaDisk()
        AtualizaMemory()
    }

    function AtualizaCpu() {
        PageMethods.AtualizarCpu(function (data) { $cpu.innerHTML = data }, fnerrorcallback)
        loopCpu = setTimeout(AtualizaCpu, 2000)
    }

    function AtualizaDisk() {
        PageMethods.AtualizarDisco(function (data) { $disk.innerHTML = data }, fnerrorcallback)
        loopDisk = setTimeout(AtualizaDisk, 2000)
    }

    function AtualizaMemory() {
        PageMethods.AtualizarMemoria(function (data) { $memory.innerHTML = data }, fnerrorcallback)
        loopMemory = setTimeout(AtualizaMemory, 2000)
    }

    function fnerrorcallback(result) {
        alert(result.statusText);
    }

    function Stop() {
        clearTimeout(loopCpu)
        clearTimeout(loopDisk)
        clearTimeout(loopMemory)
    }
</script>
</html>
