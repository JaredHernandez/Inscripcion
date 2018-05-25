<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Becas.aspx.cs" Inherits="Conect.Formularios.Becas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Becas</title>
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
                        <label>Información Relativa a Becas y Apoyos</label>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-6" align="justify">
                        <label><font size="1">En la actualidad ¿Recibes alguna beca para cursar tus estudios de educación superior?</font></label>
                    </div>
                    <div class="col-md-2" align="left">
                        <asp:RadioButtonList ID="bec" runat="server" RepeatDirection="Horizontal" Height="20px" Width="103px" onclick="ocultarActividad(); return false;">
                            <asp:ListItem id="bec_EstatusBecadoSII" Value="Si" Text="Si" />
                            <asp:ListItem id="bec_EstatusBecadoNOO" Value="No" Text="No" />
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="bec"
                            ErrorMessage="<p>Selecciona una opción!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-1" align="left">
                        <label id="labelCual" style="display: none"><font size="1">¿Cual?</font></label>
                    </div>
                    <div class="col-md-2" align="left">
                        <asp:DropDownList runat="server" Width="100%" ID="bec_EstatusBecado" Style="display: none">
                            <asp:ListItem Value="0">Académica</asp:ListItem>
                            <asp:ListItem Value="1">Propera</asp:ListItem>
                            <asp:ListItem Value="2">Oportunidades</asp:ListItem>
                            <asp:ListItem Value="3">Alimentación</asp:ListItem>
                            <asp:ListItem Value="4">Otra</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <script type="text/javascript">
                    function ocultarActividad() {
                        var buttonID = '<%= bec_EstatusBecado.ClientID %>';
                        var button = document.getElementById(buttonID);
                        var label1 = document.getElementById('labelCual');


                        var radiolist = document.getElementById('<%= bec.ClientID %>');
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

                <br />
                <div class="row">

                    <div class="col-md-6" align="justify">
                        <label><font size="1">¿Has tenido que suspeder tus estudios por 6 meses o más debido a problemas económicos?</font></label>
                    </div>
                    <div class="col-md-2" align="left">
                        <asp:RadioButtonList ID="bec_SuspenciosEstudios" runat="server" RepeatDirection="Horizontal" Height="20px" Width="103px">
                            <asp:ListItem id="bec_SuspenciosEstudiosSII" Text="Si" />
                            <asp:ListItem id="bec_SuspenciosEstudiosNOO" Text="No" />
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="bec_SuspenciosEstudios"
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
                        <label><font size="1">¿Has estado becado anteriormente en primaria, secundaria, preparatoria o bachillerato?</font></label>
                    </div>
                    <div class="col-md-2" align="left">
                        <asp:RadioButtonList ID="bec_BecadoAntes" runat="server" RepeatDirection="Horizontal" Height="20px" Width="103px">
                            <asp:ListItem id="bec_BecadoAntesSII" Text="Si" />
                            <asp:ListItem id="bec_BecadoAntesNOO" Text="No" />
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="bec_BecadoAntes"
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
                        <label><font size="1">¿Tu familia es beneficiaria del programa PROSPERA u OPORTUNIDADES?</font></label>
                    </div>
                    <div class="col-md-2" align="left">
                        <asp:RadioButtonList ID="bec_EstatusOportunidades" runat="server" RepeatDirection="Horizontal" Height="20px" Width="103px">
                            <asp:ListItem id="bec_EstatusOportunidadesSII" Text="Si" />
                            <asp:ListItem id="bec_EstatusOportunidadesNOO" Text="No" />
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="bec_EstatusOportunidades"
                            ErrorMessage="<p>Selecciona una opción!</p>"
                            SetFocusOnError="true"
                            Display="Dynamic"
                            ForeColor="#B50128"
                            Font-Size="8"
                            Font-Bold="true">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4" align="right">
                        <asp:Button runat="server" ID="btnSiguiente2" Text="GUARDAR" CssClass="btn btn-success" OnClick="btnSiguiente2_Click" />
                    </div>
                </div>
            </div>
        </div>

    </asp:Panel>
</asp:Content>
