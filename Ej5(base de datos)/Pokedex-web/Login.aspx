<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pokedex_web.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-5">           
            <h2>Iniciar sesion</h2>
            <div class="mb-2">
                <asp:Label Text="Usuario" runat="server" />
                <asp:TextBox runat="server" ID="TxtUsuario" required="true"  CssClass="form-control" />
            </div>
            <div class="mb-2">
                <asp:Label Text="Contraseña" runat="server" />
                <asp:TextBox runat="server" ID="TxtContraseña" CssClass="form-control" TextMode="Password"/>
            </div>
            <div class="mb-3">
                <asp:Button Text="Ingresar" ID="BtnIngresar" OnClick="BtnIngresar_Click" CssClass="btn btn-primary" runat="server" />
                <a href="Default.aspx">Cancelar</a>
            </div>
        </div>
    </div>
</asp:Content>
