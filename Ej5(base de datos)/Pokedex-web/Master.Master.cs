using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace Pokedex_web
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                ImgAvatar.ImageUrl = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
                if (!(this.Page is Login || Page is Registro || Page is Default ||Page is PaginaError))
                {
                    if (!(Seguridad.sesionActiva(Session["trainee"])))
                        Response.Redirect("Login.aspx", false);
                    else
                    {
                        Trainee user = (Trainee)Session["trainee"];
                        LblUser.Text = user.Email;
                        if (!string.IsNullOrEmpty(user.ImagenPerfil))
                            ImgAvatar.ImageUrl = "~/Images/" + user.ImagenPerfil;
                    }
                }
            }
        }
        protected void BtnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx", false);
        }
    }
}