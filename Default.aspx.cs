using System;
using System.Configuration;

public partial class _Default : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [System.Web.Services.WebMethod]
    public static string GetCurrentDollarTax()
    {
        Util utl = new Util();

        try
        {
            return utl.CheckDollarTax();
        }
        catch (Exception ex)
        {
            utl.SendMail(String.Format("Problema ao acessar a taxa do dolar, Erro: {0}, IP: {1}", ex.Message, utl.GetIPAddress()), ConfigurationManager.AppSettings["emailDestinatarioLog"]);

            return "Taxa não cadastrada";
        }
    }
}