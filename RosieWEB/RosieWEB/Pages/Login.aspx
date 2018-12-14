<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RosieWEB.Pages.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login - Rosie</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="Login/images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Login/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Login/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Login/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Login/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Login/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Login/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Login/css/util.css">
    <link rel="stylesheet" type="text/css" href="Login/css/main.css">
    <!--===============================================================================================-->
    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg">

    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100 p-t-50 p-b-90">
                <form runat="server" class="login100-form validate-form flex-sb flex-w">
                    <asp:ScriptManager runat="server" ID="scriptManager1" EnablePageMethods="true"></asp:ScriptManager>
                    <span class="login100-form-title p-b-51">Login
                    </span>


                    <div class="wrap-input100 validate-input m-b-16" data-validate="Preencha o Campo">
                        <input class="input100" type="text" name="E-Mail" placeholder="E-Mail" data-login="email">
                        <span class="focus-input100"></span>
                    </div>


                    <div class="wrap-input100 validate-input m-b-16" data-validate="Preencha o Campo">
                        <input class="input100" type="password" name="Senha" placeholder="Senha" data-login="senha">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="flex-sb-m w-full p-t-3 p-b-24" style="margin-left:10px">
                        <div class="contact100-form-checkbox">
                            <a href="#" class="txt1" data-cadastro="cadastre">Registre-se</a>
                        </div>
                    </div>

                    <div class="container-login100-form-btn m-t-17">
                        <button class="login100-form-btn" data-login="login">
                            Entrar
                        </button>
                    </div>

                </form>
            </div>
        </div>
    </div>


    <div id="dropDownSelect1"></div>
    <%--    Login Logic    --%>
    <script src="js/Login.js" type="text/javascript"></script>
    <!--   Core JS Files   -->
    <script src="assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    <!--===============================================================================================-->
    <script src="Login/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="Login/vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="Login/vendor/bootstrap/js/popper.js"></script>
    <script src="Login/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="Login/vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="Login/vendor/daterangepicker/moment.min.js"></script>
    <script src="Login/vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
    <script src="Login/vendor/countdowntime/countdowntime.js"></script>
    <!--===============================================================================================-->
    <script src="Login/js/main.js"></script>

</body>
</html>
