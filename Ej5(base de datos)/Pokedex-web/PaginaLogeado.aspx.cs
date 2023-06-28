using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pokedex_web
{
    public partial class PaginaLogeado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Session.Add("error", "Debes logearte para ingresar");
                Response.Redirect("PaginaError.aspx",false);
            }
        }

        protected void BtnPagina1_Click(object sender, EventArgs e)
        {

        }

        protected void BtnPagina2_Click(object sender, EventArgs e)
        {

        }
    }
}