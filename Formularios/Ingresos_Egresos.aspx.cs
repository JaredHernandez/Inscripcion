using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Conect.DTO;
using Conect.Utileria;
using System.Data;

namespace Conect.Formularios
{
    public partial class Ingresos_Egresos : System.Web.UI.Page,IAspiranteSE
    {
        double totalI;
        double totalE;
        public IngrEgrFamiliaresDTO ingrEgrFamiliares
        {
            get
            {
                return llenar();
            }
        }

        IngrEgrFamiliaresDTO llenar()
        {
            IngrEgrFamiliaresDTO ingrEgrFamiliares = new IngrEgrFamiliaresDTO();
            ingrEgrFamiliares.ief_Padre = Convert.ToDouble(ief_Padre.Text);
            ingrEgrFamiliares.ief_Madre = Convert.ToDouble(ief_Madre.Text);
            ingrEgrFamiliares.ief_Usted = Convert.ToDouble(ief_Usted.Text);
            ingrEgrFamiliares.ief_Hermanos = Convert.ToDouble(ief_Hermanos.Text);
            ingrEgrFamiliares.ief_Conyugue = Convert.ToDouble(ief_Conyuge.Text);
            ingrEgrFamiliares.ief_Otros = Convert.ToDouble(ief_Otros.Text);
            ingrEgrFamiliares.ief_Total = Convert.ToDouble(ief_Total.Text);
            //egresos
            ingrEgrFamiliares.ief_Renta = Convert.ToDouble(ief_Renta.Text);
            ingrEgrFamiliares.ief_Alimentacion = Convert.ToDouble(ief_Alimentacion.Text);
            ingrEgrFamiliares.ief_Vestido = Convert.ToDouble(ief_Vestido.Text);
            ingrEgrFamiliares.ief_Transporte = Convert.ToDouble(ief_Transporte.Text);
            ingrEgrFamiliares.ief_Colegiaura = Convert.ToDouble(ief_Colegiatura.Text);
            ingrEgrFamiliares.ief_Agua = Convert.ToDouble(ief_Agua.Text);
            ingrEgrFamiliares.ief_Electricidad = Convert.ToDouble(ief_Electricidad.Text);
            ingrEgrFamiliares.ief_GasCombustible = Convert.ToDouble(ief_GasCombustible.Text);
            ingrEgrFamiliares.ief_Telefono = Convert.ToDouble(ief_Telefono.Text);
            ingrEgrFamiliares.ief_OtrosE = Convert.ToDouble(ief_OtrosE.Text);
            ingrEgrFamiliares.ief_TotalEgresos = Convert.ToDouble(ief_TotalEgresos.Text);
            ingrEgrFamiliares.alu_ID = (int)Session["alu_ID"];
            //observaciones
            ingrEgrFamiliares.ief_ParentezcoPersona = ief_ParentezcoPersona.SelectedItem.Text;
            ingrEgrFamiliares.ief_CantidadPersona = Convert.ToDouble(ief_CantidadPersona.Text);
            ingrEgrFamiliares.ief_FrecuenciaAporte = ief_FrecuenciaAporte.SelectedItem.Text;
            ingrEgrFamiliares.ief_GastoDiario = Convert.ToDouble(ief_GastoDiario.Text);
            ingrEgrFamiliares.ief_Conceptos = ief_Conceptos.Text;
            return ingrEgrFamiliares;
        }
        public void LlenarVacios()
        {
            if (ief_Total.Text == "")
                ief_Total.Text = "0";
            if (ief_Padre.Text == "")
                ief_Padre.Text = "0";
            if (ief_Madre.Text == "")
                ief_Madre.Text = "0";
            if (ief_Usted.Text == "")
                ief_Usted.Text = "0";
            if (ief_Hermanos.Text == "")
                ief_Hermanos.Text = "0";
            if (ief_Conyuge.Text == "")
                ief_Conyuge.Text = "0";
            if (ief_Otros.Text == "")
                ief_Otros.Text = "0";
            if (ief_Renta.Text == "")
                ief_Renta.Text = "0";
            if (ief_Alimentacion.Text == "")
                ief_Alimentacion.Text = "0";
            if (ief_Vestido.Text == "")
                ief_Vestido.Text = "0";
            if (ief_Transporte.Text == "")
                ief_Transporte.Text = "0";
            if (ief_Colegiatura.Text == "")
                ief_Colegiatura.Text = "0";
            if (ief_Agua.Text == "")
                ief_Agua.Text = "0";
            if (ief_Electricidad.Text == "")
                ief_Electricidad.Text = "0";
            if (ief_GasCombustible.Text == "")
                ief_GasCombustible.Text = "0";
            if (ief_Telefono.Text == "")
                ief_Telefono.Text = "0";
            if (ief_OtrosE.Text == "")
                ief_OtrosE.Text = "0";
            if (ief_TotalEgresos.Text == "")
                ief_TotalEgresos.Text = "0";
            if (ief_CantidadPersona.Text == "")
                ief_CantidadPersona.Text = "0";
            if (ief_GastoDiario.Text == "")
                ief_GastoDiario.Text = "0";
        }
        public void SumaIngr(double ingr)
        {
            totalI += ingr;
            ief_Total.Text = "" + totalI;
        }
        public void SumaEgr(double egr)
        {
            totalE += egr;
            ief_TotalEgresos.Text = "" + totalE;
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
                throw new NotImplementedException();
            }
        }
        
        IngrEgrFamiliaresDAOSQL a;
        protected void Page_Load(object sender, EventArgs e)
        {
            totalI = 0;
            totalE = 0;
            LlenarVacios();
            a = new IngrEgrFamiliaresDAOSQL();

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
                ief_Padre.Text = dt.Rows[i]["ief_Padre"].ToString();
                ief_Madre.Text = dt.Rows[i]["ief_Madre"].ToString();
                ief_Usted.Text = dt.Rows[i]["ief_Usted"].ToString();
                ief_Hermanos.Text = dt.Rows[i]["ief_Hermanos"].ToString();
                ief_Conyuge.Text = dt.Rows[i]["ief_Conyuge"].ToString();
                ief_Otros.Text = dt.Rows[i]["ief_Otros"].ToString();
                ief_Total.Text = dt.Rows[i]["ief_Total"].ToString();

                ief_Renta.Text = dt.Rows[i]["ief_Renta"].ToString();
                ief_Alimentacion.Text = dt.Rows[i]["ief_Alimentacion"].ToString();
                ief_Vestido.Text = dt.Rows[i]["ief_Vestido"].ToString();
                ief_Transporte.Text = dt.Rows[i]["ief_Transporte"].ToString();
                ief_Colegiatura.Text = dt.Rows[i]["ief_Colegiatura"].ToString();
                ief_Agua.Text = dt.Rows[i]["ief_Agua"].ToString();
                ief_Electricidad.Text = dt.Rows[i]["ief_Electricidad"].ToString();
                ief_GasCombustible.Text = dt.Rows[i]["ief_GasCombustible"].ToString();
               ief_OtrosE.Text = dt.Rows[i]["ief_OtrosE"].ToString();
                ief_TotalEgresos.Text = dt.Rows[i]["ief_TotalEgresos"].ToString();

                ief_ParentezcoPersona.SelectedValue = dt.Rows[i]["ief_ParentezcoPersona"].ToString();
                ief_CantidadPersona.Text = dt.Rows[i]["ief_CantidadPersona"].ToString();
                ief_FrecuenciaAporte.SelectedValue = dt.Rows[i]["ief_FrecuenciaAporte"].ToString();
                ief_GastoDiario.Text = dt.Rows[i]["ief_GastoDiario"].ToString();
                ief_Conceptos.Text = dt.Rows[i]["ief_Conceptos"].ToString();
                ief_Telefono.Text = dt.Rows[i]["ief_Telefono"].ToString();
            }
        }

        protected void btnSiguiente2_Click(object sender, EventArgs e)
        {
            UControl control = new UControl();
            FacadeAspiranteSE f = new FacadeAspiranteSE(this);
            if (f.LlamarSelectExiste(3))
            {
                f.LlamarUpdate(3);
                Type cstype = this.GetType();
                string script = "<script language='javascript'>alert('!!Felicidades!!, Tu información se actualizó correctamente')</script>";
                this.ClientScript.RegisterStartupScript(cstype, Guid.NewGuid().ToString(), script, false);
            }
            else
            {
                f.LlamarInsert(3);
                control.RegistrarFormulario(4, Convert.ToInt32(Session["alu_ID"]));
                Type cstype = this.GetType();
                string script = "<script language='javascript'>alert('!!Felicidades!!, Tu información se guardo correctamente')</script>";
                this.ClientScript.RegisterStartupScript(cstype, Guid.NewGuid().ToString(), script, false);
            }
            Server.Transfer("formulario_1.aspx", true);
        }

        protected void ief_Padre_TextChanged(object sender, EventArgs e)
        {
            if (ief_Padre.Text == "")
            {
                ief_Padre.Text = "0";
            }
            SumaIngr(Convert.ToDouble(ief_Padre.Text));
        }

        protected void ief_Madre_TextChanged(object sender, EventArgs e)
        {
            if (ief_Madre.Text == "")
            {
                ief_Madre.Text = "0";
            }
            SumaIngr(Convert.ToDouble(ief_Madre.Text));
        }

        protected void ief_Usted_TextChanged(object sender, EventArgs e)
        {
            if (ief_Usted.Text == "")
            {
                ief_Usted.Text = "0";
            }
            SumaIngr(Convert.ToDouble(ief_Usted.Text));
        }

        protected void ief_Hermanos_TextChanged(object sender, EventArgs e)
        {
            if (ief_Hermanos.Text == "")
            {
                ief_Hermanos.Text = "0";
            }
            SumaIngr(Convert.ToDouble(ief_Hermanos.Text));
        }

        protected void ief_Conyuge_TextChanged(object sender, EventArgs e)
        {
            if (ief_Conyuge.Text == "")
            {
                ief_Conyuge.Text = "0";
            }
            SumaIngr(Convert.ToDouble(ief_Conyuge.Text));
        }

        protected void ief_Otros_TextChanged(object sender, EventArgs e)
        {
            if (ief_Otros.Text == "")
            {
                ief_Otros.Text = "0";
            }
            SumaIngr(Convert.ToDouble(ief_Otros.Text));
        }

        protected void ief_Renta_TextChanged(object sender, EventArgs e)
        {
            if (ief_Renta.Text == "")
            {
                ief_Renta.Text = "0";
            }
            SumaEgr(Convert.ToDouble(ief_Renta.Text));
        }

        protected void ief_Alimentacion_TextChanged(object sender, EventArgs e)
        {
            if (ief_Alimentacion.Text == "")
            {
                ief_Alimentacion.Text = "0";
            }
            SumaEgr(Convert.ToDouble(ief_Alimentacion.Text));
        }

        protected void ief_Vestido_TextChanged(object sender, EventArgs e)
        {
            if (ief_Vestido.Text == "")
            {
                ief_Vestido.Text = "0";
            }
            SumaEgr(Convert.ToDouble(ief_Vestido.Text));
        }

        protected void ief_Transporte_TextChanged(object sender, EventArgs e)
        {
            if (ief_Transporte.Text == "")
            {
                ief_Transporte.Text = "0";
            }
            SumaEgr(Convert.ToDouble(ief_Transporte.Text));
        }

        protected void ief_Colegiatura_TextChanged(object sender, EventArgs e)
        {
            if (ief_Colegiatura.Text == "")
            {
                ief_Colegiatura.Text = "0";
            }
            SumaEgr(Convert.ToDouble(ief_Colegiatura.Text));
        }

        protected void ief_Agua_TextChanged(object sender, EventArgs e)
        {
            if (ief_Agua.Text == "")
            {
                ief_Agua.Text = "0";
            }
            SumaEgr(Convert.ToDouble(ief_Agua.Text));
        }

        protected void ief_Electricidad_TextChanged(object sender, EventArgs e)
        {
            if (ief_Electricidad.Text == "")
            {
                ief_Electricidad.Text = "0";
            }
            SumaEgr(Convert.ToDouble(ief_Electricidad.Text));
        }

        protected void ief_GasCombustible_TextChanged(object sender, EventArgs e)
        {
            if (ief_GasCombustible.Text == "")
            {
                ief_GasCombustible.Text = "0";
            }
            SumaEgr(Convert.ToDouble(ief_GasCombustible.Text));
        }

        protected void ief_Telefono_TextChanged(object sender, EventArgs e)
        {
            if (ief_Telefono.Text == "")
            {
                ief_Telefono.Text = "0";
            }
            SumaEgr(Convert.ToDouble(ief_Telefono.Text));
        }

        protected void ief_OtrosE_TextChanged(object sender, EventArgs e)
        {
            if (ief_OtrosE.Text == "")
            {
                ief_OtrosE.Text = "0";
            }
            SumaEgr(Convert.ToDouble(ief_OtrosE.Text));
        }
    }
}