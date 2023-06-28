using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace Pokedex_web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
            Trainee trainee = new Trainee();
            TraineeNegocio negocio = new TraineeNegocio();
            try
            {
                if (Validacion.ValidaTextoVacio(TxtUsuario)|| Validacion.ValidaTextoVacio(TxtContraseña))
                {
                    Session.Add("error", "ingresar usuario  o  contraseña");
                    Response.Redirect("PaginaError.aspx");
                }
                trainee.Email = TxtUsuario.Text;
                trainee.Pass = TxtContraseña.Text;
                if (negocio.Login(trainee))
                {
                    Session.Add("trainee", trainee);
                    Response.Redirect("MiPerfil.aspx", false);
                }
                else
                {
                    Session.Add("error", "user o contraseña incorrectos");
                    Response.Redirect("PaginaError.aspx");
                }
            }
            catch(System.Threading.ThreadAbortException ex) { }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("PaginaError.aspx", false);
            }
        }
        private void Page_Error(object sender, EventArgs e)
        {
            //eror de pagina(3 nivel)
            Exception exc = Server.GetLastError();
            if (exc is HttpUnhandledException)
            {
                Session.Add("error", exc.ToString());
                // Pass the error on to the error page.
                Server.Transfer("PaginaError.aspx");
            }
        }
    }
}