using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using Funciones;

namespace WebApplication1
{
    public partial class ListaArticulos : System.Web.UI.Page
    {
        //public bool FiltroAvanzado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //FiltroAvanzado=ChkFiltroAvazando.Checked;
            //!postback
            
            FuncionesArticulos funcion = new FuncionesArticulos();
            Session.Add("ListadeArticulos", funcion.listarconSP());
            DgvListaArticulos.DataSource = Session["ListadeArticulos"];
            DgvListaArticulos.DataBind();
        }
        protected void DgvListaArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = DgvListaArticulos.SelectedDataKey.Value.ToString();
            Response.Redirect("NuevooModi.aspx?id=" + id);
        }
        protected void DgvListaArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DgvListaArticulos.PageIndex = e.NewPageIndex;
            DgvListaArticulos.DataBind();
        }
        protected void ImgFiltrar_Click(object sender, ImageClickEventArgs e)
        {
        }
        protected void TxtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Articulos> lista = (List<Articulos>)Session["ListadeArticulos"];
            List<Articulos> listafiltrada = lista.FindAll(x => x.Nombre.ToLower().Contains(TxtFiltro.Text.ToLower()));
            DgvListaArticulos.DataSource= listafiltrada;
            DgvListaArticulos.DataBind();
        }
        protected void ChkFiltroAvazando_CheckedChanged(object sender, EventArgs e)
        {
            //FiltroAvanzado = ChkFiltroAvazando.Checked;
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
                DgvListaArticulos.DataSource = funcion.filtrar(DdlCampo.Text.ToString(),DdlCriterio.Text.ToString(),TxtFiltroAvazando.Text.ToString());
                DgvListaArticulos.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                throw;
            }
        }
    }
}