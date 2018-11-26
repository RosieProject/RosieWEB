<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="RosieWEB.Pages.UserRegister" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>Rosie - Usuários</title>

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
                        <a class="navbar-brand" href="#">Registrar Usuário</a>
                    </div>
                </div>
            </nav>


            <div class="content">
                <div class="container-fluid">
                    <div class="row">

                        <%--Formulario--%>
                        <div class="card">
                            <div class="content">
                                <form runat="server">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
                                    <div class="form-group">
                                        <label>Digite o Email</label>
                                        <input type="email" class="form-control" id="userEmail" placeholder="Exemplo: usuario@usuario.com" aria-label="Email do Usuário" style="border: 1px solid gray;">
                                    </div>

                                    <div class="form-group">
                                        <label>Senha</label>
                                        <input type="password" class="form-control" id="userPassword" placeholder="Exemplo: User@!2846" style="border: 1px solid gray">
                                    </div>

                                    <div class="form-group">
                                        <label>Nome do Usuario <span><u>*Opcional*</u></span></label>
                                        <input type="text" class="form-control" id="userName" placeholder="Exemplo: Paulo" style="border: 1px solid gray">
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="userIsAdmin">
                                        <label class="form-check-label" for="exampleCheck1">Registrar Usuário como Administrador</label>
                                    </div>

                                    <asp:Button runat="server" class="btn btn-primary" ID="btnRegistryClick" Text="Registrar" OnClientClick="RegistrateUser();return false;" />
                                </form>
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

</body>

<script>
    function RegistrateUser() {

        $userEmail = document.getElementById('userEmail')
        $userPass = document.getElementById('userPassword')
        $userName = document.getElementById('userName')
        $userIsAdmin = document.getElementById('userIsAdmin')
        var isAdmin = 'Normal'

        if ($userIsAdmin.checked) {
            isAdmin = 'Admin'
        }

        PageMethods.RegisterUser($userName.value, $userPass.value, $userEmail.value, isAdmin, responseSucess, responseError)


        function responseSucess(data) {
            console.log(data)
            notificationStatusResponse($userName.value)
        }

        function responseError(error) {
            console.log(error)
        }
    }

    function notificationStatusResponse(user) {
        $.notify({
            message: `Usuário ${user} Cadastrado!`

        }, {
                type: 'success'
            });
    }

</script>

<!--   Core JS Files   -->
<script src="assets/js/jquery.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="assets/js/paper-dashboard.js"></script>

</html>
