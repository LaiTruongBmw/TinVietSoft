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
    string p_user,p_date,p_date_text;
    p_user = Request["p_user"].ToString();
    p_date = Request["p_date"].ToString();
    p_date_text = Request["p_date_text"].ToString();
    string p_dept = Request.QueryString["p_dept"].ToString();
    string SQL
	= "select (SELECT   MAX(T.org_nm) "+
      "        FROM tco_org t    "+
      "         WHERE t.del_if = 0 "+
      "         AND T.ORG_TYPE IN('06') "+
      "         START WITH t.pk=A.tco_dept_pk "+
      "          CONNECT BY PRIOR t.p_pk=t.pk) AS T1 "+
      "  ,(select o.ORG_NM from tco_org o where a.THR_GROUP_PK= o.pk and del_if=0 )  " + 
        ",a.YESTERDAY_MALE,a.YESTERDAY_FEMALE " +
        ",a.TODAY_MALE,a.TODAY_FEMALE " +
        ",a.NEW_MALE,a.NEW_FEMALE " +
        ",a.OUT_MALE,a.OUT_FEMALE " +
        ",a.ABS_NON,a.abs_nop,a.ABS_PER,a.ABS_reg,a.ABS_MLE,nvl(a.late_in,0),nvl(a.early_out,0) " +
        ",a.NOT_SCHEDULE " +
        ",a.OT_EMP " +
        ",a.OT_HOURS " +
        ",a.ATTENDENCE_MALE,a.ATTENDENCE_FEMALE,nvl(a.ATTENDENCE_MALE,0) + nvl(a.ATTENDENCE_FEMALE,0),nvl(a.night_shift,0),to_char(sysdate,'dd/mm/yyyy') " +
        " from thr_employee_daily a,tco_org b " +
        " where a.del_if=0 and b.del_if=0 " +
        " and a.tco_dept_PK=b.pk " +
        "           AND (a.tco_dept_pk IN (SELECT g.pk " +
        "                              FROM tco_org g " +
        "                              WHERE g.del_if = 0 " +
        "       START WITH g.pk = DECODE ('" + p_dept + "','ALL', 0,'" + p_dept + "') " +
        "                            CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                 OR '" + p_dept + "' = 'ALL') " +
        "and a.DAILY_DATE='" + p_date + "' "  +
        " order by nvl(T1,0) ";
       

    //Response.Write(SQL);
    //Response.End();
    DataTable dt_total = CtlLib.TableReadOpen(SQL);
    int irow;
    irow = dt_total.Rows.Count;
    if (irow == 0)
    {
        Response.Write("There is no data");
        Response.End();
    }
    //sum department 
    string SQL_Total
        = " Select SUM(NVL(T2,0)),SUM(NVL(T3,0)),SUM(NVL(T4,0)),SUM(NVL(T5,0)),SUM(NVL(T6,0)) " +
            "        ,SUM(NVL(T7,0)),SUM(NVL(T8,0)),SUM(NVL(T9,0)),SUM(NVL(T10,0)),SUM(NVL(T11,0)),SUM(NVL(T12,0)) " +
            "        ,SUM(NVL(T13,0)),SUM(NVL(T14,0)),SUM(NVL(T15,0)),SUM(NVL(T16,0)),SUM(NVL(T17,0)),SUM(NVL(T18,0)) " +
            "        ,SUM(NVL(T19,0)),SUM(NVL(T20,0)),SUM(NVL(T21,0)),SUM(NVL(T22,0)),SUM(NVL(T23,0)),SUM(NVL(T24,0)) " +
            "    FROM " +
            "    ( " +
            "        SELECT  " +
            "            (SELECT   MAX(T.org_nm) " +
            "                                FROM tco_org t " +
            "                                WHERE t.del_if = 0 " +
            "                                AND T.ORG_TYPE IN('06') " +
            "                                START WITH t.pk=A.tco_dept_pk " +
            "                                CONNECT BY PRIOR t.p_pk=t.pk) AS T1 " +
            "        ,count(*) AS T2 " +
            "        ,sum(a.YESTERDAY_MALE) AS T3 " +
            "        ,sum(a.YESTERDAY_FEMALE) AS T4  " +
            "        ,sum(a.TODAY_MALE) AS T5 " +
            "        ,sum(a.TODAY_FEMALE) AS T6 " +
            "        ,sum(a.NEW_MALE) AS T7 " +
            "        ,sum(a.NEW_FEMALE) AS T8 " +
            "        ,sum(a.OUT_MALE) AS T9 " +
            "        ,sum(a.OUT_FEMALE) AS T10 " +
            "        ,sum(a.ABS_NON) AS T11 " +
            "        ,sum(nvl(a.abs_nop,0)) AS T12 " +
            "        ,sum(a.ABS_PER) AS T13 " +
            "        ,sum(a.ABS_reg) AS T14 " +
            "        ,sum(a.ABS_MLE) AS T15 ,sum(nvl(a.late_in,0))as T16,sum(nvl(a.early_out,0))as T17 " +
            "        ,sum(a.NOT_SCHEDULE) AS T18 " +
            "        ,sum(a.OT_EMP) AS T19 " +
            "        ,sum(a.OT_HOURS) AS T20 " +
            "        ,sum(a.ATTENDENCE_MALE) AS T21 " +
            "        ,sum(a.ATTENDENCE_FEMALE) AS T22 " +
            "        ,sum(nvl(a.ATTENDENCE_MALE,0) + nvl(a.ATTENDENCE_FEMALE,0)) AS T23 " +
            "        ,sum(nvl(a.night_shift,0)) AS T24 " +
            "        ,NVL(B.SEQ,0) AS SEQ " +
            "        from thr_employee_daily a,tco_org b " +
            "        where a.del_if=0 and b.del_if=0" +
            "        and a.tco_dept_PK=b.pk  " +
            "           AND (a.tco_dept_pk IN (SELECT g.pk " +
            "                              FROM tco_org g " +
            "                              WHERE g.del_if = 0 " +
            "       START WITH g.pk = DECODE ('" + p_dept + "','ALL', 0,'" + p_dept + "') " +
            "                            CONNECT BY PRIOR g.pk = g.p_pk) " +
            "                 OR '" + p_dept + "' = 'ALL') " +
            "       and a.DAILY_DATE='" + p_date + "' " +
            "        group by a.tco_dept_PK,b.seq, b.org_nm  " +
            "        order by nvl(B.org_nm,0) " +
            "    )HR     " +
            "    GROUP BY NVL(T1,0) " +
            "ORDER BY NVL(T1,0) ";

        
    //Response.Write(SQL_Total);
    //Response.End();
    
    DataTable dt_dept = CtlLib.TableReadOpen(SQL_Total);
    int irow_dept;
    irow_dept = dt_dept.Rows.Count;

    //Response.Write(irow_dept + "" + irow);
    //Response.End();
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_daily_employee_status_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_daily_employee_status_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_daily_employee_status_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>ty-ml</o:Author>
  <o:LastAuthor>ty-ml</o:LastAuthor>
  <o:LastPrinted>2008-08-08T03:52:33Z</o:LastPrinted>
  <o:Created>2008-08-08T02:47:23Z</o:Created>
  <o:LastSaved>2008-08-08T03:52:55Z</o:LastSaved>
  <o:Company>genuwin</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.3in .24in .37in .25in;
	mso-header-margin:.23in;
	mso-footer-margin:.19in;}
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
	font-size:12.0pt;
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
.xl26
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl27
	{mso-style-parent:style0;
	font-size:12.0pt;
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
.xl28
	{mso-style-parent:style0;
	font-size:12.0pt;
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
	mso-pattern:auto none;}
.xl29
	{mso-style-parent:style0;
	font-size:12.0pt;
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
.xl30
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl31
	{mso-style-parent:style0;
	vertical-align:middle;}
.xl32
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	font-weight:700;
	mso-text-control:shrinktofit;}
.xl33
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl34
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	font-size:12.0pt;
	border:.5pt solid windowtext;
	background:#FFFF99;
	font-weight:800;
	mso-pattern:auto none;
	mso-text-control:shrinktofit;}
.xl35
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022?_\)\;_\(\@_\)";
	vertical-align:middle;
	
	border:.5pt solid windowtext;
	background:#FFFF99;
	font-weight:700;
	mso-pattern:auto none;
	mso-text-control:shrinktofit;
	}
.xl36
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	font-size:13.0pt;
	border:.5pt solid windowtext;
	background:#CCFFCC;
	font-weight:700;
	mso-pattern:auto none;
	mso-text-control:shrinktofit;}
.xl37
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022?_\)\;_\(\@_\)";
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFCC;
	font-weight:700;
	mso-pattern:auto none;
	mso-text-control:shrinktofit;
	}
.xl38
	{mso-style-parent:style0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFCC;
	mso-pattern:auto none;
	white-space:nowrap;
	font-weight:700;
	mso-text-control:shrinktofit;}
.xl39
	{mso-style-parent:style0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl40
	{mso-style-parent:style0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl41
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	font-size:13.0pt;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	mso-text-control:shrinktofit;
	}
.xl42
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022?_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	mso-text-control:shrinktofit;
	}
.xl43
	{mso-style-parent:style0;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl44
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl45
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022?_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl46
	{mso-style-parent:style0;
	mso-number-format:"Short Date";
	text-align:left;}
.xl140
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl123
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
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
      <x:Scale>69</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>3</x:SplitHorizontal>
     <x:TopRowBottomPane>3</x:TopRowBottomPane>
     <x:ActivePane>2</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>6</x:ActiveRow>
       <x:ActiveCol>5</x:ActiveCol>
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
  <x:WindowHeight>7935</x:WindowHeight>
  <x:WindowWidth>11355</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>105</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$2:$3</x:Formula>
</x:ExcelName>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1500 style='border-collapse:
 collapse;table-layout:fixed;width:1126pt'>
 <col width=107 style='mso-width-source:userset;mso-width-alt:3913;width:80pt'>
 <col width=100 style='mso-width-source:userset;mso-width-alt:3657;width:75pt'>
 <col width=53 span=2 style='mso-width-source:userset;mso-width-alt:1938;
 width:40pt'>
 <col width=55 span=2 style='mso-width-source:userset;mso-width-alt:2011;
 width:41pt'>
 <col width=54 span=2 style='mso-width-source:userset;mso-width-alt:1974;
 width:41pt'>
 <col width=67 style='mso-width-source:userset;mso-width-alt:2450;width:50pt'>
 <col width=65 style='mso-width-source:userset;mso-width-alt:2377;width:49pt'>
 <col width=79 style='mso-width-source:userset;mso-width-alt:2889;width:59pt'>
 <col width=63 span=2 style='mso-width-source:userset;mso-width-alt:2304;
 width:47pt'>
 <col width=45 span=4 style='mso-width-source:userset;mso-width-alt:2045;
 width:34pt'>
 <col width=63 style='mso-width-source:userset;mso-width-alt:2304;width:47pt'>
    <col width=45 style='mso-width-source:userset;mso-width-alt:2000;width:34pt'>
    <col width=45 style='mso-width-source:userset;mso-width-alt:2000;width:34pt'>
 <col width=45 style='mso-width-source:userset;mso-width-alt:2000;width:34pt'>
 <col width=50 style='mso-width-source:userset;mso-width-alt:1828;width:38pt'>
 <col width=51 span=3 style='mso-width-source:userset;mso-width-alt:2865;
 width:38pt'>
 
 <tr height=45 style='mso-height-source:userset;height:33.75pt'>
  <td colspan=23 height=45 class=xl30 width=1022 style='height:33.75pt;
  width:768pt'>DAILY EMPLOYEE STATUS - <%=p_date_text %></td>
 </tr>
 <tr class=xl24 height=30 style='mso-height-source:userset;height:30.0pt'>
  <td rowspan=2 height=30 class=xl25 style='border-bottom:.5pt solid black;
  height:60.0pt;border-top:none; white-space:normal'>Department</td>
  <td rowspan=2 class=xl25 style='border-bottom:.5pt solid black;border-top:
  none; white-space:normal'>Team/Section</td>
  <td colspan=2 class=xl26 style='border-left:none; white-space:normal'>Yesterday</td>
  <td colspan=2 class=xl26 style='border-left:none; white-space:normal'>Today</td>
  <td colspan=2 class=xl26 style='border-left:none; white-space:normal'>New Employee</td>
  <td colspan=2 class=xl26 style='border-left:none; white-space:normal'>Resigned Employee</td>
  <td colspan=5 class=xl26 style='border-left:none; white-space:normal'>Absence</td>
  <td rowspan=2 class=xl27 width=63 style='border-bottom:.5pt solid black;
  border-top:none;width:47pt; white-space:normal'>Late In</td>
   <td rowspan=2 class=xl27 width=63 style='border-bottom:.5pt solid black;
  border-top:none;width:47pt; white-space:normal'>Early Out</td>
   <td rowspan=2 class=xl27 width=63 style='border-bottom:.5pt solid black;
  border-top:none;width: auto ; white-space:normal'>Not schedule</td>
  <td rowspan=2 class=xl27 width=45 style='border-bottom:.5pt solid black;
  border-top:none;width:34pt; white-space:normal'>OT Emps</td>
  <td rowspan=2 class=xl27 width=50 style='border-bottom:.5pt solid black;
  border-top:none;width:38pt; white-space:normal'>OT Hours</td>
  <td colspan=3 class=xl26 style='border-left:none; white-space:normal'>Attendence</td>
  <td rowspan=2 class=xl27 width=45 style='border-bottom:.5pt solid black;
  width:34pt; white-space:normal'>Night Shift</td>
  <td rowspan=2 class=xl27 width=45 style='border-bottom:.5pt solid black;
  width:34pt; white-space:normal'>Remark</td>
 </tr>
 <tr class=xl24 height=30 style='mso-height-source:userset;height:30.25pt'>
  <td height=30 class=xl26 style='height:30.25pt;border-top:none;border-left:
  none'>Male</td>
  <td class=xl26 style='border-top:none;border-left:none'>Female</td>
  <td class=xl26 style='border-top:none;border-left:none'>Male</td>
  <td class=xl26 style='border-top:none;border-left:none'>Female</td>
  <td class=xl26 style='border-top:none;border-left:none'>Male</td>
  <td class=xl26 style='border-top:none;border-left:none'>Female</td>
  <td class=xl26 style='border-top:none;border-left:none'>Male</td>
  <td class=xl26 style='border-top:none;border-left:none'>Female</td>
  <td class=xl26 style='border-top:none;border-left:none;font-size:8.0pt;mso-pattern:auto none;white-space:normal;'>None Scan</td>
  <td class=xl26 style='border-top:none;border-left:none;font-size:8.0pt;mso-pattern:auto none;white-space:normal;'>None Permission</td>
  <td class=xl26 style='border-top:none;border-left:none;font-size:8.0pt;mso-pattern:auto none;white-space:normal;'>Permission</td>
  <td class=xl26 style='border-top:none;border-left:none;font-size:8.0pt;'>Regular</td>
  <td class=xl26 style='border-top:none;border-left:none;font-size:8.0pt;'>Maternity</td>
  <td class=xl26 style='border-top:none;border-left:none;'>Male</td>
  <td class=xl26 style='border-top:none;border-left:none'>Female</td>
  <td class=xl26 style='border-top:none;border-left:none'>Total</td>
  
 </tr>
 <% 
     string s_format;
     int start_row=3;
     int from_row;
     int to_row;
     int i_dept;
     int t;
     string cur_dept,new_dept,old_dept;
     Boolean b_TotalDept=false;
     i_dept=0;
     from_row=start_row;
     float [] intTotal = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}; //total of columns
     for (int i = 0; i < irow; i++) 
    {
        
       start_row++;
       to_row=from_row;
       cur_dept=dt_total.Rows[i][0].ToString();
    %> 
 <tr class=xl31 height=40 style='mso-height-source:userset;height:30.0pt'>
 <%
    if (i==0) 
    {
        
  %>
  <td height=40 class=xl39 style='height:30.0pt;border-top:none' rowspan="<%=int.Parse(dt_dept.Rows[i_dept][0].ToString()) + 1 %>" ><% = dt_total.Rows[i][0].ToString()%></td>
  <%
    }
    else
    {
        old_dept=dt_total.Rows[i-1][0].ToString();
        if (old_dept != cur_dept)
        {
            i_dept++;
   %>
   <td height=40 class=xl39 style='height:30.0pt;border-top:none' rowspan="<%=int.Parse(dt_dept.Rows[i_dept][0].ToString()) + 1 %>" ><% = dt_total.Rows[i][0].ToString()%></td>
   <%
            
        }
    }
    %> 
  <td class=xl40 style='border-top:none;border-left:none'><% = dt_total.Rows[i][1].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>         </span><% = dt_total.Rows[i][2].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>         </span><% = dt_total.Rows[i][3].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>         </span><% = dt_total.Rows[i][4].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>         </span><% = dt_total.Rows[i][5].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>         </span><% = dt_total.Rows[i][6].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>         </span><% = dt_total.Rows[i][7].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><% = dt_total.Rows[i][8].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><% = dt_total.Rows[i][9].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><% = dt_total.Rows[i][10].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><% = dt_total.Rows[i][11].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><% = dt_total.Rows[i][12].ToString()%></td>
  
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>     </span><% = dt_total.Rows[i][13].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>          </span><% = dt_total.Rows[i][14].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>     </span><% = dt_total.Rows[i][15].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>          </span><% = dt_total.Rows[i][16].ToString()%></td>
  
   <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>    </span><% = dt_total.Rows[i][17].ToString()%></td>
   <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>    </span><% = dt_total.Rows[i][18].ToString()%></td>
  
  <td class=xl42 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>     </span><% = dt_total.Rows[i][19].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><% = dt_total.Rows[i][20].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><% = dt_total.Rows[i][21].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><% = dt_total.Rows[i][22].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none;font-weight:700' x:num><span
  style='mso-spacerun:yes'>       </span><% = dt_total.Rows[i][23].ToString()%></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span>&nbsp;</td>
  
 </tr>
 <%
    if (i==irow-1)  //start of total dept
        b_TotalDept=true;
    else
    {
       
       new_dept=dt_total.Rows[i+1][0].ToString();
       if (cur_dept != new_dept)
            b_TotalDept=true;
    }
    if (b_TotalDept==true)
    {
        to_row=start_row;
        start_row++;
        from_row=start_row;
        
        for (t=0;t<=21;t++) //sum of department 
            intTotal[t] = intTotal[t] + float.Parse(dt_dept.Rows[i_dept][t+1].ToString());
  %>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
 
  <td class=xl38 style='border-left:none'>Total <%=cur_dept %></td>
  <td class=xl36 style='' x:num ><span
  style='mso-spacerun:yes'>         </span><% = dt_dept.Rows[i_dept][1].ToString()%> </td>
  <td class=xl36 style='border-left:none' x:num ><span
  style='mso-spacerun:yes'>         </span> <% = dt_dept.Rows[i_dept][2].ToString()%></td>
  <td class=xl36 style='border-left:none' x:num ><span
  style='mso-spacerun:yes'>         </span><% = dt_dept.Rows[i_dept][3].ToString()%> </td>
  <td class=xl36 style='border-left:none' x:num ><span
  style='mso-spacerun:yes'>         </span> <% = dt_dept.Rows[i_dept][4].ToString()%></td>
  <td class=xl36 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>         </span><% = dt_dept.Rows[i_dept][5].ToString()%> </td>
  <td class=xl36 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>         </span><% = dt_dept.Rows[i_dept][6].ToString()%></td>
  <td class=xl36 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span> <% = dt_dept.Rows[i_dept][7].ToString()%></td>
  <td class=xl36 style='border-left:none' x:num ><span
  style='mso-spacerun:yes'>       </span><% = dt_dept.Rows[i_dept][8].ToString()%> </td>
  <td class=xl36 style='border-left:none' x:num ><span
  style='mso-spacerun:yes'>       </span><% = dt_dept.Rows[i_dept][9].ToString()%></td>
  <td class=xl36 style='border-left:none' x:num ><span
  style='mso-spacerun:yes'>       </span><% = dt_dept.Rows[i_dept][10].ToString()%></td>
  <td class=xl36 style='border-left:none' x:num ><span
  style='mso-spacerun:yes'>       </span><% = dt_dept.Rows[i_dept][11].ToString()%></td>
  <td class=xl36 style='border-left:none' x:num ><span
  style='mso-spacerun:yes'>     </span><% = dt_dept.Rows[i_dept][12].ToString()%></td>
  <td class=xl36 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>          </span><% = dt_dept.Rows[i_dept][13].ToString()%></td>
  <td class=xl36 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>     </span><% = dt_dept.Rows[i_dept][14].ToString()%></td>
  <td class=xl36 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>          </span><% = dt_dept.Rows[i_dept][15].ToString()%></td>
  <td class=xl36 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>    </span><% = dt_dept.Rows[i_dept][16].ToString()%></td>
  <td class=xl36 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>    </span><% = dt_dept.Rows[i_dept][17].ToString()%></td>
 
  <td class=xl37 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>     </span><% = dt_dept.Rows[i_dept][18].ToString()%></td>
   
  <td class=xl36 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>    </span><% = dt_dept.Rows[i_dept][19].ToString()%></td>
  <td class=xl36 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><% = dt_dept.Rows[i_dept][20].ToString()%></td>
  <td class=xl36 style='border-left:none' x:num ><span
  style='mso-spacerun:yes'>       </span><% = dt_dept.Rows[i_dept][21].ToString()%></td>
  <td class=xl36 style='border-left:none' x:num ><span
  style='mso-spacerun:yes'>       </span><% = dt_dept.Rows[i_dept][22].ToString()%></td>
  
  <td class=xl36 style='border-left:none' ><span
  style='mso-spacerun:yes'>       </span></td>
 </tr>
 <%
    b_TotalDept=false;
    } //end of total dept
  %>
 <%
    }
  %>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td colspan=2 height=40 class=xl32 style='border-right:.5pt solid black;
  height:30.0pt'>Grand Total</td>
  <td class=xl34 style='border-top:none;border-left:none'  x:num><span
  style='mso-spacerun:yes'>         </span>  <%=intTotal[0] %> </td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>         </span><%=intTotal[1] %> </td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>         </span><%=intTotal[2] %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>         </span><%=intTotal[3] %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>         </span><%=intTotal[4] %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>         </span><%=intTotal[5] %> </td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%=intTotal[6] %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%=intTotal[7] %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%=intTotal[8] %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%=intTotal[9] %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%=intTotal[10] %></td>
  
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>     </span><%=intTotal[11] %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>          </span><%=intTotal[12] %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>     </span><%=intTotal[13] %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>          </span><%=intTotal[14] %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>    </span><%=intTotal[15] %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>    </span><%=intTotal[16] %></td>
  <td class=xl35 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>     </span><%=intTotal[17] %></td>
  
  
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>    </span><%=intTotal[18] %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%=intTotal[19] %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%=intTotal[20] %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%=intTotal[21] %></td>
  <td class=xl34 style='border-top:none;border-left:none'><span
  style='mso-spacerun:yes'>       </span></td>
 </tr>
 <tr height=51 style='height:38.25pt;mso-xlrowspan:3'>
  <td height=51 colspan=20 style='height:38.25pt;mso-ignore:colspan'></td>
 </tr>
 
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=19 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl24 colspan=3 style='mso-ignore:colspan'>Reported Date:</td>
  <td colspan=2 class=xl46 x:num><% = dt_total.Rows[0][24].ToString()%></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 colspan=17 style='height:27.75pt;mso-ignore:colspan'></td>
  <td colspan=3 class=xl140 style='border-right:.5pt solid black'>Reporter</td>
  <td colspan=3 class=xl140 style='border-right:.5pt solid black;border-left:
  none'>Team Manager</td>
  <td colspan=2 class=xl140 style='border-right:.5pt solid black;border-left:
  none'>General Manager</td>
  
  <td></td>
 </tr>
 <tr height=100 style='mso-height-source:userset;height:75.0pt'>
  <td height=100 colspan=17  style='height:75.0pt;mso-ignore:colspan'></td>
  <td colspan=3 class=xl123 style='border-right:.5pt solid black'>&nbsp;</td>
  <td colspan=3 class=xl123 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
  <td colspan=2 class=xl123 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>

  <td class=xl112></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  
 </tr>
 <![endif]>
</table>

</body>

</html>
