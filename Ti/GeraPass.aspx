<%@ Page Title="" Language="C#" MasterPageFile="~/Ti/MasterPageTI.master" AutoEventWireup="true" CodeFile="GeraPass.aspx.cs" Inherits="Ti_GeraPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <section>
        <div class="wrapper">
            <div class="editor">
                   <h3 class="title">Gerador de senhas</h3>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                          <div class="box wd-16"><div class="line">
                        <asp:TextBox ID="txtQut" runat="server" Height="16px" MaxLength="3" TextMode="Number" Width="51px" BackColor="#999999" ForeColor="White"></asp:TextBox>
                        <asp:Button ID="btnGerar" runat="server" OnClick="btnGerar_Click" Text="Gerar" />
                              </div></div>
                        <br />
                        <asp:Literal ID="literalPass" runat="server"></asp:Literal>
                        <br />
                        
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                    <ProgressTemplate>
                                <img src="../images/loading.gif" width="100px" height="100px"/>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </div>
    </section>
</asp:Content>

