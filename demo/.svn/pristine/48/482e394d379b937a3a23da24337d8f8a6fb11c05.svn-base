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
    string l_group = Request.QueryString["l_group"].ToString();
    string l_pay_type = Request.QueryString["l_pay_type"].ToString();
    string l_m_type = Request.QueryString["l_m_type"].ToString();
    string l_bn_times = Request.QueryString["l_bn_times"].ToString();
    string l_emp_id = Request.QueryString["l_emp_id"].ToString();
    string l_dept = Request.QueryString["l_dept"].ToString();
    string l_year = Request.QueryString["l_year"].ToString();

    string SQL
    = "select tg.workGROUP_NM, count(te.EMP_ID), sum(nvl(tb.SALARY,0)), " +
        "        sum( case when tb.MONEY_KIND='02' then round(tb.BN_AMT*nvl(tb.BN_EXT_RATE,0),3) " +
        "            else round(tb.BN_AMT,0) end)  as bonus_amt " +
        "from thr_bonus tb, thr_work_group tg, thr_employee te " +
        "where tb.DEL_IF=0     " +
        "    and te.DEL_IF = 0 " +
        "    and tg.DEL_IF=0 " +
        "    and tb.THR_EMP_PK = te.pk " +
        "    and tg.PK = te.THR_WG_PK " +
        "    and decode('" + l_group + "','ALL','" + l_group + "',te.THR_WG_PK)='" + l_group + "'  " +
        "    and decode('" + l_pay_type + "','ALL','" + l_pay_type + "',tb.PAY_TYPE)='" + l_pay_type + "'  " +
        "    and decode('" + l_m_type + "','ALL','" + l_m_type + "',tb.MONEY_KIND)='" + l_m_type + "'  " +
        "    and decode('" + l_bn_times + "','ALL','" + l_bn_times + "',tb.BN_TIMES)='" + l_bn_times + "'  " +
        "    and (te.EMP_ID like  '%'||'" + l_emp_id + "'||'%' or '" + l_emp_id + "' is null) " +
        "    and tb.BN_YEAR='" + l_year + "' " +
        "    and (te.TCO_ORG_PK in   (  " +
        "                              SELECT     g.pk  " +
        "                                    FROM tco_ORG g  " +
        "                                   WHERE g.del_if = 0  " +
         "                              START WITH g.pk =  " +
        "                                            DECODE ('" + l_dept + "',  " +
        "                                                    'ALL', 0,  " +
        "                                                    '" + l_dept + "'  " +
        "                                                   )  " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "            OR '" + l_dept + "' = 'ALL')  " +
        "group by tg.WorkGROUP_NM         " +
        "order by tg.WorkGROUP_NM ";
    DataTable dt = CtlLib.TableReadOpen(SQL);
    if (dt.Rows.Count == 0)
    {
        Response.Write("There is no data to show");
        Response.End();
    }
        
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_bonus_group_payment_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_bonus_group_payment_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_bonus_group_payment_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Hee Nguyen</o:Author>
  <o:LastAuthor>Hee Nguyen</o:LastAuthor>
  <o:LastPrinted>2008-12-29T06:31:11Z</o:LastPrinted>
  <o:Created>2008-12-29T02:16:16Z</o:Created>
  <o:LastSaved>2008-12-29T06:31:30Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.62in .75in 1.0in .75in;
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
	font-size:20.0pt;
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
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl27
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl28
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl29
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl30
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl31
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl32
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl33
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border:.5pt solid windowtext;}
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
      <x:Scale>92</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>9</x:ActiveRow>
       <x:ActiveCol>4</x:ActiveCol>
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
  <x:WindowHeight>12525</x:WindowHeight>
  <x:WindowWidth>15195</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl25>

<table x:str border=0 cellpadding=0 cellspacing=0 width=666 style='border-collapse:
 collapse;table-layout:fixed;width:500pt'>
 <col class=xl25 width=54 style='mso-width-source:userset;mso-width-alt:1974;
 width:41pt'>
 <col class=xl25 width=187 style='mso-width-source:userset;mso-width-alt:6838;
 width:140pt'>
 <col class=xl25 width=131 style='mso-width-source:userset;mso-width-alt:4790;
 width:98pt'>
 <col class=xl25 width=133 style='mso-width-source:userset;mso-width-alt:4864;
 width:100pt'>
 <col class=xl25 width=161 style='mso-width-source:userset;mso-width-alt:5888;
 width:121pt'>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td colspan=5 height=31 class=xl24 width=666 style='height:23.25pt;
  width:500pt'>BONUS GROUP PAYMENT</td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=2 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
  <td class=xl26>Year:</td>
  <td class=xl26>Times:</td>
  <td class=xl26></td>
 </tr>
 <tr height=14 style='mso-height-source:userset;height:10.5pt'>
  <td height=14 colspan=3 class=xl25 style='height:10.5pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=49 style='mso-height-source:userset;height:36.75pt'>
  <td height=49 class=xl28 width=54 style='height:36.75pt;width:41pt'>SEQ</td>
  <td class=xl28 width=187 style='border-left:none;width:140pt'>GROUP</td>
  <td class=xl28 width=131 style='border-left:none;width:98pt'>NUMBER OF EMP(S)</td>
  <td class=xl28 width=133 style='border-left:none;width:100pt'>TOTAL SALARY</td>
  <td class=xl28 width=161 style='border-left:none;width:121pt'>TOTAL BONUS
  AMOUNT</td>
 </tr>
 <%
     double sum_grand1 = 0, sum_grand2 = 0, sum_grand3 = 0;
    for(int i=0;i<dt.Rows.Count;i++)
    {
        sum_grand1 += double.Parse(dt.Rows[i][1].ToString());
        sum_grand2 += double.Parse(dt.Rows[i][2].ToString());
        sum_grand3 += double.Parse(dt.Rows[i][3].ToString());
  %>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
  <td height=36 class=xl31 style='height:27.0pt;border-top:none' x:num><%=i+1 %></td>
  <td class=xl32 style='border-top:none;border-left:none'><%=dt.Rows[i][0].ToString() %></td>
  <td class=xl33 style='border-top:none;border-left:none; text-align:center' x:num><%=dt.Rows[i][1].ToString() %></td>
  <td class=xl33 style='border-top:none;border-left:none' x:num><%=dt.Rows[i][2].ToString() %></td>
  <td class=xl33 style='border-top:none;border-left:none' x:num><%=dt.Rows[i][3].ToString() %></td>
 </tr>
 <%
    } %>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=2 height=33 class=xl29 style='height:24.75pt'>GRAND TOTAL</td>
  <td class=xl30 style='border-top:none;border-left:none; text-align:center' x:num><%=sum_grand1 %></td>
  <td class=xl30 style='border-top:none;border-left:none' x:num><%=sum_grand2 %></td>
  <td class=xl30 style='border-top:none;border-left:none' x:num><%=sum_grand3 %></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=54 style='width:41pt'></td>
  <td width=187 style='width:140pt'></td>
  <td width=131 style='width:98pt'></td>
  <td width=133 style='width:100pt'></td>
  <td width=161 style='width:121pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
