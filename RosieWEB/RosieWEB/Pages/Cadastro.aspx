<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="RosieWEB.Pages.Cadastro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/cadastro.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="google-signin-scope" content="" />
    <meta name="google-signin-client_id" content="621914680772-cmod185olq6efdnmf5l89mdem9sv28cd.apps.googleusercontent.com" />
    <script src="https://apis.google.com/js/platform.js" async="" defer=""></script>
    <title>Cadastre-se</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="centro">
            <div class="formulario">
                <img id="user-photo" src="https://mariovalney.com/wp-content/uploads/2015/06/user-anonimo.jpg" />
                <div class="content">
                    <p class="cd">CADASTRO</p>
                    <div class="text">
                        <asp:TextBox runat="server" placeholder="Digite seu primeiro e último nome" ID="TxtNome" CssClass="caixas" /><br />
                        <br />
                        <asp:TextBox runat="server" placeholder="Digite seu email" ID="TxtEmail" CssClass="caixas" /><br />
                        <br />
                        <asp:TextBox runat="server" placeholder="Digite uma senha..." TextMode="Password" ID="TxtSenha" CssClass="caixas" /><br />
                        <br />
                        <asp:TextBox runat="server" placeholder="Confirme sua senha..." TextMode="Password" ID="TxtConfSenha" CssClass="caixas" /><br />
                        <br />
                        <div class="btn">
                            <asp:Button Text="    Salvar    " runat="server" ID="btnCadastro" CssClass="alinhamento" OnClick="btnCadastro_Click" />
                        </div>
                    </div>
                    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark" data-width="300" data-height="50" data-longtitle="true" data-lang="pt-BR"></div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
