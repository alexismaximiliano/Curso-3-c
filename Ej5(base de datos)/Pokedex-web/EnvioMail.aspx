<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EnvioMail.aspx.cs" Inherits="Pokedex_web.EnvioMail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-1"></div>
        <div class="col">
            <div class="mb-2">
                <h6>Email</h6>
                <asp:TextBox runat="server" ID="TxtEmail" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <h6>Asunto</h6>
                <asp:TextBox runat="server" ID="TxtAsunto" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <h6>Mensaje</h6>
                <asp:TextBox runat="server" ID="TxtMensaje" CssClass="form-control" TextMode="MultiLine" />
            </div>
            <div class="mb-3">
                <asp:Button Text="Enviar" CssClass="btn btn-primary" ID="BtnEnviar" OnClick="BtnEnviar_Click" runat="server" />
                <a href="Default.aspx">Cancelar</a>
            </div>
        </div>
        <div class="col"></div>
    </div>
</asp:Content>
