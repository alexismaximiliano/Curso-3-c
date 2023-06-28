<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ej3_Bootstrap.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="head">
        <hr />
        <h2 class="text-center">Alexis Cañete</h2>
        <asp:Image src="https://w7.pngwing.com/pngs/741/68/png-transparent-user-computer-icons-user-miscellaneous-cdr-rectangle-thumbnail.png" ID="ImagenPerfil" CssClass="rounded mx-auto d-block" Width="150px" runat="server" />
    </div>
    <div class="body">
        <div class="sobre mi">
        <hr />
            <h3 class="text-center">Sobre Mi</h3>
            <p class="fs-4 text-start badge bg-secondary text-wrap  rounded mx-auto d-block" style="width: 700px;">me llamo alexis cañete tengo 25 años y vivo en buenos aires. Estoy estudiando un curso orientado a c#,tambien tengo conocimientos orientados a programacion en html y c++. Trabajo a tiempo parcial en un comercio de barrio y estoy dispuiesto a trabajar en el ambito imformatico.</p>
            <p></p>
        </div>
        <div class="aptitudes">
            <h3 class="text-center">Aptitudes</h3>
            <p class="text-center">Tecnologias en las que tengo conocimiento</p>
            <asp:Image ID="ImagenCsharp" CssClass="rounded float-start" style="width:300px" src="https://desarrolloweb.com/storage/tag_images/actual/BzOL16MEqsKOe0VThjF6FXPBi0uyK16lkTety9Wz.png" runat="server" />
            <asp:Image ID="ImagenCmasmas" CssClass="rounded float-center" style="width:300px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/ISO_C%2B%2B_Logo.svg/200px-ISO_C%2B%2B_Logo.svg.png" runat="server" />
            <asp:Image ID="ImagenPuntonet" CssClass="rounded float-end" style="width:300px" src="https://s3-ap-southeast-1.amazonaws.com/homepage-media/wp-content/uploads/2020/03/04092434/NET_Core_Logo.png" runat="server" />
            <asp:Image ID="ImagenHtml" CssClass="rounded float-center" style="width:300px" src="https://geoinnova.org/wp-content/uploads/2021/08/logos.png" runat="server" />
        </div>
    </div>
</asp:Content>
