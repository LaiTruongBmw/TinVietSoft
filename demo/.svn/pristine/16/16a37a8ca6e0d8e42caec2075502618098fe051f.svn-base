<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string strSQL = @"SELECT partner_name, addr1, phone_no, fax_no, tax_code, tco_bpphoto_pk 
                      FROM tco_company 
                      WHERE del_if = 0 AND pk = (SELECT MAX (pk)
                                                  FROM tco_company
                                                  WHERE del_if = 0 AND active_yn = 'Y')";
	
	string p_company_pk     = Request.QueryString["p_company_pk"];
    string p_tlg_mt_div_pk  = Request.QueryString["p_tlg_mt_div_pk"];
    string p_date_type      = Request.QueryString["p_date_type"];
    string p_from_dt        = Request.QueryString["p_from_dt"];
    string p_to_dt          = Request.QueryString["p_to_dt"];
    string p_po_item        = Request.QueryString["p_po_item"];
    string p_bill_to        = Request.QueryString["p_bill_to"];
    string p_so_uprice      = Request.QueryString["p_so_uprice"];
    string p_order_type     = Request.QueryString["p_order_type"];

    string para = "'" + p_company_pk + "','" + p_tlg_mt_div_pk + "','" + p_date_type + "','" + p_from_dt + "','" + p_to_dt + "','" + p_po_item + "','" + p_order_type + "','" + p_bill_to + "','" + p_so_uprice + "'";
    DataTable dt, dt1;
    dt = CtlLib.TableReadOpen(strSQL);
    dt1 = CtlLib.TableReadOpenCursor("st_lg__RPT_DSBS00060_3", para);
    if(dt1.Rows.Count == 0){Response.Write("No Data"); Response.End();}
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_dsbs00060_4_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dsbs00060_4_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dsbs00060_4_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>tuyen</o:LastAuthor>
  <o:Created>2012-09-26T04:17:11Z</o:Created>
  <o:LastSaved>2012-09-26T04:17:11Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"&C&P of &N";
	margin:1.0in .75in 1.0in .75in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-page-orientation:landscape;}
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
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Fixed;
	vertical-align:middle;}
.xl26
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:black none;}
.xl27
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:black none;}
.xl28
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:black none;}
.xl29
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl31
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl32
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl34
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl35
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:black none;}
.xl36
	{mso-style-parent:style0;
	color:blue;
	font-size:24.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl37
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Fixed;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl38
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Fixed;
	text-align:right;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl39
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFCC99;
	mso-pattern:black none;}
.xl40
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:black none;}
.xl41
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:black none;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>rpt_dsbs00060_3</x:Name>
    <x:WorksheetOptions>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>78</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:DoNotDisplayGridlines/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>14</x:ActiveRow>
       <x:ActiveCol>5</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>8445</x:WindowHeight>
  <x:WindowWidth>15195</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>45</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>
<!--The following information was generated by Microsoft Excel's Publish as Web
Page wizard.--><!--If the same item is republished from Excel, all information between the DIV
tags will be replaced.--><!-----------------------------><!--START OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD --><!----------------------------->

<table x:str border=0 cellpadding=0 cellspacing=0 width=1184 style='border-collapse:
 collapse;table-layout:fixed;width:891pt'>
 <col class=xl24 width=106 style='mso-width-source:userset;mso-width-alt:3876;
 width:80pt'>
 <col class=xl24 width=64 style='width:48pt'>
 <col class=xl24 width=72 style='mso-width-source:userset;mso-width-alt:2633;
 width:54pt'>
 <col class=xl24 width=30 style='mso-width-source:userset;mso-width-alt:1097;
 width:23pt'>
 <col class=xl24 width=81 style='mso-width-source:userset;mso-width-alt:2962;
 width:61pt'>
 <col class=xl24 width=111 style='mso-width-source:userset;mso-width-alt:4059;
 width:83pt'>
 <col class=xl24 width=62 style='mso-width-source:userset;mso-width-alt:2267;
 width:47pt'>
 <col class=xl24 width=53 style='mso-width-source:userset;mso-width-alt:1938;
 width:40pt'>
 <col class=xl24 width=67 style='mso-width-source:userset;mso-width-alt:2450;
 width:50pt'>
 <col class=xl24 width=59 style='mso-width-source:userset;mso-width-alt:2157;
 width:44pt'>
 <col class=xl24 width=70 style='mso-width-source:userset;mso-width-alt:2560;
 width:53pt'>
 <col class=xl24 width=68 style='mso-width-source:userset;mso-width-alt:2486;
 width:51pt'>
 <col class=xl24 width=70 style='mso-width-source:userset;mso-width-alt:2560;
 width:53pt'>
 <col class=xl24 width=59 style='mso-width-source:userset;mso-width-alt:2157;
 width:44pt'>
 <col width=70 span=2 style='mso-width-source:userset;mso-width-alt:2560;
 width:53pt'>
 <col width=72 style='mso-width-source:userset;mso-width-alt:2633;width:54pt'>
 <tr class=xl24 height=60 style='mso-height-source:userset;height:45.0pt'>
      <td height="60" class="xl36" width="1184" style='height: 45.0pt; width: 891pt'>
         <v:shape id="_x0000_s1025" type="#_x0000_t75" style='position: absolute; margin-left: 1.5pt;
             margin-top: 1.5pt; width: 75pt; height: 42pt; z-index: 1'>
   <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt.Rows[0]["tco_bpphoto_pk"]%>&table_name=tco_bpphoto" o:title="logo"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape>
     </td>
  <td colspan=16 height=60 class=xl36 width=1184 style='height:45.0pt;
  width:891pt'><!--The following information was generated by Microsoft Excel's Publish as Web
Page wizard.--><!--If the same item is republished from Excel, all information between the DIV
tags will be replaced.--><!-----------------------------><!--START OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD --><!-----------------------------><!--The following information was generated by Microsoft Excel's Publish as Web
Page wizard.--><!--If the same item is republished from Excel, all information between the DIV
tags will be replaced.--><!-----------------------------><!--START OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD --><!----------------------------->S/O
  CHECKING</td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl25 style='height:16.5pt'></td>
  <td colspan=4 class=xl37>Date: <%=System.DateTime.ParseExact(p_from_dt, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%>
                ~
                <%=System.DateTime.ParseExact(p_to_dt, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%></td>
  <td colspan=6 class=xl25 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl38>Print Date: <%= DateTime.Now.ToString("dd/MM/yyyy HH:mm") %></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt'>Buyer</td>
  <td class=xl27>Ord Date</td>
  <td class=xl27>P/O No</td>
  <td class=xl27>Seq</td>
  <td class=xl27>Item Code</td>
  <td class=xl28>Item Name</td>
  <td class=xl28>Cust Item</td>
  <td class=xl28>UOM</td>
  <td class=xl28>U/P</td>
  <td class=xl28>Ord Qty</td>
  <td class=xl28>Amount</td>
  <td class=xl27>Cancel Qty</td>
  <td class=xl27>Amount</td>
  <td class=xl27>Deli Qty</td>
  <td class=xl28>Amount</td>
  <td class=xl28>Bal Qty</td>
  <td class=xl28>Bal Amount</td>
 </tr>
  <%
     for (int i = 0; i < dt1.Rows.Count; i++)
     {
      %>
 <tr class=xl24 height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl29 width=106 style='height:21.0pt;width:80pt'><%= dt1.Rows[i]["bill_to_name"] %></td>
  <td class=xl30 x:num><%= dt1.Rows[i]["order_dt"] %></td>
  <td class=xl31><span style='mso-spacerun:yes'> </span><%= dt1.Rows[i]["po_no"] %></td>
  <td class=xl30 x:num><%= dt1.Rows[i]["seq_num"] %></td>
  <td class=xl31><%= dt1.Rows[i]["item_code"] %></td>
  <td class=xl32 width=111 style='width:83pt'><%= dt1.Rows[i]["item_name"] %></td>
  <td class=xl30><%= dt1.Rows[i]["cust_item_nm"] %></td>
  <td class=xl33><%= dt1.Rows[i]["ord_uom"] %></td>
  <td class=xl34 align=right x:num><%= dt1.Rows[i]["ref_unit_price"] %></td>
  <td class=xl34 align=right x:num><%= dt1.Rows[i]["ord_qty"] %></td>
  <td class=xl34 align=right x:num><%= dt1.Rows[i]["item_amount"] %></td>
  <td class=xl34 align=right x:num><%= dt1.Rows[i]["cancel_qty"] %></td>
  <td class=xl34 align=right x:num><%= dt1.Rows[i]["cancel_amount"] %></td>
  <td class=xl34 align=right x:num><%= dt1.Rows[i]["out_qty"] %></td>
  <td class=xl34 align=right x:num><%= dt1.Rows[i]["deli_amount"] %></td>
  <td class=xl34 align=right x:num><%= dt1.Rows[i]["bal_qty"] %></td>
  <td class=xl34 align=right x:num><%= dt1.Rows[i]["bal_amount"] %></td>
 </tr>
  <%} %>
 <tr class=xl24 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=8 height=20 class=xl39 style='border-right:.5pt solid black;
  height:15.0pt'>Total</td>
  <td class=xl35>&nbsp;</td>
  <td class=xl35 align=right x:num x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>J4:J<%= dt1.Rows.Count+3%><%}else{%>J5:J5<%}%>)"></td>
  <td class=xl35 align=right x:num x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>K4:K<%= dt1.Rows.Count+3%><%}else{%>K5:K5<%}%>)"></td>
  <td class=xl35 align=right x:num x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>L4:L<%= dt1.Rows.Count+3%><%}else{%>L5:L5<%}%>)"></td>
  <td class=xl35 align=right x:num x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>M4:M<%= dt1.Rows.Count+3%><%}else{%>M5:M5<%}%>)"></td>
  <td class=xl35 align=right x:num x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>N4:N<%= dt1.Rows.Count+3%><%}else{%>N5:N5<%}%>)"></td>
  <td class=xl35 align=right x:num x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>O4:O<%= dt1.Rows.Count+3%><%}else{%>O5:O5<%}%>)"></td>
  <td class=xl35 align=right x:num x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>P4:P<%= dt1.Rows.Count+3%><%}else{%>P5:P5<%}%>)"></td>
  <td class=xl35 align=right x:num x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>Q4:Q<%= dt1.Rows.Count+3%><%}else{%>Q5:Q5<%}%>)"></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=106 style='width:80pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=30 style='width:23pt'></td>
  <td width=81 style='width:61pt'></td>
  <td width=111 style='width:83pt'></td>
  <td width=62 style='width:47pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=67 style='width:50pt'></td>
  <td width=59 style='width:44pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=68 style='width:51pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=59 style='width:44pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=72 style='width:54pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
