using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Conect.DAO;

namespace Conect.Formularios
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            LogInDAOSQL clases = new LogInDAOSQL();
            if (clases.ExisteUsuario(txtCorreo.Text))
            {
                if (clases.ValidarUsuario(txtContraseña.Text, txtCorreo.Text))
                {
                    Session["matricula"] = txtCorreo.Text;
                    Server.Transfer("formulario_1.aspx", true);
                }
                else
                {
                    Type cstype = this.GetType();
                    string script = "<script language='javascript'>alert('!!CONTRASEÑA INCORRECTA!!')</script>";
                    this.ClientScript.RegisterStartupScript(cstype, Guid.NewGuid().ToString(), script, false);
                }
            }
            else
            {
                Type cstype = this.GetType();
                string script = "<script language='javascript'>alert('NO PUEDE ENTRAR! SU PAGO NO ESTA REGISTRADO EN EL SISTEMA')</script>";
                this.ClientScript.RegisterStartupScript(cstype, Guid.NewGuid().ToString(), script, false);
            }
        }
    }
}