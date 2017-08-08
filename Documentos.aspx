<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Documentos.aspx.cs" Inherits="Documentos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitle" runat="Server">
    <div class="wrapper headpage">
        <h2 class="headpage-title">

            <asp:Literal runat="server" Text="  <%$ Resources: documentos%>" />

        </h2>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrapper">
        <div class="editor">

            <h3 class="title">Downloads</h3>
            <h6>
                <asp:Literal runat="server" Text="  <%$ Resources: avisoAlteracao%>" /></h6>
            <div class="space-40"></div>
            <h4 class="title">Importação</h4>
            <a href="Documentos/TERMO DE RESPONSABILIDADE - EVERGREEN.docx">- Termos de Responsabilidade - EVERGREEN </a>&nbsp<span style="color: blue; font-size: smaller">(Atualizado em 19/04/2016)</span>
            <br />
            <a href="Documentos/TERMO DE RESPONSABILIDADE - VESSEL S.A.docx">- Termos de Responsabilidade - VESSEL S.A. </a>&nbsp<span style="color: blue; font-size: smaller">(Atualizado em 19/04/2016)</span>
            <br />
            <a href="Documentos/TERMO DE RESPONSABILIDADE - SISCOMEX CARGA.docx">- Termos de Responsabilidade - SISCOMEX CARGA </a>
            <br />
            <a href="Documentos/Grieg-BoletoViaWeb.pdf" target="_blank" >- Manual - Boleto Via Web </a>
            <div class="space-60"></div>


            <h4 class="title">Exportação</h4>
            <a href="Documentos/Manual BL Web (EXPORTAÇÃO).pdf" target="_blank" >- Manual BL Web</a>
            <br />
            <a href="Documentos/Termo Express Release (EXPORTAÇÃO).docx">- Termo Express Release</a>
            <br />
            <a href="Documentos/Memorando Retirada de BL Original (EXPORTAÇÃO).doc">- Memorando Retirada de BL Original</a>&nbsp<span style="color: blue; font-size: smaller">(Atualizado em 05/10/2016)</span>
            <br />
			<a href="Documentos/Grieg-BoletoViaWeb-Exp.pdf" target="_blank" >- Manual - Boleto Via Web </a>
			<br />
			<a href="Documentos/VGM ADVISORY 3 (final).pdf" target="_blank" >- Consultivo VGM</a>			
			<br />
			<a href="Documentos/EGL - MANUAL (Portuguese).pdf" target="_blank" >- Manual VGM </a>		   
            <div class="space-40"></div>
            <h4 class="title">Container</h4>
            <a href="Documentos/TERMO DE REUTILIZACAO CONTAINERS.doc">- Termo de Reutilização Containers</a>
          
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScriptsEnding" runat="Server">
</asp:Content>
