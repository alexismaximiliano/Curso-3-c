using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;


namespace Pokedex_web
{
    public partial class ListaPokemon : System.Web.UI.Page
    {
        public bool FiltroAvanzado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.esAdmin(Session["trainee"]))
            {
                Session.Add("error", "se necesita permiso de admin");
                Response.Redirect("PaginaError.aspx", false);
            }
            FiltroAvanzado = false;
            PokemonNegocio negocio = new PokemonNegocio();
            Session.Add("ListaPokemon", negocio.listarconSP());
            DgvPokemon.DataSource = Session["ListaPokemon"];
            DgvPokemon.DataBind();
        }

        protected void DgvPokemon_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = DgvPokemon.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioPokemon.aspx?id="+id);
        }
        protected void DgvPokemon_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DgvPokemon.PageIndex = e.NewPageIndex;
            DgvPokemon.DataBind();
        }

        protected void TxtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Pokemon> lista = (List<Pokemon>)Session["ListaPokemon"];
            List<Pokemon> listaFiltrada = lista.FindAll(x => x.Nombre.ToLower().Contains(TxtFiltro.Text.ToLower()));
            DgvPokemon.DataSource=listaFiltrada;
            DgvPokemon.DataBind();
        }

        protected void DdlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlCriterio.Items.Clear();
            if (DdlCampo.SelectedItem.ToString() == "Numero")
            {
                DdlCriterio.Items.Add("Igual a");
                DdlCriterio.Items.Add("Menor a");
                DdlCriterio.Items.Add("Mayor a");
            }
            else
            {
                DdlCriterio.Items.Add("contiene");
                DdlCriterio.Items.Add("comienza con");
                DdlCriterio.Items.Add("termina con");
            }
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                PokemonNegocio negocio = new PokemonNegocio();
                DgvPokemon.DataSource = negocio.filtrar(DdlCampo.SelectedItem.ToString(), DdlCriterio.SelectedItem.ToString(), TxtFiltroAvanzado.Text, DdlEstado.SelectedItem.ToString());
                DgvPokemon.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void ChkFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            FiltroAvanzado = ChkFiltroAvanzado.Checked;
            TxtFiltro.Enabled = !FiltroAvanzado;
        }
    }
}