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
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Seguridad.sesionActiva(Session["trainee"]))
                    {
                        Trainee user = (Trainee)Session["trainee"];
                        TxtEmail.Text = user.Email;
                        TxtEmail.ReadOnly = true;
                        TxtNombre.Text = user.Nombre;
                        TxtApellido.Text = user.Apellido;
                        TxtNacimiento.Text = user.FechaNacimiento.ToString("yyyy-MM-dd");
                        if (string.IsNullOrEmpty(user.ImagenPerfil))
                            ImgNuevoPerfil.ImageUrl = "~/Images/" + user.ImagenPerfil;
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }

        protected void BtnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;
                TraineeNegocio negocio = new TraineeNegocio();
                Trainee user = (Trainee)Session["trainee"];
                //escribir imagen
                if (TxtImagen.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("./Images/");
                    TxtImagen.PostedFile.SaveAs(ruta + "perfil-" + user.Id + ".jpg");
                    user.ImagenPerfil = "perfil-" + user.Id + ".jpg";
                }
                user.Nombre = TxtNombre.Text;
                user.Apellido = TxtApellido.Text;
                user.FechaNacimiento = DateTime.Parse(TxtNacimiento.Text);
                //guardar datos del perfil
                negocio.Actualizar(user);
                //leer imagen
                Image img = (Image)Master.FindControl("ImgAvatar");
                img.ImageUrl = "~/Images/" + user.ImagenPerfil;
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }
    }
}