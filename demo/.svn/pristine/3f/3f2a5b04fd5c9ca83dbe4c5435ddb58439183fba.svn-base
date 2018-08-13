<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%
    ESysLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
 
<%
	string l_project_pk = Request["p_project_pk"];
	string l_budget_pk = Request["p_budget_pk"];
	string l_parameter = "";
	l_parameter = "'" + l_project_pk + "','" + l_budget_pk + "'";
    DataTable dt = ESysLib.TableReadOpenCursor("pm_sel_61040040_upload", l_parameter);
    //SP_SEL_KPBM00040_UPLOAD_ITEM
	
    //if (dt.Rows.Count == 0)
    //{
    //    Response.Write("There is no data.");
    //    Response.End();
    //}
%>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="kpbm00040_214_Excel_Upload_1_files/filelist.xml">
<link rel=Edit-Time-Data href="kpbm00040_214_Excel_Upload_1_files/editdata.mso">
<link rel=OLE-Object-Data href="kpbm00040_214_Excel_Upload_1_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>SVPOSLILAMA</o:LastAuthor>
  <o:LastPrinted>2011-07-08T07:49:42Z</o:LastPrinted>
  <o:Created>2011-07-08T07:51:08Z</o:Created>
  <o:LastSaved>2011-07-08T07:51:08Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.25in .25in .25in .25in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-page-orientation:landscape;
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
.xl65
	{mso-style-parent:style0;
	font-size:20.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl66
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFCC;
	mso-pattern:black none;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFCC;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl68
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFCC;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl69
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFCC;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl70
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFCC;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl71
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	background:#CCFFCC;
	mso-pattern:black none;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;
	background:#CCFFCC;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl73
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFCC;
	mso-pattern:black none;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	background:#CCFFCC;
	mso-pattern:black none;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	border:.5pt solid windowtext;}
.xl76
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	mso-number-format:"\#\,\#\#0\.000000000";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl78
	{mso-style-parent:style0;
	mso-number-format:"\#\,\#\#0\.00000";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl79
	{mso-style-parent:style0;
	mso-number-format:Standard;
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl80
	{background:silver;
	mso-pattern:auto none;}
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
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>5</x:ActiveRow>
       <x:ActiveCol>5</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>9300</x:WindowHeight>
  <x:WindowWidth>15135</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$1:$3</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1026"/>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1925 style='border-collapse:
 collapse;table-layout:fixed;width:1444pt'>
 <col width=86 style='mso-width-source:userset;mso-width-alt:3145;width:65pt'>
 <col width=114 style='mso-width-source:userset;mso-width-alt:4169;width:86pt'>
 <col width=222 style='mso-width-source:userset;mso-width-alt:8118;width:167pt'>
 <col width=107 style='mso-width-source:userset;mso-width-alt:3913;width:80pt'>
 <col width=64 span=2 style='width:48pt'>
 <col width=113 style='mso-width-source:userset;mso-width-alt:4132;width:85pt'>
 <col width=99 span=5 style='mso-width-source:userset;mso-width-alt:3620;
 width:74pt'>
 <col width=0 style='display:none;mso-width-source:userset;mso-width-alt:0'>
 <col width=78 style='mso-width-source:userset;mso-width-alt:2852;width:59pt'>
 <col width=95 style='mso-width-source:userset;mso-width-alt:3474;width:71pt'>
 <col width=64 span=2 style='width:48pt'>
 <col width=0 style='display:none;mso-width-source:userset;mso-width-alt:0'>
 <col width=103 style='mso-width-source:userset;mso-width-alt:3766;width:77pt'>
 <col width=64 span=4 style='width:48pt'>
 <col width=0 span=13 style='display:none;mso-width-source:userset;mso-width-alt:
 0'>
 <tr height=34 style='height:25.5pt'>
  <td colspan=36 height=34 class=xl65 width=1925 style='height:25.5pt;
  width:1444pt'>BCWS Details Registration - Construction</td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td rowspan=2 height=67 class=xl66 width=86 style='height:50.25pt;border-top:
  none;width:65pt'>Level</td>
  <td rowspan=2 class=xl66 width=114 style='border-top:none;width:86pt'>Code</td>
  <td rowspan=2 class=xl66 width=222 style='border-top:none;width:167pt'>Name</td>
  <td rowspan=2 class=xl66 width=107 style='border-top:none;width:80pt'>Standard</td>
  <td colspan=8 class=xl67 style='border-right:.5pt solid black;border-left:
  none'>Working(Changed)</td>
  <td colspan=3 class=xl72 style='border-right:.5pt solid black;border-left:
  none'>Order W. Div.</td>
  <td rowspan=2 class=xl66 width=64 style='border-top:none;width:48pt'>Excution
  (Yes/No)</td>
  <td rowspan=2 class=xl66 width=64 style='border-top:none;width:48pt'>Dir. Mgt
  Outsrc</td>
  <td rowspan=2 class=xl66 width=0 style='border-top:none'>_Budget_PK</td>
  <td rowspan=2 class=xl66 width=103 style='border-top:none;width:77pt'>Budget
  Code</td>
  <td rowspan=2 class=xl66 width=64 style='border-top:none;width:48pt'>Standard
  Code</td>
  <td rowspan=2 class=xl66 width=64 style='border-top:none;width:48pt'>Calc.
  Basic</td>
  <td rowspan=2 class=xl66 width=64 style='border-top:none;width:48pt'>Order
  Status</td>
  <td rowspan=2 class=xl66 width=64 style='border-top:none;width:48pt'>A. Rslt
  Rcpt Y/N</td>
  <td rowspan=2 class=xl66 width=0 style='border-bottom:.5pt solid black;
  border-top:none'>_PROJECT_PK</td>
  <td rowspan=2 class=xl66 width=0 style='border-bottom:.5pt solid black;
  border-top:none'>_UNDERTAKECTRTBASC_PK</td>
  <td rowspan=2 class=xl66 width=0 style='border-bottom:.5pt solid black;
  border-top:none'>_UNSDERTAKE_SEQ</td>
  <td rowspan=2 class=xl66 width=0 style='border-bottom:.5pt solid black;
  border-top:none'>_BUDGETNST_PK</td>
  <td rowspan=2 class=xl66 width=0 style='border-bottom:.5pt solid black;
  border-top:none'>_BOOKING_AMT</td>
  <td rowspan=2 class=xl66 width=0 style='border-bottom:.5pt solid black;
  border-top:none'>_SEQ</td>
  <td rowspan=2 class=xl66 width=0 style='border-bottom:.5pt solid black;
  border-top:none'>_NUM</td>
  <td rowspan=2 class=xl66 width=0 style='border-bottom:.5pt solid black;
  border-top:none'>_PARENT_PK</td>
  <td rowspan=2 class=xl66 width=0 style='border-bottom:.5pt solid black;
  border-top:none'>_PARENT_AMT</td>
  <td rowspan=2 class=xl66 width=0 style='border-bottom:.5pt solid black;
  border-top:none'>_LEVL_NUM</td>
  <td rowspan=2 class=xl66 width=0 style='border-bottom:.5pt solid black;
  border-top:none'>_PK</td>
  <td rowspan=2 class=xl66 width=0 style='border-bottom:.5pt solid black;
  border-top:none'>_LEVEL_PK</td>
  <td rowspan=2 class=xl66 width=0 style='border-bottom:.5pt solid black;
  border-top:none'>_TECPS_ITEM_PK</td>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl74 width=64 style='height:30.0pt;width:48pt'>Unit</td>
  <td class=xl74 width=64 style='width:48pt'>CCY</td>
  <td class=xl74 width=113 style='width:85pt'>Quantity</td>
  <td class=xl74 width=99 style='width:74pt'>Raw Mtrl. Cost U/P</td>
  <td class=xl74 width=99 style='width:74pt'>Labor Cost U/P</td>
  <td class=xl74 width=99 style='width:74pt'>Exp. U/P</td>
  <td class=xl74 width=99 style='width:74pt'>Unit Price</td>
  <td class=xl74 width=99 style='width:74pt'>Amount</td>
  <td class=xl74 width=0>_Order_PK</td>
  <td class=xl74 width=78 style='width:59pt'>Code</td>
  <td class=xl74 width=95 style='width:71pt'>Name</td>
 </tr>
 <%
	
        //if (dt.Rows[row]["tecps_undertakelevelcode_pk"].ToString() == "")
        //{
 %>
 <%--<tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl76 width=86 style='height:27.75pt;width:65pt'>level</td>
  <td class=xl76 width=114 style='border-left:none;width:86pt'>code</td>
  <td class=xl76 width=222 style='border-left:none;width:167pt'>name</td>
  <td class=xl76 width=107 style='border-left:none;width:80pt'></td>
  <td class=xl76 width=64 style='border-left:none;width:48pt'></td>
  <td class=xl76 width=64 style='border-left:none;width:48pt'></td>
  <td class=xl77 style='border-left:none' x:num></td>
  <td class=xl78 style='border-left:none' x:num></td>
  <td class=xl78 style='border-left:none' x:num></td>
  <td class=xl78 style='border-left:none' x:num></td>
  <td class=xl78 style='border-left:none' x:num></td>
  <td class=xl79 style='border-left:none' x:num></td>
  <td class=xl75 style='border-left:none'>&nbsp;</td>
  <td class=xl76 width=78 style='border-left:none;width:59pt'></td>
  <td class=xl76 width=95 style='border-left:none;width:71pt'></td>
  <td class=xl76 width=64 style='border-left:none;width:48pt'></td>
  <td class=xl76 width=64 style='border-left:none;width:48pt'></td>
  <td class=xl75 style='border-left:none'>&nbsp;</td>
  <td class=xl76 width=103 style='border-left:none;width:77pt'></td>
  <td class=xl76 width=64 style='border-left:none;width:48pt'></td>
  <td class=xl76 width=64 style='border-left:none;width:48pt'></td>
  <td class=xl76 width=64 style='border-left:none;width:48pt'></td>
  <td class=xl76 width=64 style='border-left:none;width:48pt'></td>
  <td style='mso-ignore:colspan'></td>
  <td style='mso-ignore:colspan'></td>
  <td style='mso-ignore:colspan'></td>
  <td style='mso-ignore:colspan'></td>
  <td style='mso-ignore:colspan'></td>
  <td style='mso-ignore:colspan'></td>
  <td style='mso-ignore:colspan'></td>
  <td style='mso-ignore:colspan'>join_level_pk</td>
  <td style='mso-ignore:colspan'></td>
  <td style='mso-ignore:colspan'></td>
  <td style='mso-ignore:colspan'></td>
  <td style='mso-ignore:colspan'>tecps_undertakelevelcode_pk</td>
  <td style='mso-ignore:colspan'>item_pk</td>
  <td style='mso-ignore:colspan'></td>
 </tr>--%>
 <%
        //}
        //else
        //{
     string p_temp = "";
     string _color = "";
        for(int row = 0; row < dt.Rows.Count; row ++)
	{
        if (dt.Rows[row][6].ToString() == "Y")
        {
            _color = "Silver";
        }
        else
        {
            _color = "";
        }
		%>
<tr height=37 style='mso-height-source:auto;height:27.75pt'>
  <td height=37 class=xl76 width=86 style='height:27.75pt;width:65pt;background:<%=_color%>;	mso-pattern:auto none;'><%=dt.Rows[row][7].ToString()%></td>
  <td class=xl76  width=114 style='border-left:none;width:86pt;background:<%=_color%>;	mso-pattern:auto none;'><%if(dt.Rows[row][6].ToString()=="Y"){ %><%=dt.Rows[row][2].ToString()%><%}else{ %><%=dt.Rows[row][4].ToString()%><%} %></td>
  <td class=xl76 width=222 style='border-left:none;width:167pt;background:<%=_color%>;	mso-pattern:auto none;'><%if(dt.Rows[row][6].ToString()=="Y"){ %><%=dt.Rows[row][3].ToString()%><%}else{ %><%=dt.Rows[row][5].ToString()%><%} %></td>
  <td class=xl76 width=107 style='border-left:none;width:80pt;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td class=xl76 width=64 style='border-left:none;width:48pt;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td class=xl76 width=64 style='border-left:none;width:48pt;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td class=xl77 style='border-left:none;background:<%=_color%>;	mso-pattern:auto none;' x:num></td>
  <td class=xl78 style='border-left:none;background:<%=_color%>;	mso-pattern:auto none;' x:num></td>
  <td class=xl78 style='border-left:none;background:<%=_color%>;	mso-pattern:auto none;' x:num></td>
  <td class=xl78 style='border-left:none;background:<%=_color%>;	mso-pattern:auto none;' x:num></td>
  <td class=xl78 style='border-left:none;background:<%=_color%>;	mso-pattern:auto none;' x:num></td>
  <td class=xl79 style='border-left:none;background:<%=_color%>;	mso-pattern:auto none;' x:num></td>
  <td class=xl75 style='border-left:none;background:<%=_color%>;	mso-pattern:auto none;'>&nbsp;</td>
  <td class=xl76 width=78 style='border-left:none;width:59pt;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td class=xl76 width=95 style='border-left:none;width:71pt;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td class=xl76 width=64 style='border-left:none;width:48pt;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td class=xl76 width=64 style='border-left:none;width:48pt;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td class=xl75 style='border-left:none;background:<%=_color%>;	mso-pattern:auto none;'>&nbsp;</td>
  <td class=xl76 width=103 style='border-left:none;width:77pt;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td class=xl76 width=64 style='border-left:none;width:48pt;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td class=xl76 width=64 style='border-left:none;width:48pt;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td class=xl76 width=64 style='border-left:none;width:48pt;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td class=xl76 width=64 style='border-left:none;width:48pt;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td style='mso-ignore:colspan;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td style='mso-ignore:colspan;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td style='mso-ignore:colspan;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td style='mso-ignore:colspan;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td style='mso-ignore:colspan;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td style='mso-ignore:colspan;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td style='mso-ignore:colspan;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td style='mso-ignore:colspan;background:<%=_color%>;	mso-pattern:auto none;'><%=dt.Rows[row][8].ToString()%></td>
  <td style='mso-ignore:colspan;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td style='mso-ignore:colspan;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td style='mso-ignore:colspan;background:<%=_color%>;	mso-pattern:auto none;'></td>
  <td style='mso-ignore:colspan;background:<%=_color%>;	mso-pattern:auto none;'><%=dt.Rows[row][0].ToString()%></td>
  <td style='mso-ignore:colspan;background:<%=_color%>;	mso-pattern:auto none;'><%=dt.Rows[row][1].ToString()%></td>
  <td style='mso-ignore:colspan;'></td>
 </tr>		
	<%	
		
	}
 %>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=86 style='width:65pt'></td>
  <td width=114 style='width:86pt'></td>
  <td width=222 style='width:167pt'></td>
  <td width=107 style='width:80pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=113 style='width:85pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=0></td>
  <td width=78 style='width:59pt'></td>
  <td width=95 style='width:71pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=0></td>
  <td width=103 style='width:77pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=0></td>
  <td width=0></td>
  <td width=0></td>
  <td width=0></td>
  <td width=0></td>
  <td width=0></td>
  <td width=0></td>
  <td width=0></td>
  <td width=0></td>
  <td width=0></td>
  <td width=0></td>
  <td width=0></td>
  <td width=0></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
