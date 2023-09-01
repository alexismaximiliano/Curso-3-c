<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="WebApplication1.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row mb-3">
        <h1>hubo un error</h1>
        <asp:Label Text="text" CssClass="form-label h4" ID="LblMensaje" runat="server" />
    </div>
    <div class="row">
        <div class="mb-3">
            <input type="button" class="btn btn-primary" value="Página anterior" onclick="history.go(-1);">
        </div>
    </div>
</asp:Content>
