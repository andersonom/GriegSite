using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ti_GeraPass : BasePage
{
   
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnGerar_Click(object sender, EventArgs e)
    {
        Util utl = new Util();
        int qutd = 0;
        int.TryParse(txtQut.Text, out qutd);

        literalPass.Text = utl.GeneratePassword(qutd);
    }



}
