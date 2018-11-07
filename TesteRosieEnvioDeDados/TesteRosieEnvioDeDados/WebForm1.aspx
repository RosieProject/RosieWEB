<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TesteRosieEnvioDeDados.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div>
           <label>Disk Usage: </label>
            <label data-dados="disk">0</label><br/>

           <label>Cpu Usage: </label>
            <label data-dados="cpu">0</label><br/>

           <label>Memory Usage: </label> 
            <label data-dados="memory">0</label><br/>

            <asp:Button runat="server" Text="Start" OnClientClick="AtualizarDados();return false;"/>
            <asp:Button runat="server" Text="Stop" OnClientClick="Stop();return false;"/>
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
