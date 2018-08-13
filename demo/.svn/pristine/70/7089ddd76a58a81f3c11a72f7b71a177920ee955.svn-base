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
    string p_date   = Request.QueryString["p_date"];
	string p_wh	    = Request.QueryString["p_wh"];
	string p_item	= Request.QueryString["p_item"];

    string para = "'" + p_date + "','" + p_wh + "','" + p_item + "'";

	DataTable dt;
    dt = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00020", para);  
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="WH%20Stock%20Checking%204%20_files/filelist.xml">
<link rel=Edit-Time-Data href="WH%20Stock%20Checking%204%20_files/editdata.mso">
<link rel=OLE-Object-Data href="WH%20Stock%20Checking%204%20_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Mr Khanh</o:LastAuthor>
  <o:LastPrinted>2011-03-31T02:36:47Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2011-03-31T03:18:44Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .25in .25in .25in;
	mso-header-margin:.25in;
	mso-footer-margin:.25in;}
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
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl25
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl26
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl27
	{mso-style-parent:style0;
	color:purple;
	font-size:18.0pt;
	text-align:center;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl29
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl30
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl31
	{mso-style-parent:style0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl33
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl34
	{mso-style-parent:style0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl35
	{mso-style-parent:style0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border-top:none;
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
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>11</x:ActiveRow>
       <x:ActiveCol>6</x:ActiveCol>
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
  <x:WindowHeight>9300</x:WindowHeight>
  <x:WindowWidth>15135</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:AcceptLabelsInFormulas/>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=707 style='border-collapse:
 collapse;table-layout:fixed;width:530pt'>
 <col width=86 style='mso-width-source:userset;mso-width-alt:3145;width:65pt'>
 <col width=86 style='mso-width-source:userset;mso-width-alt:3145;width:65pt'>
 <col width=184 style='mso-width-source:userset;mso-width-alt:6729;width:138pt'>
 <col width=64 style='width:48pt'>
 <col width=89 style='mso-width-source:userset;mso-width-alt:3254;width:67pt'>
 <col width=71 span=4 style='mso-width-source:userset;mso-width-alt:2596;
 width:53pt'>
 <tr height=17 style='height:12.75pt'>
  <td colspan=9 rowspan=2 height=34 class=xl27 width=707 style='height:25.5pt;
  width:530pt'>W/H STOCK CHECKING</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=9 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td height=23 class=xl24 style='height:17.25pt'>Group</td>
  <td height=23 class=xl24 style='height:17.25pt'>Item Code</td>
  <td class=xl25>Item Name</td>
  <td class=xl25>UOM</td>
  <td class=xl25>Lot No</td>
  <td class=xl25>Begin Qty</td>
  <td class=xl25>In Qty</td>
  <td class=xl25>Out Qty</td>
  <td class=xl25>End Qty</td>
 </tr>
  <%
    for(int i = 0; i < dt.Rows.Count; i++)
    {
		if ( i < dt.Rows.Count-1 && dt.Rows[i]["group_name"].ToString() != dt.Rows[i+1]["group_name"].ToString() )
		{
 %>
 <tr height=17 style='height:12.75pt'>
  <td colspan=5 height=17 class=xl28 style='border-right:.5pt solid black;
  height:12.75pt' ><%= dt.Rows[i]["group_name"] %></td> 
 
  <td class=xl26 align=right x:num><%= dt.Rows[i]["begin_qty"] %></td>
  <td class=xl26 align=right x:num><%= dt.Rows[i]["in_qty"] %></td>
  <td class=xl26 align=right x:num><%= dt.Rows[i]["out_qty"] %></td>
  <td class=xl26 align=right x:num><%= dt.Rows[i]["end_qty"] %></td>
 </tr>
 <% 
 		}
		else
		{
%>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl32 style='height:12.75pt'><%= dt.Rows[i]["group_name"] %></td>
  <td height=17 class=xl32 style='height:12.75pt'><%= dt.Rows[i]["item_code"] %></td>
  <td class=xl31 width=184 style='width:138pt'><%= dt.Rows[i]["item_name"] %></td>
  <td class=xl33><%= dt.Rows[i]["uom"] %></td>
  <td class=xl34><%= dt.Rows[i]["lot_no"] %></td>
  <td class=xl35 align=right x:num><%= dt.Rows[i]["begin_qty"] %></td>
  <td class=xl35 align=right x:num><%= dt.Rows[i]["in_qty"] %></td>
  <td class=xl35 align=right x:num><%= dt.Rows[i]["out_qty"] %></td>
  <td class=xl35 align=right x:num><%= dt.Rows[i]["end_qty"] %></td>
 </tr>
<%		
		}
 	} %>     

 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=86 style='width:65pt'></td>
  <td width=184 style='width:138pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=71 style='width:53pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
