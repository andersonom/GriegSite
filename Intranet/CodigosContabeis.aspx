<%@ Page Title="" Language="C#" MasterPageFile="~/Intranet/MasterPageIntranet.master" AutoEventWireup="true" CodeFile="CodigosContabeis.aspx.cs" Inherits="Intranet_CodigosContabeis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrapper">
        <div class="editor">
            <h3 class="title">Lista de códigos contabeis</h3>
            <div style="float: left; width: 50%;">
                <h4 class="title">Telefones</h4>
                <table border="0" cellpadding="0" cellspacing="3">
                    <thead>
                        <tr>
                            <th style="width: 60px; text-align: left">CÓDIGO</th>
                            <th style="width: 270px; text-align: left">DÉBITO</th>
                        </tr>
                    </thead>
                    <tr>
                        <td>001</td>
                        <td>ARMADORES - DIVERSOS				</td>
                    </tr>
                    <tr>
                        <td>004</td>
                        <td>CONSULADO REAL DA NORUEGA           </td>
                    </tr>
                    <tr>
                        <td>005</td>
                        <td>DESPESAS GRIEG                      </td>
                    </tr>
                    <tr>
                        <td>006</td>
                        <td>EMC - INTERNACIONAL                 </td>
                    </tr>
                    <tr>
                        <td>007</td>
                        <td>EMC - NACIONAL                      </td>
                    </tr>
                    <tr>
                        <td>013</td>
                        <td>GRIEG RETROPORTO LTDA               </td>
                    </tr>
                    <tr>
                        <td>015</td>
                        <td>ITALIA MARITTIMA - INTERNACIONAL    </td>
                    </tr>
                    <tr>
                        <td>016</td>
                        <td>ITALIA MARITTIMA - NACIONAL         </td>
                    </tr>
                    <tr>
                        <td>048</td>
                        <td>LION LOGISTICS                      </td>
                    </tr>
                    <tr>
                        <td>017</td>
                        <td>MERIDIONAL MARÍTIMA LTDA            </td>
                    </tr>
                    <tr>
                        <td>018</td>
                        <td>NAVIOS AVULSOS                      </td>
                    </tr>
                    <tr>
                        <td>019</td>
                        <td>PARTICULAR                          </td>
                    </tr>
                </table>
                <br />
            </div>
            <div style="float: left; width: 50%;">
                <h4 class="title">FAX</h4>
                <table border="0">
                    <thead>
                        <tr>
                            <th style="width: 60px; text-align: left">CÓDIGO</th>
                            <th style="width: 270px; text-align: left">DÉBITO</th>
                        </tr>
                    </thead>
                    <tr>
                        <td>024</td>
                        <td>FAX - ARMADORES DIVERSOS				</td>
                    </tr>
                    <tr>
                        <td>027</td>
                        <td>FAX - CONSULADO REAL DA NORUEGA         </td>
                    </tr>
                    <tr>
                        <td>028</td>
                        <td>FAX - DESPESAS GRIEG                    </td>
                    </tr>
                    <tr>
                        <td>029</td>
                        <td>FAX - EMC INTERNACIONAL                 </td>
                    </tr>
                    <tr>
                        <td>030</td>
                        <td>FAX - EMC NACIONAL                      </td>
                    </tr>
                    <tr>
                        <td>036</td>
                        <td>FAX - GRIEG RETROPORTO                  </td>
                    </tr>
                    <tr>
                        <td>038</td>
                        <td>FAX - ITALIA MARITTIMA INTERNACIONAL    </td>
                    </tr>
                    <tr>
                        <td>039</td>
                        <td>FAX - ITALIA MARITTIMA NACIONAL         </td>
                    </tr>
                    <tr>
                        <td>049</td>
                        <td>FAX - LION LOGISTICS                    </td>
                    </tr>
                    <tr>
                        <td>040</td>
                        <td>FAX - MERIDIONAL MARÍTIMA               </td>
                    </tr>
                    <tr>
                        <td>041</td>
                        <td>FAX - NAVIOS AVULSOS                    </td>
                    </tr>
                    <tr>
                        <td>042</td>
                        <td>FAX - PARTICULAR                        </td>
                    </tr>

                </table>
            </div>

            <div style="float: left">
                <h4 class="title">Realização de chamada telefônica</h4>
                <table border="0">
                    <tr>
                        <td>6#</td>
                        <td>Habilita o código contábil</td>
                    </tr>
                    <tr>
                        <td>005</td>
                        <td>Código contábil para despesas Grieg</td>
                    </tr>
                    <tr>
                        <td>111</td>
                        <td>Senha padrão dos ramais</td>
                    </tr>
                    <tr>
                        <td>nº do telefone&nbsp&nbsp</td>
                        <td>Caso seja interurbano, adicionar 0 + código da cidade</td>
                    </tr>
                </table>
                <br />

                <h4 class="title">Procedimentos mais utilizados</h4>
                <table border="0">
                    <tr>
                        <td>Rechamada Interna</td>
                        <td>Após o sinal de ocupado, tecle &quot;3&quot; e recoloque no gancho</td>
                    </tr>
                    <tr>
                        <td>Rechamada Externa</td>
                        <td>Desligue a chamada ocupada, tecle &quot;60&quot; e recoloque no gancho</td>
                    </tr>
                    <tr>
                        <td>Consulta Externa</td>
                        <td>Durante a conversação, tecle &quot;FLASH&quot; (+) &quot;0&quot; (+) &quot;nº externo&quot;</td>
                    </tr>
                    <tr>
                        <td>Transferência Externa</td>
                        <td>Faça a consulta externa e ao atender tecle &quot;FLASH&quot; (+) &quot;1&quot; (+) &quot;*&quot;</td>
                    </tr>
                    <tr>
                        <td>Recuperação de Ligação&nbsp&nbsp</td>
                        <td>Quando ouvir sinal de ocupado ou não for atendido, tecle &quot;0&quot;</td>
                    </tr>
                    <tr>
                        <td>Captura de Ligações</td>
                        <td>Para capturar ligações de outro ramal, tecle o nº do ramal (+) &quot;5&quot;</td>
                    </tr>
                    <tr>
                        <td>Siga-me Interno</td>
                        <td>Retire o fone do gancho, tecle &quot;61&quot; (+) &quot;nº do ramal desejado&quot;</td>
                    </tr>
                </table>
                <br />
            </div>
        </div>
    </div>
</asp:Content>

