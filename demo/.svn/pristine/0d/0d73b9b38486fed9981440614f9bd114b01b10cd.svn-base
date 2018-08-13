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


public partial class rpt_hris00600_0 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
        //CtlLib.SetUser("hr");
        string p_mon = Request["p_mon"].ToString();
        string p_reg_type = Request.QueryString["p_reg_type"].ToString();
        string p_org_pk = Request.QueryString["p_org"].ToString();

        string TemplateFile = "rpt_hris00600_0.xls";
        string TempFile = "../../../system/temp/rpt_hris00600_0_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        string SQL
        = "select code,v.CODE_NM " +
        "from vhr_hr_code v " +
        "where v.ID='HR0049' and nvl(v.tco_company_pk,'" + p_org_pk + "')=" + "(select a.tco_company_pk from tco_org a where a.del_if=0 and a.pk='" + p_org_pk  + "')";
        //Response.Write(SQL);
        //Response.End();
        DataTable dt_com = CtlLib.TableReadOpen(SQL);

        SQL
        = "  SELECT UPPER((select F.CODE_FNM from vhr_hr_code f where F.ID = 'HR0054' and F.CODE = V.CHAR_5)) title ,v.CODE_NM, " +
        "         ti.FULL_NAME,  " +
        "         case when E.SEX = 'M' then substr(E.BIRTH_DT,1,4) else '' end BIRTH_DT_M,  " +
        "         case when E.SEX = 'F' then substr(E.BIRTH_DT,1,4) else '' end BIRTH_DT_F,  " +
        "         ti.SOCIAL_NO,  " +
        "         (case when TI.INS_REG_TYPE='02' and TI.DETAIL_INS_REG_TYPE='07' then (CASE WHEN ti.ST_SOCIAL_DT IS NOT NULL THEN (case when months_between(TO_DATE (ti.INS_MONTH, 'yyyymm'),TO_DATE (ti.ST_SOCIAL_DT, 'yyyymm')) >12 then '0-12' " +
        "                                                                                                                                else 0 || '-'||months_between(TO_DATE (ti.INS_MONTH, 'yyyymm'),TO_DATE (ti.ST_SOCIAL_DT, 'yyyymm')) end) ELSE NULL END)  " +
        "                    else (CASE WHEN ti.ST_SOCIAL_DT IS NOT NULL THEN TRUNC(months_between(TO_DATE (ti.INS_MONTH, 'yyyymm'),TO_DATE (ti.ST_SOCIAL_DT, 'yyyymm')) / 12) ||'-' || MOD(months_between(TO_DATE (ti.INS_MONTH, 'yyyymm'),TO_DATE (ti.ST_SOCIAL_DT, 'yyyymm')),12) ELSE NULL END)  " +
        "           end)  tg_thamgia, " +
        "         ROUND (NVL (ti.AVERAGE_SALARY, 0), 0),  " +
        "         ti.CONDITION,  " +
        "         ti.THOI_DIEM,  " +
        "         TO_CHAR (TO_DATE (ti.FROM_DT, 'yyyymmdd'), 'dd/mm/yyyy') from_dt,  " +
        "         TO_CHAR (TO_DATE (ti.TO_DT, 'yyyymmdd'), 'dd/mm/yyyy') to_dt,  " +
        "         ROUND (NVL (ti.DAYS, 0), 2),  " +
        "         ROUND (NVL (ti.PROGRESSIVE, 0), 0),  " +
        "         ROUND (ti.INS_AMT, -2),'',  " +
        "         e.emp_id  " +
        "    FROM THR_INS_REGULATION ti, vhr_hr_code v, thr_employee e  " +
        "   WHERE     ti.DEL_IF = 0  " +
        "         AND e.del_if = 0  " +
        "         AND e.pk = ti.thr_emp_pk  " +
        "         AND ti.DEL_IF = 0  " +
        "         AND ti.INS_MONTH = '" + p_mon + "'  " +
        "         and decode('" + p_reg_type + "','ALL','ALL',ti.INS_REG_TYPE)='" + p_reg_type + "' " +
        "         AND v.ID = 'HR0055'  " +
        "         AND v.CODE = ti.DETAIL_INS_REG_TYPE  " +
        "ORDER BY ( (SELECT F.CODE " +
        "                    FROM vhr_hr_code f " +
        "                   WHERE F.ID = 'HR0054' AND F.CODE = V.CHAR_5)), NVL (v.num_1, 0),  " +
        "         v.code_nm,  " +
        "         e.emp_id,ti.FULL_NAME,  " +
        "         ti.from_dt  ";


        DataTable dt_emp = CtlLib.TableReadOpen(SQL);
        int irow = dt_emp.Rows.Count;
        int icol = dt_emp.Columns.Count;
        //Response.Write(SQL);
        //Response.End();

        if (dt_emp.Rows.Count == 0)
        {
            Response.Write("There is no data to show");
            Response.End();
        }

       
        //Khai bao bien
        int i, j = 0, k = 0, pos = 20;
        int count = 0;
        string[] atype = new string[] { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K" };
        string[] btype = new string[] { "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI" };
        Double total_day = 0, total_prog = 0, total_amt = 0, grand_total = 0;
        int a = 0, b = 0;
        string quy = "";
        int month;

        //Insert new row
        for (i = 0; i < irow - 1; i++)
        {
            if (dt_emp.Rows[i][0].ToString() != dt_emp.Rows[i + 1][0].ToString())
                a++;
            if (dt_emp.Rows[i][1].ToString() != dt_emp.Rows[i + 1][1].ToString())
                b++;
        }

        for (i = 0; i < irow + a + b; i++)
        {
            exSheet.Range[pos + 1, 1].Rows.EntireRow.Insert();
        }

        month = int.Parse(p_mon.Substring(4, 2).ToString());

        if (month >= 1 && month <= 3)
            quy = "01";
        else if (month >= 4 && month <= 6)
            quy = "02";
        else if (month >= 7 && month <= 9)
            quy = "03";
        else
            quy = "04";

        exSheet.Cells["A1"].Value = "Tên cơ quan (đơn vị): " + dt_com.Rows[0][1].ToString();
        exSheet.Cells["A2"].Value = "Mã đơn vị: " + dt_com.Rows[1][1].ToString();
        exSheet.Cells["A3"].Value = "Điện thoại: " + dt_com.Rows[12][1].ToString();
        exSheet.Cells["A6"].Value = "Tháng " + p_mon.Substring(4, 2).ToString() + " quý " + quy + " năm " + p_mon.Substring(0, 4).ToString();
        exSheet.Cells["A7"].Value = "Số hiệu tài khoản: " + dt_com.Rows[8][1].ToString() + " mở tại: " + dt_com.Rows[9][1].ToString();

        //Show data
        for (i = 0; i < irow; i++)
        {
            //total_day = total_day + Double.Parse(dt_emp.Rows[i][12].ToString());
            //total_prog = total_prog + Double.Parse(dt_emp.Rows[i][13].ToString());
            total_amt = total_amt + Double.Parse(dt_emp.Rows[i][14].ToString());
            grand_total = grand_total + Double.Parse(dt_emp.Rows[i][14].ToString());
            //Dong dau tien
            if (i == 0)
            {
                exSheet.Cells[pos + i - 2, 1].Value = atype[j].ToString();
                exSheet.Cells[pos + i - 1, 1].Value = btype[k].ToString();
                exSheet.Cells[pos + i - 2, 2].Value = dt_emp.Rows[i][0].ToString();
                exSheet.Cells[pos + i - 1, 2].Value = dt_emp.Rows[i][1].ToString();
                k++;
            }

            count++;
            exSheet.Cells[pos + i, 1].Value = count;

            for (int col = 2; col < icol; col++)
            {
                if (col == 7 || (col >= 12 && col <= 14))
                    exSheet.Cells[pos + i, col].Value = Double.Parse(dt_emp.Rows[i][col].ToString());
                else
                    exSheet.Cells[pos + i, col].Value = dt_emp.Rows[i][col].ToString();
            }

            if (i == irow - 1)  //Dong cuoi cung
            {
                exSheet.Cells[pos + i + 1, 2].Value = "Tổng cộng ";
                //exSheet.Cells[pos + i + 1, 13].Value = total_day;
                //exSheet.Cells[pos + i + 1, 14].Value = total_prog;
                exSheet.Cells[pos + i + 1, 14].Value = total_amt;
                exSheet.Cells[pos + i + 1, 1, pos + i + 1, 15].Rows.Font.Bold = true;
                pos = pos + 1;

                total_day = 0;
                total_prog = 0;
                total_amt = 0;
            }
            else
            {
                if (dt_emp.Rows[i][0].ToString() != dt_emp.Rows[i + 1][0].ToString())
                {
                    exSheet.Cells[pos + i + 1, 2].Value = "Tổng cộng ";
                    //exSheet.Cells[pos + i + 1, 13].Value = total_day;
                    //exSheet.Cells[pos + i + 1, 14].Value = total_prog;
                    exSheet.Cells[pos + i + 1, 14].Value = total_amt;
                    exSheet.Cells[pos + i + 1, 1, pos + i + 1, 15].Rows.Font.Bold = true;


                    j++;
                    exSheet.Cells[pos + i + 2, 1].Value = atype[j].ToString();
                    exSheet.Cells[pos + i + 2, 2].Value = dt_emp.Rows[i + 1][0].ToString();
                    exSheet.Cells[pos + i + 2, 1, pos + i + 1, 11].Rows.Font.Bold = true;
                    pos = pos + 2;

                    k = 0;
                    count = 0;
                    total_day = 0;
                    total_prog = 0;
                    total_amt = 0;
                }

                if (dt_emp.Rows[i][1].ToString() != dt_emp.Rows[i + 1][1].ToString())
                {

                    exSheet.Cells[pos + i + 1, 1].Value = btype[k].ToString();
                    exSheet.Cells[pos + i + 1, 2].Value = dt_emp.Rows[i + 1][1].ToString();
                    exSheet.Cells[pos + i + 1, 1, pos + i + 1, 11].Rows.Font.Bold = true;
                    pos = pos + 1;
                    k++;
                    count = 0;
                }
            }
        }

        pos = 20 + irow + a + b + 20;  //cộng thêm phần điều chỉnh
        exSheet.Cells["F" + (pos + 3)].Value = grand_total;
        exSheet.Cells["C" + (pos + 6)].Value = "(" + string.Format("Viết bằng chữ: {0}", CommondLib.Num2VNText(grand_total.ToString(), "VND")) + ")";

        exSheet.Cells["K" + (pos + 8)].Value = string.Format("Ngày {0} tháng {1} năm {2}", DateTime.Now.Day, DateTime.Now.Month, DateTime.Now.Year);

        exSheet.Cells["a" + (pos + 15)].Value = dt_com.Rows[5][1].ToString();
        exSheet.Cells["g" + (pos + 15)].Value = dt_com.Rows[6][1].ToString();
        exSheet.Cells["k" + (pos + 15)].Value = dt_com.Rows[7][1].ToString();

        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }


        // hide row firts 

        //range = exSheet.Range["A1"];
        // hide row A5 
        //range.Rows.Hidden = true;

        exBook.SaveAs(TempFile);
        //CtlLib.ExcelToPdf(TempFile);
        //string pdfFilePath = TempFile.Replace(".xls", ".pdf");

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