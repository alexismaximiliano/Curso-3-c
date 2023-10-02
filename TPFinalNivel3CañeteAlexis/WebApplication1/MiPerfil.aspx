<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="WebApplication1.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h1>Mi perfil</h1>
    <div class="row">
        <div class="col-3">
            <div class="mb-3">
                <label class="form-label">Email</label>
                <asp:TextBox class="form-control" ID="TxtEmail" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <asp:TextBox class="form-control" ID="TxtNombre" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Apellido</label>
                <asp:TextBox class="form-control" ID="TxtApellido" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="col-3">

            <div class="mb-3">
                <label class="form-label">Imagen de perfil</label>
                <input type="file" id="TxtImagen" class="form-control" runat="server" />
            </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:Image ID="ImgPerfil" CssClass="img-fluid mb-3" ImageUrl="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png" runat="server"></asp:Image>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
            <div class="mb-3">
                <asp:Button Text="Aceptar" CssClass="btn btn-primary" ID="BtnAceptar" OnClick="BtnAceptar_Click" runat="server" />
                <a href="Default.aspx">Cancelar</a>
            </div>
        </div>
    </div>
</asp:Content>
