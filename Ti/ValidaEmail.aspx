<%@ Page Title="" Language="C#" MasterPageFile="~/Ti/MasterPageTI.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ValidaEmail.aspx.cs" Inherits="Ti_ValidaEmail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <section>
        <div class="wrapper">
            <div class="editor">
                <h3 class="title">Validador de e-mails</h3>
                <h6 class="title">Insira e-mails separados por ponto e vírgula</h6>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="box wd-16">
                            <div class="line">
                                <asp:TextBox ID="TextBoxEmails" runat="server" TextMode="MultiLine" Height="80px" Width="635px" BackColor="#999999" ForeColor="White" />
                            </div>
                        </div>
                        <div class="line">
                            <div class="box wd-16">
                                <asp:Button ID="ButtonValidarEmails" runat="server" Text="Validar E-mails" OnClick="ButtonValidarEmails_Click" class="right" />
                            </div>
                        </div>
                        <div class="line">
                            <div class="box wd-16">
                                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                            </div>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                    <ProgressTemplate>
                        <img src="../images/loading.gif" width="100px" height="100px" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </div>
    </section>

</asp:Content>

