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
    string p_user, p_tco_org_pk, p_wg, p_opt, p_wt_ot, p_search, p_input, p_val;
    string p_from,p_to,p_month,p_week,p_nation,p_emp_kind,p_tco_company_pk;
     
  
    p_tco_org_pk   = Request["p_tco_org_pk"].ToString();
    p_wg      = Request["p_wg"].ToString();
    p_from          = Request["p_from"].ToString();
    p_to            = Request["p_to"].ToString();
    p_opt           = Request["p_opt"].ToString();
    p_wt_ot         = Request["p_wt_ot"].ToString();
    p_input         = Request["p_input"].ToString();
    p_user          = Request["p_user"].ToString();
    p_month         = Request["p_month"].ToString();
    p_week         = Request["p_week"].ToString();
    p_val           = Request["p_val"].ToString();
    //p_emp_kind         = Request["p_emp_kind"].ToString();
    p_tco_company_pk=Session["COMPANY_PK"].ToString();
   
  string SQL = "SELECT   d.org_nm, b.workgroup_nm, a.emp_id, a.full_name, " +
          "         TO_CHAR (TO_DATE (a.join_dt, 'YYYYMMDD'), 'DD/MM/YYYY'), " +
          "         SUM (wt.mon_wt), SUM (wt.mon_ot), SUM (wt.mon_nt), SUM (wt.mon_ht), " +
          "         SUM (wt.tue_wt), SUM (wt.tue_ot), SUM (wt.tue_nt), SUM (wt.tue_ht), " +
          "         SUM (wt.wed_wt), SUM (wt.wed_ot), SUM (wt.wed_nt), SUM (wt.wed_ht), " +
          "         SUM (wt.thu_wt), SUM (wt.thu_ot), SUM (wt.thu_nt), SUM (wt.thu_ht), " +
          "         SUM (wt.fri_wt), SUM (wt.fri_ot), SUM (wt.fri_nt), SUM (wt.fri_ht), " +
          "         SUM (wt.sat_wt), SUM (wt.sat_ot), SUM (wt.sat_nt), SUM (wt.sat_ht), " +
          "         SUM (wt.sun_wt), SUM (wt.sun_ot), SUM (wt.sun_nt), SUM (wt.sun_ht), " +
          "         SUM (wt.total_wt), SUM (wt.total_ot), SUM (wt.total_nt), " +
          "         SUM (wt.total_ht), TO_CHAR (SYSDATE, 'dd/mm/yyyy') " +
          "    FROM thr_employee a, " +
          "         thr_Work_group b, " +
          "         tco_org d, " +
          "         (SELECT   tm.thr_emp_pk " +
		  "			,max(case when tm.day_type=2 then NVL (tm.work_time, 0) else 0 end) AS mon_wt "+
		  "			,sum(case when tm.day_type=2 and tm.hol_type is null and ex.ot_type='OT' then nvl(ex.ot_time,0) else 0 end) as mon_ot "+
		  "			,sum(case when tm.day_type=2 and ex.ot_type in('NT','NT2') then nvl(ex.ot_time,0) else 0 end) as mon_nt "+
		  "			,sum(case when tm.day_type=2 and tm.hol_type is not null and ex.ot_type in('OT','HT') then nvl(ex.ot_time,0) else 0 end) as mon_ht "+
		  "			,max(case when tm.day_type=3 then NVL (tm.work_time, 0) else 0 end) AS tue_wt "+
		  "			,sum(case when tm.day_type=3 and tm.hol_type is null and ex.ot_type='OT' then nvl(ex.ot_time,0) else 0 end) as tue_ot "+
		  "			,sum(case when tm.day_type=3 and ex.ot_type in('NT','NT2') then nvl(ex.ot_time,0) else 0 end) as tue_nt "+
		  "			,sum(case when tm.day_type=3 and tm.hol_type is not null and ex.ot_type in('OT','HT') then nvl(ex.ot_time,0) else 0 end) as tue_ht "+
		  "			,max(case when tm.day_type=4 then NVL (tm.work_time, 0) else 0 end) AS wed_wt "+
		  "			,sum(case when tm.day_type=4 and tm.hol_type is null and ex.ot_type='OT' then nvl(ex.ot_time,0) else 0 end) as wed_ot "+
		  "			,sum(case when tm.day_type=4 and ex.ot_type in('NT','NT2') then nvl(ex.ot_time,0) else 0 end) as wed_nt "+
		  "			,sum(case when tm.day_type=4 and tm.hol_type is not null and ex.ot_type in('OT','HT') then nvl(ex.ot_time,0) else 0 end) as wed_ht "+
		  "			,max(case when tm.day_type=5 then NVL (tm.work_time, 0) else 0 end) AS thu_wt "+
		  "			,sum(case when tm.day_type=5 and tm.hol_type is null and ex.ot_type='OT' then nvl(ex.ot_time,0) else 0 end) as thu_ot "+
		  "			,sum(case when tm.day_type=5 and ex.ot_type in('NT','NT2') then nvl(ex.ot_time,0) else 0 end) as thu_nt "+
		  "			,sum(case when tm.day_type=5 and tm.hol_type is not null and ex.ot_type in('OT','HT') then nvl(ex.ot_time,0) else 0 end) as thu_ht "+
		  "			,max(case when tm.day_type=6 then NVL (tm.work_time, 0) else 0 end) AS fri_wt "+
		  "			,sum(case when tm.day_type=6 and tm.hol_type is null and ex.ot_type='OT' then nvl(ex.ot_time,0) else 0 end) as fri_ot "+
		  "			,sum(case when tm.day_type=6 and ex.ot_type in('NT','NT2') then nvl(ex.ot_time,0) else 0 end) as fri_nt "+
		  "			,sum(case when tm.day_type=6 and tm.hol_type is not null and ex.ot_type in('OT','HT') then nvl(ex.ot_time,0) else 0 end) as fri_ht "+
		  "			,max(case when tm.day_type=7 then NVL (tm.work_time, 0) else 0 end) AS sat_wt "+
		  "			,sum(case when tm.day_type=7 and tm.hol_type is null and ex.ot_type='OT' then nvl(ex.ot_time,0) else 0 end) as sat_ot "+
		  "			,sum(case when tm.day_type=7 and ex.ot_type in('NT','NT2') then nvl(ex.ot_time,0) else 0 end) as sat_nt "+
		  "			,sum(case when tm.day_type=7 and tm.hol_type is not null and ex.ot_type in('OT','HT') then nvl(ex.ot_time,0) else 0 end) as sat_ht "+
		  "			,max(case when tm.day_type=8 then NVL (tm.work_time, 0) else 0 end) AS sun_wt "+
		  "			,sum(case when tm.day_type=8 and tm.hol_type is null and ex.ot_type='OT' then nvl(ex.ot_time,0) else 0 end) as sun_ot "+
		  "			,sum(case when tm.day_type=8 and ex.ot_type in('NT','NT2') then nvl(ex.ot_time,0) else 0 end) as sun_nt "+
		  "			,sum(case when tm.day_type=8 and tm.hol_type is not null and ex.ot_type in('OT','HT') then nvl(ex.ot_time,0) else 0 end) as sun_ht "+
          "         ,MAX (NVL (tm.work_time, 0)) AS total_wt " +
		  "			,sum(case when tm.hol_type is null and ex.ot_type='OT' then nvl(ex.ot_time,0) else 0 end) as total_ot "+
		  "			,sum(case when ex.ot_type in('NT','NT2') then nvl(ex.ot_time,0) else 0 end) as total_nt "+
		  "			,sum(case when tm.hol_type is not null and ex.ot_type in('OT','HT') then nvl(ex.ot_time,0) else 0 end) as total_ht "+
          "              FROM thr_extra_time ex, thr_time_machine tm " +
          "             WHERE ex.del_if(+) = 0 " +
          "               AND tm.del_if = 0 " +
          "               AND tm.thr_emp_pk = ex.thr_emp_pk(+) " +
          "               AND tm.work_dt = ex.work_dt(+) " +
          "               AND ex.work_dt(+) BETWEEN '" + p_from + "' and '" + p_to + "' " +
          "               AND tm.work_dt BETWEEN '" + p_from + "' and '" + p_to + "' " +
          "          GROUP BY tm.thr_emp_pk, tm.day_type) wt " +
          "   WHERE a.del_if = 0 " +
          "     AND b.del_if = 0 " +
          "     AND d.del_if = 0 " +
          "     AND a.join_dt <= '" + p_to + "' " +
          "     AND (a.left_dt >= '" + p_from + "' OR a.left_dt IS NULL) " +
          "     AND DECODE ('" + p_wg + "', 'ALL', '" + p_wg + "', b.pk) = '" + p_wg + "' " +
          "            AND (A.TCO_ORG_PK IN (SELECT  g.pk " +
        "                                            FROM tco_org g " +
        "                                           WHERE g.del_if = 0 " +
        "                                      START WITH g.pk = " +
        "                                                    DECODE ('" + p_tco_org_pk + "' , " +
        "                                                            'ALL', 0, " +
        "                                                            '" + p_tco_org_pk + "' " +
        "                                                           ) " +
        "                                      CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                                OR '" + p_tco_org_pk + "'  = 'ALL') " +
        "               AND ('" + p_input + "' IS NULL  " +
        "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
          "     AND a.pk = wt.thr_emp_pk(+) " +
          "     AND b.pk = a.thr_wg_pk " +
          "     AND d.pk = a.tco_org_pk " +
          "GROUP BY d.org_nm, b.workgroup_nm, a.emp_id, a.full_name, a.join_dt " +
          "HAVING ( '" + p_val + "' = '=' and DECODE('" + p_opt + "','1',SUM (wt.total_wt),'2',SUM (wt.total_ot),'3',SUM (wt.total_ht),'4',SUM (wt.total_wt) + SUM (wt.total_ot),'5',SUM (wt.total_ot) + SUM (wt.total_ht))=NVL('" + p_wt_ot + "',0) " +
          "      or '" + p_val + "' = '>' and DECODE('" + p_opt + "','1',SUM (wt.total_wt),'2',SUM (wt.total_ot),'3',SUM (wt.total_ht),'4',SUM (wt.total_wt) + SUM (wt.total_ot),'5',SUM (wt.total_ot) + SUM (wt.total_ht))>NVL('" + p_wt_ot + "',0) " +
          "      or '" + p_val + "' = '<' and DECODE('" + p_opt + "','1',SUM (wt.total_wt),'2',SUM (wt.total_ot),'3',SUM (wt.total_ht),'4',SUM (wt.total_wt) + SUM (wt.total_ot),'5',SUM (wt.total_ot) + SUM (wt.total_ht))<NVL('" + p_wt_ot + "',0) " +
          "      or '" + p_val + "' = '>=' and DECODE('" + p_opt + "','1',SUM (wt.total_wt),'2',SUM (wt.total_ot),'3',SUM (wt.total_ht),'4',SUM (wt.total_wt) + SUM (wt.total_ot),'5',SUM (wt.total_ot) + SUM (wt.total_ht))>=NVL('" + p_wt_ot + "',0) " +
          "      or '" + p_val + "' = '<=' and DECODE('" + p_opt + "','1',SUM (wt.total_wt),'2',SUM (wt.total_ot),'3',SUM (wt.total_ht),'4',SUM (wt.total_wt) + SUM (wt.total_ot),'5',SUM (wt.total_ot) + SUM (wt.total_ht))<=NVL('" + p_wt_ot + "',0) " +
          "      OR NVL('" + p_wt_ot + "',0)=0) " +
          "order by d.org_nm, b.workgroup_nm, a.full_name, a.join_dt ";
        
        
        
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
	= "SELECT TO_CHAR(TO_DATE(CAR_DATE,'YYYYMMDD'),'DD/MM/YYYY') AS DT  " + 
        "            FROM THR_CALENDAR a " +
        "            WHERE a.DEL_IF=0 and a.tco_company_pk='" + p_tco_company_pk + "' AND a.CAR_DATE BETWEEN '" + p_from + "' and '" + p_to + "' " +
        "            ORDER BY a.CAR_DATE " ;
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
<link rel=File-List href="rpt_weekly_wt_ot_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_weekly_wt_ot_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_weekly_wt_ot_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>ty-ml</o:Author>
  <o:LastAuthor>ty-ml</o:LastAuthor>
  <o:LastPrinted>2008-07-25T09:57:07Z</o:LastPrinted>
  <o:Created>2008-05-26T09:13:46Z</o:Created>
  <o:LastSaved>2008-07-28T06:28:46Z</o:LastSaved>
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
	margin:.3in .16in .6in .28in;
	mso-header-margin:.16in;
	mso-footer-margin:.41in;
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
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";}
.xl30
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[$-1010000\]d\/m\/yyyy\;\@";}
.xl31
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl32
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
.xl33
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
.xl34
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
.xl35
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
.xl36
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
.xl37
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
.xl38
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
.xl39
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
.xl40
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl41
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl42
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
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl43
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
.xl44
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
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl45
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
.xl46
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl47
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[$-1010000\]d\/m\/yyyy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl48
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl49
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;}
.xl50
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
.xl51
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
.xl52
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl53
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl54
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";}
.xl55
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;}
.xl56
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
.xl57
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
.xl58
	{mso-style-parent:style0;
	color:#3366FF;
	font-size:18.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
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
      <x:Scale>71</x:Scale>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:CodeName>Sheet1</x:CodeName>
     <x:Selected/>
     <x:LeftColumnVisible>9</x:LeftColumnVisible>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>6</x:ActiveRow>
       <x:ActiveCol>22</x:ActiveCol>
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
  <x:WindowWidth>14955</x:WindowWidth>
  <x:WindowTopX>240</x:WindowTopX>
  <x:WindowTopY>330</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl25>
<table x:str border=0 cellpadding=0 cellspacing=0 width=1861 style='border-collapse:
 collapse;table-layout:fixed;width:1390pt'>
 <col class=xl24 width=36 style='mso-width-source:userset;mso-width-alt:1316;
 width:27pt'>
 <col class=xl24 width=94 style='mso-width-source:userset;mso-width-alt:3437;
 width:71pt'>
 <col class=xl24 width=98 style='mso-width-source:userset;mso-width-alt:3584;
 width:74pt'>
 <col class=xl24 width=75 style='mso-width-source:userset;mso-width-alt:2742;
 width:56pt'>
 <col class=xl25 width=161 style='mso-width-source:userset;mso-width-alt:5888;
 width:121pt'>
 <col class=xl26 width=86 style='mso-width-source:userset;mso-width-alt:3145;
 width:65pt'>
 <col class=xl24 width=39 span=23 style='mso-width-source:userset;mso-width-alt:
 1426;width:29pt'>
 <col class=xl24 width=46 style='mso-width-source:userset;mso-width-alt:1682;
 width:35pt'>
 <col class=xl24 width=47 span=2 style='mso-width-source:userset;mso-width-alt:
 1718;width:35pt'>
 <col class=xl24 width=39 style='mso-width-source:userset;mso-width-alt:1426;
 width:29pt'>
 <col class=xl24 width=47 span=5 style='mso-width-source:userset;mso-width-alt:
 1718;width:35pt'>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=34 height=28 class=xl58 width=1673 style='height:21.0pt;
  width:1250pt'>WEEKLY WORKING TIME SUMMARY</td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td height=27 class=xl25 style='height:20.25pt'></td>
  <td class=xl52>Month</td>
  <td class=xl54><%=p_month %></td>
  <td class=xl52>Week</td>
  <td class=xl53 x:num><%=p_week %></td>
  <td class=xl30></td>
  <td colspan=21 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl24 colspan=2 style='mso-ignore:colspan'>Reporter</td>
  <td colspan=2 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl48><%=p_user %></td>
  <td colspan=2 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td height=27 class=xl25 style='height:20.25pt'></td>
  <td class=xl52>From</td>
  <td class=xl54><%=p_from.Substring(6,2) + "/" + p_from.Substring(4,2) + "/" + p_from.Substring(0,4) %></td>
  <td class=xl52>To</td>
  <td class=xl54><%=p_to.Substring(6,2) + "/" + p_to.Substring(4,2) + "/" + p_to.Substring(0,4) %></td>
  <td class=xl49></td>
  <td class=xl25></td>
  <td colspan=20 class=xl49 style='mso-ignore:colspan'></td>
  <td class=xl24 colspan=3 style='mso-ignore:colspan'>Report Date</td>
  <td class=xl25></td>
  <td colspan=3 class=xl55 x:num><%= dt.Rows[0][37].ToString() %></td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td height=27 colspan=4 class=xl26 style='height:20.25pt;mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td colspan=29 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl31 height=43 style='mso-height-source:userset;height:32.25pt'>
  <td height=43 class=xl40 width=36 style='height:32.25pt;width:27pt'>No</td>
  <td class=xl41 width=94 style='width:71pt'>Department</td>
  <td class=xl41 width=98 style='width:74pt'>Group</td>
  <td class=xl41 width=75 style='width:56pt'>Emp ID</td>
  <td class=xl42 width=161 style='width:121pt'>Full Name</td>
  <td class=xl43 width=86 style='width:65pt'>Join_Date</td>
  <td colspan=4 class=xl56 width=156 style='border-right:.5pt solid black;
  border-left:none;width:116pt'>Mon<br>
    (<%= dt_name.Rows[0][0].ToString() %>)</td>
  <td colspan=4 class=xl56 width=156 style='border-right:.5pt solid black;
  border-left:none;width:116pt'>Tue<br>
    (<%= dt_name.Rows[1][0].ToString() %>)</td>
  <td colspan=4 class=xl56 width=156 style='border-right:.5pt solid black;
  border-left:none;width:116pt'>Wed<br>
    (<%= dt_name.Rows[2][0].ToString() %>)</td>
  <td colspan=4 class=xl56 width=156 style='border-right:.5pt solid black;
  border-left:none;width:116pt'>Thu<br>
    (<%= dt_name.Rows[3][0].ToString() %>)</td>
  <td colspan=4 class=xl56 width=156 style='border-right:.5pt solid black;
  border-left:none;width:116pt'>Fri<br>
    (<%= dt_name.Rows[4][0].ToString() %>)</td>
  <td colspan=4 class=xl56 width=163 style='border-right:.5pt solid black;
  border-left:none;width:122pt'>Sat<br>
    (<%= dt_name.Rows[5][0].ToString() %>)</td>
    <td colspan=4 class=xl56 width=163 style='border-right:.5pt solid black;
  border-left:none;width:122pt'>Sun<br>
    (<%= dt_name.Rows[6][0].ToString() %>)</td>
  <td colspan=4 class=xl56 width=180 style='border-right:.5pt solid black;
  border-left:none;width:134pt'>Total</td>
 </tr>
 <tr class=xl31 height=43 style='mso-height-source:userset;height:32.25pt'>
  <td height=43 class=xl44 width=36 style='height:32.25pt;border-top:none;
  width:27pt'>STT</td>
  <td class=xl45 width=94 style='border-top:none;width:71pt'>B&#7897;
  ph&#7853;n</td>
  <td class=xl45 width=98 style='border-top:none;width:74pt'>Nhóm</td>
  <td class=xl45 width=75 style='border-top:none;width:56pt'>Mã NV</td>
  <td class=xl46 width=161 style='border-top:none;width:121pt'>H&#7885; và tên
  NV</td>
  <td class=xl47 width=86 style='border-top:none;width:65pt'>Ngày vào</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>WT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>OT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>NT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>HT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>WT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>OT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>NT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>HT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>WT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>OT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>NT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>HT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>WT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>OT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>NT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>HT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>WT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>OT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>NT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>HT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>WT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>OT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>NT</td>
  <td class=xl45 width=46 style='border-top:none;width:35pt'>HT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>WT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>OT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>NT</td>
  <td class=xl45 width=46 style='border-top:none;width:35pt'>HT</td>
  <td class=xl45 width=47 style='border-top:none;width:35pt'>WT</td>
  <td class=xl45 width=47 style='border-top:none;width:35pt'>OT</td>
  <td class=xl45 width=39 style='border-top:none;width:29pt'>NT</td>
  <td class=xl45 width=47 style='border-top:none;width:35pt'>HT</td>
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
 <tr class=xl31 height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl32 width=36 style='height:22.5pt;border-top:none;
  width:27pt<%=s_format%>' x:num><%=i+1 %></td>
  <td class=xl50 style='border-top:none<%=s_format%>'><% = dt.Rows[i][0].ToString()%></td>
  <td class=xl50 style='border-top:none<%=s_format%>'><% = dt.Rows[i][1].ToString()%></td>
  <td class=xl35 width=75 style='border-top:none;width:56pt<%=s_format%>' x:num><% = dt.Rows[i][2].ToString()%></td>
  <td class=xl33 style='border-top:none<%=s_format%>'><% = dt.Rows[i][3].ToString()%></td>
  <td class=xl34 width=86 style='border-top:none;width:65pt<%=s_format%>'><% = dt.Rows[i][4].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][5].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][6].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][7].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][8].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][9].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][10].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][11].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][12].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][13].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][14].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][15].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][16].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][17].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][18].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][19].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][20].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][21].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][22].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][23].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][24].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][25].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][26].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][27].ToString()%></td>
  <td class=xl35 width=46 style='border-top:none;width:35pt<%=s_format%>' x:num><% = dt.Rows[i][28].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][29].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][30].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][31].ToString()%></td>
  <td class=xl35 width=46 style='border-top:none;width:35pt<%=s_format%>' x:num><% = dt.Rows[i][32].ToString()%></td>
  <td class=xl35 width=47 style='border-top:none;width:35pt<%=s_format%>' x:num><% = dt.Rows[i][33].ToString()%></td>
  <td class=xl35 width=47 style='border-top:none;width:35pt<%=s_format%>' x:num><% = dt.Rows[i][34].ToString()%></td>
  <td class=xl35 width=39 style='border-top:none;width:29pt<%=s_format%>' x:num><% = dt.Rows[i][35].ToString()%></td>
  <td class=xl35 width=47 style='border-top:none;width:35pt<%=s_format%>' x:num><% = dt.Rows[i][36].ToString()%></td>
 </tr>
<%
    }
  %>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=36 style='width:27pt'></td>
  <td width=94 style='width:71pt'></td>
  <td width=98 style='width:74pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=161 style='width:121pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=46 style='width:35pt'></td>
  <td width=47 style='width:35pt'></td>
  <td width=47 style='width:35pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=47 style='width:35pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
