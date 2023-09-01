using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Funciones
{
    public static class Validaciones
    {
        public static bool TextoVacio(object texto)
        {
            if (texto is TextBox validacion)
            {
                
                if(string.IsNullOrEmpty(validacion.Text))
                    return false;
                else
                    return true;
            }
            return false;
        }
    }
}
