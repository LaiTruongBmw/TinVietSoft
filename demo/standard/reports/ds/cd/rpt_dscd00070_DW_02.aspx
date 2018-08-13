<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8";
    Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<% 
    string master_pk = Request.QueryString["master_pk"];
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_dscd00030_DW_02_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dscd00030_DW_02_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dscd00030_DW_02_files/oledata.mso">
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
  <o:LastPrinted>2010-12-29T09:28:33Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2010-12-29T09:30:00Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .5in 1.0in .5in;
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
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";}
.xl37
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";
	text-align:left;}
.xl38
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:left;}
.xl39
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl40
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl41
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;}
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
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl45
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl46
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
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
	border-bottom:.5pt solid windowtext;
	border-left:none;}
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
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl49
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl50
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl51
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl52
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
	border-left:.5pt solid windowtext;}
.xl53
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
.xl54
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
.xl55
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
	border-left:none;}
.xl56
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl57
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl58
	{mso-style-parent:style23;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl59
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
.xl60
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
.xl61
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl62
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Fixed;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl63
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl64
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl65
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
.xl66
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
.xl67
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";
	text-align:center;}
.xl68
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";}
.xl69
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl70
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl71
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
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
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl76
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl77
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl78
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl79
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl80
	{mso-style-parent:style23;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl81
	{mso-style-parent:style23;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl82
	{mso-style-parent:style23;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl83
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl84
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl85
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl86
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
      <x:Scale>47</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>12</x:ActiveRow>
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
 <o:shapedefaults v:ext="edit" spidmax="1026"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl27>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1393 style='border-collapse:
 collapse;table-layout:fixed;width:1046pt'>
 <col class=xl27 width=39 style='mso-width-source:userset;mso-width-alt:1426;
 width:29pt'>
 <col class=xl27 width=138 style='mso-width-source:userset;mso-width-alt:5046;
 width:104pt'>
 <col class=xl27 width=120 style='mso-width-source:userset;mso-width-alt:4388;
 width:90pt'>
 <col class=xl27 width=70 style='mso-width-source:userset;mso-width-alt:2560;
 width:53pt'>
 <col class=xl27 width=393 style='mso-width-source:userset;mso-width-alt:14372;
 width:295pt'>
 <col class=xl27 width=79 style='mso-width-source:userset;mso-width-alt:2889;
 width:59pt'>
 <col class=xl27 width=64 style='width:48pt'>
 <col class=xl28 width=92 style='mso-width-source:userset;mso-width-alt:3364;
 width:69pt'>
 <col class=xl27 width=101 style='mso-width-source:userset;mso-width-alt:3693;
 width:76pt'>
 <col class=xl29 width=297 style='mso-width-source:userset;mso-width-alt:10861;
 width:223pt'>
 <tr height=44 style='height:33.0pt'>
  <td height=44 class=xl27 width=39 style='height:33.0pt;width:29pt'></td>
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
   <v:imagedata src="rpt_dscd00030_DW_02_files/image001.png" o:title="logo"/>
   <x:ClientData ObjectType="Pict">
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:40px;margin-top:9px;width:99px;
  height:42px'><img width=99 height=42
  src="rpt_dscd00030_DW_02_files/image002.jpg" alt=logo v:shapes="Picture_x0020_1"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=44 class=xl27 width=138 style='height:33.0pt;width:104pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl27 width=120 style='width:90pt'></td>
  <td class=xl27 width=70 style='width:53pt'></td>
  <td colspan=6 class=xl72 width=1026 style='width:770pt'>PHIẾU XUẤT KHO</td>
 </tr>
 <tr height=44 style='height:33.0pt'>
  <td height=44 class=xl27 style='height:33.0pt'></td>
  <td class=xl30 colspan=2 style='mso-ignore:colspan'>DAEWON CHEMICAL VINA</td>
  <td class=xl27></td>
  <td colspan=6 class=xl72>DELIVERY VOUCHER</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl27 style='height:12.75pt'></td>
  <td class=xl31 colspan=2 style='mso-ignore:colspan'>KCN Long Thành, Huyện
  Long Thành, Đồng Nai.</td>
  <td colspan=4 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl28></td>
  <td class=xl27></td>
  <td class=xl29></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl27 style='height:12.75pt'></td>
  <td class=xl31 colspan=2 style='mso-ignore:colspan'>ĐT: 061 3 514270<span
  style='mso-spacerun:yes'>   </span>Fax: 061 3 514271.</td>
  <td colspan=4 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl27 style='height:14.25pt'></td>
  <td class=xl32></td>
  <td colspan=5 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl33></td>
  <td class=xl28></td>
  <td class=xl29></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl27 style='height:12.75pt'></td>
  <td class=xl32></td>
  <td colspan=5 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl28></td>
  <td class=xl27></td>
  <td class=xl29></td>
 </tr>
   <%
        DataTable dt1 = CtlLib.TableReadOpenCursor("st_lg__rpt_dscd00070_dw_2_1", "'" + master_pk + "'");
        DataTable dt;
        dt = CtlLib.TableReadOpenCursor("st_lg__rpt_dscd00070_dw_2", "'" + master_pk + "'");  
 %> 
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl34 colspan=3 style='height:15.0pt;mso-ignore:colspan'>Tên
  khách hàng(Customer<span style='mso-spacerun:yes'>  </span>name):</td>
  <td class=xl34 colspan=2 style='mso-ignore:colspan'><%= dt.Rows[0]["supplier_name"]%></td>
  <td class=xl34></td>
  <td class=xl35></td>
  <td class=xl37>Số(Ref. No.) :</td>
  <td class=xl37></td>
  <td class=xl38><%= dt.Rows[0]["slip_no"]%></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl34 colspan=2 style='height:21.0pt;mso-ignore:colspan'>Địa
  chỉ( Address):</td>
  <td colspan=5 class=xl73 width=726 style='width:545pt'><%= dt.Rows[0]["ADDR1"]%><span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl36>Ngày( Date)</td>
  <td class=xl36></td>
  <td class=xl41 x:num><%= dt.Rows[0]["dd"]+ "/"+ dt.Rows[0]["mm"]+ "/" + dt.Rows[0]["yyyy"] %></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl34 colspan=2 style='height:21.0pt;mso-ignore:colspan'>Diển
  giải:</td>
  <td class=xl35>Da Thành Phẩm</td>
  <td colspan=4 class=xl35 style='mso-ignore:colspan'></td>
  <td class=xl36></td>
  <td class=xl35></td>
  <td class=xl40></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl42 style='height:15.75pt'>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl43>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl44>&nbsp;</td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl45 width=39 style='height:21.75pt;width:29pt'>STT</td>
  <td class=xl46 width=138 style='width:104pt'>Mã vật tư</td>
  <td colspan=3 class=xl75 style='border-right:.5pt solid black;border-left:
  none'>Chi tiết hàng hóa</td>
  <td class=xl47>Số lượng</td>
  <td class=xl47>Đơn vị</td>
  <td class=xl48 width=92 style='width:69pt'>Ghi chú</td>
  <td class=xl48 width=101 style='width:76pt'>PACKING</td>
  <td class=xl49>Số PO</td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl50 width=39 style='height:21.75pt;width:29pt'>No.</td>
  <td class=xl51 width=138 style='width:104pt'>Meterial Code</td>
  <td colspan=3 class=xl77 style='border-right:.5pt solid black;border-left:
  none'>Goods description</td>
  <td class=xl52 style='border-left:none'>Quantity</td>
  <td class=xl53>UNIT</td>
  <td class=xl54 width=92 style='width:69pt'>Remark</td>
  <td class=xl54 width=101 style='width:76pt'>( ROLL)</td>
  <td class=xl55>PO#</td>
 </tr>
  <%
            decimal l_outqty = 0;
            decimal l_packing = 0;
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                
 %> 
 <tr class=xl56 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl57 style='height:21.75pt' x:num><%=i+1%></td>
  <td class=xl58><%=dt1.Rows[i]["item_code"]%></td>
  <td colspan=3 class=xl80 style='border-right:.5pt solid black;border-left:
  none'><%=dt1.Rows[i]["item_name"]%></td>
  <td class=xl59 x:num><%=dt1.Rows[i]["out_qty"]%></td>
  <td class=xl60 width=64 style='width:48pt'><%=dt1.Rows[i]["out_uom"]%></td>
  <td class=xl61><%=dt1.Rows[i]["order_type"]%></td>
  <td class=xl61 x:num><%=dt1.Rows[i]["packing"]%></td>
  <td class=xl62><%=dt1.Rows[i]["item_po"]%></td>
 </tr>
  <%
    l_outqty += Convert.ToDecimal(dt1.Rows[i]["out_qty"]);   
    l_packing  += Convert.ToDecimal(dt1.Rows[i]["packing"]);   
    }
  %>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl63 style='height:21.75pt'>TOT<span style='display:none'>AL</span></td>
  <td class=xl64>&nbsp;</td>
  <td colspan=3 class=xl84 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
  <td class=xl65 x:num><%=l_outqty%></td>
  <td class=xl65><u style='visibility:hidden;mso-ignore:visibility'>&nbsp;</u></td>
  <td class=xl65><u style='visibility:hidden;mso-ignore:visibility'>&nbsp;</u></td>
  <td class=xl65 x:num><%=l_packing %></td>
  <td class=xl66>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=6 height=20 class=xl86 style='height:15.0pt'>Remark : Reprinting
  and Returned follow Ref. No.:</td>
  <td class=xl40></td>
  <td class=xl67></td>
  <td colspan=2 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl39 height=21 style='height:15.75pt'>
  <td height=21 class=xl39 style='height:15.75pt'></td>
  <td class=xl70></td>
  <td colspan=5 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl39></td>
  <td class=xl69></td>
 </tr>
 <tr class=xl39 height=21 style='height:15.75pt'>
  <td height=21 class=xl39 style='height:15.75pt'></td>
  <td class=xl71>Giám đốc/ Manager</td>
  <td class=xl71></td>
  <td colspan=4 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl71 colspan=2 style='mso-ignore:colspan'>Security/Bảo vệ</td>
 </tr>
 <tr class=xl39 height=21 style='height:15.75pt'>
  <td height=21 class=xl71 style='height:15.75pt'></td>
  <td colspan=2 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl71></td>
  <td colspan=3 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl39></td>
  <td class=xl69></td>
 </tr>
 <tr class=xl39 height=0 style='display:none'>
  <td height=0 colspan=7 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl39></td>
  <td class=xl69></td>
 </tr>
 <tr class=xl39 height=21 style='height:15.75pt'>
  <td height=21 colspan=7 class=xl39 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl39></td>
  <td class=xl69></td>
 </tr>
 <tr class=xl39 height=21 style='height:15.75pt'>
  <td height=21 colspan=7 class=xl39 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl39></td>
  <td class=xl69></td>
 </tr>
 <tr class=xl39 height=0 style='display:none'>
  <td height=0 colspan=7 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl39></td>
  <td class=xl69></td>
 </tr>
 <tr class=xl39 height=0 style='display:none'>
  <td height=0 colspan=7 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl39></td>
  <td class=xl69></td>
 </tr>
 <tr height=0 style='display:none'>
  <td height=0 colspan=7 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl28></td>
  <td class=xl27></td>
  <td class=xl29></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=7 class=xl27 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl28></td>
  <td class=xl71 colspan=2 style='mso-ignore:colspan'>Bên vận chuyển/
  Transporter</td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=7 class=xl35 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl36></td>
  <td class=xl39 colspan=2 style='mso-ignore:colspan'>Số Xe/Truck No.:</td>
 </tr>
 <tr class=xl39 height=21 style='height:15.75pt'>
  <td height=21 class=xl39 style='height:15.75pt'>*</td>
  <td class=xl70 colspan=3 style='mso-ignore:colspan'>Đại diện khách hàng/
  Customer's representative</td>
  <td class=xl70></td>
  <td colspan=2 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl39></td>
  <td class=xl69></td>
 </tr>
 <tr class=xl39 height=21 style='height:15.75pt'>
  <td height=21 class=xl39 style='height:15.75pt'></td>
  <td class=xl71 colspan=2 style='mso-ignore:colspan'>Thủ kho/ w/h keeper</td>
  <td class=xl39></td>
  <td class=xl71>Giám đốc/ Manager</td>
  <td colspan=2 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl27></td>
  <td class=xl69></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=7 class=xl35 style='height:15.0pt;mso-ignore:colspan'></td>
  <td class=xl36></td>
  <td class=xl27></td>
  <td class=xl40></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=7 class=xl35 style='height:15.0pt;mso-ignore:colspan'></td>
  <td class=xl36></td>
  <td class=xl27></td>
  <td class=xl40></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=39 style='width:29pt'></td>
  <td width=138 style='width:104pt'></td>
  <td width=120 style='width:90pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=393 style='width:295pt'></td>
  <td width=79 style='width:59pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=92 style='width:69pt'></td>
  <td width=101 style='width:76pt'></td>
  <td width=297 style='width:223pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
