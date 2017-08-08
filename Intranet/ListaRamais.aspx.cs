using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Intranet_ListaRamais : BasePage
{
    static List<Company> listCompanies;
    static List<Department> listDepartment;
    static List<Employee> listEmployee;
    static string path;

    static Company company;
    static Employee employee;
    static Department dept;
    static XDocument _x;

    #region Events
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            path = Server.MapPath("ListaRamais.xml");
            _x = XDocument.Load(path);

            if (company == null) company = new Company();
            if (employee == null) employee = new Employee(_x, path, Request.LogonUserIdentity.Name.ToString());
            if (dept == null) dept = new Department();

            LoadCompanies();
        }
    }   

    protected void DropDownListDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadEmployees();
    }

    protected void DropDownListCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadDDLDepartment();
    }    

    protected void GridViewExtentionLines_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        Refresh();
    }      

    protected void ButtonSend_Click(object sender, EventArgs e)
    {
        try
        {
            employee.AddNewEmployee(GetEmployeeFromForm(), DropDownListCompany.SelectedItem.Value, DropDownListDepartment.SelectedItem.Value);

            LoadEmployees();
        }
        catch (Exception ex)
        {
            SendError("adicionar", ex);
        }      
    }

    protected void GridViewExtentionLines_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        var EmployeeName = Server.HtmlDecode(GridViewExtentionLines.Rows[e.RowIndex].Cells[0].Text.Trim());

        try
        {
            employee.DeleteEmployee(EmployeeName, GetEmployeeFromGrid(e.RowIndex), DropDownListCompany.SelectedItem.Value, DropDownListDepartment.SelectedItem.Value);

            LoadEmployees();

            Refresh();
        }
        catch (Exception ex)
        {
            SendError("deletar", ex);
        }
    }

    protected void GridViewExtentionLines_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            employee.UpdateEmployee(ViewState["EmployeeNameBeforeEdit"].ToString(), GetEmployeeFromTextGrid(e.RowIndex), DropDownListCompany.SelectedItem.Value, DropDownListDepartment.SelectedItem.Value);

            LoadEmployees();

            Refresh();
        }
        catch (Exception ex)
        {
            SendError("atualizar", ex);
        }
    }


    protected void GridViewExtentionLines_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewExtentionLines.EditIndex = Convert.ToInt32(e.NewEditIndex);

        ViewState["EmployeeNameBeforeEdit"] = Server.HtmlDecode(GridViewExtentionLines.Rows[e.NewEditIndex].Cells[0].Text.Trim());

        LoadEmployees();
    }

    #endregion

    #region Methods   
    private void LoadCompanies()
    {
        List<Company> listCompanies = company.LoadCompanies(_x, "Ramais", "Empresa").ToList();
        listCompanies.Insert(0, new Company());

        DropDownListCompany.DataSource = listCompanies;
        DropDownListCompany.DataBind();
    }

    private void LoadDDLDepartment()
    {
        listDepartment = dept.LoadDepartament(_x, "Empresa", DropDownListCompany.SelectedItem.Value, "Ramais");//new               

        if (listDepartment != null && listDepartment.Count > 0)
        {
            listDepartment.Insert(0, new Department() { Name = "" });//50000 value since 0 is an ID used in XML //Id = 50000,

            DropDownListDepartment.Visible = true;
            DropDownListDepartment.DataSource = listDepartment;
            DropDownListDepartment.DataBind();
        }
        else
        {
            DropDownListDepartment.Visible = false;
        }

        //ButtonAdd.Visible = false;//Js
        GridViewExtentionLines.DataSource = null;
        GridViewExtentionLines.DataBind();
    }

    private void LoadEmployees()
    {
        //if (!string.IsNullOrEmpty(DropDownListDepartment.SelectedValue))// Converter para > JS
       // {//
            GridViewExtentionLines.DataSource = employee.LoadEmployee("Ramais", "Empresa", DropDownListCompany.SelectedItem.Value, "Departamento", DropDownListDepartment.SelectedItem.Value);
            GridViewExtentionLines.DataBind();

            //ButtonAdd.Visible = true;//Converter para > JS

        //}//Converter para > JS
       // else//Converter para > JS
        //{//Converter para > JS
        //    GridViewExtentionLines.DataSource = null;  //ButtonAdd.Visible = false;//Converter para > JS
        //}GridViewExtentionLines.DataBind();//Converter para > JS


    }

    private Employee GetEmployeeFromTextGrid(int row)
    {
        return new Employee()
        {
            Name = ((TextBox)GridViewExtentionLines.Rows[row].Cells[0].Controls[0]).Text,
            Local = ((TextBox)GridViewExtentionLines.Rows[row].Cells[1].Controls[0]).Text,
            Initials = ((TextBox)GridViewExtentionLines.Rows[row].Cells[2].Controls[0]).Text,
            ExtentionLine = ((TextBox)GridViewExtentionLines.Rows[row].Cells[3].Controls[0]).Text
        };
    }

    private Employee GetEmployeeFromForm()
    {
        return new Employee()
        {
            Name = TextBoxName.Text.Trim(),
            Local = TextBoxLocal.Text.Trim(),
            Initials =TextBoxInitials.Text.Trim(),
            ExtentionLine = TextBoxExtentionLine.Text.Trim(),
        };
    }
    private Employee GetEmployeeFromGrid(int pRow)
    {
        return new Employee()
        {
            Name = GridViewExtentionLines.Rows[pRow].Cells[0].Text.Trim(),
            Local = GridViewExtentionLines.Rows[pRow].Cells[1].Text.Trim(),
            Initials = GridViewExtentionLines.Rows[pRow].Cells[2].Text.Trim(),
            ExtentionLine = GridViewExtentionLines.Rows[pRow].Cells[3].Text.Trim()
        };
    }

    #region old
    //protected void GridViewExtentionLines_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    if (employee.DeleteEmployee(e.RowIndex,))
    //    {
    //        LoadEmployees();

    //        Refres();
    //    }
    //    else
    //    {
    //        divEditor.InnerHtml = "Não Foi possivel deletar o ramal";
    //    }
    //}

    //protected void GridViewExtentionLines_RowUpdating(object sender, GridViewUpdateEventArgs e)
    //{
    //    if (UpdateEmplyoee(e.RowIndex))
    //    {
    //        LoadEmployees();

    //        RefreshAfterEdit();
    //    }
    //    else
    //    {
    //        divEditor.InnerHtml = "Não Foi possivel atualizar o ramal";
    //    }
    //}
    //private bool UpdateEmplyoee(int row)
    //{
    //    Employee employeeEdited = GetEmployeeFromGrid(row);
    //    Employee employeeBeforeEdit = (Employee)ViewState["EmployeeBeforeEdit"];

    //    XmlDocument doc = new XmlDocument();
    //    doc.Load(path);

    //    XmlNode nodeEmployee = SearchEmployeeNode(doc);
    //    if (nodeEmployee != null)
    //    {
    //        if (nodeEmployee.ChildNodes[0].LastChild != null) nodeEmployee.ChildNodes[0].LastChild.Value = employeeEdited.Name.Trim();
    //        if (nodeEmployee.ChildNodes[1].LastChild != null) nodeEmployee.ChildNodes[1].LastChild.Value = employeeEdited.Initials;
    //        if (nodeEmployee.ChildNodes[2].LastChild != null) nodeEmployee.ChildNodes[2].LastChild.Value = employeeEdited.Local.Trim();
    //        if (nodeEmployee.ChildNodes[3].LastChild != null) nodeEmployee.ChildNodes[3].LastChild.Value = employeeEdited.ExtentionLine.Trim();

    //        doc.Save(path);

    //        Util utl = new Util();
    //        utl.SendMail(String.Format("{0} alterou o ramal {1}, {2}, {3}, {4} para {5}, {6}, {7}, {8}", Request.LogonUserIdentity.Name,
    //            employeeBeforeEdit.Name,
    //            employeeBeforeEdit.Initials,
    //            employeeBeforeEdit.Local,
    //            employeeBeforeEdit.ExtentionLine,
    //            employeeEdited.Name,
    //            employeeEdited.Initials,
    //            employeeEdited.Local,
    //            employeeEdited.ExtentionLine
    //            ), ConfigurationManager.AppSettings["emailDestinatarioLog"]);

    //        return true;
    //    }

    //    return false;
    //}
    //private bool AddNewEmployee()
    //{
    //    PanelAdd.Visible = false;
    //    ButtonAdd.Visible = true;

    //    XmlDocument doc = new XmlDocument();
    //    doc.Load(path);

    //    XmlNode node = SearchDepartmentNode(doc);
    //    if (node != null)
    //    {
    //        XmlElement elem = doc.CreateElement("Funcionario");

    //        XmlElement elemName = doc.CreateElement("Nome");
    //        XmlElement elemInitials = doc.CreateElement("Sigla");
    //        XmlElement elemLocal = doc.CreateElement("Local");
    //        XmlElement elemExtentionLine = doc.CreateElement("Ramal");

    //        elemName.InnerText = @TextBoxName.Text.Trim();
    //        elemInitials.InnerText = @TextBoxInitials.Text.Trim();
    //        elemLocal.InnerText = @TextBoxLocal.Text.Trim();
    //        elemExtentionLine.InnerText = @TextBoxExtentionLine.Text.Trim();

    //        elem.AppendChild(elemName);
    //        elem.AppendChild(elemInitials);
    //        elem.AppendChild(elemLocal);
    //        elem.AppendChild(elemExtentionLine);

    //        node.AppendChild(elem);

    //        doc.Save(path);

    //        Util utl = new Util();
    //        utl.SendMail(String.Format("{0} adicionou o ramal {1}, {2}, {3}, {4}, {5}, {6}", Request.LogonUserIdentity.Name,
    //            elemName.InnerText,
    //            elemInitials.InnerText,
    //            elemLocal.InnerText,
    //            elemExtentionLine.InnerText,
    //            DropDownListCompany.SelectedItem.Text,
    //            DropDownListDepartment.SelectedItem.Text
    //            ), ConfigurationManager.AppSettings["emailDestinatarioLog"]);

    //        return true;
    //    }
    //    return false;
    //}



    //private XmlNode SearchEmployeeNode(XmlDocument doc)
    //{
    //    Employee employeeBeforeEdit = (Employee)ViewState["EmployeeBeforeEdit"];

    //    XmlElement root = doc.DocumentElement;
    //    XmlNode node = doc.SelectSingleNode("Ramais");

    //    XmlNodeList nodeListCompanies = node.SelectNodes("Empresa");
    //    XmlNodeList nodeListDepartments = null;
    //    XmlNodeList nodeListEmployees = null;


    //    for (int i = 0; i < nodeListCompanies.Count; i++)
    //    {
    //        if (nodeListCompanies[i].Attributes[0].Value == DropDownListCompany.SelectedItem.Text)
    //        {
    //            nodeListDepartments = nodeListCompanies[i].SelectNodes("Departamento");

    //            for (int i2 = 0; i2 < nodeListDepartments.Count; i2++)
    //            {
    //                if (nodeListDepartments[i2].Attributes[0].Value == DropDownListDepartment.SelectedItem.Text)
    //                {
    //                    nodeListEmployees = nodeListDepartments[i2].SelectNodes("Funcionario");
    //                    for (int i3 = 0; i3 < nodeListEmployees.Count; i3++)
    //                    {
    //                        if (nodeListEmployees[i3].ChildNodes.Count > 0
    //                            && nodeListEmployees[i3].ChildNodes[0].InnerText.Trim() == employeeBeforeEdit.Name.Trim()
    //                            && nodeListEmployees[i3].ChildNodes[1].InnerText.Trim() == employeeBeforeEdit.Initials.Trim()
    //                            && nodeListEmployees[i3].ChildNodes[2].InnerText.Trim() == employeeBeforeEdit.Local.Trim()
    //                            && nodeListEmployees[i3].ChildNodes[3].InnerText.Trim() == employeeBeforeEdit.ExtentionLine.Trim()
    //                            )
    //                        {
    //                            return nodeListEmployees[i3];
    //                        }
    //                    }
    //                }
    //            }
    //        }
    //    }

    //    return null;
    //}

    //private XmlNode SearchDepartmentNode(XmlDocument doc)
    //{
    //    Employee employeeBeforeEdit = (Employee)ViewState["EmployeeBeforeEdit"];

    //    XmlElement root = doc.DocumentElement;
    //    XmlNode node = doc.SelectSingleNode("Ramais");

    //    XmlNodeList nodeListCompanies = node.SelectNodes("Empresa");
    //    XmlNodeList nodeListDepartments = null;


    //    for (int i = 0; i < nodeListCompanies.Count; i++)
    //    {
    //        if (nodeListCompanies[i].Attributes[0].Value == DropDownListCompany.SelectedItem.Text)
    //        {
    //            nodeListDepartments = nodeListCompanies[i].SelectNodes("Departamento");

    //            for (int i2 = 0; i2 < nodeListDepartments.Count; i2++)
    //            {
    //                if (nodeListDepartments[i2].Attributes[0].Value == DropDownListDepartment.SelectedItem.Text)
    //                {
    //                    return nodeListDepartments[i2];
    //                }
    //            }
    //        }
    //    }

    //    return null;
    //} 
    #endregion

    private void Refresh()
    {
        GridViewExtentionLines.EditIndex = -1;
        ViewState["EmployeeBeforeEdit"] = null;
        LoadEmployees();
    }

    private void SendError(string action, Exception ex)
    {
        Util utl = new Util();
        utl.SendMail(String.Format("Não Foi possivel {0} o ramal, Erro: {1}, IP: {2}", action, ex.Message, utl.GetIPAddress()), ConfigurationManager.AppSettings["emailDestinatarioLog"]);
        divEditor.InnerHtml = String.Format("Não Foi possivel {0} o ramal", action);
    }


    #endregion
        
}