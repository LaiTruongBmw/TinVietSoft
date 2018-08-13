<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8";
    Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<% 
    string master_pk = Request.QueryString["master_pk"];
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_dscd00030_DW_04_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dscd00030_DW_04_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dscd00030_DW_04_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>tuyen</o:LastAuthor>
  <o:LastPrinted>2010-12-29T10:23:43Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2010-12-29T10:25:47Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .75in 1.0in .75in;
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
.style21
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
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:"Style 1";}
.style22
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
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:"표준_TAE-KWONG P\.O STATUS-0516";}
.style23
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	border:none;
	mso-protection:locked visible;
	mso-style-name:"표준_수주현황\(2002년진행분\)2";}
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
.xl27
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl28
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";}
.xl29
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl30
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl31
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl32
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl33
	{mso-style-parent:style0;
	color:#333399;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";}
.xl34
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl35
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl36
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";
	text-align:left;}
.xl37
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:left;}
.xl38
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl39
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";}
.xl40
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;}
.xl41
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl42
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl43
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl44
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl45
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl46
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl47
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl48
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl49
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl50
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl51
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl52
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl53
	{mso-style-parent:style23;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl54
	{mso-style-parent:style23;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl55
	{mso-style-parent:style23;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl56
	{mso-style-parent:style23;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl57
	{mso-style-parent:style21;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0_\)\;\[Red\]\\\(0\\\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl58
	{mso-style-parent:style22;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl59
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl60
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl61
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl62
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0_\)\;\[Red\]\\\(0\\\)";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl63
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl64
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";
	text-align:center;}
.xl65
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";}
.xl66
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl67
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl68
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl69
	{mso-style-parent:style0;
	font-size:26.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl70
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl72
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl73
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl74
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl75
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl76
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl77
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
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
      <x:Scale>55</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:LeftColumnVisible>4</x:LeftColumnVisible>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>20</x:ActiveRow>
       <x:ActiveCol>12</x:ActiveCol>
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
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1026"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl27>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1685 style='border-collapse:
 collapse;table-layout:fixed;width:1265pt'>
 <col class=xl27 width=44 style='mso-width-source:userset;mso-width-alt:1609;
 width:33pt'>
 <col class=xl27 width=138 style='mso-width-source:userset;mso-width-alt:5046;
 width:104pt'>
 <col class=xl27 width=158 style='mso-width-source:userset;mso-width-alt:5778;
 width:119pt'>
 <col class=xl27 width=191 style='mso-width-source:userset;mso-width-alt:6985;
 width:143pt'>
 <col class=xl27 width=119 span=2 style='mso-width-source:userset;mso-width-alt:
 4352;width:89pt'>
 <col class=xl27 width=149 style='mso-width-source:userset;mso-width-alt:5449;
 width:112pt'>
 <col class=xl27 width=75 style='mso-width-source:userset;mso-width-alt:2742;
 width:56pt'>
 <col class=xl27 width=63 style='mso-width-source:userset;mso-width-alt:2304;
 width:47pt'>
 <col class=xl28 width=86 style='mso-width-source:userset;mso-width-alt:3145;
 width:65pt'>
 <col class=xl27 width=96 style='mso-width-source:userset;mso-width-alt:3510;
 width:72pt'>
 <col class=xl27 width=118 style='mso-width-source:userset;mso-width-alt:4315;
 width:89pt'>
 <col class=xl27 width=115 style='mso-width-source:userset;mso-width-alt:4205;
 width:86pt'>
 <col class=xl29 width=214 style='mso-width-source:userset;mso-width-alt:7826;
 width:161pt'>
 <%
        DataTable dt1 = CtlLib.TableReadOpenCursor("sale.sp_rpt_dscd00030_4", "'" + master_pk + "'");
        DataTable dt;
        dt = CtlLib.TableReadOpenCursor("sale.sp_rpt_dscd00030", "'" + master_pk + "'");  
 %> 
 <tr height=44 style='height:33.0pt'>
  <td height=44 class=xl27 width=44 style='height:33.0pt;width:33pt'></td>
  <td width=138 style='width:104pt' align=left valign=top><!--[if gte vml 1]><v:shapetype
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
  </v:shapetype><v:shape id="Picture_x0020_1" o:spid="_x0000_s1025" type="#_x0000_t75"
   alt="logo" style='position:absolute;margin-left:30pt;margin-top:6.75pt;
   width:74.25pt;height:31.5pt;z-index:1;visibility:visible'>
   <v:imagedata src="rpt_dscd00030_DW_04_files/image001.png" o:title="logo"/>
   <x:ClientData ObjectType="Pict">   
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:40px;margin-top:9px;width:99px;
  height:42px'><img width=99 height=42
  src="rpt_dscd00030_DW_04_files/image002.jpg" alt=logo v:shapes="Picture_x0020_1"></span><![endif]><span
  style='mso-ignore:vglayout2'><table cellpadding=0 cellspacing=0>
   <tr>
    <td height=44 class=xl27 width=138 style='height:33.0pt;width:104pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl27 width=158 style='width:119pt'></td>
  <td colspan=11 class=xl69 width=1345 style='width:1009pt'>PHIẾU XUẤT KHO</td>
 </tr>
 <tr height=44 style='height:33.0pt'>
  <td height=44 class=xl27 style='height:33.0pt'></td>
  <td class=xl30 colspan=2 style='mso-ignore:colspan'>DAEWON CHEMICAL VINA</td>
  <td colspan=11 class=xl69>DELIVERY VOUCHER</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl27 style='height:12.75pt'></td>
  <td class=xl31 colspan=2 style='mso-ignore:colspan'>KCN Long Thành, Huyện
  Long Thành, Đồng Nai.</td>
  <td colspan=6 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl28></td>
  <td colspan=3 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl27 style='height:12.75pt'></td>
  <td class=xl31 colspan=2 style='mso-ignore:colspan'>ĐT: 061 3 514270<span
  style='mso-spacerun:yes'> &nbsp; </span>Fax: 061 3 514271.</td>
  <td colspan=6 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl28 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl27 style='height:14.25pt'></td>
  <td class=xl32></td>
  <td colspan=7 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl33></td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl27 style='height:12.75pt'></td>
  <td class=xl32></td>
  <td colspan=7 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl28></td>
  <td colspan=3 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl34 colspan=3 style='height:15.0pt;mso-ignore:colspan'>Tên
  khách hàng(Customer name):</td>
  <td class=xl34 colspan=2 style='mso-ignore:colspan'><%= dt.Rows[0]["supplier_name"]%></td>
  <td colspan=3 class=xl34 style='mso-ignore:colspan'></td>
  <td class=xl35></td>
  <td class=xl28></td>
  <td class=xl36>Số(Ref. No.) :</td>
  <td class=xl37><%= dt.Rows[0]["slip_no"]%></td>
  <td class=xl36></td>
  <td class=xl29></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl34 colspan=2 style='height:21.0pt;mso-ignore:colspan'>Địa
  chỉ( Address):</td>
  <td colspan=7 class=xl70 width=874 style='width:655pt'><%= dt.Rows[0]["ADDR1"]%><span
  style='mso-spacerun:yes'> &nbsp;</span></td>
  <td class=xl28></td>
  <td class=xl39>Ngày( Date)</td>
  <td class=xl40 ><%= dt.Rows[0]["dd"]+ "/"+ dt.Rows[0]["mm"]+ "/" + dt.Rows[0]["yyyy"] %></td>
  <td class=xl39></td>
  <td class=xl29></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl34 colspan=2 style='height:21.0pt;mso-ignore:colspan'>Diển
  giải:</td>
  <td class=xl35>Da Thành Phẩm</td>
  <td colspan=6 class=xl35 style='mso-ignore:colspan'></td>
  <td class=xl39></td>
  <td colspan=3 class=xl35 style='mso-ignore:colspan'></td>
  <td class=xl41></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl42 style='height:15.75pt'>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl43>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl35></td>
  <td class=xl41></td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td rowspan=2 height=58 class=xl80 width=44 style='border-bottom:1.0pt solid black;
  height:43.5pt;border-top:none;width:33pt'>No.</td>
  <td rowspan=2 class=xl79 width=138 style='border-bottom:1.0pt solid black;
  border-top:none;width:104pt'>Item code</td>
  <td rowspan=2 class=xl77 width=158 style='border-bottom:1.0pt solid black;
  border-top:none;width:119pt'>Order no</td>
  <td colspan=4 class=xl72 style='border-left:none'>Goods description</td>
  <td class=xl45>Order</td>
  <td class=xl45>Delivery</td>
  <td class=xl45>Đơn vị</td>
  <td class=xl46 width=96 style='width:72pt'>PACKING</td>
  <td rowspan=2 class=xl77 width=118 style='border-bottom:1.0pt solid black;
  border-top:none;width:89pt'>Style No.</td>
  <td rowspan=2 class=xl82 width=115 style='border-bottom:1.0pt solid black;
  width:86pt'>Line</td>
  <td rowspan=2 class=xl80 width=214 style='border-bottom:1.0pt solid black;
  width:161pt'>Stock No</td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl44 style='height:21.75pt'>Item</td>
  <td class=xl47>Patten/Embo</td>
  <td class=xl47 style='border-left:none'>Spec</td>
  <td class=xl48>Color</td>
  <td class=xl49>Q'ty</td>
  <td class=xl49>Q'ty</td>
  <td class=xl49>UNIT</td>
  <td class=xl50 width=96 style='width:72pt'>( ROLL)</td>
 </tr>
  <%
            decimal l_outqty = 0;
            decimal l_packing = 0;
            string  l_order_type ="";
            for (int i = 0; i < dt1.Rows.Count; i++)
            {                
            
 %> 
    
 <tr class=xl51 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl52 style='height:21.75pt' x:num><%=i+1%></td>
  <td class=xl53 ><%=dt1.Rows[i]["cus_item_code"]%></td>
  <td class=xl53 ><%=dt1.Rows[i]["so_item_no"]%></td>
  <td class=xl54><%=dt1.Rows[i]["item_name"]%></td>
  <td class=xl55><%=dt1.Rows[i]["embo"]%></td>
  <td class=xl55 style='border-left:none'><%=dt1.Rows[i]["spec"]%></td>
  <td class=xl56><%=dt1.Rows[i]["color"]%></td>
  <td class=xl57 x:num><%=dt1.Rows[i]["ORD_QTY"]%></td>
  <td class=xl57 x:num><%=dt1.Rows[i]["deli_qty"]%></td>
  <td class=xl58 width=86 style='width:65pt'><%=dt1.Rows[i]["out_uom"]%></td>
  <td class=xl59 x:num><%=dt1.Rows[i]["packing"]%></td>
  <td class=xl59><%=dt1.Rows[i]["style_num"]%></td>
  <td class=xl59><%=dt1.Rows[i]["line"]%></td>
  <td class=xl59><%=dt1.Rows[i]["stock_num"]%></td>
 </tr>
 <%
  
    if( i != 0 && l_order_type != dt1.Rows[i]["order_type"].ToString() )
    {
      %>
      <tr height=29 style='mso-height-source:userset;height:21.75pt'>
          <td height=29 class=xl60 style='height:21.75pt'>TOTA<span style='display:
          none'>L</span></td>
          <td class=xl61>&nbsp;</td>
          <td colspan=5 class=xl74 style='border-right:.5pt solid black;border-left:
          none'>&nbsp;</td>
          <td class=xl62 x:num></td>
          <td class=xl62 x:num><%=l_outqty %></td>
          <td class=xl62><u style='visibility:hidden;mso-ignore:visibility'>&nbsp;</u></td>
          <td class=xl62 x:num><%=l_packing %></td>
          <td class=xl62><u style='visibility:hidden;mso-ignore:visibility'>&nbsp;</u></td>
          <td class=xl62><u style='visibility:hidden;mso-ignore:visibility'>&nbsp;</u></td>
          <td class=xl63>&nbsp;</td>
     </tr>
      <%
     l_outqty = Convert.ToDecimal(dt1.Rows[i]["deli_qty"].ToString());   
     l_packing = Convert.ToDecimal(dt1.Rows[i]["packing"].ToString());   
      
    }else
    {
     l_outqty += Convert.ToDecimal(dt1.Rows[i]["deli_qty"].ToString());   
     l_packing  += Convert.ToDecimal(dt1.Rows[i]["packing"].ToString());   
    }
     l_order_type = dt1.Rows[i]["order_type"].ToString();
    }
 %>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl60 style='height:21.75pt'>TOTA<span style='display:
  none'>L</span></td>
  <td class=xl61>&nbsp;</td>
  <td colspan=5 class=xl74 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
  <td class=xl62 x:num></td>
  <td class=xl62 x:num><%=l_outqty %> </td>
  <td class=xl62><u style='visibility:hidden;mso-ignore:visibility'>&nbsp;</u></td>
  <td class=xl62 x:num><%=l_packing %></td>
  <td class=xl62><u style='visibility:hidden;mso-ignore:visibility'>&nbsp;</u></td>
  <td class=xl62><u style='visibility:hidden;mso-ignore:visibility'>&nbsp;</u></td>
  <td class=xl63>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=8 height=20 class=xl76 style='height:15.0pt'>Remark:<%= dt.Rows[0]["DESCRIPTION"]%></td>
  <td class=xl41></td>
  <td class=xl64></td>
  <td colspan=4 class=xl41 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl38 height=21 style='height:15.75pt'>
  <td height=21 class=xl38 style='height:15.75pt'></td>
  <td class=xl67></td>
  <td colspan=7 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl65></td>
  <td colspan=3 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl66></td>
 </tr>
 <tr class=xl38 height=21 style='height:15.75pt'>
  <td height=21 class=xl38 style='height:15.75pt'></td>
  <td class=xl68>Giám đốc/ Manager</td>
  <td class=xl68></td>
  <td colspan=6 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl65></td>
  <td class=xl68 colspan=2 style='mso-ignore:colspan'>Security/Bảo vệ</td>
  <td colspan=2 class=xl68 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl38 height=21 style='height:15.75pt'>
  <td height=21 class=xl68 style='height:15.75pt'></td>
  <td colspan=2 class=xl38 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl68 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl65></td>
  <td colspan=3 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl66></td>
 </tr>
 <tr class=xl38 height=0 style='display:none'>
  <td height=0 colspan=9 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl65></td>
  <td colspan=3 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl66></td>
 </tr>
 <tr class=xl38 height=21 style='height:15.75pt'>
  <td height=21 colspan=9 class=xl38 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl65></td>
  <td colspan=3 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl66></td>
 </tr>
 <tr class=xl38 height=21 style='height:15.75pt'>
  <td height=21 colspan=9 class=xl38 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl65></td>
  <td colspan=3 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl66></td>
 </tr>
 <tr class=xl38 height=0 style='display:none'>
  <td height=0 colspan=9 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl65></td>
  <td colspan=3 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl66></td>
 </tr>
 <tr class=xl38 height=0 style='display:none'>
  <td height=0 colspan=9 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl65></td>
  <td colspan=3 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl66></td>
 </tr>
 <tr height=0 style='display:none'>
  <td height=0 colspan=9 class=xl27 style="mso-ignore:colspan; height: 15px;"></td>
  <td class=xl28 style="height: 15px"></td>
  <td colspan=3 class=xl27 style="mso-ignore:colspan; height: 15px;"></td>
  <td class=xl29 style="height: 15px"></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=9 class=xl27 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl28></td>
  <td class=xl68 colspan=2 style='mso-ignore:colspan'>Bên vận chuyển/
  Transporter</td>
  <td colspan=2 class=xl68 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=9 class=xl35 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl39></td>
  <td class=xl38 colspan=2 style='mso-ignore:colspan'>Số Xe/Truck No.:</td>
  <td colspan=2 class=xl38 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl38 height=21 style='height:15.75pt'>
  <td height=21 class=xl38 style='height:15.75pt'>*</td>
  <td class=xl67 colspan=3 style='mso-ignore:colspan'>Đại diện khách hàng/
  Customer's representative</td>
  <td colspan=3 class=xl67 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl65></td>
  <td colspan=3 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl66></td>
 </tr>
 <tr class=xl38 height=21 style='height:15.75pt'>
  <td height=21 class=xl38 style='height:15.75pt'></td>
  <td class=xl68 colspan=2 style='mso-ignore:colspan'>Thủ kho/ w/h keeper</td>
  <td colspan=3 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl68>Giám đốc/ Manager</td>
  <td colspan=2 class=xl38 style='mso-ignore:colspan'></td>
  <td class=xl65></td>
  <td colspan=3 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl66></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=9 class=xl35 style='height:15.0pt;mso-ignore:colspan'></td>
  <td class=xl39></td>
  <td colspan=3 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl41></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=9 class=xl35 style='height:15.0pt;mso-ignore:colspan'></td>
  <td class=xl39></td>
  <td colspan=3 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl41></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=44 style='width:33pt'></td>
  <td width=138 style='width:104pt'></td>
  <td width=158 style='width:119pt'></td>
  <td width=191 style='width:143pt'></td>
  <td width=119 style='width:89pt'></td>
  <td width=119 style='width:89pt'></td>
  <td width=149 style='width:112pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=63 style='width:47pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=96 style='width:72pt'></td>
  <td width=118 style='width:89pt'></td>
  <td width=115 style='width:86pt'></td>
  <td width=214 style='width:161pt'></td>
 </tr>
 <![endif]></table>

</body>

</html>
