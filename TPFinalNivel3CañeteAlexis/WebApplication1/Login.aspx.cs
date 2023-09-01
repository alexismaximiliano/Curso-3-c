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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
            Users usuario=new Users();
            FuncionesLogin funcion = new FuncionesLogin();
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;
                if (Validaciones.TextoVacio(TxtEmail.Text)||Validaciones.TextoVacio(TxtContraseña.Text))
                {
                    Session.Add("Error", "Completar ambos campos");
                    Response.Redirect("Error.aspx");
                }
                usuario.Email = TxtEmail.Text;
                usuario.Pass = TxtContraseña.Text;
                if (funcion.Login(usuario))
                {
                    Session.Add("usuario",usuario);
                    Response.Redirect("ListaArticulos.aspx",false);
                }
                else
                {
                    Session.Add("Error", "email o contraseña incorrecta");
                    Response.Redirect("Error.aspx",false);
                }
            }
            catch(System.Threading.ThreadAbortException ex) { }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}