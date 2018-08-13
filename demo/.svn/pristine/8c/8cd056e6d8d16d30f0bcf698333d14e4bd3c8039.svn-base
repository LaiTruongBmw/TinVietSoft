using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using NativeExcel;


public partial class rpt_hrpm00700_10 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_dept, p_group, p_status, p_type, p_pay_type, p_emp_id, p_work_mon, p_m_type, p_emp_type, p_nation;

        p_dept = Request["l_dept"].ToString();
        p_group = Request["l_group"].ToString();
        p_status = Request["l_status"].ToString();
        p_type = Request["l_type"].ToString();
        p_pay_type = Request["l_pay_type"].ToString();
        p_emp_id = Request["l_emp_id"].ToString();
        p_work_mon = Request["l_work_mon"].ToString();
        p_m_type = Request.QueryString["l_m_type"].ToString();
        p_emp_type = Request["l_Emp_Type"].ToString();
        p_nation = "ALL";//Request.QueryString["l_nation"].ToString();

        if (p_type == "ALL")
            p_type = "=nvl(s.net_amt,0)";

        string TemplateFile = "rpt_hrpm00700_10.xls";
        string TempFile = "../../../../system/temp/rpt_hrpm00700_10_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];
        IRange range;
        DataTable myDT;

        myDT = new DataTable();
        string SQL = "SELECT S.FULL_NAME,S.EMP_ID,decode(nvl(S.salary_si,0),0,nvl(s.salary_level2,0),nvl(S.salary_si,0)) " +
                ",NVL(S.SOCIAL_AMT,0) AS SOCIAL_3 " +
                ",NVL(S.UNEMP_INS,0) AS unemp_wor_5  " +
                ",NVL(S.HEALTH_AMT,0) AS HEALTH_4  " +
                ",NVL(S.SOCIAL_AMT,0)+NVL(S.HEALTH_AMT,0)+NVL(S.UNEMP_INS,0) AS tt6  " +
                ",NVL(S.SOCIAL_COMPANY,0)+NVL(S.SOCIAL_COM_NET,0) AS SOCIAL_COM_7 " +
                ",NVL(S.UNEMP_COM_INS,0) AS unemp_COM_8 " +
                ",NVL(S.HEALTH_COMPANY,0)+NVL(S.HEALTH_COM_NET,0) AS HEALTH_COM_9  " +
                ",NVL(S.HEALTH_COMPANY,0)+NVL(S.HEALTH_COM_NET,0)+NVL(S.SOCIAL_COMPANY,0)+NVL(S.SOCIAL_COM_NET,0)+NVL(S.UNEMP_COM_INS,0) AS tt10  " +
                ",NVL(S.HEALTH_COMPANY,0)+NVL(S.HEALTH_COM_NET,0)+NVL(S.SOCIAL_COMPANY,0)+NVL(S.SOCIAL_COM_NET,0)+NVL(S.UNEMP_COM_INS,0) +  " +
                " NVL(S.SOCIAL_AMT,0)+NVL(S.HEALTH_AMT,0)+NVL(S.UNEMP_INS,0) AS gran_tt11  " +
                " ,to_char(to_date('" + p_work_mon + "','yyyymm'),'MM-YYYY') as wm_12 " +
                " from thr_month_salary S, thr_employee a " +
                " where S.del_if=0 and a.del_if=0 and s.thr_emp_pk=a.pk and S.work_mon='" + p_work_mon + "' " +
                " and (a.tco_org_pk in ( " +
                "                              SELECT     g.pk " +
                "                                    FROM tco_org g " +
                "                                   WHERE g.del_if = 0 " +
                "                              START WITH g.pk = " +
                "                                            DECODE ('" + p_dept + "', " +
                "                                                    'ALL', 0, " +
                "                                                    '" + p_dept + "' " +
                "                                                   ) " +
                "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
                "                        OR '" + p_dept + "' = 'ALL') " +
                " and decode('" + p_group + "','ALL','ALL',a.thr_wg_pk)='" + p_group + "'" +
                " and S.emp_id like '%" + p_emp_id + "%' " +
                " and decode('" + p_status + "','ALL','ALL',S.status)='" + p_status + "'" +
                " and decode('" + p_pay_type + "','ALL','ALL',S.pay_type)='" + p_pay_type + "'" +
                " and decode('" + p_m_type + "','ALL','ALL',S.MONEY_KIND)='" + p_m_type + "'" +
                " and decode('" + p_emp_type + "','ALL','ALL',s.EMPLOYEE_TYPE)='" + p_emp_type + "'" +
                " and decode('" + p_nation + "','ALL','ALL',s.Nation)='" + p_nation + "'" +
                " and nvl(S.HEALTH_AMT,0)+nvl(S.HEALTH_COM_NET,0)+NVL(S.SOCIAL_AMT,0)+NVL(S.SOCIAL_COM_NET,0) > 0 " +
                " and nvl(s.net_amt,0) " + p_type +
                " order by S.emp_id";

        //Response.Write(SQL);
        //Response.End();
        DataTable data = CtlLib.TableReadOpen(SQL);
        if (data.Rows.Count == 0)
        {
            Response.Write("There is no data");
            Response.End();
        }

        string sql_rate1 = "SELECT NVL(A.NUM_4,0),NVL(A.NUM_5,0),TO_NUMBER(NVL(A.CHAR_2,0)),TO_NUMBER(NVL(A.CHAR_3,0)) " +
            " FROM VHR_HR_CODE A " +
            " WHERE A.ID='HR0043' AND A.CHAR_1=SUBSTR('" + p_work_mon + "',1,4)";
        DataTable data_1 = CtlLib.TableReadOpen(sql_rate1);
        string r_social = "", r_health = "", r_unemp = "";
        string r_social_c = "", r_health_c = "", r_unemp_c = "";
        

        r_social = data_1.Rows[0][1].ToString();
        r_health = data_1.Rows[0][0].ToString();
        r_social_c = data_1.Rows[0][3].ToString();
        r_health_c = data_1.Rows[0][2].ToString();


        string sql_rate2 = "SELECT NVL(A.NUM_2,0),NVL(A.NUM_3,0) " +
                " FROM VHR_HR_CODE A " +
                " WHERE A.ID='HR0067' AND A.CHAR_1=SUBSTR('" + p_work_mon + "',1,4)";
        DataTable data_2 = CtlLib.TableReadOpen(sql_rate2);
        

        r_unemp = data_2.Rows[0][0].ToString();
        r_unemp_c = data_2.Rows[0][1].ToString();

        exSheet.Range["A2"].Value = string.Format("MONTH : {0}", data.Rows[0][12].ToString());
        exSheet.Cells["E5"].Value = string.Format("Social {0}% (Worker)", r_social);
        exSheet.Cells["F5"].Value = string.Format("UI {0}% (Worker)", r_unemp);
        exSheet.Cells["G5"].Value = string.Format("Health {0}% (Worker)", r_health);
        exSheet.Cells["H5"].Value = string.Format("Total Ins {0}% (Worker)", double.Parse(r_social) + double.Parse(r_health) + double.Parse(r_unemp));
        exSheet.Cells["I5"].Value = string.Format("Social {0}% (Company)", r_social_c);
        exSheet.Cells["J5"].Value = string.Format("UI {0}% (Company)", r_unemp_c);
        exSheet.Cells["K5"].Value = string.Format("Health {0}% (Company)", r_health_c);
        exSheet.Cells["L5"].Value = string.Format("Total Ins {0}% (Company)", double.Parse(r_social_c) + double.Parse(r_health_c) + double.Parse(r_unemp_c));

        int s_row = 6, s_col = 2;
        double[] total = new double[10];

        for (int j = 0; j < total.Length; j++)
        {
            total[j] = 0;
        }

        for (int i = 0; i < data.Rows.Count; i++)
        {
            exSheet.Cells["A" + s_row].Value = i + 1;
            s_col = 2;
            for (int j = 0; j < data.Columns.Count - 1; j++)
            {
                if (j < 2)
                    exSheet.Cells[s_row, s_col].Value = data.Rows[i][j].ToString();
                else
                {
                    total[j - 2] += double.Parse(data.Rows[i][j].ToString());
                    exSheet.Cells[s_row, s_col].Value = double.Parse(data.Rows[i][j].ToString());
                }
                s_col++;
            }

            s_row++;

            if (i < data.Rows.Count - 1)
            {
                exSheet.Range["A" + s_row].Rows.EntireRow.Insert();
            }
        }

        exSheet.Cells["D" + s_row].Value = total[0];
        exSheet.Cells["E" + s_row].Value = total[1];
        exSheet.Cells["F" + s_row].Value = total[2];
        exSheet.Cells["G" + s_row].Value = total[3];
        exSheet.Cells["H" + s_row].Value = total[4];
        exSheet.Cells["I" + s_row].Value = total[5];
        exSheet.Cells["J" + s_row].Value = total[6];
        exSheet.Cells["K" + s_row].Value = total[7];
        exSheet.Cells["L" + s_row].Value = total[8];
        exSheet.Cells["M" + s_row].Value = total[9];

        exBook.SaveAs(TempFile);
        //CtlLib.ExcelToPdf(TempFile);
        string pdfFilePath = TempFile.Replace(".xls", ".pdf");
        //write out to client broswer
        System.IO.FileInfo file = new System.IO.FileInfo(TempFile);
        //System.IO.FileInfo file = new System.IO.FileInfo(pdfFilePath);
        Response.Clear();
        Response.Charset = "UTF-8";
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        //Add header, give a default file name for "File Download/Store as"
        Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode(file.Name));
        //Add header, set file size to enable browser display download progress
        Response.AddHeader("Content-Length", file.Length.ToString());
        //Set the return string is unavailable reading for client, and must be downloaded
        Response.ContentType = "application/ms-exSheet";
        //Response.ContentType = "application/pdf";
        //Send file string to client 
        Response.WriteFile(TempFile);
        //Response.WriteFile(pdfFilePath);
        //Stop execute  
        Response.End();
    }
}