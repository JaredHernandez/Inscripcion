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
    public partial class Vivienda : System.Web.UI.Page,IAspiranteSE
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
                return llenarObj();
            }
        }

        ViviendaDTO llenarObj()
        {
            ViviendaDTO vivienda = new ViviendaDTO();
            vivienda.viv_MaterialTecho = viv_MaterialTecho.SelectedItem.Text;
            vivienda.viv_MaterialParedes = viv_MaterialParedes.SelectedItem.Text;
            vivienda.viv_MaterialPiso = viv_MaterialPiso.SelectedItem.Text;
            string cocinaInd;
            if (viv_CocinaIndependienteSi.Selected == false)
                cocinaInd = "F";
            else
                cocinaInd = "T";
            vivienda.viv_CocinaIndependiente = cocinaInd;
            vivienda.viv_NoCuartos = Convert.ToInt32(viv_NoCuartos.Text);
            vivienda.viv_NoDormitorios = Convert.ToInt32(viv_NoDormitorios.Text);
            vivienda.viv_TipoVivienda = viv_TipoVivienda.SelectedItem.Text;
            vivienda.alu_ID = (int)Session["alu_ID"];
            vivienda.viv_Lavadora = Convert.ToBoolean(viv_Lavadora.Checked);
            vivienda.viv_Cisterna = Convert.ToBoolean(viv_Cisterna.Checked);
            vivienda.viv_Refrigerador = Convert.ToBoolean(viv_Refrigerador.Checked);
            vivienda.viv_Drenaje = Convert.ToBoolean(viv_Drenaje.Checked);
            vivienda.viv_Compu = Convert.ToBoolean(viv_Compu.Checked);
            vivienda.viv_AcceInter = Convert.ToBoolean(viv_AcceInter.Checked);
            vivienda.viv_Auto = Convert.ToBoolean(viv_Auto.Checked);
            vivienda.viv_Moto = Convert.ToBoolean(viv_Moto.Checked);
            vivienda.viv_Horno = Convert.ToBoolean(Horno.Checked);
            vivienda.viv_Electrodomes = Convert.ToBoolean(Electrodomes.Checked);
            vivienda.viv_Regadera = Convert.ToBoolean(viv_Regadera.Checked);
            vivienda.viv_MedLuz = Convert.ToBoolean(viv_MedLuz.Checked);
            vivienda.viv_Dvd = Convert.ToBoolean(viv_Dvd.Checked);
            vivienda.viv_Radio = Convert.ToBoolean(viv_Radio.Checked);
            vivienda.viv_TV = Convert.ToBoolean(viv_TV.Checked);
            vivienda.viv_MedioTransporte = alc_MediTransp.SelectedItem.Text;
            vivienda.viv_TiempoTraslado = alc_TiempoTranslado.SelectedItem.Text;
            vivienda.viv_Luz = Convert.ToBoolean(viv_Luz.Checked);
            vivienda.viv_AguaPotable = Convert.ToBoolean(viv_AguaPotable.Checked);
            vivienda.viv_EstufaDeGas = Convert.ToBoolean(viv_EstufaDeGas.Checked);
            vivienda.viv_TinacoAgua = Convert.ToBoolean(viv_TinacoDeAgua.Checked);
            vivienda.viv_Gas = Convert.ToBoolean(viv_Gas.Checked);
            vivienda.viv_Television = Convert.ToBoolean(viv_Tele.Checked);
            vivienda.viv_Telefono = Convert.ToBoolean(viv_Telefono.Checked);
            vivienda.viv_LugarProcedencia = ief_LugarPrecedencia.Text;
            if ((ief_GastoPasaje.Text).Equals("")) { ief_GastoPasaje.Text = "0"; }
            vivienda.viv_GastoPasaje = Convert.ToDouble(ief_GastoPasaje.Text);
            return vivienda;
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
        ViviendaDAOSQL a;
        protected void Page_Load(object sender, EventArgs e)
        {
            a = new ViviendaDAOSQL();

           // Session["alu_ID"] = 2;
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
                viv_MaterialTecho.SelectedValue = dt.Rows[i]["viv_MaterialTecho"].ToString();
                viv_MaterialParedes.SelectedValue = dt.Rows[i]["viv_MaterialParedes"].ToString();
                viv_MaterialPiso.SelectedValue = dt.Rows[i]["viv_MaterialPiso"].ToString();
                if((dt.Rows[i]["viv_CocinaIndependiente"].ToString()).Equals("T")) { viv_CocinaIndependienteSi.Selected = true; }else { viv_CocinaIndependienteNo.Selected = true; }
                viv_NoCuartos.SelectedValue = dt.Rows[i]["viv_NoCuartos"].ToString();
                viv_NoDormitorios.SelectedValue = dt.Rows[i]["viv_NoDormitorios"].ToString();
                viv_TipoVivienda.SelectedValue = dt.Rows[i]["viv_TipoVivienda"].ToString();
                viv_Lavadora.Checked = Convert.ToBoolean(dt.Rows[i]["viv_Lavadora"].ToString());
                viv_Cisterna.Checked = Convert.ToBoolean(dt.Rows[i]["viv_Cisterna"].ToString());
                viv_Refrigerador.Checked = Convert.ToBoolean(dt.Rows[i]["viv_Refrigeracion"].ToString());
                viv_Drenaje.Checked = Convert.ToBoolean(dt.Rows[i]["viv_Drenaje"].ToString());
                viv_Compu.Checked = Convert.ToBoolean(dt.Rows[i]["viv_Compu"].ToString());
                viv_AcceInter.Checked = Convert.ToBoolean(dt.Rows[i]["viv_AcceInter"].ToString());
                viv_Auto.Checked = Convert.ToBoolean(dt.Rows[i]["viv_Auto"].ToString());
                viv_Moto.Checked = Convert.ToBoolean(dt.Rows[i]["viv_Moto"].ToString());
                Horno.Checked = Convert.ToBoolean(dt.Rows[i]["viv_Horno"].ToString());
                Electrodomes.Checked = Convert.ToBoolean(dt.Rows[i]["viv_Electrodomes"].ToString());
                viv_Regadera.Checked = Convert.ToBoolean(dt.Rows[i]["viv_Regadera"].ToString());
                viv_MedLuz.Checked = Convert.ToBoolean(dt.Rows[i]["viv_MedLuz"].ToString());
                viv_Dvd.Checked = Convert.ToBoolean(dt.Rows[i]["viv_Dvd"].ToString());
                viv_Radio.Checked = Convert.ToBoolean(dt.Rows[i]["viv_Radio"].ToString());
                viv_TV.Checked = Convert.ToBoolean(dt.Rows[i]["viv_TV"].ToString());
                alc_MediTransp.SelectedValue = dt.Rows[i]["viv_MedioTransporte"].ToString(); ;
                alc_TiempoTranslado.Text = dt.Rows[i]["viv_TiempoTraslado"].ToString(); ;
                viv_Luz.Checked = Convert.ToBoolean(dt.Rows[i]["viv_Luz"].ToString());
                viv_AguaPotable.Checked = Convert.ToBoolean(dt.Rows[i]["viv_AguaPotable"].ToString());
                viv_EstufaDeGas.Checked = Convert.ToBoolean(dt.Rows[i]["viv_EstufaDeGas"].ToString());
                viv_TinacoDeAgua.Checked = Convert.ToBoolean(dt.Rows[i]["viv_TinacoAgua"].ToString());
                viv_Gas.Checked = Convert.ToBoolean(dt.Rows[i]["viv_Gas"].ToString());
                viv_Tele.Checked = Convert.ToBoolean(dt.Rows[i]["viv_Television"].ToString());
                viv_Telefono.Checked = Convert.ToBoolean(dt.Rows[i]["viv_Telefono"].ToString());
                ief_LugarPrecedencia.Text = dt.Rows[i]["viv_LugarProcedencia"].ToString(); ;
                ief_GastoPasaje.Text = dt.Rows[i]["viv_GastoPasaje"].ToString();
            }
        }

        protected void btnSiguiente2_Click(object sender, EventArgs e)
        {
            UControl control = new UControl();
            FacadeAspiranteSE f = new FacadeAspiranteSE(this);
            if (f.LlamarSelectExiste(2))
            {
                f.LlamarUpdate(2);
                Type cstype = this.GetType();
                string script = "<script language='javascript'>alert('!!Felicidades!!, Tu información se actualizó correctamente')</script>";
                this.ClientScript.RegisterStartupScript(cstype, Guid.NewGuid().ToString(), script, false);
            }
            else
            {
                f.LlamarInsert(2);
                control.RegistrarFormulario(3, Convert.ToInt32(Session["alu_ID"]));
                Type cstype = this.GetType();
                string script = "<script language='javascript'>alert('!!Felicidades!!, Tu información se guardo correctamente')</script>";
                this.ClientScript.RegisterStartupScript(cstype, Guid.NewGuid().ToString(), script, false);
            } Server.Transfer("formulario_1.aspx", true);
            
        }
    }
}