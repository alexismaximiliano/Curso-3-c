<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="WebApplication1.Detalles1" %>

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
        <div class="col-4" id="Foto">
            <div class="mb-3">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <label class="form-label visually-hidden">Url de Imagen</label>
                        <asp:TextBox runat="server" CssClass="form-control visually-hidden"
                            ID="TxtImagen" AutoPostBack="true" OnTextChanged="TxtImagen_TextChanged" />
                        </div>
                    <asp:Image ImageUrl="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"
                        runat="server" ID="ImgImagen" Width="70%" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div id="Botones">
            <div class="mb-3">
                <a href="Default.aspx" class="btn btn-primary">Inicio</a>
            </div>
        </div>
    </div>
</asp:Content>
