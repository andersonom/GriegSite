<%@ Page Title="" Language="C#" MasterPageFile="~/Intranet/MasterPageIntranet.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Intranet_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section>
        <div class="wrapper">
            <div class="editor">
                <p id="Texto1"><asp:Literal runat="server" Text="<%$ Resources:texto1 %>" /></p>

                <br />

                <p id="Texto2"><asp:Literal runat="server" Text="<%$ Resources:texto2 %>" /></p>
            </div>

            <div class="space-60"></div>
            <div class="space-40"></div>
        </div>

    </section>
</asp:Content>

