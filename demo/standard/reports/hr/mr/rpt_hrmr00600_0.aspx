<%@ Page Language="C#"%>
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
    string p_tco_org_pk, p_wg, p_from, p_to, p_lsttmp, p_emp_search, p_lststatus;
    p_tco_org_pk = Request.QueryString["p_tco_org_pk"].ToString();
    p_wg = Request.QueryString["p_wg"].ToString();
    p_from = Request.QueryString["p_from"].ToString();
    p_to = Request.QueryString["p_to"].ToString();
    p_emp_search = Request.QueryString["p_txttmp"].ToString();
    p_lststatus = Request.QueryString["p_lststatus"].ToString();
    
    string SQL_rule
	= "SELECT NVL(V.NUM_1,0),NVL(V.NUM_2,0), to_char(sysdate,'dd-mm-yyyy') " +
        "   ,to_char(last_day(to_date(substr('"+ p_to+"',1,6),'yyyymm')),'dd-mm-yyyy')" +
        "    FROM VHR_HR_CODE V  " +
        "    WHERE V.ID='HR0099' " ;
    DataTable dt_rule = CtlLib.TableReadOpen(SQL_rule);

    string SQL
    = "select TO_CHAR (LAST_DAY (TO_DATE (substr('" + p_to + "',1,6), 'YYYYMM')), 'YYYYMMDD') from dual ";

    DataTable dt_to_dt = CtlLib.TableReadOpen(SQL);
    
     SQL
    = "SELECT max(d.ORG_NM),max(g.WORKGROUP_NM) , max(a.EMP_ID), max(a.FULL_NAME)   " +
        "         ,SUM(CASE  " +
        "                WHEN  (TO_DATE(b.DATE_IN||b.TIME_IN,'YYYYMMDDHH24:MI')- " +
        "                    TO_DATE(b.WORK_DT||s.START_TIME ,'YYYYMMDDHH24:MI'))*24*60>= (" + int.Parse(dt_rule.Rows[0][0].ToString()) + " + decode(RE.REG_TYPE,'03',0,F_LATELY_REGULATION(B.WORK_DT,RE.START_DT,RE.END_DT,RE.MI))) THEN 1 " +
        "                ELSE 0  " +
        "              END " +
        "            ) AS IN_LATE " +
        "            ,SUM(CASE  " +
        "                    WHEN  (DECODE(s.DURING_DAY,1,TO_DATE(b.WORK_DT||s.END_TIME,'YYYYMMDDHH24:MI'), " +
        "                        TO_DATE(b.WORK_DT||s.END_TIME,'YYYYMMDDHH24:MI')+1)- " +
        "                            TO_DATE(b.DATE_OUT||b.TIME_OUT,'YYYYMMDDHH24:MI'))*24*60 >= (" + int.Parse(dt_rule.Rows[0][1].ToString()) + " + decode(RE.REG_TYPE,'03',0,F_LATELY_REGULATION(B.WORK_DT,RE.START_DT,RE.END_DT,RE.MI))) THEN 1 " +
        "                    ELSE 0  " +
        "                 END " +
        "            ) AS OUT_EARLY " +
        "            ,SUM(NVL(B.NO_SCAN_FLAG,0))*(-1) AS NO_SCAN_CARD " +
        "    FROM thr_employee a, " +
        "         thr_time_machine b,thr_work_group g, tco_org d, " +
        "         tco_abcalendar c, " +
        "         thr_work_shift s, " +
        "    (SELECT R.THR_EMP_PK THR_EMP_PK,MAX(R.START_DT) START_DT,MAX(R.END_DT) END_DT,MAX(NVL(R.REG_HOURS,0))*60 AS MI, R.REG_TYPE REG_TYPE " +
        "                    FROM THR_REGULATION R WHERE R.DEL_IF=0 " +
        "                    GROUP BY R.THR_EMP_PK, R.REG_TYPE " +
        "                    HAVING MAX(R.START_DT)<='" + p_to + "' AND MAX(R.END_DT)>='" + p_from + "') RE " +
        "   WHERE a.del_if = 0 and g.DEL_IF=0 and d.DEL_IF=0 and a.thr_wg_pk=g.pk and d.pk=A.TCO_ORG_PK " +
        "     AND b.del_if = 0 " +
        "     AND s.del_if = 0 " +
        "     AND b.thr_ws_pk = s.pk " +
        "     AND a.pk = b.thr_emp_pk " +
        "     AND b.work_dt = c.car_date " +
        "     AND b.hol_type IS NULL " +
        "     AND b.work_dt BETWEEN '" + p_from + "' AND '" + p_to + "' " +
        "     AND A.PK=RE.THR_EMP_PK(+) " +
        "     AND NVL (a.left_dt, '" + p_to + "') >= '" + p_from + "' " +
        "AND (    A.TCO_ORG_PK IN ( " + 
        "                              SELECT     G.PK " +
        "                                    FROM TCO_ORG G " +
        "                                   WHERE G.DEL_IF = 0 " +
        "                              START WITH G.PK = " +
        "                                            DECODE ('"+p_tco_org_pk+"', " +
        "                                                    'ALL', 0, " +
        "                                                    '"+p_tco_org_pk+"' " +
        "                                                   ) " +
        "                              CONNECT BY PRIOR G.PK = G.P_PK) " +
        "                        OR '"+p_tco_org_pk+"' = 'ALL') " +
        "          AND DECODE ('"+p_wg+"', 'ALL', '"+p_wg+"', a.thr_wg_pk) = '"+p_wg+"'    " +
        "          AND DECODE ('" + p_lststatus + "', 'ALL', '" + p_lststatus + "', a.status) = '" + p_lststatus + "'    " +
		"  			AND ('"+ p_emp_search +"' IS NULL  " + 
		"                 OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('"+ p_emp_search +"')|| '%') " +
		"                 OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('"+ p_emp_search +"')|| '%') " +
		"                 OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('"+ p_emp_search +"')|| '%')) " +
		"	GROUP BY a.TCO_ORG_PK, a.THR_WG_PK, a.EMP_ID, a.FULL_NAME, a.PK " +
        "          having   " +
        "            SUM(CASE  " +
        "                WHEN  (TO_DATE(b.DATE_IN||b.TIME_IN,'YYYYMMDDHH24:MI')- " +
        "                    TO_DATE(b.WORK_DT||s.START_TIME,'YYYYMMDDHH24:MI'))*24*60>= (" + int.Parse(dt_rule.Rows[0][0].ToString()) + " + decode(RE.REG_TYPE,'03',0,F_LATELY_REGULATION(B.WORK_DT,RE.START_DT,RE.END_DT,RE.MI))) THEN 1 " +
        "                ELSE 0  " +
        "              END " +
        "            ) >0  " +
        "          or " +
        "            SUM(CASE  " +
        "                    WHEN  (DECODE(s.DURING_DAY,1,TO_DATE(b.WORK_DT||s.END_TIME,'YYYYMMDDHH24:MI'), " +
        "                        TO_DATE(b.WORK_DT||s.END_TIME,'YYYYMMDDHH24:MI')+1)- " +
        "                            TO_DATE(b.DATE_OUT||b.TIME_OUT,'YYYYMMDDHH24:MI'))*24*60 >= (" + int.Parse(dt_rule.Rows[0][1].ToString()) + " + decode(RE.REG_TYPE,'03',0,F_LATELY_REGULATION(B.WORK_DT,RE.START_DT,RE.END_DT,RE.MI))) THEN 1 " +
        "                    ELSE 0  " +
        "                 END " +
        "            ) >0 " +
        "          or " +
        "            SUM(NVL(B.NO_SCAN_FLAG,0))*(-1)>0  "+
        "ORDER BY A.PK ";
    //Response.Write(SQL);
        //Response.End();        
    DataTable dt_emp = CtlLib.TableReadOpen(SQL);
    if (dt_emp.Rows.Count == 0)
    {
        Response.Write("There is no data to show");
        Response.End();
    }

    
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_employee_late_early_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_employee_late_early_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_employee_late_early_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Administrator</o:Author>
  <o:LastAuthor>Hee</o:LastAuthor>
  <o:LastPrinted>2008-12-04T02:38:59Z</o:LastPrinted>
  <o:Created>2008-12-04T02:08:38Z</o:Created>
  <o:LastSaved>2008-12-04T02:50:30Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.53in .3in .75in .53in;
	mso-header-margin:.3in;
	mso-footer-margin:.3in;}
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
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
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
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
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
.xl65
	{mso-style-parent:style0;
	font-size:22.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl66
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl67
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double #00CCFF;
	border-left:none;}
.xl68
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double #00CCFF;
	border-left:2.0pt double #00CCFF;}
.xl69
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double #00CCFF;
	border-left:none;}
.xl70
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:2.0pt double #00CCFF;
	border-bottom:2.0pt double #00CCFF;
	border-left:none;}
.xl71
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"General Date";}
.xl72
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double #00CCFF;
	border-right:.5pt solid #00CCFF;
	border-bottom:none;
	border-left:2.0pt double #00CCFF;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl73
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double #00CCFF;
	border-right:.5pt solid #00CCFF;
	border-bottom:none;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl74
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double #00CCFF;
	border-right:.5pt solid #00CCFF;
	border-bottom:none;
	border-left:.5pt solid #00CCFF;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl75
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double #00CCFF;
	border-right:2.0pt double #00CCFF;
	border-bottom:none;
	border-left:.5pt solid #00CCFF;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl76
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt dashed #00CCFF;
	border-right:.5pt dashed #00CCFF;
	border-bottom:.5pt dashed #00CCFF;
	border-left:2.0pt double #00CCFF;}
.xl77
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt dashed #00CCFF;
	border-right:.5pt dashed #00CCFF;
	border-bottom:.5pt dashed #00CCFF;
	border-left:none;}
.xl78
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\\ ?\/?";
	text-align:left;
	vertical-align:middle;
	border:.5pt dashed #00CCFF;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl79
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt dashed #00CCFF;}
.xl80
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt dashed #00CCFF;
	border-right:2.0pt double #00CCFF;
	border-bottom:.5pt dashed #00CCFF;
	border-left:.5pt dashed #00CCFF;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>8</x:ActiveRow>
       <x:ActiveCol>4</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
    <x:PageBreaks>
     <x:RowBreaks>
      <x:RowBreak>
       <x:Row>46</x:Row>
      </x:RowBreak>
     </x:RowBreaks>
    </x:PageBreaks>
   </x:ExcelWorksheet>
   <x:ExcelWorksheet>
    <x:Name>Sheet2</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
   <x:ExcelWorksheet>
    <x:Name>Sheet3</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>8130</x:WindowHeight>
  <x:WindowWidth>15135</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>45</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl66>

<table x:str border=0 cellpadding=0 cellspacing=0 width=794 style='border-collapse:
 collapse;table-layout:fixed;width:597pt'>
 <col class=xl66 width=45 style='mso-width-source:userset;mso-width-alt:1440;
 width:34pt'>
 <col class=xl66 width=126 style='mso-width-source:userset;mso-width-alt:4032;
 width:95pt'>
 <col class=xl66 width=135 style='mso-width-source:userset;mso-width-alt:4320;
 width:101pt'>
 <col class=xl66 width=83 style='mso-width-source:userset;mso-width-alt:2656;
 width:62pt'>
 <col class=xl66 width=193 style='mso-width-source:userset;mso-width-alt:6176;
 width:145pt'>
 <col class=xl66 width=61 style='mso-width-source:userset;mso-width-alt:1952;
 width:46pt'>
 <col class=xl66 width=54 style='mso-width-source:userset;mso-width-alt:1728;
 width:41pt'>
 <col class=xl66 width=97 style='mso-width-source:userset;mso-width-alt:3104;
 width:73pt'>
 <tr height=36 style='height:27.0pt'>
  <td colspan=8 height=36 class=xl65 width=794 style='height:27.0pt;width:597pt'>LATE
  IN AND EARLY OUT REPORT</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=2 class=xl66 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=3 class=xl67>From: <%=DateTime.Parse(p_from.Insert(4,"-").Insert(7,"-")).ToString("dd-MM-yyyy") %> 
  To:   <%=DateTime.Parse(dt_to_dt.Rows[0][0].ToString().Insert(4, "-").Insert(7, "-")).ToString("dd-MM-yyyy")%> </td>
  
  <td colspan=3 class=xl67>Printed Date: <%=dt_rule.Rows[0][2].ToString() %> </td>
 </tr> 
 <tr height=50 style='mso-height-source:userset;height:37.5pt'>
  <td height=50 class=xl72 width=45 style='height:37.5pt;width:34pt'>Seq</td>
  <td class=xl73 width=126 style='width:95pt'>Department</td>
  <td class=xl74 width=135 style='border-top:none;border-left:none;width:101pt'>Group</td>
  <td class=xl74 width=83 style='border-top:none;border-left:none;width:62pt'>EmpID</td>
  <td class=xl74 width=193 style='border-left:none;width:145pt'>Full Name</td>
  <td class=xl74 width=61 style='border-top:none;border-left:none;width:46pt'>Late
  In</td>
  <td class=xl74 width=54 style='border-top:none;border-left:none;width:41pt'>Early
  Out</td>
  <td class=xl75 width=97 style='display:none; border-top:none;border-left:none;width:73pt'>None
  Scan Card</td>
 </tr>
 <%
     for (int i = 0; i < dt_emp.Rows.Count; i++)
     { %>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl76 style='height:16.5pt' x:num><%=i+1 %></td>
  <td class=xl78 style='text-align:left'><%=dt_emp.Rows[i][0].ToString() %></td>
  <td class=xl78 style='border-left:none'><%=dt_emp.Rows[i][1].ToString() %></td>
  <td class=xl79 style='border-left:none'><%=dt_emp.Rows[i][2].ToString() %></td>
  <td class=xl78 style='border-left:none'><%=dt_emp.Rows[i][3].ToString() %></td>
  <td class=xl79 style='border-left:none' x:num><%=dt_emp.Rows[i][4].ToString() %></td>
  <td class=xl79 style='border-left:none' x:num><%=dt_emp.Rows[i][5].ToString() %></td>
  <td class=xl80 style='border-left:none' x:num><%=dt_emp.Rows[i][6].ToString() %></td>
 </tr>
 <% }//end for %>
 <tr height=4 style='mso-height-source:userset;height:3.0pt'>
  <td height=4 class=xl68 style='height:3.0pt'>&nbsp;</td>
  <td class=xl69>&nbsp;</td>
  <td class=xl69>&nbsp;</td>
  <td class=xl69>&nbsp;</td>
  <td class=xl69>&nbsp;</td>
  <td class=xl69>&nbsp;</td>
  <td class=xl69>&nbsp;</td>
  <td class=xl70>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=7 class=xl66 style='height:15.0pt;mso-ignore:colspan'></td>
  <td class=xl71></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=45 style='width:34pt'></td>
  <td width=126 style='width:95pt'></td>
  <td width=135 style='width:101pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=193 style='width:145pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=54 style='width:41pt'></td>
  <td width=97 style='width:73pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
