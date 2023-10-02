using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Funciones;
using dominio;

namespace WebApplication1
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ImgAvatar.ImageUrl = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";
            if (!(Page is Login || Page is Default || Page is Registrarse || Page is Error || Page is Detalles))
            {
                if (!Seguridad.SessionActiva(Session["Usuario"]))
                    Response.Redirect("login.aspx", false);
                else
                {
                    Users Usuario = (Users)Session["Usuario"];
                    //LblNombre.Text = Usuario.Nombre;
                    if (!string.IsNullOrEmpty(Usuario.UrlImagenPerfil))
                    ImgAvatar.ImageUrl = "~/Images/" + Usuario.UrlImagenPerfil;
                }
            }
            //if (Seguridad.SessionActiva(Session["Usuario"]))

            //    ImgAvatar.ImageUrl = "~/Images/" + ((Users)Session["Usuario"]).UrlImagenPerfil;
            //else
            //    ImgAvatar.ImageUrl = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";
        }

        protected void BtnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx", false);
        }
    }
}