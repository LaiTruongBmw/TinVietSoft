<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string p_wh_type = Request.QueryString["p_wh_type"];
    string p_wh = Request.QueryString["p_wh"];
    string p_item_group = Request.QueryString["p_item_group"];
    string p_item = Request.QueryString["p_item"];
    string p_month_text = Request.QueryString["p_month_text"];
    string p_month_value = Request.QueryString["p_month_value"];

    string para = "'" + p_wh_type + "','" + p_wh + "','" + p_item_group + "','" + p_item + "','" + p_month_value + "'";
    DataTable dt;
    dt = CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00051", para);
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<link rel=File-List
href="New%20Microsoft%20Excel%20Worksheet%20(5)_files/filelist.xml">
<style id="New Microsoft Excel Worksheet (4)_10283_Styles">
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
{margin:.5in .25in .5in .25in;
mso-header-margin:.5in;
mso-footer-margin:.5in;
mso-page-orientation:landscape;}		
.xl1510283
	{padding-top:1px;
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
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6310283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6410283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:black none;
	white-space:nowrap;}
.xl6510283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:black none;
	white-space:nowrap;}
.xl6610283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl6710283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl6810283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl6910283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7010283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FCD5B4;
	mso-pattern:black none;
	white-space:nowrap;}
.xl7110283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FCD5B4;
	mso-pattern:black none;
	white-space:nowrap;}
.xl7210283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:general;
	vertical-align:bottom;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FCD5B4;
	mso-pattern:black none;
	white-space:nowrap;}
.xl7310283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:20.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7410283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:black none;
	white-space:nowrap;}
.xl7510283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:black none;
	white-space:nowrap;}
.xl7610283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:black none;
	white-space:nowrap;}
.xl7710283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:black none;
	white-space:nowrap;}
.xl7810283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;
	background:#CCFFFF;
	mso-pattern:black none;
	white-space:nowrap;}
.xl7910283
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:black none;
	white-space:nowrap;}
-->
</style>
</head>

<body>
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
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
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
  <x:AcceptLabelsInFormulas/>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
<!--The following information was generated by Microsoft Excel's Publish as Web
Page wizard.-->
<!--If the same item is republished from Excel, all information between the DIV
tags will be replaced.-->
<!----------------------------->
<!--START OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD -->
<!----------------------------->

<div id="New Microsoft Excel Worksheet (4)_10283" align=center
x:publishsource="Excel"><!--The following information was generated by Microsoft Excel's Publish as Web
Page wizard.--><!--If the same item is republished from Excel, all information between the DIV
tags will be replaced.--><!-----------------------------><!--START OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD --><!----------------------------->

<table border=0 cellpadding=0 cellspacing=0 width=4380 style='border-collapse:
 collapse;table-layout:fixed;width:3302pt'>
 <col class=xl6310283 width=122 style='mso-width-source:userset;mso-width-alt:
 4461;width:92pt'>
 <col class=xl6310283 width=84 style='mso-width-source:userset;mso-width-alt:
 3072;width:63pt'>
 <col class=xl6310283 width=141 style='mso-width-source:userset;mso-width-alt:
 5156;width:106pt'>
 <col class=xl6310283 width=65 style='mso-width-source:userset;mso-width-alt:
 2377;width:49pt'>
 <col width=93 style='mso-width-source:userset;mso-width-alt:3401;width:70pt'>
 <col class=xl6310283 width=61 span=62 style='mso-width-source:userset;
 mso-width-alt:2230;width:46pt'>
 <col width=93 style='mso-width-source:userset;mso-width-alt:3401;width:70pt'>
 <tr class=xl6310283 height=57 style='mso-height-source:userset;height:42.75pt'>
  <td colspan=7 height=57 class=xl7310283 width=627 style='height:42.75pt;
  width:472pt'><!--The following information was generated by Microsoft Excel's Publish as Web
Page wizard.--><!--If the same item is republished from Excel, all information between the DIV
tags will be replaced.--><!-----------------------------><!--START OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD --><!-----------------------------><!--The following information was generated by Microsoft Excel's Publish as Web
Page wizard.--><!--If the same item is republished from Excel, all information between the DIV
tags will be replaced.--><!-----------------------------><!--START OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD --><!-----------------------------><%= p_month_text %></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=61 style='width:46pt'></td>
  <td class=xl6310283 width=93 style='width:70pt'></td>
 </tr>
 <tr class=xl6310283 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td rowspan=2 height=50 class=xl7410283 style='border-bottom:.5pt solid black;
  height:37.5pt;border-top:none'>Group NM</td>
  <td rowspan=2 class=xl7410283 style='border-bottom:.5pt solid black;
  border-top:none'>Item Code</td>
  <td rowspan=2 class=xl7410283 style='border-bottom:.5pt solid black;
  border-top:none'>Item Name</td>
  <td rowspan=2 class=xl7410283 style='border-bottom:.5pt solid black;
  border-top:none'>UOM</td>
  <td rowspan=2 class=xl7410283 style='border-bottom:.5pt solid black;
  border-top:none'>Begin Qty</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 1</td>
  <td colspan=2 class=xl7810283 style='border-right:.5pt solid black;
  border-left:none'>Day 2</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 3</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 4</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 5</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 6</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 7</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 8</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 9</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 10</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 11</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 12</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 13</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 14</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 15</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 16</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 17</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 18</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 19</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 20</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 21</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 22</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 23</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 24</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 25</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 26</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 27</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 28</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 29</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 30</td>
  <td colspan=2 class=xl7610283 style='border-right:.5pt solid black'>Day 31</td>
  <td rowspan=2 class=xl7410283 style='border-bottom:.5pt solid black'>End Qty</td>
 </tr>
 <tr class=xl6310283 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl6410283 style='height:18.75pt'>In Qty<span
  style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6410283>Out Qty</td>
  <td class=xl6410283>In Qty<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6510283>Out Qty</td>
 </tr>
   <%for (int i = 0; i < dt.Rows.Count; i++)
   { %>
 <tr class=xl6310283 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl6610283 width=122 style='height:18.75pt;width:92pt'><%= dt.Rows[i]["grp_nm"] %></td>
  <td class=xl6710283 width=84 style='width:63pt'><%= dt.Rows[i]["item_code"] %></td>
  <td class=xl6710283 width=141 style='width:106pt'><%= dt.Rows[i]["item_name"] %></td>
  <td class=xl6810283 width=65 style='width:49pt'><%= dt.Rows[i]["uom"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["begin_qty"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_01"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_01"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_02"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_02"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_03"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_03"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_04"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_04"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_05"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_05"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_06"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_06"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_07"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_07"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_08"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_08"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_09"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_09"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_10"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_10"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_11"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_11"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_12"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_12"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_13"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_13"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_14"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_14"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_15"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_15"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_16"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_16"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_17"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_17"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_18"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_18"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_19"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_19"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_20"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_20"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_21"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_21"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_22"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_22"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_23"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_23"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_24"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_24"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_25"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_25"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_26"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_26"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_27"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_27"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_28"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_28"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_29"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_29"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_30"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_30"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["in_qty_31"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["out_qty_31"] %></td>
  <td class=xl6910283><%= dt.Rows[i]["end_qty"] %></td>
 </tr>
  <%} %>
 <tr class=xl6310283 height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 class=xl7010283 style='height:14.25pt'>&nbsp;</td>
  <td class=xl7110283>&nbsp;</td>
  <td class=xl7110283>&nbsp;</td>
  <td class=xl7110283>&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>E4:E<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)"></td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>F4:F<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>G4:G<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>H4:H<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>I4:I<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>J4:J<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>K4:K<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>L4:L<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>M4:M<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>N4:N<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>O4:O<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)"nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>P4:P<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>Q4:Q<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>R4:R<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>S4:S<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>T4:T<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>U4:U<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>V4:V<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>W4:W<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>X4:X<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>Y4:Y<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>Z4:Z<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AA4:AA<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AB4:AB<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AC4:AC<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AD4:AD<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AE4:AE<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AF4:AF<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AG4:AG<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AH4:AH<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AI4:AI<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AJ4:AJ<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AK4:AK<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AL4:AL<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AM4:AM<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AN4:AN<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AO4:AO<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AP4:AP<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AQ4:AQ<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AR4:AR<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AS4:AS<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AT4:AT<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AU4:AU<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AV4:AV<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AW4:AW<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AX4:AX<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AY4:AY<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>AZ4:AZ<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>BA4:BA<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>BB4:BB<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>BC4:BC<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>BD4:BD<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>BE4:BE<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>BF4:BF<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>BG4:BG<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>BH4:BH<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>BI4:BI<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>BJ4:BJ<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>BK4:BK<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>BL4:BL<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>BM4:BM<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>BN4:BN<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;</td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>BO4:BO<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;<!-----------------------------><!--END OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD--><!-----------------------------></td>
  <td class=xl7210283 x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>BP4:BP<%= dt.Rows.Count+3%><%}else{%>E5:E5<%}%>)">&nbsp;<!-----------------------------><!--END OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD--><!-----------------------------><!-----------------------------><!--END OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD--><!-----------------------------></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=122 style='width:92pt'></td>
  <td width=84 style='width:63pt'></td>
  <td width=141 style='width:106pt'></td>
  <td width=65 style='width:49pt'></td>
  <td width=93 style='width:70pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=93 style='width:70pt'></td>
 </tr>
 <![endif]>
</table>

</div>


<!----------------------------->
<!--END OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD-->
<!----------------------------->
</body>

</html>
