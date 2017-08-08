using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Intranet_ListaTelefones : BasePage
{
    static string path;
    //Util utl;
    static Company company;
    static Employee employee;
    static XDocument _x;

    #region Events
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            path = Server.MapPath("ListaTelefones.xml");
            _x = XDocument.Load(path);
            
            if (company == null) company = new Company();
            if (employee == null) employee = new Employee(_x, path, Request.LogonUserIdentity.Name.ToString());

            LoadCompanies();           
        }
    }

    protected void DropDownListCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadEmployees();
    }

    protected void ButtonSend_Click(object sender, EventArgs e)
    {
        try
        {
            employee.AddNewEmployee(GetEmployeeFromForm(), DropDownListCompany.SelectedItem.Value);

            LoadEmployees();
        }
        catch (Exception ex)
        {
            SendError("adicionar", ex);
        }
    }

    protected void GridViewEmployees_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        var EmployeeName = Server.HtmlDecode(GridViewEmployees.Rows[e.RowIndex].Cells[0].Text.Trim());

        try
        {
            employee.DeleteEmployee(EmployeeName, GetEmployeeFromGrid(e.RowIndex), DropDownListCompany.SelectedItem.Value);

            LoadEmployees();

            Refresh();
        }
        catch (Exception ex)
        {
            SendError("deletar", ex);
        }
    }

    protected void GridViewEmployees_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            employee.UpdateEmployee(ViewState["EmployeeNameBeforeEdit"].ToString(), GetEmployeeFromTextGrid(e.RowIndex), DropDownListCompany.SelectedItem.Value);

            LoadEmployees();

            Refresh();
        }
        catch (Exception ex)
        {
            SendError("atualizar", ex);
        }
    }

    protected void GridViewEmployees_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewEmployees.EditIndex = Convert.ToInt32(e.NewEditIndex);

        ViewState["EmployeeNameBeforeEdit"] = Server.HtmlDecode(GridViewEmployees.Rows[e.NewEditIndex].Cells[0].Text.Trim());

        LoadEmployees();
    }

    protected void GridViewEmployees_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        Refresh();
    }

    #endregion

    #region Methods
    private void Refresh()
    {
        GridViewEmployees.EditIndex = -1;
        ViewState["EmployeeNameBeforeEdit"] = null;
        LoadEmployees();
     
    }

    private void LoadCompanies()
    {
        List<Company> listCompanies = company.LoadCompanies(_x,"Telefones","Empresa").ToList();
        listCompanies.Insert(0, new Company());

        DropDownListCompany.DataSource = listCompanies;
        DropDownListCompany.DataBind();

    }

    private void LoadEmployees()
    {
        GridViewEmployees.DataSource = employee.LoadEmployee("Telefones","Empresa",DropDownListCompany.SelectedItem.Value);        
        GridViewEmployees.DataBind();
    }

    private Employee GetEmployeeFromTextGrid(int pRow)
    {
        return new Employee()
        {
            Name = ((TextBox)GridViewEmployees.Rows[pRow].Cells[0].Controls[0]).Text.Trim().ToUpper(),
            MobilePhone = ((TextBox)GridViewEmployees.Rows[pRow].Cells[1].Controls[0]).Text.Trim(),
            TelePhone = ((TextBox)GridViewEmployees.Rows[pRow].Cells[2].Controls[0]).Text.Trim()
        };
    }

    private Employee GetEmployeeFromGrid(int pRow)
    {
        return new Employee()
        {
            Name = GridViewEmployees.Rows[pRow].Cells[0].Text.Trim().ToUpper(),
            MobilePhone = GridViewEmployees.Rows[pRow].Cells[1].Text.Trim(),
            TelePhone = GridViewEmployees.Rows[pRow].Cells[2].Text.Trim()
        };
    }

    private Employee GetEmployeeFromForm()
    {
        return new Employee()
        {
            Name = TextBoxName.Text.Trim().ToUpper(),
            MobilePhone = TextBoxMobile.Text.Trim(),
            TelePhone = TextBoxTelephone.Text.Trim()
        };
    }

    private void SendError(string action, Exception ex)
    {
        Util utl = new Util();
        utl.SendMail(String.Format("Não Foi possivel {0} o telefone, Erro: {1}, IP: {2}", action, ex.Message, utl.GetIPAddress()), ConfigurationManager.AppSettings["emailDestinatarioLog"]);
        divEditor.InnerHtml = String.Format("Não Foi possivel {0} o telefone", action);
    }
    #endregion

    
}