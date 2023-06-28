<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PaginaLogeado.aspx.cs" Inherits="Pokedex_web.PaginaLogeado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Logeado correctamente</h2>
    <hr />
    <div class="row">
        <div class="col-4">
            <asp:Button Text="Pagina 1" ID="BtnPagina1" CssClass="btn btn-primary" OnClick="BtnPagina1_Click" runat="server" />
        </div>
        <div class="col-4">
            <% if (Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).TipoUsuario == dominio.TipoUsuario.ADMIN)
                {  %>
            <asp:Button Text="Pagina 2" ID="BtnPagina2" CssClass="btn btn-primary" OnClick="BtnPagina2_Click" runat="server" />
            <p>tenes que ser admin</p>
            <%} %>
        </div>
    </div>
</asp:Content>
