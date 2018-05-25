using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Conect.Utileria;

namespace Conect.DAO
{
    public class LogInDAOSQL
    {
        string cadena;
        UConexion c;
        SqlConnection con;
        public LogInDAOSQL()
        {
            c = new UConexion();
        }

        public bool ExisteUsuario(string referencia)
        {
            bool result = false;
            try
            {
                con = new SqlConnection();
                con = c.Conexion();
                using (con)
                {
                    string qwery = "SELECT CAST(COUNT(1) AS BIT) FROM [Usuarios] WHERE (usu_Referencia = @usu_Referencia)";
                    SqlCommand command = new SqlCommand(qwery, con);
                    command.Parameters.Add("@usu_Referencia", SqlDbType.VarChar).Value = referencia;
                    result = Convert.ToBoolean(command.ExecuteScalar());
                    con.Close();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return result;
        }
        public bool ValidarUsuario(string contraseña, string referencia)
        {
            bool result = false;
            try
            {
                con = new SqlConnection();
                con = c.Conexion();
                using (con)
                {
                    string qwery = "SELECT CAST(COUNT(1) AS BIT) FROM [Usuarios] WHERE (usu_Contrasenia = @usu_Contrasenia and usu_Referencia = @usu_Referencia)";
                    SqlCommand command = new SqlCommand(qwery, con);
                    command.Parameters.Add("@usu_Contrasenia", SqlDbType.VarChar).Value = contraseña;
                    command.Parameters.Add("@usu_Referencia", SqlDbType.VarChar).Value = referencia;
                    result = Convert.ToBoolean(command.ExecuteScalar());
                    con.Close();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return result;
        }
    }
}