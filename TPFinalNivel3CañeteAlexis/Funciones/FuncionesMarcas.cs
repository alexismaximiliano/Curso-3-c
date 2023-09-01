using dominio;
using Funciones;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Funciones
{
    public class FuncionesMarcas
    {
        public List<Marcas> listar()
        {
            List<Marcas>lista=new List<Marcas>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("select id,Descripcion from MARCAS");
                datos.EjecutarLectura();
                while (datos.Lector.Read())
                {
                    Marcas aux = new Marcas();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally { datos.CerrarConexion(); }
        }
    }
}
