<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="Pokedex_web.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .validacion {
            color: red;
            font-size: 12px;
        }
    </style>
    <script>
        function validar() {
            const TxtApellido = document.getElementById("TxtApellido");
            if (TxtApellido.value == "") {
                //console.log("error");
                TxtApellido.classList.add("is-invalid");
                TxtApellido.classList.remove("is-valid");
                return false;
            }
            TxtApellido.classList.remove("is-invalid");
            TxtApellido.classList.add("is-valid");
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <hr />
    <br />
    <h2>Mi perfil</h2>
    <div class="row">
        <div class="col-md-4">
            <div class="mb-3">
                <label>Email</label>
                <asp:TextBox runat="server" ID="TxtEmail" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label>Nombre</label>
                <asp:TextBox runat="server" ID="TxtNombre" CssClass="form-control" />
                <asp:RequiredFieldValidator CssClass="validacion" ErrorMessage="Nombre es requerido" ControlToValidate="TxtNombre" runat="server" />
            </div>
            <div class="mb-3">
                <label>Apellido</label>
                <asp:TextBox runat="server" ID="TxtApellido" ClientIDMode="Static" CssClass="form-control" />
                <asp:RangeValidator ErrorMessage="Fuera de rango" ControlToValidate="TxtApellido" Type="Integer" MinimumValue="1" MaximumValue="20" runat="server" />
                <asp:RegularExpressionValidator ErrorMessage="Solo numeros" ControlToValidate="TxtApellido" ValidationExpression="" runat="server" />
            </div>
            <div class="mb-3">
                <label>Fecha de nacimiento</label>
                <asp:TextBox runat="server" ID="TxtNacimiento" TextMode="Date" CssClass="form-control" />
            </div>
        </div>
        <div class="col-md-4">
            <div class="mb-3">
                <label>Imagen</label>
                <input id="TxtImagen" type="file" class="form-control" runat="server" />
            </div>
            <asp:Image ID="ImgNuevoPerfil" CssClass="img-fluid mb-2" ImageUrl="https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg" runat="server" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <asp:Button Text="Aceptar" CssClass="btn btn-primary" ID="BtnAceptar" OnClientClick="return validar()" OnClick="BtnAceptar_Click" runat="server" />
            <a href="Default.aspx">Cancelar</a>
        </div>
    </div>
</asp:Content>
