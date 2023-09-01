using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using dominio;
using Funciones;


namespace Funciones
{
    public class FuncionesArticulos
    {
        public List<Articulos> listar()
        {
            List<Articulos> lista = new List<Articulos>();
            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            SqlDataReader lector;

            try
            {
                conexion.ConnectionString = "server=.\\SQLEXPRESS; database=CATALOGO_DB; integrated security=true";
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "select codigo,nombre,a.descripcion,imagenUrl,precio,c.Descripcion Categoria,m.Descripcion Marca,A.Id from ARTICULOS A,CATEGORIAS C, MARCAS M where a.IdCategoria=c.Id and a.IdMarca=m.Id";
                comando.Connection = conexion;

                conexion.Open();
                lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Articulos aux = new Articulos();
                    aux.Codigo = (string)lector["Codigo"];
                    aux.Id = (int)lector["Id"];
                    aux.Nombre = (string)lector["Nombre"];
                    aux.Descripcion = (string)lector["Descripcion"];
                    if (!(lector["ImagenUrl"] is DBNull))
                        aux.ImagenUrl = (string)lector["ImagenUrl"];
                    aux.Precio = (decimal)lector["Precio"];
                    aux.Categoria = new Categorias();
                    aux.Categoria.Descripcion = (string)lector["Categoria"];
                    aux.Marca = new Marcas();
                    aux.Marca.Descripcion = (string)lector["Marca"];


                    lista.Add(aux);
                }
                conexion.Close();
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void Agregar(Articulos nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("insert into ARTICULOS (Codigo,nombre,Descripcion,Precio,idMarca,idCategoria,ImagenUrl) values('"+nuevo.Codigo+"','" + nuevo.Nombre + "','"+nuevo.Descripcion+"'," + nuevo.Precio + ",@idMarca,@idCategoria,@ImagenUrl)");
                datos.SetearParametro("@idMarca", nuevo.Marca.Id);
                datos.SetearParametro("@idCategoria", nuevo.Categoria.Id);
                datos.SetearParametro("@ImagenUrl", nuevo.ImagenUrl);
                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public void Modificar(Articulos modificado)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("update ARTICULOS set Codigo=@Codigo,Nombre=@Nombre,Descripcion=@Descripcion,IdMarca=@IdMarca,IdCategoria=@IdCategoria,ImagenUrl=@ImagenUrl,Precio=@precio where id=@Id");
                datos.SetearParametro("@Codigo", modificado.Codigo);
                datos.SetearParametro("@Nombre", modificado.Nombre);
                datos.SetearParametro("@Descripcion", modificado.Descripcion);
                datos.SetearParametro("@IdMarca", modificado.Marca.Id);                                 
                datos.SetearParametro("@IdCategoria", modificado.Categoria.Id);
                datos.SetearParametro("@ImagenUrl", modificado.ImagenUrl);
                datos.SetearParametro("@Precio", modificado.Precio);
                datos.SetearParametro("@Id", modificado.Id);
                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex; 
                
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public void eliminar(int Id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("delete from articulos where id=@Id");
                datos.SetearParametro("@Id", Id);
                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<Articulos>filtrar(string campo,string criterio,string filtro)
        {
            List<Articulos> lista = new List<Articulos>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "select nombre,imagenUrl,Precio,c.Descripcion Categoria,m.Descripcion Marca,A.Id from ARTICULOS A,CATEGORIAS C, MARCAS M where a.IdCategoria=c.Id and a.IdMarca=m.Id and ";
                if (campo == "Precio")
                {
                    switch (criterio)
                    {
                        case "Mayor a":
                            consulta += "Precio>" + filtro;
                            break;
                        case "Menor a":
                            consulta += "Precio<" + filtro;
                            break;
                        case "Igual a":
                            consulta += "Precio=" + filtro;
                            break;
                    }
                }
                else if (campo == "Marca")
                {
                    switch (criterio)
                    {
                        case "Comienza con":
                            consulta += "M.Descripcion like'" + filtro +"%'";
                            break;
                        case "Termina con":
                            consulta += "M.Descripcion like'%" + filtro + "'";
                            break;
                        case "Contiene":
                            consulta += "M.Descripcion like'%" + filtro + "%'";
                            break;
                    }
                }
                else
                {
                    switch (criterio)
                    {
                        case "Comienza con":
                            consulta += "C.Descripcion like'" + filtro + "%'";
                            break;
                        case "Termina con":
                            consulta += "C.Descripcion like'%" + filtro + "'";
                            break;
                        case "Contiene":
                            consulta += "C.Descripcion like'%" + filtro + "%'";
                            break;
                    }
                }
                datos.SetearConsulta(consulta);
                datos.EjecutarLectura();
                while (datos.Lector.Read())
                {
                    Articulos aux = new Articulos();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    if (!(datos.Lector["ImagenUrl"] is DBNull))
                        aux.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                    aux.Precio = (decimal)datos.Lector["Precio"];
                    aux.Categoria = new Categorias();
                    aux.Categoria.Descripcion = (string)datos.Lector["Categoria"];
                    aux.Marca = new Marcas();
                    aux.Marca.Descripcion = (string)datos.Lector["Marca"];

                    lista.Add(aux);
                }               
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        
    }   
}
