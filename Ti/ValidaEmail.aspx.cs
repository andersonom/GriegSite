using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ti_ValidaEmail : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void ButtonValidarEmails_Click(object sender, EventArgs e)
    {
        Util utl = new Util();
        
        lblMsg.Text = utl.CheckEmails(TextBoxEmails.Text);
    }
}