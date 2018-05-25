<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Vivienda.aspx.cs" Inherits="Conect.Formularios.Vivienda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Vivienda</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="container">
            <div class="page-header" align="center">
                <h1>Estudio Socioeconómico</h1>

            </div>
        </div>
    </div>
    <br />
    <div class="col-md-2" align="left">
    </div>
    <asp:Panel runat="server">
        <div class="col-md-8" align="center">
            <div class="tabla">
                <div class="row">
                    <div class="col-md-12 alert-danger" align="center">
                        <label>Información Relativa a la Vivienda</label>
                    </div>
                </div>
                <br />
                <div class="row">

                    <div class="col-md-4" align="justify">
                        <label><font size="1">La vivienda donde vive tu familia es:</font></label>
                    </div>
                    <div class="col-md-3" align="left">

                        <asp:DropDownList runat="server" Width="100%" ID="viv_TipoVivienda">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="Prestada">Prestada</asp:ListItem>
                            <asp:ListItem Value="Rentada">Rentada</asp:ListItem>
                            <asp:ListItem Value="Propia">Propia</asp:ListItem>
                            <asp:ListItem Value="Se está pagando">Se está pagando</asp:ListItem>

                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            InitialValue="0"
                            ControlToValidate="viv_TipoVivienda"
                            ErrorMessage="<p>Selecciona una opción!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4" align="justify">
                        <label><font size="1">¿De que material es la mayor parte del techo de la vivienda?</font></label>
                    </div>
                    <div class="col-md-3" align="left">

                        <asp:DropDownList runat="server" Width="100%" ID="viv_MaterialTecho">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="Concreto">Concreto</asp:ListItem>
                            <asp:ListItem Value="Lámina de Metal">Lámina de Metal</asp:ListItem>
                            <asp:ListItem Value="Lámina de Cartón">Lámina de Cartón</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            InitialValue="0"
                            ControlToValidate="viv_MaterialTecho"
                            ErrorMessage="<p>Selecciona una opción!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />

                <div class="row">

                    <div class="col-md-4" align="justify">
                        <label><font size="1">¿De que material es la mayor parte de las paredes de la vivienda?</font></label>
                    </div>
                    <div class="col-md-3" align="left">

                        <asp:DropDownList runat="server" Width="100%" ID="viv_MaterialParedes">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="Ladrillo">Ladrillo</asp:ListItem>
                            <asp:ListItem Value="Block">Block</asp:ListItem>
                            <asp:ListItem Value="Adobe">Adobe</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            InitialValue="0"
                            ControlToValidate="viv_MaterialParedes"
                            ErrorMessage="<p>Selecciona una opción!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4" align="justify">
                        <label><font size="1">¿De que material es la mayor parte del piso de la vivienda?</font></label>
                    </div>
                    <div class="col-md-3" align="left">

                        <asp:DropDownList runat="server" Width="100%" ID="viv_MaterialPiso">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="Cemento">Cemento</asp:ListItem>
                            <asp:ListItem Value="Mosaico/Loseta">Mosaico/Loseta</asp:ListItem>
                            <asp:ListItem Value="Piso de tierra">Piso de tierra</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            InitialValue="0"
                            ControlToValidate="viv_MaterialPiso"
                            ErrorMessage="<p>Selecciona una opción!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />
                <div class="row">

                    <div class="col-md-4" align="justify">
                        <label><font size="1">¿La vivienda tiene un cuarto solo para cocinar?</font></label>
                    </div>
                    <div class="col-md-2" align="left">
                        <asp:RadioButtonList ID="viv_CocinaIndependiente" runat="server" RepeatDirection="Horizontal" Height="20px" Width="154px">
                            <asp:ListItem ID="viv_CocinaIndependienteSi" Value="Si"><font size="1">Si</font></asp:ListItem>
                            <asp:ListItem ID="viv_CocinaIndependienteNo" Value="No"><font size="1">No</font></asp:ListItem>

                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="viv_CocinaIndependiente"
                            ErrorMessage="<p>Selecciona una opción!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4" align="justify">
                        <label><font size="1">¿Cuántos cuartos se usan para dormir, sin contar pasillos?</font></label>
                    </div>
                    <div class="col-md-3" align="left">

                        <asp:DropDownList runat="server" Width="100%" ID="viv_NoDormitorios">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                            <asp:ListItem Value="6">6</asp:ListItem>
                            <asp:ListItem Value="7">7</asp:ListItem>
                            <asp:ListItem Value="8">8</asp:ListItem>
                            <asp:ListItem Value="9">9</asp:ListItem>
                            <asp:ListItem Value="10">10</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            InitialValue="0"
                            ControlToValidate="viv_NoDormitorios"
                            ErrorMessage="<p>Selecciona una opción!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4" align="justify">
                        <label><font size="1">¿Cuántos cuartos tiene el total la vivienda contando la cocina (sin contar pasillos y baños)?</font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        <asp:DropDownList runat="server" Width="100%" ID="viv_NoCuartos">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                            <asp:ListItem Value="6">6</asp:ListItem>
                            <asp:ListItem Value="7">7</asp:ListItem>
                            <asp:ListItem Value="8">8</asp:ListItem>
                            <asp:ListItem Value="9">9</asp:ListItem>
                            <asp:ListItem Value="10">10</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                            InitialValue="0"
                            ControlToValidate="viv_NoCuartos"
                            ErrorMessage="<p>Selecciona una opción!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-6" align="justify">
                        <label><font size="1">En la vivienda se cuenta con:</font></label>
                    </div>

                </div>
                <div class="row">
                    <font size="1">
                   <div class="col-md-4" align="left">
                       
                            <asp:CheckBox ID="viv_Luz" Text="Luz" Value="Luz" runat="server"/><br />
                            <asp:CheckBox ID="viv_AguaPotable" Text="Agua Potable" Value="Agua Potable" runat="server" /><br />
                            <asp:CheckBox ID="viv_Gas" Text="Gas" Value="Estufa de Gas" runat="server" /><br />
                            <asp:CheckBox ID="viv_TinacoDeAgua" Text="Tinaco de agua" Value="Tinaco de agua" runat="server"/><br />
                            <asp:CheckBox ID="viv_Cisterna" Text="Cisterna" Value="Cisterna" runat="server"/><br />
                            <asp:CheckBox ID="viv_Lavadora" Text="Lavadora" Value="Lavadora" runat="server" /><br />
                            <asp:CheckBox ID="viv_Refrigerador" Text="Refrigerador" Value="Refrigerador" runat="server"/><br />
                        
                      
                   
                     </div>



                <div class="col-md-4" align="left">
                       
                            <asp:CheckBox ID="viv_Drenaje" Text="Drenaje" Value="Drenaje" runat="server"/><br />
                            <asp:CheckBox ID="viv_Compu" Text="Computadora" Value="Computadora" runat="server"/><br />
                            <asp:CheckBox ID="viv_AcceInter" Text="Acceso a Internet" Value="Acceso a Internet" runat="server"/><br />
                            <asp:CheckBox ID="viv_Auto" Text="Automóvil/Camioneta" Value="Automóvil/Camioneta" runat="server" /><br />
                            <asp:CheckBox ID="viv_Moto" Text="Motocicleta" Value="metric" runat="server"/><br />
                            <asp:CheckBox ID="Horno" Text="Horno de Microondas" Value="Horno de Microondas" runat="server"/><br />
                            <asp:CheckBox ID="Electrodomes" Text="Electrodomésticos" Value="Electrodomésticos (Licuadora, Plancha, etc.)" runat="server"/><br />
                  
                      
                   
                     </div>
                 <div class="col-md-4" align="left">
                       
                            <asp:CheckBox ID="viv_Regadera" Text="Regadera" Value="Regadera" runat="server"/><br />
                            <asp:CheckBox ID="viv_MedLuz" Text="Medidor de Luz" Value="Medidor de Luz" runat="server"/><br />
                            <asp:CheckBox ID="viv_Tele" Text="Televisión" Value="Televisión" runat="server"/><br />
                            <asp:CheckBox ID="viv_Dvd" Text="DVD" Value="DVD" runat="server"/><br />
                            <asp:CheckBox ID="viv_Radio" Text="Radio" Value="Radio" runat="server"/><br />
                            <asp:CheckBox ID="viv_TV" Text="T.V por cable" Value="T.V por cable" runat="server"/>&nbsp;<br />
                            <asp:CheckBox ID="viv_Telefono" Text="Teléfono" Value="Teléfono" runat="server"/><br />
                            <asp:CheckBox ID="viv_EstufaDeGas" Text="Estufa de Gas" Value="Estufa de Gas" runat="server"/><br />
                    
                      
                   
                </div> 
              </font>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4" align="justify">
                        <label><font size="1">Para trasladarse del lugar donde vive hasta la Universidad, ¿Qué medio de transporte usa?</font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        <asp:DropDownList runat="server" Width="100%" ID="alc_MediTransp">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="Bicicleta">Bicicleta</asp:ListItem>
                            <asp:ListItem Value="Colectiva">Colectiva</asp:ListItem>
                            <asp:ListItem Value="Auto/Camioneta">Auto/Camioneta</asp:ListItem>
                            <asp:ListItem Value="Taxi">Taxi</asp:ListItem>
                            <asp:ListItem Value="Caminando">Caminando</asp:ListItem>
                            <asp:ListItem Value="Otro">Otro</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                            InitialValue="0"
                            ControlToValidate="alc_MediTransp"
                            ErrorMessage="<p>Selecciona una opción!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4" align="justify">
                        <label><font size="1">¿Cuánto tiempo ocupa en trasladarse del lugar a donde vive hasta la Universidad? (EN MINUTOS)</font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        <asp:DropDownList runat="server" Width="100%" ID="alc_TiempoTranslado">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="0 - 30 min">0 - 30 min</asp:ListItem>
                            <asp:ListItem Value="30 min - 1 hora">30 min - 1 hora</asp:ListItem>
                            <asp:ListItem Value="1 hora - 1:30 hora">1 hora - 1:30 hora</asp:ListItem>
                            <asp:ListItem Value="1:30 hora - 2 horas">1:30 hora - 2 horas</asp:ListItem>
                            <asp:ListItem Value="2 horas - más">2 horas - más</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                            InitialValue="0"
                            ControlToValidate="alc_TiempoTranslado"
                            ErrorMessage="<p>Selecciona una opción!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4" align="left">
                        <label><font size="1">¿Donde vive?</font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        <asp:TextBox ID="ief_LugarPrecedencia" Width="100%" runat="server" onkeypress="return soloLetras(event)"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                            ControlToValidate="ief_LugarPrecedencia"
                            ErrorMessage="<p>Ingresa un lugar!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4" align="justify">
                        <label><font size="1">¿Cuanto gastas en pasajes?</font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        <asp:TextBox MaxLength="3" ID="ief_GastoPasaje" Width="100%" placeholder="$" runat="server" onkeypress="return justNumbers(event)"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                            ControlToValidate="ief_GastoPasaje"
                            ErrorMessage="<p>Ingresa una cantidad!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />
                <div class="row">

                    <div class="col-md-12" align="right">
                        <asp:Button runat="server" ID="btnSiguiente2" Text="GUARDAR" CssClass="btn btn-success" OnClick="btnSiguiente2_Click" />
                    </div>
                </div>


            </div>
    </asp:Panel>
</asp:Content>
