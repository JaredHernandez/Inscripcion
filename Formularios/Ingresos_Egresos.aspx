<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Ingresos_Egresos.aspx.cs" Inherits="Conect.Formularios.Ingresos_Egresos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Ingresos & Egresos</title>
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
                        <label>Ingresos y Egresos Familiares</label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6" align="justify">
                        <div class="row">
                            <div class="col-md-12" align="justify">
                                <label><font size="1">¿A cuánto ascienden los ingresos mensuales familiares?</font></label>
                            </div>

                        </div>
                        <br />

                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Padre</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox onblur="Sum()" onkeypress="return justNumbers(event)" placeholder="$" ID="ief_Padre" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server" OnTextChanged="ief_Padre_TextChanged"></asp:TextBox>
                            </div>

                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Madre</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox onblur="Sum()" onkeypress="return justNumbers(event)" placeholder="$" ID="ief_Madre" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server" OnTextChanged="ief_Madre_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Usted</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox onblur="Sum()" onkeypress="return justNumbers(event)" placeholder="$" ID="ief_Usted" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server" OnTextChanged="ief_Usted_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Hermanos</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox onblur="Sum()" onkeypress="return justNumbers(event)" placeholder="$" ID="ief_Hermanos" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server" OnTextChanged="ief_Hermanos_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Cónyuge</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox onblur="Sum()" onkeypress="return justNumbers(event)" placeholder="$" ID="ief_Conyuge" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server" OnTextChanged="ief_Conyuge_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Otros</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox onblur="Sum()" placeholder="$" ID="ief_Otros" onkeypress="return justNumbers(event)" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server" OnTextChanged="ief_Otros_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Total de Ingresos</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox ReadOnly="true" onkeypress="return justNumbers(event)" placeholder="$" ID="ief_Total" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-6" align="justify">
                        <div class="row">
                            <div class="col-md-12" align="left">
                                <label><font size="1">¿A cuánto ascienden los egresos mensuales familiares?</font></label>
                            </div>

                        </div>
                        <br />

                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Renta</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox onblur="Sum2()" onkeypress="return justNumbers(event)" placeholder="$" ID="ief_Renta" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server" OnTextChanged="ief_Renta_TextChanged"></asp:TextBox>
                            </div>

                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Alimentación</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox onblur="Sum2()" onkeypress="return justNumbers(event)" placeholder="$" ID="ief_Alimentacion" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server" OnTextChanged="ief_Alimentacion_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Vestido</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox onblur="Sum2()" onkeypress="return justNumbers(event)" placeholder="$" ID="ief_Vestido" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server" OnTextChanged="ief_Vestido_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Transporte</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox onblur="Sum2()" onkeypress="return justNumbers(event)" placeholder="$" ID="ief_Transporte" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server" OnTextChanged="ief_Transporte_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Colegiatura</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox onblur="Sum2()" onkeypress="return justNumbers(event)" placeholder="$" ID="ief_Colegiatura" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server" OnTextChanged="ief_Colegiatura_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Agua</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox onblur="Sum2()" onkeypress="return justNumbers(event)" placeholder="$" ID="ief_Agua" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server" OnTextChanged="ief_Agua_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Electricidad</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox onblur="Sum2()" onkeypress="return justNumbers(event)" placeholder="$" ID="ief_Electricidad" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server" OnTextChanged="ief_Electricidad_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Gas o Combustible</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox onblur="Sum2()" onkeypress="return justNumbers(event)" placeholder="$" ID="ief_GasCombustible" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server" OnTextChanged="ief_GasCombustible_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Teléfono</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox onblur="Sum2()" onkeypress="return justNumbers(event)" placeholder="$" ID="ief_Telefono" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server" OnTextChanged="ief_Telefono_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Otros</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox onblur="Sum2()" onkeypress="return justNumbers(event)" placeholder="$" ID="ief_OtrosE" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server" OnTextChanged="ief_OtrosE_TextChanged"></asp:TextBox>
                            </div>

                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6" align="left">
                                <label><font size="1">Total de Egresos</font></label>
                            </div>
                            <div class="col-md-6" align="left">

                                <asp:TextBox ReadOnly="true" placeholder="$" ID="ief_TotalEgresos" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12" align="left">
                        <label><font size="1"><em>*En caso de recibir ayuda económica de otra persona, responda las siguientes preguntas:</em></font></label>
                    </div>

                </div>
                <br />
                <div class="row">
                    <div class="col-md-4" align="left">
                        <label><font size="1">¿Qué parentesco tiene con la persona que le ayuda?</font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        <asp:DropDownList runat="server" Width="100%" ID="ief_ParentezcoPersona">
                            <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                            <asp:ListItem Value="Papá">Papá</asp:ListItem>
                            <asp:ListItem Value="Mamá">Mamá</asp:ListItem>
                            <asp:ListItem Value="Hermano(a)">Hermano(a)</asp:ListItem>
                            <asp:ListItem Value="Abuelo(a)">Abuelo(a)</asp:ListItem>
                            <asp:ListItem Value="Tio(a)">Tio(a)</asp:ListItem>
                            <asp:ListItem Value="6">Otro</asp:ListItem>
                        </asp:DropDownList>
                        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="ief_ParentezcoPersona"
                            InitialValue="0";
                            ErrorMessage="<p>Selecciona una opción!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>--%>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4" align="left">
                        <label><font size="1">¿Qué cantidad le proporciona?</font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        <asp:TextBox ID="ief_CantidadPersona" placeholder="$" onkeypress="return justNumbers(event)" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server"></asp:TextBox>
                        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="ief_CantidadPersona"
                            ErrorMessage="<p>Ingresa una cantidad</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>--%>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4" align="left">
                        <label><font size="1">¿Con qué frecuencia?</font></label>
                    </div>
                    <div class="col-md-3" align="left">
                        <asp:DropDownList runat="server" Width="100%" ID="ief_FrecuenciaAporte">
                            <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                            <asp:ListItem Value="1 - 2 veces al mes">1 - 2 veces al mes</asp:ListItem>
                            <asp:ListItem Value="2 - 4 veces al mes">2 - 4 veces al mes</asp:ListItem>
                            <asp:ListItem Value="4 - 6 veces al mes">4 - 6 veces al mes</asp:ListItem>
                            <asp:ListItem Value="6 - más veces al mes">6 - más veces al mes</asp:ListItem>
                        </asp:DropDownList>
                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="ief_FrecuenciaAporte"
                            InitialValue="0";
                            ErrorMessage="<p>Selecciona una opción!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>--%>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4" align="justify">
                        <label><font size="1">¿A cuánto asciende su gasto diario?</font></label>
                    </div>
                    <div class="col-md-3" align="left">

                        <asp:TextBox onkeypress="return justNumbers(event)" placeholder="$" ID="ief_GastoDiario" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server"></asp:TextBox>
                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="ief_GastoDiario"
                            ErrorMessage="<p>Ingresa una cantidad</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>--%>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-4" align="left">
                        <label><font size="1">¿Por qué conceptos?</font></label>
                    </div>
                    <div class="col-md-6" align="left">
                        <asp:TextBox ID="ief_Conceptos" Style="font: 10px; text-transform: uppercase" Width="100%" runat="server"></asp:TextBox>
                    </div>
                </div>
                <br />


                <div class="row">

                    <div class="col-md-12" align="right">
                        <asp:Button runat="server" ID="btnSiguiente2" Text="GUARDAR" CssClass="btn btn-success" OnClick="btnSiguiente2_Click" />
                    </div>
                </div>


            </div>
        </div>

    </asp:Panel>
    <script>
        function Sum() {
            var text1 = document.getElementById('<%= ief_Padre.ClientID %>');
       var text2 = document.getElementById('<%= ief_Madre.ClientID %>');
       var text3 = document.getElementById('<%= ief_Usted.ClientID %>');
       var text4 = document.getElementById('<%= ief_Hermanos.ClientID %>');
       var text5 = document.getElementById('<%= ief_Conyuge.ClientID %>');
       var text6 = document.getElementById('<%= ief_Otros.ClientID %>');



       var t1 = parseInt(text1.value);
       var t2 = parseInt(text2.value);
       var t3 = parseInt(text3.value);
       var t4 = parseInt(text4.value);
       var t5 = parseInt(text5.value);
       var t6 = parseInt(text6.value);

       document.getElementById('<%= ief_Total.ClientID %>').value = t1 + t2 + t3 + t4 + t5 + t6;
                    }
                    function Sum2() {
                        var text1 = document.getElementById('<%= ief_Renta.ClientID %>');
            var text2 = document.getElementById('<%= ief_Alimentacion.ClientID %>');
            var text3 = document.getElementById('<%= ief_Vestido.ClientID %>');
            var text4 = document.getElementById('<%= ief_Transporte.ClientID %>');
            var text5 = document.getElementById('<%= ief_Colegiatura.ClientID %>');
            var text6 = document.getElementById('<%= ief_Agua.ClientID %>');
            var text7 = document.getElementById('<%= ief_Electricidad.ClientID %>');
            var text8 = document.getElementById('<%= ief_GasCombustible.ClientID %>');
            var text9 = document.getElementById('<%= ief_Telefono.ClientID %>');
            var text10 = document.getElementById('<%= ief_OtrosE.ClientID %>');

            var t1 = parseInt(text1.value);
            var t2 = parseInt(text2.value);
            var t3 = parseInt(text3.value);
            var t4 = parseInt(text4.value);
            var t5 = parseInt(text5.value);
            var t6 = parseInt(text6.value);
            var t7 = parseInt(text7.value);
            var t8 = parseInt(text8.value);
            var t9 = parseInt(text9.value);
            var t10 = parseInt(text10.value);
            //if (text1.value.length == 0 || text2.value.length == 0 || text3.value.length == 0
            //   || text4.value.length == 0 || text5.value.length == 0 || text6.value.length == 0) {
            //    alert('NINGÚN CAMPO DEBE QUEDAR VACÍO (OCUPE "0" DONDE SEA NECESARIO)');
            //    return;
            //}
            document.getElementById('<%= ief_TotalEgresos.ClientID %>').value = t1 + t2 + t3 + t4 + t5 + t6 + t7 + t8 + t9 + t10;

                    }
    </script>
</asp:Content>