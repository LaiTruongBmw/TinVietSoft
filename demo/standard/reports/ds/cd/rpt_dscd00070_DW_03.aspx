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
<link rel=File-List href="rpt_dscd00030_DW_03_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dscd00030_DW_03_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dscd00030_DW_03_files/oledata.mso">
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
  <o:LastPrinted>2010-12-29T09:48:14Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2010-12-29T09:51:59Z</o:LastSaved>
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
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
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
	border-bottom:1.0pt solid windowtext;
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
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl47
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl48
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl49
	{mso-style-parent:style23;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl50
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
.xl51
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
.xl52
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl53
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl54
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl55
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
.xl56
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
.xl57
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";
	text-align:center;}
.xl58
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\\\(0\.00\\\)";}
.xl59
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl60
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl61
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl62
	{mso-style-parent:style0;
	font-size:26.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl63
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	white-space:normal;}
.xl64
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
.xl65
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
.xl66
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
.xl67
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl68
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl69
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;}
.xl70
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl71
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
.xl72
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
.xl73
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
.xl74
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
.xl75
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl76
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl77
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
.xl78
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
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
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
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
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl82
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Fixed;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl83
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0_\)\;\[Red\]\\\(0\\\)";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl84
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0_\)\;\[Red\]\\\(0\\\)";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl85
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl86
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl87
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl88
	{mso-style-parent:style23;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl89
	{mso-style-parent:style23;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl90
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
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
      <x:Scale>58</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>19</x:ActiveRow>
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

<table x:str border=0 cellpadding=0 cellspacing=0 width=1589 style='border-collapse:
 collapse;table-layout:fixed;width:1193pt'>
 <col class=xl27 width=39 style='mso-width-source:userset;mso-width-alt:1426;
 width:29pt'>
 <col class=xl27 width=138 style='mso-width-source:userset;mso-width-alt:5046;
 width:104pt'>
 <col class=xl27 width=158 style='mso-width-source:userset;mso-width-alt:5778;
 width:119pt'>
 <col class=xl27 width=111 style='mso-width-source:userset;mso-width-alt:4059;
 width:83pt'>
 <col class=xl27 width=100 style='mso-width-source:userset;mso-width-alt:3657;
 width:75pt'>
 <col class=xl27 width=155 style='mso-width-source:userset;mso-width-alt:5668;
 width:116pt'>
 <col class=xl27 width=79 style='mso-width-source:userset;mso-width-alt:2889;
 width:59pt'>
 <col class=xl27 width=75 style='mso-width-source:userset;mso-width-alt:2742;
 width:56pt'>
 <col class=xl27 width=60 style='mso-width-source:userset;mso-width-alt:2194;
 width:45pt'>
 <col class=xl28 width=86 style='mso-width-source:userset;mso-width-alt:3145;
 width:65pt'>
 <col class=xl27 width=121 style='mso-width-source:userset;mso-width-alt:4425;
 width:91pt'>
 <col class=xl27 width=118 style='mso-width-source:userset;mso-width-alt:4315;
 width:89pt'>
 <col class=xl27 width=135 style='mso-width-source:userset;mso-width-alt:4937;
 width:101pt'>
 <col class=xl29 width=214 style='mso-width-source:userset;mso-width-alt:7826;
 width:161pt'>
 <%
        DataTable dt1 = CtlLib.TableReadOpenCursor("st_lg__rpt_dscd00070_3", "'" + master_pk + "'");
        DataTable dt;
        dt = CtlLib.TableReadOpenCursor("st_lg__rpt_dscd00070_3_1", "'" + master_pk + "'");  
 %> 
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
   <v:imagedata src="rpt_dscd00030_DW_03_files/image001.png" o:title="logo"/>   
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:40px;margin-top:9px;width:99px;
  height:42px'><img width=99 height=42
  src="rpt_dscd00030_DW_03_files/image002.jpg" alt=logo v:shapes="Picture_x0020_1"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=44 class=xl27 width=138 style='height:33.0pt;width:104pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl27 width=158 style='width:119pt'></td>
  <td colspan=11 class=xl62 width=1254 style='width:941pt'>PHIẾU XUẤT KHO</td>
 </tr>
 <tr height=44 style='height:33.0pt'>
  <td height=44 class=xl27 style='height:33.0pt'></td>
  <td class=xl30 colspan=2 style='mso-ignore:colspan'>DAEWON CHEMICAL VINA</td>
  <td colspan=11 class=xl62>DELIVERY VOUCHER</td>
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
  style='mso-spacerun:yes'>   </span>Fax: 061 3 514271.</td>
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
  <td class=xl34 colspan=3 style='mso-ignore:colspan'><%= dt.Rows[0]["supplier_name"]%></td>
  <td colspan=2 class=xl34 style='mso-ignore:colspan'></td>
  <td class=xl35></td>
  <td class=xl28></td>
  <td class=xl37>Số(Ref. No.) :</td>
  <td class=xl38><%= dt.Rows[0]["slip_no"]%></td>
  <td class=xl37></td>
  <td class=xl29></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl34 colspan=2 style='height:21.0pt;mso-ignore:colspan'>Địa
  chỉ( Address):</td>
  <td colspan=7 class=xl63 width=738 style='width:553pt'
  ><%= dt.Rows[0]["ADDR1"]%><span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl28></td>
  <td class=xl36>Ngày( Date)</td>
  <td class=xl41 x:num><%= dt.Rows[0]["dd"]+ "/"+ dt.Rows[0]["mm"]+ "/" + dt.Rows[0]["yyyy"] %></td>
  <td class=xl36></td>
  <td class=xl29></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl34 colspan=2 style='height:21.0pt;mso-ignore:colspan'>Diển
  giải:</td>
  <td class=xl35>Da Thành Phẩm</td>
  <td colspan=6 class=xl35 style='mso-ignore:colspan'></td>
  <td class=xl36></td>
  <td colspan=3 class=xl35 style='mso-ignore:colspan'></td>
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
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl43>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td colspan=2 class=xl35 style='mso-ignore:colspan'></td>
  <td class=xl40></td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl79 width=39 style='height:21.75pt;border-top:none;
  width:29pt'>STT</td>
  <td class=xl80 width=138 style='border-top:none;width:104pt'>Mã vật tư</td>
  <td colspan=4 class=xl65 style='border-right:.5pt solid black;border-left:
  none'>Chi tiết hàng hóa</td>
  <td class=xl69 style='border-top:none;border-left:none'>Delivery</td>
  <td class=xl70 style='border-top:none;border-left:none'>PO</td>
  <td class=xl75 style='border-top:none'>Đơn vị</td>
  <td class=xl76 width=86 style='border-top:none;width:65pt'>PACKING</td>
  <td class=xl77 width=121 style='border-top:none;border-left:none;width:91pt'>Stock</td>
  <td class=xl71 width=118 style='width:89pt'>Model</td>
  <td class=xl74 width=135 style='width:101pt'>Style</td>
  <td class=xl71 width=214 style='border-left:none;width:161pt'>VJ P.O#</td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl72 width=39 style='height:21.75pt;width:29pt'>No.</td>
  <td class=xl46 width=138 style='width:104pt'>POP Number</td>
  <td class=xl85 style='border-top:none;border-left:none'>Goods basic name</td>
  <td class=xl86 style='border-top:none'>Pattern</td>
  <td class=xl86 style='border-top:none;border-left:none'>Spec</td>
  <td class=xl86 style='border-top:none;border-left:none'>Surface Color</td>
  <td class=xl45>Q'ty</td>
  <td class=xl44 style='border-left:none'>Q'ty</td>
  <td class=xl45>UNIT</td>
  <td class=xl46 width=86 style='width:65pt'>( ROLL)</td>
  <td class=xl78 width=121 style='border-left:none;width:91pt'>Number</td>
  <td class=xl73 width=118 style='width:89pt'>Name</td>
  <td class=xl46 width=135 style='width:101pt'>Number</td>
  <td class=xl73 width=214 style='border-left:none;width:161pt'>&nbsp;</td>
 </tr>
  <%
            decimal l_outqty = 0;
            decimal l_packing = 0;
            for (int i = 0; i < dt1.Rows.Count; i++)
            {      
 %> 
 <tr class=xl47 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl48 style='height:21.75pt' x:num><%=i+1%></td>
  <td class=xl49 x:str><%=dt1.Rows[i]["so_item_no"]%></td>
  <td class=xl88 style='border-left:none'><%=dt1.Rows[i]["item_name"]%></td>
  <td class=xl89><%=dt1.Rows[i]["pattern"]%></td>
  <td class=xl89 style='border-left:none'><%=dt1.Rows[i]["spec"]%></td>
  <td class=xl89 style='border-left:none'><%=dt1.Rows[i]["color"]%></td>
  <td class=xl50 x:num><%=dt1.Rows[i]["out_qty"]%></td>
  <td class=xl50 x:num><%=dt1.Rows[i]["ord_qty"]%></td>
  <td class=xl51 width=60 style='width:45pt'><%=dt1.Rows[i]["out_uom"]%></td>
  <td class=xl52 x:num><%=dt1.Rows[i]["packing"]%></td>
  <td class=xl81 style='border-left:none'><%=dt1.Rows[i]["stock_num"]%></td>
  <td class=xl81 style='border-left:none'><%=dt1.Rows[i]["model_nm"]%></td>
  <td class=xl81 style='border-left:none'><%=dt1.Rows[i]["style_num"]%></td>
  <td class=xl82 style='border-top:none;border-left:none'><%=dt1.Rows[i]["item_po"]%></td>
 </tr>
 <% 
    l_outqty += Convert.ToDecimal(dt1.Rows[i]["out_qty"].ToString());   
    l_packing  += Convert.ToDecimal(dt1.Rows[i]["packing"].ToString());   
   } 
 %>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl53 style='height:21.75pt'>TOTAL</span></td>
  <td class=xl54>&nbsp;</td>
  <td colspan=4 class=xl68 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
  <td class=xl55 x:num><%=l_outqty %></td>
  <td class=xl55 x:num></td>
  <td class=xl55></td>
  <td class=xl55 x:num><%=l_packing %></td>
  <td class=xl55></td>
  <td class=xl84 style='border-top:none;border-left:none'><u style='visibility:
  hidden;mso-ignore:visibility'>&nbsp;</u></td>
  <td class=xl83 style='border-top:none'><u style='visibility:hidden;
  mso-ignore:visibility'>&nbsp;</u></td>
  <td class=xl56>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=8 height=20 class=xl87 style='height:15.0pt'>Remark:<%= dt.Rows[0]["DESCRIPTION"]%></td>
  <td class=xl40></td>
  <td class=xl57></td>
  <td colspan=4 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl39 height=21 style='height:15.75pt'>
  <td height=21 class=xl39 style='height:15.75pt'></td>
  <td class=xl60></td>
  <td colspan=7 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl58></td>
  <td colspan=3 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl59></td>
 </tr>
 <tr class=xl39 height=21 style='height:15.75pt'>
  <td height=21 class=xl39 style='height:15.75pt'></td>
  <td class=xl61>Giám đốc/ Manager</td>
  <td class=xl61></td>
  <td colspan=6 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl58></td>
  <td class=xl61>Security/Bảo vệ</td>
  <td colspan=3 class=xl61 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl39 height=21 style='height:15.75pt'>
  <td height=21 class=xl61 style='height:15.75pt'></td>
  <td colspan=2 class=xl39 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl61 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl58></td>
  <td colspan=3 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl59></td>
 </tr>
 <tr class=xl39 height=0 style='display:none'>
  <td height=0 colspan=9 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl58></td>
  <td colspan=3 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl59></td>
 </tr>
 <tr class=xl39 height=21 style='height:15.75pt'>
  <td height=21 colspan=9 class=xl39 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl58></td>
  <td colspan=3 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl59></td>
 </tr>
 <tr class=xl39 height=21 style='height:15.75pt'>
  <td height=21 colspan=9 class=xl39 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl58></td>
  <td colspan=3 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl59></td>
 </tr>
 <tr class=xl39 height=0 style='display:none'>
  <td height=0 colspan=9 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl58></td>
  <td colspan=3 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl59></td>
 </tr>
 <tr class=xl39 height=0 style='display:none'>
  <td height=0 colspan=9 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl58></td>
  <td colspan=3 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl59></td>
 </tr>
 <tr height=0 style='display:none'>
  <td height=0 colspan=9 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl28></td>
  <td colspan=3 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=9 class=xl27 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl28></td>
  <td class=xl61 colspan=2 style='mso-ignore:colspan'>Bên vận chuyển/
  Transporter</td>
  <td colspan=2 class=xl61 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=9 class=xl35 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl36></td>
  <td class=xl39>Số Xe/Truck No.:</td>
  <td colspan=3 class=xl39 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl39 height=21 style='height:15.75pt'>
  <td height=21 class=xl39 style='height:15.75pt'>*</td>
  <td class=xl60 colspan=3 style='mso-ignore:colspan'>Đại diện khách hàng/
  Customer's representative</td>
  <td colspan=2 class=xl60 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl58></td>
  <td colspan=3 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl59></td>
 </tr>
 <tr class=xl39 height=21 style='height:15.75pt'>
  <td height=21 class=xl39 style='height:15.75pt'></td>
  <td class=xl61 colspan=2 style='mso-ignore:colspan'>Thủ kho/ w/h keeper</td>
  <td colspan=2 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl61>Giám đốc/ Manager</td>
  <td colspan=3 class=xl39 style='mso-ignore:colspan'></td>
  <td class=xl58></td>
  <td colspan=3 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl59></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=9 class=xl35 style='height:15.0pt;mso-ignore:colspan'></td>
  <td class=xl36></td>
  <td colspan=3 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl40></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=9 class=xl35 style='height:15.0pt;mso-ignore:colspan'></td>
  <td class=xl36></td>
  <td colspan=3 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl40></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=39 style='width:29pt'></td>
  <td width=138 style='width:104pt'></td>
  <td width=158 style='width:119pt'></td>
  <td width=111 style='width:83pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=155 style='width:116pt'></td>
  <td width=79 style='width:59pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=121 style='width:91pt'></td>
  <td width=118 style='width:89pt'></td>
  <td width=135 style='width:101pt'></td>
  <td width=214 style='width:161pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
