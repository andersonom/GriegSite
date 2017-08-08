using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Globalization;
using System;

/// <summary>
/// Classe base responsavel pela tradução das paginas
/// </summary>
public class BasePage : System.Web.UI.Page
{
    protected override void InitializeCulture()
    {
        if (!string.IsNullOrEmpty(Request["lang"]))
        {

            Session["lang"] = Request["lang"];
        }
        string lang = Convert.ToString(Session["lang"]);
        string culture = string.Empty;
        /* // In case, if you want to set vietnamese as default language, then removing this comment
        if(lang.ToLower().CompareTo("vi") == 0 ||string.IsNullOrEmpty(culture))
        {               
            culture = "vi-VN";
        }
         */
        if (lang.ToLower().CompareTo("pt") == 0 || string.IsNullOrEmpty(culture))
        {
            culture = "pt-BR";
        }
        if (lang.ToLower().CompareTo("en") == 0)
        {
            culture = "en-US";
        }
        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(culture);
        Thread.CurrentThread.CurrentUICulture = new CultureInfo(culture);

        base.InitializeCulture();
    }
}