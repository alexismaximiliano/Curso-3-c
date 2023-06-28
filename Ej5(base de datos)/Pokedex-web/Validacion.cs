using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Pokedex_web
{
    public static class Validacion
    {
        public static bool ValidaTextoVacio(object control)
        {
            if (control is TextBox texto)
            {
                if (string.IsNullOrEmpty(texto.Text))
                    return false;
                else
                    return true;
            }
            return true;
        }
    }
}