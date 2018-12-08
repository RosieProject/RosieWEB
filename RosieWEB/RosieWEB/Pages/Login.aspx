<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Rosie.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%--<meta name="google-signin-scope" content="" />
    <meta name="google-signin-client_id" content="621914680772-cmod185olq6efdnmf5l89mdem9sv28cd.apps.googleusercontent.com" />
    <script src="https://apis.google.com/js/platform.js" async="" defer=""></script>--%>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/NovoLogin.css" />
</head>

<body style="background: url(images/FundoLogin1.png) no-repeat">
    <form id="form1" runat="server">
        <a href="index.html">
            <img class="foto" src="images/Slider01.png"/>
        </a>
        <asp:ScriptManager runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div class="center">
            <div class="form">
                <img id="user-photo" src="https://mariovalney.com/wp-content/uploads/2015/06/user-anonimo.jpg" class="user-photo"/>
                <div class="content">
                    <p class="cd">LOGIN</p>
                    <div class="texto">
                        <div class="labels">
                            <p class="definicao">E-mail</p>
                            <asp:TextBox runat="server" placeholder="" ID="TxtEmail" CssClass="log TxtEmail" />
                            <p class="definicao">Senha</p>
                            <asp:TextBox runat="server" TextMode="Password" placeholder="" ID="Password" CssClass="log Password" /><br />
                            <br />
                        </div>

                        <div class="botao">
                            <asp:Button Text="Entrar" runat="server" ID="BtnLogin" CssClass="teste BtnLogin" OnClick="Loginteste" />
                            <br />
                            <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark" data-width="300" data-height="50" data-longtitle="true" data-lang="pt-BR"></div>
                            <br />
                            <asp:Button Text="Ainda não é cadastrado ?" runat="server" ID="BtnCadastrar" OnClick="BtnCadastrar_Click" class="teste BtnCadastrar" />

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="user">

            <p id="user-email"></p>
        </div>
        <asp:Label ID="userID" runat="server" Text=""></asp:Label>
        <asp:Label ID="userName" runat="server" Text=""></asp:Label>
        <asp:Label ID="userEmail" runat="server" Text=""></asp:Label>
    </form>
    <script>

        function signOut() {
            var auth2 = gapi.auth2.getAuthInstance();
            auth2.signOut().then(function () {
                window.location.href = "login.aspx"
            });
        }

        function onSignIn(response) {
            // Conseguindo as informações do seu usuário:
            var perfil = response.getBasicProfile();

            // Conseguindo o ID do Usuário
            var userID = perfil.getId();

            // Conseguindo o Nome do Usuário
            var userName = perfil.getName();

            // Conseguindo o E-mail do Usuário
            var userEmail = perfil.getEmail();

            // Conseguindo a URL da Foto do Perfil
            var userPicture = perfil.getImageUrl();

            document.getElementById('user-photo').src = userPicture;
            document.getElementById('user-name').innerText = userName;
            document.getElementById('user-email').innerText = userEmail;


            document.getElementById("userID").innerHTML = userID;
            document.getElementById("userName").innerHTML = userName;
            document.getElementById("userEmail").innerHTML = userEmail;

            // Recebendo o TOKEN que você usará nas demais requisições à API:
            var LoR = response.getAuthResponse().id_token;
            console.log("~ le Tolkien: " + LoR);
            if (LoR !== null) {

                //Vai fazer o botão clica sozinho
                console.log('oi')
                cadastraBanco()
                //window.location.href = "GOOGLE.aspx"

            }

        };
        //Função que o botão chama pra chamar o mesmo metodo só que no c#
        function cadastraBanco() {
            console.log('oi')
            PageMethods.Iniciar(document.getElementById("userID").innerHTML, document.getElementById("userName").innerHTML, document.getElementById("userEmail").innerHTML);
        }

    </script>
</body>
</html>
