using Conect.DAO;
using Conect.DTO;
using Conect.Utileria;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Conect.Formularios
{
    public partial class formulario_2 : System.Web.UI.Page, IAspirante
    {
        UControl con = new UControl();
        protected void Page_Load(object sender, EventArgs e)
        {
            AlumnoDAOSQL alu = new AlumnoDAOSQL();
            int id = (int)Session["alu_ID"];
            if (!IsPostBack)
            {
                lei_ID.Visible = false;
                if (alu.SelectExiste(id))//si existe el alumno
                {
                    EstablecerInicio();
                    CargarOcupacion();
                    btnGuardar.Text = "ACTUALIZAR";
                    BackUpTablas(id);//ESTE METODO RECUPERA TODO DE LAS TABLAS NO SE LE TIENE QUE MOVER NADA SOLO TERMINA DE IGUALAR COMPONENTES
                }
                else
                {
                    EstablecerInicio();
                    CargarOcupacion();
                    DropDownList1.Items.Insert(0, "-Seleccione-");
                    DropDownList2.Items.Insert(0, "-Seleccione-");
                    DropDownList3.Items.Insert(0, "-Seleccione-");
                    esp_id.Items.Insert(0, "-Seleccione-");
                    est_Natal_ID.Items.Insert(0, "-Seleccione-");
                    est_Proced_ID.Items.Insert(0, "-Seleccione-");
                    est_Escu_ID.Items.Insert(0, "-Seleccione-");
                    btnGuardar.Text = "GUARDAR";
                }
            }
        }
        public void EstablecerInicio()
        {

            LlenarCombo(DropDownList1, UControl.carreras);
            LlenarCombo(DropDownList2, UControl.carreras);
            LlenarCombo(DropDownList3, UControl.carreras);
            DropDownList1.Items.Insert(0, "-Seleccione-");
            DropDownList2.Items.Insert(0, "-Seleccione-");
            DropDownList3.Items.Insert(0, "-Seleccione-");
            LlenarCombo(esp_id, UControl.modal);
            LlenarCombo(dis_ID, UControl.discapacidad);
            LlenarCombo(lei_ID, UControl.l_Ind);
            LlenarCombo(est_Natal_ID, UControl.estado);
            LlenarCombo(est_Proced_ID, UControl.estado);
            LlenarCombo(est_Escu_ID, UControl.estado);
            LlenarCombo(Familiar0_Ocupacion, UControl.ocupaciones);
            LlenarCombo(Familiar1_Ocupacion, UControl.ocupaciones);
            LlenarCombo(Familiar2_Ocupacion, UControl.ocupaciones);
            LlenarCombo(Familiar3_Ocupacion, UControl.ocupaciones);
            LlenarCombo(Familiar4_Ocupacion, UControl.ocupaciones);
            LlenarCombo(Familiar5_Ocupacion, UControl.ocupaciones);
            LlenarCombo(Familiar6_Ocupacion, UControl.ocupaciones);
            LlenarCombo(alc_EspBachi, UControl.propedeuticos);
        }
        Boolean validar() {
            Boolean r=true;
            if (DropDownList1.SelectedIndex == 0){  r = false; }
            if (DropDownList2.SelectedIndex == 0) { r = false; }
            if (DropDownList3.SelectedIndex == 0) { r = false; }
            if (esp_id.SelectedIndex == 0) { r = false; }
            return r;
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (validar())
            {


                UControl c = new UControl();
                FacadeAspirante fa = new FacadeAspirante(this);
                if (btnGuardar.Text == "GUARDAR")
                {
                    Session["alu_ID"] = fa.InsertAlumno();//inserta y al mismo tiempo recupera el id
                    int id = (int)Session["alu_ID"];
                    fa.InsertAlumCom(id);
                    for (int i = 0; i < 7; i++)//cambia el 3 por el SelectedItem.text del comobox que tengas
                    {
                        fa.InsertDatosFamiliares(llenarDatosFamiliares(i), id);
                    }
                    fa.DeleteDatosFamiliaresR(id);
                    c.RegistrarFormulario(1, id);
                }
                else
                {
                    int id = (int)Session["alu_ID"];
                    fa.DeleteDatosFamiliares(id);
                    for (int i = 0; i < 7; i++)//cambia el 3 por el SelectedItem.text del comobox que tengas
                    {
                        fa.InsertDatosFamiliares(llenarDatosFamiliares(i), id);
                    }
                    fa.LlamarUpdate(id);
                }

                Server.Transfer("formulario_1.aspx", true);
            }
            else
            { //Response.Write("<script>alert('Asegurece de haber seleccionado una opcion de todos las listas desplegables') </script>"); 
            }

        }

        #region RECUPERA LOS DATOS DE LA BASE DE DATOS
        DataTable dt;
        public void RecuperarAlumno()
        { 
}
        void BackUpTablas(int id)
        {
            AlumnoDAOSQL a = new AlumnoDAOSQL();
            dt = a.GetTabla(id);
            GetDataAlumno(dt);
            AlumComDAOSQL ac = new AlumComDAOSQL();
            dt = ac.GetTabla(id);
            GetDataAlumCom(dt);

            #region recuperar Datos Familiares
            DatosFamiliaresDAOSQL df = new DatosFamiliaresDAOSQL();
            dt = df.GetTabla(id);//ESTE METODO TRAE TODOS LOS DATOS DE LOS FAMILIARES DEL ALUMNO QUE TIENE ESTE ID
            for (int i = 0; i < dt.Rows.Count; i++)//RECORRE LAS FILAS (No de familiares que tiene el aspirante) solo llenara SOLO TERMINA DE IGUALAR ELEMENTOS
            {
                if (i == 0)//este if corresponde a llenar la primera fila
                {
                    string daf_Nombre = dt.Rows[i]["daf_Nombre"].ToString();// aqui debes terminar de igualar componentes de tus tablas
                    Familiar0_Nombre.Text = daf_Nombre;
                    string daf_Edad = dt.Rows[i]["daf_Edad"].ToString();
                    Familiar0_Edad.Text = daf_Edad;
                    string daf_Parentezco = dt.Rows[i]["daf_Parentezco"].ToString();
                    Familiar0_Parentezco.Text = daf_Parentezco;
                    string daf_Escolaridad = dt.Rows[i]["daf_Escolaridad"].ToString();
                    Familiar0_Escolaridad.SelectedValue = daf_Escolaridad;
                    string daf_EstadoCivil = dt.Rows[i]["daf_EdoCivil"].ToString();
                    Familiar0_EstadoCivil.SelectedValue = daf_EstadoCivil;
                    string ocu_ID = dt.Rows[i]["ocu_ID"].ToString();
                    Familiar0_Ocupacion.SelectedValue = Convert.ToString(ocu_ID);
                }
                if (i == 1)//llena la segunda si es que la hay, 
                {
                    string daf_Nombre = dt.Rows[i]["daf_Nombre"].ToString();// aqui debes terminar de igualar componentes de tus tablas
                    Familiar1_Nombre.Text = daf_Nombre;
                    string daf_Edad = dt.Rows[i]["daf_Edad"].ToString();
                    Familiar1_Edad.Text = daf_Edad;
                    string daf_Parentezco = dt.Rows[i]["daf_Parentezco"].ToString();
                    Familiar1_Parentezco.Text = daf_Parentezco;
                    string daf_Escolaridad = dt.Rows[i]["daf_Escolaridad"].ToString();
                    Familiar1_Escolaridad.SelectedValue = daf_Escolaridad;
                    string daf_EstadoCivil = dt.Rows[i]["daf_EdoCivil"].ToString();
                    Familiar1_EstadoCivil.SelectedValue = daf_EstadoCivil;
                    string ocu_ID = dt.Rows[i]["ocu_ID"].ToString();
                    Familiar1_Ocupacion.SelectedValue = Convert.ToString(ocu_ID);
                }
                if (i == 2)
                {
                    string daf_Nombre = dt.Rows[i]["daf_Nombre"].ToString();
                    Familiar2_Nombre.Text = daf_Nombre;
                    string daf_Edad = dt.Rows[i]["daf_Edad"].ToString();
                    Familiar2_Edad.Text = daf_Edad;
                    string daf_Parentezco = dt.Rows[i]["daf_Parentezco"].ToString();
                    Familiar2_Parentezco.Text = daf_Parentezco;
                    string daf_Escolaridad = dt.Rows[i]["daf_Escolaridad"].ToString();
                    Familiar2_Escolaridad.SelectedValue = daf_Escolaridad;
                    string daf_EstadoCivil = dt.Rows[i]["daf_EdoCivil"].ToString();
                    Familiar2_EstadoCivil.SelectedValue = daf_EstadoCivil;
                    string ocu_ID = dt.Rows[i]["ocu_ID"].ToString();
                    Familiar2_Ocupacion.SelectedValue = Convert.ToString(ocu_ID);
                }
                if (i == 3)
                {
                    string daf_Nombre = dt.Rows[i]["daf_Nombre"].ToString();
                    Familiar3_Nombre.Text = daf_Nombre;
                    string daf_Edad = dt.Rows[i]["daf_Edad"].ToString();
                    Familiar3_Edad.Text = daf_Edad;
                    string daf_Parentezco = dt.Rows[i]["daf_Parentezco"].ToString();
                    Familiar3_Parentezco.Text = daf_Parentezco;
                    string daf_Escolaridad = dt.Rows[i]["daf_Escolaridad"].ToString();
                    Familiar3_Escolaridad.SelectedValue = daf_Escolaridad;
                    string daf_EstadoCivil = dt.Rows[i]["daf_EdoCivil"].ToString();
                    Familiar3_EstadoCivil.SelectedValue = daf_EstadoCivil;
                    string ocu_ID = dt.Rows[i]["ocu_ID"].ToString();
                    Familiar3_Ocupacion.SelectedValue = Convert.ToString(ocu_ID);
                }
                if (i == 4)
                {
                    string daf_Nombre = dt.Rows[i]["daf_Nombre"].ToString();
                    Familiar4_Nombre.Text = daf_Nombre;
                    string daf_Edad = dt.Rows[i]["daf_Edad"].ToString();
                    Familiar4_Edad.Text = daf_Edad;
                    string daf_Parentezco = dt.Rows[i]["daf_Parentezco"].ToString();
                    Familiar4_Parentezco.Text = daf_Parentezco;
                    string daf_Escolaridad = dt.Rows[i]["daf_Escolaridad"].ToString();
                    Familiar4_Escolaridad.SelectedValue = daf_Escolaridad;
                    string daf_EstadoCivil = dt.Rows[i]["daf_EdoCivil"].ToString();
                    Familiar4_EstadoCivil.SelectedValue = daf_EstadoCivil;
                    string ocu_ID = dt.Rows[i]["ocu_ID"].ToString();
                    Familiar4_Ocupacion.SelectedValue = Convert.ToString(ocu_ID);
                }
                if (i == 5)
                {
                    string daf_Nombre = dt.Rows[i]["daf_Nombre"].ToString();
                    Familiar5_Nombre.Text = daf_Nombre;
                    string daf_Edad = dt.Rows[i]["daf_Edad"].ToString();
                    Familiar5_Edad.Text = daf_Edad;
                    string daf_Parentezco = dt.Rows[i]["daf_Parentezco"].ToString();
                    Familiar5_Parentezco.Text = daf_Parentezco;
                    string daf_Escolaridad = dt.Rows[i]["daf_Escolaridad"].ToString();
                    Familiar5_Escolaridad.SelectedValue = daf_Escolaridad;
                    string daf_EstadoCivil = dt.Rows[i]["daf_EdoCivil"].ToString();
                    Familiar5_EstadoCivil.SelectedValue = daf_EstadoCivil;
                    string ocu_ID = dt.Rows[i]["ocu_ID"].ToString();
                    Familiar5_Ocupacion.SelectedValue = Convert.ToString(ocu_ID);
                }
                if (i == 6)//LLENA LA ULTIMA FILA
                {
                    string daf_Nombre = dt.Rows[i]["daf_Nombre"].ToString();
                    Familiar6_Nombre.Text = daf_Nombre;
                    string daf_Edad = dt.Rows[i]["daf_Edad"].ToString();
                    Familiar6_Edad.Text = daf_Edad;
                    string daf_Parentezco = dt.Rows[i]["daf_Parentezco"].ToString();
                    Familiar6_Parentezco.Text = daf_Parentezco;
                    string daf_Escolaridad = dt.Rows[i]["daf_Escolaridad"].ToString();
                    Familiar6_Escolaridad.SelectedValue = daf_Escolaridad;
                    string daf_EstadoCivil = dt.Rows[i]["daf_EdoCivil"].ToString();
                    Familiar6_EstadoCivil.SelectedValue = daf_EstadoCivil;
                    string ocu_ID = dt.Rows[i]["ocu_ID"].ToString();
                    Familiar6_Ocupacion.SelectedValue = Convert.ToString(ocu_ID);
                }
            }
            #endregion
        }
        public void GetDataAlumno(DataTable tbl)
        {

            UControl controlCombos = new UControl();
            DataRow columna = tbl.Rows[0];
            DropDownList1.SelectedValue = DropDownList1.Items.FindByValue(columna["alu_Carrera"].ToString()).Value;
            DropDownList2.SelectedValue = DropDownList2.Items.FindByValue(columna["alu_SegundaOpcion"].ToString()).Value;
            DropDownList3.SelectedValue = DropDownList3.Items.FindByValue(columna["alu_TerceraOpcion"].ToString()).Value;
            esp_id.SelectedValue = esp_id.Items.FindByValue(columna["mod_ID"].ToString()).Value;
            alu_Nombre.Text = columna["alu_Nombre"].ToString();
            alu_ApellidoPaterno.Text = columna["alu_ApellidoPaterno"].ToString();
            alu_ApellidoMaterno.Text = columna["alu_ApellidoMaterno"].ToString();
            alu_Sexo.SelectedValue = alu_Sexo.Items.FindByValue(columna["alu_Sexo"].ToString()).Value;
            alc_edad.Text = columna["alu_Edad"].ToString();
            dis_ID.SelectedValue = dis_ID.Items.FindByValue(columna["dis_ID"].ToString()).Value;
            lei_ID.SelectedValue = lei_ID.Items.FindByValue(columna["lei_ID"].ToString()).Value;
        }
        public void GetDataAlumCom(DataTable tbl)
        {
            DataRow columna = tbl.Rows[0];
            alc_Curp.Text = columna["alc_Curp"].ToString();
            alc_EdoCivil.SelectedValue = alc_EdoCivil.Items.FindByValue(columna["alc_EdoCivil"].ToString()).Value;
            alc_FechaNac.ReadOnly = false;
            DateTime dt = Convert.ToDateTime(columna["alc_FechaNac"].ToString());
            alc_FechaNac.Text = dt.ToShortDateString();
            est_Natal_ID.SelectedValue = est_Natal_ID.Items.FindByValue(columna["est_Natal_ID"].ToString()).Value;
            LlenarCombo(mun_Natal_ID, con.Municipios(est_Natal_ID.SelectedValue));
            mun_Natal_ID.SelectedValue = mun_Natal_ID.Items.FindByValue(columna["mun_Natal_ID"].ToString()).Value;
            est_Proced_ID.SelectedValue = est_Proced_ID.Items.FindByValue(columna["est_Proced_ID"].ToString()).Value;
            LlenarCombo(mun_Proced_ID, con.Municipios(est_Proced_ID.SelectedValue));
            mun_Proced_ID.SelectedValue = mun_Proced_ID.Items.FindByValue(columna["mun_Proced_ID"].ToString()).Value;
            alc_Localidad.Text = columna["alc_Localidad"].ToString();
            alc_CodPostal.Text = columna["alc_CodPostal"].ToString();
            alc_Colonia.Text = columna["alc_Colonia"].ToString();
            alc_Calle.Text = columna["alc_Colonia"].ToString();
            alc_NumExt.Text = columna["alc_NumExt"].ToString();
            alc_NumInt.Text = columna["alc_NumInt"].ToString();
            alc_Tel.Text = columna["alc_Tel"].ToString();
            alc_Celular.Text = columna["alc_Celular"].ToString();
            alc_correo.Text = columna["alc_Correo"].ToString();
            alc_facebook.Text = columna["alc_facebook"].ToString();
            est_Escu_ID.SelectedValue = est_Escu_ID.Items.FindByValue(columna["est_Escue_ID"].ToString()).Value;
            LlenarCombo(mun_Escu_ID, con.Municipios(est_Escu_ID.SelectedValue));
            mun_Escu_ID.SelectedValue = mun_Escu_ID.Items.FindByValue(columna["mun_Escue_ID"].ToString()).Value;
            alc_EspBachi.SelectedValue = alc_EspBachi.Items.FindByValue(columna["pro_ID"].ToString()).Value;
            LlenarCombo(esc_ID, con.Escuela(int.Parse(mun_Escu_ID.SelectedValue)));
            esc_ID.SelectedValue = esc_ID.Items.FindByValue(columna["esc_ID"].ToString()).Value;
            txtAnnoConcluido.Text = columna["alc_AnioTerminoBachi"].ToString();
            alc_PromBachi.Text = columna["alc_PromBachi"].ToString();
        }
        public void CargarOcupacion()
        {
            UControl cont = new UControl();
            dt = cont.Ocupaciones();
            Familiar0_Ocupacion.Items.Clear();
            Familiar1_Ocupacion.Items.Clear();
            Familiar2_Ocupacion.Items.Clear();
            Familiar3_Ocupacion.Items.Clear();
            Familiar4_Ocupacion.Items.Clear();
            Familiar5_Ocupacion.Items.Clear();
            Familiar6_Ocupacion.Items.Clear();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string ocupacion =  dt.Rows[i]["ocu_Nombre"].ToString();
                string id = dt.Rows[i]["ocu_ID"].ToString();
                Familiar0_Ocupacion.Items.Add(new ListItem(ocupacion, id));
                Familiar1_Ocupacion.Items.Add(new ListItem(ocupacion, id));
                Familiar2_Ocupacion.Items.Add(new ListItem(ocupacion, id));
                Familiar3_Ocupacion.Items.Add(new ListItem(ocupacion, id));
                Familiar4_Ocupacion.Items.Add(new ListItem(ocupacion, id));
                Familiar5_Ocupacion.Items.Add(new ListItem(ocupacion, id));
                Familiar6_Ocupacion.Items.Add(new ListItem(ocupacion, id));
            }
        }
        #endregion

        #region Obtencion de los datos para la bd de acuerdo al modelo
        public AlumnoDTO AlumnoDTO
        {
            get
            {
                return llenarAlumno();
            }
        }
        AlumnoDTO llenarAlumno()
        {
            AlumnoDTO a = new AlumnoDTO();
            a.alu_NumControl = (string)Session["matricula"];
            a.alu_Nombre = alu_Nombre.Text;
            a.alu_ApellidoPaterno = alu_ApellidoPaterno.Text;
            a.alu_ApellidoMaterno = alu_ApellidoMaterno.Text;
            a.alu_Sexo = char.Parse(alu_Sexo.Text);
            a.esp_ID = int.Parse(esp_id.SelectedValue);
            a.alu_Edad = int.Parse(alc_edad.Text);
            a.mod_ID = int.Parse(esp_id.SelectedValue);
            a.alu_Carrera = int.Parse(DropDownList1.SelectedValue);
            a.alu_SegundaOpcion =int.Parse(DropDownList2.SelectedValue);
            a.alu_TerceraOpcion = int.Parse(DropDownList3.SelectedValue);
            if (rSi.Selected == true) { a.lei_ID = Convert.ToInt32(lei_ID.SelectedValue); } else { a.lei_ID = 1; }
            if (rbSi.Selected == true) { a.dis_ID = Convert.ToInt32(lei_ID.SelectedValue); } else { a.dis_ID = 1; }
            return a;
        }

        public AlumComDTO AlumComDTO
        {
            get
            {
                return llenarAlumCom();
            }
        }
        AlumComDTO llenarAlumCom()
        {
            AlumComDTO alc_Curp = new DTO.AlumComDTO();
            alc_Curp.alc_Curp = this.alc_Curp.Text;
            alc_Curp.alc_Correo = alc_correo.Text;
            alc_Curp.alc_Calle = alc_Calle.Text;
            alc_Curp.alc_Colonia = alc_Colonia.Text;
            alc_Curp.alc_Localidad = alc_Localidad.Text;
            alc_Curp.alc_NumInt = alc_NumInt.Text;
            alc_Curp.alc_NumExt = alc_NumExt.Text;
            alc_Curp.alc_CodPostal = alc_CodPostal.Text;
            alc_Curp.mun_Proced_ID = int.Parse(mun_Proced_ID.SelectedValue);
            alc_Curp.est_Proced_ID = int.Parse(est_Proced_ID.SelectedValue);
            alc_Curp.alc_FechaNac = Convert.ToDateTime(alc_FechaNac.Text);
            alc_Curp.mun_Natatl_ID = int.Parse(mun_Natal_ID.SelectedValue);
            alc_Curp.est_Natatl_ID = int.Parse(est_Natal_ID.SelectedValue);
            alc_Curp.alc_PromBachi = float.Parse(alc_PromBachi.Text);
            alc_Curp.pro_ID =int.Parse(alc_EspBachi.SelectedValue);
            alc_Curp.alc_EdoCivil = char.Parse(alc_EdoCivil.SelectedValue);
            alc_Curp.alc_Tel = alc_Tel.Text;
            alc_Curp.alc_AnioTerminoBachi = txtAnnoConcluido.Text;
            alc_Curp.mun_Escue_ID = int.Parse(mun_Escu_ID.SelectedValue);
            alc_Curp.est_Escue_ID = int.Parse(est_Escu_ID.SelectedValue);
            alc_Curp.alc_Celular = alc_Celular.Text;
            alc_Curp.alc_Fcaebook = alc_facebook.Text;
            alc_Curp.esc_ID = int.Parse(esc_ID.SelectedValue);
            return alc_Curp;
        }

        #region ESTE METODO OBTIENE UN INDICE QUE CORRESPONTE A UNA FILA DE LA TABLA NO NECESITA MODIFICACIONES
        DatosFamiliaresDTO llenarDatosFamiliares(int i)//
        {
            DatosFamiliaresDTO df = null;
                if (i == 0)//JALA DATOS DE LA FILA 1
                {
                df = new DatosFamiliaresDTO();
                df.daf_Nombre = Familiar0_Nombre.Text;
                int edad = 0;
                if (Familiar0_Edad.Text != "") { edad = Convert.ToInt32(Familiar0_Edad.Text); }
                    df.daf_Edad = edad;
                    df.daf_Escolaridad = Familiar0_Escolaridad.SelectedItem.Text;
                    df.daf_EdoCivil = Familiar0_EstadoCivil.SelectedItem.Text;
                    df.daf_Parentezco = Familiar0_Parentezco.SelectedItem.Text;
                    df.ocu_ID = Convert.ToInt32(Familiar0_Ocupacion.SelectedValue); 
                return df;
                }
                if (i == 1)//JALA DATOS DE LA FILA 2
                {
                df = new DatosFamiliaresDTO();
                df.daf_Nombre = Familiar1_Nombre.Text;
                int edad = 0;
                if (Familiar1_Edad.Text != "") { edad = Convert.ToInt32(Familiar1_Edad.Text); }
                df.daf_Edad = edad;
                df.daf_Escolaridad = Familiar1_Escolaridad.SelectedItem.Text;
                    df.daf_EdoCivil = Familiar1_EstadoCivil.SelectedItem.Text;
                    df.daf_Parentezco = Familiar1_Parentezco.SelectedItem.Text;
                    df.ocu_ID = Convert.ToInt32(Familiar1_Ocupacion.SelectedValue); 
                return df;
            }
                if (i == 2)
                {
                df = new DatosFamiliaresDTO();
                df.daf_Nombre = Familiar2_Nombre.Text;
                int edad = 0;
                if (Familiar2_Edad.Text != "") { edad = Convert.ToInt32(Familiar2_Edad.Text); }
                df.daf_Edad = edad;
                df.daf_Escolaridad = Familiar2_Escolaridad.SelectedItem.Text;
                    df.daf_EdoCivil = Familiar2_EstadoCivil.SelectedItem.Text;
                    df.daf_Parentezco = Familiar2_Parentezco.SelectedItem.Text;
                    df.ocu_ID = Convert.ToInt32(Familiar2_Ocupacion.SelectedValue); 
                return df;
            }
                if (i == 3)
                {
                df = new DatosFamiliaresDTO();
                df.daf_Nombre = Familiar3_Nombre.Text;
                int edad = 0;
                if (Familiar3_Edad.Text != "") { edad = Convert.ToInt32(Familiar3_Edad.Text); }
                df.daf_Edad = edad;
                df.daf_Escolaridad = Familiar3_Escolaridad.SelectedItem.Text;
                    df.daf_EdoCivil = Familiar3_EstadoCivil.SelectedItem.Text;
                    df.daf_Parentezco = Familiar3_Parentezco.SelectedItem.Text;
                    df.ocu_ID = Convert.ToInt32(Familiar3_Ocupacion.SelectedValue); 
                return df;
            }
                if (i == 4)
                {
                df = new DatosFamiliaresDTO();
                df.daf_Nombre = Familiar4_Nombre.Text;
                int edad = 0;
                if (Familiar4_Edad.Text != "") { edad = Convert.ToInt32(Familiar4_Edad.Text); }
                df.daf_Edad = edad;
                df.daf_Escolaridad = Familiar4_Escolaridad.SelectedItem.Text;
                    df.daf_EdoCivil = Familiar4_EstadoCivil.SelectedItem.Text;
                    df.daf_Parentezco = Familiar4_Parentezco.SelectedItem.Text;
                    df.ocu_ID = 1;  Convert.ToInt32(Familiar4_Ocupacion.SelectedValue); 
                return df;
            }
                if (i == 5)
                {
                df = new DatosFamiliaresDTO();
                df.daf_Nombre = Familiar5_Nombre.Text;
                int edad = 0;
                if (Familiar5_Edad.Text != "") { edad = Convert.ToInt32(Familiar5_Edad.Text); }
                df.daf_Edad = edad;
                df.daf_Escolaridad = Familiar5_Escolaridad.SelectedItem.Text;
                    df.daf_EdoCivil = Familiar5_EstadoCivil.SelectedItem.Text;
                    df.daf_Parentezco = Familiar5_Parentezco.SelectedItem.Text;
                    df.ocu_ID = Convert.ToInt32(Familiar5_Ocupacion.SelectedValue);
                return df;
            }
                if (i == 6)
                {
                df = new DatosFamiliaresDTO();
                df.daf_Nombre = Familiar6_Nombre.Text;
                int edad = 0;
                if (Familiar6_Edad.Text != "") { edad = Convert.ToInt32(Familiar6_Edad.Text); }
                df.daf_Edad = edad;
                df.daf_Escolaridad = Familiar6_Escolaridad.SelectedItem.Text;
                    df.daf_EdoCivil = Familiar6_EstadoCivil.SelectedItem.Text;
                    df.daf_Parentezco = Familiar6_Parentezco.SelectedItem.Text;
                    df.ocu_ID = Convert.ToInt32(Familiar6_Ocupacion.SelectedValue);
                return df;
            }
            return null;
        }
        #endregion

        #endregion

        public DatosFamiliaresDTO DatosFamiliaresDTO
        {
            get
            {
                return llenarDatosFamiliares(4);
            }
        }//ESTE METODO QUEDO INUTILIZADO
        protected void est_Natal_ID_SelectedIndexChanged(object sender, EventArgs e)
        {
            est_Natal_ID.Items.Remove("-Seleccione-");
            LlenarCombo(mun_Natal_ID, con.Municipios(est_Natal_ID.SelectedValue));
        }
        protected void est_Proced_ID_SelectedIndexChanged(object sender, EventArgs e)
        {
            est_Proced_ID.Items.Remove("-Seleccione-");
            LlenarCombo(mun_Proced_ID, con.Municipios(est_Proced_ID.SelectedValue));
        }
        protected void est_Escu_ID_SelectedIndexChanged(object sender, EventArgs e)
        {
            est_Escu_ID.Items.Remove("-Seleccione-");
            LlenarCombo(mun_Escu_ID, con.Municipios(est_Escu_ID.SelectedValue));
        }
        protected void DropDownList1_TextChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == DropDownList2.SelectedValue || DropDownList1.SelectedValue == DropDownList3.SelectedValue)
            {
                DropDownList1.Attributes["OnSelectedIndexChanged"] = "alert('Esta carrera ya ha sido seleccionada'); return false;";
                DropDownList1.SelectedIndex = 0;
            }
        }
        protected void DropDownList2_TextChanged(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedValue == DropDownList1.SelectedValue || DropDownList2.SelectedValue == DropDownList3.SelectedValue)
                DropDownList2.SelectedIndex = 0;
        }
        protected void DropDownList3_TextChanged(object sender, EventArgs e)
        {
            if (DropDownList3.SelectedValue == DropDownList2.SelectedValue || DropDownList3.SelectedValue == DropDownList1.SelectedValue)
                DropDownList3.SelectedIndex = 0;
        }
        protected void mun_Escu_ID_SelectedIndexChanged(object sender, EventArgs e)
        {
            LlenarCombo(esc_ID, con.Escuela(int.Parse(mun_Escu_ID.SelectedValue)));
        }
        //protected void RadioButtonList1_TextChanged(object sender, EventArgs e)
        //{
        //    if (rbSi.Selected == true)
        //    {
        //        DropDownList4.Visible = true;
        //    }
        //    else
        //    {
        //        DropDownList4.Visible = false;
        //    }
        //}
        //public int ObtenerID(DropDownList ddw, ListItem rb)
        //{
        //    int id = 0;
        //    if (rb.Selected == true)
        //    {
        //        id = Convert.ToInt32(ddw.SelectedValue);
        //    }
        //    else
        //    {
        //        id = 1;
        //    }
        //    return id;
        //}
        //protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (rSi.Selected)
        //    {
        //        DropDownList5.Visible = true;
        //    }
        //    else
        //    {
        //        DropDownList5.Visible = false;
        //    }
        //}
        public void LlenarCombo(DropDownList cb, DataSet ds)
        {
            
            cb.DataSource = ds;
            cb.DataTextField = ds.Tables[0].Columns[1].ToString();
            cb.DataValueField = ds.Tables[0].Columns[0].ToString();
            cb.DataMember = ds.Tables[0].TableName;
            cb.DataBind();
        }

        protected void rb_dis_ID_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbSi.Selected == true)
            {
                dis_ID.Visible = true;
            }
            else
            {
                dis_ID.Visible = false;
            }
        }

        protected void rb_lei_ID_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rSi.Selected)
            {
                lei_ID.Visible = true;
            }
            else
            {
                lei_ID.Visible = false;
            }
        }
    }
}