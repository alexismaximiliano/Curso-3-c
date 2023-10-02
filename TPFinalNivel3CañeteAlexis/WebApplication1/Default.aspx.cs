using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using Funciones;
using WebApplication1;

namespace WebApplication1
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulos> ListaArticulos { get; set; }
        public List<Articulos> ListaFiltrada { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FuncionesArticulos funcion = new FuncionesArticulos();
                ListaArticulos = funcion.listarconSP();
                RepArticulos.DataSource = ListaArticulos;
                RepArticulos.DataBind();
            }

        }

        protected void DdlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlCriterio.Items.Clear();
            if (DdlCampo.SelectedItem.ToString() == "Precio")
            {
                DdlCriterio.Items.Add("Mayor a:");
                DdlCriterio.Items.Add("igual a:");
                DdlCriterio.Items.Add("Menor a:");
            }
            else
            {
                DdlCriterio.Items.Add("Comienza con:");
                DdlCriterio.Items.Add("Contiene:");
                DdlCriterio.Items.Add("Termina con:");
            }
        }

        protected void BtnFiltrar_Click(object sender, EventArgs e)
        {
            try
            {
                FuncionesArticulos funcion = new FuncionesArticulos();
                ListaFiltrada = funcion.filtrar(DdlCampo.Text.ToString(), DdlCriterio.Text.ToString(), TxtFiltroAvazando.Text);
                ListaArticulos = ListaFiltrada;


            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                throw;
            }
        }

        protected void BtnFavoritos_Click(object sender, EventArgs e)
        {
            FuncionesFavoritos funcion = new FuncionesFavoritos();
            FavoritosArticulos nuevo = new FavoritosArticulos();
            Users usuario = (Users)Session["Usuario"];
            Button btn = (Button)sender;
            int articuloid = int.Parse(btn.CommandArgument);
            nuevo.IdArticulo = articuloid;
            nuevo.IdUser = usuario.Id;
            if (funcion.ContarFavoritos(nuevo))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
               "alert", "alert('Agregado a favoritos');window.location ='Default.aspx';", true);
                funcion.AñadirFavoritos(nuevo);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
               "alert", "alert('El articulo ya se encuentra en su lista de favoritos');window.location ='Default.aspx';", true);
            }
        }
    }
}
