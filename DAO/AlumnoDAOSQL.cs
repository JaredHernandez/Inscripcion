using Conect.DTO;
using Conect.Utileria;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Conect.DAO
{
    public class AlumnoDAOSQL :IAdaoFicha<AlumnoDTO>
    {
        public SqlCommand comando { set; get; }
        public UConexion conexion { set; get; }
        public string instruccion { set; get; }
 
        public int Insert(AlumnoDTO obj)
        {
            conexion = new UConexion();
            using (conexion.Conexion())
            {
                int id = 0;
                
                instruccion = "INSERT INTO Alumno(alu_NumControl,lei_Id,dis_ID,esp_ID,alu_Nombre,alu_ApellidoPaterno,alu_ApellidoMaterno,alu_Sexo,alu_Edad,mod_ID,alu_Carrera,alu_SegundaOpcion,alu_TerceraOpcion)";
                instruccion += "OUTPUT INSERTED.alu_ID VALUES(@alu_NumControl,@lei_Id,@dis_ID,@esp_ID,@alu_Nombre,@alu_ApellidoPaterno,@alu_ApellidoMaterno,@alu_Sexo,@alu_Edad,@mod_ID,@alu_Carrera,@alu_SegundaOpcion,@alu_TerceraOpcion);";
                comando = new SqlCommand(instruccion, conexion.Conexion());

                comando.Parameters.Add("@alu_NumControl", SqlDbType.VarChar).Value = obj.alu_NumControl;
                comando.Parameters.Add("@lei_Id",SqlDbType.Int).Value=obj.lei_ID;
                comando.Parameters.Add("@dis_ID", SqlDbType.Int).Value = obj.dis_ID;
                comando.Parameters.Add("@esp_ID", SqlDbType.Int).Value = obj.esp_ID;
                comando.Parameters.Add("@alu_Nombre", SqlDbType.VarChar).Value = obj.alu_Nombre;
                comando.Parameters.Add("@alu_ApellidoPaterno", SqlDbType.VarChar).Value = obj.alu_ApellidoPaterno;
                comando.Parameters.Add("@alu_ApellidoMaterno", SqlDbType.VarChar).Value = obj.alu_ApellidoMaterno;
                comando.Parameters.Add("@alu_Sexo", SqlDbType.VarChar).Value = obj.alu_Sexo;
                comando.Parameters.Add("@alu_Edad", SqlDbType.Int).Value = obj.alu_Edad;
                comando.Parameters.Add("@mod_ID", SqlDbType.Int).Value = obj.mod_ID;
                comando.Parameters.Add("@alu_Carrera", SqlDbType.VarChar).Value = obj.alu_Carrera;
                comando.Parameters.Add("@alu_SegundaOpcion", SqlDbType.VarChar).Value = obj.alu_SegundaOpcion;
                comando.Parameters.Add("@alu_TerceraOpcion", SqlDbType.VarChar).Value = obj.alu_TerceraOpcion;                
                id= int.Parse(comando.ExecuteScalar().ToString());
                conexion.Conexion().Close();
                return id;
            }
        }
        public void Update(AlumnoDTO obj, int id)
        {
            conexion = new UConexion();
            using (conexion.Conexion())
            {
                //,,
                instruccion = "UPDATE Alumno SET lei_Id=@lei_Id,dis_ID=@dis_ID,esp_ID=@esp_ID,alu_Nombre=@alu_Nombre,alu_ApellidoPaterno=@alu_ApellidoPaterno,";
                instruccion+= "alu_ApellidoMaterno=@alu_ApellidoMaterno,alu_Sexo=@alu_Sexo,alu_Edad=@alu_Edad,mod_ID=@mod_ID,alu_Carrera=@alu_Carrera,alu_SegundaOpcion=@alu_SegundaOpcion,alu_TerceraOpcion=@alu_TerceraOpcion WHERE alu_ID=@alu_ID";

                comando = new SqlCommand(instruccion, conexion.Conexion());
                comando.Parameters.Add("@lei_Id", SqlDbType.Int).Value = obj.lei_ID;
                comando.Parameters.Add("@dis_ID", SqlDbType.Int).Value = obj.dis_ID;
                comando.Parameters.Add("@esp_ID", SqlDbType.Int).Value = obj.esp_ID;
                comando.Parameters.Add("@alu_Nombre", SqlDbType.VarChar).Value = obj.alu_Nombre;
                comando.Parameters.Add("@alu_ApellidoPaterno", SqlDbType.VarChar).Value = obj.alu_ApellidoPaterno;
                comando.Parameters.Add("@alu_ApellidoMaterno", SqlDbType.VarChar).Value = obj.alu_ApellidoMaterno;
                comando.Parameters.Add("@alu_Sexo", SqlDbType.VarChar).Value = obj.alu_Sexo;
                comando.Parameters.Add("@alu_Edad", SqlDbType.Int).Value = obj.alu_Edad;
                comando.Parameters.Add("@mod_ID", SqlDbType.Int).Value = obj.mod_ID;
                comando.Parameters.Add("@alu_Carrera", SqlDbType.VarChar).Value = obj.alu_Carrera;
                comando.Parameters.Add("@alu_SegundaOpcion", SqlDbType.VarChar).Value = obj.alu_SegundaOpcion;
                comando.Parameters.Add("@alu_TerceraOpcion", SqlDbType.VarChar).Value = obj.alu_TerceraOpcion;
                comando.Parameters.Add("@alu_ID", SqlDbType.Int).Value = id;
                comando.ExecuteNonQuery();
            }
        }
        public bool SelectExiste(int id)
        {
            bool result = false;
            conexion = new UConexion();
            SqlConnection con = conexion.Conexion();
            using (con)
            {
                instruccion = "SELECT CAST (COUNT(1) AS BIT) FROM [Alumno] WHERE (alu_ID = @alu_ID)";
                comando = new SqlCommand(instruccion, con);
                comando.Parameters.Add("@alu_ID", SqlDbType.Int).Value = id;
                result = Convert.ToBoolean(comando.ExecuteScalar());
                conexion.Conexion().Close();
            }
            return result;
        }
        internal bool SelectExisteMatricula(string matricula)
        {
            bool result = false;
            conexion = new UConexion();
            SqlConnection con = conexion.Conexion();
            using (con)
            {
                instruccion = "SELECT CAST (COUNT(1) AS BIT) FROM [Alumno] WHERE (alu_NumControl = @alu_NumControl)";
                comando = new SqlCommand(instruccion, con);
                comando.Parameters.Add("@alu_NumControl", SqlDbType.VarChar).Value = matricula;
                result = Convert.ToBoolean(comando.ExecuteScalar());
                conexion.Conexion().Close();
            }
            return result;
        }
        public int ObtenerID(string matricula)
        {
            conexion = new UConexion();
            SqlConnection con = conexion.Conexion();
            int id = 0;
            using (con)
            {
                instruccion = "SELECT alu_ID from Alumno WHERE (alu_NumControl = @alu_NumControl)";
                comando = new SqlCommand(instruccion, con);
                comando.Parameters.Add("@alu_NumControl", SqlDbType.VarChar).Value = matricula;
                SqlDataReader rd = comando.ExecuteReader();
                if (rd.HasRows)
                {
                    while (rd.Read())
                    {
                        id = rd.GetInt32(0);
                    }

                }
                conexion.Conexion().Close();

            }
            return id;
        }
        public DataTable GetTabla(int id)
        {
            DataTable dt = new DataTable();
            try
            {
                conexion = new UConexion();
                SqlConnection con = conexion.Conexion();
                using (con)
                {
                    string query = "SELECT * FROM Alumno where alu_ID = @alu_ID";
                    comando = new SqlCommand(query, con);
                    comando.Parameters.Add("@alu_ID", SqlDbType.Int).Value = id;
                    dt.Load(comando.ExecuteReader());
                    con.Close();
                }
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        #region Implementado por la Iterfaz (No se usa aqui)
        public void Insert(AlumnoDTO obj, int id)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}