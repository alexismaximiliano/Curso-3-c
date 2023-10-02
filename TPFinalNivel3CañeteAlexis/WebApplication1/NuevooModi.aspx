<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="NuevooModi.aspx.cs" Inherits="WebApplication1.Detalles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div class="mb-3"></div>
    <div class="row">
        <div class="col-auto"></div>
        <div id="Formulario" class="col-4">
            <div class="mb-3">
                <label for="TxtId" class="form-label visually-hidden">Id</label>
                <asp:TextBox runat="server" ID="TxtId" CssClass="form-control visually-hidden" />
            </div>
            <div class="mb-3">
                <label for="TxtCodigo" class="form-label">Codigo</label>
                <asp:TextBox runat="server" ID="TxtCodigo" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="TxtNombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="TxtNombre" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="TxtDescripcion" class="form-label">Descripcion</label>
                <asp:TextBox runat="server" ID="TxtDescripcion" TextMode="MultiLine" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="TxtPrecio" class="form-label">Precio</label>
                <asp:TextBox runat="server" ID="TxtPrecio" Text="" CssClass="form-control" />
                <%--<asp:RangeValidator ErrorMessage="Precio fuera de rango"CssClass="form-label link-danger fs-5" Type="Integer" MinimumValue="0" MaximumValue="99999999" ControlToValidate="TxtPrecio" runat="server" />--%>
                <asp:RegularExpressionValidator ErrorMessage="Formato incorrecto" CssClass="form-label link-danger fs-5" ValidationExpression="^[0-9]+$" ControlToValidate="TxtPrecio" runat="server" />
            </div>
            <div class="mb-3">
                <label for="DdlMarca" class="form-label">Marca</label>
                <asp:DropDownList ID="DdlMarca" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="DdlCategoria" class="form-label">Categoria</label>
                <asp:DropDownList ID="DdlCategoria" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
        </div>
        <div class="col-4" id="Imagen">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <label class="form-label">Url de Imagen</label>
                        <asp:TextBox runat="server" CssClass="form-control"
                            ID="TxtImagen" AutoPostBack="true" OnTextChanged="TxtImagen_TextChanged" />
                    </div>
                    <asp:Image ImageUrl="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"
                        runat="server" ID="ImgImagen" Width="70%" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="Botones">
            <div class="mb-3">
                <asp:Button Text="Aceptar" ID="BtnAceptar" CssClass="btn btn-primary" OnClick="BtnAceptar_Click" runat="server" />
                <a href="ListaArticulos.aspx">Cancelar</a>
                <div class="row">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <% string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                                if (id != "" && !IsPostBack)
                                {  %>
                            <asp:Button Text="Eliminar" ID="BtnEliminar" CssClass="btn btn-outline-danger" OnClick="BtnEliminar_Click" runat="server" />
                            <% if (ConfirmacionEliminar)
                                {%>
                            <asp:CheckBox Text="Confirmar Eliminacion ?" ID="ChkConfirmacionEliminacion" runat="server" />
                            <asp:Button Text="Eliminar" ID="BtnConfirmadoEliminar" CssClass="btn btn-danger" OnClick="BtnConfirmadoEliminar_Click" runat="server" />
                            <%}
                                }%>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


