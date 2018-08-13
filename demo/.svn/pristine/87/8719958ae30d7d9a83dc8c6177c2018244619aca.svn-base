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
    string p_date_type = Request.QueryString["p_date_type"];
    string p_from_dt = Request.QueryString["p_from_dt"];
    string p_to_dt = Request.QueryString["p_to_dt"];
    string p_slip_cust = Request.QueryString["p_slip_cust"];

     string para = " '" + p_date_type + "','" + p_from_dt + "','" + p_to_dt + "','" + p_slip_cust + "'";
     DataTable dt,dt1;
     dt = CtlLib.TableReadOpenCursor("st_lg__rpt_dscd00040");
     dt1 = CtlLib.TableReadOpenCursor("st_lg__rpt_dscd00040_2", para);
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="August%202011__files/filelist.xml">
<link rel=Edit-Time-Data href="August%202011__files/editdata.mso">
<link rel=OLE-Object-Data href="August%202011__files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>User</o:Author>
  <o:LastAuthor>Mr Khanh</o:LastAuthor>
  <o:LastPrinted>2011-09-06T07:43:22Z</o:LastPrinted>
  <o:Created>2011-07-23T04:00:50Z</o:Created>
  <o:LastSaved>2011-09-06T07:48:12Z</o:LastSaved>
  <o:Company>HOME</o:Company>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"&CPage &P of &N";
	margin:0in .15in .4in .15in;
	mso-header-margin:0in;
	mso-footer-margin:0in;
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
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-family:"\.VnTime", sans-serif;
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style0;
	font-size:11.0pt;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-size:11.0pt;
	mso-number-format:Standard;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl30
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;}
.xl31
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl32
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl33
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl34
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	border:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl35
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	border:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl36
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl37
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl38
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>PO Balance</x:Name>
    <x:WorksheetOptions>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>8</x:ActiveRow>
       <x:ActiveCol>2</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
    <x:Sorting>
     <x:Sort>CUSTOMER</x:Sort>
    </x:Sorting>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>8700</x:WindowHeight>
  <x:WindowWidth>11355</x:WindowWidth>
  <x:WindowTopX>465</x:WindowTopX>
  <x:WindowTopY>-60</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>='PO Balance'!$2:$3</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1032 style='border-collapse:
 collapse;table-layout:fixed;width:776pt'>
 <col width=354 style='mso-width-source:userset;mso-width-alt:12946;width:266pt'>
 <col width=113 span=6 style='mso-width-source:userset;mso-width-alt:4132;
 width:85pt'>
 <tr height=64 style='mso-height-source:userset;height:48.0pt'>
  <td colspan=7 height=64 class=xl37 width=1032 style='height:48.0pt;
  width:776pt'>
  <!--[if gte vml 1]><v:shape
   id="_x0000_s1025" style='position:absolute;margin-left:6pt;margin-top:3.75pt;
   width:81pt;height:37.5pt;z-index:1;visibility:visible' coordsize="21600,21600"
   o:spt="100" o:preferrelative="t" adj="0,,0" path="m@4@5l@4@11@9@11@9@5xe"
   filled="f" stroked="f">
   <v:stroke joinstyle="miter"/>
   <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt.Rows[0]["tco_bpphoto_pk"]%>&table_name=tco_bpphoto" o:title="img00001"/>
   <v:formulas/>
   <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/>
   <o:lock v:ext="edit" aspectratio="t"/>
   <x:ClientData ObjectType="Pict">
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]-->
  P/O BALANCE <%=System.DateTime.ParseExact(p_from_dt, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%> ~ <%=System.DateTime.ParseExact(p_to_dt, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td rowspan=2 height=48 class=xl38 style='height:36.0pt'>CUSTOMER</td>
  <td colspan=3 class=xl36 style='border-left:none'>QUANTITY</td>
  <td colspan=3 class=xl36 style='border-left:none'>AMOUNT (USD)</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl33 style='height:18.0pt;border-top:none;border-left:
  none'>ZIPPER (M)</td>
  <td class=xl33 style='border-top:none;border-left:none'>SLIDER (PCS)</td>
  <td class=xl33 style='border-top:none;border-left:none'>O/E &amp; C/E (SET)</td>
  <td class=xl33 style='border-top:none;border-left:none'>ZIPPER</td>
  <td class=xl33 style='border-top:none;border-left:none' x:str="SLIDER ">SLIDER<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl33 style='border-top:none;border-left:none' x:str="O/E &amp; C/E ">O/E
  &amp; C/E<span style='mso-spacerun:yes'> </span></td>
 </tr>
 <%
     for (int i = 0; i < dt1.Rows.Count; i++)
     {
      %>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl28 style='height:18.0pt;border-top:none'><%= dt1.Rows[i]["partner_name"]%></td>
  <td class=xl29 align=right style='border-top:none;border-left:none'
  x:num><%= dt1.Rows[i]["m_qty"]%></td>
  <td class=xl29 align=right style='border-top:none;border-left:none'
  x:num><%= dt1.Rows[i]["pcs_qty"]%></td>
  <td class=xl29 style='border-top:none;border-left:none' x:num><%= dt1.Rows[i]["set_qty"]%></td>
  <td class=xl31 align=right style='border-top:none;border-left:none'
  x:num><%= dt1.Rows[i]["m_amt"]%></td>
  <td class=xl31 align=right style='border-top:none;border-left:none'
  x:num><%= dt1.Rows[i]["pcs_amt"]%></td>
  <td class=xl31 style='border-top:none;border-left:none' x:num ><%= dt1.Rows[i]["set_amt"]%></td>
 </tr>
 <%} %>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl32 style='height:18.0pt;border-top:none'>TOTAL:</td>
  <td class=xl34 align=right style='border-top:none;border-left:none'
  x:num x:fmla="=<%if(dt1.Rows.Count==0){ %>SUM(B6:B6)<%}else{ %>SUM(B4:B<%= dt1.Rows.Count+3 %>)<%} %>"></td>
  <td class=xl34 align=right style='border-top:none;border-left:none'
  x:num x:fmla="=<%if(dt1.Rows.Count==0){ %>SUM(C6:C6)<%}else{ %>SUM(C4:C<%= dt1.Rows.Count+3 %>)<%} %>"></td>
  <td class=xl34 align=right style='border-top:none;border-left:none' x:num x:fmla="=<%if(dt1.Rows.Count==0){ %>SUM(D6:D6)<%}else{ %>SUM(D4:D<%= dt1.Rows.Count+3 %>)<%} %>"></td>
  <td class=xl35 align=right style='border-top:none;border-left:none'
  x:num x:fmla="=<%if(dt1.Rows.Count==0){ %>SUM(E6:E6)<%}else{ %>SUM(E4:E<%= dt1.Rows.Count+3 %>)<%} %>"></td>
  <td class=xl35 align=right style='border-top:none;border-left:none'
  x:num x:fmla="=<%if(dt1.Rows.Count==0){ %>SUM(F6:F6)<%}else{ %>SUM(F4:F<%= dt1.Rows.Count+3 %>)<%} %>"></td>
  <td class=xl35 align=right style='border-top:none;border-left:none' x:num x:fmla="=<%if(dt1.Rows.Count==0){ %>SUM(G6:G6)<%}else{ %>SUM(G4:G<%= dt1.Rows.Count+3 %>)<%} %>"></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 style='height:21.0pt'></td>
  <td colspan=2 class=xl26 style='mso-ignore:colspan'></td>
  <td></td>
  <td colspan=3 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.45pt'>
  <td height=19 colspan=7 class=xl25 style='height:14.45pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.45pt'>
  <td height=19 colspan=7 class=xl25 style='height:14.45pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.45pt'>
  <td height=19 colspan=7 class=xl25 style='height:14.45pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.45pt'>
  <td height=19 colspan=7 class=xl25 style='height:14.45pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.45pt'>
  <td height=19 colspan=7 class=xl25 style='height:14.45pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.45pt'>
  <td height=19 colspan=7 class=xl25 style='height:14.45pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.45pt'>
  <td height=19 colspan=7 class=xl25 style='height:14.45pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.45pt'>
  <td height=19 colspan=7 class=xl25 style='height:14.45pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.45pt'>
  <td height=19 colspan=7 class=xl25 style='height:14.45pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.45pt'>
  <td height=19 colspan=7 class=xl25 style='height:14.45pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.45pt'>
  <td height=19 colspan=7 class=xl25 style='height:14.45pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.45pt'>
  <td height=19 colspan=7 class=xl25 style='height:14.45pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.45pt'>
  <td height=19 colspan=7 class=xl25 style='height:14.45pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=7 class=xl24 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=354 style='width:266pt'></td>
  <td width=113 style='width:85pt'></td>
  <td width=113 style='width:85pt'></td>
  <td width=113 style='width:85pt'></td>
  <td width=113 style='width:85pt'></td>
  <td width=113 style='width:85pt'></td>
  <td width=113 style='width:85pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
