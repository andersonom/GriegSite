<%@ Page Title="" Language="C#" MasterPageFile="~/Intranet/MasterPageIntranet.master" AutoEventWireup="true" CodeFile="ManualOper.aspx.cs" Inherits="Intranet_ManualOper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrapper">
        <div class="editor">
            <h3 class="title">Manual de operações</h3>
            <div>
                <p>
                    Para executar ligações para telefones móveis (celulares) não se faz necessário definir rota através do antigo código (26).<br />
                    Basta digitar 0 (zero) para obter linha + o número desejado.
            <br />
                    Note exemplo para de ligação para telefones móveis:<br />
                    <strong>Exemplo</strong> 0 97168454
                </p>
                <p>
                    Para execução de DDD ou DDI não se faz necessária a inclusão do código da operadora.<br />
                    Basta digitar 0 (zero) para obter linha + o código de área + número desejado.
            <br />
                    Note exemplo para de ligações DDD:<br />
                    <strong>Exemplo</strong> 0 011 32574300
                </p>
                <p>
                    <strong>3 - Rechamada Interna: </strong>(ramal ocupado)
            <br />
                    Após ter recebido tom de ocupado, tecle “<strong>3</strong>” e reponha o fone no gancho. Quando o ramal desocupar, seu ramal irá tocar, retire o fone do gancho e aguarde atendimento.<br />
                    Para cancelar rechamada, retire o fone do gancho e coloque no gancho novamente.
                </p>
                <p>
                    <strong>4 - Rechamada Externa: </strong>(número ocupado)<br />
                    Você utiliza a rechamada externa quando o número desejado externo está ocupado.<br />
                    Desligue a chamada que está ocupada tecle <strong>30</strong>, reponha o fone no gancho e aguarde, quando o número desocupar seu ramal irá tocar
                </p>
                <p>
                    <strong>5 - Último número digitado:</strong><br />
                    A central memoriza automaticamente o último número de chamada externa realizada, permitindo que você refaça a chamada sem necessidade de teclar novamente o número.
            <br />
                    Tecle <strong>70</strong>, para refazer a última chamada.
                </p>
                <p>
                    <strong>6 - Consulta:</strong>
                    <br />
                    Durante o atendimento de uma chamada, você pode consultar qualquer ramal ou número externo.<br />
                    Durante a conversação, tecle FLASH + o nº. do ramal desejado, para consulta interna ou FLASH + 0 + número externo, para consulta externa.
                </p>
                <p>
                    <strong>7 - Transferência Interna:</strong>
                    <br />
                    Utilizada para transferência de ligações de um ramal para outro.
            <br />
                    Estando em conversação, ligação entrante ou de saída, tecle FLASH + o nº. do ramal desejado, aguarde o atendimento do ramal e coloque o fone no gancho.
                </p>
                <p>
                    <strong>8 - Transferência Externa: </strong>(Tronco a Tronco).
            <br />
                    Permite transferir chamadas externas para qualquer outro número externo. Durante a conversação, faça uma consulta externa. Ao atender digite FLASH +<strong> </strong>1 + *<strong> </strong>(asterisco)
                </p>
                <p>
                    <strong>9 - Recuperação de ligação, caso o ramal esteja ocupado:</strong>
                    <br />
                    Quando ouvir o sinal de ocupado ou não estiver sendo atendido, tecle “<strong>0</strong>” (zero).
                </p>
                <p>
                    <strong>10 -</strong> <strong>Recuperação de ligação, caso tenha transferido a mesma para um ramal errado:</strong>
                    <br />
                    Retire o fone do gancho, tecle o nº. do ramal para onde foi transferida a ligação + “<strong>5</strong>” (cinco).
                </p>
                <p>
                    <strong>11 - Captura de Ligações:</strong>
                    <br />
                    Utilizada para buscar ligações que estão tocando em outro ramal sem saber qual é.<br />
                    Retire o fone do gancho, tecle “<strong>5</strong>” (cinco). (Esta função somente funcionará dentro do próprio setor).
                </p>
                <p>
                    <strong>12 - Pêndulo: </strong>Utilizado para atender várias ligações ao mesmo tempo.
            <br />
                    Estando com uma ligação, ao ouvir BIP, tecle FLASH <strong>5</strong>, a ligação que você está atendendo entra em espera e você atende a 2ª ligação.<br />
                    Para alternar entre duas ligações (escolher com a qual você quer falar) tecle FLASH <strong>5</strong>.
                </p>
                <p>
                    Ao desligar ou transferir qualquer uma das ligações, coloque o fone no gancho, retire para atender a que ficou na espera.
                </p>
                <p>
                    <strong>13 - Estacionamento:</strong> Permite a retenção de chamada<br />
                    Para reter (estando em conversação) tecle FLASH <strong>67</strong> e reponha o fone no gancho. Para retornar a retenção retire o fone do gancho e tecle <strong>67</strong>.
                </p>
                <p>
                    Caso queira recuperar esta ligação de outro ramal, retire o fone do gancho, tecle <strong>68</strong> + o nº. do ramal que a ligação foi retida.
                </p>
                <p>
                    <strong>14 - Cadeado eletrônico:</strong>
                    <br />
                    Bloqueia o ramal para não efetuar ligações externas.
                </p>
                <p>
                    <strong>1º passo:</strong> cadastrar sua senha pessoal.<br />
                    Retirar o fone do gancho, teclar <strong>63</strong>+<strong>NNN</strong> (onde NNN é sua senha pessoal de 3 dígitos).<br />
                    <strong>2º passo: </strong>Para desativar o cadeado eletrônico. Retire o fone do gancho e tecle <strong>64</strong> + <strong>NNN</strong> (sua senha).
                </p>
                <p>
                    <strong>15 - Siga-me interno:</strong>
                    <br />
                    Utilizado para encaminhar suas ligações para outro ramal<br />
                    Retire o fone do gancho, tecle <strong>61</strong> + o nº. do ramal onde você deseja que fiquem tocando as suas ligações.
                </p>
                <p>
                    <strong>Para cancelar:</strong> retire o fone do seu ramal do gancho, tecle <strong>61</strong> + nº. do seu ramal.
                </p>
                <p>
                    <strong>16 - Siga-me externo:</strong><br />
                    As ligações que forem transferidas para o ramal vão tocar em um nº. externo: celular, residência, etc., previamente programado.
                </p>
                <p>
                    Retire o fone do gancho, tecle <strong>310</strong> + senha cadeado eletrônico + Nº. externo onde irão tocar ligações.
                </p>
                <p>
                    <strong>Para cancelar </strong>o siga-me interno ou externo:
            <br />
                    Retire o fone do gancho, tecle no seu ramal <strong>31</strong> + o nº. do seu ramal.
                </p>
                <p>
                    <strong>17 - Desvio de ramal</strong>:
            <br />
                    As chamadas são desviadas para outro ramal, quando o seu ramal estiver ocupado ou não for atendido dentro do número de toques para o transbordo.<br />
                    Tecle <strong>620</strong> + o nº. do ramal para ativar.
                </p>
                <p>
                    <strong>Para cancelar,</strong> tecle <strong>620</strong> + nº. do próprio ramal.
                </p>
                <p>
                    <strong>18 - Conferência:</strong> (conversação com até 6 usuários).<br />
                    <strong>Exemplo 1</strong>: Estando em conversação com ligação entrante ou de saída, teclar FLASH + nº. do ramal desejado.<br />
                    Para colocar em conferência, teclar FLASH + <strong>7</strong> (sete), estabelecendo a conferência entre os ramais e a ligação entrante ou de saída.<br />
                    <strong>Exemplo 2</strong>: Estando em conversação com um ramal, Teclar FLASH + <strong>7</strong>, estabelecendo a conferência, entre três ramais.
                </p>
                <p>
                    <strong>19 - Agenda: </strong>
                    <br />
                    Permite que você origine chamadas através de uma agenda previamente programada. Para acessar a agenda, tecle do seu ramal <strong>71</strong> + a posição na agenda de 0 a 9.
                </p>
                <p>
                    <strong>20 - Ramal móvel interno:</strong><br />
                    &nbsp;Permite que você execute funções em outros ramais que não sejam o seu.<br />
                    Tecle<strong> 36 + RRR</strong> + <strong>NNN</strong> + <strong>QF</strong>, onde:
                </p>
                <p>
                    RRR: é o nº. do seu ramal
            <br />
                    NNN: é a senha de cadeado eletrônico<br />
                    QF: é qualquer função do PABX<br />
                    A função pode ser qualquer operação que normalmente você faria em seu ramal.
                </p>
            </div>
        </div>
    </div>

</asp:Content>

