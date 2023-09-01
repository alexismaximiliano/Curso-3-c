using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;

namespace WebApplication1
{
    public partial class pruebas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnaceptar_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx", false);
            //probar imagen perfil con url
            //input solo funciona en chrome
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }
    }
}

//Session.Add("Error", ex);
//Response.Redirect("Error.aspx", false);