<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ejercicio_2.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
            <h1>Portfolio</h1>         
            </header>
        </div>
        <div>
            <h2>Alexis Cañete</h2>
            <img style="width:200px" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png" alt="Foto" />
            <h3>Sobre mi</h3>
            <p>Estoy estudiando un curso orientado a c#,tambien tengo conocimientos orientados a programacion en html y c++.</p> 
        <p>trabajo a tiempo parcial en un comercio de barrio y estoy dispuiesto a trabajar en el ambito imformatico.</p>
            <h3>Aptitudes</h3>
            <table>
                <tr>
                    <td>
                    <img src="https://desarrolloweb.com/storage/tag_images/actual/BzOL16MEqsKOe0VThjF6FXPBi0uyK16lkTety9Wz.png" alt="C#" />
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/ISO_C%2B%2B_Logo.svg/200px-ISO_C%2B%2B_Logo.svg.png" alt="C++" />
                    <img style="width:200px" src ="https://s3-ap-southeast-1.amazonaws.com/homepage-media/wp-content/uploads/2020/03/04092434/NET_Core_Logo.png" alt="Alternate Text" />
                    </td>
                </tr>
            </table>           
            <h3>Cursos Realizados</h3>
            <ul>
                <li>Curso de programacion con C# nivel 1</li>
                <li>Curso de programacion con C# nivel 2:POO + .NET + SQL</li>
                <li>Curso de programacion con C# nivel 3:Web ASP .NET parte 1 (en curso)</li>
            </ul>
            <h3>Mis proyectos</h3>
            <table>
                <tr>
                    <td>
                    <h4>Numeros pares</h4>
                    <p>contador y mostrador de numeros impares y pares de una lista dada</p>
                        <button><a href="https://github.com/alexismaximiliano/curso-1-c-/tree/main/ejercicios/TPFinal_Ca%C3%B1ete">GitHub</a></button>
                    </td>
                    <td>
                    <h4>Lista de articulos</h4>
                    <p>programa que muestra una lista de articulos leia de una base de datos y permite filtrar,añadir,modificar o eliminar los articulos</p>
                    <button><a href="https://github.com/alexismaximiliano/curso-2-c/tree/main/TPFinalNivel2_Ca%C3%B1eteAlexis">GitHub</a></button>
                    </td>
                </tr>
            </table>            
        </div>
    </form>
</body>
</html>
