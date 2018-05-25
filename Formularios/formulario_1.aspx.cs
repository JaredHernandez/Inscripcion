using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Conect.Utileria;
using System.Data.SqlClient;
using Conect.DAO;
using System.IO;
using System.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Diagnostics;
using System.IO;

namespace Conect.Formularios
{
    public partial class formulario_1 : System.Web.UI.Page
    {
        UConexion cc;
        protected void Page_Load(object sender, EventArgs e)
        {
            cc = new UConexion();
            //Session["matricula"] = "1530487";

            AlumnoDAOSQL al = new AlumnoDAOSQL();
            string matricula = (string)Session["matricula"];//asi se recupera una variable de session
            if (!al.SelectExisteMatricula(matricula))
            {
                Session["alu_ID"] = 0;
                iniComp(0);
                PanelSocio.Visible = false;
            }
            else
            {
                Session["alu_ID"] = al.ObtenerID(matricula);
                iniComp((int)Session["alu_ID"]);
                PanelSocio.Visible = true;
            }

        }
        void setN()
        {
            if (Realizado1.Visible == true)
            {
                Falta1.Visible = false;
            }
            if (Realizado2.Visible == true)
            {
                Falta2.Visible = false;
            }
            if (Realizado3.Visible == true)
            {
                Falta3.Visible = false;
            }
            if (Realizado4.Visible == true)
            {
                Falta4.Visible = false;
            }
            if (Realizado5.Visible == true)
            {
                Falta5.Visible = false;
            }
        }
        void setV(int x)
        {
            switch (x)
            {
                case 1: Realizado1.Visible = true; break;
                case 2: Realizado2.Visible = true; break;
                case 3: Realizado3.Visible = true; break;
                case 4: Realizado4.Visible = true; break;
                case 5: Realizado5.Visible = true; break;

                default:
                    break;
            }
        }
        void iniComp(int id)
        {
            Realizado1.Visible = false;
            Realizado2.Visible = false;
            Realizado3.Visible = false;
            Realizado4.Visible = false;
            Realizado5.Visible = false;
            UControl arr = new UControl();
            int[] c = null;
            c = arr.RegFormularios(id);
            int y = 0;
            while (c[y] > 0)
            {

                setV(c[y]);
                y++;

            }
            setN();
        }

        #region Evento que no sirve para nada
        protected void Mod_Soli_SelectedIndexChanged(object sender, EventArgs e)
        {


        }
        #endregion
        private DataTable sacarDatosCarreras(string id)
        {
        SqlCommand command;
        SqlConnection con;
        string qwery;
        DataTable dtt = null;
            try
            {

                dtt = new DataTable();
                con = new SqlConnection();
                con = cc.Conexion();
                using (con)
                {
                    string query = "SELECT esp_Nombre FROM Especialidades where esp_ID = @esp_ID";
                    command = new SqlCommand(query, con);
                    command.Parameters.Add("@esp_ID", SqlDbType.Int).Value = id;
                    dtt.Load(command.ExecuteReader());
                    con.Close();
                }
            }
            catch (Exception)
            {
                throw;
            }
            return dtt;
        }
        private DataTable sacarDatosModalidad(string id)
        {
            SqlCommand command;
            SqlConnection con;
            string qwery;
            DataTable dtt = null;
            try
            {

                dtt = new DataTable();
                con = new SqlConnection();
                con = cc.Conexion();
                using (con)
                {
                    string query = "SELECT mod_Nombre FROM Modalidad where mod_ID = @mod_ID";
                    command = new SqlCommand(query, con);
                    command.Parameters.Add("@mod_ID", SqlDbType.Int).Value = id;
                    dtt.Load(command.ExecuteReader());
                    con.Close();
                }
            }
            catch (Exception)
            {
                throw;
            }
            return dtt;
        }

        private void GenerarPDF()
        {
            // string nombreAlumno = "", Fecha = "", matricula = "", carrera = "", modalidad = "";
            // string segunda = "", tercera = "";
            // int id = (int)Session["alu_ID"];
            // DataTable dt;
            // AlumnoDAOSQL obj = new AlumnoDAOSQL();
            // dt = obj.GetTabla((int)Session["alu_ID"]);
            // for (int i = 0; i < dt.Rows.Count; i++)//RECORRE LAS FILAS (No de familiares que tiene el aspirante) solo llenara SOLO TERMINA DE IGUALAR ELEMENTOS
            // {
            //     nombreAlumno = dt.Rows[i]["alu_Nombre"].ToString(); ;
            //     Fecha = "Fecha: " + DateTime.Today.ToLongDateString();
            //     matricula = (string)Session["matricula"];
            //     //  carrera = dt.Rows[i]["alu_Carrera"].ToString(); ;
            //     carrera = sacarDatosCarreras((dt.Rows[i]["alu_Carrera"].ToString())).ToString();
            //     segunda= sacarDatosCarreras((dt.Rows[i]["alu_SegundaOpcion"].ToString())).ToString();
            //     tercera= sacarDatosCarreras((dt.Rows[i]["alu_TerceraOpcion"].ToString())).ToString();
            //     // segunda = dt.Rows[i]["alu_SegundaOpcion"].ToString();
            //     //  tercera = dt.Rows[i]["alu_TerceraOpcion"].ToString();
            //     //  modalidad = dt.Rows[i]["mod_ID"].ToString(); ;
            //     modalidad = sacarDatosModalidad(dt.Rows[i]["mod_ID"].ToString()).ToString();

            // }
            // StringWriter sw = new StringWriter();
            // string html = sw.ToString();

            // Document doc = new Document();

            // PdfWriter.GetInstance
            // (doc, new FileStream(Environment.GetFolderPath
            // (Environment.SpecialFolder.Desktop)
            // + "\\Reporte.pdf", FileMode.Create));
            // doc.Open();

            // Chunk chunk = new Chunk("Universidad Politécnica de Tulancingo", FontFactory.GetFont("ARIAL", 20, iTextSharp.text.Font.BOLD));

            // doc.Add(new Paragraph("                       "));
            // doc.Add(new Paragraph("                       "));
            // doc.Add(new Paragraph("                       "));
            // iTextSharp.text.Image imagen = iTextSharp.text.Image.GetInstance("C:\\Users\\Moise\\Pictures\\Conect\\Conect\\Formularios\\LogoUPT1234.png");
            // imagen.BorderWidth = 0;
            // imagen.Alignment = Element.ALIGN_LEFT;
            // float percentage = 0.0f;
            // percentage = 150 / imagen.Width;
            // imagen.ScalePercent(percentage * 100);
            // doc.Add(imagen);
            // doc.Add(new Paragraph(chunk));
            // doc.Add(new Paragraph("-----------------------------------------------------------------------------------------------------------------------------"));
            // doc.Add(new Paragraph("                       "));
            // doc.Add(new Paragraph("                       "));
            // doc.Add(new Paragraph("                       "));
            // doc.Add(new Paragraph(Fecha));
            // doc.Add(new Paragraph("                       "));
            // doc.Add(new Paragraph(" Nombre aspirante : " + nombreAlumno)); doc.Add(new Paragraph("                       "));
            // doc.Add(new Paragraph(" Matrícula : " + matricula)); doc.Add(new Paragraph("                       "));
            // doc.Add(new Paragraph(" Carrera :" + carrera)); doc.Add(new Paragraph("                       "));
            // doc.Add(new Paragraph(" Segunda Opción :" + segunda)); doc.Add(new Paragraph("                       "));
            // doc.Add(new Paragraph(" Tercera Opción :" + tercera)); doc.Add(new Paragraph("                       "));

            // doc.Add(new Paragraph(" Modalidad : " + modalidad));
            // doc.Add(new Paragraph("                       "));
            // doc.Add(new Paragraph("                       "));
            // doc.Add(new Paragraph("                       "));
            // doc.Add(new Paragraph("                       "));
            // doc.Add(new Paragraph("                       "));
            // doc.Add(new Paragraph("                       "));

            // doc.AddCreationDate();
            // doc.Add(new Paragraph("_______________________________________________________________________________", FontFactory.GetFont("ARIAL", 10, iTextSharp.text.Font.BOLD)));
            // doc.Add(new Paragraph("Nota: Entrega la impresión de este reporte al area de servicios escolares de la UPT", FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.BOLD)));
            // doc.Add(new Paragraph("para verificar que completo el llenado de los formularios", FontFactory.GetFont("ARIAL", 12, iTextSharp.text.Font.BOLD)));


            // System.Xml.XmlTextReader xmlReader = new System.Xml.XmlTextReader(new StringReader(html));
            //HtmlParser.Parse(doc, xmlReader);

            // doc.Close();

            // string Path = Environment.GetFolderPath
            // (Environment.SpecialFolder.Desktop)
            // + "\\Reporte.pdf";


            // ShowPdf(Path);
            StringWriter sw = new StringWriter();
            string html = sw.ToString();

            Document Doc = new Document();

            PdfWriter.GetInstance
            (Doc, new FileStream(Environment.GetFolderPath
            (Environment.SpecialFolder.Desktop)
            + "\\Prueba.pdf", FileMode.Create));
            Doc.Open();

            Chunk c = new Chunk
            ("Prueba de un Documento en PDF \n", FontFactory.GetFont("Verdana", 15));

            Paragraph p = new Paragraph();
            p.Alignment = Element.ALIGN_CENTER;
            p.Add(c);


            Doc.Add(p);
          
           

            System.Xml.XmlTextReader xmlReader = new System.Xml.XmlTextReader(new StringReader(html));
           // HtmlParser.Parse(Doc, xmlReader);

            Doc.Close();

            string Path = Environment.GetFolderPath
            (Environment.SpecialFolder.Desktop)
            + "\\Prueba.pdf";


            ShowPdf(Path);

        }
        private void ShowPdf(string strS)
        {
            Response.ClearContent();
            Response.ClearHeaders();
            Response.ContentType = "application/pdf";
            Response.AddHeader
            ("Content-Disposition", "attachment; filename=" + strS);
           // Response.TransmitFile(strS);
            Response.End();
           // Response.WriteFile(strS);
            Response.Flush();
            Response.Clear();

        }
       

       

        protected void Unnamed3_Click1(object sender, EventArgs e)
        {

            if (Realizado1.Visible && Realizado2.Visible && Realizado3.Visible && Realizado4.Visible && Realizado5.Visible)
            {

                GenerarPDF();
            }
            else
            {
                Type cstype = this.GetType();
                string script = "<script language='javascript'>alert('Debes antes llenar todos los formularios')</script>";
                this.ClientScript.RegisterStartupScript(cstype, Guid.NewGuid().ToString(), script, false);
            }
        }
    }
}
