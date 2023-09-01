<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row row-cols-1 row-cols-md-4 g-4">
        <% foreach (dominio.Articulos Articulo in ListaArticulos)
            {%>
        <div class="col">
            <div class="card">
                <img src="<%:Articulo.ImagenUrl %>" class="card-img-top ratio ratio-1x1" alt="..." height="300" width="300">
                <div class="card-body">
                    <h5 class="card-title"><%:Articulo.Nombre %></h5>
                    <p class="card-text">$ <%:Articulo.Precio%></p>
                    <a href="Detalles.aspx?Id=<%:Articulo.Id %>">Ver detalles</a>
                </div>
                <div id="Favoritos">
                    <div class="card-footer">
                        <a href="#"><small class="text-muted">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-heart" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 4.41c1.387-1.425 4.854 1.07 0 4.277C3.146 5.48 6.613 2.986 8 4.412z" />
                                <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z" />
                            </svg>
                            Añadir a favoritos</small></a>
                    </div>
                </div>
            </div>
        </div>
        <%} %>
    </div>
</asp:Content>
