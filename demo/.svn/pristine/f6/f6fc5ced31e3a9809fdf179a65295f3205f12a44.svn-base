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

public partial class rpt_hrti00800_4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //CtlLib.SetUser("hr");
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_user, p_tco_org_pk, p_wg, p_from, p_to;
        string p_thr_ws_pk, p_search, p_input, p_opt, p_opt_text, p_m1, p_m2, p_nation;


        p_tco_org_pk = Request["p_tco_org_pk"].ToString();
        p_wg = Request["p_wg"].ToString();
        p_from = Request["p_from"].ToString();
        p_to = Request["p_to"].ToString();
        p_nation = Request["p_nation"].ToString();


        string TemplateFile = "rpt_hrti00800_4.xls";
        string TempFile = "../../../../system/temp/rpt_hrti00800_4_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;


        string SQL
     = "SELECT TO_CHAR(SYSDATE,'DD/MM/YYYY'),HR.WG,SUM(HR.WD),SUM(HR.T15),SUM(HR.T2),SUM(HR.T3) " +
         "FROM( " +
         "SELECT B.workgroup_NM WG,MAX(NVL(D.WORK_TIME,0)) WD  " +
         "            ,SUM(CASE WHEN E.OT_TYPE='OT' AND E.HOL_TYPE IS NULL THEN NVL(E.OT_TIME,0) " +
         "                    ELSE 0 END) T15 " +
         "            ,SUM(CASE WHEN E.OT_TYPE IN('OT','HT')  AND NVL(E.HOL_TYPE,' ')='SUN' THEN NVL(E.OT_TIME,0) " +
         "                    ELSE 0 END) T2 " +
         "            ,SUM(CASE WHEN E.OT_TYPE IN('OT','HT')  AND NVL(E.HOL_TYPE,' ')='HOL' THEN NVL(E.OT_TIME,0) " +
         "                    ELSE 0 END) T3         " +
         "            FROM THR_EMPLOYEE A,THR_work_group B, THR_WORK_SHIFT C,THR_TIME_MACHINE D,THR_EXTRA_TIME E,tco_org F  " +
         "            WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND C.DEL_IF=0 AND D.DEL_IF=0 AND E.DEL_IF(+)=0 AND F.DEL_IF=0  " +
         "            AND A.THR_wg_PK=B.PK AND A.PK=D.THR_EMP_PK AND C.PK=D.THR_WS_PK AND A.TCO_org_PK=F.PK  " +
         "            AND D.THR_EMP_PK=E.THR_EMP_PK(+) AND D.WORK_DT=E.WORK_DT(+)  " +
         "            AND D.WORK_DT BETWEEN '" + p_from + "' AND  '" + p_to + "' " +
         "            AND DECODE('" + p_wg + "' ,'ALL', '" + p_wg + "',B.PK) =  '" + p_wg + "'" +
         "            AND DECODE('" + p_nation + "' ,'ALL', '" + p_nation + "',a.nation) =  '" + p_nation + "'" +
         "                   AND (    A.TCO_ORG_PK IN (  " +
         "                       SELECT     G.PK  " +
         "                             FROM TCO_ORG G  " +
         "                            WHERE G.DEL_IF = 0            " +
         "                       START WITH G.PK =  " +
         "                                     DECODE ('" + p_tco_org_pk + "',  " +
         "                                             'ALL', 0,  " +
         "                                             '" + p_tco_org_pk + "'  " +
         "                                            )  " +
         "                       CONNECT BY PRIOR G.PK = G.P_PK)  " +
         "                 OR '" + p_tco_org_pk + "' = 'ALL')  " +
         "            GROUP BY B.workgroup_NM,D.WORK_DT,d.thr_emp_pk) HR " +
         " GROUP BY HR.WG " +
         " ORDER BY HR.WG ";

        //----------------------------------
       
        //Response.Write(SQL);
        //Response.End();
        DataTable dt_total = CtlLib.TableReadOpen(SQL);
        int irow,icol;
        irow = dt_total.Rows.Count;
        icol = dt_total.Columns.Count;
        if (irow == 0)
        {
            Response.Write("There is no data");
            Response.End();
        }

        exSheet.Cells[1, 1].Value = "TIME SUMMARY ";
        exSheet.Cells[2, 2].Value = "Work date: ";
        exSheet.Cells[2, 3].Value = p_from.Substring(6, 2) + "/" + p_from.Substring(4, 2) + "/" + p_from.Substring(0, 4);
        exSheet.Cells[2, 4].Value = "~";
        exSheet.Cells[2, 5].Value = p_to.Substring(6, 2) + "/" + p_to.Substring(4, 2) + "/" + p_to.Substring(0, 4);
       
        

        int i;
        int row_pos = 8;

        //insert row
        for (i = 0; i < irow - 1; i++)
        {

            exSheet.Range[row_pos + i, 1].Rows.EntireRow.Insert();
        }

        exSheet.Range[row_pos-1, 1, row_pos-1, 6].Borders[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlContinuous;
        exSheet.Range[row_pos + irow-1 , 1, row_pos + irow-1 , 6].Borders[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlContinuous;

        //show data
        row_pos = 7;
        for (i = 0; i < irow; i++)
        {
            exSheet.Cells[row_pos + i, 1].Value = i + 1;
            for (int j = 1; j < icol ; j++)
            {               
                if (j==2||j==3||j==4||j==5)
                {
                    exSheet.Cells[row_pos + i, j + 1].Value = Double.Parse(dt_total.Rows[i][j].ToString()); 
                }
                else
                {
                    exSheet.Cells[row_pos + i, j + 1].Value = dt_total.Rows[i][j].ToString();
                }               
            }
        }

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

    public static bool IsNumeric(string strNum)
    {
        try
        {
            double tmp = double.Parse(strNum);
            return true;
        }
        catch
        {
            return false;
        }
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