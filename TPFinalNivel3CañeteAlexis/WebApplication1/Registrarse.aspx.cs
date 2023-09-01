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
    public partial class Registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnCrear_Click(object sender, EventArgs e)
        {

            try
            {
                Users Usuario = new Users();
                FuncionesLogin funcion = new FuncionesLogin();
                Usuario.Email = TxtEmail.Text;
                Usuario.Pass = TxtContraseña.Text;
                Usuario.Id = funcion.NuevoUsuario(Usuario);
                Session.Add("Usuario", Usuario);
                Response.Redirect("MiPerfil.aspx", false); 
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}