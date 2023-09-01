<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="pruebas.aspx.cs" Inherits="WebApplication1.pruebas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col">
            <div class="mb-3">
                <label for="TxtId" class="form-label visually-hidden">Id</label>
                <asp:TextBox runat="server" ID="TxtId" CssClass="form-control visually-hidden" />
            </div>
            <div class="mb-3">
                <label for="TxtCodigo" class="form-label">Codigo</label>
                <asp:TextBox runat="server" ID="TxtCodigo" ReadOnly="true" CssClass="form-control" disabled="true" />
            </div>
            <div class="mb-3">
                <label for="TxtNombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="TxtNombre" ReadOnly="true" CssClass="form-control" disabled="true" />
            </div>
            <div class="mb-3">
                <label for="TxtDescripcion" class="form-label">Descripcion</label>
                <asp:TextBox runat="server" ID="TxtDescripcion" ReadOnly="true" TextMode="MultiLine" CssClass="form-control" disabled="true" />
            </div>
            <div class="mb-3">
                <label for="TxtPrecio" class="form-label">Precio</label>
                <asp:TextBox runat="server" ID="TxtPrecio" ReadOnly="true" Text="" CssClass="form-control" disabled="true" />
            </div>
            <div class="mb-3">
                <label for="TxtMarca" class="form-label">Marca</label>
                <asp:TextBox runat="server" ID="TxtMarca" ReadOnly="true" Text="" CssClass="form-control" disabled="true" />
            </div>
            <div class="mb-3">
                <label for="TxtCategoria" class="form-label">Categoria</label>
                <asp:TextBox runat="server" ID="TxtCategoria" ReadOnly="true" Text="" CssClass="form-control" disabled="true" />
            </div>
        </div>
        <div class="col">
            <div class="mb-3">
                <label class="form-label">Url de Imagen</label>
                <asp:TextBox runat="server" CssClass="form-control"
                    ID="TxtImagen" AutoPostBack="true" />
            </div>
        </div>
    </div>
</asp:Content>

<%--

    <div class="row">
    <div class="col">
        <div class="mb">
         ...
         ...
        </div>
    </div>
</div>

--%>

<%--virgulilla alt+126--%>


<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MostrarOcultarContraseña.aspx.cs" Inherits="MostrarOcultarContraseña" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mostrar/Ocultar Contraseña</title>
    <script>
        function togglePassword() {
            var passwordField = document.getElementById('<%= passwordTextBox.ClientID %>');
            var showPasswordCheckbox = document.getElementById("showPasswordCheckbox");

            if (showPasswordCheckbox.checked) {
                passwordField.type = "text";
            } else {
                passwordField.type = "password";
            }
        }
    </script>
</head>
<body>
    <form runat="server">
        <div>
            <label for="<%= passwordTextBox.ClientID %>">Contraseña:</label>
            <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password"></asp:TextBox>
            <input type="checkbox" id="showPasswordCheckbox" onchange="togglePassword()">
            <label for="showPasswordCheckbox">Mostrar Contraseña</label>
        </div>
    </form>
</body>
</html>--%>
