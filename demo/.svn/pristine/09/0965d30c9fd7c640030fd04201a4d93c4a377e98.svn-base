using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using CrystalDecisions.Shared;
using CrystalDecisions.ReportSource;
using CrystalDecisions.CrystalReports.Engine;
using System.Data.OracleClient;

public partial class ReportEngineSubReport : System.Web.UI.Page
{
    ReportDocument rpt1 = new ReportDocument();
    string _dbuser = "", _dbpass;
    ArrayList _para=new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        cmdPrint.Attributes.Add("Onclick", "getPrint('PrintArea');");
        string rpt_file = Request.QueryString["file"];
        string procedure = Request.QueryString["procedure"];
        //deli parameter is ","
        string parameter = Request.QueryString["parameter"];
        //deli option is "|"
        //1:export button, 2:print button, 3:tree button (0:none display, 1:display)
        string rpt_option = Request.QueryString["option"];

        if (rpt_option != null)
        {
            string[] options = rpt_option.Split((char)'|');
            if (options.Length > 2)
            {
                CrystalReportViewer1.HasExportButton = options[0] == "0" ? false : true;
                CrystalReportViewer1.HasPrintButton = options[1] == "0" ? false : true;
                CrystalReportViewer1.HasToggleGroupTreeButton = options[2] == "0" ? false : true;
            }
        }
        string file_path = Server.MapPath(rpt_file);
        file_path = file_path.Replace("system", "reports");
        rpt1.Load(file_path);

        _dbuser = procedure.Substring(0, procedure.IndexOf(".", 0));
        _dbpass = Session[_dbuser].ToString();

        string conString = ConfigurationManager.AppSettings["strConn"];
        conString += "User Id=" + _dbuser + ";Password=" + _dbpass;

        string[] stringSeparators = new string[] { "," };
        string[] parameters = parameter.Split((char)'|');
        string[] procedures = procedure.Split((char)'|');
        string temp = "";
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        

        //support multi procedures
        for (int p = 0; p < procedures.Length; p++)
        {
            temp = "";
            string[] para = parameters[p].Split(stringSeparators, StringSplitOptions.None);
            for (int i = 0; i < para.Length; i++)
            {
                temp += "'" + para[i].ToString().Trim() + "',";
                _para.Add(para[i].ToString().Trim());
            }
            string command = "Call " + procedures[p].ToString() + "(" + temp + ":p_rtn_value)";
            dt = GetDataTable(conString, command);
            ds.Tables.Add(dt);
        }
        rpt1.SetDatabaseLogon(_dbuser, _dbpass);
        rpt1.SetDataSource(ds);
        //SetParameter(_para);

        if (rpt1.Subreports.Count > 0)
        {
            CrystalDecisions.CrystalReports.Engine.ReportDocument subrpt = rpt1.Subreports[0];

            subrpt.SetDataSource(ds.Tables[1]);
        }
        CrystalReportViewer1.EnableParameterPrompt = false;
        CrystalReportViewer1.EnableViewState = false;
        CrystalReportViewer1.HasCrystalLogo = false;
        CrystalReportViewer1.ReportSource = rpt1;

        // Stop buffering the response
        Response.Buffer = false;
        // Clear the response content and headers
        Response.ClearContent();
        Response.ClearHeaders();

        // Export the Report to Response stream in PDF format and file name Report
        rpt1.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "Report");
        // There are other format options available such as Word, Excel, CVS, and HTML in the ExportFormatType Enum given by crystal reports
    }
    private void SetParameter(ArrayList para )
    {
        ParameterDiscreteValue discreteVal = new ParameterDiscreteValue();
        ParameterRangeValue rangeVal = new ParameterRangeValue();
        ParameterValues curvalues = new ParameterValues();
        for (int i = 0; i < para.Count; i++)
        {
            discreteVal.Value = para[i];
            curvalues.Add(discreteVal);
            rpt1.DataDefinition.ParameterFields[i].ApplyCurrentValues(curvalues);
        }
    }
    protected DataTable GetDataTable(string conString, string command)
    {
        OracleConnection con = new OracleConnection(conString);
        con.Open();
        OracleCommand cmd = new OracleCommand();
        cmd.CommandText = command;
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        cmd.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;

        OracleDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        dr.Close();
        con.Close();
        return dt;
    }
    protected void CrystalReportViewer1_Unload(object sender, EventArgs e)
    {
        if (rpt1 != null)
        {
            rpt1.Close();
            rpt1.Dispose();
        }
    }
     /*job limit 75*/
    private void Page_Unload(object sender, System.EventArgs e)
    {
        if (rpt1 != null)
        {
            rpt1.Close();
            rpt1.Dispose();
        }
    }

    protected void cmdPrint_Click(object sender, EventArgs e)
    {
        System.Drawing.Printing.PrintDocument printDocument = new System.Drawing.Printing.PrintDocument();
        //rpt1.PrintOptions.PrinterName = printDocument.PrinterSettings.PrinterName;

        if (txtPrinter.Text != "")
        {
            printDocument.PrinterSettings.PrinterName = txtPrinter.Text;

            if (printDocument.PrinterSettings.IsValid)
            {
                rpt1.PrintOptions.PrinterName = printDocument.PrinterSettings.PrinterName;
                rpt1.PrintToPrinter(1, false, 0, 0);
            }
            else
                Response.Write("Invalid printer");
        }
        else
            Response.Write("Please enter printer name!");
    }
}
