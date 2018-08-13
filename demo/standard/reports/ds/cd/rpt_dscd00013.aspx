<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string date = Request.QueryString["Date"];
    string searchno = Request.QueryString["SearchNo"];
    DataTable dt, dt1, dt2;
    dt = CtlLib.TableReadOpenCursor("SALE.sp_rpt_dscd00010_date", "'" + date + "'");
    dt1 = CtlLib.TableReadOpenCursor("SALE.sp_rpt_dscd00013", "'" + date + "','" + searchno + "'");
    
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_dscd00013_files\rpt_dscd00013_filelist.xml">
<link rel=Edit-Time-Data href="rpt_dscd00013_editdata.mso">
<link rel=OLE-Object-Data href="rpt_dscd00013_oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Nguyen Thanh Xuan</o:LastAuthor>
  <o:LastPrinted>2011-08-04T07:52:04Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2011-08-04T07:53:06Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
 <o:OfficeDocumentSettings>
  <o:DoNotOrganizeInFolder/>
 </o:OfficeDocumentSettings>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"&C&P\/&N";
	margin:.75in .75in .75in .75in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-page-orientation:landscape;}
.font11
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font15
	{color:windowtext;
	font-size:20.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font17
	{color:windowtext;
	font-size:20.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style43
	{mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	mso-style-name:Comma;
	mso-style-id:3;}
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
.style56
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
	font-family:돋움, monospace;
	mso-font-charset:129;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal_Sheet1;}
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
.xl66
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl67
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl68
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl69
	{mso-style-parent:style56;
	color:black;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl70
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl71
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl72
	{mso-style-parent:style56;
	color:black;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl73
	{mso-style-parent:style56;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
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
.xl74
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl75
	{mso-style-parent:style56;
	color:black;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl76
	{mso-style-parent:style56;
	color:black;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:normal;}
.xl78
	{mso-style-parent:style56;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl79
	{mso-style-parent:style56;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"dd\\-mmm";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";}
.xl81
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl82
	{mso-style-parent:style56;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl83
	{mso-style-parent:style56;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl84
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl85
	{mso-style-parent:style43;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl89
	{mso-style-parent:style56;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:silver gray-0625;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:silver gray-0625;
	white-space:normal;}
.xl94
	{mso-style-parent:style56;
	color:green;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl95
	{mso-style-parent:style56;
	color:green;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:none;}
.xl96
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl97
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl98
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
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl99
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
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl100
	{mso-style-parent:style56;
	color:black;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl101
	{mso-style-parent:style56;
	color:green;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:none;}
.xl102
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;}
-->
</style>
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
      <x:Scale>66</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>11</x:ActiveRow>
       <x:ActiveCol>4</x:ActiveCol>
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
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$1:$9</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1398 style='border-collapse:
 collapse;table-layout:fixed;width:1049pt'>
 <col width=64 style='width:48pt'>
 <col width=91 style='mso-width-source:userset;mso-width-alt:3328;width:68pt'>
 <col width=89 style='mso-width-source:userset;mso-width-alt:3254;width:67pt'>
 <col width=203 style='mso-width-source:userset;mso-width-alt:7424;width:152pt'>
 <col width=93 style='mso-width-source:userset;mso-width-alt:3401;width:70pt'>
 <col width=104 span=2 style='mso-width-source:userset;mso-width-alt:3803;
 width:78pt'>
 <col width=74 style='mso-width-source:userset;mso-width-alt:2706;width:56pt'>
 <col width=64 span=9 style='width:48pt'>
 <tr class=xl68 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=2 rowspan=3 height=72 width=155 style='border-bottom:2.0pt double black;
  height:54.0pt;width:116pt' align=left valign=top><!--[if gte vml 1]><v:shapetype
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
  </v:shapetype><v:shape id="Picture_x0020_1" o:spid="_x0000_s1026" type="#_x0000_t75"
   alt="logo" style='position:absolute;margin-left:20.25pt;margin-top:3pt;
   width:78pt;height:42pt;z-index:1;visibility:visible'>
   <v:imagedata src="rpt_dscd00013_files\rpt_dscd00013_image001.jpg" o:title="logo"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:27px;margin-top:4px;width:104px;
  height:56px'><img width=104 height=56 src="rpt_dscd00013_files\rpt_dscd00013_image002.jpg"
  alt=logo v:shapes="Picture_x0020_1"></span><![endif]><span style='mso-ignore:
  vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=2 rowspan=3 height=72 class=xl94 width=155 style='border-bottom:
    2.0pt double black;height:54.0pt;width:116pt'></td>
   </tr>
  </table>
  </span></td>
  <td colspan=2 class=xl102 width=292 style='width:219pt'>VINA GENUWIN</td>
  <td class=xl67 width=93 style='width:70pt'></td>
  <td class=xl67 width=104 style='width:78pt'></td>
  <td class=xl67 width=104 style='width:78pt'></td>
  <td class=xl68 width=74 style='width:56pt'></td>
  <td class=xl68 width=64 style='width:48pt'></td>
  <td class=xl68 width=64 style='width:48pt'></td>
  <td class=xl68 width=64 style='width:48pt'></td>
  <td class=xl69 width=64 style='width:48pt'></td>
  <td class=xl69 width=64 style='width:48pt'></td>
  <td class=xl69 width=64 style='width:48pt'></td>
  <td class=xl68 width=64 style='width:48pt'></td>
  <td class=xl66 colspan=2 width=128 style='mso-ignore:colspan;width:96pt'>Tel:
  (0613) 560 850</td>
 </tr>
 <tr class=xl68 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=2 height=24 class=xl102 style='height:18.0pt'>364 Cộng hòa, Q.
  Tân Bình, Tp.HCM</td>
  <td colspan=3 class=xl67 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl68 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl69 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl66 colspan=2 style='mso-ignore:colspan'>Fax: (0613) 560 851</td>
 </tr>
 <tr class=xl68 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl101 style='height:18.0pt'>&nbsp;</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 colspan=17 style='height:13.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=34 style='height:25.5pt'>
  <td colspan=17 height=34 class=xl96 style='height:25.5pt'>KẾ HOẠCH GIAO HÀNG<font
  class="font15">/</font><font class="font17">GOODS DELIVERY PLAN</font></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=4 class=xl68 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=13 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl81 colspan=3 style='height:12.75pt;mso-ignore:colspan'>From
  date: <%=dt.Rows[0][10] %></td>
  <td class=xl68></td>
  <td colspan=10 style='mso-ignore:colspan'></td>
  <td class=xl83 colspan=3 style='mso-ignore:colspan'>Print date: <%=dt.Rows[0][11] %></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=17 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl74 height=31 style='mso-height-source:userset;height:23.25pt'>
  <td height=31 class=xl78 width=64 style='height:23.25pt;width:48pt'>STT<br>
    <font class="font11">No</font></td>
  <td class=xl73 width=91 style='width:68pt'>Mã đơn hàng<br>
    <font class="font11">SO No</font></td>
  <td class=xl73 width=89 style='width:67pt'>Mã hàng<br>
    <font class="font11">Item code</font></td>
  <td class=xl73 width=203 style='width:152pt'>Tên hàng<br>
    <font class="font11">Item Description</font></td>
  <td class=xl73 width=93 style='width:70pt'>SL đặt hàng<br>
    <font class="font11">Order Q'ty</font></td>
  <td class=xl73 width=104 style='width:78pt'>SL theo kế hoạch<br>
    <font class="font11">Plan Q'ty</font></td>
  <td class=xl73 width=104 style='width:78pt'>SL còn lại<br>
    <font class="font11">Balance Q'ty</font></td>
  <td class=xl79 width=74 style='width:56pt' ><%=dt.Rows[0][0]%></td>
  <td class=xl79 width=64 style='width:48pt' ><%=dt.Rows[0][1]%></td>
  <td class=xl79 width=64 style='width:48pt' ><%=dt.Rows[0][2]%></td>
  <td class=xl79 width=64 style='width:48pt' ><%=dt.Rows[0][3]%></td>
  <td class=xl79 width=64 style='width:48pt' ><%=dt.Rows[0][4]%></td>
  <td class=xl79 width=64 style='width:48pt' ><%=dt.Rows[0][5]%></td>
  <td class=xl79 width=64 style='width:48pt' ><%=dt.Rows[0][6]%></td>
  <td class=xl79 width=64 style='width:48pt' ><%=dt.Rows[0][7]%></td>
  <td class=xl79 width=64 style='width:48pt' ><%=dt.Rows[0][8]%></td>
  <td class=xl79 width=64 style='width:48pt' ><%=dt.Rows[0][9]%></td>
 </tr>
 <%
     double a = 0;
     double a1 = 0;
     double a2 = 0;
     double a3 = 0;
     double a4 = 0;
     double a5 = 0;
     double a6 = 0;
     double a7 = 0;
     double a8 = 0;
     double a9 = 0;
     double a10 = 0;
     double a11 = 0;
     double a12 = 0;
     for (int i = 0; i < dt1.Rows.Count; i++)
     {
         a = a + CommondLib.ConvertToDbl(dt1.Rows[i]["ord_qty"]);
         a1 = a1 + CommondLib.ConvertToDbl(dt1.Rows[i]["plan_qty"]);
         a2 = a2 + CommondLib.ConvertToDbl(dt1.Rows[i]["bal_qty"]);
         a3 = a3 + CommondLib.ConvertToDbl(dt1.Rows[i]["day01"]);
         a4 = a4 + CommondLib.ConvertToDbl(dt1.Rows[i]["day02"]);
         a5 = a5 + CommondLib.ConvertToDbl(dt1.Rows[i]["day03"]);
         a6 = a6 + CommondLib.ConvertToDbl(dt1.Rows[i]["day04"]);
         a7 = a7 + CommondLib.ConvertToDbl(dt1.Rows[i]["day05"]);
         a8 = a8 + CommondLib.ConvertToDbl(dt1.Rows[i]["day06"]);
         a9 = a9 + CommondLib.ConvertToDbl(dt1.Rows[i]["day07"]);
         a10 = a10 + CommondLib.ConvertToDbl(dt1.Rows[i]["day08"]);
         a11 = a11 + CommondLib.ConvertToDbl(dt1.Rows[i]["day09"]);
         a12 = a12 + CommondLib.ConvertToDbl(dt1.Rows[i]["day10"]);
         
         %>
<tr class=xl74 height=39 style='mso-height-source:userset;height:29.25pt'>
  <td height=39 class=xl75 width=64 style='height:29.25pt;width:48pt' x:num><%=i+1 %></td>
  <td class=xl100 width=91 style='width:68pt'><%=dt1.Rows[i]["so_item_no"]%></td>
  <td class=xl76 width=89 style='width:67pt'><%=dt1.Rows[i]["item_code"]%></td>
  <td class=xl82 width=203 style='width:152pt'><%=dt1.Rows[i]["item_name"]%></td>
  <td class=xl92 align=right width=93 style='width:70pt' x:num><%=dt1.Rows[i]["ord_qty"]%></td>
  <td class=xl93 align=right width=104 style='width:78pt' x:num><%=dt1.Rows[i]["plan_qty"]%></td>
  <td class=xl92 align=right width=104 style='width:78pt' x:num><%=dt1.Rows[i]["bal_qty"]%></td>
  <td class=xl87 width=74 style='width:56pt' x:num><%=dt1.Rows[i]["day01"]%></td>
  <td class=xl87 width=64 style='width:48pt' x:num><%=dt1.Rows[i]["day02"]%></td>
  <td class=xl87 width=64 style='width:48pt' x:num><%=dt1.Rows[i]["day03"]%></td>
  <td class=xl87 width=64 style='width:48pt' x:num><%=dt1.Rows[i]["day04"]%></td>
  <td class=xl87 width=64 style='width:48pt' x:num><%=dt1.Rows[i]["day05"]%></td>
  <td class=xl87 width=64 style='width:48pt' x:num><%=dt1.Rows[i]["day06"]%></td>
  <td class=xl87 width=64 style='width:48pt' x:num><%=dt1.Rows[i]["day07"]%></td>
  <td class=xl87 width=64 style='width:48pt' x:num><%=dt1.Rows[i]["day08"]%></td>
  <td class=xl87 width=64 style='width:48pt' x:num><%=dt1.Rows[i]["day09"]%></td>
  <td class=xl87 width=64 style='width:48pt' x:num><%=dt1.Rows[i]["day10"]%></td>
 </tr>
         <%
          
     }
      %>
 
 
 <tr class=xl77 height=39 style='mso-height-source:userset;height:29.25pt'>
  <td colspan=4 height=39 class=xl98 width=447 style='height:29.25pt;
  width:335pt'>Total</td>
  <td class=xl84 align=right width=93 style='border-top:none;width:70pt' x:num><%=a %></td>
  <td class=xl90 align=right width=104 style='border-top:none;border-left:none;
  width:78pt' x:num><%=a1 %></td>
  <td class=xl91 width=104 style='border-top:none;border-left:none;width:78pt'
  x:num><%=a2 %></td>
  <td class=xl85 width=74 style='border-top:none;border-left:none;width:56pt'x:num><%=a3 %></td>
  <td class=xl85 width=64 style='border-top:none;border-left:none;width:48pt'x:num><%=a4 %></td>
  <td class=xl85 width=64 style='border-top:none;border-left:none;width:48pt'x:num><%=a5 %></td>
  <td class=xl85 width=64 style='border-top:none;border-left:none;width:48pt'x:num><%=a6 %></td>
  <td class=xl85 width=64 style='border-top:none;border-left:none;width:48pt'x:num><%=a7 %></td>
  <td class=xl85 width=64 style='border-top:none;border-left:none;width:48pt'x:num><%=a8 %></td>
  <td class=xl85 width=64 style='border-top:none;border-left:none;width:48pt'x:num><%=a9 %></td>
  <td class=xl85 width=64 style='border-top:none;border-left:none;width:48pt'x:num><%=a10 %></td>
  <td class=xl85 width=64 style='border-top:none;border-left:none;width:48pt'x:num><%=a11 %></td>
  <td class=xl85 width=64 style='border-top:none;border-left:none;width:48pt'x:num><%=a12 %></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=64 style='width:48pt'></td>
  <td width=91 style='width:68pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=203 style='width:152pt'></td>
  <td width=93 style='width:70pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=74 style='width:56pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
