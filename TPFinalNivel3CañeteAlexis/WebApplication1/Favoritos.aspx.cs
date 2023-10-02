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
    public partial class Favoritos : System.Web.UI.Page
    {
        public List<Articulos> ListaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FuncionesArticulos funcion = new FuncionesArticulos();
                FuncionesFavoritos funcionFavorito = new FuncionesFavoritos();
                FavoritosArticulos articulo = new FavoritosArticulos();
                Users usuario = (Users)Session["Usuario"];
                //string id = Request.QueryString["Id"];
                articulo.IdUser = usuario.Id;
                //articulo.IdArticulo = int.Parse(id);
                ListaArticulos = funcionFavorito.ListaFavoritos(usuario.Id);
                RepArticulos.DataSource = ListaArticulos;
                RepArticulos.DataBind();
            }
        }

        protected void BtnQuitarFav_Click(object sender, EventArgs e)
        {
            FuncionesFavoritos funcion = new FuncionesFavoritos();
            FavoritosArticulos articulo = new FavoritosArticulos();
            Users usuario = (Users)Session["Usuario"];
            articulo.IdUser = usuario.Id;
            Button btn = (Button)sender;
            int articuloid = int.Parse(btn.CommandArgument);
            articulo.IdArticulo = articuloid;
            funcion.EliminarFavoritos(articulo);
            //Page_Load(sender,e);
            Response.Redirect(Request.RawUrl);         
        }
    }
}