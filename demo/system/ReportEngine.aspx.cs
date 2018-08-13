using System;
using System.IO;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Drawing;
using System.Drawing.Printing;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
using System.Data.OracleClient;

public partial class ReportEngine : System.Web.UI.Page
{
    ReportDocument rpt1 = new ReportDocument();
    string _dbuser = "", _dbpass="";
    ArrayList _para=new ArrayList();
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        

        string rpt_file = Request.QueryString["file"];
        string procedure = Request.QueryString["procedure"];
        string pdf_yn = Request.QueryString["export_pdf"];

        string v_print_yn = Request.QueryString["print_yn"];

        string v_encode_yn = Request.QueryString["encode_yn"];
        string parameter;

        if (v_encode_yn == "Y")
        {
            //deli parameter is ","
            parameter = Server.HtmlDecode(Request.QueryString["parameter"]);
        }
        else
        {
            parameter = Request.QueryString["parameter"];
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
        ds = new DataSet();
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
        
        //Logon();
        CrystalReportViewer1.ReportSource = rpt1;
        //ParameterFields parameterFields = CrystalReportViewer1.ParameterFieldInfo;
        //SetCurrentValuesForParameterField(parameterFields, _para);
        SetParameter(_para);
        if (v_print_yn == "Y")
        {
            rpt1.PrintToPrinter(1, false, 1, 10);
        }
        else
        {
            if (pdf_yn == "Y")
            {
                //Response.Buffer = true;
                //Response.ClearContent();
                //Response.ClearHeaders();
                //rpt1.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Report");

                MemoryStream oStream; // using System.IO
                oStream = (MemoryStream) rpt1.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                Response.Clear();
                Response.Buffer = true;
                Response.ContentType = "application/pdf";
                Response.BinaryWrite(oStream.ToArray());
                Response.End();
            }
        }
        

    }
    private void SetCurrentValuesForParameterField(ParameterFields parameterFields, ArrayList arrayList)
    {
        ParameterValues currentParameterValues = new ParameterValues();
        for (int i = 0; i < arrayList.Count; i++)
        {
            ParameterDiscreteValue parameterDiscreteValue = new ParameterDiscreteValue();
            parameterDiscreteValue.Value = arrayList[i].ToString();
            currentParameterValues.Add(parameterDiscreteValue);
        }

        ParameterField parameterField = parameterFields[0];
        parameterField.CurrentValues = currentParameterValues;

    }
    private void Logon()
    {
        ConnectionInfo connection = new ConnectionInfo();

        connection.DatabaseName = "posco_test";
        //connection.ServerName = "posco_test";
        connection.UserID = "hr";
        connection.Password = "hr2";

        // First we assign the connection to all tables in the main report
        //
        foreach (CrystalDecisions.CrystalReports.Engine.Table
                 table in rpt1.Database.Tables)
        {
            // Cache the logon info block
            TableLogOnInfo logOnInfo = table.LogOnInfo;

            // Set the connection
            logOnInfo.ConnectionInfo = connection;

            // Apply the connection to the table!
            table.ApplyLogOnInfo(logOnInfo);
        }

        foreach (CrystalDecisions.CrystalReports.Engine.Section  section in rpt1.ReportDefinition.Sections)
        {
            // In each section we need to loop through all the reporting objects
            foreach (CrystalDecisions.CrystalReports.Engine.ReportObject reportObject in section.ReportObjects)
            {
                if (reportObject.Kind == ReportObjectKind.SubreportObject)
                {
                    SubreportObject subReport = (SubreportObject)reportObject;
                    ReportDocument  subDocument =  subReport.OpenSubreport(subReport.SubreportName);

                    foreach (CrystalDecisions.CrystalReports.Engine.Table table in subDocument.Database.Tables)
                    {
                        // Cache the logon info block
                        TableLogOnInfo logOnInfo = table.LogOnInfo;

                        // Set the connection
                        logOnInfo.ConnectionInfo = connection;

                        // Apply the connection to the table!
                        table.ApplyLogOnInfo(logOnInfo);
                        subDocument.SetDataSource(ds);
                    }
                }
            }
        }
    }
    private void SetParameter(ArrayList para )
    {
        //ParameterDiscreteValue discreteVal = new ParameterDiscreteValue();
        //ParameterRangeValue rangeVal = new ParameterRangeValue();
        //ParameterValues curvalues = new ParameterValues();
        for (int i = 0; i < para.Count; i++)
        {
            //discreteVal.Value = para[i];
            //curvalues.Add(discreteVal);
            //rpt1.DataDefinition.ParameterFields[i].ApplyCurrentValues(curvalues);
            rpt1.SetParameterValue(i, para[i]);
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
    public  string DefaultPrinterName() 
    { 
        string functionReturnValue = null;
        //System.Drawing.Printing.PrinterSettings oPS = new System.Drawing.Printing.PrinterSettings();
        
        //foreach (string strPrinter in PrinterSettings.InstalledPrinters)
        //{
        //    // Show the name of the printer
        //    MessageBox.Show(strPrinter);
        //}
        PrintDocument oPS = new PrintDocument();
        
        //string strDefaultPrinter = prtdoc.PrinterSettings.PrinterName;
        try {
            functionReturnValue = oPS.PrinterSettings.PrinterName;
            ESysLib.WriteLogError("Printer:" + oPS.PrinterSettings.PrinterName);
        } 
        catch (System.Exception ex) {
            ESysLib.WriteLogError(ex.Message + "\n" + ex.StackTrace);
        } 
        finally { 
            oPS = null; 
        } 
        return functionReturnValue; 
    }
}
