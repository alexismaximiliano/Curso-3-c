<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Pokedex_web.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-5">
            <h2>Crear nuevo usuario</h2>
            <div class="mb-2">
                <asp:Label Text="Email" runat="server" />
                <asp:TextBox runat="server" ID="TxtEmail" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <asp:Label Text="Contraseña" runat="server" />
                <asp:TextBox runat="server" ID="TxtContraseña" CssClass="form-control" TextMode="Password" />
            </div>
            <div class="mb-3">
                <asp:Button Text="Registrarse" ID="BtnRegistrarse" OnClick="BtnRegistrarse_Click" CssClass="btn btn-primary" runat="server" />
                <a href="Default.aspx">Cancelar</a>
            </div>
        </div>
    </div>
</asp:Content>
