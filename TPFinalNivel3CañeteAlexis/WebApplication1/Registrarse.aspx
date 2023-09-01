<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="WebApplication1.Registrarse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function MostrarContraseña() {
            var Contraseña = document.getElementById("TxtContraseña");
            var Mostrar = document.getElementById("ChkMostrar");
            if (Mostrar.checked)
                Contraseña.type = "text";
            else
                Contraseña.type = "password";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Crear cuenta</h1>
    <div class="row">
        <div class="col-5">
            <div class="mb-3">
                <label>Email</label>
            </div>
            <div class="mb-2">
                <asp:TextBox ID="TxtEmail" CssClass="form-control" required="" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ErrorMessage="Ingresar Email valido" CssClass="form-label link-danger fs-5" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ControlToValidate="TxtEmail" runat="server" />
                <asp:RequiredFieldValidator CssClass="form-label link-danger fs-5" ErrorMessage="El Email es requerido" ControlToValidate="TxtEmail" runat="server" />
            </div>
            <div class="mb-4">
                <label>Contraseña</label>
            </div>
            <div class="mb-2">
                <asp:TextBox ID="TxtContraseña" TextMode="Password" CssClass="form-control" ClientIDMode="Static" required="" runat="server" />
                <asp:RequiredFieldValidator CssClass="form-label link-danger fs-5" ErrorMessage="La contraseña es requerida" ControlToValidate="TxtContraseña" runat="server" />
                <div class="m-md-1">
                    <input type="checkbox" id="ChkMostrar" onchange="MostrarContraseña()" />
                    <label>Mostrar contraseña</label>
                </div>
            </div>
            <div class="mb-3">
                <asp:Button Text="Crear" ID="BtnCrear" CssClass="btn btn-primary" OnClick="BtnCrear_Click" runat="server" />
                <a href="Default.aspx">Cancelar</a>
            </div>
        </div>
    </div>
</asp:Content>
