<%@ Page Title="ListaPokemon" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListaPokemon.aspx.cs" Inherits="Pokedex_web.ListaPokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h2>Lista Pokemon</h2>
    <div id="Filtro">
        <div class="row g-3 align-items-center">
            <div class="col-auto">
                <asp:Label ID="LblFiltro" runat="server" CssClass="col-form-label fs-6" Text="Filtro" />
            </div>
            <div class="col-auto">
                <asp:TextBox ID="TxtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="TxtFiltro_TextChanged" runat="server" />
            </div>
            <div class="col-3">
                <asp:CheckBox Text="Filtro avanzado" ID="ChkFiltroAvanzado" CssClass="form-check-input" AutoPostBack="true" OnCheckedChanged="ChkFiltroAvanzado_CheckedChanged" runat="server" />
            </div>
        </div>
    </div>
    <div id="Filtro Avanzado">
        <% if (ChkFiltroAvanzado.Checked)
            {%>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>

                <div class="row">
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Campo" ID="LblCampo" runat="server" />
                            <asp:DropDownList ID="DdlCampo" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="DdlCampo_SelectedIndexChanged" runat="server">
                                <asp:ListItem Text="Numero" />
                                <asp:ListItem Text="Nombre" />
                                <asp:ListItem Text="Tipo" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-3">
                        <asp:Label Text="Criterio" ID="LblCriterio" runat="server" />
                        <asp:DropDownList ID="DdlCriterio" CssClass="form-control" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="col-3">
                        <asp:Label Text="Filtro" ID="LblFiltroavazando" runat="server" />
                        <asp:TextBox CssClass="form-control" ID="TxtFiltroAvanzado" runat="server" />
                    </div>
                    <div class="col-3">
                        <asp:Label Text="Estado" ID="LblEstado" runat="server" />
                        <asp:DropDownList ID="DdlEstado" CssClass="form-control" runat="server">
                            <asp:ListItem Text="Todos" />
                            <asp:ListItem Text="Activado" />
                            <asp:ListItem Text="Desactivado" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Button Text="Buscar" ID="BtnBuscar" CssClass="btn btn-primary" OnClick="BtnBuscar_Click" runat="server" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <%}%>
    </div>
    <br />
    <div id="Lista">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:GridView ID="DgvPokemon" runat="server" CssClass="table" AutoGenerateColumns="false"
                    DataKeyNames="Id" OnSelectedIndexChanged="DgvPokemon_SelectedIndexChanged"
                    OnPageIndexChanging="DgvPokemon_PageIndexChanging" AllowPaging="true" PageSize="10">
                    <Columns>
                        <asp:BoundField HeaderText="Numero" DataField="Numero" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
                        <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
                        <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="editar" />
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <a href="FormularioPokemon.aspx" class="btn btn-primary">Agregar</a>
</asp:Content>
