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

public partial class rpt_hrpm00300_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_dept, p_group, p_status, pos, lsttmp, p_input, dtyear, fromjoin, tojoin, lstmoney, contract;

        p_dept = Request["org"].ToString();
        p_group = Request["wg"].ToString();
        p_status = Request["status"].ToString();
        pos = Request["pos"].ToString();
        p_input = Request["txttmp"].ToString();
        dtyear = Request["dtyear"].ToString();
        fromjoin = Request["fromjoin"].ToString();
        tojoin = Request["tojoin"].ToString();
        lstmoney = Request["lstmoney"].ToString();
        contract = Request["contract"].ToString();
		
        //string p_m_type = Request.QueryString["l_m_type"].ToString();

       // if (p_type == "ALL")
        //    p_type = ">-999999999";


        string TemplateFile = "rpt_hrpm00300_2.xls";
        string TempFile = "../../../../system/temp/rpt_hrpm00300_2_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
		IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

		//Add worksheet
		IWorksheet exSheet = exBook.Worksheets[1];
		IRange range;

		DataTable myDT = new DataTable();
		DataTable dt_Com = new DataTable();

      
	   string SQL_Com
		= " select  a.PARTNER_LNAME c1,a.ADDR1 c2,a.PHONE_NO c3,a.TCO_BPPHOTO_PK c4,to_char(to_date('" + dtyear + "','yyyy'),'YYYY') c5,to_char(to_date('" + dtyear + "','yyyy'),'YYYY') c6" +
			" from tco_company a " +
			" where a.DEL_IF=0 " +
			" and a.pk in ( select tco_company_pk from  " +
			"               tco_org  f " +
			"               where  f.pk IN ( " +
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
			" and rownum=1 ";
		//Response.Write(SQL_Com);
		//Response.End();
		dt_Com = CtlLib.TableReadOpen(SQL_Com);
		int irow_com;
		irow_com = dt_Com.Rows.Count;
		if (irow_com == 0)
		{
			Response.Write("There is no data of company");
			Response.End();
		}
	//	int pk = int.Parse(dt_Com.Rows[0][3].ToString());


        string SQL
        = "SELECT   b.org_nm, c.workgroup_nm, a.emp_id, a.full_name, " +
            "               TO_CHAR (TO_DATE (a.join_dt, 'yyyymmdd'), 'dd-mm-yyyy'), " +
            "               pos.code_FNM, d.code_nm " +
            " ,nvl(e.m01,0) " +
               " ,nvl(e.m01_2,0) " +
               " ,nvl(e.m02,0) " +
               " ,nvl(e.m02_2,0) " +
               " ,nvl(e.m03,0) " +
               "  ,nvl(e.m03_2,0) " +
                " ,nvl(e.m04,0) " +
                " ,nvl(e.m04_2,0) " +
                " ,nvl(e.m05,0) " +
                " ,nvl(e.m05_2,0) " +
                " ,nvl(e.m06,0) " +
                " ,nvl(e.m06_2,0) " +
                " ,nvl(e.m07,0) " +
                " ,nvl(e.m07_2,0) " +
                " ,nvl(e.m08,0) " +
                " ,nvl(e.m08_2,0) " +
                " ,nvl(e.m09,0) " +
                " ,nvl(e.m09_2,0) " +
                " ,nvl(e.m10,0) " +
                " ,nvl(e.m10_2,0) " +
                " ,nvl(e.m11,0) " +
                " ,nvl(e.m11_2,0) " +
                " ,nvl(e.m12,0) " +
                " ,nvl(e.m12_2,0)" +
            "          FROM thr_employee a, " +
            "               tco_org b, " +
            "               thr_work_group c, " +
            "               (select thr_emp_pk ,  " +
         " sum(decode(substr(work_mon,5,2),'01',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) > (select E.FROM_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '01')  then  salary_level1  else 0 end,0)) as m01, " +
         " sum(decode(substr(work_mon,5,2),'02',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) > (select E.FROM_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '02')  then salary_level1  else 0 end,0)) as m02, " +
         " sum(decode(substr(work_mon,5,2),'03',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) > (select E.FROM_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '03')  then salary_level1  else 0 end,0)) as m03, " +
         " sum(decode(substr(work_mon,5,2),'04',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) > (select E.FROM_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '04')  then salary_level1  else 0 end,0)) as m04, " +
         " sum(decode(substr(work_mon,5,2),'05',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) > (select E.FROM_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '05')  then salary_level1  else 0 end,0)) as m05, " +
         " sum(decode(substr(work_mon,5,2),'06',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) > (select E.FROM_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '06')  then salary_level1  else 0 end,0)) as m06, " +
         " sum(decode(substr(work_mon,5,2),'07',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) > (select E.FROM_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '07')  then salary_level1  else 0 end,0)) as m07, " +
         " sum(decode(substr(work_mon,5,2),'08',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) > (select E.FROM_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '08')  then salary_level1  else 0 end,0)) as m08, " +
         " sum(decode(substr(work_mon,5,2),'09',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) > (select E.FROM_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '09')  then salary_level1  else 0 end,0)) as m09, " +
         " sum(decode(substr(work_mon,5,2),'10',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) > (select E.FROM_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '10')  then salary_level1  else 0 end,0)) as m10, " +
         " sum(decode(substr(work_mon,5,2),'11',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) > (select E.FROM_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '11')  then salary_level1  else 0 end,0)) as m11, " +
         " sum(decode(substr(work_mon,5,2),'12',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) > (select E.FROM_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '12')  then salary_level1  else 0 end,0)) as m12,     " +
         " sum(decode(substr(work_mon,5,2),'01',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) <= (select E.TO_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '01')  then salary_level2 else 0 end,0)) as m01_2, " +
         " sum(decode(substr(work_mon,5,2),'02',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) <= (select E.TO_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '02')  then salary_level2 else 0 end,0)) as m02_2, " +
         " sum(decode(substr(work_mon,5,2),'03',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) <= (select E.TO_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '03')  then salary_level2 else 0 end,0)) as  m03_2, " +
         " sum(decode(substr(work_mon,5,2),'04',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) <= (select E.TO_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '04')  then salary_level2 else 0 end,0)) as m04_2, " +
         " sum(decode(substr(work_mon,5,2),'05',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) <= (select E.TO_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '05')  then salary_level2 else 0 end,0)) as m05_2, " +
         " sum(decode(substr(work_mon,5,2),'06',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) <= (select E.TO_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '06')  then salary_level2 else 0 end,0)) as m06_2, " +
         " sum(decode(substr(work_mon,5,2),'07',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) <= (select E.TO_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '07')  then salary_level2 else 0 end,0)) as m07_2, " +
         " sum(decode(substr(work_mon,5,2),'08',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) <= (select E.TO_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '08')  then salary_level2 else 0 end,0)) as m08_2, " +
         " sum(decode(substr(work_mon,5,2),'09',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) <= (select E.TO_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '09')  then salary_level2 else 0 end,0)) as m09_2, " +
         " sum(decode(substr(work_mon,5,2),'10',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) <= (select E.TO_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '10')  then salary_level2 else 0 end,0)) as m10_2, " +
         " sum(decode(substr(work_mon,5,2),'11',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) <= (select E.TO_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '11')  then salary_level2 else 0 end,0)) as m11_2, " +
         " sum(decode(substr(work_mon,5,2),'12',case when nvl(confirm_dt,' ')=' ' or substr(confirm_dt,1,8) <= (select E.TO_DT from thr_close e where e.del_if =0 and substr(E.MONTH_CLOSE,1,4)='" + dtyear + "' and substr(E.MONTH_CLOSE,5,2)= '12')  then salary_level2 else 0 end,0)) as m12_2 " +
            "               from thr_salary_manage " +
            "               where del_if=0 and substr(work_mon,1,4)='" + dtyear + "' " +
            "               group by thr_emp_pk " +
            "               ) e, " +
            "               (SELECT code, code_nm " +
            "                  FROM vhr_hr_code " +
            "                 WHERE ID = 'HR0001') d " +
            "               , " +
            "               (SELECT vh.code, vh.code_fnm " +
            "                  FROM vhr_hr_code vh " +
            "                 WHERE vh.ID = 'HR0008') pos " +
            "         WHERE a.del_if = 0 " +
            "           AND b.del_if = 0 " +
            "           AND c.del_if = 0 " +
            "           AND a.thr_wg_pk = c.pk " +
            "           AND a.tco_org_pk = b.pk " +
            "           AND e.thr_emp_pk = a.pk " +
            "           AND a.contract_type = d.code(+) " +
            "           and pos.code(+)=a.POS_TYPE " +
            " AND DECODE ('" + p_group + "', 'ALL', '" + p_group + "', a.thr_wg_pk) ='" + p_group + "'" +
            "           AND (   a.tco_org_pk IN ( " +
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
            "           AND DECODE ('" + pos + "', 'ALL', '" + pos + "', a.pos_type) = '" + pos + "' " +
            "      AND DECODE ('" + p_status + "', 'ALL', '" + p_status + "', a.status) = '" + p_status + "' " +
            "           AND DECODE ('" + contract + "', " +
            "                       'ALL', '" + contract + "', " +
            "                       a.contract_type " +
            "                      ) = '" + contract + "' " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            "           AND (   '" + fromjoin + "' IS NULL " +
            "                OR '" + tojoin + "' IS NULL " +
            "                OR a.join_dt BETWEEN '" + fromjoin + "' AND '" + tojoin + "' " +
            "               ) " +
            "   AND DECODE('" + lstmoney + "','ALL','" + lstmoney + "',A.MONEY_KIND)='" + lstmoney + "'" +
             "      ORDER BY NVL(B.SEQ,0),B.org_nm, C.workgroup_nm, A.emp_id ";
    

		//Response.Write(SQL);
		//Response.End();
	  
		myDT = CtlLib.TableReadOpen(SQL);
		
		if (myDT.Rows.Count <= 0)
		{
			Response.Write("There is no data !!!");
			Response.End();
		}
       
		         
		exSheet.Cells["B1"].Value = dt_Com.Rows[0]["c1"].ToString();
		exSheet.Cells["B2"].Value = dt_Com.Rows[0][1].ToString();
		exSheet.Cells["B3"].Value =  dt_Com.Rows[0]["c3"].ToString();
		exSheet.Cells["G1"].Value="SALARY SUMMARY IN THE YEAR " + int.Parse(dt_Com.Rows[0]["c5"].ToString()) ;
		exSheet.Cells["H2"].Value=" TỔNG HỢP LƯƠNG NĂM " +  int.Parse(dt_Com.Rows[0]["c5"].ToString()) ;

         int l_row = myDT.Rows.Count;
         int l_col = myDT.Columns.Count;
		 int k;

         double[] grant_total = new double[l_col+1];
         int l_pos = 6;

         for ( k = 0; k < l_col+1; k++)
         {
             grant_total[k] = 0;
         }


         for (int i = 0; i < l_row - 1; i++)
         {

             exSheet.Range[l_pos + i + 1, l_col].Rows.EntireRow.Insert();//insert dong moi 
         }
        
         for (int i = 0; i < l_row; i++)
         {

             exSheet.Cells[l_pos + i, 1].Value = i + 1;
             for (int j = 1; j < 32; j++)
             {
				 
                if (j<= 7)
				{
					 exSheet.Cells[l_pos + i, j + 1].Value = myDT.Rows[i][j - 1].ToString();
				}
				else 
				{
					 grant_total[j] += Double.Parse(myDT.Rows[i][j-1].ToString());
					 exSheet.Cells[l_pos + i, j + 1].Value =float.Parse(myDT.Rows[i][j - 1].ToString());
				}
					                     
             }
			 if (i== l_row-1)
			 {
				exSheet.Cells[l_pos + i + 1, 1].Value = "Total: " + myDT.Rows.Count + " Employee(s)";
                for (k = 9; k < 32; k++)
                    exSheet.Cells[l_pos + i + 1,k ].Value = grant_total[k-1];
	
			 }

             //  exSheet.Range["A" + l_dong + ":K" + l_dong].Rows.Borders[XlBordersIndex.xlInsideAll].LineStyle = XlLineStyle.xlContinuous;


         }
         //grand total
		 
        
		


        // exSheet.Range["A" + (l_pos - 1) + ":AQ" + (l_pos - 1)].Rows.Borders[XlBordersIndex.xlAround].LineStyle = XlLineStyle.xlContinuous;
         //exSheet.Range["A" + (l_pos + l_row) + ":AQ" + (l_pos + l_row)].Rows.Borders[XlBordersIndex.xlAround].LineStyle = XlLineStyle.xlContinuous;


        
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
