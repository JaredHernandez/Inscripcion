<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Menu.Master" CodeBehind="formulario_2.aspx.cs" Inherits="Conect.Formularios.formulario_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script>
      
        
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="container">
            <div align="center">
                <h1>Solicitud de Inscripción</h1>

            </div>
        </div>
    </div>
    &nbsp;<br />
    <div class="col-md-2" align="left">
    </div>
    <asp:Panel runat="server" onsudmit="return validacion.js">
        <div class="col-md-8" align="center">
            <div class="tabla">
                <div class="row">
                    <div class="col-md-12 alert-danger" align="center">
                        <label>Plan de Estudios</label>
                    </div>
                </div>
                <br />  

                <div class="row">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                         <div class="col-md-3" align="right">
                        <label><font size="1">*Carrera a la que deseas entrar</font></label>
                    </div>
                    <div class="col-md-4" align="center">
                        <asp:DropDownList runat="server" Width="100%" ID="DropDownList1"  AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_TextChanged">
                             <asp:ListItem Value="0">-Selecciona-</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator id="RequiredFieldValidator2" ControlToValidate="DropDownList1" ErrorMessage="Seleccione un Carrera" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" InitialValue="-Seleccione-" runat="server"/>
                    </div>
                        </ContentTemplate>
                        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="selectedindexchanged" />
        </Triggers>
                    </asp:UpdatePanel>

                </div>
                <br />
                <div class="row">
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                    <div class="col-md-3" align="right">
                        <label><font size="1">Segunda opción</font></label>
                    </div>
                    <div class="col-md-4" align="center">
                        <asp:DropDownList runat="server" Width="100%" ID="DropDownList2" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_TextChanged"></asp:DropDownList>
                        <asp:RequiredFieldValidator id="RequiredFieldValidator3" ControlToValidate="DropDownList2" ErrorMessage="Seleccione un Carrera" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" InitialValue="-Seleccione-" runat="server"/>
                    </div>
                        </ContentTemplate>
                        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="DropDownList2" EventName="selectedindexchanged" />
        </Triggers>
                    </asp:UpdatePanel>

                </div>
                <br />
                <div class="row">
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                          <div class="col-md-3" align="right">
                        <label><font size="1">Tercera opción</font></label>
                    </div>
                    <div class="col-md-4" align="center">
                        <asp:DropDownList runat="server" Width="100%" ID="DropDownList3" AutoPostBack="true" OnSelectedIndexChanged="DropDownList3_TextChanged"></asp:DropDownList>
                        <asp:RequiredFieldValidator id="RequiredFieldValidator4" ControlToValidate="DropDownList3" ErrorMessage="Seleccione un Carrera" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" InitialValue="-Seleccione-" runat="server"/>
                    </div>
                        </ContentTemplate>
                        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="DropDownList3" EventName="selectedindexchanged" />
        </Triggers>
                    </asp:UpdatePanel>

                </div>
                <br />
                <div class="row form-group">
                    <div class="col-md-3" align="right">
                        <label><font size="1">Escoge modalidad:</font></label>
                    </div>
                    <div class="col-md-4" align="center">
                        <asp:DropDownList runat="server" Width="100%" ID="esp_id">
 
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator id="RequiredFieldValidator5" ControlToValidate="esp_id" ErrorMessage="Seleccione una Modalidad" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" InitialValue="-Seleccione-" runat="server"/>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12 alert-danger" align="center">
                        <label>Datos Personales</label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-2" align="right">
                        <label><font size="1">*Nombre:</font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        <asp:TextBox ID="alu_Nombre" runat="server" Style="font: 10px; text-transform: uppercase" placeholder="Nombre(s)" Width="100%" onkeypress="return soloLetras(event)"></asp:TextBox>
                       <asp:RequiredFieldValidator id="RequiredFieldValidator8" ControlToValidate="alu_Nombre" ErrorMessage="Ingrese su nombre" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" runat="server"/>
                         </div>
                    <div class="col-md-3" align="center">
                        <asp:TextBox ID="alu_ApellidoPaterno" runat="server" Style="text-transform: uppercase" placeholder="Apellido Paterno" Width="100%" onkeypress="return soloLetras(event)"></asp:TextBox>
                                           <asp:RequiredFieldValidator id="RequiredFieldValidator9" ControlToValidate="alu_ApellidoPaterno" ErrorMessage="Ingrese su Apellido paterno" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" runat="server"/>

                    </div>
                    <div class="col-md-3" align="center">
                        <asp:TextBox ID="alu_ApellidoMaterno" runat="server" Style="text-transform: uppercase" placeholder="Apellido Materno" Width="100%" onkeypress="return soloLetras(event)"></asp:TextBox>
                         </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-2" align="right">
                        <label><font size="1">*CURP:</font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        <asp:TextBox MaxLength="18" ID="alc_Curp" runat="server" Style="text-transform: uppercase" Width="100%"></asp:TextBox>
                  <asp:RequiredFieldValidator id="RequiredFieldValidator11" ControlToValidate="alc_Curp" ErrorMessage="Ingrese su CURP" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" runat="server"/>

                    </div>
                    </div>
                 <br />
                    <div class="row">
                    <div class="col-md-2" align="right">
                        <label><font size="1">Estado Civil:</font></label>
                        </div> 
                  <div class="col-md-3" align="right">
                        <asp:DropDownList runat="server" Width="100%" ID="alc_EdoCivil">
                            <asp:ListItem Value="0">Seleccione</asp:ListItem>
                            <asp:ListItem Value="1">Soltero</asp:ListItem>
                            <asp:ListItem Value="2">Casado</asp:ListItem>
                            <asp:ListItem Value="3">Divorciado</asp:ListItem>
                            <asp:ListItem Value="4">Viudo</asp:ListItem>
                            <asp:ListItem Value="5">Union Libre</asp:ListItem>
                        </asp:DropDownList>
               <asp:RequiredFieldValidator id="RequiredFieldValidator12" ControlToValidate="alc_EdoCivil" ErrorMessage="Seleccione su estado civil" Display="Dynamic" InitialValue="0" ForeColor="#B50128" Font-Bold="true" Font-Size="8" runat="server"/>

                    </div>
                        </div>
                <br />   
                        <div class="row">
                    <div class="col-md-2" align="right">
                        <label><font size="1">Género:</font></label>
                </div>   
                    <div class="col-md-2" align="left" style="text-align: center">
                                <asp:DropDownList ID="alu_Sexo" runat="server"  Width="100%">
                                     <asp:ListItem Value="0">Seleccione</asp:ListItem>
                                     <asp:ListItem Value="1">M</asp:ListItem>
                                    <asp:ListItem Value="2">F</asp:ListItem>
                                </asp:DropDownList>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="alu_Sexo" 
                            ErrorMessage="Seleccione El genero" 
                              setfocusonerror="true" 
                            Display="Dynamic"  
                            ForeColor="#B50128" 
                            Font-Size="8"
                              InitialValue="0"  
                            Font-Bold="true" >
        </asp:RequiredFieldValidator>
                    </div>                        
                    </div>
                <br />
                    <div class="row">
                            <div class="col-md-2" align="right">
                                <label><font size="1">Edad:</font></label>
                            </div>
                            <div class="col-md-2" align="left">
                                <asp:TextBox MaxLength="2" ID="alc_edad" Width="100%" runat="server" onkeypress="return justNumbers(event)"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="alc_edad" 
                            ErrorMessage="Ingrese su edad" 
                              setfocusonerror="true" 
                            Display="Dynamic"  
                            ForeColor="#B50128" 
                            Font-Size="8"
                            Font-Bold="true" >
        </asp:RequiredFieldValidator>
                            </div>
                        </div>

                <br />

                <div class="row">
                    <div class="col-md-3" align="right">
                                <label><font size="1">¿Tienes alguna discapacidad?:</font></label>
                            </div>
                            <div class="col-md-2" align="left">
                                <asp:RadioButtonList ID="rb_dis_ID" runat="server" RepeatDirection="Horizontal" Height="20px" Width="100px" OnSelectedIndexChanged="rb_dis_ID_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem id="rbSi" Text="Si" Value="Si" />
                                    <asp:ListItem id="rbNo" Text="No" Value="No" Selected="True" />
                                </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="rb_dis_ID" ErrorMessage="Seleccione una Opción" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" InitialValue="-Seleccione-" runat="server" />

                            </div>
                    <div class="col-md-1" align="right">
                                    <label id="cual1"><font size="1">¿Cuál?:</font></label>
                                </div>
                                <div class="col-md-3" align="left">
                                    <asp:DropDownList runat="server" Width="100%" ID="dis_ID" Visible="False">
                                        <asp:ListItem Value="0">-Selecciona-</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="dis_ID" ErrorMessage="Seleccione una Opción" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" runat="server" />
                                </div>
                    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="discapacidad" runat="server">
                                
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <br />

                 <div class="row">
                        <div class="col-md-3" align="right">
                                 <label><font size="1">¿Hablas alguna lengua indígena?:</font></label>
                             </div>
                             <div class="col-md-2" align="left">
                                 <asp:RadioButtonList ID="rb_lei_ID" runat="server" RepeatDirection="Horizontal" Height="20px" Width="100px" AutoPostBack="true" OnSelectedIndexChanged="rb_lei_ID_SelectedIndexChanged">
                                     <asp:ListItem id="rSi" Text="Si" Value="Si" />
                                     <asp:ListItem id="rNo" Text="No" Value="No" Selected="True" />

                                 </asp:RadioButtonList>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="rb_lei_ID" ErrorMessage="Seleccione una Opción" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" runat="server" />

                             </div>
                     <div class="col-md-1" align="right">
                                     <label id="cual2" ><font size="1">¿Cuál?:</font></label>
                                 </div>
                                 <div class="col-md-3" align="left">
                                     <asp:DropDownList runat="server" Width="100%" ID="lei_ID" visible="false">
                                         <asp:ListItem Value="0">-Selecciona-</asp:ListItem>
                                     </asp:DropDownList>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="lei_ID" ErrorMessage="Seleccione una Opción" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" InitialValue="-Selecciona-" runat="server" />
                                 </div>
                     <asp:UpdatePanel ID="UpdatePanel7" style="display:none" runat="server">
                         <ContentTemplate>
                             <asp:Panel ID="LenIndi" runat="server">
                                 
                             </asp:Panel>
                         </ContentTemplate>
                     </asp:UpdatePanel>
                 </div>

                <br />
                <div class="row">
                    <div class="col-md-12 alert-danger" align="center">
                        <label>Lugar de Nacimiento</></label>
                    </div>
                    </div>
                    <br />
                     <div class="row">
                    <div class="col-md-3" align="right">
                        <label><font size="1">*Fecha de Nacimiento:</font></label>
                   </div>
                         <div class="col-md-3" align="left">
                        <asp:TextBox Text="AAAA-MM-DD" TextMode="Date" ID="alc_FechaNac" runat="server"></asp:TextBox>
                         </div>
                    </div>
               <br />
                  <div class="row">
                    <div class="col-md-3" align="right">
                        <label><font size="1">Estado:</font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList runat="server" height="100%" Width="100%" ID="est_Natal_ID" AutoPostBack="true" OnSelectedIndexChanged="est_Natal_ID_SelectedIndexChanged">
                            <asp:ListItem Value="0">-Selecciona-</asp:ListItem>
                            <asp:ListItem Value="1">A</asp:ListItem>
                            <asp:ListItem Value="2">B</asp:ListItem>
                        </asp:DropDownList>
                                <asp:RequiredFieldValidator id="rfv_est_Natal_ID1" ControlToValidate="est_Natal_ID" ErrorMessage="Seleccione un Estado" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" InitialValue="-Seleccione-" runat="server"/>
                            </ContentTemplate>
                            <Triggers>
                          <asp:AsyncPostBackTrigger ControlID="est_Natal_ID" EventName="selectedindexchanged" />
                        </Triggers>
                        </asp:UpdatePanel>
                    </div>
                      </div>
                    <br />
                    <div class="row">
                         <div class="col-md-3" align="right">
                        <label><font size="1">Municipio:</font></label>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                    <div class="col-md-3" align="left">
                        <asp:DropDownList runat="server" Width="100%" ID="mun_Natal_ID" AutoPostBack="true" >
                            <asp:ListItem Value="0">-Selecciona-</asp:ListItem>
                            <asp:ListItem Value="1">A</asp:ListItem>
                            <asp:ListItem Value="2">B</asp:ListItem>
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator id="rfv_mun_Natal_ID" ControlToValidate="mun_Natal_ID" ErrorMessage="Seleccione un Municipio" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" InitialValue="0" runat="server"/>
                    </div>
                        </ContentTemplate>
                         <Triggers>
            <asp:AsyncPostBackTrigger ControlID="mun_Natal_ID" EventName="selectedindexchanged" />
        </Triggers>
                    </asp:UpdatePanel>
                   
                </div>
                <br />
                <div class="row">
                   <div class="col-md-12 alert-danger" align="center">
                        <label>Dirección actual</label>
                    </div>
                </div>
                <br />
                <div class="row">
                                               <div class="col-md-2" align="right">
                        <label><font size="1">*Estado</font></label>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                    <div class="col-md-6" align="center">
                        <asp:DropDownList  runat="server" Width="100%" ID="est_Proced_ID" AutoPostBack="true" OnSelectedIndexChanged="est_Proced_ID_SelectedIndexChanged">
                            <asp:ListItem Value="0">-Seleccione-</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator id="Rrfv_est_Proced_ID" ControlToValidate="est_Proced_ID" ErrorMessage="Seleccione un Estado" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" InitialValue="-Seleccione-" runat="server"/>

                    </div>
                        </ContentTemplate>
                        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="est_Proced_ID" EventName="selectedindexchanged" />
        </Triggers>
                    </asp:UpdatePanel>

                </div>
                <br />
                <div class="row">
                                                 <div class="col-md-2" align="right">
                        <label><font size="1">*Municipio</font></label>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                        <ContentTemplate>
                    <div class="col-md-6" align="center">
                        <asp:DropDownList  runat="server" Width="100%" ID="mun_Proced_ID" AutoPostBack="true" >
                            <asp:ListItem Value="0">-Seleccione-</asp:ListItem>
                            <asp:ListItem Value="1">A</asp:ListItem>
                            <asp:ListItem Value="2">B</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator id="rfv_mun_Proced_ID" ControlToValidate="mun_Proced_ID" ErrorMessage="Seleccione un Estado" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" InitialValue="0" runat="server"/>
                    </div>
                        </ContentTemplate>
                         <Triggers>
            <asp:AsyncPostBackTrigger ControlID="mun_Proced_ID" EventName="selectedindexchanged" />
        </Triggers>
                    </asp:UpdatePanel>
                   
                </div>
                <br />
                 <div class="row">
                    <div class="col-md-2" align="right">
                        <label><font size="1">Localidad</font></label>
                    </div>
                    <div class="col-md-6" align="center">
                        <asp:TextBox  ID="alc_Localidad" runat="server" Width="100%" Style="text-transform: uppercase" onkeypress="return soloLetras(event)" placeholder="Localidad"></asp:TextBox>
                    </div>
                    <div class="col-md-2" align="center">
                        <asp:TextBox  ID="alc_CodPostal" MaxLength="5" runat="server" Width="100%" Style="text-transform: uppercase" placeholder="CP" onkeypress="return justNumbers(event);"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-2" align="right">
                        <label><font size="1">Colonia:</font></label>
                    </div>
                    <div class="col-md-6" align="left">
                        <asp:TextBox  ID="alc_Colonia" runat="server" Style="text-transform: uppercase" Width="100%"></asp:TextBox>
                    </div>
                </div>
                  
                <br />
                  <div class="row">
                    <div class="col-md-2" align="right">
                        <label><font size="1">Calle:</font></label>
                    </div>
                    <div class="col-md-6" align="left">
                        <asp:TextBox  ID="alc_Calle" runat="server" Style="text-transform: uppercase" Width="100%"></asp:TextBox>
                    </div>
                        <div class="col-md-2" align="left">
                        <asp:TextBox ID="alc_NumExt" runat="server" Style="text-transform: uppercase" placeholder="NUM EXT" Width="100%"></asp:TextBox>
                       <asp:RequiredFieldValidator id="RequiredFieldValidator10" ControlToValidate="alc_NumExt" ErrorMessage="Seleccione un Municipio" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" runat="server"/>

                        </div>
                    <div class="col-md-2" align="left">
                        <asp:TextBox ID="alc_NumInt" runat="server" Style="text-transform: uppercase" placeholder="NUM INT" Width="100%" onkeypress="return justNumbers(event);"></asp:TextBox>
                    </div>
                      </div>
                      <br />
                      <div class="row">
                          <div class="col-md-2" align="right">
                        <label><font size="1">Teléfono Casa:</font></label>
                    </div>
                    <div class="col-md-3" align="center">
                        <asp:TextBox MaxLength="10" ID="alc_Tel" runat="server" Width="100%" Style="text-transform: uppercase" placeholder="Telefono Casa" onkeypress="return justNumbers(event);"></asp:TextBox>

                    </div>
                    <div class="col-md-2" align="right">
                        <label><font size="1">Teléfono Celular:</font></label>
                        
                    </div>
                    <div class="col-md-3" align="center">
                        <asp:TextBox MaxLength="10" ID="alc_Celular" runat="server" Width="100%" Style="text-transform: uppercase" placeholder="Telefono Celular" onkeypress="return justNumbers(event);"></asp:TextBox>
                      <asp:RequiredFieldValidator id="RequiredFieldValidator16" ControlToValidate="alc_Celular" ErrorMessage="Seleccione un Municipio" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" runat="server"/>

                    </div>
                          </div>
                           <br />
                          <div class="row">
                    <div class="col-md-2" align="right">
                        <label><font size="1">E-mail:</font></label>
                    </div>
                    <div class="col-md-4" align="center">
                        <asp:TextBox  TextMode="Email" ID="alc_correo" runat="server" Width="100%" AccessKey Style="text-transform: uppercase" placeholder="ejemplo@gmail.com"></asp:TextBox>
                        <asp:RequiredFieldValidator id="RequiredFieldValidator17" ControlToValidate="alc_correo" ErrorMessage="Seleccione un Municipio" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" runat="server"/>
 
                    </div>
                    <div class="col-md-2" align="right">
                        <label><font size="1">Facebook:</font></label>
                    </div>
                              <div class="col-md-4" align="center">
                        <asp:TextBox ID="alc_facebook" runat="server" Width="100%" AccessKey Style="text-transform: uppercase" placeholder="Usuario de Facebook"></asp:TextBox>
                    </div>
                 </div>
                 
                <br />
                <div class="row">
                    
                </div>
                <br />

               
                <div class="row">
                            <div class="col-md-12 alert-danger" align="center">
                        <label>Información familiar</label>
                    </div>
                </div>
               
                <div class="row">

                    <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                        <ContentTemplate>
                    
                    <br />
                            <div class="row col-md-12 form-group">
                            <asp:Label CssClass="text-center" Font-Size="12px" runat="server" Text="Llene la siguiente tabla con los datos de los Familiares con los qué vive"></asp:Label>
                        </div>
                            <div class="row col-md-12 form-group">
                                <div class="col-md-5">
                                   
                                    </div

                            <div class="row col-md-12">
            <div class="table-responsive">
                <asp:Table ID="Tabla" align="center" runat="server" BorderStyle="Ridge" GridLines="Vertical"  class="table table-bordered">
                    <asp:TableHeaderRow BackColor="DarkRed" CssClass="form-group">
                        <asp:TableCell CssClass="col-md-3">
                            <asp:label runat="server" Text="Nombre" Font-Size="12px" Font-Bold="true" ForeColor="White"></asp:label>
                        </asp:TableCell>
                        <asp:TableCell CssClass="col-md-1">
                            <asp:label runat="server" Text="Edad" Font-Size="12px" Font-Bold="true" ForeColor="White"></asp:label>
                        </asp:TableCell>
                        <asp:TableCell CssClass="col-md-2">
                           <asp:label runat="server" Text="Parentezco" Font-Size="12px" Font-Bold="true" ForeColor="White"></asp:label>
                        </asp:TableCell>
                        <asp:TableCell CssClass="col-md-2">
                            <asp:label runat="server" Text="Escolaridad"  Font-Size="12px" Font-Bold="true" ForeColor="White"></asp:label>
                        </asp:TableCell>
                        <asp:TableCell CssClass="col-md-2">
                            <asp:label runat="server" Text="Estado Civil" Font-Size="12px" Font-Bold="true" ForeColor="White"></asp:label>
                        </asp:TableCell>
                        <asp:TableCell CssClass="col-md-2">
                            <asp:label runat="server" Text="Ocupación" Font-Size="12px" Font-Bold="true" ForeColor="White"></asp:label>
                        </asp:TableCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow id="Fila0">
                        <asp:TableCell>
                            <asp:TextBox ID="Familiar0_Nombre" CssClass="form-control"  runat="server" Style="text-transform:uppercase" ></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="Familiar0_Edad" MaxLength="2" CssClass="form-control"  runat="server" onkeypress="return justNumbers(event);" ></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                           <asp:DropDownList ID="Familiar0_Parentezco" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Madre</asp:ListItem>
                                <asp:ListItem>Padre</asp:ListItem>
                               <asp:ListItem>Padrastro</asp:ListItem>
                               <asp:ListItem>Madrastra</asp:ListItem>
                               <asp:ListItem>Hermano/a</asp:ListItem>
                               <asp:ListItem>Primo/a</asp:ListItem>
                               <asp:ListItem>Tío/a</asp:ListItem>
                               <asp:ListItem>Abuelo/a</asp:ListItem>
                               <asp:ListItem>Sobrino/a</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar0_Escolaridad" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Ninguno</asp:ListItem>
                                <asp:ListItem>Primaria</asp:ListItem>
                                <asp:ListItem>Secundaria</asp:ListItem>
                                <asp:ListItem>Bachillerato</asp:ListItem>
                                <asp:ListItem>Universidad</asp:ListItem>
                                <asp:ListItem>Carrera Trunca</asp:ListItem>
                                <asp:ListItem>Doctorado</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar0_EstadoCivil" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Soltero/a</asp:ListItem>
                                <asp:ListItem>Casado/a</asp:ListItem>
                                <asp:ListItem>Divorciado/a</asp:ListItem>
                                <asp:ListItem>Unión Libre</asp:ListItem>
                                <asp:ListItem>Divorciado/a</asp:ListItem>
                                <asp:ListItem>Viudo/a</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar0_Ocupacion" CssClass="form-control" runat="server"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Obrero</asp:ListItem>
                                <asp:ListItem>Carpintero</asp:ListItem>
                                <asp:ListItem>Electricista</asp:ListItem>
                                <asp:ListItem>Tornero</asp:ListItem>
                                <asp:ListItem>Médico</asp:ListItem>
                                <asp:ListItem>Abogado</asp:ListItem>
                                <asp:ListItem>Contador</asp:ListItem>
                                <asp:ListItem>Comerciante</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow id="Fila1">
                        <asp:TableCell>
                            <asp:TextBox ID="Familiar1_Nombre" CssClass="form-control"  runat="server" Style="text-transform:uppercase" ></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="Familiar1_Edad" MaxLength="2" CssClass="form-control"  runat="server" onkeypress="return justNumbers(event);" ></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                           <asp:DropDownList ID="Familiar1_Parentezco" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Madre</asp:ListItem>
                                <asp:ListItem>Padre</asp:ListItem>
                               <asp:ListItem>Padrastro</asp:ListItem>
                               <asp:ListItem>Madrastra</asp:ListItem>
                               <asp:ListItem>Hermano/a</asp:ListItem>
                               <asp:ListItem>Primo/a</asp:ListItem>
                               <asp:ListItem>Tío/a</asp:ListItem>
                               <asp:ListItem>Abuelo/a</asp:ListItem>
                               <asp:ListItem>Sobrino/a</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar1_Escolaridad" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Ninguno</asp:ListItem>
                                <asp:ListItem>Primaria</asp:ListItem>
                                <asp:ListItem>Secundaria</asp:ListItem>
                                <asp:ListItem>Bachillerato</asp:ListItem>
                                <asp:ListItem>Universidad</asp:ListItem>
                                <asp:ListItem>Carrera Trunca</asp:ListItem>
                                <asp:ListItem>Doctorado</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar1_EstadoCivil" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Soltero/a</asp:ListItem>
                                <asp:ListItem>Casado/a</asp:ListItem>
                                <asp:ListItem>Divorciado/a</asp:ListItem>
                                <asp:ListItem>Unión Libre</asp:ListItem>
                                <asp:ListItem>Divorciado/a</asp:ListItem>
                                <asp:ListItem>Viudo/a</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar1_Ocupacion" CssClass="form-control" runat="server"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Obrero</asp:ListItem>
                                <asp:ListItem>Carpintero</asp:ListItem>
                                <asp:ListItem>Electricista</asp:ListItem>
                                <asp:ListItem>Tornero</asp:ListItem>
                                <asp:ListItem>Médico</asp:ListItem>
                                <asp:ListItem>Abogado</asp:ListItem>
                                <asp:ListItem>Contador</asp:ListItem>
                                <asp:ListItem>Comerciante</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow id="Fila2">
                        <asp:TableCell>
                            <asp:TextBox ID="Familiar2_Nombre" CssClass="form-control"  runat="server" Style="text-transform:uppercase" ></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="Familiar2_Edad" MaxLength="2" CssClass="form-control"  runat="server" onkeypress="return justNumbers(event);" ></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                           <asp:DropDownList ID="Familiar2_Parentezco" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Madre</asp:ListItem>
                                <asp:ListItem>Padre</asp:ListItem>
                               <asp:ListItem>Padrastro</asp:ListItem>
                               <asp:ListItem>Madrastra</asp:ListItem>
                               <asp:ListItem>Hermano/a</asp:ListItem>
                               <asp:ListItem>Primo/a</asp:ListItem>
                               <asp:ListItem>Tío/a</asp:ListItem>
                               <asp:ListItem>Abuelo/a</asp:ListItem>
                               <asp:ListItem>Sobrino/a</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar2_Escolaridad" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Ninguno</asp:ListItem>
                                <asp:ListItem>Primaria</asp:ListItem>
                                <asp:ListItem>Secundaria</asp:ListItem>
                                <asp:ListItem>Bachillerato</asp:ListItem>
                                <asp:ListItem>Universidad</asp:ListItem>
                                <asp:ListItem>Carrera Trunca</asp:ListItem>
                                <asp:ListItem>Doctorado</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar2_EstadoCivil" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Soltero/a</asp:ListItem>
                                <asp:ListItem>Casado/a</asp:ListItem>
                                <asp:ListItem>Divorciado/a</asp:ListItem>
                                <asp:ListItem>Unión Libre</asp:ListItem>
                                <asp:ListItem>Divorciado/a</asp:ListItem>
                                <asp:ListItem>Viudo/a</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar2_Ocupacion" CssClass="form-control" runat="server"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Obrero</asp:ListItem>
                                <asp:ListItem>Carpintero</asp:ListItem>
                                <asp:ListItem>Electricista</asp:ListItem>
                                <asp:ListItem>Tornero</asp:ListItem>
                                <asp:ListItem>Médico</asp:ListItem>
                                <asp:ListItem>Abogado</asp:ListItem>
                                <asp:ListItem>Contador</asp:ListItem>
                                <asp:ListItem>Comerciante</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow id="Fila3">
                        <asp:TableCell>
                            <asp:TextBox ID="Familiar3_Nombre" CssClass="form-control"  runat="server" Style="text-transform:uppercase" ></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="Familiar3_Edad" MaxLength="2" CssClass="form-control"  runat="server" onkeypress="return justNumbers(event);" ></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                           <asp:DropDownList ID="Familiar3_Parentezco" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Madre</asp:ListItem>
                                <asp:ListItem>Padre</asp:ListItem>
                               <asp:ListItem>Padrastro</asp:ListItem>
                               <asp:ListItem>Madrastra</asp:ListItem>
                               <asp:ListItem>Hermano/a</asp:ListItem>
                               <asp:ListItem>Primo/a</asp:ListItem>
                               <asp:ListItem>Tío/a</asp:ListItem>
                               <asp:ListItem>Abuelo/a</asp:ListItem>
                               <asp:ListItem>Sobrino/a</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar3_Escolaridad" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Ninguno</asp:ListItem>
                                <asp:ListItem>Primaria</asp:ListItem>
                                <asp:ListItem>Secundaria</asp:ListItem>
                                <asp:ListItem>Bachillerato</asp:ListItem>
                                <asp:ListItem>Universidad</asp:ListItem>
                                <asp:ListItem>Carrera Trunca</asp:ListItem>
                                <asp:ListItem>Doctorado</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar3_EstadoCivil" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Soltero/a</asp:ListItem>
                                <asp:ListItem>Casado/a</asp:ListItem>
                                <asp:ListItem>Divorciado/a</asp:ListItem>
                                <asp:ListItem>Unión Libre</asp:ListItem>
                                <asp:ListItem>Divorciado/a</asp:ListItem>
                                <asp:ListItem>Viudo/a</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar3_Ocupacion" CssClass="form-control" runat="server"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Obrero</asp:ListItem>
                                <asp:ListItem>Carpintero</asp:ListItem>
                                <asp:ListItem>Electricista</asp:ListItem>
                                <asp:ListItem>Tornero</asp:ListItem>
                                <asp:ListItem>Médico</asp:ListItem>
                                <asp:ListItem>Abogado</asp:ListItem>
                                <asp:ListItem>Contador</asp:ListItem>
                                <asp:ListItem>Comerciante</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow id="Fila4">
                        <asp:TableCell>
                            <asp:TextBox ID="Familiar4_Nombre" CssClass="form-control"  runat="server" Style="text-transform:uppercase" ></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="Familiar4_Edad" MaxLength="2" CssClass="form-control"  runat="server" onkeypress="return justNumbers(event);" ></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                           <asp:DropDownList ID="Familiar4_Parentezco" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Madre</asp:ListItem>
                                <asp:ListItem>Padre</asp:ListItem>
                               <asp:ListItem>Padrastro</asp:ListItem>
                               <asp:ListItem>Madrastra</asp:ListItem>
                               <asp:ListItem>Hermano/a</asp:ListItem>
                               <asp:ListItem>Primo/a</asp:ListItem>
                               <asp:ListItem>Tío/a</asp:ListItem>
                               <asp:ListItem>Abuelo/a</asp:ListItem>
                               <asp:ListItem>Sobrino/a</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar4_Escolaridad" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Ninguno</asp:ListItem>
                                <asp:ListItem>Primaria</asp:ListItem>
                                <asp:ListItem>Secundaria</asp:ListItem>
                                <asp:ListItem>Bachillerato</asp:ListItem>
                                <asp:ListItem>Universidad</asp:ListItem>
                                <asp:ListItem>Carrera Trunca</asp:ListItem>
                                <asp:ListItem>Doctorado</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar4_EstadoCivil" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Soltero/a</asp:ListItem>
                                <asp:ListItem>Casado/a</asp:ListItem>
                                <asp:ListItem>Divorciado/a</asp:ListItem>
                                <asp:ListItem>Unión Libre</asp:ListItem>
                                <asp:ListItem>Divorciado/a</asp:ListItem>
                                <asp:ListItem>Viudo/a</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar4_Ocupacion" CssClass="form-control" runat="server"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Obrero</asp:ListItem>
                                <asp:ListItem>Carpintero</asp:ListItem>
                                <asp:ListItem>Electricista</asp:ListItem>
                                <asp:ListItem>Tornero</asp:ListItem>
                                <asp:ListItem>Médico</asp:ListItem>
                                <asp:ListItem>Abogado</asp:ListItem>
                                <asp:ListItem>Contador</asp:ListItem>
                                <asp:ListItem>Comerciante</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow id="Fila5">
                        <asp:TableCell>
                            <asp:TextBox ID="Familiar5_Nombre" CssClass="form-control"  runat="server" Style="text-transform:uppercase" ></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="Familiar5_Edad" MaxLength="2" CssClass="form-control"  runat="server" onkeypress="return justNumbers(event);" ></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                           <asp:DropDownList ID="Familiar5_Parentezco" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Madre</asp:ListItem>
                                <asp:ListItem>Padre</asp:ListItem>
                               <asp:ListItem>Padrastro</asp:ListItem>
                               <asp:ListItem>Madrastra</asp:ListItem>
                               <asp:ListItem>Hermano/a</asp:ListItem>
                               <asp:ListItem>Primo/a</asp:ListItem>
                               <asp:ListItem>Tío/a</asp:ListItem>
                               <asp:ListItem>Abuelo/a</asp:ListItem>
                               <asp:ListItem>Sobrino/a</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar5_Escolaridad" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Ninguno</asp:ListItem>
                                <asp:ListItem>Primaria</asp:ListItem>
                                <asp:ListItem>Secundaria</asp:ListItem>
                                <asp:ListItem>Bachillerato</asp:ListItem>
                                <asp:ListItem>Universidad</asp:ListItem>
                                <asp:ListItem>Carrera Trunca</asp:ListItem>
                                <asp:ListItem>Doctorado</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar5_EstadoCivil" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Soltero/a</asp:ListItem>
                                <asp:ListItem>Casado/a</asp:ListItem>
                                <asp:ListItem>Divorciado/a</asp:ListItem>
                                <asp:ListItem>Unión Libre</asp:ListItem>
                                <asp:ListItem>Divorciado/a</asp:ListItem>
                                <asp:ListItem>Viudo/a</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar5_Ocupacion" CssClass="form-control" runat="server"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Obrero</asp:ListItem>
                                <asp:ListItem>Carpintero</asp:ListItem>
                                <asp:ListItem>Electricista</asp:ListItem>
                                <asp:ListItem>Tornero</asp:ListItem>
                                <asp:ListItem>Médico</asp:ListItem>
                                <asp:ListItem>Abogado</asp:ListItem>
                                <asp:ListItem>Contador</asp:ListItem>
                                <asp:ListItem>Comerciante</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow id="Fila6">
                        <asp:TableCell>
                            <asp:TextBox ID="Familiar6_Nombre" CssClass="form-control"  runat="server" Style="text-transform:uppercase" ></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="Familiar6_Edad" MaxLength="2" CssClass="form-control"  runat="server" onkeypress="return justNumbers(event);" ></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                           <asp:DropDownList ID="Familiar6_Parentezco" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Madre</asp:ListItem>
                                <asp:ListItem>Padre</asp:ListItem>
                               <asp:ListItem>Padrastro</asp:ListItem>
                               <asp:ListItem>Madrastra</asp:ListItem>
                               <asp:ListItem>Hermano/a</asp:ListItem>
                               <asp:ListItem>Primo/a</asp:ListItem>
                               <asp:ListItem>Tío/a</asp:ListItem>
                               <asp:ListItem>Abuelo/a</asp:ListItem>
                               <asp:ListItem>Sobrino/a</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar6_Escolaridad" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Ninguno</asp:ListItem>
                                <asp:ListItem>Primaria</asp:ListItem>
                                <asp:ListItem>Secundaria</asp:ListItem>
                                <asp:ListItem>Bachillerato</asp:ListItem>
                                <asp:ListItem>Universidad</asp:ListItem>
                                <asp:ListItem>Carrera Trunca</asp:ListItem>
                                <asp:ListItem>Doctorado</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar6_EstadoCivil" runat="server" CssClass="form-control"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Soltero/a</asp:ListItem>
                                <asp:ListItem>Casado/a</asp:ListItem>
                                <asp:ListItem>Divorciado/a</asp:ListItem>
                                <asp:ListItem>Unión Libre</asp:ListItem>
                                <asp:ListItem>Divorciado/a</asp:ListItem>
                                <asp:ListItem>Viudo/a</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="Familiar6_Ocupacion" CssClass="form-control" runat="server"> 
                                <asp:ListItem>-Seleccione-</asp:ListItem>
                                <asp:ListItem>Obrero</asp:ListItem>
                                <asp:ListItem>Carpintero</asp:ListItem>
                                <asp:ListItem>Electricista</asp:ListItem>
                                <asp:ListItem>Tornero</asp:ListItem>
                                <asp:ListItem>Médico</asp:ListItem>
                                <asp:ListItem>Abogado</asp:ListItem>
                                <asp:ListItem>Contador</asp:ListItem>
                                <asp:ListItem>Comerciante</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                </div>
            </div>
                </div>
                   </ContentTemplate>
                        </asp:UpdatePanel>
                <br />
                    <div class="col-md-12 alert-danger" align="center">
                        <label>Antecedencentes de institución de procedencia</label>
                    </div>
                <br />
                <div class="row">
                    <div class="col-md-2" align="right">
                        <label><font size="1">Estado:</font></label>
                    </div>
                        <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                            <ContentTemplate>
                       <div class="col-md-3" align="left">
                                <asp:DropDownList runat="server" Width="100%" ID="est_Escu_ID" AutoPostBack="true" OnSelectedIndexChanged="est_Escu_ID_SelectedIndexChanged">
                            <asp:ListItem Value="0">-Selecciona</asp:ListItem>
                            <asp:ListItem Value="1">A</asp:ListItem>
                            <asp:ListItem Value="2">B</asp:ListItem>
                        </asp:DropDownList>
                           <asp:RequiredFieldValidator id="rfv_est_Escu_ID" ControlToValidate="est_Escu_ID" ErrorMessage="Seleccione un Estado" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" InitialValue="-Seleccione-" runat="server"/>

                                    </div>
                            </ContentTemplate>
                            <Triggers>
                          <asp:AsyncPostBackTrigger ControlID="est_Natal_ID" EventName="selectedindexchanged" />
                        </Triggers>
                        </asp:UpdatePanel>

                    </div>
                    <br />
                    <div class="row">
                            <div class="col-md-2" align="right">
                        <label><font size="1">Municipio:</font></label>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                        <ContentTemplate>
                    <div class="col-md-3" align="left">
                        <asp:DropDownList runat="server" Width="100%" ID="mun_Escu_ID" AutoPostBack="true" OnSelectedIndexChanged="mun_Escu_ID_SelectedIndexChanged">
                            <asp:ListItem Value="0">-Selecciona</asp:ListItem>
                            <asp:ListItem Value="1">A</asp:ListItem>
                            <asp:ListItem Value="2">B</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator id="rfv_mun_Escu_ID" ControlToValidate="mun_Escu_ID" ErrorMessage="Seleccione un Municipio" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" InitialValue=" " runat="server"/>
                    </div>
                        </ContentTemplate>
                         <Triggers>
            <asp:AsyncPostBackTrigger ControlID="mun_Natal_ID" EventName="selectedindexchanged" />
        </Triggers>
                    </asp:UpdatePanel>
                   
                </div>
                    <br />
                    <div class="row">                            
                    <div class="col-md-2" align="right">
                        <label><font size="1">*Nombre de la institución:</font></label>
                        </div>
                    <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                        <ContentTemplate>
                    <div class="col-md-3" align="left">
                        <asp:DropDownList runat="server" Width="100%" ID="esc_ID" AutoPostBack="true">
                            <asp:ListItem Value="0">-Selecciona-</asp:ListItem>
                       </asp:DropDownList>
                    </div>
                        </ContentTemplate>
 
                    </asp:UpdatePanel>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-2" align="right">
                        <label><font size="1">Propedéutico cursado:</font></label>
                    </div>
                     <div class="col-md-3" align="left">
                        
                           <asp:DropDownList runat="server" Width="100%" ID="alc_EspBachi" >
                            <asp:ListItem Value="0">-Seleccione-</asp:ListItem>
                            <asp:ListItem Value="1">Exactas</asp:ListItem>
                            <asp:ListItem Value="2">Contables</asp:ListItem>
                            <asp:ListItem Value="3">Biológicas</asp:ListItem>
                                <asp:ListItem Value="4">Sociales</asp:ListItem>
                                <asp:ListItem Value="5">General</asp:ListItem>
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="RequiredFieldVal4" runat="server" ControlToValidate="alc_EspBachi" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" ErrorMessage="Seleccione un Propedéutico!" InitialValue="--Select--"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-2" align="right">
                        <label><font size="1">*Año en que concluyó: </font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        <asp:TextBox MaxLength="4"   ID="txtAnnoConcluido" Width="100%" runat="server" onkeypress="return justNumbers(event);"> </asp:TextBox>
                                            <asp:RequiredFieldValidator id="a" ControlToValidate="txtAnnoConcluido" ErrorMessage="Seleccione una Institución" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" runat="server"/>

                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-2" align="right">
                        <label><font size="1">*Promedio con el que concluyó</font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        <asp:TextBox MaxLength="3" ID="alc_PromBachi" runat="server" Width="100%" onkeypress="return justNumbers(event);"> </asp:TextBox>
                      <asp:RequiredFieldValidator id="RequiredFieldValidator18" ControlToValidate="alc_PromBachi" ErrorMessage="Seleccione una Institución" Display="Dynamic" ForeColor="#B50128" Font-Bold="true" Font-Size="8" runat="server"/>

                         </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4" align="center">
                    </div>
                    <div class="col-md-4" align="center">
                    </div>
                    <div class="col-md-4" align="center">
                        <asp:Button runat="server" ID="btnGuardar" Text="Actualizar" CssClass="btn btn-success" value="Registrar" OnClick="btnGuardar_Click" />
                        <%--*********Va despues del boton "guardar"******************************************--%>
                    </div>
                </div>
                
                </div>
            
            <br />
        </div>

    </asp:Panel>
    <br />
    <br />
    <div class="row">
    <div class="col-md-3" align="center">
    </div>
    <div class="alert alert-danger col-md-6">
        <strong>Campos con * OBLIGATORIOS.
    </div>
    <div class="col-md-3" align="center">
    </div>
    </div>   

                      <script type="text/javascript">
                      function ocultarActividad() {
                          var buttonID = '<%= UpdatePanel7.ClientID %>';
                        var button = document.getElementById(buttonID);


                        var radiolist = document.getElementById('<%= rb_lei_ID.ClientID %>');
                        var radio = radiolist.getElementsByTagName("input");

                        for (var x = 0; x < radio.length; x++) {
                            if (radio[x].type === "radio" && radio[x].checked) {
                                if (radio[x].value == "Si") {
                                    button.style.display = 'inherit';
                                    radio[x].setActive() = true;
                                } else {
                                    button.style.display = 'none';
                                    radio[x].setActive() = true;
                                }
                            }
                        }
                    }
                </script>
</asp:Content>