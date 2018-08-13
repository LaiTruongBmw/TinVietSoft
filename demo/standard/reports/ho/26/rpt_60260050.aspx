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
	string l_dtfrm =Request["p_dt_from"];
	string l_dtto =Request["p_dt_to"];
	string l_lost_by =Request["p_lost_by"];
	string l_parameter="";
     l_parameter = "'" + l_dtfrm + "','" + l_dtto + "','" + l_lost_by + "'";
    DataTable dt = CtlLib.TableReadOpenCursor("rpt_60260050_lost_found", l_parameter);
    if (dt.Rows.Count == 0)
    {
        Response.Write("There is no data");
        Response.End();
    }
	string l_print_date="",l_dtfrm_dtto="";
	string SQL3 = "select to_char(sysdate,'dd-Mon-yyyy hh24:mi') print_date from dual";
    DataTable dt_sysdate = CtlLib.TableReadOpen(SQL3);
    if (dt_sysdate.Rows.Count > 0)
    {
        l_print_date = dt_sysdate.Rows[0][0].ToString();
    }
	l_dtfrm_dtto = "   " + l_dtfrm.Substring(6, 2) + "/" + l_dtfrm.Substring(4, 2) + "/" + l_dtfrm.Substring(0, 4) + "  ~  " + l_dtto.Substring(6, 2) + "/" + l_dtto.Substring(4, 2) + "/" + l_dtto.Substring(0, 4);
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_htfo00230_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_htfo00230_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_htfo00230_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>dieu</o:Author>
  <o:LastAuthor>dieu</o:LastAuthor>
  <o:LastPrinted>2010-12-26T08:46:06Z</o:LastPrinted>
  <o:Created>2010-12-26T07:42:14Z</o:Created>
  <o:LastSaved>2010-12-26T14:00:39Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.2in .04in .39in .04in;
	mso-header-margin:.31in;
	mso-footer-margin:.51in;
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
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl26
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:aqua;
	mso-pattern:auto none;}
.xl27
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#99CC00;
	mso-pattern:auto none;}
.xl28
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:fuchsia;
	mso-pattern:auto none;}
.xl29
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;
	mso-text-control:shrinktofit;}
.xl30
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;}
.xl31
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl32
	{mso-style-parent:style0;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl33
	{mso-style-parent:style0;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl34
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl35
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl36
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#99CC00;
	mso-pattern:auto none;}
.xl37
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CC00;
	mso-pattern:auto none;}
.xl38
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-text-control:shrinktofit;}
.xl39
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl40
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#99CC00;
	mso-pattern:auto none;}
.xl41
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CC00;
	mso-pattern:auto none;}
.xl42
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CC00;
	mso-pattern:auto none;}
.xl43
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:aqua;
	mso-pattern:auto none;}
.xl44
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:fuchsia;
	mso-pattern:auto none;}
.xl45
	{mso-style-parent:style0;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl46
	{mso-style-parent:style0;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl47
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl48
	{mso-style-parent:style0;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl49
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl50
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
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
       <x:ActiveRow>10</x:ActiveRow>
       <x:ActiveCol>14</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>8955</x:WindowHeight>
  <x:WindowWidth>15195</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>30</x:WindowTopY>
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

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1022 style='border-collapse:
 collapse;table-layout:fixed;width:769pt'>
 <col class=xl24 width=45 style='mso-width-source:userset;mso-width-alt:1645;
 width:34pt'>
 <col class=xl24 width=91 style='mso-width-source:userset;mso-width-alt:3328;
 width:68pt'>
 <col class=xl24 width=21 style='mso-width-source:userset;mso-width-alt:768;
 width:16pt'>
 <col class=xl24 width=80 style='mso-width-source:userset;mso-width-alt:2925;
 width:60pt'>
 <col class=xl24 width=25 style='mso-width-source:userset;mso-width-alt:914;
 width:19pt'>
 <col class=xl24 width=64 style='width:48pt'>
 <col class=xl24 width=138 style='mso-width-source:userset;mso-width-alt:4046;
 width:104pt'>
 <col class=xl24 width=48 style='mso-width-source:userset;mso-width-alt:1755;
 width:36pt'>
 <col class=xl24 width=29 style='mso-width-source:userset;mso-width-alt:1060;
 width:22pt'>
 <col class=xl24 width=20 style='mso-width-source:userset;mso-width-alt:731;
 width:15pt'>
 <col class=xl24 width=61 style='mso-width-source:userset;mso-width-alt:2730;
 width:46pt'>
 <col class=xl24 width=26 style='mso-width-source:userset;mso-width-alt:1450;
 width:20pt'>
 <col class=xl24 width=61 style='mso-width-source:userset;mso-width-alt:2230;
 width:46pt'>
 <col class=xl24 width=41 style='mso-width-source:userset;mso-width-alt:1499;
 width:31pt'>
 <col class=xl24 width=61 style='mso-width-source:userset;mso-width-alt:2230;
 width:46pt'>
 <col class=xl24 width=24 style='mso-width-source:userset;mso-width-alt:877;
 width:18pt'>
 <col class=xl24 width=59 style='mso-width-source:userset;mso-width-alt:2157;
 width:44pt'>
 <col class=xl24 width=60 style='mso-width-source:userset;mso-width-alt:2194;
 width:45pt'>
 <col class=xl24 width=68 style='mso-width-source:userset;mso-width-alt:2486;
 width:51pt'>
 <tr height=98 style='mso-height-source:userset;height:73.5pt'>
  <td colspan=2 height=98 class=xl31 width=136 style='height:73.5pt;width:102pt'>AMB
  - VINA</td>
  <td colspan=15 class=xl49 width=758 style='width:571pt'>Lost &amp; Found</td>
  <td colspan=2 height=98 width=128 style='height:73.5pt;width:96pt'
  align=left valign=top><!--[if gte vml 1]><v:shapetype id="_x0000_t75"
   coordsize="21600,21600" o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe"
   filled="f" stroked="f">
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
  </v:shapetype><v:shape id="_x0000_s1025" type="#_x0000_t75" style='position:absolute;
   margin-left:1.5pt;margin-top:0;width:92.25pt;height:72.75pt;z-index:1'>
   <v:imagedata src="rpt_htfo00230_files/image001.png" o:title="image001"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:2px;margin-top:0px;width:123px;
  height:97px'><img width=123 height=97 src="rpt_htfo00230_files/image002.jpg"
  v:shapes="_x0000_s1025"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=2 height=98 class=xl33 width=128 style='height:73.5pt;
    width:96pt'></td>
   </tr>
  </table>
  </span></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 class=xl25 style='height:14.25pt'>Date:</td>
  <td colspan=5 class=xl45><%=l_dtfrm_dtto%></td>
  <td colspan=9 class=xl48>&nbsp;</td>
  <td colspan=2 class=xl47>Print Date:</td>
  <td colspan=2 class=xl46><%=l_print_date%></td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=7 height=22 class=xl43 style='height:16.5pt'>Lost</td>
  <td colspan=6 class=xl40 style='border-right:.5pt solid black;border-left:
  none'>Found</td>
  <td colspan=6 class=xl44 style='border-left:none'>Return</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl26 style='height:16.5pt;border-top:none'>Date:</td>
  <td class=xl26 style='border-top:none;border-left:none'>Article</td>
  <td class=xl26 style='border-top:none;border-left:none'><span
  style='mso-spacerun:yes'> </span>Qty</td>
  <td class=xl26 style='border-top:none;border-left:none'>Lot By</td>
  <td class=xl26 style='border-top:none;border-left:none'>RM</td>
  <td class=xl26 style='border-top:none;border-left:none'>Phone</td>
  <td class=xl26 style='border-top:none;border-left:none'>Address</td>
  <td colspan=2 class=xl36 style='border-right:.5pt solid black;border-left:
  none'>Article</td>
  <td class=xl27 style='border-top:none;border-left:none'>Qty</td>
  <td class=xl27 style='border-top:none;border-left:none'>Lot By</td>
  <td class=xl27 style='border-top:none;border-left:none'>RM</td>
  <td class=xl27 style='border-top:none;border-left:none'>Date</td>
  <td class=xl28 style='border-top:none;border-left:none'>Date</td>
  <td class=xl28 style='border-top:none;border-left:none'>Type</td>
  <td class=xl28 style='border-top:none;border-left:none'><span
  style='mso-spacerun:yes'> </span>Qty</td>
  <td class=xl28 style='border-top:none;border-left:none'>Return To</td>
  <td class=xl28 style='border-top:none;border-left:none'>Phone</td>
  <td class=xl28 style='border-top:none;border-left:none'>Address</td>
 </tr>
  <%
     for (int i = 0; i < dt.Rows.Count; i++)
     {
          %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl29 style='height:12.75pt;border-top:none'><%=dt.Rows[i][0]%></td>
  <td class=xl29 style='border-top:none;border-left:none'><%=dt.Rows[i][1]%></td>
  <td class=xl50 style='border-top:none;border-left:none' x:num><%=dt.Rows[i][2]%></td>
  <td class=xl29 style='border-top:none;border-left:none'><%=dt.Rows[i][3]%></td>
  <td class=xl29 style='border-top:none;border-left:none'><%=dt.Rows[i][4]%></td>
  <td class=xl29 style='border-top:none;border-left:none'><%=dt.Rows[i][5]%></td>
  <td class=xl29 style='border-top:none;border-left:none'><%=dt.Rows[i][6]%></td>
  <td colspan=2 class=xl38 style='border-right:.5pt solid black;border-left:
  none'><%=dt.Rows[i][7]%></td>
  <td class=xl29 align=right style='border-top:none;border-left:none' x:num><%=dt.Rows[i][8]%></td>
  <td class=xl29 style='border-top:none;border-left:none'><%=dt.Rows[i][9]%></td>
  <td class=xl29 style='border-top:none;border-left:none'><%=dt.Rows[i][10]%></td>
  <td class=xl29 style='border-top:none;border-left:none'><%=dt.Rows[i][11]%></td>
  <td class=xl29 style='border-top:none;border-left:none'><%=dt.Rows[i][12]%></td>
  <td class=xl29 style='border-top:none;border-left:none'><%=dt.Rows[i][13]%></td>
  <td class=xl29 align=right style='border-top:none;border-left:none' x:num><%=dt.Rows[i][14]%></td>
  <td class=xl29 style='border-top:none;border-left:none'><%=dt.Rows[i][15]%></td>
  <td class=xl29 style='border-top:none;border-left:none'><%=dt.Rows[i][16]%></td>
  <td class=xl29 style='border-top:none;border-left:none'><%=dt.Rows[i][17]%></td>
 </tr>
  <%
     }
          %>
 <tr height=17 style='height:12.75pt'>
  <td colspan=19 height=17 class=xl32 style='height:12.75pt'>&nbsp;</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=5 height=21 class=xl34 style='height:15.75pt'>Witnesses</td>
  <td colspan=2 class=xl33></td>
  <td colspan=6 class=xl35>Found</td>
  <td colspan=6 class=xl35>Receiver</td>
 </tr>
 <tr height=103 style='mso-height-source:userset;height:77.25pt'>
  <td colspan=5 height=103 class=xl33 style='height:77.25pt'></td>
  <td colspan=2 class=xl33></td>
  <td colspan=6 class=xl33></td>
  <td colspan=6 class=xl33></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=19 class=xl24 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=19 class=xl24 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=12 class=xl24 style='height:12.75pt;mso-ignore:colspan'></td>
  <td class=xl30></td>
  <td colspan=6 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=45 style='width:34pt'></td>
  <td width=91 style='width:68pt'></td>
  <td width=21 style='width:16pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=25 style='width:19pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=138 style='width:104pt'></td>
  <td width=48 style='width:36pt'></td>
  <td width=29 style='width:22pt'></td>
  <td width=20 style='width:15pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=26 style='width:20pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=41 style='width:31pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=24 style='width:18pt'></td>
  <td width=59 style='width:44pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=68 style='width:51pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
