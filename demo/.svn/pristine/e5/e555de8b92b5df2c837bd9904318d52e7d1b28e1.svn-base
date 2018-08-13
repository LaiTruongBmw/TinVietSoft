<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%
     CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
	string l_dt_frm="",l_dt_departure="",l_parameter="";
	l_dt_frm =Request["p_dt_frm"];
	l_dt_departure =Request["p_dt_departure"];
	l_parameter = "'" + l_dt_frm + "','" + l_dt_departure + "'";
    DataTable dt = CtlLib.TableReadOpenCursor("ht_rpt_60300020_rpt", l_parameter);
    if (dt.Rows.Count == 0)
    {
        Response.Write("There is no data");
        Response.End();
    }
	string l_print_date="";
    string SQL3 = "select to_char(sysdate,'dd-mm-yyyy hh24:mi') print_date from dual";
    DataTable dt_sysdate = CtlLib.TableReadOpen(SQL3);
    if (dt_sysdate.Rows.Count > 0)
    {
        l_print_date = dt_sysdate.Rows[0][0].ToString();
    }
    String l_arrival_depart="";
	l_arrival_depart = "   " + l_dt_frm.Substring(6, 2) + "/" + l_dt_frm.Substring(4, 2) + "/" + l_dt_frm.Substring(0, 4) + "  ~  " + l_dt_departure.Substring(6, 2) + "/" + l_dt_departure.Substring(4, 2) + "/" + l_dt_departure.Substring(0, 4);
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="htfo00020_files/filelist.xml">
<link rel=Edit-Time-Data href="htfo00020_files/editdata.mso">
<link rel=OLE-Object-Data href="htfo00020_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>PCVINA002</o:Author>
  <o:LastAuthor>PCVINA002</o:LastAuthor>
  <o:LastPrinted>2010-12-05T03:40:31Z</o:LastPrinted>
  <o:Created>2010-12-05T02:51:03Z</o:Created>
  <o:LastSaved>2010-12-05T05:13:38Z</o:LastSaved>
  <o:Company>VINA</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.5in .5in .5in .5in;
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
	padding:0px;
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
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl26
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl30
	{mso-style-parent:style0;
	font-size:7.0pt;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl31
	{mso-style-parent:style0;
	font-size:7.0pt;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl32
	{mso-style-parent:style0;
	font-size:7.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl33
	{mso-style-parent:style0;
	font-size:7.0pt;
	mso-number-format:"Short Date";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl34
	{mso-style-parent:style0;
	font-size:7.0pt;
	mso-number-format:"\#\,\#\#0";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl35
	{mso-style-parent:style0;
	font-size:7.0pt;
	mso-number-format:"\#\,\#\#0\.0";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl36
	{mso-style-parent:style0;
	font-size:7.0pt;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl37
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl38
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl39
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
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
       <x:ActiveRow>6</x:ActiveRow>
       <x:ActiveCol>15</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>9000</x:WindowHeight>
  <x:WindowWidth>15360</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>0</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=929 style='border-collapse:
 collapse;table-layout:fixed;width:699pt'>
 <col width=100 style='mso-width-source:userset;mso-width-alt:3657;width:75pt'>
 <col width=36 style='mso-width-source:userset;mso-width-alt:1316;width:27pt'>
 <col width=53 span=2 style='mso-width-source:userset;mso-width-alt:1938;
 width:40pt'>
 <col width=48 style='mso-width-source:userset;mso-width-alt:1755;width:36pt'>
 <col width=33 style='mso-width-source:userset;mso-width-alt:1206;width:25pt'>
 <col width=39 style='mso-width-source:userset;mso-width-alt:1426;width:29pt'>
 <col width=75 style='mso-width-source:userset;mso-width-alt:2742;width:56pt'>
 <col width=73 style='mso-width-source:userset;mso-width-alt:2669;width:55pt'>
 <col width=55 style='mso-width-source:userset;mso-width-alt:2011;width:41pt'>
 <col width=87 style='mso-width-source:userset;mso-width-alt:3181;width:65pt'>
 <col width=46 style='mso-width-source:userset;mso-width-alt:1682;width:35pt'>
 <col width=45 style='mso-width-source:userset;mso-width-alt:1645;width:34pt'>
 <col width=46 style='mso-width-source:userset;mso-width-alt:1682;width:35pt'>
 <col width=42 style='mso-width-source:userset;mso-width-alt:1536;width:32pt'>
 <col width=98 style='mso-width-source:userset;mso-width-alt:3584;width:74pt'>
 <tr height=70 style='mso-height-source:userset;height:52.5pt'>
  <td height=70 class=xl25 width=100 style='height:52.5pt;width:75pt'></td>
  <td colspan=14 class=xl39 width=731 style='width:550pt'
  x:str=" DEPARTURE  GUEST  LIST "><span
  style='mso-spacerun:yes'> </span>DEPARTURE<span style='mso-spacerun:yes'> 
  </span>GUEST<span style='mso-spacerun:yes'>  </span>LIST<span
  style='mso-spacerun:yes'> </span></td>
  <td width=98 style='width:74pt' align=left valign=top><!--[if gte vml 1]><v:shapetype
   id="_x0000_t75" coordsize="21600,21600" o:spt="75" o:preferrelative="t"
   path="m@4@5l@4@11@9@11@9@5xe" filled="f" stroked="f">
   <v:stroke joinstyle="miter"/>
   <v:formulas>
    <v:f eqn="if lineDrawn pixelLineWidth 0"/>
    <v:f eqn="sum @0 1 0"/>
    <v:f eqn="sum 0 0 @1"/>
    <v:f eqn="prod @2 1 2"/>
    <v:f eqn="prod @3 21600 pixelWidth"/>
    <v:f eqn="prod @3 21600 pixelHeight"/>
    <v:f eqn="sum @0 0 1"/>
    <v:f eqn="prod @6 1 2"/>
    <v:f eqn="prod @7 21600 pixelWidth"/>
    <v:f eqn="sum @8 21600 0"/>
    <v:f eqn="prod @7 21600 pixelHeight"/>
    <v:f eqn="sum @10 21600 0"/>
   </v:formulas>
   <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/>
   <o:lock v:ext="edit" aspectratio="t"/>
  </v:shapetype><v:shape id="_x0000_s1027" type="#_x0000_t75" style='position:absolute;
   margin-left:0;margin-top:1.5pt;width:73.5pt;height:50.25pt;z-index:1'>
   <v:imagedata src="htfo00020_files/image001.png" o:title="image001"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:0px;margin-top:2px;width:98px;
  height:67px'><img width=98 height=67 src="htfo00020_files/image002.jpg"
  v:shapes="_x0000_s1027"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=70 class=xl24 width=98 style='height:52.5pt;width:74pt'></td>
   </tr>
  </table>
  </span></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl25 style='height:15.0pt'><b>Total:</b></td>
  <td colspan=3 class=xl26 x:num><%=dt.Rows.Count%> Guest</td>
  <td colspan=9 class=xl37><b>Date:</b><%=l_arrival_depart%></td>
  <td colspan=2 class=xl38>Print Date :</td>
  <td class=xl27><%=l_print_date%></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl28 style='height:12.75pt'>Guest Name</td>
  <td class=xl29>Gender</td>
  <td class=xl29>Arrival</td>
  <td class=xl29>Departure</td>
  <td class=xl29 style='border-top:none'>Days</td>
  <td class=xl29 style='border-top:none'>Rate</td>
  <td class=xl29 style='border-top:none'>Room#</td>
  <td class=xl29 style='border-top:none'>Room Type</td>
  <td class=xl29 style='border-top:none'>Contact Name</td>
  <td class=xl29 style='border-top:none'>Phone</td>
  <td class=xl29 style='border-top:none'>Email</td>
  <td class=xl29 style='border-top:none'>Adult(M)</td>
  <td class=xl29 style='border-top:none'>Adult(F)</td>
  <td class=xl29 style='border-top:none'>Child(M)</td>
  <td class=xl29 style='border-top:none'>Child(F)</td>
  <td class=xl29>Request</td>
 </tr>
 <%
     for (int i = 0; i < dt.Rows.Count; i++)
     {
          %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl30 style='height:12.75pt'><%=dt.Rows[i][3]%></td>
  <td class=xl31><%=dt.Rows[i][4]%></td>
  <td class=xl32><%=dt.Rows[i][6]%></td>
  <td class=xl33><%=dt.Rows[i][7]%></td>
  <td class=xl34 align=right x:num><%=dt.Rows[i][8]%></td>
  <td class=xl35 align=right x:num><%=dt.Rows[i][9]%></td>
  <td class=xl32 x:num><%=dt.Rows[i][10]%></td>
  <td class=xl36><%=dt.Rows[i][11]%></td>
  <td class=xl31><%=dt.Rows[i][12]%></td>
  <td class=xl32 x:num><%=dt.Rows[i][13]%></td>
  <td class=xl36><%=dt.Rows[i][14]%></td>
  <td class=xl31 align=right x:num><%=dt.Rows[i][15]%></td>
  <td class=xl31 align=right x:num><%=dt.Rows[i][16]%></td>
  <td class=xl31 align=right x:num><%=dt.Rows[i][17]%></td>
  <td class=xl31 align=right x:num><%=dt.Rows[i][18]%></td>
  <td class=xl36><%=dt.Rows[i][21]%></td>
 </tr>
 <%}%>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=100 style='width:75pt'></td>
  <td width=36 style='width:27pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=48 style='width:36pt'></td>
  <td width=33 style='width:25pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=46 style='width:35pt'></td>
  <td width=45 style='width:34pt'></td>
  <td width=46 style='width:35pt'></td>
  <td width=42 style='width:32pt'></td>
  <td width=98 style='width:74pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
