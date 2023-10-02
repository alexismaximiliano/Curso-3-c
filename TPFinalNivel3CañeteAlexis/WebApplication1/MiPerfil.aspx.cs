using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Funciones;
using dominio;
using System.Web.SessionState;

namespace WebApplication1
{
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Seguridad.SessionActiva(Session["Usuario"]))
                    {
                        Users Usuario = (Users)Session["Usuario"];
                        TxtEmail.Text = Usuario.Email;
                        TxtEmail.ReadOnly = true;
                        TxtNombre.Text = Usuario.Nombre;
                        TxtApellido.Text = Usuario.Apellido;
                        if (!string.IsNullOrEmpty(Usuario.UrlImagenPerfil))
                            ImgPerfil.ImageUrl = "~/Images/" + Usuario.UrlImagenPerfil;
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
            }
        }

        protected void BtnAceptar_Click(object sender, EventArgs e)
        {

            try
            {
                FuncionesLogin funcion = new FuncionesLogin();
                Users usuario = (Users)Session["Usuario"];
                if (TxtImagen.PostedFile.FileName != "")
                {
                string ruta = Server.MapPath("./Images/");
                TxtImagen.PostedFile.SaveAs(ruta + "perfil-" + usuario.Id+".jpg");
                usuario.UrlImagenPerfil = "perfil-" + usuario.Id + ".jpg";
                }
                usuario.Nombre = TxtNombre.Text;
                usuario.Apellido = TxtApellido.Text;
                funcion.Actualizarperfil(usuario);
                Image img=(Image)Master.FindControl("ImgAvatar");
                img.ImageUrl = "~/Images/" + usuario.UrlImagenPerfil;
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
            }
        }
    }
}