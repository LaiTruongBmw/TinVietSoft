<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser("inv");
    Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8";
    Response.Buffer = false;
%>

<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<%    
    string p_from_date = Request.QueryString["p_from_date"];
    string p_wh_pk = Request.QueryString["p_wh_pk"];
	string p_wh_name = Request.QueryString["p_wh_name"];
%>

<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_bisc00031_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_bisc00031_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_bisc00031_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>VINAGENUWIN</o:Author>
  <o:LastAuthor>VINAGENUWIN</o:LastAuthor>
  <o:LastPrinted>2011-05-11T07:06:21Z</o:LastPrinted>
  <o:Created>2011-05-11T06:40:24Z</o:Created>
  <o:LastSaved>2011-05-11T07:06:32Z</o:LastSaved>
  <o:Version>11.6360</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"Page &P of &N";
	margin:.18in .17in .17in .17in;
	mso-header-margin:.17in;
	mso-footer-margin:.16in;
	mso-page-orientation:landscape;}
.font5
	{color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
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
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl25
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl26
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:auto none;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:auto none;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	font-size:8.0pt;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:auto none;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	color:#993300;
	font-size:20.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
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
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>9</x:ActiveRow>
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
  <x:WindowHeight>8700</x:WindowHeight>
  <x:WindowWidth>16155</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$1:$3</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=950 style='border-collapse:
 collapse;table-layout:fixed;width:717pt'>
 <col width=40 style='mso-width-source:userset;mso-width-alt:1462;width:30pt'>
 <col width=100 style='mso-width-source:userset;mso-width-alt:3657;width:75pt'>
 <col width=200 style='mso-width-source:userset;mso-width-alt:7314;width:150pt'>
 <col width=50 style='mso-width-source:userset;mso-width-alt:1828;width:38pt'>
 <col width=70 span=8 style='mso-width-source:userset;mso-width-alt:2560;
 width:53pt'>
 <tr height=50 style='mso-height-source:userset;height:37.5pt'>
  <td colspan=12 height=50 class=xl36 width=950 style='height:37.5pt;
  width:717pt'>W/H Monthly Closing</td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=4 height=20 class=xl35 width=390 style='height:15.0pt;width:293pt'>W/H
  : <font class="font5"><%=p_wh_name%></font></td>
  <td colspan=4 class=xl35 width=280 style='width:212pt'>Stock Date : <font
  class="font5"><%=System.DateTime.ParseExact(p_from_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("MM/yyyy")%></font></td>
  <td colspan=4 class=xl35 width=280 style='width:212pt'>Print Date : <font
  class="font5"><%=System.DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss")%></font></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=12 height=17 class=xl34 width=950 style='height:12.75pt;
  width:717pt'>&nbsp;</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl24 width=40 style='height:22.5pt;border-top:none;
  width:30pt'>Seq</td>
  <td class=xl25 width=100 style='border-top:none;width:75pt'>Item Code</td>
  <td class=xl25 width=200 style='border-top:none;width:150pt'>Item Name</td>
  <td class=xl25 width=50 style='border-top:none;width:38pt'>UOM</td>
  <td class=xl25 width=70 style='border-top:none;width:53pt'>Begin Qty</td>
  <td class=xl25 width=70 style='border-top:none;width:53pt'>In Qty</td>
  <td class=xl25 width=70 style='border-top:none;width:53pt'>Sale</td>
  <td class=xl25 width=70 style='border-top:none;width:53pt'>FOC</td>
  <td class=xl25 width=70 style='border-top:none;width:53pt'>Trans</td>
  <td class=xl25 width=70 style='border-top:none;width:53pt'>Adjust Qty</td>
  <td class=xl25 width=70 style='border-top:none;width:53pt'>Out Qty</td>
  <td class=xl25 width=70 style='border-top:none;width:53pt'>End Qty</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl26 width=40 style='height:18.75pt;width:30pt' x:num>1</td>
  <td class=xl27 width=100 style='width:75pt'>wqrqwrwqrqwrqwrqwr</td>
  <td class=xl27 width=200 style='width:150pt'>wqqwrwqrqwrqwrqwrqwrqwrqwrwqr</td>
  <td class=xl27 width=50 style='width:38pt'>erewr</td>
  <td class=xl28 width=70 style='width:53pt' x:num="15"><span
  style='mso-spacerun:yes'>           </span>15.00 </td>
  <td class=xl28 width=70 style='width:53pt' x:num="156"><span
  style='mso-spacerun:yes'>         </span>156.00 </td>
  <td class=xl29 width=70 style='width:53pt' x:num="12"><span
  style='mso-spacerun:yes'>           </span>12.00 </td>
  <td class=xl29 width=70 style='width:53pt' x:num="324"><span
  style='mso-spacerun:yes'>         </span>324.00 </td>
  <td class=xl29 width=70 style='width:53pt' x:num="324"><span
  style='mso-spacerun:yes'>         </span>324.00 </td>
  <td class=xl29 width=70 style='width:53pt' x:num="325"><span
  style='mso-spacerun:yes'>         </span>325.00 </td>
  <td class=xl28 width=70 style='width:53pt' x:num="235"><span
  style='mso-spacerun:yes'>         </span>235.00 </td>
  <td class=xl28 width=70 style='width:53pt' x:num="325"><span
  style='mso-spacerun:yes'>         </span>325.00 </td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl30 width=40 style='height:18.75pt;width:30pt'>&nbsp;</td>
  <td class=xl31 width=100 style='width:75pt'>&nbsp;</td>
  <td class=xl31 width=200 style='width:150pt'>&nbsp;</td>
  <td class=xl31 width=50 style='width:38pt'>&nbsp;</td>
  <td class=xl32 width=70 style='width:53pt' x:num="232"><span
  style='mso-spacerun:yes'>         </span>232.00 </td>
  <td class=xl32 width=70 style='width:53pt' x:num="23432"><span
  style='mso-spacerun:yes'>    </span>23,432.00 </td>
  <td class=xl33 width=70 style='width:53pt' x:num="324"><span
  style='mso-spacerun:yes'>         </span>324.00 </td>
  <td class=xl33 width=70 style='width:53pt' x:num="325"><span
  style='mso-spacerun:yes'>         </span>325.00 </td>
  <td class=xl33 width=70 style='width:53pt' x:num="325"><span
  style='mso-spacerun:yes'>         </span>325.00 </td>
  <td class=xl33 width=70 style='width:53pt' x:num="325"><span
  style='mso-spacerun:yes'>         </span>325.00 </td>
  <td class=xl32 width=70 style='width:53pt' x:num="325"><span
  style='mso-spacerun:yes'>         </span>325.00 </td>
  <td class=xl32 width=70 style='width:53pt' x:num="325"><span
  style='mso-spacerun:yes'>         </span>325.00 </td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=40 style='width:30pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=200 style='width:150pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
