<%@ Page Language="C#" %>
<%@ Import Namespace = "System.Data" %>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;

    %>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
    string p_user,p_tco_org_pk,p_wg,p_opt,p_wt_ot,p_search,p_input;
    string p_from, p_to, p_month, p_nation, p_val;
//uong&p_wg=ALL&p_search=1&p_input=&p_tco_org_pk=ALL&p_from=20100104&p_to=20100131&p_opt=1&p_wt_ot=&p_month=01/2010&p_nation=01
    
    p_tco_org_pk   = Request["p_tco_org_pk"].ToString();
    p_wg      = Request["p_wg"].ToString();
    p_from          = Request["p_from"].ToString();
    p_to            = Request["p_to"].ToString();
    p_opt           = Request["p_opt"].ToString();
    p_wt_ot         = Request["p_wt_ot"].ToString();
    p_input         = Request["p_input"].ToString();
    p_user          = Request["p_user"].ToString();
    p_month         = Request["p_month"].ToString();
    p_nation        = Request["p_nation"].ToString();
    p_val           = Request["p_val"].ToString();
    
   string SQL
     = "select to_char(sysdate,'dd/mm/yyyy'),D.ORG_NM,E.WORKGROUP_NM,F.EMP_ID,F.FULL_NAME,TO_CHAR(TO_DATE(F.JOIN_DT,'YYYYMMDD'),'DD/MM/YYYY') " +
         ",MAX(hr.WT_1),SUM(HR.OT_1),SUM(HR.NT_1),SUM(HR.HT_1) " +
         ",MAX(hr.WT_2),SUM(HR.OT_2),SUM(HR.NT_2),SUM(HR.HT_2) " +
         ",MAX(hr.WT_3),SUM(HR.OT_3),SUM(HR.NT_3),SUM(HR.HT_3) " +
         ",MAX(hr.WT_4),SUM(HR.OT_4),SUM(HR.NT_4),SUM(HR.HT_4) " +
         ",MAX(hr.WT_5),SUM(HR.OT_5),SUM(HR.NT_5),SUM(HR.HT_5) " +
         ",MAX(HR.TOTAL_WT),SUM(HR.TOTAL_OT),SUM(HR.TOTAL_NT),SUM(HR.TOTAL_HT) " +
         "from( " +
         "select a.pk as emp_pk,0 WT_1,0 WT_2,0 WT_3,0 WT_4,0 WT_5  " +
         ",DECODE(HR_F_GET_DATE_WEEK(ex.work_dt,'" + p_from + "','" + p_to + "'),1,SUM(DECODE(ex.OT_TYPE,'OT',NVL(ex.OT_TIME,0),0)),0) AS OT_1   " +
         ",DECODE(HR_F_GET_DATE_WEEK(ex.work_dt,'" + p_from + "','" + p_to + "'),1,SUM(DECODE(ex.OT_TYPE,'NT',NVL(ex.OT_TIME,0),'NT2',NVL(ex.OT_TIME,0),0)),0) AS NT_1   " +
         ",DECODE(HR_F_GET_DATE_WEEK(ex.work_dt,'" + p_from + "','" + p_to + "'),1,SUM(DECODE(ex.OT_TYPE,'HT',NVL(ex.OT_TIME,0),0)),0) AS HT_1   " +
         ",DECODE(HR_F_GET_DATE_WEEK(ex.work_dt,'" + p_from + "','" + p_to + "'),2,SUM(DECODE(ex.OT_TYPE,'OT',NVL(ex.OT_TIME,0),0)),0) AS OT_2   " +
         ",DECODE(HR_F_GET_DATE_WEEK(ex.work_dt,'" + p_from + "','" + p_to + "'),2,SUM(DECODE(ex.OT_TYPE,'NT',NVL(ex.OT_TIME,0),'NT2',NVL(ex.OT_TIME,0),0)),0) AS NT_2   " +
         ",DECODE(HR_F_GET_DATE_WEEK(ex.work_dt,'" + p_from + "','" + p_to + "'),2,SUM(DECODE(ex.OT_TYPE,'HT',NVL(ex.OT_TIME,0),0)),0) AS HT_2   " +
         ",DECODE(HR_F_GET_DATE_WEEK(ex.work_dt,'" + p_from + "','" + p_to + "'),3,SUM(DECODE(ex.OT_TYPE,'OT',NVL(ex.OT_TIME,0),0)),0) AS OT_3   " +
         ",DECODE(HR_F_GET_DATE_WEEK(ex.work_dt,'" + p_from + "','" + p_to + "'),3,SUM(DECODE(ex.OT_TYPE,'NT',NVL(ex.OT_TIME,0),'NT2',NVL(ex.OT_TIME,0),0)),0) AS NT_3   " +
         ",DECODE(HR_F_GET_DATE_WEEK(ex.work_dt,'" + p_from + "','" + p_to + "'),3,SUM(DECODE(ex.OT_TYPE,'HT',NVL(ex.OT_TIME,0),0)),0) AS HT_3   " +
         ",DECODE(HR_F_GET_DATE_WEEK(ex.work_dt,'" + p_from + "','" + p_to + "'),4,SUM(DECODE(ex.OT_TYPE,'OT',NVL(ex.OT_TIME,0),0)),0) AS OT_4   " +
         ",DECODE(HR_F_GET_DATE_WEEK(ex.work_dt,'" + p_from + "','" + p_to + "'),4,SUM(DECODE(ex.OT_TYPE,'NT',NVL(ex.OT_TIME,0),'NT2',NVL(ex.OT_TIME,0),0)),0) AS NT_4   " +
         ",DECODE(HR_F_GET_DATE_WEEK(ex.work_dt,'" + p_from + "','" + p_to + "'),4,SUM(DECODE(ex.OT_TYPE,'HT',NVL(ex.OT_TIME,0),0)),0) AS HT_4   " +
         ",DECODE(HR_F_GET_DATE_WEEK(ex.work_dt,'" + p_from + "','" + p_to + "'),5,SUM(DECODE(ex.OT_TYPE,'OT',NVL(ex.OT_TIME,0),0)),0) AS OT_5   " +
         ",DECODE(HR_F_GET_DATE_WEEK(ex.work_dt,'" + p_from + "','" + p_to + "'),5,SUM(DECODE(ex.OT_TYPE,'NT',NVL(ex.OT_TIME,0),'NT2',NVL(ex.OT_TIME,0),0)),0) AS NT_5   " +
         ",DECODE(HR_F_GET_DATE_WEEK(ex.work_dt,'" + p_from + "','" + p_to + "'),5,SUM(DECODE(ex.OT_TYPE,'HT',NVL(ex.OT_TIME,0),0)),0) AS HT_5   " +
         ",0 TOTAL_WT " +
         ",SUM(DECODE(ex.OT_TYPE,'OT',NVL(ex.OT_TIME,0),0)) as total_ot   " +
         ",SUM(DECODE(ex.OT_TYPE,'NT',NVL(ex.OT_TIME,0),'NT2',NVL(ex.OT_TIME,0),0)) as total_nt  " +
         ",SUM(DECODE(ex.OT_TYPE,'HT',NVL(ex.OT_TIME,0),0)) as total_ht  " +
         "from thr_extra_time ex ,thr_employee a " +
         "where  ex.DEL_IF=0 and a.del_if=0 and a.pk=ex.thr_emp_pk " +
         "and ex.WORK_DT BETWEEN '" + p_from + "' and '" + p_to + "'  " +
         "AND HR_F_GET_DATE_WEEK(ex.WORK_DT,'" + p_from + "','" + p_to + "')  >  0   " +
         "               AND ('" + p_input + "' IS NULL  " +
        "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
         "group by a.pk, HR_F_GET_DATE_WEEK(ex.WORK_DT,'" + p_from + "','" + p_to + "') " +
         "union all " +
         "select b.pk as emp_pk " +
         ",SUM(DECODE(HR_F_GET_DATE_WEEK(c.WORK_DT,'" + p_from + "','" + p_to + "'),1,NVL(c.WORK_TIME,0),0)) AS WT_1 " +
         ",SUM(DECODE(HR_F_GET_DATE_WEEK(c.WORK_DT,'" + p_from + "','" + p_to + "'),2,NVL(c.WORK_TIME,0),0)) AS WT_2 " +
         ",SUM(DECODE(HR_F_GET_DATE_WEEK(c.WORK_DT,'" + p_from + "','" + p_to + "'),3,NVL(c.WORK_TIME,0),0)) AS WT_3 " +
         ",SUM(DECODE(HR_F_GET_DATE_WEEK(c.WORK_DT,'" + p_from + "','" + p_to + "'),4,NVL(c.WORK_TIME,0),0)) AS WT_4 " +
         ",SUM(DECODE(HR_F_GET_DATE_WEEK(c.WORK_DT,'" + p_from + "','" + p_to + "'),5,NVL(c.WORK_TIME,0),0)) AS WT_5 " +
         ",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,SUM(NVL(C.WORK_TIME,0)) TOTAL_WT,0,0,0 " +
         "from thr_employee b,thr_time_machine c " +
         "where b.del_if=0 and c.del_if=0  " +
         "and b.pk=c.thr_emp_pk  " +
         "and c.WORK_DT BETWEEN '" + p_from + "' and '" + p_to + "'  " +
         "               AND ('" + p_input + "' IS NULL  " +
        "                     OR  (UPPER(B.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(B.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(B.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
         "group by b.pk) hr, " +
         "THR_EMPLOYEE F,TCO_org D,THR_work_GROUP E " +
         "WHERE F.DEL_IF=0 AND D.DEL_IF=0 AND E.DEL_IF=0 " +
         "AND F.TCO_ORG_PK=D.PK AND F.THR_wg_PK=E.PK " +
         "AND F.PK=HR.EMP_PK " +
          "AND F.JOIN_DT <= '" + p_to + "' " +
         "AND (F.LEFT_DT>= '" + p_from + "' OR F.LEFT_DT IS NULL) " +
         "AND DECODE('" + p_nation + "' ,'ALL', '" + p_nation + "',F.nation) = '" + p_nation + "'  " +
         "AND DECODE('" + p_wg + "' ,'ALL','" + p_wg + "' ,E.PK) = '" + p_wg + "'  " +
         "AND (   F.tco_org_pk IN ( " +
         "                             SELECT     g.pk " +
         "                                   FROM tco_org g " +
         "                                  WHERE g.del_if = 0 " +
         "                             START WITH g.pk = DECODE ('" + p_tco_org_pk + "', " +
         "                                                       'ALL', 0, " +
         "                                                       '" + p_tco_org_pk + "' " +
         "                                                      ) " +
         "                             CONNECT BY PRIOR g.pk = g.p_pk) " +
         "          OR '" + p_tco_org_pk + "' = 'ALL' " +
         "         ) " +
         "               AND ('" + p_input + "' IS NULL  " +
        "                     OR  (UPPER(F.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(F.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(F.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
         " GROUP BY D.ORG_NM,E.WORKGROUP_NM,F.EMP_ID,F.FULL_NAME,F.JOIN_DT " +
         " having ( '" + p_val + "' = '=' and DECODE('" + p_opt + "','1',MAX(HR.TOTAL_WT),'2',MAX(HR.TOTAL_OT),'3',MAX(HR.TOTAL_HT),'4',MAX(HR.TOTAL_WT) + MAX(HR.TOTAL_OT),'5',MAX(HR.TOTAL_OT) + MAX(HR.TOTAL_HT))=NVL('" + p_wt_ot + "',0) " +
         "       or '" + p_val + "' = '>' and DECODE('" + p_opt + "','1',MAX(HR.TOTAL_WT),'2',MAX(HR.TOTAL_OT),'3',MAX(HR.TOTAL_HT),'4',MAX(HR.TOTAL_WT) + MAX(HR.TOTAL_OT),'5',MAX(HR.TOTAL_OT) + MAX(HR.TOTAL_HT))>NVL('" + p_wt_ot + "',0) " +
         "       or '" + p_val + "' = '<' and DECODE('" + p_opt + "','1',MAX(HR.TOTAL_WT),'2',MAX(HR.TOTAL_OT),'3',MAX(HR.TOTAL_HT),'4',MAX(HR.TOTAL_WT) + MAX(HR.TOTAL_OT),'5',MAX(HR.TOTAL_OT) + MAX(HR.TOTAL_HT))<NVL('" + p_wt_ot + "',0) " +
         "       or '" + p_val + "' = '>=' and DECODE('" + p_opt + "','1',MAX(HR.TOTAL_WT),'2',MAX(HR.TOTAL_OT),'3',MAX(HR.TOTAL_HT),'4',MAX(HR.TOTAL_WT) + MAX(HR.TOTAL_OT),'5',MAX(HR.TOTAL_OT) + MAX(HR.TOTAL_HT))>=NVL('" + p_wt_ot + "',0) " +
         "       or '" + p_val + "' = '<=' and DECODE('" + p_opt + "','1',MAX(HR.TOTAL_WT),'2',MAX(HR.TOTAL_OT),'3',MAX(HR.TOTAL_HT),'4',MAX(HR.TOTAL_WT) + MAX(HR.TOTAL_OT),'5',MAX(HR.TOTAL_OT) + MAX(HR.TOTAL_HT))<=NVL('" + p_wt_ot + "',0) " +
         "       OR NVL('" + p_wt_ot + "',0)=0) " +
         "ORDER BY D.ORG_NM,E.WorkGROUP_NM,F.EMP_ID";
        
        
        
//Response.Write(SQL);
//Response.End();
    DataTable dt = CtlLib.TableReadOpen(SQL);
    int irow;
    irow = dt.Rows.Count;
    if (irow == 0)
    {
        Response.Write("There is no data");
        Response.End();
    }
    
    //header of table
    SQL
	= "select HR_F_GET_DATE_WEEK(CAR_DATE,'" + p_from + "','" + p_to + "') " + 
        ",to_char(to_date(MIN(CAR_DATE),'yyyymmdd'),'dd/mm/yyyy') " +
        " || '-' || to_char(to_date(MAX(CAR_DATE),'yyyymmdd'),'dd/mm/yyyy') " +
        " from tco_abcalendar a " +
        "where a.del_if=0 and a.CAR_DATE between '" + p_from + "' and '" + p_to + "' " +
        "GROUP BY HR_F_GET_DATE_WEEK(CAR_DATE,'" + p_from + "','" + p_to + "') " +
        "order by HR_F_GET_DATE_WEEK(CAR_DATE,'" + p_from + "','" + p_to + "') " ;
    DataTable dt_name = CtlLib.TableReadOpen(SQL);
    int irow_name;
    irow_name = dt_name.Rows.Count;
    if (irow_name == 0)
    {
        Response.Write("There is no data");
        Response.End();
    }
%>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_working_time_total_month_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_working_time_total_month_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_working_time_total_month_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>ty-ml</o:Author>
  <o:LastAuthor>ty-ml</o:LastAuthor>
  <o:LastPrinted>2008-07-26T06:57:10Z</o:LastPrinted>
  <o:Created>2008-07-26T02:22:34Z</o:Created>
  <o:LastSaved>2008-07-26T07:00:02Z</o:LastSaved>
  <o:Company>genuwin</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"Page &P of &N";
	margin:.32in .16in .4in .28in;
	mso-header-margin:.32in;
	mso-footer-margin:.4in;
	mso-page-orientation:landscape;}
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal;
	mso-style-id:0;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl24
	{mso-style-parent:style0;
	color:#3366FF;
	font-size:18.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl25
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl27
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl28
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;}
.xl29
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;}
.xl30
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";}
.xl31
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";}
.xl32
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;}
.xl33
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[$-1010000\]d\/m\/yyyy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[$-1010000\]d\/m\/yyyy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[$-1010000\]d\/m\/yyyy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl40
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl41
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl42
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl43
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl44
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl45
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[$-1010000\]d\/m\/yyyy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl46
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl47
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl48
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl49
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl50
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[$-1010000\]d\/m\/yyyy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl51
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[$-1010000\]d\/m\/yyyy\;\@";}
.xl52
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;}
.xl53
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;}
.xl54
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl55
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl56
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl57
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl58
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[$-1010000\]d\/m\/yyyy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl59
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[$-1010000\]d\/m\/yyyy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>53</x:Scale>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:CodeName>Sheet1</x:CodeName>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>4</x:ActiveRow>
       <x:ActiveCol>5</x:ActiveCol>
       <x:RangeSelection>$F$5:$F$6</x:RangeSelection>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
   <x:ExcelWorksheet>
    <x:Name>Sheet2</x:Name>
    <x:WorksheetOptions>
     <x:CodeName>Sheet2</x:CodeName>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
   <x:ExcelWorksheet>
    <x:Name>Sheet3</x:Name>
    <x:WorksheetOptions>
     <x:CodeName>Sheet3</x:CodeName>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>7680</x:WindowHeight>
  <x:WindowWidth>15195</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>45</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1032"/>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl25>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1896 style='border-collapse:
 collapse;table-layout:fixed;width:1418pt'>
 <col class=xl25 width=36 style='mso-width-source:userset;mso-width-alt:1316;
 width:27pt'>
 <col class=xl25 width=94 style='mso-width-source:userset;mso-width-alt:3437;
 width:71pt'>
 <col class=xl25 width=96 style='mso-width-source:userset;mso-width-alt:3510;
 width:72pt'>
 <col class=xl25 width=60 style='mso-width-source:userset;mso-width-alt:2194;
 width:45pt'>
 <col class=xl31 width=183 style='mso-width-source:userset;mso-width-alt:6692;
 width:137pt'>
 <col class=xl51 width=77 style='mso-width-source:userset;mso-width-alt:2816;
 width:58pt'>
 <col class=xl25 width=55 style='mso-width-source:userset;mso-width-alt:2011;
 width:41pt'>
 <col class=xl25 width=60 style='mso-width-source:userset;mso-width-alt:2194;
 width:45pt'>
 <col class=xl25 width=55 span=3 style='mso-width-source:userset;mso-width-alt:
 2011;width:41pt'>
 <col class=xl25 width=60 style='mso-width-source:userset;mso-width-alt:2194;
 width:45pt'>
 <col class=xl25 width=55 span=3 style='mso-width-source:userset;mso-width-alt:
 2011;width:41pt'>
 <col class=xl25 width=60 style='mso-width-source:userset;mso-width-alt:2194;
 width:45pt'>
 <col class=xl25 width=55 span=3 style='mso-width-source:userset;mso-width-alt:
 2011;width:41pt'>
 <col class=xl25 width=60 style='mso-width-source:userset;mso-width-alt:2194;
 width:45pt'>
 <col class=xl25 width=55  style='mso-width-source:userset;mso-width-alt:
 2011;width:41pt'>
  <col class=xl25 width=55  style='mso-width-source:userset;mso-width-alt:
 2011;width:41pt'>
  <col class=xl25 width=55  style='<%if (irow_name<5) Response.Write("display:none;");%>mso-width-source:userset;mso-width-alt:
 2011;width:41pt'>
 <col class=xl25 width=60 style='<%if (irow_name<5) Response.Write("display:none;");%>mso-width-source:userset;mso-width-alt:2194;
 width:45pt'>
 <col class=xl25 width=55  style='<%if (irow_name<5) Response.Write("display:none;");%>mso-width-source:userset;mso-width-alt:
 2011;width:41pt'>
  <col class=xl25 width=55  style='<%if (irow_name<5) Response.Write("display:none;");%>mso-width-source:userset;mso-width-alt:
 2011;width:41pt'>
  <col class=xl25 width=55  style='mso-width-source:userset;mso-width-alt:
 2011;width:41pt'>
 <col class=xl25 width=60 style='mso-width-source:userset;mso-width-alt:2194;
 width:45pt'>
 <col class=xl25 width=55 span=2 style='mso-width-source:userset;mso-width-alt:
 2011;width:41pt'>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=30 height=28 class=xl24 width=1896 style='height:21.0pt;
  width:1418pt'>WORKING TIME SUMMARY</td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td height=27 class=xl25 style='height:20.25pt'></td>
  <td class=xl26>Reporter</td>
  <td class=xl27><%=Session["USER_NAME"]%></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=25 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td height=27 class=xl25 style='height:20.25pt'></td>
  <td class=xl26>Report Date</td>
  <td class=xl29 x:num><%= dt.Rows[0][0].ToString() %></td>
  <td class=xl30></td>
  <td class=xl31></td>
  <td class=xl51></td>
  <td class=xl32></td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl32></td>
  <td class=xl53>Month:</td>
  <td class=xl52 colspan=2 style='mso-ignore:colspan'><%=p_month %></td>
  <td class=xl32></td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl32></td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl32></td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl32></td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td height=27 colspan=4 class=xl33 style='height:20.25pt;mso-ignore:colspan'></td>
  <td class=xl34></td>
  <td colspan=25 class=xl35 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl39 height=51 style='mso-height-source:userset;height:38.25pt'>
  <td rowspan=2 height=78 class=xl54 width=36 style='border-bottom:.5pt solid black;
  height:58.5pt;width:27pt'>No</td>
  <td rowspan=2 class=xl54 width=94 style='border-bottom:.5pt solid black;
  width:71pt'>Department</td>
  <td rowspan=2 class=xl54 width=96 style='border-bottom:.5pt solid black;
  width:72pt'>Group</td>
  <td rowspan=2 class=xl54 width=60 style='border-bottom:.5pt solid black;
  width:45pt'>Emp ID</td>
  <td rowspan=2 class=xl56 width=183 style='border-bottom:.5pt solid black;
  width:137pt'>Full Name</td>
  <td rowspan=2 class=xl58 width=77 style='border-bottom:.5pt solid black;
  width:58pt'>Join Date</td>
  <td colspan=4 class=xl36 width=225 style='border-right:.5pt solid black;
  border-left:none;width:168pt'>Week 1<br>
    <% = dt_name.Rows[0][1].ToString()%></td>
  <td colspan=4 class=xl36 width=225 style='border-right:.5pt solid black;
  border-left:none;width:168pt'>Week 2<br>
    <% = dt_name.Rows[1][1].ToString()%></td>
  <td colspan=4 class=xl36 width=225 style='border-right:.5pt solid black;
  border-left:none;width:168pt'>Week 3<br>
    <% = dt_name.Rows[2][1].ToString()%></td>
  <td colspan=4 class=xl36 width=225 style='border-right:.5pt solid black;
  border-left:none;width:168pt'>Week 4<br>
    <% = dt_name.Rows[3][1].ToString()%></td>
  <td colspan=4 class=xl36 width=225 style='border-right:.5pt solid black;
  border-left:none;width:168pt'>Week 5<br>
    <% if (irow_name==5) Response.Write(dt_name.Rows[0][1].ToString());%></td>
  <td colspan=4 class=xl36 width=225 style='border-right:.5pt solid black;
  border-left:none;width:168pt'>Total
    </td>
 </tr>
 <tr class=xl39 height=27 style='mso-height-source:userset;height:20.25pt'>
  <td height=27 class=xl40 width=55 style='height:20.25pt;border-top:none;
  width:41pt'>WT</td>
  <td class=xl40 width=60 style='border-top:none;width:45pt'>OT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>NT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>HT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>WT</td>
  <td class=xl40 width=60 style='border-top:none;width:45pt'>OT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>NT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>HT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>WT</td>
  <td class=xl40 width=60 style='border-top:none;width:45pt'>OT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>NT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>HT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>WT</td>
  <td class=xl40 width=60 style='border-top:none;width:45pt'>OT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>NT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>HT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>WT</td>
  <td class=xl40 width=60 style='border-top:none;width:45pt'>OT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>NT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>HT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>WT</td>
  <td class=xl40 width=60 style='border-top:none;width:45pt'>OT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>NT</td>
  <td class=xl40 width=55 style='border-top:none;width:41pt'>HT</td>
 </tr>
 <% 
     string s_format;
     for (int i = 0; i < irow; i++) 
    {
        if (i == irow - 1)
            s_format = ";border-bottom:.5pt solid windowtext";
        else
            s_format = ";";
    %> 
 <tr class=xl39 height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl41 width=36 style='height:22.5pt;border-top:none;
  width:27pt<%=s_format%>' x:num><%=i+1 %></td>
  <td class=xl42 style='border-top:none<%=s_format%>'><% = dt.Rows[i][1].ToString()%></td>
  <td class=xl42 style='border-top:none<%=s_format%>'><% = dt.Rows[i][2].ToString()%></td>
  <td class=xl44 width=60 style='border-top:none;width:45pt<%=s_format%>' ><% = dt.Rows[i][3].ToString()%></td>
  <td class=xl44 style='border-top:none<%=s_format%>'><% = dt.Rows[i][4].ToString()%></td>
  <td class=xl45 width=77 style='border-top:none;width:58pt<%=s_format%>'><% = dt.Rows[i][5].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][6].ToString()%></td>
  <td class=xl43 width=60 style='border-top:none;width:45pt<%=s_format%>' x:num><% = dt.Rows[i][7].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][8].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][9].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][10].ToString()%></td>
  <td class=xl43 width=60 style='border-top:none;width:45pt<%=s_format%>' x:num><% = dt.Rows[i][11].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][12].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][13].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][14].ToString()%></td>
  <td class=xl43 width=60 style='border-top:none;width:45pt<%=s_format%>' x:num><% = dt.Rows[i][15].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][16].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][17].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][18].ToString()%></td>
  <td class=xl43 width=60 style='border-top:none;width:45pt<%=s_format%>' x:num><% = dt.Rows[i][19].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][20].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][21].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][22].ToString()%></td>
  <td class=xl43 width=60 style='border-top:none;width:45pt<%=s_format%>' x:num><% = dt.Rows[i][23].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][24].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][25].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][26].ToString()%></td>
  <td class=xl43 width=60 style='border-top:none;width:45pt<%=s_format%>' x:num><% = dt.Rows[i][27].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][28].ToString()%></td>
  <td class=xl43 width=55 style='border-top:none;width:41pt<%=s_format%>' x:num><% = dt.Rows[i][29].ToString()%></td>
 </tr>
 <%
    }
  %>
 
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=36 style='width:27pt'></td>
  <td width=94 style='width:71pt'></td>
  <td width=96 style='width:72pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=183 style='width:137pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=55 style='width:41pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
