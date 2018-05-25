using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Conect.Utileria
{
    public class UConexion
    {
        public SqlConnection Conexion()
        {
            string cadena = ConfigurationManager.ConnectionStrings["Conect.Properties.Settings.conexion"].ConnectionString;
            SqlConnection c;
            try
            {
                c = new SqlConnection(cadena);
                c.Open();
            }
            catch (Exception)
            {

                throw;
            }
            return c;
        }
    }
}