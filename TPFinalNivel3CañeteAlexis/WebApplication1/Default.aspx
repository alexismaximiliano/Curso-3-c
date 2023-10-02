<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <button class="btn btn-primary mb-3" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">Filtrar</button>

    <div class="offcanvas offcanvas-start" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasScrollingLabel">Filtros</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <p></p>
        </div>
    </div>
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasWithBackdrop" aria-labelledby="offcanvasWithBackdropLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasWithBackdropLabel">Offcanvas con backdrop</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <p>.....</p>
        </div>
    </div>



    <div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">Filtrar</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row-cols-auto">
                        <div class="col-auto">
                            <div class="mb-3">
                                <asp:DropDownList runat="server" ID="DdlCampo" AutoPostBack="true" OnSelectedIndexChanged="DdlCampo_SelectedIndexChanged" CssClass="form-select">
                                    <asp:ListItem Text="Precio" />
                                    <asp:ListItem Text="Categoria" />
                                    <asp:ListItem Text="Marca" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-auto">
                            <div class="mb-3">
                                <asp:DropDownList runat="server" ID="DdlCriterio" CssClass="form-select"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-auto">
                            <div class="mb-3">
                                <asp:TextBox runat="server" ID="TxtFiltroAvazando" CssClass="form-control" Placeholder="Filtrar" />
                            </div>
                        </div>
                        <div class="col-auto">
                            <div class="mb-3">
                                <asp:Button Text="Filtrar" CssClass="btn btn-primary" ID="BtnFiltrar" OnClick="BtnFiltrar_Click" runat="server" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="row row-cols-1 row-cols-md-4 g-4">
                <asp:Repeater runat="server" ID="RepArticulos">
                    <ItemTemplate>
                        <div class="col">
                            <div class="card">
                                <img src="<%#Eval("ImagenUrl") %>" class="card-img-top ratio ratio-1x1" alt="Imagen Articulo" style="max-height: 300px; max-width: 300px">
                                <div class="card-body">
                                    <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                    <p class="card-text">$ <%#Eval("Precio")%></p>
                                    <a href="Detalles.aspx?Id=<%#Eval("Id") %>">Ver detalles</a>
                                </div>
                                <div id="Favoritos">
                                    <div class="card-footer d-grid gap-2">
                                        <asp:Button ID="BtnFavoritos" CssClass="btn btn-secondary" runat="server" ClientIDMode="Static" OnClientClick="return AlertaFavorito()" OnClick="BtnFavoritos_Click" CommandArgument='<%#Eval("Id") %>' Text="Añadir a favoritos ♡" />                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

