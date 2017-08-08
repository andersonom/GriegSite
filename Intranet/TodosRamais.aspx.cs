using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Intranet_TodosRamais : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var path = Server.MapPath("ListaRamais.xml");
            var _x = XDocument.Load(path);

            var company = new Company();

            var allData = company.LoadCompaniesWithDepartamentsAndEmployees(_x, "Ramais", "Empresa");

            RepeaterSantos.DataSource = allData.Where(i=> i.Name == "Grieg Santos").ToList();
            RepeaterSantos.DataBind();

            RepeaterRamais.DataSource = allData.Where(i => i.Name != "Grieg Santos").ToList();
            RepeaterRamais.DataBind();
        }
    }
}