using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Conect.DTO;
using Conect.DAO;
using Conect.Utileria;
using System.Data;

namespace Conect.Formularios
{
    public partial class AntecedentesAlumno : System.Web.UI.Page, IAspiranteSE
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
                return Llenar();
            }
        }
        AntecedentesAluPDTO Llenar()
        {
            AntecedentesAluPDTO obj = new AntecedentesAluPDTO();
            string empleo = "";
            double ingrAlu = 0;
            if (alp_EmpleoSi.Selected == true)
            {
                empleo = alp_Empleo.Text;
                if ((alp_IngresoAlumno.Text).Equals("")) { alp_IngresoAlumno.Text = "0"; }
                ingrAlu = Convert.ToDouble(alp_IngresoAlumno.Text);
            }
            else
            {
                empleo = "No"; ingrAlu = 0;
            }
            obj.alp_Empleo = empleo;
            obj.alp_IngresoAlumno = ingrAlu;

            obj.alp_EstatusJefeHogar = Convert.ToBoolean(alp_EstatusJefeHogarSi.Selected);

            int hijos = 0;
            if (alp_HijoSi.Selected == true) {
                if ((alp_NoHijosDepeEcon.Text).Equals("")) { alp_NoHijosDepeEcon.Text = "0"; }
                hijos = Convert.ToInt32(alp_NoHijosDepeEcon.Text);
            }
            obj.alp_NoHijosDepeEcon = hijos;
            obj.alp_NoPersonasDepeIngr = Convert.ToInt32(alp_NoPersonasDepeIngr.SelectedValue);
            obj.alu_ID = (int)Session["alu_ID"];
            obj.alp_NoDiasTrabajaJefeH = Convert.ToInt32(alp_NoDiasTrabajaJefeH.SelectedValue);
            if ((alp_DineroMensualPorTrabajar.Text).Equals("")) { alp_DineroMensualPorTrabajar.Text = "0"; }
            obj.alp_DineroMensualPorTrabajar = Convert.ToDouble(alp_DineroMensualPorTrabajar.Text);
            obj.alp_PersonaVives = alp_PersonaVives.SelectedItem.Text;
            return obj;
        }

        public BecasDTO becasYApoyos
        {
            get
            {
                throw new NotImplementedException();
            }
        }

        UControl c;
        FacadeAspiranteSE f;
        AntecedentesAluQL a;

        protected void Page_Load(object sender, EventArgs e)
        {
            c = new UControl();
            f = new FacadeAspiranteSE(this);
            a = new AntecedentesAluQL();
            
            //Session["alu_ID"] = 2;
            if (a.SelectExiste((int)Session["alu_ID"]))
            {
                if (!IsPostBack)
                {
                    LlenarSiExiste((int)Session["alu_ID"]);
                }
                btnGuardar.Text = "ACTUALIZAR";
            }
            else
            {
                btnGuardar.Text = "GUARDAR";
            }
        }

        void LlenarSiExiste(int id)
        {
            DataTable dt = a.GetTabla(id);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string empleo = dt.Rows[i]["alp_Empleo"].ToString();
                if (empleo.Equals("No")) { alp_EmpleoNo.Selected = true; } else { alp_EmpleoSi.Selected = true; alp_Empleo.Text = dt.Rows[i]["alp_Empleo"].ToString(); alp_IngresoAlumno.Text = dt.Rows[i]["alp_IngresoAlumno"].ToString(); }
                bool alp_EstatusJefeHogar = Convert.ToBoolean(dt.Rows[i]["alp_EstatusJefeHogar"].ToString());
                if (alp_EstatusJefeHogar) { alp_EstatusJefeHogarSi.Selected = true; } else { alp_EstatusJefeHogarNo.Selected = true; }
                int NoHIjosDepeEcon = Convert.ToInt32(dt.Rows[i]["alp_NoHijosDepeEcon"].ToString());
                if (NoHIjosDepeEcon == 0) { alp_HijoNo.Selected = true; }else { alp_HijoSi.Selected = true; alp_NoHijosDepeEcon.Text = dt.Rows[i]["alp_NoHijosDepeEcon"].ToString(); }
                alp_NoPersonasDepeIngr.SelectedValue = dt.Rows[i]["alp_NoPersonasDepeIngr"].ToString();
                alp_PersonaVives.SelectedValue = dt.Rows[i]["alp_PersonaVives"].ToString();
                alp_NoDiasTrabajaJefeH.SelectedValue = dt.Rows[i]["alp_NoDiasTrabajaJefeH"].ToString();
                alp_DineroMensualPorTrabajar.Text = dt.Rows[i]["alp_DineroMensualPorTrabajar"].ToString();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (f.LlamarSelectExiste(1))
            {
                f.LlamarUpdate(1);
                Type cstype = this.GetType();
                string script = "<script language='javascript'>alert('!!Felicidades!!, Tu información se actualizó correctamente')</script>";
                this.ClientScript.RegisterStartupScript(cstype, Guid.NewGuid().ToString(), script, false);
            }
            else
            {
                f.LlamarInsert(1);
                Type cstype = this.GetType();
                string script = "<script language='javascript'>alert('!!Felicidades!!, Tu información se guardo correctamente')</script>";
                this.ClientScript.RegisterStartupScript(cstype, Guid.NewGuid().ToString(), script, false);
                c.RegistrarFormulario(2, Convert.ToInt32(Session["alu_ID"]));
            }
            Server.Transfer("formulario_1.aspx", true);
        }
    }
}