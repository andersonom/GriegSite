using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Intranet_MasterPageIntranet : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            TituloTaxaDolar.Text = String.Format("{0}: {1}", GetLocalResourceObject("taxaDolar"), DateTime.Now.ToShortDateString());
        }        
    }
}
