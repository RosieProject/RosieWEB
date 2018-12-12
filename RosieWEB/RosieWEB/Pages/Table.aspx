<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Table.aspx.cs" Inherits="RosieWEB.Pages.Table" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>Rosie - Computadores</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet" />

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
</head>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
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
                        <li>
                            <a href="UserRegister.aspx">
                                <i class="ti-user" style="color: #127486"></i>
                                <p style="color: #127486">Registrar Usuarios</p>
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
                            <a class="navbar-brand" href="#">Table List</a>
                        </div>
                    </div>
                </nav>
                <div class="col-md-12">
                    <div class="card card-plain">
                        <div class="header">
                            <h4 class="title">Lista de Computadores</h4>
                            <p class="category">Usuários</p>
                        </div>
                        <div class="content table-responsive table-full-width">
                            <table class="table table-hover">
                                <thead>
                                    <th>Usuario</th>
                                    <th>CPU</th>
                                    <th>Memoria</th>
                                    <th>Disco</th>
                                    <th>Estado</th>
                                </thead>
                                <tbody data-table="tbody">
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <footer class="footer">
        <div class="container-fluid">
            <div class="copyright pull-right">
                &copy;
                        <script>document.write(new Date().getFullYear())</script>
                , made with <i class="fa fa-heart heart"></i>by <a href="http://www.creative-tim.com">Creative Tim</a>
            </div>
        </div>
    </footer>

    <script>
        const $tableBody = document.querySelector('[data-table="tbody"]')

        getUsers()
        function getUsers() {
            PageMethods.SearchUser(function (datas) {
                addUser($tableBody, datas, datas.length)
            }, /*Error Function*/)
        }

        const bytesToSize = (bytes) => {
            var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB']
            if (bytes == 0) return '0 Byte'
            var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)))
            return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i]
        }

        function addUser(element, users, rowsLenght) {
            for (var i = 0; i < rowsLenght; i++) {
                var tr = document.createElement('TR')
                var tdName = document.createElement('TD')
                var tdCpu = document.createElement('TD')
                var tdMemory = document.createElement('TD')
                var tdDisk = document.createElement('TD')
                var tdState = document.createElement('TD')
                var text = document.createTextNode(JSON.parse(users[i]).userName)
                tdName.appendChild(text)
                tr.appendChild(tdName)
                var text = document.createTextNode(Math.round(JSON.parse(users[i]).userCpu) + '%')
                tdCpu.appendChild(text)
                tr.appendChild(tdCpu)
                var text = document.createTextNode(bytesToSize(JSON.parse(users[i]).userMemory))
                tdMemory.appendChild(text)
                tr.appendChild(tdMemory)
                var text = document.createTextNode(bytesToSize(JSON.parse(users[i]).userDisk))
                tdDisk.appendChild(text)
                tr.appendChild(tdDisk)
                var circle = document.createElement('DIV')
                circle.setAttribute('style', 'width:20px; height:20px; background:' + 'green' + '; border-radius:100%; margin: 0 auto')
                tdState.appendChild(circle)
                tr.appendChild(tdState)

                var idPC = JSON.parse(users[i]).userComputer
                tr.value = idPC

                element.appendChild(tr)
            }
            addRowClickHandler(users)
        }

        function addRowClickHandler() {
            var rows = $tableBody.getElementsByTagName('TR');
            for (i = 0; i < rows.length; i++) {
                var row = rows[i];
                var att = document.createAttribute('onclick')
                att.value = "PageMethods.SaveComputer(this.value, function (data) { window.location.href = '../Pages/Dashboard.aspx'})"
                console.log(row)
                console.log(row.value)
                row.setAttributeNode(att)
            }
        }

    </script>
</body>

<!--   Core JS Files   -->
<script src="assets/js/jquery.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="assets/js/paper-dashboard.js"></script>


</html>
