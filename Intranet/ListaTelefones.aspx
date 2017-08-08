<%@ Page Title="" Language="C#" MasterPageFile="~/Intranet/MasterPageIntranet.master" AutoEventWireup="true" CodeFile="ListaTelefones.aspx.cs" Inherits="Intranet_ListaTelefones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        jQuery.browser = {};
        (function () {
            jQuery.browser.msie = false;
            jQuery.browser.version = 0;
            if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
                jQuery.browser.msie = true;
                jQuery.browser.version = RegExp.$1;
            }
        })();
    </script>
    <script src="../js/plugins/jquery.mask/jquery.mask-1.3.min.js"></script>
    <script>
        $(document).ready(function () {
            $("input[type=submit][id*=ButtonSend]").click(function () {
                if (validateFields()) { hidePanel(); return true; } else { return false; }                
            });          
        });

        function validateFields() {
            return $("[id*=TextBoxName]").val() != "" && ($("[id*=TextBoxMobile]").val() != "" || $("[id*=TextBoxTelephone]").val() != "");
        }

        function hidePanel() {
            $("[id*=PanelAdd]").css("display", "none");
            $("[id*=ButtonAdd]").css("display", "block");
        }
        function showPanel() {           
            var ddl = $("[id*=DropDownListCompany]").get();
            if (ddl[0].value != "") {
                $("[id*=PanelAdd]").css("display", "block");
                $("[id*=ButtonAdd]").css("display", "none");
                $("[id*=TextBoxName]").val("");
                $("[id*=TextBoxMobile]").mask("99-9999?9-9999").val("");
                $("[id*=TextBoxTelephone]").mask("99-9999-9999").val("");
            }
            else {
                $("[id*=ButtonAdd]").css("display", "block");
            }
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <section>
        <div class="wrapper">
            <div class="editor" runat="server" id="divEditor">
                <h3 class="title">Lista de Telefones</h3>
                <a href="ListaTelefones.xml" class="btn btn-options" style="color: #FFFFFF" target="_blank">Todos os Telefones</a>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <br />
                        <br />
                        <h5>Filtrar</h5>
                        <asp:DropDownList ID="DropDownListCompany" AutoPostBack="true" DataTextField="Name" runat="server" OnSelectedIndexChanged="DropDownListCompany_SelectedIndexChanged"></asp:DropDownList>
                        <asp:GridView ID="GridViewEmployees" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridViewEmployees_RowCancelingEdit" OnRowDeleting="GridViewEmployees_RowDeleting" OnRowEditing="GridViewEmployees_RowEditing" OnRowUpdating="GridViewEmployees_RowUpdating">

                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Nome" HeaderStyle-Width="150px">
                                    <HeaderStyle Width="150px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MobilePhone" HeaderText="Celular" HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
                                    <HeaderStyle Width="150px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TelePhone" HeaderText="Telefone Residencial" HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
                                    <HeaderStyle Width="150px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:CommandField AccessibleHeaderText="Editar" CancelText="Cancelar" DeleteText="Apagar" EditText="Editar" InsertText="Inserir" NewText="Novo" SelectText="Selecionar" ShowEditButton="True" UpdateText="Atualizar" HeaderText="Editar" HeaderStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                                    <HeaderStyle Width="60px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                                <asp:TemplateField AccessibleHeaderText="Apagar" HeaderText="Apagar" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Apagar" OnClientClick="return confirm('Tem certeza que deseja apagar este ramal?');"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="60px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <br />
                        <input type="button" id="ButtonAdd" value="Adicionar" class="btn btn-options" onclick="showPanel()" />
                        <div id="PanelAdd" style="display: none; width: 280px">
                            <h5>Novo Telefone</h5>
                            <br />
                            <asp:Label ID="Label1" runat="server" Text="Nome:"></asp:Label>
                            <asp:TextBox ID="TextBoxName" runat="server" class="right" BackColor="#E1F5FF" required="required"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="Celular:"></asp:Label>
                            <asp:TextBox ID="TextBoxMobile" runat="server" class="right" BackColor="#E1F5FF" required="required"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label4" runat="server" Text="Residencial:"></asp:Label>
                            <asp:TextBox ID="TextBoxTelephone" type="phone" runat="server" class="right" BackColor="#E1F5FF"></asp:TextBox>
                            <br />
                            <div class="wd-5 right">
                                <input type="button" id="ButtonCancel" value="Cancelar" class="btn btn-cancel" onclick="hidePanel()" />
                                <asp:Button ID="ButtonSend" runat="server" Text="Enviar" CssClass="btn btn-confirm right" OnClick="ButtonSend_Click" />
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
