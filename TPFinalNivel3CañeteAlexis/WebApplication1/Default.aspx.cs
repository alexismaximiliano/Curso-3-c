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
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulos> ListaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            FuncionesArticulos funcion = new FuncionesArticulos();
            ListaArticulos = funcion.listarconSP();
        }
    }
}