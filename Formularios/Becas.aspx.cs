using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Conect.DTO;
using System.Data;
using System.Data.SqlClient;
using Conect.Utileria;
using Conect.DAO;

namespace Conect.Formularios
{
    public partial class Becas : System.Web.UI.Page, IAspiranteSE
    {
        public IngrEgrFamiliaresDTO ingrEgrFamiliares
        {
            get
            {
                throw new NotImplementedException();
            }
        }

        public ViviendaDTO vivienda
        {
            get
            {
                throw new NotImplementedException();
            }
        }

        public AntecedentesAluPDTO anteLPDTO
        {
            get
            {
                throw new NotImplementedException();
            }
        }

        public BecasDTO becasYApoyos
        {
            get
            {
                return llenarBeca();
            }
        }

        BecasDTO llenarBeca()
        {
            BecasDTO becasYApoyos = new BecasDTO();
            if (bec_EstatusBecadoSII.Selected == true)
            {
                becasYApoyos.bec_EstatusBecado = true;
                becasYApoyos.bec_ID = 1+(Convert.ToInt32((bec_EstatusBecado.SelectedValue)));
            }
            else
            {
                becasYApoyos.bec_ID = 1;
            }
            becasYApoyos.bec_SuspenciosEstudios = bec_SuspenciosEstudiosSII.Selected;
            becasYApoyos.bec_BecadoAntes = bec_BecadoAntesSII.Selected;
            becasYApoyos.bec_EstatusOportunidades = bec_EstatusOportunidadesSII.Selected;
            becasYApoyos.alu_ID = (int)Session["alu_ID"];
            return becasYApoyos;
        }

        UControl co;
        FacadeAspiranteSE f;
        BecasDAOSQL a;
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarBecas();
            co = new UControl();
            f = new FacadeAspiranteSE(this);
            a = new BecasDAOSQL();

            //Session["alu_ID"] = 2;
            if (a.SelectExiste((int)Session["alu_ID"]))
            {
                if (!IsPostBack)
                {
                    LlenarSiExiste((int)Session["alu_ID"]);
                }
                btnSiguiente2.Text = "ACTUALIZAR";
            }
            else
            {
                btnSiguiente2.Text = "GUARDAR";
            }
        }

        void LlenarSiExiste(int id)
        {
            DataTable dt = a.GetTabla(id);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                bool estatusBeca = Convert.ToBoolean(dt.Rows[i]["bec_EstatusBecado"].ToString());
                if (estatusBeca) { bec_EstatusBecadoSII.Selected = true; }else { bec_EstatusBecadoNOO.Selected = true; }
                bool suspension = Convert.ToBoolean(dt.Rows[i]["bec_SuspensionEstudios"].ToString());
                if (suspension) { bec_SuspenciosEstudiosSII.Selected = true; }else { bec_SuspenciosEstudiosNOO.Selected = true; }
                bool becadoAntes = Convert.ToBoolean(dt.Rows[i]["bec_BecadoAntes"].ToString());
                if (becadoAntes) { bec_BecadoAntesSII.Selected = true; } else { bec_BecadoAntesNOO.Selected = true; }
                bool Oportunidades = Convert.ToBoolean(dt.Rows[i]["bec_EstatusOportunidades"].ToString());
                if (Oportunidades) { bec_EstatusOportunidadesSII.Selected = true; }else { bec_EstatusOportunidadesNOO.Selected = true; }
            }
        }
        SqlConnection con;
        UConexion c;
        public void CargarBecas()
        {
            try
            {
                bec_EstatusBecado.Items.Clear();
                con = new SqlConnection();
                c = new UConexion();
                con = c.Conexion();
                using (con)
                {
                    string qwery = "select * from TipoBeca";
                    SqlCommand comando = new SqlCommand(qwery,con);
                    SqlDataReader dr = comando.ExecuteReader();
                if (dr.HasRows)
                {
                        int x = 0;
                    while (dr.Read())
                    {
                            if (x != 0)
                            {
                                string bec_Id = dr["bec_ID"].ToString();
                                string bec_Nombre = dr["bec_Nombre"].ToString();
                                bec_EstatusBecado.Items.Add(new ListItem(bec_Nombre, bec_Id));
                            }
                            x++;
                    }
                }
                con.Close();
                }
        }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnSiguiente2_Click(object sender, EventArgs e)
        {
            UControl control = new UControl();
            FacadeAspiranteSE f = new FacadeAspiranteSE(this);
            if (f.LlamarSelectExiste(4))
            {
                f.LlamarUpdate(4);
                Type cstype = this.GetType();
                string script = "<script language='javascript'>alert('!!Felicidades!!, Tu información se acualizó correctamente')</script>";
                this.ClientScript.RegisterStartupScript(cstype, Guid.NewGuid().ToString(), script, false);
            }
            else
            {
                f.LlamarInsert(4);
                control.RegistrarFormulario(5, Convert.ToInt32(Session["alu_ID"]));
                Type cstype = this.GetType();
                string script = "<script language='javascript'>alert('!!Felicidades!!, Tu información se guardo correctamente')</script>";
                this.ClientScript.RegisterStartupScript(cstype, Guid.NewGuid().ToString(), script, false);
            }
            Server.Transfer("formulario_1.aspx", true);
        }
    }
}