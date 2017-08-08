using System;
using System.Collections.Generic;
using System.Configuration;
using Devart.Data.Oracle;
using System.Net;
using System.Text;
using System.Web;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.Xml.Linq;
using System.Linq;

public static class ExtentionMethods
{
    public static Tuple<bool, string> IsValidEmail(this string email)
    {
        try
        {
            var addr = new System.Net.Mail.MailAddress(email);
            return new Tuple<bool, string>(true, addr.Address.Trim('\''));
        }
        catch
        {
            return new Tuple<bool, string>(false, string.Empty);
        }
    }
}

public class Util
{
    [DataContract]
    public class GoogleResponse
    {
        [DataMember(Name = "success")]
        public bool Success { get; set; }
    }

    public bool isCaptchaValid(string response, string key)
    {
        var requestString = string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", key, response);

        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(requestString);

        using (WebResponse captchaResponse = request.GetResponse())
        {
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(GoogleResponse));

            GoogleResponse gResponse = serializer.ReadObject(captchaResponse.GetResponseStream()) as GoogleResponse;

            return gResponse.Success;
        }
    }

    public Dictionary<string, string> LoadContactEmailList()
    {
        var listContact = new Dictionary<string, string>();

        foreach (var item in ConfigurationManager.AppSettings)
        {
            var key = item.ToString();
            var value = ConfigurationManager.AppSettings[item.ToString()].ToString();

            if (key.Length >= 5)
            {
                if (key.Substring(0, 5) != "email")
                    listContact.Add(item.ToString(), ConfigurationManager.AppSettings[item.ToString()].ToString());
            }
            else
            {
                listContact.Add(item.ToString(), ConfigurationManager.AppSettings[item.ToString()].ToString());
            }
        }

        return listContact;
    }

    private readonly Random _rng = new Random();
    private const string _chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    string RandomString(int size)
    {
        char[] buffer = new char[size];

        for (int i = 0; i < size; i++)
        {
            buffer[i] = _chars[_rng.Next(_chars.Length)];
        }

        return new string(buffer);
    }

    public string GeneratePassword(int qutd)
    {
        StringBuilder sb = new StringBuilder();

        if (qutd > 0)
        {
            for (int i = 0; i < qutd; i++)
            {
                sb.Append("<br/>").Append(RandomString(4) + _rng.Next(1000, 9999));
            }
        }
        return sb.ToString();
    }

    public string CheckEmails(string emails)
    {
        string email = string.Empty;
        string emailsInvalidos = string.Empty;
        string emailsValidos = string.Empty;
        int qutdEmailsValidados = 0;

        char pontoVirgula = ';';
        //char aspas = '\'';
        char enter = '\n';


        for (int i = 0; i < emails.Length; i++)
        {
            if ((char)emails[i] != enter)//(char)emails[i] != aspas &&
            {
                if ((char)emails[i] == pontoVirgula)
                {
                    qutdEmailsValidados++;

                    var tupleEmail = email.IsValidEmail();

                    if (!tupleEmail.Item1)
                        emailsInvalidos += email + "<br>";
                    else
                        emailsValidos += tupleEmail.Item2 + pontoVirgula + "<br>";

                    email = string.Empty;
                }
                else
                {
                    email += emails[i];
                }
            }
        }

        if (!string.IsNullOrEmpty(emailsInvalidos))
            return String.Format("{0} Inválido(s)", emailsInvalidos);
        else
            return String.Format("{0} E-mail(s) validado(s) <br> {1}", qutdEmailsValidados, emailsValidos);

    }

    public string GetIPAddress()
    {
        HttpContext context = HttpContext.Current;
        string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipAddress))
        {
            string[] addresses = ipAddress.Split(',');
            if (addresses.Length != 0)
            {
                return addresses[0];
            }
        }

        return context.Request.ServerVariables["REMOTE_ADDR"];
    }

    public string CheckDollarTax()
    {

        using (OracleConnection connection = new OracleConnection("user id=XXXXX; password=XXXXXXX;server=XXXXXXXX;direct=True;sid=XXX;pooling=false"))
        {
            OracleCommand cmd = connection.CreateCommand();

            cmd.CommandText = "SELECT  COTACAO_HIST FROM tecon.DC_HISTORICO_MOEDAS WHERE VALOR_PUBLICACAO ='S' AND IDMOEDA ='USD' AND DH_COTACAO_HIST = TO_DATE(SYSDATE,'DD/MM/YY') AND IDAREA_ARM = 1";

            connection.Open();

            object o = cmd.ExecuteScalar();

            connection.Close();

            if (o != null)
                return String.Format("BRL {0:0.00} / USD", o);
            else
                return "Taxa não cadastrada";
        }

    }

    public void SendMail(string body, string toAddress)
    {
        var fromAddress = ConfigurationManager.AppSettings["emailRemetente"].ToString();
        var fromPassword = ConfigurationManager.AppSettings["emailSenhaRemetente"].ToString();
        var assunto = ConfigurationManager.AppSettings["emailAssunto"].ToString();
        var smtpServer = ConfigurationManager.AppSettings["emailSMTPServer"].ToString();
        int smtpPort = int.Parse(ConfigurationManager.AppSettings["emailSMTPPort"]);

        var smtp = new System.Net.Mail.SmtpClient();
        {
            smtp.Host = smtpServer;
            smtp.Port = smtpPort;
            smtp.EnableSsl = false;
            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
            smtp.Timeout = 20000;
        }

        smtp.Send(fromAddress, toAddress, assunto, body);
    }
}

public class Company
{
    public int Id { get; set; }
    public string Name { get; set; }
    public List<Department> Departments { get; set; }

public IEnumerable<Company> LoadCompanies(XDocument _x, string pRootNodeName, string pFirstNodeName)
    {
        var companies = (from a in _x.Elements(pRootNodeName).Elements(pFirstNodeName)
                         select new Company() { Name = a.Attribute("id").Value, Id = 0 }
                         ).ToList();
     
        return companies;
    }

    public IEnumerable<Company> LoadCompaniesWithDepartamentsAndEmployees(XDocument _x, string pRootNodeName, string pFirstNodeName)
    {
        var companies = (from a in _x.Elements(pRootNodeName).Elements(pFirstNodeName)
                         select new Company() { Name = a.Attribute("id").Value, Id = 0 }
                        ).ToList();

        Department dept = new Department();
        companies.ForEach(i => i.Departments = dept.LoadDepartament(_x, "Empresa", i.Name, "Ramais"));

        Employee employee = new global::Employee(_x,null,null);
        companies.ForEach(i => i.Departments.ForEach(i2=> i2.Employees = employee.LoadEmployee("Ramais", "Empresa", i.Name, "Departamento", i2.Name)));

        return companies;
    }
}

public class Department
{
    public string Name { get; set; }
    public string Company { get; set; }
    public List<Employee> Employees { get; set; }

public List<Department> LoadDepartament(XDocument pXdoc, string pFirstNodeName, string pFirstNodeValue, string pRootNodeName)
    {
        List<Department> listDepartments = null;
        var employees = pXdoc.Elements(pRootNodeName).Elements(pFirstNodeName).Where(i => i.Attribute("id").Value.Equals(pFirstNodeValue)).FirstOrDefault();

        if (employees != null)
        {
            listDepartments = (from n in employees.Elements()
                               group n by n.Element("Departamento").Value into g
                               select new Department()
                               {
                                   Name = g.Key,
                                   Company = pFirstNodeValue
                               }).ToList();
        }

        return listDepartments;
    }
}

[Serializable]
public class Employee
{
    public Employee()
    {

    }

    public Employee(XDocument pXdoc, string pPath, string pUserLogged)
    {
        Xdoc = pXdoc;
        Path = pPath;
        UserLogged = pUserLogged;
    }

    public string Name { get; set; }
    public string Initials { get; set; }
    public string Local { get; set; }
    public string ExtentionLine { get; set; }
    public string Department { get; set; }

    public string MobilePhone { get; set; }
    public string TelePhone { get; set; }

    public XDocument Xdoc { get; set; }
    public string Path { get; set; }
    public string UserLogged { get; set; }

    public List<XElement> SearchEmployeeNode(string pEmployeeBeforeEditName, string pCompany)
    {
        var employee = Xdoc.Elements("Telefones").Elements("Empresa").Where(i => i.Attribute("id").Value == pCompany).FirstOrDefault()
                         .Elements("Funcionario").Where(e => e.Element("Nome").Value == pEmployeeBeforeEditName);

        return employee.ToList();
    }

    public List<XElement> SearchEmployeeNode(string pEmployeeBeforeEditName, string pCompanyValue, string pDepartmentValue)
    {
        var employee = Xdoc.Elements("Ramais").Elements("Empresa").Where(i => i.Attribute("id").Value.Equals(pCompanyValue)).FirstOrDefault()
                         .Elements("Funcionario").Where(e => e.Element("Nome").Value == pEmployeeBeforeEditName && e.Element("Departamento").Value == pDepartmentValue);

        return employee.ToList();
    }

    public List<Employee> LoadEmployee(string pRootNode, string pFirstNodeName, string pFirstNodeValue)
    {
        List<Employee> listEmployees = new List<Employee>();

        var employees = Xdoc.Elements(pRootNode).Elements(pFirstNodeName).Where(i => i.Attribute("id").Value.Equals(pFirstNodeValue)).FirstOrDefault();

        if (employees != null)
            employees.Elements().ToList().ForEach(i => listEmployees.Add(new Employee { Name = i.Element("Nome").Value, MobilePhone = i.Element("Tel1").Value, TelePhone = i.Element("Tel2").Value }));

        return listEmployees.OrderBy(i => i.Name).ToList();
    }

    public List<Employee> LoadEmployee(string pRootNode, string pFirstNodeName, string pFirstNodeValue, string pFirstNodeAttributeName, string pFirstNodeAttributeValue)
    {
        List<Employee> listEmployees = new List<Employee>();

        var employees = Xdoc.Elements(pRootNode).Elements(pFirstNodeName).Where(i => i.Attribute("id").Value == pFirstNodeValue).FirstOrDefault();

        if (employees != null)
            employees.Elements().Where(i => i.Element(pFirstNodeAttributeName).Value.Equals(pFirstNodeAttributeValue)).ToList()
                .ForEach(i => listEmployees.Add(new Employee
                {
                    Name = i.Element("Nome").Value,
                    Initials = i.Element("Sigla").Value,
                    Local = i.Element("Local").Value,
                    ExtentionLine = i.Element("Ramal").Value,
                    Department = i.Element("Departamento").Value
                }));

        return listEmployees.OrderBy(i=> i.Name).ToList();
    }

    public void AddNewEmployee(Employee pEmployee, string company)
    {
        var employeeXElement = new List<XElement>();

        employeeXElement.Add(new XElement("Nome", pEmployee.Name));
        employeeXElement.Add(new XElement("Tel1", pEmployee.MobilePhone));
        employeeXElement.Add(new XElement("Tel2", pEmployee.TelePhone));

        var companyNode = Xdoc.Elements("Telefones").Elements("Empresa").Where(i => i.Attribute("id").Value == company).First();

        companyNode.Add(new XElement("Funcionario"));
        companyNode.Elements("Funcionario").Last().Add(employeeXElement);

        SaveXMLFIle("adicionou", pEmployee, company);
    }       

    public void AddNewEmployee(Employee pEmployee, string company, string pDepartment)
    {
        var employeeXElement = new List<XElement>();

        employeeXElement.Add(new XElement("Nome",  pEmployee.Name));
        employeeXElement.Add(new XElement("Sigla", pEmployee.Initials));
        employeeXElement.Add(new XElement("Local", pEmployee.Local));
        employeeXElement.Add(new XElement("Ramal", pEmployee.ExtentionLine));
        employeeXElement.Add(new XElement("Departamento", pDepartment));

        var companyNode = Xdoc.Elements("Ramais").Elements("Empresa").Where(i => i.Attribute("id").Value == company).First();

        companyNode.Add(new XElement("Funcionario"));
        companyNode.Elements("Funcionario").Last().Add(employeeXElement);

        SaveXMLFIle("adicionou", pEmployee, company, pDepartment);
    }      

    public void UpdateEmployee(string pEmployeeBeforeEditName, Employee pEmployee, string pCompany)
    {
        IEnumerable<XElement> employee = SearchEmployeeNode(pEmployeeBeforeEditName, pCompany);

        employee.Elements("Nome").First().Value = pEmployee.Name;
        employee.Elements("Tel1").First().Value = pEmployee.MobilePhone;
        employee.Elements("Tel2").First().Value = pEmployee.TelePhone;
        

        SaveXMLFIle("alterou", pEmployee, pCompany);
    }

    public void UpdateEmployee(string pEmployeeBeforeEditName, Employee pEmployee, string pCompany, string pDepartament)
    {
        IEnumerable<XElement> employee = SearchEmployeeNode(pEmployeeBeforeEditName, pCompany, pDepartament);

        employee.Elements("Nome").First().Value =  pEmployee.Name;
        employee.Elements("Sigla").First().Value = pEmployee.Initials;
        employee.Elements("Local").First().Value = pEmployee.Local;
        employee.Elements("Ramal").First().Value = pEmployee.ExtentionLine;

        SaveXMLFIle("alterou", pEmployee, pCompany, pDepartament);
    }

    public void DeleteEmployee(string pEmployeeName, Employee pEmployee, string pCompany)
    {
        IEnumerable<XElement> employee = SearchEmployeeNode(pEmployeeName, pCompany);

        employee.Remove();

        SaveXMLFIle("deletou", pEmployee, pCompany);
    }

    public void DeleteEmployee(string pEmployeeName, Employee pEmployee, string pCompany, string pDepartament)
    {
        IEnumerable<XElement> employee = SearchEmployeeNode(pEmployeeName, pCompany, pDepartament);

        employee.Remove();

        SaveXMLFIle("deletou", pEmployee, pCompany, pDepartament);
    }

    public void SaveXMLFIle(string pAction, Employee pEmployee, string pCompanyName)
    {
        Xdoc.Save(Path);

        Util utl = new Util();

        utl.SendMail(String.Format("{0} {1} o telefone {2}, {3}, {4}, {5}",
                                    UserLogged,
                                    pAction,
                                    HttpUtility.HtmlDecode(pEmployee.Name),
                                    pEmployee.MobilePhone,
                                    pEmployee.TelePhone,
                                    pCompanyName),
                                    ConfigurationManager.AppSettings["emailDestinatarioLog"]);
    }

    public void SaveXMLFIle(string pAction, Employee pEmployee, string pCompanyName, string pDepartament)
    {
        Xdoc.Save(Path);

        Util utl = new Util();

        utl.SendMail(String.Format("{0} {1} o ramal {2}, {3}, {4}, {5} , {6}", UserLogged,
                pAction,
                HttpUtility.HtmlDecode(pEmployee.Name),
                HttpUtility.HtmlDecode(pEmployee.Initials),
                HttpUtility.HtmlDecode(pEmployee.Local),
                pEmployee.ExtentionLine,
                pDepartament,
                pCompanyName
                ), ConfigurationManager.AppSettings["emailDestinatarioLog"]);
    }
}