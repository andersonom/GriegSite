<%@ Page Title="" Language="C#" MasterPageFile="~/Intranet/MasterPageIntranet.master" AutoEventWireup="true" CodeFile="ListaRamais.aspx.cs" Inherits="Intranet_ListaRamais" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $("input[type=submit][id*=ButtonSend]").click(function () {
                if (validateFields()) { hidePanel(); return true; } else { return false; }
            });
            $("select[id*=DropDownListDepartment]").css("display", "none");
        });

        function validateFields() {
            return ($("[id*=TextBoxName]").val() != "" && $("[id*=TextBoxExtentionLine]").val() != "");
        }

        function cleanFields() {
            $("[id*=TextBoxName]").val("");
            $("[id*=TextBoxInitials]").val("");
            $("[id*=TextBoxLocal]").val("");
            $("[id*=TextBoxExtentionLine]").val("");
        };

        function showPanel() {
            var ddl = $("[id*=DropDownListCompany]").get();
            var ddl2 = $("[id*=DropDownListDepartment]").get();
            if (ddl[0].value != "" && ddl2[0] != undefined && ddl2[0].value != "") {
                $("[id*=PanelAdd]").css("display", "block");
                $("[id*=ButtonAdd]").css("display", "none");
                $("[id*=TextBoxName]").val("");
                $("[id*=TextBoxInitials]").val("");
                $("[id*=TextBoxLocal]").val("");
                $("[id*=TextBoxExtentionLine]").val("");
            }
        };

        function hidePanel() {
            $("[id*=PanelAdd]").css("display", "none");
            $("[id*=ButtonAdd]").css("display", "block");
        };

    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <section>
        <div class="wrapper">

            <div class="editor" runat="server" id="divEditor">
                <h3 class="title">Lista de Ramais</h3>
                <a href="TodosRamais.aspx" class="btn btn-options" style="color: #FFFFFF" target="_blank">Todos os Ramais</a>               
            </div>


            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <br />
                    <br />
                    <h5>Filtrar</h5>
                    <asp:DropDownList ID="DropDownListCompany" DataTextField="Name" runat="server" OnSelectedIndexChanged="DropDownListCompany_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
                    <asp:DropDownList ID="DropDownListDepartment" DataTextField="Name" runat="server" OnSelectedIndexChanged="DropDownListDepartment_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
                    <asp:GridView ID="GridViewExtentionLines" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridViewExtentionLines_RowCancelingEdit" OnRowEditing="GridViewExtentionLines_RowEditing" OnRowDeleting="GridViewExtentionLines_RowDeleting" OnRowUpdating="GridViewExtentionLines_RowUpdating">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Nome" HeaderStyle-Width="150px">
                                <HeaderStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Local" HeaderText="Local" HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
                                <HeaderStyle Width="150px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Initials" HeaderText="Sigla" HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
                                <HeaderStyle Width="150px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ExtentionLine" HeaderText="Ramal" HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
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
                    <input type="button" id="ButtonAdd" value="Adicionar" class="btn btn-options" onclick="showPanel()" /><!--visible-->
                    <div id="PanelAdd" style="display: none; width: 280px">
                        <h5>Novo Ramal</h5>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Nome:"></asp:Label>
                        <asp:TextBox ID="TextBoxName" runat="server" class="right" BackColor="#E1F5FF"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Incial:"></asp:Label>
                        <asp:TextBox ID="TextBoxInitials" runat="server" class="right" BackColor="#E1F5FF"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Local:"></asp:Label>
                        <asp:TextBox ID="TextBoxLocal" runat="server" class="right" BackColor="#E1F5FF"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="Ramal:"></asp:Label>
                        <asp:TextBox ID="TextBoxExtentionLine" runat="server" class="right" BackColor="#E1F5FF"></asp:TextBox>
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

