<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>

<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<%  string p_from, p_to, p_adj_type, p_wg, P_TCO_ORG_PK, p_input, p_nation;
    
    p_from = Request.QueryString["p_from"];
    p_to = Request.QueryString["p_to"];
    p_adj_type = Request.QueryString["p_adj_type"];
    p_wg = Request.QueryString["org_type"];
    P_TCO_ORG_PK = Request.QueryString["P_TCO_ORG_PK"];
    p_input = Request.QueryString["p_search_temp"];
	 p_nation = Request.QueryString["p_nation"];
    
    string SQL
    = "SELECT D.org_NM,b.workgroup_nm,C.EMP_ID,C.FULL_NAME,NULL " +
		"	,ADJ.CODE_NM,SUM(ROUND(nvl(A.ADJ_AMT,0),3)),NULL " +
        "   ,to_char(to_date('" + p_from + "','yyyymmdd'),'dd-mm-yyyy') "+
        "   ,to_char(to_date('" + p_to + "','yyyymmdd'),'dd-mm-yyyy') " +
        "        FROM THR_SALARY_ADJUSTMENT A,THR_work_GROUP B, THR_EMPLOYEE C, TCO_org D " +
		"	,(select CODE,CODE_NM from VHR_HR_CODE WHERE ID='HR0034' ORDER BY CODE) adj " +
        " WHERE a.del_if = 0 " + 
        "            and d.del_if=0 " +
        "           AND c.del_if = 0 " +
        "           AND A.THR_EMP_PK=C.PK " +
        "           and d.pk=c.tco_org_pk " +
		"     and b.del_if=0 " + 
        "     and b.pk=c.thr_wg_pk " +
        "     and adj.code=a.adj_type " +
        "           AND A.ADJ_DT BETWEEN '"+p_from+"' AND '"+p_to+"' " +
        "           AND DECODE ('"+p_adj_type+"', 'ALL','"+p_adj_type+"', A.ADJ_TYPE) ='"+p_adj_type+"' " +
        "           AND DECODE ('"+p_wg+"', 'ALL', '"+p_wg+"', c.thr_wg_pk )='"+p_wg+"'          " +
        "           AND DECODE ('" + p_nation + "', 'ALL', '" + p_nation + "', c.nation )='" + p_nation + "'  " +
        "           AND (    C.TCO_ORG_PK IN ( " +
        "                              SELECT     G.PK " +
        "                                    FROM TCO_ORG G " +
        "                                   WHERE G.DEL_IF = 0 " +
        "                              START WITH G.PK = " +
        "                                            DECODE ('"+P_TCO_ORG_PK+"', " +
        "                                                    'ALL', 0, " +
        "                                                    '"+P_TCO_ORG_PK+"' " +
        "                                                   ) " +
        "                              CONNECT BY PRIOR G.PK = G.P_PK) " +
        "                        OR '"+P_TCO_ORG_PK+"' = 'ALL') " +
        "              AND ('" + p_input + "' IS NULL  " +
        "                     OR  (UPPER(C.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(C.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(C.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
        " GROUP BY D.org_NM,b.workgroup_nm,C.EMP_ID,C.FULL_NAME,ADJ.CODE_NM " +
        "      ORDER BY D.ORG_NM,C.EMP_ID " ;

    //Response.Write(SQL);
    //Response.End();

    DataTable dt_emp = CtlLib.TableReadOpen(SQL);
    if (dt_emp.Rows.Count == 0)
    {
        Response.Write("There is no data to print");
        Response.End();
    } /**/
    int emp_row = dt_emp.Rows.Count;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_salary_adjustment_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_salary_adjustment_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_salary_adjustment_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>EINSVINA</o:Author>
  <o:LastAuthor>Hee</o:LastAuthor>
  <o:LastPrinted>2008-10-01T04:01:51Z</o:LastPrinted>
  <o:Created>2006-12-21T09:46:33Z</o:Created>
  <o:LastSaved>2008-10-01T06:45:59Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"Page &P of &N";
	margin:.28in .24in .33in .24in;
	mso-header-margin:.27in;
	mso-footer-margin:.31in;}
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
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl26
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.xl29
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;}
.xl30
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;}
.xl31
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl32
	{mso-style-parent:style0;
	font-size:13.0pt;
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
.xl33
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl34
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
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
.xl35
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl36
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Ti?es New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl37
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl39
	{mso-style-parent:style0;
	font-size:13.0pt;
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
.xl40
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl41
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
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
.xl42
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl43
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl44
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl45
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl46
	{mso-style-parent:style0;
	font-size:13.0pt;
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
	mso-pattern:#CCCCFF none;
	white-space:normal;}
.xl47
	{mso-sty?e-parent:style0;
	font-size:13.0pt;
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
	mso-pattern:#CCCCFF none;
	white-space:normal;}
.xl48
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:#CCCCFF none;
	white-space:normal;}
.xl49
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:#CCCCFF none;
	white-space:normal;}
.xl50
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;}
.xl51
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:#CCCCFF none;
	white-space:normal;}
.xl52
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:#CCCCFF none;
	white-space:normal;}
.xl53
	{mso-style-parent:style0;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"Short Date";}
.xl54
	{mso-style-parent:style0;
	color:#3366FF;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl55
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl56
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl57
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>62</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
   ? <x:LeftColumnVisible>1</x:LeftColumnVisible>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>4</x:SplitHorizontal>
     <x:TopRowBottomPane>4</x:TopRowBottomPane>
     <x:SplitVertical>4</x:SplitVertical>
     <x:LeftColumnRightPane>5</x:LeftColumnRightPane>
     <x:ActivePane>0</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveCol>1</x:ActiveCol>
      </x:Pane>
      <x:Pane>
       <x:Number>1</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
       <x:ActiveCol>1</x:ActiveCol>
      </x:Pane>
      <x:Pane>
       <x:Number>0</x:Number>
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
  <x:WindowHeight>5475</x:WindowHeight>
  <x:WindowWidth>10770</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>255</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$3:$4</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1123 style='border-collapse:
 collapse;table-layout:fixed;width:844pt'>
 <col class=xl24 width=41 style='mso-width-source:userset;mso-width-alt:1499;
 width:31pt'>
 <col class=xl24 width=112 style='mso-width-source:userset;mso-width-alt:4096;
 width:84pt'>
 <col class=xl24 width=130 style='mso-width-source:userset;mso-width-alt:4754;
 width:98pt'>
 <col class=xl24 width=80 style='mso-width-source:userset;mso-width-alt:2925;
 width:60pt'>
 <col class=xl24 width=194 style='mso-width-source:userset;mso-width-alt:7094;
 width:146pt'>
 <col class=xl53 width=119 style='mso-width-source:userset;mso-width-alt:4352;display:none;
 width:89pt'>
 <col class=xl24 width=122 style='mso-width-source:userset;mso-width-alt:4461;
 width:92pt'>
 <col class=xl24 width=103 style='mso-width-source:userset;mso-width-alt:3766;
 width:77pt'>
 <col class=xl24 width=222 style='mso-width-source:userset;mso-width-alt:8118;
 width:167pt'>
 <tr height=61 style='mso-height-source:userset;height:45.75pt'>
  <td colspan=9 height=61 class=xl54 width=1123 style='height:45.75pt;
  width:844pt' x:str>LIST OF SALARY
  ADJUSTMENT SUMMARY<span style='mso-spacerun:yes'></span></td>
 </tr>
 <tr class=xl28 height=41 style='mso-height-source:userset;height:30.75pt'>
  <td height=41 class=xl27 style='height:30.75pt'></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
  <td class=xl29 x:str>From<span style='mso-spacerun:yes'></span></td>
  <td class=xl30 ><%=dt_emp.Rows[0][8].ToString() %></td>
  <td class=xl50>To</td>
  <td class=xl30 ><%=dt_emp.Rows[0][9].ToString() %></td>
  <td class=xl28></td>
  <td class=xl27></td>
 </tr>
 <tr class=xl25 height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl46 width=41 style='height:22.5pt;width:31pt'>No.</td>
  <td class=xl47 width=112 style='width:84pt'>Department</td>
  <td class=xl47 width=130 style='width:98pt'>Group</td>
  <td class=xl47 width=80 style='width:60pt'>Emp ID</td>
  <td class=xl47 width=194 style='width:146pt'>Full Name</td>
  <td class=xl51 width=119 style='width:89pt'>Adjusted Date</td>
  <td class=xl47 width=122 style='width:92pt'>Adjusted Type</td>
  <td class=xl47 width=103 style='width:77pt'>Amount</td>
  <td class=xl47 width=222 style='width:167pt'>Note</td>
 </tr>
 <tr class=xl25 height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl48 width=41 style='height:22.5pt;border-top:none;
  width:31pt'>Stt</td>
  <td class=xl49 width=112 style='border-top:none;width:84pt'>Bộ Phận</td>
  <td class=xl49 width=130 style='border-top:none;width:98pt'>Nhóm</td>
  <td class=xl49 width=80 style='border-top:none;width:60pt'>Mã Số</td>
  <td class=xl49 width=194 style='border-top:none;width:146pt'>Họ Tên</td>
  <td class=xl52 width=119 style='border-top:none;width:89pt'>Ngày Điều Chỉnh</td>
  <td class=xl49 width=122 style='border-top:none;width:92pt'>Loại Điều Chỉnh</td>
  <td class=xl49 width=103 style='border-top:none;width:77pt'>Số tiền</td>
  <td class=xl49 width=222 style='border-top:none;width:167pt'>Ghi chú</td>
 </tr>
 <%
     int i = 0;	 
     double sum = 0;
     for (i = 0; i < emp_row; i++)
     {
         sum += Double.Parse(dt_emp.Rows[i][6].ToString());
 %>
 <tr class=xl26 height=22 style='height:16.5pt'>
  <td height=22 class=xl31 style='height:16.5pt;border-top:none' x:num><%=i+1 %></td>
  <td class=xl32 style='border-top:none'><%=dt_emp.Rows[i][0].ToString() %></td>
  <td class=xl32 style='border-top:none'><%=dt_emp.Rows[i][1].ToString() %></td>
  <td class=xl33 style='border-top:none'><%=dt_emp.Rows[i][2].ToString() %></td>
  <td class=xl34 style='border-top:none'><%=dt_emp.Rows[i][3].ToString() %></td>
  <td class=xl35 style='border-top:none'><%=dt_emp.Rows[i][4].ToString() %></td>
  <td class=xl35 style='border-top:none'><%=dt_emp.Rows[i][5].ToString() %></td>
  <td class=xl36 style='border-top:none' x:num><%=dt_emp.Rows[i][6].ToString() %></td>
  <td class=xl37 width=222 style='border-top:none;width:167pt'><%=dt_emp.Rows[i][7].ToString() %></td>
 </tr>
 <%
     }
 %>
 <tr height=22 style='height:16.5pt'>
  <td colspan=7 height=22 class=xl55 style='border-right:.5pt solid black;
  height:16.5pt'>Total <%=i%> employee(s)</td>
  <td class=xl45 x:num><%=sum %> </td>
  <td class=xl44 width=222 style='width:167pt'>&nbsp;</td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>

 </tr>
 <![endif]>
</table>

</body>

</html>