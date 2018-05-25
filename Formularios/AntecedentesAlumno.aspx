<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="AntecedentesAlumno.aspx.cs" Inherits="Conect.Formularios.AntecedentesAlumno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="container">
            <div class="page-header" align="center">
                <h1>Antecedencentes Laborales y Personales</h1>

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
                        <label>Antecedencentes Laborales y Personales del Aspirante</label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4" align="justify">
                        <label><font size="1">Actualmente, ¿con quién vives?:</font></label>
                    </div>
                    <div class="col-md-3" align="left">

                        <asp:DropDownList runat="server" Width="100%" ID="alp_PersonaVives">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="Papá">Papá</asp:ListItem>
                            <asp:ListItem Value="Mamá">Mamá</asp:ListItem>
                            <asp:ListItem Value="Ambos padres">Ambos padres</asp:ListItem>
                            <asp:ListItem Value="Hermano(a)">Hermano(a)</asp:ListItem>
                            <asp:ListItem Value="Abuelo">Abuelo</asp:ListItem>
                            <asp:ListItem Value="Abuela">Abuela</asp:ListItem>
                            <asp:ListItem Value="Tíos(as)">Tíos(as)</asp:ListItem>
                            <asp:ListItem Value="Familia completa">Familia completa</asp:ListItem>
                            <asp:ListItem Value="otros">otros</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            InitialValue="0"
                            ControlToValidate="alp_PersonaVives"
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
                        <label><font size="1">¿Tu eres el jefe del hogar?</font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        <asp:RadioButtonList ID="alp_EstatusJefeHoga" runat="server" RepeatDirection="Horizontal" Height="20px" Width="103px">
                            <asp:ListItem id="alp_EstatusJefeHogarSi" Text="Si" Value="F" />
                            <asp:ListItem id="alp_EstatusJefeHogarNo" Text="No" Value="M" />
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="alp_EstatusJefeHoga"
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
                        <label><font size="1">¿Tienes hijos o dependientes económicos?</font></label>
                    </div>

                    <script type="text/javascript">
                        function getvalueofradiolist() {
                            var buttonID = '<%= alp_NoHijosDepeEcon.ClientID %>';
                            var button = document.getElementById(buttonID);
                            var label1 = document.getElementById('labelHijos');

                            var radiolist = document.getElementById('<%= alp_Hijo.ClientID %>');
                            var radio = radiolist.getElementsByTagName("input");

                            for (var x = 0; x < radio.length; x++) {
                                if (radio[x].type === "radio" && radio[x].checked) {
                                    if (radio[x].value == "Si") {
                                        button.style.display = 'inherit';
                                        label1.style.display = 'inherit';
                                        radio[x].setActive() = true;
                                    } else {
                                        button.style.display = 'none';
                                        label1.style.display = 'none';
                                        radio[x].setActive() = true;
                                    }
                                }
                            }
                        }
                    </script>
                    <script type="text/javascript">
                        function ocultarActividad() {
                            var buttonID = '<%= alp_Empleo.ClientID %>';
                            var button = document.getElementById(buttonID);
                            var buttonID2 = '<%= alp_IngresoAlumno.ClientID %>';
                            var button2 = document.getElementById(buttonID2);
                            var label2 = document.getElementById('labelCual');
                            var label3 = document.getElementById('labelCualIn');

                            var radiolist = document.getElementById('<%= apl.ClientID %>');
                            var radio = radiolist.getElementsByTagName("input");

                            for (var x = 0; x < radio.length; x++) {
                                if (radio[x].type === "radio" && radio[x].checked) {
                                    if (radio[x].value == "Si") {
                                        button.style.display = 'inherit';
                                        button2.style.display = 'inherit';
                                        label2.style.display = 'inherit';
                                        label3.style.display = 'inherit';
                                        radio[x].setActive() = true;
                                    } else {
                                        button.style.display = 'none';
                                        button2.style.display = 'none';
                                        label2.style.display = 'none';
                                        label3.style.display = 'none';
                                        radio[x].setActive() = true;
                                    }
                                }
                            }
                        }
                    </script>

                    <div class="col-md-3" align="left">
                        <asp:RadioButtonList ID="alp_Hijo" runat="server" RepeatDirection="Horizontal" Height="20px" Width="103px" onclick="getvalueofradiolist(); return false;">
                            <asp:ListItem id="alp_HijoSi" Text="Si" Value="Si" />
                            <asp:ListItem id="alp_HijoNo" Text="No" Value="No" />
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="alp_Hijo"
                            ErrorMessage="<p>Selecciona una opción!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-1" align="justify">
                        <label id="labelHijos" style="display: none"><font size="1">¿Cuántos?</font></label>
                    </div>
                    <div class="col-md-2" align="left">
                        <asp:TextBox MaxLength="2" ID="alp_NoHijosDepeEcon" Style="display: none" runat="server" onkeypress="return justNumbers(event);" Width="100%"></asp:TextBox>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-4" align="justify">
                        <label><font size="1">¿Trabajas o haces alguna actividad que ayude al gasto del hogar?</font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        <asp:RadioButtonList ID="apl" runat="server" RepeatDirection="Horizontal" Height="20px" Width="103px" onclick="ocultarActividad(); return false;">
                            <asp:ListItem id="alp_EmpleoSi" Text="Si" />
                            <asp:ListItem id="alp_EmpleoNo" Text="No" />
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="apl"
                            ErrorMessage="<p>Selecciona una opción!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-1" align="justify">
                        <label id="labelCual" style="display: none"><font size="1">¿Cuál?</font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        <asp:TextBox ID="alp_Empleo" Style="display: none" runat="server" Width="100%" onkeypress="return soloLetras(event)"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4" align="justify">
                        <label style="display: none" id="labelCualIn"><font size="1">¿Cuál es tu ingreso mensual?</font></label>
                    </div>
                    <div class="col-md-2" align="left">
                        <asp:TextBox MaxLength="6" ID="alp_IngresoAlumno" Style="display: none" Width="100%" placeholder="$" runat="server" onkeypress="return justNumbers(event)"></asp:TextBox>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-12 alert-danger" align="center">
                        <label>Antecedencentes Laborales Personales del tutor</label>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-6" align="justify">
                        <label><font size="1">Semanalmente,¿Cuantos dias labora el jefe del hogar?</font></label>
                    </div>
                    <div class="col-md-3" align="left">

                        <asp:DropDownList runat="server" Width="100%" ID="alp_NoDiasTrabajaJefeH">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                            <asp:ListItem Value="6">6</asp:ListItem>
                            <asp:ListItem Value="7">7</asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            InitialValue="0"
                            ControlToValidate="alp_NoDiasTrabajaJefeH"
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
                        <label><font size="1">Mensualmente,¿Cual es el ingreso mensual que recibe el jefe del hogar?</font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        <asp:TextBox MaxLength="6" ID="alp_DineroMensualPorTrabajar" Width="100%" placeholder="$" runat="server" onkeypress="return justNumbers(event)"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="alp_DineroMensualPorTrabajar"
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
                    <div class="col-md-6" align="justify">
                        <label><font size="1">¿Cuántas personas, unidas o por lazos de parentezco, dependen total o parcialmente del ingreso de los miembros de tu hogar para cubrir con los gastos de alimentación? (inclúyete):</font></label>
                    </div>

                    <div class="col-md-3" align="left">
                        <asp:DropDownList runat="server" Width="100%" ID="alp_NoPersonasDepeIngr">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                            <asp:ListItem Value="6">6</asp:ListItem>
                            <asp:ListItem Value="7">7</asp:ListItem>
                            <asp:ListItem Value="8">9</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                            InitialValue="0"
                            ControlToValidate="alp_NoPersonasDepeIngr"
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
                <br />



                <div class="row">
                    <div class="col-md-4" align="center">
                    </div>
                    <div class="col-md-4" align="center">
                    </div>
                    <div class="col-md-4" align="right">
                        <asp:Button runat="server" href="Informacion%20Familiar.aspx" ID="btnGuardar" Text="GUARDAR" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
                    </div>
                </div>

            </div>
            <br />
        </div>
    </asp:Panel>
</asp:Content>