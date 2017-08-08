<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QuemSomos.aspx.cs" Inherits="QuemSomos" %>   

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitle" Runat="Server">
        <div class="wrapper headpage">
            <h2 class="headpage-title">
                <asp:Literal runat="server" Text="  <%$ Resources: quemSomos%>" /></h2>
        </div>
 
</asp:Content>
  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
     <div class="wrapper">
            <h3 class="title">
                <asp:Literal runat="server" Text="  <%$ Resources: sobreOGrupoGrieg%>" /></h3>
            <div class="editor">
                <p id="Texto1">
                    <asp:Literal runat="server" Text="  <%$ Resources: texto1%>" />
                </p>
                <br />
                <p id="Texto2">
                    <asp:Literal runat="server" Text="  <%$ Resources: texto2%>" />
                </p>
            </div>

            <div class="space-60"></div>

            <h3 class="title">
                <asp:Literal runat="server" Text="  <%$ Resources: empresasDoGrupo%>" /></h3>
            <img src="images/grupo.jpg" alt="" usemap="#companiesGroupMap">
            <map name="companiesGroupMap">
                <area shape="rect" coords="54,64,220,130" alt="Grieg" href="http://www.grieg.com.br"/ />
                <area shape="rect" coords="292,64,452,130" alt="Grieg Retroporto" href="http://www.griegretroporto.com.br" target="_blank" />
                <area shape="rect" coords="544,32,678,134" alt="Lion Logistics" href="http://www.lionlogistics.com.br" target="_blank" />
            </map>

            <div class="space-60"></div>
        </div>  
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScriptsEnding" runat="Server">
</asp:Content>