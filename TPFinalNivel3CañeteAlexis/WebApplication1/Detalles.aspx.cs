using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Funciones;

namespace WebApplication1
{
    public partial class Detalles1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
          
        {
            //Request.QueryString.Clear();
            string id = Request.QueryString["id"];
            FuncionesArticulos Filtrar = new FuncionesArticulos();
            Articulos Articulo = (Filtrar.FiltrarporId(id))[0];
            TxtCodigo.Text= Articulo.Codigo;
            TxtNombre.Text= Articulo.Nombre;
            TxtDescripcion.Text = Articulo.Descripcion;
            TxtMarca.Text = Articulo.Marca.Descripcion;
            TxtCategoria.Text = Articulo.Categoria.Descripcion;
            TxtPrecio.Text = Articulo.Precio.ToString();
            TxtImagen.Text = Articulo.ImagenUrl;
            TxtImagen_TextChanged(sender, e);
        }

        protected void TxtImagen_TextChanged(object sender, EventArgs e)
        {
            ImgImagen.ImageUrl = TxtImagen.Text;
        }
    }
}
