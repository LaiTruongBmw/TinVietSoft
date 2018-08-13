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
    string date_type = Request.QueryString["date_type"];
    string from_dt = Request.QueryString["from_dt"];
    string to_dt = Request.QueryString["to_dt"];
    string slip_cust = Request.QueryString["slip_cust"];
    string item = Request.QueryString["item"];
    string chkBal = Request.QueryString["chkBal"];
    string chkReq = Request.QueryString["chkReq"];
    string type = Request.QueryString["type"];

    string para = "'" + date_type + "','" + from_dt + "','" + to_dt + "','" + slip_cust + "','" + item + "','" + chkBal + "','" + chkReq + "','" + type + "'";
    DataTable dt;
    dt = CtlLib.TableReadOpenCursor("st_lg__RPT_DSCD00100", para);
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<link rel=File-List
href="New%20Microsoft%20Excel%20Worksheet%20(2)_files/filelist.xml">
<style id="New Microsoft Excel Worksheet (2)_32130_Styles">
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
{margin:.5in .25in .5in .25in;
mso-header-margin:.5in;
mso-footer-margin:.5in;
mso-page-orientation:landscape;}	
.xl6332130
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
.xl6432130
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
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:black none;
	white-space:nowrap;}
.xl6532130
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
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6632130
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
	text-align:general;
	vertical-align:middle;
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl6732130
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
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6832130
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
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6932130
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
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7032130
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
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl7132130
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
	text-align:general;
	vertical-align:middle;
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7232130
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
	border:.5pt solid windowtext;
	background:#FCD5B4;
	mso-pattern:black none;
	white-space:nowrap;}
.xl7332130
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
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:general;
	vertical-align:bottom;
	border:.5pt solid windowtext;
	background:#FCD5B4;
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

<div id="New Microsoft Excel Worksheet (2)_32130" align=center
x:publishsource="Excel">

<table border=0 cellpadding=0 cellspacing=0 width=1964 class=xl6332130
 style='border-collapse:collapse;table-layout:fixed;width:1475pt'>
 <col class=xl6332130 width=111 style='mso-width-source:userset;mso-width-alt:
 4059;width:83pt'>
 <col class=xl6332130 width=74 style='mso-width-source:userset;mso-width-alt:
 2706;width:56pt'>
 <col class=xl6332130 width=70 style='mso-width-source:userset;mso-width-alt:
 2560;width:53pt'>
 <col class=xl6332130 width=71 style='mso-width-source:userset;mso-width-alt:
 2596;width:53pt'>
 <col class=xl6332130 width=34 style='mso-width-source:userset;mso-width-alt:
 1243;width:26pt'>
 <col class=xl6332130 width=66 style='mso-width-source:userset;mso-width-alt:
 2413;width:50pt'>
 <col class=xl6332130 width=101 style='mso-width-source:userset;mso-width-alt:
 3693;width:76pt'>
 <col class=xl6332130 width=100 style='mso-width-source:userset;mso-width-alt:
 3657;width:75pt'>
 <col class=xl6332130 width=49 style='mso-width-source:userset;mso-width-alt:
 1792;width:37pt'>
 <col class=xl6332130 width=64 style='width:48pt'>
 <col class=xl6332130 width=72 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl6332130 width=64 style='width:48pt'>
 <col class=xl6332130 width=72 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl6332130 width=64 style='width:48pt'>
 <col class=xl6332130 width=72 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl6332130 width=64 style='width:48pt'>
 <col class=xl6332130 width=72 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl6332130 width=64 style='width:48pt'>
 <col class=xl6332130 width=72 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl6332130 width=64 style='width:48pt'>
 <col class=xl6332130 width=72 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl6332130 width=64 style='width:48pt'>
 <col class=xl6332130 width=72 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl6332130 width=64 style='width:48pt'>
 <col class=xl6332130 width=72 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl6332130 width=64 style='width:48pt'>
 <col class=xl6332130 width=72 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl6332130 width=64 style='width:48pt'>
 <tr height=57 style='mso-height-source:userset;height:42.75pt'>
  <td colspan=24 height=57 class=xl6832130 width=1692 style='height:42.75pt;
  width:1271pt'><%=System.DateTime.ParseExact(from_dt, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%> ~ <%=System.DateTime.ParseExact(to_dt, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%></td>
  <td class=xl6332130 width=72 style='width:54pt'></td>
  <td class=xl6332130 width=64 style='width:48pt'></td>
  <td class=xl6332130 width=72 style='width:54pt'></td>
  <td class=xl6332130 width=64 style='width:48pt'></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl6432130 style='height:18.75pt;border-top:none'>Partner</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Order DT</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Slip No</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>P/O No</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Seq</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Item Code</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Item Name</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Cust Item Name</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>UOM</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>ETD</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Ord Qty</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Out Qty</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Deli Bal</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Days Left</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Date</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Qty</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Date</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Qty</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Date</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Qty</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Date</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Qty</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Date</td>
  <td class=xl6432130 style='border-top:none;border-left:none'>Qty</td>
  <td class=xl6432130 style='border-left:none'>Date</td>
  <td class=xl6432130 style='border-left:none'>Qty</td>
  <td class=xl6432130 style='border-left:none'>Date</td>
  <td class=xl6432130 style='border-left:none'>Qty</td>
 </tr>
 <% for (int i = 0; i < dt.Rows.Count; i++)
    { %>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl6632130 width=111 style='height:18.75pt;border-top:
  none;width:83pt'><%= dt.Rows[i]["partner_name"] %></td>
  <td class=xl7032130 width=74 style='border-top:none;border-left:none;
  width:56pt'><%= dt.Rows[i]["order_dt"] %></td>
  <td class=xl6632130 width=70 style='border-top:none;border-left:none;
  width:53pt'><%= dt.Rows[i]["slip_no"] %></td>
  <td class=xl6632130 width=71 style='border-top:none;border-left:none;
  width:53pt'><%= dt.Rows[i]["po_no"] %></td>
  <td class=xl7032130 width=34 style='border-top:none;border-left:none;
  width:26pt'><%= dt.Rows[i]["seq_num"] %></td>
  <td class=xl6532130 style='border-top:none;border-left:none'><span
  style='mso-spacerun:yes'>&nbsp;</span><%= dt.Rows[i]["item_code"] %><span
  style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6532130 style='border-top:none;border-left:none'><span
  style='mso-spacerun:yes'>&nbsp;</span><%= dt.Rows[i]["item_name"] %><span
  style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6532130 style='border-top:none;border-left:none'><%= dt.Rows[i]["cust_item_nm"] %></td>
  <td class=xl6932130 style='border-top:none;border-left:none'><span
  style='mso-spacerun:yes'>&nbsp;</span><%= dt.Rows[i]["ord_uom"] %><span
  style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl6732130 style='border-top:none;border-left:none'><%= dt.Rows[i]["item_etd"] %></td>
  <td class=xl6932130 style='border-top:none;border-left:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span><%= dt.Rows[i]["ord_qty"] %></td>
  <td class=xl6532130 style='border-top:none;border-left:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span><%= dt.Rows[i]["deli_qty"] %></td>
  <td class=xl6932130 style='border-top:none;border-left:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span><%= dt.Rows[i]["deli_bal"]%></td>
  <td class=xl7132130 align=right style='border-top:none;border-left:none'><%= dt.Rows[i]["days_left"]%></td>
  <td class=xl6732130 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_date_01"]%></td>
  <td class=xl6532130 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_qty_01"]%></td>
  <td class=xl6732130 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_date_02"]%></td>
  <td class=xl6532130 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_qty_02"]%></td>
  <td class=xl6732130 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_date_03"] %></td>
  <td class=xl6532130 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_qty_03"]%></td>
  <td class=xl6732130 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_date_04"] %></td>
  <td class=xl6532130 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_qty_04"]%></td>
  <td class=xl6732130 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_date_05"] %></td>
  <td class=xl6532130 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_qty_05"]%></td>
  <td class=xl6732130 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_date_06"] %></td>
  <td class=xl6532130 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_qty_06"] %></td>
  <td class=xl6732130 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_date_07"] %></td>
  <td class=xl6532130 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_qty_07"] %></td>
 </tr>
 <%} %>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl7232130 style='height:14.25pt;border-top:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7332130 style='border-top:none;border-left:none' x:num x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>K3:K<%= dt.Rows.Count+2%><%}else{%>K5:K5<%}%>)"><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span></td>
  <td class=xl7332130 style='border-top:none;border-left:none' x:num x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>L3:L<%= dt.Rows.Count+2%><%}else{%>L5:L5<%}%>)"><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span></td>
  <td class=xl7332130 style='border-top:none;border-left:none' x:num x:fmla="=SUM(<% if(dt.Rows.Count > 0){%>M3:M<%= dt.Rows.Count+2%><%}else{%>M5:M5<%}%>)"><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span></td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl7232130 style='border-top:none;border-left:none'>&nbsp;</td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=111 style='width:83pt'></td>
  <td width=74 style='width:56pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=34 style='width:26pt'></td>
  <td width=66 style='width:50pt'></td>
  <td width=101 style='width:76pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=49 style='width:37pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</div>


<!----------------------------->
<!--END OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD-->
<!----------------------------->
</body>

</html>
