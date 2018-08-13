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
    string emp_pk = Request.QueryString["emp_pk"];
    string sal_yn = Request.QueryString["sal_yn"];
    string SQL_Sal
    = "SELECT D.org_NM,G.workGROUP_NM,TO_CHAR(TO_DATE(S.WORK_MON,'YYYYMM'),'MM/YYYY'),round(S.SALARY_LEVEL2,3) " +
    ",(CASE WHEN NVL(S.CONFIRM_DT,S.FROM_DT)>S.FROM_DT THEN TO_CHAR(TO_DATE(S.CONFIRM_DT,'YYYYMMDD'),'DD/MM/YYYY') " +
        "    ELSE NULL END) AS CONFIRM_DT " +
        "    ,round(NVL(S.ALLOW_AMT1,0)+NVL(S.ALLOW_AMT2,0)+NVL(S.ALLOW_AMT3,0)+NVL(S.ALLOW_AMT4,0)+NVL(S.ALLOW_AMT5,0) " +
        "    +NVL(S.ALLOW_AMT6,0)+NVL(S.ALLOW_AMT7,0)+NVL(S.ALLOW_AMT8,0),3) " +
        ",(SELECT A.CODE_NM FROM VHR_HR_CODE A WHERE A.ID='HR0008' AND A.CODE=S.POS_TYPE) AS POSITION     " +
        "    FROM THR_EMPLOYEE A,THR_MONTH_SALARY S,TCO_org D,THR_work_GROUP G " +
        "    WHERE A.DEL_IF=0 AND S.DEL_IF(+)=0 AND D.DEL_IF=0 AND G.DEL_IF=0  " +
        "    AND A.PK=S.THR_EMP_PK(+) AND S.TCO_DEPT_PK=D.PK AND S.THR_GROUP_PK=G.PK " +
        "    AND A.PK= '" + emp_pk + "'  " +
        "    ORDER BY S.WORK_MON ";

    DataTable dt_Sal = CtlLib.TableReadOpen(SQL_Sal);
    int i_sal = dt_Sal.Rows.Count;

    string SQL_Contract
    = "SELECT S.CONTRACT_TIMES,TO_CHAR(TO_DATE(NVL(S.BEGIN_CONTRACT,S.BEGIN_PROBATION),'YYYYMMDD'),'DD/MM/YYYY') " +
        "      ,V.CODE_NM,round(S.BASIC_SAL,3) " +
        "      ,round(NVL(S.ALLOW_AMT1,0)+NVL(S.ALLOW_AMT2,0)+NVL(S.ALLOW_AMT3,0)+NVL(S.ALLOW_AMT4,0)+NVL(S.ALLOW_AMT5,0) " +
        "    +NVL(S.ALLOW_AMT6,0)+NVL(S.ALLOW_AMT7,0)+NVL(S.ALLOW_AMT8,0),3) " +
        "       ,' ' " +
        "        FROM THR_EMPLOYEE A,THR_LABOUR_CONTRACT S,VHR_HR_CODE V " +
        "        WHERE A.DEL_IF=0 AND S.DEL_IF=0 AND V.ID='HR0001' AND S.CONTRACT_TYPE=V.CODE " +
        "        AND A.PK=S.THR_EMPLOYEE_PK AND A.PK='" + emp_pk + "'  " +
        "        ORDER BY S.CONTRACT_TIMES  ";
    DataTable dt_Contract = CtlLib.TableReadOpen(SQL_Contract);
    int i_contract = dt_Contract.Rows.Count;

    string SQL_Dis
    = "SELECT ROWNUM,TO_CHAR(TO_DATE(S.DIS_DT,'YYYYMMDD'),'DD/MM/YYYY'),V.CODE_NM,S.REASON,S.REMARK " +
        "        FROM THR_EMPLOYEE A,THR_DISCIPLINE S,VHR_HR_CODE V " +
        "        WHERE A.DEL_IF=0 AND S.DEL_IF=0 AND V.ID='HR0025' AND S.DIS_LEVEL=V.CODE " +
        "        AND A.PK=S.THR_EMP_PK AND A.PK='" + emp_pk + "'  " +
        "        ORDER BY S.DIS_DT,S.DIS_LEVEL  ";
    DataTable dt_Dis = CtlLib.TableReadOpen(SQL_Dis);
    int i_dis = dt_Dis.Rows.Count;

    string SQL_Main
    = "select  a.FULL_NAME, a.EMP_ID,to_char(to_date(a.JOIN_DT,'yyyymmdd'),'dd/mm/yyyy') " +
        "    , a.PERSON_ID, b.org_NM, c.workGROUP_NM " +
        "from thr_employee a, tco_org b, thr_work_group c " +
        "where a.DEL_IF = 0 " +
        "    and b.DEL_IF = 0 " +
        "    and c.DEL_IF = 0 " +
        "    and a.TCO_org_PK = b.PK " +
        "    and a.THR_wg_PK = c.PK " +
        "    and a.PK = '" + emp_pk + "' ";
    DataTable dt_Main = CtlLib.TableReadOpen(SQL_Main);
    
 %>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_emp_history_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_emp_history_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_emp_history_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Hee</o:Author>
  <o:LastAuthor>Hee</o:LastAuthor>
  <o:LastPrinted>2008-10-04T04:31:05Z</o:LastPrinted>
  <o:Created>2008-10-04T03:36:42Z</o:Created>
  <o:LastSaved>2008-10-04T05:56:41Z</o:LastSaved>
  <o:Company>Hee Nguyen</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .26in 1.0in .33in;
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
	font-size:11.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"mmm\\-yy";
	border:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl30
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl31
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl32
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl33
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl34
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl35
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl36
	{mso-style-parent:style0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl37
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFCC;
	mso-pattern:auto none;}
.xl38
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl39
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl40
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl41
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
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
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>8</x:ActiveRow>
       <x:ActiveCol>2</x:ActiveCol>
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
  <x:WindowWidth>11355</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=719 style='border-collapse:
 collapse;table-layout:fixed;width:541pt'>
 <col class=xl24 width=40 style='mso-width-source:userset;mso-width-alt:1462;
 width:30pt'>
 <col class=xl24 width=98 style='mso-width-source:userset;mso-width-alt:3584;
 width:74pt'>
 <col class=xl24 width=121 style='mso-width-source:userset;mso-width-alt:4425;
 width:91pt'>
 <col class=xl24 width=69 style='mso-width-source:userset;mso-width-alt:2523;
 width:52pt'>
 <col class=xl24 width=98 style='mso-width-source:userset;mso-width-alt:3584;
 width:74pt'>
 <col class=xl24 width=88 style='mso-width-source:userset;mso-width-alt:3218;
 width:66pt'>
 <col class=xl24 width=96 style='mso-width-source:userset;mso-width-alt:3510;
 width:72pt'>
 <col class=xl24 width=109 style='mso-width-source:userset;mso-width-alt:3986;
 width:82pt'>
 <tr height=30 style='height:22.5pt'>
  <td colspan=7 height=30 class=xl38 width=610 style='height:22.5pt;width:459pt'>Employee
  History Report</td>
  <td class=xl24 width=109 style='width:82pt'></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 colspan=8 class=xl24 style='height:14.25pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=2 class=xl24 style='height:18.0pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl37>Full Name</td>
  <td colspan=3 class=xl33 style='border-right:.5pt solid black;border-left:
  none'><%=dt_Main.Rows[0][0].ToString() %></td>
  <td class=xl24></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=2 class=xl24 style='height:18.0pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl37>Emp ID</td>
  <td colspan=3 class=xl33 style='border-right:.5pt solid black;border-left:
  none'><%=dt_Main.Rows[0][1].ToString() %></td>
  <td class=xl24></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=2 class=xl24 style='height:18.0pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl37>Join DT</td>
  <td colspan=3 class=xl33 style='border-right:.5pt solid black;border-left:
  none'><%=dt_Main.Rows[0][2].ToString() %></td>
  <td class=xl24></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=2 class=xl24 style='height:18.0pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl37>Person ID</td>
  <td colspan=3 class=xl41 style='border-left:none' x:num><%=dt_Main.Rows[0][3].ToString() %></td>
  <td class=xl24></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=2 class=xl24 style='height:18.0pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl37>Department</td>
  <td colspan=3 class=xl41 style='border-left:none'><%=dt_Main.Rows[0][4].ToString() %></td>
  <td class=xl24></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=2 class=xl24 style='height:18.0pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl37>Group</td>
  <td colspan=3 class=xl41 style='border-left:none'><%=dt_Main.Rows[0][5].ToString() %></td>
  <td class=xl24></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 colspan=8 class=xl24 style='height:14.25pt;mso-ignore:colspan'></td>
 </tr>
 <%
     if (i_contract > 0)
     {         
 %>
 <tr height=29 style='mso-height-source:userset;height:21.95pt'>
  <td colspan=2 height=29 class=xl39 style='height:21.95pt'>Contract</td>
  <td colspan=6 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl40 style='height:20.1pt'>No.</td>
  <td class=xl40 style='border-left:none'>Contract DT</td>
  <td class=xl40 style='border-left:none'>Contract kind</td>
  <%
      if (sal_yn == "Y")
      {
   %>
  <td colspan=3 class=xl40 style='border-left:none'>Salary</td>
  <td colspan=2 class=xl40 style='border-left:none'>Total Allowance</td>
   <%
      }
      else
      {
    %>
    <td colspan=5 class=xl40 style='border-left:none'>Remark</td>
    <%
      }
     %>
 </tr>
 <%
        for (int i = 0; i < i_contract; i++)
       {
 %>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl26 style='height:17.1pt;border-top:none' x:num><%=i+1 %></td>
  <td class=xl26 style='border-top:none;border-left:none'><%=dt_Contract.Rows[i][1].ToString() %></td>
  <td class=xl27 width=121 style='border-top:none;border-left:none;width:91pt'><%=dt_Contract.Rows[i][2].ToString() %></td>
  <%
      if (sal_yn == "Y")
      {
   %>
  <td colspan=3 class=xl28 style='border-left:none' x:num><%=dt_Contract.Rows[i][3].ToString() %></td>
  <td colspan=2 class=xl36 style='border-left:none' x:num><%=dt_Contract.Rows[i][4].ToString() %></td>
   <%
      }
      else
      {
    %>
    <td colspan=5 class=xl36 style='border-left:none' x:str><%=dt_Contract.Rows[i][5].ToString() %></td>
        <%
      }
     %>
 </tr>
 
 <%
        }
     }
  %>
  <tr height=19 style='height:14.25pt'>
  <td height=19 colspan=8 class=xl24 style='height:14.25pt;mso-ignore:colspan'></td>
 </tr>
 <%
     if (i_sal > 0 && sal_yn=="Y")
     {         
 %>
 <tr height=29 style='mso-height-source:userset;height:21.95pt'>
  <td colspan=2 height=29 class=xl39 style='height:21.95pt'>Salary</td>
  <td colspan=6 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=2 height=26 class=xl40 style='height:20.1pt'>Department</td>
  <td class=xl40 style='border-left:none'>Group</td>
  <td class=xl40 style='border-left:none'>Month</td>
  <td class=xl40 style='border-left:none'>Salary</td>
  <td class=xl40 style='border-left:none'>Confirm DT</td>
  <td class=xl40 style='border-left:none'>Allowance</td>
  <td class=xl40 style='border-left:none'>Position</td>
 </tr>
 <%
     for (int i = 0; i < i_sal; i++)
     {
 %>
 
 <tr height=38 style='height:28.5pt'>
  <td colspan=2 height=38 class=xl27 width=138 style='height:28.5pt;width:104pt'
  x:str><%=dt_Sal.Rows[i][0].ToString() %></td>
  <td class=xl27 width=121 style='border-top:none;border-left:none;width:91pt'><%=dt_Sal.Rows[i][1].ToString() %></td>
  <td class=xl25 style='border-top:none;border-left:none'><%=dt_Sal.Rows[i][2].ToString() %></td>
  <td class=xl28 style='border-top:none;border-left:none' x:num><%=dt_Sal.Rows[i][3].ToString() %></td>
  <td class=xl26 style='border-top:none;border-left:none'><%=dt_Sal.Rows[i][4].ToString() %></td>
  <td class=xl28 style='border-top:none;border-left:none' x:num><%=dt_Sal.Rows[i][5].ToString() %></td>
  <td class=xl27 width=109 style='border-top:none;border-left:none;width:82pt'><%=dt_Sal.Rows[i][6].ToString() %></td>
 </tr> 
 <%
        }
     }
     %>
 <tr height=19 style='height:14.25pt'>
  <td height=19 colspan=8 class=xl24 style='height:14.25pt;mso-ignore:colspan'></td>
 </tr>
 <%
     if (i_dis > 0)
     {
 %>
 <tr height=29 style='mso-height-source:userset;height:21.95pt'>
  <td colspan=2 height=29 class=xl39 style='height:21.95pt'>Discipline</td>
  <td colspan=6 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl40 style='height:20.1pt'>No</td>
  <td class=xl40 style='border-left:none'>Date</td>
  <td class=xl40 style='border-left:none'>Level</td>
  <td colspan=2 class=xl40 style='border-left:none'>Reason</td>
  <td colspan=3 class=xl40 style='border-left:none'>Remark</td>
 </tr>
 <%
         for (int i = 0; i < i_dis; i++)
         {            
 %> 
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl26 style='height:18.0pt;border-top:none' x:num><%=i+1 %></td>
  <td class=xl29 style='border-top:none;border-left:none'><%=dt_Dis.Rows[i][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none' x:num><%=dt_Dis.Rows[i][2].ToString()%></td>
  <td colspan=2 class=xl30 style='border-right:.5pt solid black;border-left:
  none'><%=dt_Dis.Rows[i][3].ToString()%></td>
  <td colspan=3 class=xl30 style='border-right:.5pt solid black;border-left:
  none'><%=dt_Dis.Rows[i][4].ToString()%></td>  
 </tr>
 <%     }
     }
  %>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=40 style='width:30pt'></td>
  <td width=98 style='width:74pt'></td>
  <td width=121 style='width:91pt'></td>
  <td width=69 style='width:52pt'></td>
  <td width=98 style='width:74pt'></td>
  <td width=88 style='width:66pt'></td>
  <td width=96 style='width:72pt'></td>
  <td width=109 style='width:82pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
