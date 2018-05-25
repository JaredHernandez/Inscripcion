<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Conect.Formularios.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/Content/bootstrap.css" rel="stylesheet" />
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="/Estilos/Style.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    
        <div class="container">
        <div class="page-header"  align="center"><h1>Aspirantes</h1>

        </div>
    <div class="row">

            <div class="col-md-8" align="center">
                <div class="jumbotron">
                <div class="w3-content w3-section"  >
                    <img class="mySlides" style="height:300px; width:100%" src="../Imagenes/140410-0430.jpg" />
                    <img class="mySlides img-responsive" style="height:300px; width:300px" src="/Imagenes/Logo.png" />
                    <img class="mySlides img-responsive"  style="height:300px; width:300px" src="../Imagenes/upt-footer.png" />
                </div>
                    </div>
            </div>
        <div class="col-md-4" align="left">
            <form id="form1" runat="server">
                <h1 align="center">Acceso</h1>
                <br />
        <div class="form-group">
    <label >Referencia</label>
            <asp:TextBox runat="server" MaxLength="50" ID="txtCorreo" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ControlToValidate="txtCorreo" 
                            ErrorMessage="<p>Ingresa tu correo electronico</p>"
			                setfocusonerror="true" 
                            Display="Dynamic"  
                            ForeColor="#B50128" 
                            Font-Size="8"  
                            Font-Bold="true" >
                </asp:RequiredFieldValidator>
    </div> 
                    <div class="form-group">
                        <br />
    <label >Contraseña</label>
            <asp:TextBox runat="server" TextMode="Password" ID="txtContraseña" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtContraseña" 
                            ErrorMessage="<p>La contraseña es incorrecta</p>"
			                setfocusonerror="true" 
                            Display="Dynamic"  
                            ForeColor="#B50128" 
                            Font-Size="8"  
                            Font-Bold="true" >
                </asp:RequiredFieldValidator>
    </div> 
                <div align="right">
                    <asp:Button runat="server" CssClass="btn btn-primary" Text="Ingresar" OnClick="Unnamed1_Click" />
                        
                    </div>
                <br />
                </form>
            </div>
   </div>
            <br />
            <br />
        </div>
    
      <script>
            var myIndex = 0;
            carousel();

            function carousel() {
                var i;
                var x = document.getElementsByClassName("mySlides");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                myIndex++;
                if (myIndex > x.length) { myIndex = 1 }
                x[myIndex - 1].style.display = "block";
                setTimeout(carousel, 2000); // Change image every 2 seconds
            }
        </script>
</body>
</html>
