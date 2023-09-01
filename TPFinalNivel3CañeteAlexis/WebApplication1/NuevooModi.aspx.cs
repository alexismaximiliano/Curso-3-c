using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebSockets;
using dominio;
using Funciones;

namespace WebApplication1
{
    public partial class Detalles : System.Web.UI.Page
    {
        public bool ConfirmacionEliminar { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            ConfirmacionEliminar = false;
            if (!Seguridad.EsAdmin(Session["Usuario"]))
            {
                Session.Add("Error", "necesitas ser Admin");
                Response.Redirect("Error.aspx", false);
            }
            try
            {
                if (!IsPostBack)//Inicio
                {
                    FuncionesArticulos funcion = new FuncionesArticulos();
                    DdlMarca.DataSource = funcion.listarconSP();
                    DdlMarca.DataValueField = "Id";
                    DdlMarca.DataTextField = "Marca";
                    DdlMarca.DataBind();
                    DdlCategoria.DataSource = funcion.listarconSP();
                    DdlCategoria.DataValueField = "Id";
                    DdlCategoria.DataTextField = "Categoria";
                    DdlCategoria.DataBind();
                }

                //Modificando
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    FuncionesArticulos funcion = new FuncionesArticulos();
                    Articulos filtrado = (funcion.FiltrarporId(id))[0];
                    TxtId.Text = filtrado.Id.ToString();
                    TxtCodigo.Text = filtrado.Codigo;
                    TxtNombre.Text = filtrado.Nombre;
                    TxtDescripcion.Text = filtrado.Descripcion;
                    TxtPrecio.Text = filtrado.Precio.ToString();
                    DdlMarca.SelectedValue = filtrado.Marca.Id.ToString();
                    DdlCategoria.SelectedValue = filtrado.Categoria.Id.ToString();
                    TxtImagen.Text = filtrado.ImagenUrl;
                    TxtImagen_TextChanged(sender, e);
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                Response.Redirect("Error.aspx", false);
            }
        }
        protected void BtnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Articulos articulo = new Articulos();
                FuncionesArticulos funcion = new FuncionesArticulos();
                articulo.Codigo = TxtCodigo.Text;
                articulo.Nombre = TxtNombre.Text;
                articulo.Descripcion = TxtDescripcion.Text;
                articulo.Marca = new Marcas();
                articulo.Marca.Id = int.Parse(DdlMarca.SelectedValue);
                articulo.Categoria = new Categorias();
                articulo.Categoria.Id = int.Parse(DdlCategoria.SelectedValue);
                articulo.ImagenUrl = TxtImagen.Text;
                articulo.Precio = decimal.Parse(TxtPrecio.Text);
                if (Request.QueryString["id"] != null)
                {
                    articulo.Id = int.Parse(Request.QueryString["id"].ToString());
                    funcion.ModificarconSP(articulo);
                }
                else
                    funcion.AgregarconSP(articulo);
                Response.Redirect("ListaArticulos.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                Response.Redirect("Error.aspx", false);
            }
        }
        protected void TxtImagen_TextChanged(object sender, EventArgs e)
        {
            ImgImagen.ImageUrl = TxtImagen.Text;
        }
        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmacionEliminar = true;
        }
        protected void BtnConfirmadoEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (ChkConfirmacionEliminacion.Checked)
                {                   
                    FuncionesArticulos funcion = new FuncionesArticulos();
                    funcion.eliminar(int.Parse(TxtId.Text));
                    Response.Redirect("ListaArticulos.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                Response.Redirect("Error.aspx", false);
            }
        }      
    }
}