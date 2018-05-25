<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Menu.Master" CodeBehind="formulario_1.aspx.cs" Inherits="Conect.Formularios.formulario_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            width: 358px;
        }
        .auto-style7 {
            width: 328px;
        }
        .auto-style11 {
            width: 151px;
        }
        .auto-style14 {
        width: 157px;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />


    <div class="row">
     <div class="col-md-3" align="left">
         </div>
        <div class="col-md-6" align="left">
    <asp:Panel runat="server" onsudmit="return validacion.js">
        <div class="col-md-12" align="center">
    <div class="tabla">
        <div class="row">
            <div class="col-md-12" align="center">
            <h1>Instrucciones Generales</h1>
            </div>
            </div>
        <br />
            <div class="row">
            <div class="col-md-12"  align="justify">
                <p >1. Conteste los cuestionarios ubicados en la siguiente tabla de acuerdo a las instrucciones correspondientes.</p>
            </div>
            </div>
        <div class="row">
            <div class="col-md-12"  align="justify" >
                <p >2. Es importante que registre correctamente sus datos de acuerdo al Acta de Nacimiento, CURP y Certificado de Estudios.</p>
            </div>
        </div>
    <div class="row">
            <div class="col-md-12"   align="justify">
                <p> </p>
             
                 
            </div>
    </div>
    <div class="row">
            <div class="col-md-12" align="justify">
                <br />
                <p>Si tuviera dudas o problemas para realizar su registro, comuníquese al módulo de atención telefónica:
                    <br />

De lunes a viernes de 9:00 a 17:00 horas.
                    <br />
Teléfono: 01(775) 75 5 82 02</p>
            </div>
        </div>
        <br />
        </div>

        </div>
        
        </asp:Panel>
            </div>
            <div class="col-md-3" align="left">
            </div>
            
        </div>

            <br />
        
        
       
    <br />
    <br />



      <asp:Panel runat="server" onsudmit="return validacion.js">
    <div class="container"
        <div class="col-md-6" align="center">
   
     <table aling="center" class="tabla" border="1" >

<tr>
  <td align="center" class="auto-style6" ><strong >Ingreso</strong></td>
  <td align="center" class="auto-style11"><strong>Contestado</strong></td>
  
</tr>
 
<tr>
  <td class="auto-style6"> <ul>
             <li><a href="formulario_2.aspx">Solicitud de Ingreso</a> </li>
      </ul></td>
  <td align="center" class="auto-style11">
      <asp:Image runat="server" src="Hecho.png" Height="35px" Width="41px" ID="Realizado1" />
      <asp:Image runat="server" src="Equis.png" Height="35px" Width="41px" ID="Falta1" />

     </td>
  
</tr>
         </table>


    <br />
    <br />
            </asp:Panel>
    <div class="row">
            <asp:Panel runat="server" onsudmit="return validacion.js" ID="PanelSocio"    >
    
<div class="container"
 <div   class="row col-md-6" align="center">
   
     <table aling="right"  class="tabla" border="1" >
    <tr>
  <td align="center" class="auto-style6" ><strong >Solicitud Socioeconómica</strong></td>
  <td align="center" class="auto-style14" id="TablaSocio"><strong>Contestado</strong></td>
  
</tr>
         <tr>
  <td class="auto-style7"> <ul>
             <li><a href="AntecedentesAlumno.aspx">Antecedentes Personales y Laborales</a></li>
                  </ul></td>
   <td align="center" class="auto-style14" id="TablaSocio">
     <asp:Image runat="server" src="Hecho.png" Height="35px" Width="41px" ID="Realizado2" />
      <asp:Image runat="server" src="Equis.png" Height="35px" Width="41px" ID="Falta2" />

  </td>

 
</tr>
 <tr>
  <td class="auto-style7"> <ul>
             <li>
                 <a href="Vivienda.aspx">Informacion Relativa a la Vivienda</a>
             </li>
      </ul></td>
  <td align="center" class="auto-style14" id="TablaSocio">
      <asp:Image runat="server" src="Hecho.png" Height="35px" Width="41px" ID="Realizado3" />
      <asp:Image runat="server" src="Equis.png" Height="35px" Width="41px" ID="Falta3" />

     </td>
  
</tr>
         <tr>
  <td class="auto-style7"> <ul>
             <li>
                 <a href="Ingresos_Egresos.aspx">Ingresos y Egresos</a>
             </li>
      </ul></td>
  <td align="center" class="auto-style14" id="TablaSocio">
      <asp:Image runat="server" src="Hecho.png" Height="35px" Width="41px" ID="Realizado4" />
      <asp:Image runat="server" src="Equis.png" Height="35px" Width="41px" ID="Falta4" />

     </td>
  
</tr>
         <tr>
  <td class="auto-style7"> <ul>
             <li>
                 <a href="Becas.aspx">Información Relativa a Becas</a>
             </li>
      </ul></td>
  <td align="center" class="auto-style14" id="TablaSocio">
      <asp:Image runat="server" src="Hecho.png" Height="35px" Width="41px" ID="Realizado5" />
      <asp:Image runat="server" src="Equis.png" Height="35px" Width="41px" ID="Falta5" />

     </td>
  
</tr>

</table>
     <br/>
                             <asp:Button runat="server" ID="Unnamed3" Text="GUARDAR" CssClass="alert-info" OnClick="Unnamed3_Click1"  />

 
 </div>  <%--</div>
               </div>

                 </div>--%>
           
            <br />
    <br />
    <br />
    <br />
                
           </asp:Panel>
        </div>
        
  


</asp:Content>
