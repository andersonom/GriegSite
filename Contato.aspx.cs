using System;
using System.Configuration;
using System.Text;

public partial class Contato : BasePage
{
    Util utl = new Util();

    #region Events
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            var listContacts = utl.LoadContactEmailList();
            if (listContacts != null) { DropDownListContato.DataSource = listContacts; DropDownListContato.DataBind(); }
        }
    }

    protected void ButtonSend_Click(object sender, EventArgs e)
    {
        bool isCaptchaValid = false;

        try
        {
            isCaptchaValid = utl.isCaptchaValid(Request["g-recaptcha-response"], ConfigurationManager.AppSettings["emailReCaptchaSecretKey"]);

            if (isCaptchaValid)
            {
                SendMail();

                divContatoPagina.InnerHtml = "<p>Mensagem enviada com sucesso.</p>";

                Response.AddHeader("REFRESH", "3;URL=Default.aspx");
            }
            else
            {
                divReCaptchaErrorMsg.InnerHtml = "<p style=\"color:red\">Favor assinalar que não é um robô.</p>";
            }
        }
        catch
        {
            divContatoPagina.InnerHtml = "<p style=\"color:red\">Mensagem não pode ser enviada.</p>";
        }

    }
    #endregion

    #region Methods

    private void SendMail()
    {
        utl.SendMail(CreateMailBody(), DropDownListContato.SelectedItem.Value);
    }

    private string CreateMailBody()
    {
        StringBuilder body = new StringBuilder();

        var assunto = String.Format("{0} - {1}", ConfigurationManager.AppSettings["emailAssunto"], DropDownListContato.SelectedItem.Text);

        body.Append("De: "); body.AppendLine(@TextBoxNome.Text);
        body.Append("E-mail: "); body.AppendLine(@TextBoxEmail.Text);

        if (!String.IsNullOrEmpty(@TextBoxEmpresa.Text))
        {
            body.Append("Empresa: "); body.AppendLine(@TextBoxEmpresa.Text);
        }

        body.Append("Telefone: "); body.Append(@TextBoxDDD.Text); body.AppendLine(TextBoxTelefone.Text);
        body.Append("Assunto: "); body.AppendLine(assunto);
        body.AppendLine("Mensagem: "); body.AppendLine(@TextBoxMensagem.Value);

        return body.ToString();
    }
    #endregion
}