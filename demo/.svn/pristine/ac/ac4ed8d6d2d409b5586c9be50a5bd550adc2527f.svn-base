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
    string type = Request.QueryString["type"];

    string para = "'" + date_type + "','" + from_dt + "','" + to_dt + "','" + slip_cust + "','" + item + "','" + chkBal + "','" + type + "'";
    DataTable dt;
    dt = CtlLib.TableReadOpenCursor("st_lg__RPT_DSCD00101", para);
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<link rel=File-List
href="New%20Microsoft%20Excel%20Worksheet%20(2)_files/filelist.xml">
<style id="New Microsoft Excel Worksheet (2)_13571_Styles"><!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
{margin:.5in .25in .5in .25in;
mso-header-margin:.5in;
mso-footer-margin:.5in;
mso-page-orientation:landscape;}	
.xl6413571
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
.xl6513571
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
.xl6613571
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
.xl6713571
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
.xl6813571
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
.xl6913571
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
.xl7013571
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
--></style>
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

<div id="New Microsoft Excel Worksheet (2)_13571" align=center
x:publishsource="Excel">

<table border=0 cellpadding=0 cellspacing=0 width=1717 class=xl6413571
 style='border-collapse:collapse;table-layout:fixed;width:1289pt'>
 <col class=xl6413571 width=78 style='mso-width-source:userset;mso-width-alt:
 2852;width:59pt'>
 <col class=xl6413571 width=133 style='mso-width-source:userset;mso-width-alt:
 4864;width:100pt'>
 <col class=xl6413571 width=70 style='mso-width-source:userset;mso-width-alt:
 2560;width:53pt'>
 <col class=xl6413571 width=71 style='mso-width-source:userset;mso-width-alt:
 2596;width:53pt'>
 <col class=xl6413571 width=84 style='mso-width-source:userset;mso-width-alt:
 3072;width:63pt'>
 <col class=xl6413571 width=64 style='width:48pt'>
 <col class=xl6413571 width=56 style='mso-width-source:userset;mso-width-alt:
 2048;width:42pt'>
 <col class=xl6413571 width=81 style='mso-width-source:userset;mso-width-alt:
 2962;width:61pt'>
 <col class=xl6413571 width=64 span=2 style='width:48pt'>
 <col class=xl6413571 width=72 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl6413571 width=64 style='width:48pt'>
 <col class=xl6413571 width=72 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl6413571 width=64 style='width:48pt'>
 <col class=xl6413571 width=72 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl6413571 width=64 style='width:48pt'>
 <col class=xl6413571 width=72 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl6413571 width=64 style='width:48pt'>
 <col class=xl6413571 width=72 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl6413571 width=64 style='width:48pt'>
 <col class=xl6413571 width=72 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl6413571 width=64 style='width:48pt'>
 <col class=xl6413571 width=72 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl6413571 width=64 style='width:48pt'>
 <tr height=57 style='mso-height-source:userset;height:42.75pt'>
  <td colspan=24 height=57 class=xl6713571 width=1717 style='height:42.75pt;
  width:1289pt'><%=System.DateTime.ParseExact(from_dt, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%> ~ <%=System.DateTime.ParseExact(to_dt, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl6513571 style='height:18.75pt;border-top:none'>PO No</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Item Name</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Item Size</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Item Color</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Cust Name</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Ord Qty</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Prod Qty</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Prod Balance</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Deli Qty</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Deli Bal</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Out Date 1</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Out Qty 1</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Out Date 2</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Out Qty 2</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Out Date 3</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Out Qty 3</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Out Date 4</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Out Qty 4</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Out Date 5</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Out Qty 5</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Out Date 6</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Out Qty 6</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Out Date 7</td>
  <td class=xl6513571 style='border-top:none;border-left:none'>Out Qty 7</td>
 </tr>
 <% for (int i = 0; i < dt.Rows.Count; i++)
    {%>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl6913571 width=78 style='height:18.75pt;border-top:none;
  width:59pt'><%= dt.Rows[i]["po_no"] %></td>
  <td class=xl6913571 width=133 style='border-top:none;border-left:none;
  width:100pt'><%= dt.Rows[i]["item_name"] %></td>
  <td class=xl6913571 width=70 style='border-top:none;border-left:none;
  width:53pt'><%= dt.Rows[i]["item_size"] %></td>
  <td class=xl6913571 width=71 style='border-top:none;border-left:none;
  width:53pt'><%= dt.Rows[i]["item_color"] %></td>
  <td class=xl6913571 width=84 style='border-top:none;border-left:none;
  width:63pt'><%= dt.Rows[i]["cust_item_nm"] %></td>
  <td class=xl6813571 style='border-top:none;border-left:none'><%= dt.Rows[i]["ord_qty"] %></td>
  <td class=xl6813571 style='border-top:none;border-left:none'><%= dt.Rows[i]["prod_qty"] %></td>
  <td class=xl6813571 style='border-top:none;border-left:none'><%= dt.Rows[i]["prod_bal"] %></td>
  <td class=xl6813571 style='border-top:none;border-left:none'><%= dt.Rows[i]["deli_qty"] %></td>
  <td class=xl6613571 style='border-top:none;border-left:none'><%= dt.Rows[i]["deli_bal"] %></td>
  <td class=xl7013571 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_date_01"] %></td>
  <td class=xl6813571 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_qty_01"] %></td>
  <td class=xl7013571 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_date_02"]%></td>
  <td class=xl6813571 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_qty_02"]%></td>
  <td class=xl7013571 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_date_03"]%></td>
  <td class=xl6813571 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_qty_03"]%></td>
  <td class=xl7013571 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_date_04"]%></td>
  <td class=xl6813571 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_qty_04"]%></td>
  <td class=xl7013571 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_date_05"]%></td>
  <td class=xl6813571 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_qty_05"]%></td>
  <td class=xl7013571 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_date_06"]%></td>
  <td class=xl6813571 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_qty_06"]%></td>
  <td class=xl7013571 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_date_07"]%></td>
  <td class=xl6813571 style='border-top:none;border-left:none'><%= dt.Rows[i]["out_qty_07"]%></td>
 </tr>
 <%} %>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=78 style='width:59pt'></td>
  <td width=133 style='width:100pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=84 style='width:63pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=56 style='width:42pt'></td>
  <td width=81 style='width:61pt'></td>
  <td width=64 style='width:48pt'></td>
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

