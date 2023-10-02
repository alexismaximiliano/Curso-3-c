<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="WebApplication1.Favoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SciptManager1" runat="server" />
    <h2>Mis articulos favoritos</h2>
    <br />

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row row-cols-1 row-cols-md-4 g-4">




                <asp:Repeater runat="server" ID="RepArticulos">
                    <ItemTemplate>
                        <div class="col">
                            <div class="card">
                                <img src="<%#Eval("ImagenUrl") %>" class="card-img-top ratio ratio-1x1" alt="ImagenArticulo" style="max-height: 300px; max-width: 300px">
                                <div class="card-body">
                                    <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                    <p class="card-text">$ <%#Eval("Precio")%></p>
                                    <a href="Detalles.aspx?Id=<%#Eval("Id") %>">Ver detalles</a>
                                </div>
                                <div id="Favoritos">
                                    <div class="card-footer">
                                        <div class="card-footer d-grid gap-2">
                                            <asp:Button ID="BtnQuitarFav" CssClass="btn btn-secondary" runat="server" OnClick="BtnQuitarFav_Click" CommandArgument='<%#Eval("Id") %>' Text="Quitar de Favoritos" />
                                        </div>
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
