<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  ESysLib.SetUser("sale");
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string p_from_date = Request.QueryString["p_from_date"];
    string p_to_date = Request.QueryString["p_to_date"];
    string p_po_vendor = Request.QueryString["p_po_vendor"];
    string p_item = Request.QueryString["p_item"];
    string p_searchtype = Request.QueryString["p_searchtype"];
    string p_curr = Request.QueryString["p_curr"];
    string p_io_type= Request.QueryString["p_io_type"];
    string p_date_yn = Request.QueryString["p_date_yn"];
    string p_sale_yn = Request.QueryString["p_sale_yn"];

    string para = "'" + p_from_date + "','" + p_to_date + "','" + p_po_vendor + "','" + p_item + "','" + p_searchtype + "','" + p_curr + "','" + p_io_type + "','" + p_date_yn + "','" + p_sale_yn + "'";
    DataTable dt, dt1;
    dt = ESysLib.TableReadOpenCursor("lg_rpt_dscd00030_5", "'" + p_from_date + "','" + p_to_date + "'");
    dt1 = ESysLib.TableReadOpenCursor("lg_rpt_dscd00030_6",para);

%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=uft-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_dscd00030_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dscd00030_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dscd00030_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Mr Khanh</o:Author>
  <o:LastAuthor>Trung</o:LastAuthor>
  <o:LastPrinted>2011-11-17T03:29:26Z</o:LastPrinted>
  <o:Created>2007-01-10T03:24:47Z</o:Created>
  <o:LastSaved>2011-11-17T03:36:47Z</o:LastSaved>
  <o:Company>VINAGENUWIN</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"Page &P";
	margin:.33in .21in .28in .2in;
	mso-header-margin:.23in;
	mso-footer-margin:.23in;
	mso-page-orientation:landscape;}
.font5
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font6
	{color:windowtext;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font8
	{color:windowtext;
	font-size:8.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font10
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font15
	{color:windowtext;
	font-size:16.0pt;
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
.style17
	{mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	mso-style-name:"Comma \[0\]";
	mso-style-id:6;}
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
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl25
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl26
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;}
.xl29
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl30
	{mso-style-parent:style0;
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
.xl31
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl37
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl39
	{mso-style-parent:style17;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl41
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl42
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl43
	{mso-style-parent:style17;
	color:red;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl44
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl45
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl46
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl47
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl48
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl49
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl50
	{mso-style-parent:style0;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl51
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl52
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl53
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"0_\)\;\\\(0\\\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl54
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"0_\)\;\\\(0\\\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl55
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"0_\)\;\\\(0\\\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>GD Checking</x:Name>
    <x:WorksheetOptions>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:Scale>60</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>12</x:ActiveRow>
       <x:ActiveCol>5</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>9180</x:WindowHeight>
  <x:WindowWidth>15480</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>1980</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Area</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>='GD Checking'!$A$1:$Q$57</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>='GD Checking'!$7:$7</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="6145"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="5"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl32>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1602 style='border-collapse:
 collapse;table-layout:fixed;width:1204pt'>
 <col class=xl32 width=120 style='mso-width-source:userset;mso-width-alt:4388;
 width:90pt'>
 <col class=xl32 width=75 style='mso-width-source:userset;mso-width-alt:2742;
 width:56pt'>
 <col class=xl32 width=85 span=2 style='mso-width-source:userset;mso-width-alt:
 3108;width:64pt'>
 <col class=xl32 width=47 style='mso-width-source:userset;mso-width-alt:1718;
 width:35pt'>
 <col class=xl32 width=100 style='mso-width-source:userset;mso-width-alt:3657;
 width:75pt'>
 <col class=xl32 width=200 style='mso-width-source:userset;mso-width-alt:7314;
 width:150pt'>
 <col class=xl32 width=50 style='mso-width-source:userset;mso-width-alt:1828;
 width:38pt'>
 <col class=xl32 width=87 style='mso-width-source:userset;mso-width-alt:3181;
 width:65pt'>
 <col class=xl32 width=99 style='mso-width-source:userset;mso-width-alt:3620;
 width:74pt'>
 <col class=xl32 width=90 span=3 style='mso-width-source:userset;mso-width-alt:
 3291;width:68pt'>
 <col class=xl32 width=50 style='mso-width-source:userset;mso-width-alt:1828;
 width:38pt'>
 <col class=xl32 width=90 style='mso-width-source:userset;mso-width-alt:3291;
 width:68pt'>
 <col class=xl32 width=100 style='mso-width-source:userset;mso-width-alt:3657;
 width:75pt'>
 <col class=xl32 width=80 style='mso-width-source:userset;mso-width-alt:2925;
 width:60pt'>
 <col class=xl32 width=64 style='width:48pt'>
 <tr class=xl25 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 width=120 style='height:15.0pt;width:90pt' align=left
  valign=top><!--[if gte vml 1]><v:shapetype id="_x0000_t75" coordsize="21600,21600"
   o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe" filled="f"
   stroked="f">
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
  </v:shapetype><v:shape id="_x0000_s5122" type="#_x0000_t75" style='position:absolute;
   margin-left:11.25pt;margin-top:1.5pt;width:78pt;height:42pt;z-index:1'>
   <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt.Rows[0]["tco_bpphoto_pk"]%>&table_name=tco_bpphoto" o:title="img00001"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:15px;margin-top:2px;width:104px;
  height:56px'><img width=104 height=56 src="rpt_dscd00030_files/image002.jpg"
  v:shapes="_x0000_s5122"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=20 class=xl26 width=120 style='height:15.0pt;width:90pt'><a
    name="Print_Area"></a></td>
   </tr>
  </table>
  </span></td>
  <td class=xl27 colspan=2 width=160 style='mso-ignore:colspan;width:120pt'><%=dt.Rows[0]["partner_name"]%></td>
  <td class=xl27 width=85 style='width:64pt'></td>
  <td class=xl27 width=47 style='width:35pt'></td>
  <td class=xl27 width=100 style='width:75pt'></td>
  <td class=xl27 width=200 style='width:150pt'></td>
  <td class=xl27 width=50 style='width:38pt'></td>
  <td class=xl27 width=87 style='width:65pt'></td>
  <td class=xl27 width=99 style='width:74pt'></td>
  <td class=xl46 width=90 style='width:68pt'></td>
  <td class=xl27 width=90 style='width:68pt'></td>
  <td class=xl27 width=90 style='width:68pt'></td>
  <td class=xl24 width=50 style='width:38pt'></td>
  <td class=xl24 width=90 style='width:68pt'></td>
  <td class=xl24 width=100 style='width:75pt'></td>
  <td class=xl28 width=80 style='width:60pt'>Tel: <%=dt.Rows[0]["phone_no"]%></td>
  <td class=xl25 width=64 style='width:48pt'></td>
 </tr>
 <tr class=xl25 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl26 style='height:15.0pt'></td>
  <td class=xl24 colspan=7 style='mso-ignore:colspan'><%=dt.Rows[0]["addr1"]%></td>
  <td colspan=5 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl28>Fax: <%=dt.Rows[0]["fax_no"]%></td>
  <td class=xl25></td>
 </tr>
 <tr class=xl25 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl36 style='height:15.0pt'>&nbsp;</td>
  <td class=xl47 colspan=2 style='mso-ignore:colspan'>Tax No: <%=dt.Rows[0]["tax_code"]%></td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl50>Print Date: <%= DateTime.Now.ToString("dd/MM/yyyy HH:mm") %></td>
  <td class=xl25></td>
 </tr>
 <tr class=xl24 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=17 rowspan=2 height=42 class=xl52 style='height:31.5pt'>KI&#7874;M
  KÊ HÀNG XU&#7844;T <font class="font15">(GOODS DELIEVRY CHECKING)</font></td>
  <td class=xl29></td>
 </tr>
 <tr class=xl24 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 class=xl29 style='height:15.75pt'></td>
 </tr>
 <tr class=xl24 height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=18 height=35 class=xl51 style='height:26.25pt'><%=dt.Rows[0]["from_date"] %> ~ <%=dt.Rows[0]["to_date"] %></td>
 </tr>
 <tr class=xl44 height=46 style='mso-height-source:userset;height:34.5pt'>
  <td height=46 class=xl30 width=120 style='height:34.5pt;width:90pt'>Khách
  hàng<font class="font6"><br>
    </font><font class="font8">Customer</font></td>
  <td class=xl30 width=75 style='border-left:none;width:56pt'>Ngày xu&#7845;t<font
  class="font6"><br>
    </font><font class="font8">Deli Date</font></td>
  <td class=xl30 width=85 style='border-left:none;width:64pt'>S&#7889;
  phi&#7871;u<br>
    <font class="font8">Slip No</font></td>
  <td class=xl30 width=85 style='border-left:none;width:64pt'>S&#7889;
  &#272;&#7889;i chi&#7871;u<br>
    <font class="font8">Ref No</font></td>
  <td class=xl30 width=47 style='border-left:none;width:35pt'>Seq</td>
  <td class=xl30 width=100 style='border-left:none;width:75pt'>Mã hàng<br>
    <font class="font8">Item code</font></td>
  <td class=xl30 width=200 style='border-left:none;width:150pt'>Tên hàng<br>
    <font class="font8">Item Name</font></td>
  <td class=xl30 width=50 style='border-left:none;width:38pt'>&#272;VT<br>
    <font class="font8">UOM</font></td>
  <td class=xl30 width=87 style='border-left:none;width:65pt'>S&#7889;
  l&#432;&#7907;ng<br>
    <font class="font8">Deli Qty</font></td>
  <td class=xl30 width=99 style='border-left:none;width:74pt'>&#272;&#417;n
  giá<br>
    <font class="font8">U/Price</font></td>
  <td class=xl30 width=90 style='border-left:none;width:68pt'>Thành
  ti&#7873;n<br>
    <font class="font8">Amount</font></td>
  <td class=xl30 width=90 style='border-left:none;width:68pt'>Thu&#7871;<br>
    <font class="font8">Tax Amount</font></td>
  <td class=xl30 width=90 style='border-left:none;width:68pt'>T&#7893;ng
  ti&#7873;n<br>
    <font class="font8">Total Amount</font></td>
  <td class=xl30 width=50 style='border-left:none;width:38pt'>Ti&#7873;n
  t&#7879;<font class="font6"><br>
    </font><font class="font8">CCY</font></td>
  <td class=xl30 width=90 style='border-left:none;width:68pt'>Ti&#7873;n quy
  &#273;&#7893;i<br>
    <font class="font8"><%=p_curr%> Amt</font></td>
  <td class=xl30 width=100 style='border-left:none;width:75pt'>W/H<font
  class="font6"><br>
    </font><font class="font8">Remark</font></td>
  <td class=xl30 width=80 style='border-left:none;width:60pt'>Ghi chú<br>
    <font class="font8">Remark</font></td>
  <td class=xl44></td>
 </tr>
<%
     double total1 = 0, total2 = 0, total3 = 0, total4 = 0, total5 = 0;
     for (int i = 0; i < dt1.Rows.Count; i++)
     {
         total1 = total1 + CommondLib.ConvertToDbl(dt1.Rows[i]["out_qty"]);
         total2 = total2 + CommondLib.ConvertToDbl(dt1.Rows[i]["item_amount"]);
         total3 = total3 + CommondLib.ConvertToDbl(dt1.Rows[i]["vat_amount"]);
         total4 = total4 + CommondLib.ConvertToDbl(dt1.Rows[i]["total_amount"]);
         total5 = total5 + CommondLib.ConvertToDbl(dt1.Rows[i]["sel_amt"]);
          %>
<tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl33 width=120 style='height:21.75pt;width:90pt'><%=dt1.Rows[i]["partner_name"]%></td>
  <td class=xl34 width=75 style='border-left:none;width:56pt'><%=dt1.Rows[i]["out_date"]%></td>
  <td class=xl34 width=85 style='border-left:none;width:64pt'><%=dt1.Rows[i]["slip_no"]%></td>
  <td class=xl45 width=85 style='border-left:none;width:64pt' ><%=dt1.Rows[i]["ref_no"]%></td>
  <td class=xl34 width=47 style='border-left:none;width:35pt' x:num><%=dt1.Rows[i]["seq"]%></td>
  <td class=xl37 width=100 style='border-left:none;width:75pt' ><%=dt1.Rows[i]["item_code"]%></td>
  <td class=xl38 width=200 style='border-left:none;width:150pt' ><%=dt1.Rows[i]["item_name"]%></td>
  <td class=xl34 width=50 style='border-left:none;width:38pt' ><%=dt1.Rows[i]["uom"]%></td>
  <td class=xl42 width=87 style='border-left:none;width:65pt' x:num><%=dt1.Rows[i]["out_qty"]%></td>
  <td class=xl39 width=99 style='border-left:none;width:74pt' x:num><%=dt1.Rows[i]["unit_price"]%></td>
  <td class=xl39 width=90 style='border-left:none;width:68pt' x:num><%=dt1.Rows[i]["item_amount"]%></td>
  <td class=xl39 width=90 style='border-left:none;width:68pt' x:num><%=dt1.Rows[i]["vat_amount"]%></td>
  <td class=xl39 width=90 style='border-left:none;width:68pt' x:num><%=dt1.Rows[i]["total_amount"]%></td>
  <td class=xl34 width=50 style='border-left:none;width:38pt'><%=dt1.Rows[i]["tr_ccy"]%></td>
  <td class=xl43 width=90 style='border-left:none;width:68pt' x:num><%=dt1.Rows[i]["sel_amt"]%></td>
  <td class=xl34 width=100 style='border-left:none;width:75pt'><%=dt1.Rows[i]["wh_id"]%></td>
  <td class=xl33 width=80 style='border-left:none;width:60pt'><%=dt1.Rows[i]["description"]%></td>
  <td class=xl32></td>
 </tr>
          <%
     }
     
  %>
 
 
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=8 height=29 class=xl53 width=762 style='border-right:.5pt solid black;
  height:21.75pt;width:572pt'>T&#7893;ng c&#7897;ng<font class="font5"> </font><font
  class="font10">Total</font></td>
  <td class=xl40 width=87 style='border-top:none;border-left:none;width:65pt'x:num><%=total1 %></td>
  <td class=xl41 width=99 style='border-top:none;width:74pt'>&nbsp;</td>
  <td class=xl40 width=90 style='border-top:none;border-left:none;width:68pt'x:num><%=total2 %></td>
  <td class=xl40 width=90 style='border-top:none;border-left:none;width:68pt'x:num><%=total3 %></td>
  <td class=xl40 width=90 style='border-top:none;border-left:none;width:68pt'x:num><%=total4 %></td>
  <td class=xl31 width=50 style='border-top:none;border-left:none;width:38pt'>&nbsp;</td>
  <td class=xl35 width=90 style='border-top:none;border-left:none;width:68pt'x:num><%=total5 %></td>
  <td class=xl31 width=100 style='border-top:none;border-left:none;width:75pt'>&nbsp;</td>
  <td class=xl31 width=80 style='border-top:none;border-left:none;width:60pt'>&nbsp;</td>
  <td class=xl32></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=18 class=xl32 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=18 class=xl32 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=18 class=xl32 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=18 class=xl32 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=18 class=xl32 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=14 class=xl32 style='height:12.75pt;mso-ignore:colspan'></td>
  <td rowspan=2 height=34 class=xl32 width=90 style='mso-ignore:colspan-rowspan;
  height:25.5pt;width:68pt'><!--[if gte vml 1]><v:shapetype id="_x0000_t201"
   coordsize="21600,21600" o:spt="201" path="m,l,21600r21600,l21600,xe">
   <v:stroke joinstyle="miter"/>
   <v:path shadowok="f" o:extrusionok="f" strokeok="f" fillok="f"
    o:connecttype="rect"/>
   <o:lock v:ext="edit" shapetype="t"/>
  </v:shapetype><v:shape id="_x0000_s5123" type="#_x0000_t201" style='position:absolute;
   margin-left:18.75pt;margin-top:8.25pt;width:6pt;height:6pt;z-index:2;
   mso-wrap-style:tight' filled="f" fillcolor="window [65]" stroked="f"
   strokecolor="windowText [64]" o:insetmode="auto">
   <o:lock v:ext="edit" rotation="t"/>
   <v:textbox style='mso-direction-alt:auto' o:singleclick="f">
    <![if excel]>
    <div><font class="font6">Label 3</font></div>
    <![endif]></v:textbox>
   <![if excel]><x:ClientData ObjectType="Label">
    <x:AutoFill>False</x:AutoFill>
    <x:AutoLine>False</x:AutoLine>
   </x:ClientData>
   <![endif]></v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td width=25 height=11></td>
   </tr>
   <tr>
    <td></td>
    <td><![endif]><![if !excel]><img width=9 height=9
    src="rpt_dscd00030_files/image003.gif" alt="Label 3" v:shapes="_x0000_s5123"
    class=shape v:dpi="96"><![endif]><![if !vml]></td>
    <td width=56></td>
   </tr>
   <tr>
    <td height=14></td>
   </tr>
  </table>
  </span><![endif]><!--[if !mso & vml]><span style='width:67.5pt;height:25.5pt'></span><![endif]--></td>
  <td colspan=3 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=14 class=xl32 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=3 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=120 style='width:90pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=85 style='width:64pt'></td>
  <td width=85 style='width:64pt'></td>
  <td width=47 style='width:35pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=200 style='width:150pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=90 style='width:68pt'></td>
  <td width=90 style='width:68pt'></td>
  <td width=90 style='width:68pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=90 style='width:68pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
