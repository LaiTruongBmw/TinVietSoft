<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8";
    Response.Buffer = false;
%>
<html 
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<% 
    string master_pk = Request.QueryString["master_pk"];
    string print_time = Request.QueryString["print_time"];
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_dscd00030_ST_DW_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dscd00030_ST_DW_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dscd00030_ST_DW_files/oledata.mso">
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
  <o:LastPrinted>2011-03-19T07:57:03Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2011-03-21T02:15:38Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .22in 1.0in .52in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;}
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
	color:#333399;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";}
.xl29
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl30
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl31
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl32
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";}
.xl33
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;}
.xl34
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl35
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";
	text-align:left;}
.xl36
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:left;}
.xl37
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl38
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl39
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;}
.xl40
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl41
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	white-space:normal;}
.xl42
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl43
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl44
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl45
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl46
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl47
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl48
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl49
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl50
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl51
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl52
	{mso-style-parent:style23;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl53
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
.xl54
	{mso-style-parent:style23;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl55
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Fixed;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl56
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
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
	{mso-style-parent:style22;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl60
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl61
	{mso-style-parent:style23;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl62
	{mso-style-parent:style23;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl63
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl64
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl65
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl66
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl67
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl68
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
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl69
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl70
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl71
	{mso-style-parent:style0;
	font-size:26.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl72
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl76
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl77
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl78
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl79
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:none;}
.xl80
	{mso-style-parent:style0;
	font-size:8.0pt;
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
	font-size:8.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl83
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;}
.xl84
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl85
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl86
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl87
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
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
      <x:Scale>75</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>5</x:ActiveRow>
       <x:ActiveCol>11</x:ActiveCol>
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
 <o:shapedefaults v:ext="edit" spidmax="1028" u1:ext="edit"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl27>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1423 style='border-collapse:
 collapse;table-layout:fixed;width:1067pt'>
 <col class=xl27 width=31 style='mso-width-source:userset;mso-width-alt:1133;
 width:23pt'>
 <col class=xl27 width=93 style='mso-width-source:userset;mso-width-alt:3401;
 width:70pt'>
 <col class=xl27 width=151 style='mso-width-source:userset;mso-width-alt:5522;
 width:113pt'>
 <col class=xl27 width=60 style='mso-width-source:userset;mso-width-alt:2194;
 width:45pt'>
 <col class=xl27 width=64 style='width:48pt'>
 <col class=xl27 width=131 style='mso-width-source:userset;mso-width-alt:4790;
 width:98pt'>
 <col class=xl27 width=59 style='mso-width-source:userset;mso-width-alt:2157;
 width:44pt'>
 <col class=xl27 width=54 style='mso-width-source:userset;mso-width-alt:1974;
 width:41pt'>
 <col class=xl27 width=57 style='mso-width-source:userset;mso-width-alt:2084;
 width:43pt'>
 <col class=xl27 width=43 style='mso-width-source:userset;mso-width-alt:1572;
 width:32pt'>
 <col class=xl27 width=61 style='mso-width-source:userset;mso-width-alt:2230;
 width:46pt'>
 <col class=xl27 width=107 style='mso-width-source:userset;mso-width-alt:3913;
 width:80pt'>
 <col class=xl27 width=64 span=8 style='width:48pt'>
   <%
        DataTable dt1 = CtlLib.TableReadOpenCursor("sale.sp_rpt_dscd00070_st", "'" + master_pk + "'");
        DataTable dt;
        dt = CtlLib.TableReadOpenCursor("sale.sp_rpt_dscd00070_stm", "'" + master_pk + "','"+print_time+"'");  
 %>
 <tr height=44 style='mso-height-source:userset;height:33.0pt'>
  <td height=44 class=xl27 width=31 style='height:33.0pt;width:23pt'></td>
  <td width=93 style='width:70pt' align=left valign=top><u3:shapetype id="_x0000_t75" coordsize="21600,21600" o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe" filled="f" stroked="f"><u3:stroke joinstyle="miter"/><u3:formulas><u3:f eqn="if lineDrawn pixelLineWidth 0"/><u3:f eqn="sum @0 1 0"/><u3:f eqn="sum 0 0 @1"/><u3:f eqn="prod @2 1 2"/><u3:f eqn="prod @3 21600 pixelWidth"/><u3:f eqn="prod @3 21600 pixelHeight"/><u3:f eqn="sum @0 0 1"/><u3:f eqn="prod @6 1 2"/><u3:f eqn="prod @7 21600 pixelWidth"/><u3:f eqn="sum @8 21600 0"/><u3:f eqn="prod @7 21600 pixelHeight"/><u3:f eqn="sum @10 21600 0"/></u3:formulas><u3:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/><o:lock u3:ext="edit" aspectratio="t"/></u3:shapetype><u3:shape id="Picture_x0020_1" o:spid="_x0000_s1025" type="#_x0000_t75" alt="logo" style="position:absolute;margin-left:30pt;margin-top:6.75pt;&#13;&#10;   width:66.75pt;height:29.25pt;z-index:1;visibility:visible"><u3:imagedata src="rpt_dscd00030_DW_files/image001.png" o:title="logo"/><x:ClientData ObjectType="Pict"><x:CF></x:ClientData></u3:shape><!--[if gte vml 1]><v:shapetype
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
  </v:shapetype><v:shape id="_x0000_s1027" type="#_x0000_t75" alt="logo"
   style='position:absolute;margin-left:3.75pt;margin-top:0;width:66.75pt;
   height:29.25pt;z-index:1'>
   <v:imagedata src="http://localhost/esys/reports/ds/cd/rpt_dscd00030_DW_files/image002.jpg"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
   <x:AutoPict/>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:5px;margin-top:0px;width:89px;
  height:39px'><img width=89 height=39
  src="http://localhost/esys/reports/ds/cd/rpt_dscd00030_DW_files/image002.jpg"
  alt=logo v:shapes="_x0000_s1027"></span><![endif]><span style='mso-ignore:
  vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=44 class=xl27 width=93 style='height:33.0pt;width:70pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl27 width=151 style='width:113pt'></td>
  <td colspan=6 class=xl71 width=425 style='width:319pt'>PHIẾU XUẤT KHO</td>
  <td class=xl28 colspan=3 width=211 style='mso-ignore:colspan;width:158pt'>Mẫu
  số (Model No): 03XKNB</td>
  <td class=xl27 width=64 style='width:48pt'></td>
  <td class=xl27 width=64 style='width:48pt'></td>
  <td class=xl28 width=64 style='width:48pt'></td>
  <td class=xl27 width=64 style='width:48pt'></td>
  <td class=xl27 width=64 style='width:48pt'></td>
  <td class=xl27 width=64 style='width:48pt'></td>
  <td class=xl27 width=64 style='width:48pt'></td>
  <td class=xl27 width=64 style='width:48pt'></td>
 </tr>
 <tr height=44 style='mso-height-source:userset;height:33.0pt'>
  <td height=44 class=xl27 style='height:33.0pt'></td>
  <td class=xl29 colspan=2 style='mso-ignore:colspan'>Công ty TNHH DAEWON
  CHEMICAL VINA</td>
  <td colspan=6 class=xl71>DELIVERY VOUCHER</td>
  <td class=xl28 colspan=3 style='mso-ignore:colspan'>Ký hiệu (Sign):DX/<%= dt.Rows[0]["cur_yy"]%>T</td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl28></td>
  <td colspan=5 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl27 style='height:27.75pt'></td>
  <td class=xl30 colspan=3 style='mso-ignore:colspan'>KCN Long Thành, Huyện
  Long Thành, Đồng Nai.</td>
  <td class=xl27></td>
  <td class=xl32>Ngày( Date)</td>
  <td class=xl33 colspan=2 style='mso-ignore:colspan'><%= dt.Rows[0]["dd"]+ "/"+ dt.Rows[0]["mm"]+ "/" + dt.Rows[0]["yyyy"] %></td>
  <td class=xl34></td>
  <td class=xl28 colspan=3 style='mso-ignore:colspan'>Số (No): <%= dt.Rows[0]["print_time"]%></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl28></td>
  <td colspan=5 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl27 style='height:27.75pt'></td>
  <td class=xl30 colspan=2 style='mso-ignore:colspan'>ĐT: 061 3 514270<span
  style='mso-spacerun:yes'>   </span>Fax: 061 3 514271.</td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl35>Số(Ref. No.) :</td>
  <td class=xl36 colspan=2 style='mso-ignore:colspan'><%= dt.Rows[0]["slip_no"]%></td>
  <td class=xl34></td>
  <td colspan=5 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl37></td>
  <td colspan=5 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl27 style='height:27.75pt'></td>
  <td class=xl30></td>
  <td colspan=12 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl37></td>
  <td colspan=5 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl38 colspan=3 style='height:27.75pt;mso-ignore:colspan'>Tên
  khách hàng(Customer<span style='mso-spacerun:yes'>  </span>name):</td>
  <td class=xl38 colspan=3 style='mso-ignore:colspan'><%= dt.Rows[0]["supplier_name"]%></td>
  <td colspan=3 class=xl38 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl31 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl39></td>
  <td colspan=5 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl38 colspan=2 style='height:27.75pt;mso-ignore:colspan'>Địa
  chỉ( Address):</td>
  <td class=xl27></td>
  <td colspan=6 class=xl72 width=425 style='width:319pt'><%= dt.Rows[0]["ADDR1"]%></td>
  <td class=xl27></td>
  <td class=xl39></td>
  <td class=xl41></td>
  <td class=xl35></td>
  <td class=xl27></td>
  <td class=xl39></td>
  <td colspan=5 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl38 colspan=2 style='height:27.75pt;mso-ignore:colspan'>Order
  type:</td>
  <td class=xl27></td>
  <td class=xl41 width=60 style='width:45pt'>Order</td>
  <td colspan=8 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=8 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl38 colspan=2 style='height:27.75pt;mso-ignore:colspan'>Diển
  giải:</td>
  <td class=xl27></td>
  <td class=xl31 colspan=2 style='mso-ignore:colspan'>Da Thành Phẩm</td>
  <td colspan=7 class=xl31 style='mso-ignore:colspan'></td>
  <td colspan=8 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 colspan=12 class=xl31 style='height:27.75pt;mso-ignore:colspan'></td>
  <td colspan=8 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl42 style='height:27.75pt; font-weight:700'>STT</td>
  <td rowspan=2 class=xl73 width=93 style='border-bottom:.5pt solid black;
  width:70pt; font-weight:700'>Meterial Code</td>
  <td colspan=4 class=xl76 style='border-right:1.0pt solid black;border-left:
  none; font-weight:700'>Goods description</td>
  <td rowspan=2 class=xl78 style='border-bottom:.5pt solid black; font-weight:700'>PO#</td>
  <td rowspan=2 class=xl80 width=54 style='border-bottom:.5pt solid black;
  width:41pt; font-weight:700'>PACKING( ROLL)</td>
  <td rowspan=2 class=xl82 style='border-bottom:.5pt solid black; font-weight:700'>Quantity</td>
  <td rowspan=2 class=xl82 style='border-bottom:.5pt solid black; font-weight:700'>UNIT</td>
  <td class=xl44 style="font-weight:700">Unit <span style='mso-spacerun:yes'> </span></td>
  <td rowspan=2 class=xl44 style="font-weight:700">Amount</td>
  <td colspan=8 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=37 style='mso-height-source:userset; height:27.75pt'>
  <td height=37 class=xl45 style='height:27.75pt; font-weight:700'>No.</td>
  <td class=xl46 style="font-weight:700">Item</td>
  <td class=xl46 style="font-weight:700">Thickness</td>
  <td class=xl47 width=64 style="width:48pt; font-weight:700">Patten/ <br>
    Emboss</td>
  <td class=xl48 style="font-weight:700">Color</td>
  <td class=xl49 style="font-weight:700">Price</td>
  <td colspan=8 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <%
            decimal l_outqty = 0;
            decimal l_packing = 0;
            decimal l_amount = 0;
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                
 %> 
 <tr class=xl50 height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl51 style='height:27.75pt' x:num><%=i+1%></td>
  <td class=xl52><%=dt1.Rows[i]["so_item_no"]%></td>
  <td class=xl53><%=dt1.Rows[i]["item_name"]%></td>
  <td class=xl54><%=dt1.Rows[i]["thick"]%></td>
  <td class=xl53><%=dt1.Rows[i]["embo"]%></td>
  <td class=xl53><%=dt1.Rows[i]["color"]%></td>
  <td class=xl55><%=dt1.Rows[i]["item_po"]%></td>
  <td class=xl56 x:num><%=dt1.Rows[i]["Roll"]%></td>
  <td class=xl57 x:num><%=dt1.Rows[i]["OUT_QTY"]%></td>
  <td class=xl58 width=43 style='width:32pt'><%=dt1.Rows[i]["OUT_UOM"]%></td>
  <td class=xl59 width=61 style='width:46pt' x:num><%=dt1.Rows[i]["unit_price"]%></td>
  <td class=xl59 width=107 style='width:80pt' x:num><%=dt1.Rows[i]["amount"]%></td>
  <td colspan=8 class=xl50 style='mso-ignore:colspan'></td>
 </tr>
 <%
    l_outqty += Convert.ToDecimal(dt1.Rows[i]["OUT_QTY"]);   
    l_packing  += Convert.ToDecimal(dt1.Rows[i]["roll"]);   
    l_amount  += Convert.ToDecimal(dt1.Rows[i]["amount"]);   
    }
  %> 
 <tr class=xl63 height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl64 style='height:27.75pt'>TO<span style='display:none'>TAL</span></td>
  <td class=xl65>&nbsp;</td>
  <td colspan=3 class=xl85 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
  <td class=xl66>&nbsp;</td>
  <td class=xl67>&nbsp;</td>
  <td class=xl68 x:num> <%=l_packing%></td>
  <td class=xl68 x:num> <%=l_outqty%> </td>
  <td class=xl68><u style='visibility:hidden;mso-ignore:visibility'>&nbsp;</u></td>
  <td class=xl68><u style='visibility:hidden;mso-ignore:visibility'>&nbsp;</u></td>
  <td class=xl68><u style='visibility:hidden;mso-ignore:visibility'> <%=l_amount%> </u></td>
  <td colspan=8 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td colspan=9 height=37 class=xl87 style='height:27.75pt'>Remark :<%= dt.Rows[0]["DESCRIPTION"]%></td>
  <td colspan=3 class=xl43 style='mso-ignore:colspan'></td>
  <td colspan=8 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl40 height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl40 style='height:27.75pt'></td>
  <td colspan=3 class=xl69 style='mso-ignore:colspan'></td>
  <td colspan=16 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl40 height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl40 style='height:27.75pt'></td>
  <td class=xl69 colspan=2 style='mso-ignore:colspan'>Người nhận hàng/ Receiver</td>
  <td class=xl40></td>
  <td class=xl70 colspan=2 style='mso-ignore:colspan'>Thủ kho/ w/h keeper</td>
  <td class=xl70 colspan=3 style='mso-ignore:colspan'>Giám đốc/ Manager</td>
  <td class=xl70 colspan=3 style='mso-ignore:colspan'>Bên vận chuyển/
  Transporter</td>
  <td colspan=8 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl40 height=21 style='height:15.75pt'>
  <td height=21 class=xl70 style='height:15.75pt'></td>
  <td colspan=2 class=xl40 style='mso-ignore:colspan'></td>
  <td class=xl70></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
  <td class=xl40 colspan=3 style='mso-ignore:colspan'>Số Xe/Truck No.:</td>
  <td colspan=8 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl40 height=0 style='display:none'>
  <td height=0 colspan=20 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl40 height=21 style='height:15.75pt'>
  <td height=21 colspan=20 class=xl40 style='height:15.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl40 height=21 style='height:15.75pt'>
  <td height=21 colspan=20 class=xl40 style='height:15.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl40 height=0 style='display:none'>
  <td height=0 colspan=20 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl40 height=0 style='display:none'>
  <td height=0 colspan=20 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=0 style='display:none'>
  <td height=0 colspan=20 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=20 class=xl27 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=12 class=xl31 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=8 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl40 height=21 style='height:15.75pt'>
  <td height=21 class=xl40 style='height:15.75pt'></td>
  <td colspan=4 class=xl69 style='mso-ignore:colspan'></td>
  <td colspan=6 class=xl40 style='mso-ignore:colspan'></td>
  <td class=xl70></td>
  <td colspan=8 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl40 height=21 style='height:15.75pt'>
  <td height=21 class=xl40 style='height:15.75pt'></td>
  <td colspan=2 class=xl70 style='mso-ignore:colspan'></td>
  <td class=xl40></td>
  <td colspan=4 class=xl70 style='mso-ignore:colspan'></td>
  <td colspan=12 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=12 class=xl31 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=8 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=12 class=xl31 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=8 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=31 style='width:23pt'></td>
  <td width=93 style='width:70pt'></td>
  <td width=151 style='width:113pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=131 style='width:98pt'></td>
  <td width=59 style='width:44pt'></td>
  <td width=54 style='width:41pt'></td>
  <td width=57 style='width:43pt'></td>
  <td width=43 style='width:32pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=107 style='width:80pt'></td>
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
