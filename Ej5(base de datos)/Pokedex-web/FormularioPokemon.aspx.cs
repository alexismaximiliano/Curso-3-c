using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace Pokedex_web
{
    public partial class FormularioPokemon : System.Web.UI.Page
    {
        public bool ConfirmarEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            TxtId.Enabled = false;
            ConfirmarEliminacion = false;
            try
            {
                //nuevo pokemon
                if (!IsPostBack)
                {
                    ElementoNegocio negocio = new ElementoNegocio();
                    List<Elemento> lista = negocio.listar();
                    DdlTipo.DataSource = lista;
                    DdlTipo.DataValueField = "Id";
                    DdlTipo.DataTextField = "Descripcion";
                    DdlTipo.DataBind();
                    DdlDebilidad.DataSource = lista;
                    DdlDebilidad.DataValueField = "Id";
                    DdlDebilidad.DataTextField = "Descripcion";
                    DdlDebilidad.DataBind();
                }
                //modificar
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    PokemonNegocio negocio = new PokemonNegocio();
                    Pokemon selecionado = (negocio.listar(id))[0];
                    Session.Add("PokeSelecionado", selecionado);
                    //cargar los datos 
                    TxtId.Text = id;
                    TxtNombre.Text = selecionado.Nombre;
                    TxtDescripcion.Text = selecionado.Descripcion;
                    TxtImagen.Text = selecionado.UrlImagen;
                    TxtNumero.Text = selecionado.Numero.ToString();
                    DdlTipo.SelectedValue = selecionado.Tipo.Id.ToString();
                    DdlDebilidad.SelectedValue = selecionado.Debilidad.Id.ToString();
                    TxtImagen_TextChanged(sender, e);
                    //configurar acciones
                    if (!selecionado.Activo)
                    {
                        BtnDesactivar.Text = "Activar";
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
                //pantalla error
            }
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                Pokemon nuevo = new Pokemon();
                PokemonNegocio negocio = new PokemonNegocio();
                nuevo.Numero = int.Parse(TxtNumero.Text);
                nuevo.Nombre = TxtNombre.Text;
                nuevo.Descripcion = TxtDescripcion.Text;
                nuevo.UrlImagen = TxtImagen.Text;
                nuevo.Tipo = new Elemento();
                nuevo.Tipo.Id = int.Parse(DdlTipo.SelectedValue);
                nuevo.Debilidad = new Elemento();
                nuevo.Debilidad.Id = int.Parse(DdlDebilidad.SelectedValue);
                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(TxtId.Text);
                    negocio.modificarconSP(nuevo);
                }
                else
                    negocio.agregarconSP(nuevo);
                Response.Redirect("ListaPokemon.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }
        //seguir crear pokemon min 10 mas menos
        protected void TxtImagen_TextChanged(object sender, EventArgs e)
        {
            ImgPokemon.ImageUrl = TxtImagen.Text;
        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmarEliminacion = true;
        }

        protected void BtnConfimarEliminar_Click(object sender, EventArgs e)
        {
            if (ChkConfirmarEliminar.Checked)
            {

                try
                {
                    PokemonNegocio negocio = new PokemonNegocio();
                    negocio.eliminar(int.Parse(TxtId.Text));
                    Response.Redirect("ListaPokemon.aspx");
                }
                catch (Exception ex)
                {
                    Session.Add("error", ex);
                    throw;
                }
            }
        }

        protected void BtnDesactivar_Click(object sender, EventArgs e)
        {
            try
            {
                PokemonNegocio negocio = new PokemonNegocio();
                Pokemon selecionado = (Pokemon)Session["PokeSelecionado"];
                negocio.eliminarLogico(selecionado.Id, !selecionado.Activo);
                Response.Redirect("ListaPokemon.aspx");
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }
    }
}