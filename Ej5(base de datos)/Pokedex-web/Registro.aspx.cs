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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                Trainee user = new Trainee();
                TraineeNegocio traineeNegocio = new TraineeNegocio();
                EmailService emailService = new EmailService();
                user.Email = TxtEmail.Text;
                user.Pass = TxtContraseña.Text;
                user.Id = traineeNegocio.InsertarNuevo(user);
                Session.Add("trainee", user);
                emailService.ArmarCorreo(user.Email, "Bienvenido", "te damos la bienvenida a la pokedex");
                emailService.EnviarCorreo();
                Response.Redirect("MiPerfil.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());               
            }
        }
    }
}