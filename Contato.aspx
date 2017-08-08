<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contato.aspx.cs" Inherits="Contato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .ListContato {
        }
    </style>

    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTitle" runat="Server">
    <div class="wrapper headpage">
        <h2 class="headpage-title">
            <asp:Literal runat="server" Text="  <%$ Resources: faleConosco%>" /></h2>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrapper">
        <h3 class="title">
            <asp:Literal runat="server" Text="<%$ Resources: entreEmContato%>" /></h3>

        <!-- Entre em contato conosco através do formulário abaixo ou em algumas de nossas filiais. -->
        <article class="grid grid-16">
            <form class="form" method="post" runat="server">

                <div id="divContatoPagina" runat="server">
                    <div class="line">
                        <div class="box wd-16">
                            <p>
                                <asp:Literal runat="server" Text="  <%$ Resources: Contato%>" />
                            </p>
                            <div class="styled-select">
                                <asp:DropDownList ID="DropDownListContato" DataTextField="key" DataValueField="value" runat="server" CssClass="ListContato"
                                    Style="background: transparent; padding: 1px; padding-left: 15px; font-size: 16px; line-height: 1; border: 0; border-radius: 0;">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="line">
                        <div class="box wd-16">
                            <p>
                                <asp:Literal runat="server" Text="  <%$ Resources: nome%>" />
                            </p>
                            <asp:TextBox ID="TextBoxNome" runat="server" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="line">
                        <div class="box wd-16">
                            <p>
                                <asp:Literal runat="server" Text="  <%$ Resources: email%>" />
                            </p>
                            <asp:TextBox ID="TextBoxEmail" runat="server" required Type="Email"></asp:TextBox>
                        </div>
                    </div>
                    <div class="line">
                        <div class="box wd-16">
                            <p>
                                <asp:Literal runat="server" Text="  <%$ Resources: empresa%>" />
                            </p>
                            <asp:TextBox ID="TextBoxEmpresa" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="line">
                        <div class="box wd-2">
                            <p>
                                <asp:Literal runat="server" Text="  <%$ Resources: ddd%>" />
                            </p>
                            <asp:TextBox ID="TextBoxDDD" runat="server" Width="50px" required></asp:TextBox>
                        </div>

                        <div class="box wd-13">
                            <p>
                                <asp:Literal runat="server" Text="  <%$ Resources: telefone%>" />
                            </p>
                            <asp:TextBox ID="TextBoxTelefone" runat="server" Width="140px" required></asp:TextBox>
                        </div>
                    </div>
                    <div class="line">
                        <div class="box wd-16">
                            <p>
                                <asp:Literal runat="server" Text="  <%$ Resources: mensagem%>" />
                            </p>
                            <textarea id="TextBoxMensagem" maxlength="5000" runat="server" required></textarea>
                        </div>

                    </div>
                    <div class="line right" style="width: 200px">
                        <asp:Button CssClass="btn btn-middle btn-options" ID="ButtonSend" runat="server" Text="<%$ Resources: enviar%>" OnClick="ButtonSend_Click" ForeColor="White" />
                    </div>
                    <div class="g-recaptcha" data-sitekey="6LdviiETAAAAADnmD7jhEWQ6_Bw2AjGuFgmdJ6UC"></div>
                    <div id="divReCaptchaErrorMsg" runat="server"></div>
                </div>

            </form>
        </article>

        <aside class="grid grid-7 right">

            <h3 class="title">
                <asp:Literal runat="server" Text="  <%$ Resources: nossosEnderecos%>" /></h3>

            <div class="address-select">
                <span class="address-select-label" id="address-select">
                    <asp:Literal runat="server" Text="  <%$ Resources: matrizSantos%>" /></span>

                <ul class="no-bullet address-select-nav" id="address-nav">
                    <li class="address-select-item">
                        <asp:Literal runat="server" Text="  <%$ Resources: matrizSantos%>" /></li>
                    <li class="address-select-item">São Paulo</li>
                    <li class="address-select-item">Curitiba</li>
                    <li class="address-select-item">Itajaí</li>
                    <li class="address-select-item">Paranaguá</li>
                    <li class="address-select-item">Porto Alegre</li>
                    <li class="address-select-item">Grieg Retroporto</li>
                </ul>
            </div>

            <ul class="no-bullet address-rotator" id="address-rotator">
                <li class="address-rotator-item">
                    <h4 class="address-rotator-title">
                        <asp:Literal runat="server" Text="  <%$ Resources: matrizSantos%>" /></h4>
                    <p class="address-rotator-label address-rotator-position">
                        <span>
                            <asp:Literal runat="server" Text="  <%$ Resources: rua%>" /></span>
                        <br />
                        <span>11010-919 - Santos - SP</span>
                    </p>
                    <p class="address-rotator-label address-rotator-tel">
                        <asp:Literal runat="server" Text="  <%$ Resources: tel%>" />:    55(13) 3219-7373
                            <br />
                        Fax:   55(13) 3219-7944
                    </p>
                    <a href="mailto:griegsts@grieg.com.br" class="address-rotator-label address-rotator-mail" style="display: block;">griegsts@grieg.com.br
                    </a>
                    <div class="both"></div>
                    <a href="mailto:sac@grieg.com.br" class="address-rotator-label address-rotator-mail" style="display: block;">SAC
                    </a>
                    <a href="mailto:dp@grieg.com.br" class="address-rotator-label address-rotator-mail" style="display: block;">
                        <asp:Literal runat="server" Text="  <%$ Resources: dp%>" />
                    </a>
                    <figure class="address-rotator-map">
                        <a href="https://goo.gl/maps/4LHDD" target="_blank">
                            <img src="images/map-Grieg-Santos.jpg" alt="" />
                            <figcaption>
                                <asp:Literal runat="server" Text="  <%$ Resources: verNoMapa%>" /></figcaption>
                        </a>
                    </figure>
                </li>

                <li class="address-rotator-item">
                    <h4 class="address-rotator-title">São Paulo</h4>
                    <p class="address-rotator-label address-rotator-position">
                        <span>
                            <asp:Literal runat="server" Text="  <%$ Resources: ruaSaoPaulo%>" /></span>
                        <br />
                        <span>01046-926 - São Paulo - SP</span>
                    </p>
                    <p class="address-rotator-label address-rotator-tel">
                        Tel:    55(11) 3638-9000
                            <br />
                        Fax:   55(11) 3638-9000
                    </p>
                    <a href="mailto:griegspo@grieg.com.br" class="address-rotator-label address-rotator-mail">griegspo@grieg.com.br
                    </a>

                    <figure class="address-rotator-map">
                        <a href="https://goo.gl/YWREex" target="_blank">
                            <img src="images/map-Grieg-SaoPaulo.jpg" alt="" />
                            <figcaption>
                                <asp:Literal runat="server" Text="  <%$ Resources: verNoMapa%>" /></figcaption>
                        </a>
                        &nbsp;
                    </figure>
                </li>
                <li class="address-rotator-item">
                    <h4 class="address-rotator-title">Curitiba</h4>
                    <p class="address-rotator-label address-rotator-position">
                        <span>Rua Emiliano Perneta, 297, 19° andar</span>
                        <br />
                        <span>80010-050 - Curitiba - PR</span>
                    </p>
                    <p class="address-rotator-label address-rotator-tel">
                        Tel: 55(41) 3310-9000
                            <br />
                        Fax: 55(41) 3323-2474  
                    </p>
                    <a href="mailto:griegcwb@grieg.com.br" class="address-rotator-label address-rotator-mail">griegcwb@grieg.com.br
                    </a>

                    <figure class="address-rotator-map">
                        <a href="https://goo.gl/FC8snr" target="_blank">
                            <img src="images/map-Grieg-Curitiba.jpg" alt="" />
                            <figcaption>
                                <asp:Literal runat="server" Text="  <%$ Resources: verNoMapa%>" /></figcaption>
                        </a>
                        &nbsp;
                    </figure>
                </li>
                <li class="address-rotator-item">
                    <h4 class="address-rotator-title">Itajaí</h4>
                    <p class="address-rotator-label address-rotator-position">
                        <span>Av. Joca Brandão, 1313, 8° andar</span>
                        <br />
                        <span>88301-301- Itajaí - SC</span>
                    </p>
                    <p class="address-rotator-label address-rotator-tel">
                        Tel: 55(47) 3249-3800    
                            <br />
                        Fax: 55(47) 3249-3810  
                    </p>
                    <a href="mailto:griegitj@grieg.com.br" class="address-rotator-label address-rotator-mail">griegitj@grieg.com.br
                    </a>

                    <figure class="address-rotator-map">
                        <a href="https://goo.gl/tudC4J" target="_blank">
                            <img src="images/map-Grieg-Itajai.jpg" alt="" />
                            <figcaption>
                                <asp:Literal runat="server" Text="<%$ Resources: verNoMapa%>" /></figcaption>
                        </a>
                        &nbsp;
                    </figure>
                </li>
                <li class="address-rotator-item">
                    <h4 class="address-rotator-title">Paranaguá</h4>
                    <p class="address-rotator-label address-rotator-position">
                        <span>Rua Rodrigues Alves, 800, 10º andar </span>
                        <br />
                        <span>83203-170  - Paranaguá - PR</span>
                    </p>
                    <p class="address-rotator-label address-rotator-tel">
                        Tel: 55(41) 3427-9400     
                            <br />
                        Fax: 55(41) 3427-9400  
                    </p>
                    <a href="mailto:griegpga@grieg.com.br" class="address-rotator-label address-rotator-mail">griegpga@grieg.com.br
                    </a>

                    <figure class="address-rotator-map">
                        <a href="https://goo.gl/6R0qJY" target="_blank">
                            <img src="images/map-Grieg-Paranagua.jpg" alt="" />
                            <figcaption>
                                <asp:Literal runat="server" Text="  <%$ Resources: verNoMapa%>" /></figcaption>
                        </a>
                        &nbsp;
                    </figure>
                </li>
                <li class="address-rotator-item">
                    <h4 class="address-rotator-title">Porto Alegre</h4>
                    <p class="address-rotator-label address-rotator-position">
                        <span>Av. Júlio de Castilhos, 132, 5° andar</span>
                        <br />
                        <span>90030-130 - Porto Alegre - RS</span>
                    </p>
                    <p class="address-rotator-label address-rotator-tel">
                        Tel: 55(51) 3024-6488    
                            <br />
                        Fax: 55(51) 3024-6488   
                    </p>
                    <a href="mailto:griegpoa@grieg.com.br" class="address-rotator-label address-rotator-mail">griegpoa@grieg.com.br
                    </a>

                    <figure class="address-rotator-map">
                        <a href="https://goo.gl/nQ6cIG" target="_blank">
                            <img src="images/map-Grieg-PortoAlegre.jpg" alt="" />
                            <figcaption>
                                <asp:Literal runat="server" Text="  <%$ Resources: verNoMapa%>" /></figcaption>
                        </a>
                        &nbsp;
                    </figure>
                </li>
                <li class="address-rotator-item">
                    <h4 class="address-rotator-title">Guarujá - Grieg Retroporto</h4>
                    <p class="address-rotator-label address-rotator-position">
                        <span>Av. Santos Dumont, 4475 </span>
                        <br />
                        <span>11460-006 Guarujá -SP</span>
                    </p>
                    <p class="address-rotator-label address-rotator-tel">
                        Tel: 55(13) 3347-7654   
                            <br />
                        Fax: 55(13) 3355-6291  
                    </p>
                    <a href="mailto:grl@grieg.com.br" class="address-rotator-label address-rotator-mail">grl@grieg.com.br
                    </a>

                    <figure class="address-rotator-map">
                        <a href="https://goo.gl/L6vi4B" target="_blank">
                            <img src="images/map-Grieg-Retroporto.jpg" alt="" />
                            <figcaption>
                                <asp:Literal runat="server" Text="  <%$ Resources: verNoMapa%>" /></figcaption>
                        </a>
                        &nbsp;
                    </figure>
                </li>
            </ul>

        </aside>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScriptsEnding" runat="Server">

    <script>

        $('#address-rotator').cycle({
            fx: 'fade',
            speed: 'fast',
            timeout: 0,
            pager: '#address-nav',
            pagerAnchorBuilder: function (idx, slide) {
                return '#address-nav li:eq(' + idx + ')';
            }
        });

        $('#address-select').click(function () {
            $('#address-nav').show(0);
        });

        $('.address-select-item').click(function () {
            $('#address-select').html($(this).html());
            $('#address-nav').hide(0);
        });

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

    <script src="js/plugins/jquery.mask/jquery.mask-1.3.min.js"></script>

    <script>
        $(function () {
            $("input[name*='TextBoxDDD']").mask("99");
            $("input[name*='TextBoxTelefone']").mask("9999-9999?9");
        });
    </script>
    <script>

        $("select[name*='DropDownListContato']").change(function () {
            $("input[name*='TextBoxNome']").focus();
        });


    </script>

    <script src='https://www.google.com/recaptcha/api.js'></script>
</asp:Content>
