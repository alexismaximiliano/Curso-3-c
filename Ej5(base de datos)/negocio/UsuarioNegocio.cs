using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using dominio;


namespace negocio
{
    public class UsuarioNegocio
    {
        public bool Logear(Usuario usuario)
        {
            AccesoDatos datos=new AccesoDatos();
            try
            {
                datos.setearConsulta("select Id, TipoUser from USUARIOS where Usuario=@User AND Pass=@Pass");
                datos.setearParametro("@User", usuario.User);
                datos.setearParametro("@Pass", usuario.Pass);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.TipoUsuario = (int)(datos.Lector["TipoUser"]) == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
           
        }
    }
}
