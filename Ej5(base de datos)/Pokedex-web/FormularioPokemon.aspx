<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormularioPokemon.aspx.cs" Inherits="Pokedex_web.FormularioPokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <br />
    <div class="row">
        <div class="col-5">
            <div class=" g-3 align-items-center">
                <div class="col-auto">
                    <label for="LblId" class="col-form-label">Id</label>
                    <asp:TextBox runat="server" ID="TxtId" CssClass="form-control" />
                </div>
                <div class="col-auto">
                    <label for="LblNombre" class="col-form-label">Nombre</label>
                    <asp:TextBox runat="server" ID="TxtNombre" CssClass="form-control" />
                </div>
                <div class="col-auto">
                    <label for="LblNumero" class="col-form-label">Numero</label>
                    <asp:TextBox runat="server" ID="TxtNumero" CssClass="form-control" />
                </div>
                <div class="col-auto">
                    <label for="LblTipo" class="col-form-label">Tipo</label>
                    <asp:DropDownList ID="DdlTipo" CssClass="form-select" runat="server"></asp:DropDownList>
                </div>
                <div class="col-auto">
                    <label for="LblDebilidad" class="col-form-label">Debilidad</label>
                    <asp:DropDownList ID="DdlDebilidad" CssClass="form-select" runat="server"></asp:DropDownList>
                </div>
                <div class="col-auto">
                    <asp:Button ID="BtnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="BtnAgregar_Click" />
                    <a href="ListaPokemon.aspx">Cancelar</a>
                    <asp:Button Text="Desactivar" ID="BtnDesactivar" CssClass="btn btn-warning" OnClick="BtnDesactivar_Click" runat="server" />
                </div>
            </div>
        </div>

        <div class="col-5">
            <div class="g-3 align-items-center">
                <div class="col-auto">
                    <label for="LblDescripcion" class="col-form-label">Descripcion</label>
                    <asp:TextBox runat="server" ID="TxtDescripcion" CssClass="form-control" TextMode="MultiLine" />
                </div>
                <asp:UpdatePanel ID="UpdpImagen" runat="server">
                    <ContentTemplate>
                        <div class="col-auto">
                            <label for="LblImagen" class="col-form-label">URl Imagen</label>
                            <asp:TextBox runat="server" ID="TxtImagen" CssClass="form-control" AutoPostBack="true" OnTextChanged="TxtImagen_TextChanged" />
                        </div>
                        <asp:Image ImageUrl="https://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png" ID="ImgPokemon" Width="60%" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-5">
            <asp:UpdatePanel runat="server" ID="UpdEliminar">
                <ContentTemplate>

            <div class="col-auto">
                <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="BtnEliminar_Click" />
            </div>
            <%if (ConfirmarEliminacion)
                {%>
            <asp:CheckBox Text="Confimar Eliminacion" ID="ChkConfirmarEliminar" runat="server" />
            <asp:Button ID="BtnConfimarEliminar" runat="server" Text="Eliminar" OnClick="BtnConfimarEliminar_Click" CssClass="btn btn-outline-danger" />
            <% }
            %>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

</asp:Content>
