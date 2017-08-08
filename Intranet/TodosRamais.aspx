<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TodosRamais.aspx.cs" Inherits="Intranet_TodosRamais" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/TodosRamais.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="cabecalho">Ramais</h1>
            <asp:Repeater runat="server" ID="RepeaterSantos">
                <ItemTemplate>
                    <div class="empresaSantos">
                        <h3 class="titulo-fixed-width"><%# Eval("Name") %></h3>
                        <asp:Repeater runat="server" DataSource='<%# Eval("Departments") %>'>
                            <ItemTemplate>

                                <div class="departamento">
                                    <table border="0">
                                        <tr>
                                            <th colspan="4">
                                                <div class="titulo">
                                                    <%# Eval("Name") %>
                                                    <br />
                                                </div>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th class="tituloCol">Nome</th>
                                            <th class="tituloCol">Ramal</th>
                                            <th class="tituloCol">Sigla</th>
                                            <th class="tituloCol">Local</th>
                                        </tr>
                                        <asp:Repeater runat="server" DataSource='<%# Eval("Employees") %>'>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("Name") %>
                                                    </td>
                                                    <td class="centralizaTexto"><%# Eval("ExtentionLine") %>
                                                    </td>
                                                    <td><%# Eval("Initials") %>
                                                    </td>
                                                    <td class="centralizaTexto"><%# Eval("Local") %>
                                                    </td>
                                                </tr>

                                            </ItemTemplate>

                                        </asp:Repeater>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </ItemTemplate>
            </asp:Repeater>          

            <asp:Repeater runat="server" ID="RepeaterRamais">
                <ItemTemplate>
                    <div class="empresa">
                        <h3 class="titulo-fixed-width"><%# Eval("Name") %></h3>
                        <asp:Repeater runat="server" DataSource='<%# Eval("Departments") %>'>
                            <ItemTemplate>

                                <div class="departamento">
                                    <table border="0">
                                        <tr>
                                            <th colspan="4">
                                                <div class="titulo">
                                                    <%# Eval("Name") %>
                                                    <br />
                                                </div>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th class="tituloCol">Nome</th>
                                            <th class="tituloCol">Ramal</th>
                                            <th class="tituloCol">Sigla</th>
                                            <th class="tituloCol">Local</th>
                                        </tr>
                                        <asp:Repeater runat="server" DataSource='<%# Eval("Employees") %>'>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("Name") %>
                                                    </td>
                                                    <td class="centralizaTexto"><%# Eval("ExtentionLine") %>
                                                    </td>
                                                    <td><%# Eval("Initials") %>
                                                    </td>
                                                    <td class="centralizaTexto"><%# Eval("Local") %>
                                                    </td>
                                                </tr>

                                            </ItemTemplate>

                                        </asp:Repeater>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
