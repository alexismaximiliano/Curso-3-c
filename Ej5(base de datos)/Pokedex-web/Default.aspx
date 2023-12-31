﻿<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Pokedex_web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Inicio!</h1>
    <p>practica de base de datos con pokedex...</p>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <asp:Repeater ID="RepRepetidor" runat="server">
            <ItemTemplate>
                <div class="col">
                    <div class="card">
                        <img src="<%#Eval("UrlImagen") %>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("Nombre")  %></h5>
                            <p class="card-text"><%#Eval("Descripcion")  %></p>
                            <asp:Button ID="BtnDetalles" CssClass="btn btn-primary" runat="server" Text="Ver detalles" CommandArgument='<%#Eval("Id") %>' CommandName="PokemonId" OnClick="BtnDetalles_Click" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        </div>
</asp:Content>
