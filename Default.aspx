<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            background: url(../images/bg-body-home.jpg) center 100px no-repeat;
        }
    </style>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitle" runat="Server">
    <div class="wrapper" style="overflow: visible;">
        <ul id="rotator" class="no-bullet rotator">
            <li class="rotator-item">
                <a href="QuemSomos.aspx" class="rotator-link">
                    <div class="grid grid-10">
                        <h2 class="rotator-title">Agência de Vapores Grieg</h2>
                        <p class="rotator-label">
                            <asp:Literal runat="server" Text="  <%$ Resources: Texto1%>" />
                        </p>
                        <span class="rotator-button">
                            <asp:Literal runat="server" Text="  <%$ Resources: conhecaEmpresa%>" /></span>
                    </div>

                    <div class="grid grid-14">
                        <img src="images/rotator-1.png" alt="">
                    </div>
                </a>
            </li>
            <li class="rotator-item">
                <a href="QuemSomos.aspx" class="rotator-link">
                    <div class="grid grid-10">
                        <h2 class="rotator-title">
                            <asp:Literal runat="server" Text="  <%$ Resources: cobESA%>" /></h2>
                        <p class="rotator-label">Routing: SHANGHAI – NINGBO - YANTIAN - HONG KONG – SINGAPORE - SANTOS - PARANAGUA - MONTEVIDEO - BUENOS AIRES – MONTEVIDEO RIO GRANDE – SANTOS - SINGAPORE - HONG KONG - SHANGHAI</p>
                        <span class="rotator-button">
                            <asp:Literal runat="server" Text="  <%$ Resources: conhecaEmpresa%>" /></span>
                    </div>

                    <div class="grid grid-14">
                        <img src="images/rotator-2.png" alt="">
                    </div>
                </a>
            </li>
        </ul>

        <div id="rotator-nav">
        </div>
        <div class="years">

            <p class="years1">
                <asp:Literal runat="server" Text=" <%$ Resources: years1%>" />
            </p>

            <p id="pYear" class="years2">
                <asp:Literal runat="server" Text=" <%$ Resources: years2%>" />
            </p>

            <p class="years3">
                <asp:Literal runat="server" Text="<%$ Resources: years3%>" />
            </p>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="wrapper">

        <!-- <a href="" class="servicos-box servicos-navios">Detalhes de Navios</a> -->
        <!-- <a href="" class="servicos-box servicos-programacao">Programação Evergreen</a> -->
        <!-- <a href="" class="servicos-box servicos-rotas">Rotas Evergreen</a> -->
        <div class="flexbox">

            <div>
                <a href="http://blonline.grieg.com.br/index.php" class="servicos-box2 servicos-rotas">
                    <asp:Literal runat="server" Text="  <%$ Resources: blViaWeb%>" /></a>
            </div>
            <div>
                <a href="http://www.grieg.com.br/blweb" class="servicos-box2 servicos-programacao">
                    <asp:Literal runat="server" Text="  <%$ Resources: boletoWeb%>" /></a>
            </div>
            <div>
                <a href="http://www.grieg.com.br/schedule/" class="servicos-box2 servicos-posicao">
                    <asp:Literal runat="server" Text="  <%$ Resources: posNavios%>" /></a>
            </div>
            <div>
                <a href="DetalheNavios.aspx" class="servicos-box2 servicos-navios">
                    <asp:Literal runat="server" Text="  <%$ Resources: detNavios%>" /></a>
            </div>
        </div>

        <div class="space-40"></div>

        <div class="flexbox">
            <div>
                <a href="http://www.shipmentlink.com/tvs2/jsp/TVS2_InteractiveSchedule.jsp" class="servicos-box2 servicos-porto">
                    <asp:Literal runat="server" Text="  <%$ Resources: pesPorto%>" /></a>
            </div>
            <div>
                <a href="http://www.shipmentlink.com/tvs2/jsp/TVS2_VesselSchedule.jsp" class="servicos-box2 servicos-viagem">
                    <asp:Literal runat="server" Text="  <%$ Resources: pesViagem%>" /></a>
            </div>
            <div>
                <a href="http://www.shipmentlink.com/tvs2/jsp/TVS2_LongTermMenu.jsp?type=L" class="servicos-box2 servicos-area">
                    <asp:Literal runat="server" Text="  <%$ Resources: pesArea%>" /></a>
            </div>
            <div>
                <a href="http://www.shipmentlink.com/servlet/TDB1_CargoTracking.do" class="servicos-box2 servicos-carga">
                    <asp:Literal runat="server" Text="  <%$ Resources: rastCarga%>" /></a>
            </div>
        </div>
    </div>
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScriptsEnding" runat="Server">   
    <script>
        $('#rotator').cycle({ fx: 'fade', timeout: 2000 });            //pager: '#rotator-nav'
    </script>

    <script>
        $(document).ready(function () { $("#pYear").prepend(new Date().getFullYear() - 1930); });
    </script>
</asp:Content>

