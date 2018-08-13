<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<%
    string emp_pk = Request.QueryString["emp_pk"].ToString();
    string from_dt = Request.QueryString["from_dt"].ToString();
    string to_dt = Request.QueryString["to_dt"].ToString();
    string p_lststatus = Request.QueryString["lstStatus"].ToString();

    //Response.Write(emp_pk.Substring(0, emp_pk.Length - 1));
    //Response.End();
           
    string SQL
    = "SELECT NVL(V.NUM_1,0),NVL(V.NUM_2,0)  " +
        "    FROM VHR_HR_CODE V  " +
        "    WHERE V.ID='HR0039' ";

    DataTable dt_rule = CtlLib.TableReadOpen(SQL);
    
    SQL
    = "select TO_CHAR (LAST_DAY (TO_DATE (substr('" + to_dt + "',1,6), 'YYYYMM')), 'YYYYMMDD') from dual ";

    DataTable dt_to_dt = CtlLib.TableReadOpen(SQL);
    
    //SQL = "";
    SQL= "SELECT  (select g.WORKGROUP_NM from thr_work_group g where g.DEL_IF=0 and g.PK=a.thr_wg_PK ), a.EMP_ID   "  +
           "       , a.FULL_NAME , to_char(to_date(a.join_dt,'yyyymmdd'),'dd-mm-yyyy'),to_char(to_date(b.work_dt,'yyyymmdd'),'dd-mm-yyyy'),     b.TIME_IN " +          
           "    FROM thr_employee a, " +
           "         thr_time_machine b, " +
           "         tco_abcalendar c, " +
           "         thr_work_shift s " +
           "   WHERE a.del_if=0 and b.del_if=0 and s.del_if=0 AND b.thr_ws_pk = s.pk  AND a.pk = b.thr_emp_pk " +
           "     AND b.work_dt = c.car_date AND b.hol_type IS NULL and   a.PK in  ( " +  emp_pk.Substring(0,emp_pk.Length-1) + ")" +
           "          AND DECODE ('" + p_lststatus + "', 'ALL', '" + p_lststatus + "', a.status) = '" + p_lststatus + "'    " +
           "     AND b.work_dt BETWEEN '" + from_dt + "' and '" + dt_to_dt.Rows[0][0].ToString() + "' AND NVL (a.left_dt, '" + dt_to_dt.Rows[0][0].ToString() + "') >= '" + from_dt + "' " +
           "          having    SUM(CASE  " 
       +"                WHEN  (TO_DATE(b.DATE_IN||b.TIME_IN,'YYYYMMDDHH24:MI')- " 
       +"                    TO_DATE(b.WORK_DT||s.START_TIME,'YYYYMMDDHH24:MI'))*24*60>="+int.Parse(dt_rule.Rows[0][0].ToString())+" THEN 1 " 
       +"                ELSE 0  " 
       +"              END " 
       +"            ) >0  "  +             
           "GROUP BY a.thr_wg_PK, a.EMP_ID, a.FULL_NAME , a.JOIN_DT, b.WORK_DT, b.TIME_IN order by a.emp_id ";
    //Response.Write(SQL);
    //Response.End();
    DataTable dt_late = CtlLib.TableReadOpen(SQL);
    
    
    
    SQL= "SELECT  (select g.WORKGROUP_NM from thr_work_group g where g.DEL_IF=0 and g.PK=a.thr_wg_PK ), a.EMP_ID   "  +
           "       , a.FULL_NAME , to_char(to_date(a.join_dt,'yyyymmdd'),'dd-mm-yyyy'),to_char(to_date(b.work_dt,'yyyymmdd'),'dd-mm-yyyy'),     b.TIME_OUT " +          
           "    FROM thr_employee a, " +
           "         thr_time_machine b, " +
           "         tco_abcalendar c, " +
           "         thr_work_shift s " +
           "   WHERE a.del_if=0 and b.del_if=0 and s.del_if=0 AND b.thr_ws_pk = s.pk  AND a.pk = b.thr_emp_pk " +
           "     AND b.work_dt = c.car_date AND c.hol_type IS NULL and   a.PK in  ( " + emp_pk.Substring(0, emp_pk.Length - 1) + ")" +
           "          AND DECODE ('" + p_lststatus + "', 'ALL', '" + p_lststatus + "', a.status) = '" + p_lststatus + "'    " +
           "     AND b.work_dt BETWEEN '" + from_dt + "' and '" + dt_to_dt.Rows[0][0].ToString() + "'  AND NVL (a.left_dt, '" + dt_to_dt.Rows[0][0].ToString() + "') >= '" + from_dt + "' " +
           "          having   SUM(CASE  " 
          + "                    WHEN  (DECODE(s.DURING_DAY,1,TO_DATE(b.WORK_DT||s.END_TIME,'YYYYMMDDHH24:MI'), " 
          + "                        TO_DATE(b.WORK_DT||s.END_TIME,'YYYYMMDDHH24:MI')+1)- "
          + "                            TO_DATE(b.DATE_OUT||b.TIME_OUT,'YYYYMMDDHH24:MI'))*24*60 >=" + int.Parse(dt_rule.Rows[0][1].ToString()) + " THEN 1 " 
          + "                    ELSE 0  " 
          + "                 END " 
          + "            ) >0 "  +             
           "GROUP BY a.thr_wg_PK, a.EMP_ID, a.FULL_NAME , a.JOIN_DT, b.WORK_DT, b.TIME_OUT order by a.emp_id ";
    //Response.Write(SQL);
    //Response.End(); 
    DataTable dt_early = CtlLib.TableReadOpen(SQL);    

    SQL = "SELECT  (select g.WORKGROUP_NM from thr_work_group g where g.DEL_IF=0 and g.PK=a.thr_wg_PK ), a.EMP_ID   " +
           "       , a.FULL_NAME , to_char(to_date(a.join_dt,'yyyymmdd'),'dd-mm-yyyy'),to_char(to_date(b.work_dt,'yyyymmdd'),'dd-mm-yyyy'),   null " +
           "    FROM thr_employee a, " +
           "         thr_time_machine b, " +
           "         tco_abcalendar c, " +
           "         thr_work_shift s " +
           "   WHERE a.del_if=0 and b.del_if=0 and s.del_if=0 AND b.thr_ws_pk = s.pk  AND a.pk = b.thr_emp_pk " +
           "     AND b.work_dt = c.car_date AND c.hol_type IS NULL and   a.PK in  ( " + emp_pk.Substring(0, emp_pk.Length - 1) + ")" +
           "          AND DECODE ('" + p_lststatus + "', 'ALL', '" + p_lststatus + "', a.status) = '" + p_lststatus + "'    " +
           "     AND b.work_dt BETWEEN '" + from_dt + "' and '" + dt_to_dt.Rows[0][0].ToString() + "'  AND NVL (a.left_dt, '" + dt_to_dt.Rows[0][0].ToString() + "') >= '" + from_dt + "' " +
           "          having    SUM(NVL(B.NO_SCAN_FLAG,0))*(-1)>0  " +
           "GROUP BY a.thr_wg_PK, a.EMP_ID, a.FULL_NAME , a.JOIN_DT, b.WORK_DT, null order by a.emp_id ";

    //Response.Write(SQL);
    //Response.End(); 
    DataTable dt_nonescan = CtlLib.TableReadOpen(SQL);    
    
        
 %>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_employee_late_early_detail_files/filelist.xml">
<link rel=Edit-Time-Data
href="rpt_employee_late_early_detail_files/editdata.mso">
<link rel=OLE-Object-Data
href="rpt_employee_late_early_detail_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Hee</o:Author>
  <o:LastAuthor>Hee</o:LastAuthor>
  <o:LastPrinted>2008-12-08T03:00:44Z</o:LastPrinted>
  <o:Created>2008-12-08T02:36:27Z</o:Created>
  <o:LastSaved>2008-12-08T03:06:18Z</o:LastSaved>
  <o:Company>Hee Nguyen</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.72in .25in 1.0in .28in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;}
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
	font-size:18.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl25
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl27
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:2.0pt double aqua;
	border-right:none;
	border-bottom:2.0pt double aqua;
	border-left:2.0pt double aqua;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl28
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:2.0pt double aqua;
	border-right:2.0pt double aqua;
	border-bottom:2.0pt double aqua;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl29
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl30
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:2.0pt double aqua;
	border-right:.5pt solid aqua;
	border-bottom:none;
	border-left:2.0pt double aqua;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl31
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:2.0pt double aqua;
	border-right:.5pt solid aqua;
	border-bottom:none;
	border-left:.5pt solid aqua;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl32
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:2.0pt double aqua;
	border-right:2.0pt double aqua;
	border-bottom:none;
	border-left:.5pt solid aqua;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl33
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt dashed aqua;
	border-right:.5pt dashed aqua;
	border-bottom:.5pt dashed aqua;
	border-left:2.0pt double aqua;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl34
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt dashed aqua;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl35
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt dashed aqua;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl36
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt dashed aqua;
	border-right:2.0pt double aqua;
	border-bottom:.5pt dashed aqua;
	border-left:.5pt dashed aqua;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl37
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt dashed aqua;
	border-right:.5pt dashed aqua;
	border-bottom:2.0pt double aqua;
	border-left:2.0pt double aqua;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl38
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt dashed aqua;
	border-right:.5pt dashed aqua;
	border-bottom:2.0pt double aqua;
	border-left:.5pt dashed aqua;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl39
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt dashed aqua;
	border-right:.5pt dashed aqua;
	border-bottom:2.0pt double aqua;
	border-left:.5pt dashed aqua;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl40
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt dashed aqua;
	border-right:2.0pt double aqua;
	border-bottom:2.0pt double aqua;
	border-left:.5pt dashed aqua;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl41
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl42
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>3</x:ActiveRow>
       <x:ActiveCol>1</x:ActiveCol>
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
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
   <x:ExcelWorksheet>
    <x:Name>Sheet3</x:Name>
    <x:WorksheetOptions>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>12270</x:WindowHeight>
  <x:WindowWidth>15195</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>45</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl25>

<table x:str border=0 cellpadding=0 cellspacing=0 width=754 style='border-collapse:
 collapse;table-layout:fixed;width:567pt'>
 <col class=xl25 width=22 style='mso-width-source:userset;mso-width-alt:804;
 width:17pt'>
 <col class=xl25 width=39 style='mso-width-source:userset;mso-width-alt:1426;
 width:29pt'>
 <col class=xl25 width=126 style='mso-width-source:userset;mso-width-alt:4608;
 width:95pt'>
 <col class=xl25 width=74 style='mso-width-source:userset;mso-width-alt:2706;
 width:56pt'>
 <col class=xl25 width=171 style='mso-width-source:userset;mso-width-alt:6253;
 width:128pt'>
 <col class=xl25 width=82 style='mso-width-source:userset;mso-width-alt:2998;
 width:62pt'>
 <col class=xl25 width=91 style='mso-width-source:userset;mso-width-alt:3328;
 width:68pt'>
 <col class=xl25 width=85 style='mso-width-source:userset;mso-width-alt:3108;
 width:64pt'>
 <col class=xl25 width=64 style='width:48pt'>
 <tr height=30 style='height:22.5pt'>
  <td colspan=9 height=30 class=xl24 width=754 style='height:22.5pt;width:567pt'>LATE
  IN EARLY OUT IN DETAILS</td>
 </tr>
 <tr height=11 style='mso-height-source:userset;height:8.25pt'>
  <td height=11 colspan=9 class=xl24 style='height:8.25pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=4 class=xl25 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl26>From: <%=DateTime.Parse(from_dt.Insert(4,"-").Insert(7,"-")).ToString("dd-MM-yyyy") %> 
  To: <%=DateTime.Parse(dt_to_dt.Rows[0][0].ToString().Insert(4, "-").Insert(7, "-")).ToString("dd-MM-yyyy")%> </td>
  <td colspan=2 class=xl26>Printed date: <%=DateTime.Now.Date.ToString("dd-MM-yyyy") %></td>
  <td class=xl25></td>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 colspan=9 class=xl25 style='height:13.5pt;mso-ignore:colspan'></td>
 </tr>
 <% if(dt_late.Rows.Count>0)
    { %>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl25 style='height:19.5pt'></td>
  <td colspan=2 class=xl27 style='border-right:2.0pt double aqua'>LATE IN</td>
  <td colspan=5 class=xl29 style='mso-ignore:colspan'></td>
  <td class=xl25></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 class=xl29 style='height:15.75pt'></td>
  <td class=xl30 style='border-top:none'>SEQ</td>
  <td class=xl31 style='border-top:none;border-left:none'>GROUP</td>
  <td class=xl31 style='border-left:none'>EMP ID</td>
  <td class=xl31 style='border-left:none'>NAME</td>
  <td class=xl31 style='border-left:none'>JOIN DATE</td>
  <td class=xl31 style='border-left:none'>WORK DATE</td>
  <td class=xl32 style='border-left:none'>WORK TIME</td>
  <td class=xl25></td>
 </tr>
    <%
        for(int i=0; i<dt_late.Rows.Count;i++)
        {
     %>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 class=xl25 style='height:15.75pt'></td>
  <td class=xl33 x:num><%=i+1 %></td>
  <td class=xl34 style='border-left:none'> <%=dt_late.Rows[i][0].ToString() %> </td>
  <td class=xl35 style='border-left:none'><%=dt_late.Rows[i][1].ToString() %></td>
  <td class=xl34 style='border-left:none'><%=dt_late.Rows[i][2].ToString() %></td>
  <td class=xl35 style='border-left:none'><%=dt_late.Rows[i][3].ToString() %></td>
  <td class=xl35 style='border-left:none'><%=dt_late.Rows[i][4].ToString() %></td>
  <td class=xl36 style='border-left:none'><%=dt_late.Rows[i][5].ToString() %></td>
  <td class=xl25></td>
 </tr>  
    <%
        } %>
 <tr height=4 style='mso-height-source:userset;height:3.0pt'>
  <td height=4 class=xl25 style='height:3.0pt'></td>
  <td class=xl37 style='border-top:none'>&nbsp;</td>
  <td class=xl38 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl39 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl38 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl39 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl39 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl40 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl25></td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 class=xl25 style='height:26.25pt'></td>
  <td class=xl41></td>
  <td class=xl42></td>
  <td class=xl41></td>
  <td class=xl42></td>
  <td colspan=3 class=xl41 style='mso-ignore:colspan'></td>
  <td class=xl25></td>
 </tr>
 <%
    }//late if
     
     if(dt_early.Rows.Count>0)
     {
  %>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl25 style='height:19.5pt'></td>
  <td colspan=2 class=xl27 style='border-right:2.0pt double aqua'>EARLY OUT</td>
  <td colspan=5 class=xl29 style='mso-ignore:colspan'></td>
  <td class=xl25></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 class=xl29 style='height:15.75pt'></td>
  <td class=xl30 style='border-top:none'>SEQ</td>
  <td class=xl31 style='border-top:none;border-left:none'>GROUP</td>
  <td class=xl31 style='border-left:none'>EMP ID</td>
  <td class=xl31 style='border-left:none'>NAME</td>
  <td class=xl31 style='border-left:none'>JOIN DATE</td>
  <td class=xl31 style='border-left:none'>WORK DATE</td>
  <td class=xl32 style='border-left:none'>WORK TIME</td>
  <td class=xl25></td>
 </tr>
    <%
        for(int i=0; i<dt_early.Rows.Count;i++)
        {
     %>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 class=xl25 style='height:15.75pt'></td>
  <td class=xl33 x:num><%=i+1 %></td>
  <td class=xl34 style='border-left:none'><%=dt_early.Rows[i][0].ToString() %></td>
  <td class=xl35 style='border-left:none'><%=dt_early.Rows[i][1].ToString() %></td>
  <td class=xl34 style='border-left:none'><%=dt_early.Rows[i][2].ToString() %></td>
  <td class=xl35 style='border-left:none'><%=dt_early.Rows[i][3].ToString() %></td>
  <td class=xl35 style='border-left:none'><%=dt_early.Rows[i][4].ToString() %></td>
  <td class=xl36 style='border-left:none'><%=dt_early.Rows[i][5].ToString() %></td>
  <td class=xl25></td>
 </tr>
    <%  } %>
 <tr height=4 style='mso-height-source:userset;height:3.0pt'>
  <td height=4 class=xl25 style='height:3.0pt'></td>
  <td class=xl37 style='border-top:none'>&nbsp;</td>
  <td class=xl38 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl39 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl38 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl39 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl39 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl40 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl25></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 colspan=9 class=xl25 style='height:27.75pt;mso-ignore:colspan'></td>
 </tr>
 <% }//early if

    if (dt_nonescan.Rows.Count > 0)
    {
      %>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl25 style='height:19.5pt'></td>
  <td colspan=2 class=xl27 style='border-right:2.0pt double aqua'>NONE SCAN
  CARD</td>
  <td colspan=5 class=xl29 style='mso-ignore:colspan'></td>
  <td class=xl25></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 class=xl29 style='height:15.75pt'></td>
  <td class=xl30 style='border-top:none'>SEQ</td>
  <td class=xl31 style='border-top:none;border-left:none'>GROUP</td>
  <td class=xl31 style='border-left:none'>EMP ID</td>
  <td class=xl31 style='border-left:none'>NAME</td>
  <td class=xl31 style='border-left:none'>JOIN DATE</td>
  <td class=xl31 style='border-left:none'>WORK DATE</td>
  <td class=xl32 style='border-left:none'>WORK TIME</td>
  <td class=xl25></td>
 </tr>
     <%
        for(int i=0; i<dt_nonescan.Rows.Count;i++)
        {
     %>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 class=xl25 style='height:15.75pt'></td>
  <td class=xl33 x:num><%=i+1 %></td>
  <td class=xl34 style='border-left:none'><%=dt_nonescan.Rows[i][0].ToString() %></td>
  <td class=xl35 style='border-left:none'><%=dt_nonescan.Rows[i][1].ToString() %></td>
  <td class=xl34 style='border-left:none'><%=dt_nonescan.Rows[i][2].ToString() %></td>
  <td class=xl35 style='border-left:none'><%=dt_nonescan.Rows[i][3].ToString() %></td>
  <td class=xl35 style='border-left:none'><%=dt_nonescan.Rows[i][4].ToString() %></td>
  <td class=xl36 style='border-left:none'><%=dt_nonescan.Rows[i][5].ToString() %></td>
  <td class=xl25></td>
 </tr>
    <%  } %>
 <tr height=4 style='mso-height-source:userset;height:3.0pt'>
  <td height=4 class=xl25 style='height:3.0pt'></td>
  <td class=xl37 style='border-top:none'>&nbsp;</td>
  <td class=xl38 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl39 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl38 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl39 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl39 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl40 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl25></td>
 </tr>
 <% } %>
 <tr height=18 style='height:13.5pt'>
  <td height=18 colspan=9 class=xl25 style='height:13.5pt;mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=22 style='width:17pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=126 style='width:95pt'></td>
  <td width=74 style='width:56pt'></td>
  <td width=171 style='width:128pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=91 style='width:68pt'></td>
  <td width=85 style='width:64pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
