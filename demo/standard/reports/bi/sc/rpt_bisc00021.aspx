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
    string p_from_date  = Request.QueryString["p_from_date"];
    string p_to_date    = Request.QueryString["p_to_date"];
	string p_wh_type    = Request.QueryString["p_wh_type"];
    string p_wh         = Request.QueryString["p_wh"];
    string p_wh_name    = Request.QueryString["p_wh_name"];
    string p_item_grp   = Request.QueryString["p_item_grp"];
    string p_item       = Request.QueryString["p_item"];
    string p_lang       = Request.QueryString["p_lang"];

    string para = "'" + p_from_date + "','" + p_to_date + "','" + p_wh_type + "','" + p_wh + "','" + p_item_grp + "','" + p_item + "','" + p_lang + "'";
     DataTable dt, dt1;
     dt = CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00021_1", "'" + Session["User_ID"].ToString() + "'");
     dt1 = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00021", para);
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_bisc00021_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_bisc00021_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_bisc00021_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Mr Khanh</o:LastAuthor>
  <o:LastPrinted>2011-12-24T06:50:01Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2011-12-24T06:50:15Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"&CPage &P of &N";
	margin:.1in .25in .43in .25in;
	mso-header-margin:0in;
	mso-footer-margin:.11in;}
.font5
	{color:windowtext;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font6
	{color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font7
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font10
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
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
.style21
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:\B3CB\C6C0, monospace;
	mso-font-charset:129;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal_Sheet1;}
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
.xl25
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl29
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;}
.xl30
	{mso-style-parent:style21;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl31
	{mso-style-parent:style21;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl32
	{mso-style-parent:style21;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dashed windowtext;
	border-bottom:.5pt dashed windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dashed windowtext;
	border-bottom:.5pt dashed windowtext;
	border-left:none;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dashed windowtext;
	border-bottom:.5pt dashed windowtext;
	border-left:none;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Fixed;
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dashed windowtext;
	border-bottom:.5pt dashed windowtext;
	border-left:none;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Fixed;
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dashed windowtext;
	border-left:none;}
.xl38
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl41
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	white-space:normal;}
.xl42
	{mso-style-parent:style21;
	color:black;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl43
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl44
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl45
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl46
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl47
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
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
     <x:DefaultRowHeight>210</x:DefaultRowHeight>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>7</x:ActiveRow>
       <x:ActiveCol>9</x:ActiveCol>
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
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$6:$6</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl25>

<table x:str border=0 cellpadding=0 cellspacing=0 width=687 style='border-collapse:
 collapse;table-layout:fixed;width:514pt'>
 <col class=xl25 width=92 style='mso-width-source:userset;mso-width-alt:3364;
 width:69pt'>
 <col class=xl25 width=71 style='mso-width-source:userset;mso-width-alt:2596;
 width:53pt'>
 <col class=xl25 width=180 style='mso-width-source:userset;mso-width-alt:6582;
 width:135pt'>
 <col class=xl25 width=44 style='mso-width-source:userset;mso-width-alt:1609;
 width:33pt'>
 <col class=xl25 width=75 span=4 style='mso-width-source:userset;mso-width-alt:
 2742;width:56pt'>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl26 width=92 style='height:15.0pt;width:69pt'><!--[if gte vml 1]><v:shape id="_x0000_s1025" type="#_x0000_t75" style='position:absolute;
   margin-left:1.5pt;margin-top:1.5pt;width:70pt;height:42pt;z-index:1'>
   <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt.Rows[0]["tco_bpphoto_pk"]%>&table_name=tco_bpphoto" o:title="logo"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--></td>
  <td class=xl27 colspan=2 width=251 style='mso-ignore:colspan;width:188pt'><%= dt.Rows[0]["partner_name"]%></td>
  <td class=xl27 width=44 style='width:33pt'></td>
  <td class=xl25 width=75 style='width:56pt'></td>
  <td colspan=3 class=xl41 width=225 style='width:168pt'>Tel: <%= dt.Rows[0]["phone_no"]%></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl26 style='height:15.0pt'></td>
  <td class=xl26 colspan=2 style='mso-ignore:colspan'><%= dt.Rows[0]["addr1"]%></td>
  <td class=xl26></td>
  <td class=xl25></td>
  <td colspan=3 class=xl41 width=225 style='width:168pt'>Fax: <%= dt.Rows[0]["fax_no"]%></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl28 style='height:15.0pt'>&nbsp;</td>
  <td class=xl28 colspan=2 style='mso-ignore:colspan'>Tax code: <%= dt.Rows[0]["tax_code"]%></td>
  <td class=xl28>&nbsp;</td>
  <td class=xl25></td>
  <td colspan=3 class=xl42 width=225 style='width:168pt'>Print date : <%= DateTime.Now.ToString("dd/MM/yyyy HH:mm") %></td>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td colspan=8 height=40 class=xl43 width=687 style='height:30.0pt;width:514pt'>REPORT
  W/H STOCK CHECKING</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl26 colspan=3 style='height:18.75pt;mso-ignore:colspan'>W/H
  Name :<font class="font6"> <%= p_wh_name %></font><font class="font5"><span
  style='mso-spacerun:yes'>  </span></font></td>
  <td class=xl27></td>
  <td class=xl29></td>
  <td colspan=3 class=xl44>Date : <font class="font6"><%=System.DateTime.ParseExact(p_from_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%> - <%=System.DateTime.ParseExact(p_to_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%></font></td>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl30 width=92 style='height:30.0pt;width:69pt'>Group<br>
    <font class="font7">Nhóm</font></td>
  <td class=xl31 width=71 style='width:53pt'>Mã hàng<br>
    <font class="font7">Item Code</font></td>
  <td class=xl31 width=180 style='width:135pt'>Tên hàng<font class="font10"><br>
    </font><font class="font7">Item Description</font></td>
  <td class=xl31 width=44 style='width:33pt'>&#272;VT<font class="font10"><br>
    </font><font class="font7">UOM</font></td>
  <td class=xl31 width=75 style='width:56pt'>SL T&#7891;n &#273;&#7847;u<br>
    <font class="font7">Begin Qty</font></td>
  <td class=xl32 width=75 style='width:56pt'>SL Nh&#7853;p<br>
    <font class="font7">In Qty</font></td>
  <td class=xl32 width=75 style='width:56pt'>SL Xu&#7845;t<font class="font7"><br>
    Out Qty</font></td>
  <td class=xl32 width=75 style='width:56pt'>SL T&#7891;n cu&#7889;i<br>
    <font class="font7">End Qty</font></td>
 </tr>
  <%
     for (int i = 0; i < dt1.Rows.Count; i++)
     {
 %>
 <tr height=42 style='height:31.5pt'>
  <td height=42 class=xl33 width=92 style='height:31.5pt;width:69pt'><%= dt1.Rows[i]["grp_nm"]%></td>
  <td class=xl34 width=71 style='width:53pt'><%= dt1.Rows[i]["item_code"]%></td>
  <td class=xl34 width=180 style='width:135pt'><%= dt1.Rows[i]["item_name"]%></td>
  <td class=xl35 width=44 style='width:33pt'><%= dt1.Rows[i]["uom"]%></td>
  <td class=xl36 width=75 style='width:56pt' x:num><%= dt1.Rows[i]["begin_qty"]%></td>
  <td class=xl36 width=75 style='width:56pt' x:num><%= dt1.Rows[i]["in_qty"]%></td>
  <td class=xl36 width=75 style='width:56pt' x:num><%= dt1.Rows[i]["out_qty"]%></td>
  <td class=xl37 x:num><%= dt1.Rows[i]["end_qty"]%></td>
 </tr>
  <% } %>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=4 height=30 class=xl45 style='border-right:.5pt solid black;
  height:22.5pt'>Total</td>
  <td class=xl38 width=75 style='border-left:none;width:56pt' x:num x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>E7:E<%= dt1.Rows.Count+6%><%}else{%>E9:E9<%}%>)"></td>
  <td class=xl39 width=75 style='width:56pt' x:num  x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>F7:F<%= dt1.Rows.Count+6%><%}else{%>F9:F9<%}%>)"></td>
  <td class=xl39 width=75 style='width:56pt' x:num  x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>G7:G<%= dt1.Rows.Count+6%><%}else{%>G9:G9<%}%>)"></td>
  <td class=xl40 x:num x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>H7:H<%= dt1.Rows.Count+6%><%}else{%>H9:H9<%}%>)"></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=92 style='width:69pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=180 style='width:135pt'></td>
  <td width=44 style='width:33pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
