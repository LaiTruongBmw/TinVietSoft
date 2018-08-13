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
    string l_tco_org, p_from_month, p_to_month, l_work_group, l_search, p_input;
     
    l_tco_org       = Request["l_tco_org"].ToString();
    l_work_group    = Request["l_work_group"].ToString();
    p_input = Request["l_temp"].ToString();        
    p_from_month    = Request["l_rpt_from_month"].ToString();
    p_to_month      = Request["l_rpt_to_month"].ToString();
    //---- dem so thang--- 
    String StrSQL="Select months_between(to_date('" + p_to_month + "','yyyymm'),to_date('" + p_from_month +"','yyyymm')) from dual ";
    DataTable dt_emp = CtlLib.TableReadOpen(StrSQL);
    int num_month=int.Parse(dt_emp.Rows[0][0].ToString()) +1 ;
    DateTime[] ADate= new DateTime[num_month];
    DateTime Cur_Date= new DateTime(int.Parse(p_from_month.Substring(0,4).ToString()),int.Parse(p_from_month.Substring(4,2).ToString()),1);
    //------Tao SQL cho tung thang -----------
    StrSQL="select  c.org_nm as c0,a.EMP_ID as c1"
                   + ",a.FULL_NAME as c2"
                   + " ,to_char(to_date(a.join_dt,'yyyymmdd'),'dd/mm/yyyy') as c3";
   for (int i=0;i<num_month;i++)     
   {
          StrSQL= StrSQL + " ,max(DECODE(ins.work_mon,to_char(add_months(to_date('" + p_from_month + "','yyyymm')," + i + "),'yyyymm') ,ins.LUONG_CB,0)) as cb"  + (i+1+3)
           + " ,max(DECODE(ins.work_mon,to_char(add_months(to_date('" + p_from_month + "','yyyymm')," + i + "),'yyyymm'),ins.LUONG_BHXH,0)) as xh" + (i+1+3)
           + " ,max(DECODE(ins.work_mon,to_char(add_months(to_date('" + p_from_month + "','yyyymm')," + i + "),'yyyymm') ,ins.LUONG_BHYT,0)) as yt"   + (i+1+3)
           + " ,max(DECODE(ins.work_mon,to_char(add_months(to_date('" + p_from_month + "','yyyymm')," + i + "),'yyyymm'),ins.LUONG_BHTN,0)) as tn"   + (i+1+3) ;        
           ADate[i]=Cur_Date.AddMonths(i);
   }
     StrSQL= StrSQL + 
     " from  THR_EMPLOYEE A,thr_insurance_month ins,tco_org c "
   + "  where ins.DEL_IF =0 and  a.DEL_IF =0 AND C.DEL_IF=0 "
   + "  and ins.WORK_MON BETWEEN '" + p_from_month + "' and '" + p_to_month + "'" 
   + "  and ins.THR_EMP_PK = a.pk "  
   + "  AND A.tco_org_pk=C.PK and decode('" + l_work_group + "','ALL','ALL',a.THR_WG_PK)='" + l_work_group + "'"
   + "  and  (  a.tco_org_pk IN (SELECT  g.pk   "
   + "                          FROM tco_org g   "
   + "                           START WITH g.pk =DECODE ('" + l_tco_org + "','ALL', 0,'" + l_tco_org + "') "
   + "                           CONNECT BY PRIOR g.pk = g.p_pk) "
   + "                     OR '" + l_tco_org + "' = 'ALL')  " +
    "              AND ('" + p_input + "' IS NULL  " +
    "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
    "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
    "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
    " GROUP BY c.org_nm,A.EMP_ID,A.FULL_NAME , a.join_dt " ;
//Response.Write(StrSQL);
//Response.End();  
    dt_emp = CtlLib.TableReadOpen(StrSQL);
    int count_emp=dt_emp.Rows.Count;
    if(count_emp==0)
    {
        Response.Write("There is no data to show");
        Response.End();
    }
   
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_insurance_month_sum_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_insurance_month_sum_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_insurance_month_sum_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>nhut_k</o:Author>
  <o:LastAuthor>Ho Thu Hien</o:LastAuthor>
  <o:LastPrinted>2010-04-22T03:36:09Z</o:LastPrinted>
  <o:Created>2010-04-22T02:59:40Z</o:Created>
  <o:LastSaved>2010-06-10T03:23:41Z</o:LastSaved>
  <o:Company>AS</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.1in .1in .1in .1in;
	mso-header-margin:.1in;
	mso-footer-margin:.1in;
	mso-horizontal-page-align:center;}
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
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl26
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:400;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl27
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl28
	{mso-style-parent:style0;
	font-size:26.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl29
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:justify;}
.xl30
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl31
	{mso-style-parent:style0;
	font-size:13.0pt;
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
	mso-pattern:auto none;}
.xl32
	{mso-style-parent:style0;
	font-size:13.0pt;
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
.xl33
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl34
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl37
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl38
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl39
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl40
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl41
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl42
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl43
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl44
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
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
     <x:DefaultRowHeight>315</x:DefaultRowHeight>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:Scale>34</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:LeftColumnVisible>2</x:LeftColumnVisible>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>20</x:ActiveRow>
       <x:ActiveCol>9</x:ActiveCol>
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
  <x:WindowHeight>8700</x:WindowHeight>
  <x:WindowWidth>10395</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>135</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$1:$5</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
<meta http-equiv="Content);" %>
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1298 style='border-collapse:
 collapse;table-layout:fixed;width:974pt'>
 <col class=xl24 width=38 style='mso-width-source:userset;mso-width-alt:1389;
 width:29pt'>
 <col class=xl24 width=197 style='mso-width-source:userset;mso-width-alt:7204;
 width:148pt'>
 <col class=xl24 width=88 style='mso-width-source:userset;mso-width-alt:3218;
 width:66pt'>
 <col class=xl24 width=198 style='mso-width-source:userset;mso-width-alt:7241;
 width:149pt'>
 <col class=xl24 width=99 style='mso-width-source:userset;mso-width-alt:3620;
 width:74pt'>
 <col class=xl24 width=119 style='mso-width-source:userset;mso-width-alt:4352;
 width:89pt'>
 <col class=xl24 width=152 style='mso-width-source:userset;mso-width-alt:5558;
 width:114pt'>
 <col class=xl24 width=116 style='mso-width-source:userset;mso-width-alt:4242;
 width:87pt'>
 <col class=xl24 width=95 style='mso-width-source:userset;mso-width-alt:3474;
 width:71pt'>
 <col class=xl24 width=93 style='mso-width-source:userset;mso-width-alt:3401;
 width:70pt'>
 <col class=xl24 width=103 style='mso-width-source:userset;mso-width-alt:3766;
 width:77pt'>
 <tr height=21 style='height:15.75pt'>
  <td colspan=11 rowspan=2 height=42 class=xl28 width=1298 style='height:31.5pt;
  width:974pt' x:str="INSURANCE MONTH ">INSURANCE MONTH
  <span style='mso-spacerun:yes'> </span></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=11 class=xl24 style='height:15.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl29 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td rowspan=2 height=62 class=xl31 style='border-bottom:.5pt solid black;
  height:46.5pt'>No</td>
  <td rowspan=2 class=xl32 width=197 style='border-bottom:.5pt solid black;
  width:148pt' x:str="Oraganization ">Oraganization<span
  style='mso-spacerun:yes'> </span></td>
  <td rowspan=2 class=xl32 width=88 style='border-bottom:.5pt solid black;
  width:66pt' x:str="Employee ID ">Employee ID<span
  style='mso-spacerun:yes'> </span></td>
  <td rowspan=2 class=xl32 width=198 style='border-bottom:.5pt solid black;
  width:149pt'>Full Name</td>
  <td rowspan=2 class=xl32 width=99 style='border-bottom:.5pt solid black;
  width:74pt'>Join Date</td>
  <% for (int j=0;j<num_month;j++){  %>
  <td colspan=4 class=xl42 width=407 style='border-right:.5pt solid black;
  border-left:none;width:305pt'><%=ADate[j].ToString("MM/yyyy") %></td>
  <%} %>
 </tr>
 <tr class=xl29 height=40 style='mso-height-source:userset;height:30.0pt'>
 <% for (int j=0;j<num_month;j++) {  %>
  <td height=40 class=xl35 width=116 style='height:30.0pt;width:87pt'
  x:str="Basic Salary ">Basic Salary<span style='mso-spacerun:yes'> </span></td>
  <td class=xl35 width=95 style='width:71pt'>Social Sal</td>
  <td class=xl35 width=93 style='width:70pt'>Health Sal</td>
  <td class=xl35 width=103 style='width:77pt'>Unemployee Sal</td>
  <%} %>
 </tr>
 <% for (int i=0;i<count_emp;i++){ %>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl25 style='height:15.75pt;text-align:center;' x:num><%=i+1 %></td>
  <td class=xl26 ><%=dt_emp.Rows[i][0].ToString()%> </td>
  <td class=xl26><%=dt_emp.Rows[i][1].ToString()%></td>
  <td class=xl26><%=dt_emp.Rows[i][2].ToString()%></td>
  <td class=xl26><%=dt_emp.Rows[i][3].ToString()%></td>
   <% for (int j=0;j<num_month;j++) {  %>
      <td class=xl27 align=right x:num><%=dt_emp.Rows[i][4+j*4].ToString()%></td>
      <td class=xl27 align=right x:num><%=dt_emp.Rows[i][5+j*4].ToString()%></td>
      <td class=xl27 align=right x:num><%=dt_emp.Rows[i][6+j*4].ToString()%></td>
      <td class=xl27 align=right x:num><%=dt_emp.Rows[i][7+j*4].ToString()%></td>
  <%} %>
 </tr>
 <%} %>
 
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=38 style='width:29pt'></td>
  <td width=197 style='width:148pt'></td>
  <td width=88 style='width:66pt'></td>
  <td width=198 style='width:149pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=119 style='width:89pt'></td>
  <td width=152 style='width:114pt'></td>
  <td width=116 style='width:87pt'></td>
  <td width=95 style='width:71pt'></td>
  <td width=93 style='width:70pt'></td>
  <td width=103 style='width:77pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
