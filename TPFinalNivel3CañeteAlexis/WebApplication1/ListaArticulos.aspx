<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ListaArticulos.aspx.cs" Inherits="WebApplication1.ListaArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div id="Filtro">
                <div class="row">
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:TextBox ID="TxtFiltro" placeholder="Buscar" AutoPostBack="true" CssClass="form-control" OnTextChanged="TxtFiltro_TextChanged" runat="server" />
                        </div>
                    </div>
                    <div class="col-1">
                        <div class="lead">
                            <asp:ImageButton ImageUrl="https://cdn-icons-png.flaticon.com/256/107/107122.png" ID="ImgFiltrar" Height="16px" Width="16px" runat="server" />
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:CheckBox Text="Filtro" ID="ChkFiltroAvazando" CssClass="form-check" AutoPostBack="true" OnCheckedChanged="ChkFiltroAvazando_CheckedChanged" runat="server" />
                        </div>
                    </div>
                </div>
            </div>



            <div id="FiltroAvanzado">

                <%if (ChkFiltroAvazando.Checked)
                    {  %>
                <div class="row">
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:DropDownList runat="server" ID="DdlCampo" AutoPostBack="true" CssClass="form-select" OnSelectedIndexChanged="DdlCampo_SelectedIndexChanged">
                                <asp:ListItem Text="Precio" />
                                <asp:ListItem Text="Categoria" />
                                <asp:ListItem Text="Marca" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:DropDownList runat="server" ID="DdlCriterio" CssClass="form-select"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:TextBox runat="server" ID="TxtFiltroAvazando" CssClass="form-control" Placeholder="Filtrar" />
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Button Text="Filtrar" CssClass="btn btn-primary" ID="BtnFiltrar" OnClick="BtnFiltrar_Click" runat="server" />
                        </div>
                    </div>
                </div>
                <%} %>
            </div>
            <div id="Lista">
                <div class="row">
                    <asp:GridView ID="DgvListaArticulos" runat="server" CssClass="table table-striped" AutoGenerateColumns="false"
                        DataKeyNames="Id" OnSelectedIndexChanged="DgvListaArticulos_SelectedIndexChanged"
                        OnPageIndexChanging="DgvListaArticulos_PageIndexChanging" AllowPaging="true" PageSize="6">
                        <Columns>
                            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                            <asp:BoundField HeaderText="Precio" DataField="Precio" />
                            <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion" />
                            <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
                            <asp:CommandField HeaderText="Modificar" ShowSelectButton="true" SelectText="✍️" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <div id="Botones">
                <div class="row">
                    <a href="NuevooModi.aspx" class="btn btn-primary col-1">Agregar</a>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
