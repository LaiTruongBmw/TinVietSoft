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
using System.Text.RegularExpressions;

public partial class rpt_hrem00201_0 : System.Web.UI.Page
{
     int pic = 1000;
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string TemplateFile = "rpt_hrem00201_0.xls";
        string TempFile = "../../../../system/temp/rpt_hrem00201_0_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        string p_tco_org_pk, p_nation, p_emp_search, p_select_date, p_from_date, p_to_date, p_status, p_salary_yn, p_position;
        string p_user, p_sal_security;
        string p_data, p_lang;

        p_user = Request["p_user"].ToString();
        p_tco_org_pk = Request["p_tco_org_pk"].ToString();
        p_nation = Request["p_nation"].ToString();
        p_emp_search = Request["p_emp_search"].ToString();
        p_select_date = Request["p_select_date"].ToString();
        p_from_date = Request["p_from_date"].ToString();
        p_to_date = Request["p_to_date"].ToString();
        p_salary_yn = Request["p_salary_yn"].ToString();
        p_position = Request["p_position"].ToString();
        p_status = Request["p_status"].ToString();
        p_sal_security = Request["p_sal_security"].ToString();
        p_data = Request["p_data"].ToString();
        p_lang = Request["p_lang"].ToString();

        string SQL
        = "select E.COLUMN_NUM,E.TITLE_NM,E.TITLE_FIELD,E.TITLE_FNM,E.TITLE_FIELD_FNM " +
            "from thr_title_emp e " +
            "where del_if = 0 ";

        DataTable dt_data = CtlLib.TableReadOpen(SQL);

        DataTable dt_allow = CtlLib.TableReadOpenCursor("ST_HR_RPT_HREM00201_0");

        int i, j, k, l;
        //int pic;
        
        int[] pos_allow = new int[8];
        string[] allow_nm = new string[8];
        string[] allow_fnm = new string[8];
        string[] p = p_data.Split('|');
        //Response.Write(p_field);
        string s_field="";
        string s_name = "";

        

            //Response.Write(p[k].ToString() + " -- " + k.ToString() +" /n ");
        for ( l = 0; l < p.Length; l++)
        {
            for (k = 0; k < dt_data.Rows.Count; k++)
            {
 /*               if (int.Parse(p[l].ToString()) == allow && allow < 54)
                {
                    pos_allow[k] = l + 2;  //ghi nhan lai vi tri column cua Allowance

                    
                }
                */
                if (p[l].ToString() == dt_data.Rows[k][0].ToString())
                {
                    //Response.Write(p[l].ToString());
                    if (p_lang == "ENG")
                    {
                        s_field = s_field + dt_data.Rows[k][2].ToString() + ",";

                        if (int.Parse(p[l].ToString()) == 46)
                            s_name = s_name + dt_allow.Rows[0][0].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 47)
                            s_name = s_name + dt_allow.Rows[0][1].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 48)
                            s_name = s_name + dt_allow.Rows[0][2].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 49)
                            s_name = s_name + dt_allow.Rows[0][3].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 50)
                            s_name = s_name + dt_allow.Rows[0][4].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 51)
                            s_name = s_name + dt_allow.Rows[0][5].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 52)
                            s_name = s_name + dt_allow.Rows[0][6].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 53)
                            s_name = s_name + dt_allow.Rows[0][7].ToString() + "|";
                        else
                            s_name = s_name + dt_data.Rows[k][1].ToString() + "|";

                        if (dt_data.Rows[k][0].ToString() == "86")  //picture
                            pic = l;    //lay vi tri cua hinh
                    }
                    else
                    {
                        s_field = s_field + dt_data.Rows[k][4].ToString() + ",";

                        if (int.Parse(p[l].ToString()) == 46)
                            s_name = s_name + dt_allow.Rows[0][16].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 47)
                            s_name = s_name + dt_allow.Rows[0][17].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 48)
                            s_name = s_name + dt_allow.Rows[0][18].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 49)
                            s_name = s_name + dt_allow.Rows[0][19].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 50)
                            s_name = s_name + dt_allow.Rows[0][20].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 51)
                            s_name = s_name + dt_allow.Rows[0][21].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 52)
                            s_name = s_name + dt_allow.Rows[0][22].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 53)
                            s_name = s_name + dt_allow.Rows[0][23].ToString() + "|";
                        else
                            s_name = s_name + dt_data.Rows[k][3].ToString() + "|";

                        if (dt_data.Rows[k][0].ToString() == "86")  //picture
                            pic = l;    //lay vi tri cua hinh
                    }
                }

            }
        }
        //Response.Write(pic);
        //Response.Write(s_name);
        //Response.End();
        s_field = s_field.Substring(0, s_field.Length - 1);
        SQL = " select  " + s_field ;
        SQL = SQL + " from thr_employee a, tco_org c,thr_work_group d,THR_F_PASSPORT p,THR_F_LABOUR_LICENCE l,THR_F_VISA f, thr_f_residence g, TAC_ABPL pl, thr_family fa, thr_family fa1,  ";
		SQL = SQL + "(SELECT edu1.thr_emp_pk,edu1.E_NAME, edu1.Major, edu1.graduate_year " + 
        "             FROM thr_emp_edu edu1,(SELECT edu2.THR_EMP_PK ,MAX (graduate_year) AS graduate_year from thr_emp_edu edu2 where edu2.del_if = 0 group by edu2.THR_EMP_PK ) edu_mas         " +
        "             where edu1.del_if = 0 and edu_mas.THR_EMP_PK = edu1.THR_EMP_PK and  edu_mas.graduate_year = edu1.graduate_year  " +
        "             )edu   " ;
        SQL = SQL + "         ,(select G.THR_EMPLOYEE_PK emp_pk,G.COM_NM com_nm, G.DUTIES duties,g.start_dt ,g.end_dt,HR_F_GET_PERIOD_PCSS(g.THR_EMPLOYEE_PK) period ";
        SQL = SQL + "            from thr_experience g, ";
        SQL = SQL + "            (select F.THR_EMPLOYEE_PK emp_pk, max(f.END_DT) end_dt ";
        SQL = SQL + "            from thr_experience f ";
        SQL = SQL + "            where f.del_if = 0  ";
        SQL = SQL + "            group by F.THR_EMPLOYEE_PK) h ";
        SQL = SQL + "            where G.DEL_IF = 0 and G.THR_EMPLOYEE_PK = h.emp_pk ";
        SQL = SQL + "            and G.END_DT = h.end_dt) i         ";
        SQL = SQL + "where a.del_if=0   and c.del_if=0 and d.del_if=0 and fa.del_if(+) = 0 and fa1.del_if(+) = 0 ";
		SQL = SQL + "and edu.thr_emp_pk(+) =a.pk  ";
        SQL = SQL + "and a.tco_org_pk=c.pk and a.thr_wg_pk=d.pk and pl.pk(+)=a.TAC_ABPL_PK and A.PK = i.emp_pk(+) and fa.thr_employee_pk(+) = a.pk and fa1.thr_employee_pk(+) = a.pk and nvl(fa.tutor(+),'N') = 'Y' AND NVL(fa1.family_other(+),'N') = 'Y' ";
        SQL = SQL + "AND A.THR_F_PASSPORT_PK = p.pk(+) AND A.THR_F_LABOUR_LICENCE_PK = l.pk(+) AND A.THR_F_VISA_PK = f.pk(+) AND A.THR_F_RESIDENCE_PK = g.pk(+)  ";
        SQL = SQL + "and decode('" + p_nation + "','ALL','ALL',a.NATION )='" + p_nation + "'";
        SQL = SQL + "     and ('" + p_emp_search + "' is null  " +
        "                 or  (upper(a.emp_id) like  '%' || upper('" + p_emp_search + "')|| '%') " +
        "                 or  (upper(a.old_id ) like  '%' || upper('" + p_emp_search + "')|| '%') " +
        "                 or  (upper(a.full_name) like  '%' || upper('" + p_emp_search + "')|| '%')) " +
		"     and (('" + p_from_date + "' is null and '" + p_to_date + "' is null) " +
        "            or ('" + p_select_date + "' = 1 and (decode(length(a.birth_dt),4,a.birth_dt || '0101',a.birth_dt) between '" + p_from_date + "' and '" + p_to_date + "'))  " +
        "            or ('" + p_select_date + "' = 2 and a.join_dt between '" + p_from_date + "' and '" + p_to_date + "') " +
        "            or ('" + p_select_date + "' = 3 and a.left_dt between '" + p_from_date + "' and '" + p_to_date + "') " +
        "         ) " +
		"     and decode('" + p_salary_yn + "','ALL','ALL',a.salary_yn )='" + p_salary_yn + "' " +
		"     and decode('" + p_position + "','ALL','ALL',a.pos_type )='" + p_position + "' " +
		"     and decode('" + p_status + "','ALL','ALL',a.status)='" + p_status + "' " +
		"      and (   a.tco_org_pk in ( " +
        "                              select     g.pk " +
        "                                    from tco_org g " +
        "                                   where g.del_if = 0 " +
        "                              start with g.pk = " +
        "                                            decode ('" + p_tco_org_pk + "', " +
        "                                                    'ALL', 0, " +
        "                                                    '" + p_tco_org_pk + "' " +
        "                                                   ) " +
        "                              connect by prior g.pk = g.p_pk) " +
        "                        or '" + p_tco_org_pk + "' = 'ALL') " +
		"      order by nvl(c.seq,0) ,org_nm  ,a.emp_id " ;
		
   
        
		//Response.Write(SQL);
        //Response.End();

        DataTable dt_emp = CtlLib.TableReadOpen(SQL);

      

        

        SQL
        = "select to_char(sysdate,'dd/mm/yyyy') from dual ";
        DataTable dt_sysdt = CtlLib.TableReadOpen(SQL);

        
        string[] s = s_name.Split('|');
        //Insert column
        for (i = 3; i < s.Length - 1; i++)
        {
            exSheet.Range[1, 5, 1, 5].Columns.EntireColumn.Insert();
        }

        for (i = 0; i < s.Length - 1; i++)
        {
            exSheet.Cells[5, 2 + i].Value = s[i];
        }
        //Header
        exSheet.Range[1, 1, 1, s.Length].Merge();
        if (p_lang == "ENG")
        {
            exSheet.Cells[1, 1].Value = "LIST OF EMPLOYEES";
            exSheet.Cells[2, 2].Value = "Reporter";
            exSheet.Cells[3, 2].Value = "Report Date";
        }
        else
        {
            exSheet.Cells[1, 1].Value = "DANH SÁCH THÔNG TIN NHÂN VIÊN";
            exSheet.Cells[2, 2].Value = "Người báo cáo";
            exSheet.Cells[3, 2].Value = "Ngày báo cáo";
        }

        exSheet.Cells[2, 3].Value = Session["User_ID"].ToString();
        exSheet.Cells[3, 3].Value = dt_sysdt.Rows[0][0].ToString();
                
        //Insert Row
        for (i = 0; i < dt_emp.Rows.Count - 1; i++)
        {
            if (pic != 1000)
                exSheet.Range[6, 1].Rows.RowHeight = 70;

            exSheet.Range[7, 1, 7, 1].Rows.EntireRow.Insert();
            //exSheet.Range[4, 1, 5,11].Copy(exSheet.Range[6,1,7,11], XlPasteType.xlPasteAll);
        }

        for (i = 0; i < dt_emp.Rows.Count; i++)
        {
            exSheet.Cells[6 + i, 1].Value = i + 1;
            for(j= 2; j <= s.Length ; j++)
            {
                //if (IsNumber(dt_emp.Rows[i][j - 2].ToString()) == false || int.Parse(p[j-2].ToString()) <= 14 )
                if (j - 2 == pic && pic != 1000)
                {
                    exSheet.Cells[6 + i, j].Select();
                    if (dt_emp.Rows[i][j - 2].ToString() != "")
                    {
                        byte[] MyData = new byte[0];
                        MyData = (byte[])dt_emp.Rows[i][j - 2];
                        MemoryStream stream = new MemoryStream(MyData);

                        Bitmap b = new Bitmap(stream);

                        exSheet.Shapes.AddPicture(ResizeImage(b, 105, 93));
                    }
                }
                
                exSheet.Cells[6 + i, j].Value = dt_emp.Rows[i][j - 2].ToString();
                //else
                //{
                //    exSheet.Cells[6 + i, j].NumberFormat = "_(* #,##0_);_(* (#,##0);_(* " + "-" + "_);_(@_)";
                //    exSheet.Cells[6 + i, j].Value = Double.Parse(dt_emp.Rows[i][j - 2].ToString());
                //}
            }
        }
        
        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }

        //Xoa column theo security
        int tmp=0,tmp1 = 0;
        if (p_sal_security == "N")
        {
            for (i = 0; i < s.Length - 1; i++)
                if (int.Parse(p[i].ToString()) >= 44 && int.Parse(p[i].ToString()) <= 53)
                {
                    tmp++;
                    if (tmp1 == 0)
                        tmp1 = i;       
                }
            tmp1 = tmp1 + 2;        //trong report bat dau bang colunm thu 2
            for(i=0;i<tmp;i++)
                exSheet.Range[1, tmp1].Columns.EntireColumn.Delete();

        }

        exSheet.Cells.Columns.Autofit();
        

        exBook.SaveAs(TempFile);
        //ESysLib.ExcelToPdf(TempFile);
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

    public bool IsNumber(string pText)
    {
        Regex regex = new Regex(@"^[-+]?[0-9]*.?[0-9]+$");
        return regex.IsMatch(pText);
    }

    public Bitmap ResizeImage(Bitmap d, int w, int h)
    {
        Bitmap q = new Bitmap(w, h);
        float f, g;
        f = (float)w / (float)d.Width;
        g = (float)h / (float)d.Height;
        for (int i = 0; i < w; i++)
        {
            for (int j = 0; j < h; j++)
            {
                Color c;
                c = d.GetPixel((int)(i / f), (int)(j / g));
                q.SetPixel(i, j, c);
            }
        }
        return q;
    } 
}