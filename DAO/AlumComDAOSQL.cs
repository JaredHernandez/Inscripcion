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
    public class AlumComDAOSQL : IAdaoFicha<AlumComDTO>
    {
        public SqlCommand comando { set; get; }
        public UConexion conexion { set; get; }
        public string instruccion { set; get; }

        public void Insert(AlumComDTO obj, int id)
        {
            conexion = new UConexion();
            using (conexion.Conexion())
            {
                int x = 0;
                comando = new SqlCommand();
                instruccion = "INSERT INTO AlumCom(alu_ID,alc_Curp,alc_Correo,alc_Calle,alc_Colonia,";
                instruccion += "alc_Localidad,alc_NumInt,alc_NumExt,alc_CodPostal,est_Proced_ID,";
                instruccion += "alc_FechaNac,mun_Natal_ID, est_Natal_ID,alc_PromBachi,pro_ID,mun_Proced_ID,alc_EdoCivil,alc_AnioTerminoBachi,";
                instruccion += "mun_Escue_ID,est_Escue_ID,alc_Celular,esc_ID, alc_Tel,alc_Facebook)";
                instruccion += " VALUES(@alu_ID,@alc_Curp,@alc_Correo,@alc_Calle,@alc_Colonia,@alc_Localidad,@alc_NumInt,@alc_NumExt,@alc_CodPostal,@est_Proced_ID,";
                instruccion += "@alc_FechaNac,@mun_Natal_ID,@est_Natal_ID,@alc_PromBachi,@pro_ID,@mun_Proced_ID,@alc_EdoCivil,@alc_AnioTerminoBachi,";
                instruccion += "@mun_Escue_ID,@est_Escue_ID,@alc_Celular,@esc_ID,@alc_Tel,@alc_Facebook)";

                comando = new SqlCommand(instruccion, conexion.Conexion());
                comando.Parameters.Add("@alu_ID", SqlDbType.Int).Value = id;
                comando.Parameters.Add("@alc_Curp", SqlDbType.VarChar).Value = obj.alc_Curp;
                comando.Parameters.Add("@alc_Correo", SqlDbType.VarChar).Value = obj.alc_Correo;
                comando.Parameters.Add("@alc_Calle", SqlDbType.VarChar).Value = obj.alc_Calle;
                comando.Parameters.Add("@alc_Colonia", SqlDbType.VarChar).Value = obj.alc_Colonia;
                comando.Parameters.Add("@alc_Localidad", SqlDbType.VarChar).Value = obj.alc_Localidad;
                comando.Parameters.Add("@alc_NumInt", SqlDbType.VarChar).Value = obj.alc_NumInt;
                comando.Parameters.Add("@alc_NumExt", SqlDbType.VarChar).Value = obj.alc_NumExt;
                comando.Parameters.Add("@alc_CodPostal", SqlDbType.VarChar).Value = obj.alc_CodPostal;
                comando.Parameters.Add("@est_Proced_ID", SqlDbType.Int).Value = obj.est_Proced_ID;
                comando.Parameters.Add("@alc_FechaNac", SqlDbType.DateTime).Value = obj.alc_FechaNac;
                comando.Parameters.Add("@mun_Natal_ID", SqlDbType.Int).Value = obj.mun_Natatl_ID;
                comando.Parameters.Add("@est_Natal_ID", SqlDbType.Int).Value = obj.est_Natatl_ID;
                comando.Parameters.Add("@alc_PromBachi", SqlDbType.VarChar).Value = obj.alc_PromBachi;
                comando.Parameters.Add("@pro_ID", SqlDbType.VarChar).Value = obj.pro_ID;
                comando.Parameters.Add("@mun_Proced_ID", SqlDbType.VarChar).Value = obj.mun_Proced_ID;
                comando.Parameters.Add("@alc_EdoCivil", SqlDbType.Char).Value = obj.alc_EdoCivil;
                comando.Parameters.Add("@alc_AnioTerminoBachi", SqlDbType.Char, 4).Value = obj.alc_AnioTerminoBachi;
                comando.Parameters.Add("@mun_Escue_ID", SqlDbType.Int).Value = obj.mun_Escue_ID;
                comando.Parameters.Add("@est_Escue_ID", SqlDbType.Int).Value = obj.est_Escue_ID;
                comando.Parameters.Add("@alc_Celular", SqlDbType.VarChar).Value = obj.alc_Celular;
                comando.Parameters.Add("@esc_ID", SqlDbType.Int).Value = obj.esc_ID;
                comando.Parameters.Add("@alc_Tel", SqlDbType.VarChar, 15).Value = obj.alc_Tel;
                // comando.Parameters.Add("@lei_ID", SqlDbType.Int).Value = obj.lei_ID;
                comando.Parameters.Add("@alc_Facebook", SqlDbType.VarChar).Value = obj.alc_Fcaebook;
                x = comando.ExecuteNonQuery();
            }
        }
        public void Update(AlumComDTO obj, int id)
        {
            int valor = 0;
            conexion = new UConexion();
            using (conexion.Conexion())
            {
                instruccion = "UPDATE AlumCom SET alc_Curp=@alc_Curp, alc_Correo=@alc_Correo, alc_Calle=@alc_Calle, alc_Colonia=@alc_Colonia,";
                instruccion += "alc_Localidad=@alc_Localidad, alc_NumInt=@alc_NumInt, alc_NumExt=@alc_NumExt, alc_CodPostal=@alc_CodPostal,";
                instruccion += "est_Proced_ID=@est_Proced_ID, alc_FechaNac=@alc_FechaNac, mun_Natal_ID=@mun_Natal_ID, est_Natal_ID=@est_Natal_ID,";
                instruccion += "alc_PromBachi=@alc_PromBachi, pro_ID=@pro_ID, mun_Proced_ID=@mun_Proced_ID, alc_EdoCivil=@alc_EdoCivil, alc_AnioTerminoBachi=@alc_AnioTerminoBachi,";
                instruccion += "mun_Escue_ID=@mun_Escue_ID,est_Escue_ID=@est_Escue_ID, alc_Celular=@alc_Celular, esc_ID=@esc_ID,alc_Tel=@alc_Tel,lei_ID=@lei_ID,alc_Facebook=@alc_Facebook WHERE alu_ID=@alu_ID";
                comando = new SqlCommand(instruccion, conexion.Conexion());
                comando.Parameters.Add("@alc_Curp", SqlDbType.VarChar).Value = obj.alc_Curp;
                comando.Parameters.Add("@alc_Correo", SqlDbType.VarChar).Value = obj.alc_Correo;
                comando.Parameters.Add("@alc_Calle", SqlDbType.VarChar).Value = obj.alc_Calle;
                comando.Parameters.Add("@alc_Colonia", SqlDbType.VarChar).Value = obj.alc_Colonia;
                comando.Parameters.Add("@alc_Localidad", SqlDbType.VarChar).Value = obj.alc_Localidad;
                comando.Parameters.Add("@alc_NumInt", SqlDbType.VarChar).Value = obj.alc_NumInt;
                comando.Parameters.Add("@alc_NumExt", SqlDbType.VarChar).Value = obj.alc_NumExt;
                comando.Parameters.Add("@alc_CodPostal", SqlDbType.VarChar).Value = obj.alc_CodPostal;
                comando.Parameters.Add("@est_Proced_ID", SqlDbType.Int).Value = obj.est_Proced_ID;
                comando.Parameters.Add("@alc_FechaNac", SqlDbType.DateTime).Value = obj.alc_FechaNac;
                comando.Parameters.Add("@mun_Natal_ID", SqlDbType.Int).Value = obj.mun_Natatl_ID;
                comando.Parameters.Add("@est_Natal_ID", SqlDbType.Int).Value = obj.est_Natatl_ID;
                comando.Parameters.Add("@alc_PromBachi", SqlDbType.VarChar).Value = obj.alc_PromBachi;
                comando.Parameters.Add("@pro_ID", SqlDbType.VarChar).Value = obj.pro_ID;
                comando.Parameters.Add("@mun_Proced_ID", SqlDbType.VarChar).Value = obj.mun_Proced_ID;
                comando.Parameters.Add("@alc_EdoCivil", SqlDbType.Char).Value = obj.alc_EdoCivil;
                comando.Parameters.Add("@alc_AnioTerminoBachi", SqlDbType.Char, 4).Value = obj.alc_AnioTerminoBachi;
                comando.Parameters.Add("@mun_Escue_ID", SqlDbType.Int).Value = obj.mun_Escue_ID;
                comando.Parameters.Add("@est_Escue_ID", SqlDbType.Int).Value = obj.est_Escue_ID;
                comando.Parameters.Add("@alc_Celular", SqlDbType.VarChar).Value = obj.alc_Celular;
                comando.Parameters.Add("@esc_ID", SqlDbType.Int).Value = obj.esc_ID;
                comando.Parameters.Add("@alc_Tel", SqlDbType.VarChar, 15).Value = obj.alc_Tel;
                comando.Parameters.Add("@lei_ID", SqlDbType.Int).Value = obj.lei_ID;
                comando.Parameters.Add("@alc_Facebook", SqlDbType.VarChar).Value = obj.alc_Fcaebook;
                comando.Parameters.Add("@alu_ID", SqlDbType.Int).Value = id;
                valor = comando.ExecuteNonQuery();
                conexion.Conexion().Close();
            }
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
                    string query = "SELECT * FROM AlumCom where alu_ID = @alu_ID";
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
    }
}