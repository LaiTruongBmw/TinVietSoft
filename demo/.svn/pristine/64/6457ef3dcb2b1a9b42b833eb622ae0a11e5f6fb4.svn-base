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
<link rel=File-List href="rpt_dscd00030_DW_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dscd00030_DW_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dscd00030_DW_files/oledata.mso">
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
  <o:LastPrinted>2010-12-23T08:05:25Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2010-12-23T10:10:03Z</o:LastSaved>
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
	text-align:center;}
.xl29
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl30
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl31
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";}
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
	text-align:center;}
.xl38
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";}
.xl39
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;}
.xl40
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl41
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl42
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl43
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl44
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl45
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl46
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl47
	{mso-style-parent:style23;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl48
	{mso-style-parent:style23;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl49
	{mso-style-parent:style23;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl50
	{mso-style-parent:style21;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0_\)\;\[Red\]\\\(0\\\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl51
	{mso-style-parent:style22;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl52
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl53
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Fixed;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl54
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl55
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl56
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl57
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl58
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
	border-left:.5pt solid windowtext;}
.xl59
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
.xl60
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl61
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";
	text-align:center;}
.xl62
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl63
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl64
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";}
.xl65
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl66
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl67
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
	border-left:none;}
.xl68
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl69
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl70
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl71
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl72
	{mso-style-parent:style0;
	font-size:26.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl73
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl75
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl78
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl79
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
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
	border-left:none;}
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
	border-bottom:none;
	border-left:none;}
.xl82
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
	border-left:.5pt solid windowtext;}
.xl83
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
.xl84
	{mso-style-parent:style0;
	font-size:8.0pt;
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
.xl85
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
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
      <x:Scale>77</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:LeftColumnVisible>3</x:LeftColumnVisible>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>13</x:ActiveRow>
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
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl27>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1205 style='border-collapse:
 collapse;table-layout:fixed;width:905pt'>
 <col class=xl27 width=28 style='mso-width-source:userset;mso-width-alt:1024;
 width:21pt'>
 <col class=xl27 width=119 style='mso-width-source:userset;mso-width-alt:4352;
 width:89pt'>
 <col class=xl27 width=120 style='mso-width-source:userset;mso-width-alt:4388;
 width:90pt'>
 <col class=xl27 width=70 style='mso-width-source:userset;mso-width-alt:2560;
 width:53pt'>
 <col class=xl27 width=141 span=2 style='mso-width-source:userset;mso-width-alt:
 5156;width:106pt'>
 <col class=xl27 width=79 style='mso-width-source:userset;mso-width-alt:2889;
 width:59pt'>
 <col class=xl27 width=61 style='mso-width-source:userset;mso-width-alt:2230;
 width:46pt'>
 <col class=xl31 width=48 style='mso-width-source:userset;mso-width-alt:1755;
 width:36pt'>
 <col class=xl27 width=101 style='mso-width-source:userset;mso-width-alt:3693;
 width:76pt'>
 <col class=xl28 width=297 style='mso-width-source:userset;mso-width-alt:10861;
 width:223pt'>
  <%
        DataTable dt1 = CtlLib.TableReadOpenCursor("sale.sp_rpt_dscd00030_1", "'" + master_pk + "'");
        DataTable dt;
        dt = CtlLib.TableReadOpenCursor("sale.sp_rpt_dscd00030", "'" + master_pk + "'");  
 %> 
 <tr height=44 style='height:33.0pt'>
  <td height=44 class=xl27 width=28 style='height:33.0pt;width:21pt'></td>
  <td width=119 style='width:89pt' align=left valign=top><!--[if gte vml 1]><v:shapetype
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
   width:66.75pt;height:29.25pt;z-index:1;visibility:visible'>
   <v:imagedata src="rpt_dscd00030_DW_files/image001.png" o:title="logo"/>
   <x:ClientData ObjectType="Pict">
    <x:CF></x:CF>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:40px;margin-top:9px;width:89px;
  height:39px'><img width=89 height=39 src="rpt_dscd00030_DW_files/image002.jpg"
  alt=logo v:shapes="Picture_x0020_1"></span><![endif]><span style='mso-ignore:
  vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=44 class=xl27 width=119 style='height:33.0pt;width:89pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl27 width=120 style='width:90pt'></td>
  <td class=xl27 width=70 style='width:53pt'></td>
  <td colspan=6 class=xl72 width=571 style='width:429pt'>PHIẾU XUẤT KHO</td>
  <td class=xl28 width=297 style='width:223pt'></td>
 </tr>
 <tr height=44 style='height:33.0pt'>
  <td height=44 class=xl27 style='height:33.0pt'></td>
  <td class=xl29 colspan=2 style='mso-ignore:colspan'>DAEWON CHEMICAL VINA</td>
  <td class=xl27></td>
  <td colspan=6 class=xl72>DELIVERY VOUCHER</td>
  <td class=xl28></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl27 style='height:12.75pt'></td>
  <td class=xl30 colspan=2 style='mso-ignore:colspan'>KCN Long Thành, Huyện
  Long Thành, Đồng Nai.</td>
  <td colspan=5 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
  <td class=xl27></td>
  <td class=xl28></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl27 style='height:12.75pt'></td>
  <td class=xl30 colspan=2 style='mso-ignore:colspan'>ĐT: 061 3 514270<span
  style='mso-spacerun:yes'>   </span>Fax: 061 3 514271.</td>
  <td colspan=5 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl31 style='mso-ignore:colspan'></td>
  <td class=xl28></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl27 style='height:14.25pt'></td>
  <td class=xl32></td>
  <td colspan=6 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl33>ATTN:</td>
  <td class=xl31></td>
  <td class=xl28></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl27 style='height:12.75pt'></td>
  <td class=xl32></td>
  <td colspan=6 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
  <td class=xl27></td>
  <td class=xl28></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl34 colspan=3 style='height:15.0pt;mso-ignore:colspan'>Tên
  khách hàng(Customer<span style='mso-spacerun:yes'>  </span>name):</td>
  <td class=xl34 colspan=3 style='mso-ignore:colspan'><%= dt.Rows[0]["supplier_name"]%></td>
  <td class=xl34></td>
  <td class=xl35></td>
  <td class=xl36 colspan=2 style='mso-ignore:colspan'>Số(Ref. No.) :</td>
  <td class=xl37 align="left"><%= dt.Rows[0]["slip_no"]%></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl34 colspan=2 style='height:21.0pt;mso-ignore:colspan'>Địa
  chỉ( Address):</td>
  <td colspan=6 class=xl73 width=612 style='width:460pt'
  ><%= dt.Rows[0]["ADDR1"]%><span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl38 colspan=2 style='mso-ignore:colspan'>Ngày( Date)</td>
  <td class=xl39 x:num><%= dt.Rows[0]["dd"]+ "/"+ dt.Rows[0]["mm"]+ "/" + dt.Rows[0]["yyyy"] %></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl34 colspan=2 style='height:21.0pt;mso-ignore:colspan'>Diển
  giải:</td>
  <td class=xl35>Da Thành Phẩm</td>
  <td colspan=5 class=xl35 style='mso-ignore:colspan'></td>
  <td class=xl38></td>
  <td class=xl35></td>
  <td class=xl40></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=8 class=xl35 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl38></td>
  <td class=xl35></td>
  <td class=xl40></td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl41 style='height:21.75pt'>STT</td>
  <td rowspan=2 class=xl75 width=119 style='width:89pt'>Meterial Code</td>
  <td colspan=4 class=xl77 style='border-right:1.0pt solid black'>Goods
  description</td>
  <td rowspan=2 class=xl80>Quantity</td>
  <td rowspan=2 class=xl82>UNIT</td>
  <td rowspan=2 class=xl84 width=48 style='width:36pt'>ORDER TYPE</td>
  <td rowspan=2 class=xl84 width=101 style='width:76pt'>PACKING( ROLL)</td>
  <td rowspan=2 class=xl67>PO#</td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl42 style='height:21.75pt'>No.</td>
  <td class=xl43 style='border-top:none'>Item</td>
  <td class=xl44 style='border-top:none;border-left:none'>Thickness</td>
  <td class=xl44 style='border-top:none;border-left:none'>Patten/ Emboss</td>
  <td class=xl45 style='border-top:none;border-left:none'>Color</td>
 </tr>
 <%
            decimal l_outqty = 0;
            decimal l_packing = 0;
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                
 %> 
 <tr class=xl54 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl46 style='height:21.75pt' x:num><%=i+1%></td>
  <td class=xl47 style='border-left:none' ><%=dt1.Rows[i]["so_item_no"]%></td>
  <td class=xl48 style='border-left:none'><%=dt1.Rows[i]["item_name"]%></td>
  <td class=xl49 style='border-left:none'><%=dt1.Rows[i]["thick"]%></td>
  <td class=xl48 style='border-left:none'><%=dt1.Rows[i]["embo"]%></td>
  <td class=xl48 style='border-left:none'><%=dt1.Rows[i]["color"]%></td>
  <td class=xl50 style='border-left:none' ><%=dt1.Rows[i]["OUT_QTY"]%></td>
  <td class=xl51 width=61 style='border-left:none;width:46pt'><%=dt1.Rows[i]["OUT_UOM"]%></td>
  <td class=xl52 style='border-left:none'><%=dt1.Rows[i]["order_type"]%></td>
  <td class=xl52 style='border-left:none' x:num><%=dt1.Rows[i]["packing_desc"]%></td>
  <td class=xl53 style='border-left:none'><%=dt1.Rows[i]["item_po"]%></td>
 </tr>
 <%
    l_outqty += Convert.ToDecimal(dt1.Rows[i]["OUT_QTY"]);   
    l_packing  += Convert.ToDecimal(dt1.Rows[i]["packing"]);   
    }
  %>
 <tr class=xl60 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl55 style='height:21.75pt'>TO<span style='display:none'>TAL</span></td>
  <td class=xl56>&nbsp;</td>
  <td colspan=3 class=xl69 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
  <td class=xl57>&nbsp;</td>
  <td class=xl58 style='border-left:none' x:num><%=l_outqty%> </td>
  <td class=xl58 style='border-left:none'><u style='visibility:hidden;
  mso-ignore:visibility'>&nbsp;</u></td>
  <td class=xl58 style='border-left:none'><u style='visibility:hidden;
  mso-ignore:visibility'>&nbsp;</u></td>
  <td class=xl58 style='border-left:none' x:num><%=l_packing %></td>
  <td class=xl59>&nbsp;</td>
 </tr>
 <tr class=xl27 height=20 style='height:15.0pt'>
  <td colspan=7 height=20 class=xl71 style='height:15.0pt'>Remark :<%= dt.Rows[0]["DESCRIPTION"]%></td>
  <td class=xl40></td>
  <td class=xl61></td>
  <td colspan=2 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl62 height=21 style='height:15.75pt'>
  <td height=21 class=xl62 style='height:15.75pt'></td>
  <td class=xl63></td>
  <td colspan=6 class=xl62 style='mso-ignore:colspan'></td>
  <td class=xl64></td>
  <td class=xl62></td>
  <td class=xl65></td>
 </tr>
 <tr class=xl62 height=21 style='height:15.75pt'>
  <td height=21 class=xl62 style='height:15.75pt'></td>
  <td class=xl66 colspan=2 style='mso-ignore:colspan'>Giám đốc/ Manager</td>
  <td colspan=5 class=xl62 style='mso-ignore:colspan'></td>
  <td class=xl64></td>
  <td class=xl66 colspan=2 style='mso-ignore:colspan'>Security/Bảo vệ</td>
 </tr>
 <tr class=xl62 height=21 style='height:15.75pt'>
  <td height=21 class=xl66 style='height:15.75pt'></td>
  <td colspan=2 class=xl62 style='mso-ignore:colspan'></td>
  <td class=xl66></td>
  <td colspan=4 class=xl62 style='mso-ignore:colspan'></td>
  <td class=xl64></td>
  <td class=xl62></td>
  <td class=xl65></td>
 </tr>
 <tr class=xl62 height=0 style='display:none'>
  <td height=0 colspan=8 class=xl62 style='mso-ignore:colspan'></td>
  <td class=xl64></td>
  <td class=xl62></td>
  <td class=xl65></td>
 </tr>
 <tr class=xl62 height=21 style='height:15.75pt'>
  <td height=21 colspan=8 class=xl62 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl64></td>
  <td class=xl62></td>
  <td class=xl65></td>
 </tr>
 <tr class=xl62 height=21 style='height:15.75pt'>
  <td height=21 colspan=8 class=xl62 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl64></td>
  <td class=xl62></td>
  <td class=xl65></td>
 </tr>
 <tr class=xl62 height=0 style='display:none'>
  <td height=0 colspan=8 class=xl62 style='mso-ignore:colspan'></td>
  <td class=xl64></td>
  <td class=xl62></td>
  <td class=xl65></td>
 </tr>
 <tr class=xl62 height=0 style='display:none'>
  <td height=0 colspan=8 class=xl62 style='mso-ignore:colspan'></td>
  <td class=xl64></td>
  <td class=xl62></td>
  <td class=xl65></td>
 </tr>
 <tr height=0 style='display:none'>
  <td height=0 colspan=8 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
  <td class=xl27></td>
  <td class=xl28></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=8 class=xl27 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl31></td>
  <td class=xl66 colspan=2 style='mso-ignore:colspan'>Bên vận chuyển/
  Transporter</td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=8 class=xl35 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl38></td>
  <td class=xl62 colspan=2 style='mso-ignore:colspan'>Số Xe/Truck No.:</td>
 </tr>
 <tr class=xl62 height=21 style='height:15.75pt'>
  <td height=21 class=xl62 style='height:15.75pt'>*</td>
  <td class=xl63 colspan=4 style='mso-ignore:colspan'>Đại diện khách hàng/
  Customer's representative</td>
  <td colspan=3 class=xl62 style='mso-ignore:colspan'></td>
  <td class=xl64></td>
  <td class=xl62></td>
  <td class=xl65></td>
 </tr>
 <tr class=xl62 height=21 style='height:15.75pt'>
  <td height=21 class=xl62 style='height:15.75pt'></td>
  <td class=xl66 colspan=2 style='mso-ignore:colspan'>Thủ kho/ w/h keeper</td>
  <td class=xl62></td>
  <td class=xl66>Giám đốc/ Manager</td>
  <td class=xl66></td>
  <td colspan=2 class=xl62 style='mso-ignore:colspan'></td>
  <td class=xl64></td>
  <td class=xl27></td>
  <td class=xl65></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=8 class=xl35 style='height:15.0pt;mso-ignore:colspan'></td>
  <td class=xl38></td>
  <td class=xl27></td>
  <td class=xl40></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=8 class=xl35 style='height:15.0pt;mso-ignore:colspan'></td>
  <td class=xl38></td>
  <td class=xl27></td>
  <td class=xl40></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=28 style='width:21pt'></td>
  <td width=119 style='width:89pt'></td>
  <td width=120 style='width:90pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=141 style='width:106pt'></td>
  <td width=141 style='width:106pt'></td>
  <td width=79 style='width:59pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=48 style='width:36pt'></td>
  <td width=101 style='width:76pt'></td>
  <td width=297 style='width:223pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
