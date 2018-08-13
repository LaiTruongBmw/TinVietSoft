<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser("inv");
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string p_from_date = Request.QueryString["from_date"];
    string p_to_date = Request.QueryString["to_date"];
    string p_tin_warehouse = Request.QueryString["tin_warehouse"];
    string p_tco_itemgrp = Request.QueryString["tco_itemgrp"]; 
    string p_item = Request.QueryString["item"];
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_bisc00040_bkvina06_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_bisc00040_bkvina06_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_bisc00040_bkvina06_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>ower</o:Author>
  <o:LastAuthor>Mr Khanh</o:LastAuthor>
  <o:LastPrinted>2010-12-02T06:11:19Z</o:LastPrinted>
  <o:Created>2009-08-06T08:24:13Z</o:Created>
  <o:LastSaved>2010-12-10T10:13:45Z</o:LastSaved>
  <o:Company>My home</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.4in .24in .37in .2in;
	mso-header-margin:.24in;
	mso-footer-margin:.23in;
	mso-horizontal-page-align:center;}
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style16
	{mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	mso-style-name:Comma;
	mso-style-id:3;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:\B3CB\C6C0, monospace;
	mso-font-charset:129;
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
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:\B3CB\C6C0, monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl24
	{mso-style-parent:style16;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:bottom;}
.xl25
	{mso-style-parent:style0;
	color:red;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl26
	{mso-style-parent:style0;
	color:red;
	font-size:16.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl27
	{mso-style-parent:style16;
	color:red;
	font-size:16.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:bottom;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl28
	{mso-style-parent:style0;
	color:blue;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:bottom;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFCC;
	mso-pattern:auto none;}
.xl29
	{mso-style-parent:style0;
	color:blue;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:bottom;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFCC;
	mso-pattern:auto none;}
.xl30
	{mso-style-parent:style16;
	color:blue;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:bottom;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFCC;
	mso-pattern:auto none;}
.xl31
	{mso-style-parent:style16;
	color:blue;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:bottom;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFCC;
	mso-pattern:auto none;}
.xl32
	{mso-style-parent:style16;
	color:blue;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:bottom;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#CCFFCC;
	mso-pattern:auto none;
	white-space:normal;}
.xl33
	{mso-style-parent:style16;
	color:blue;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:bottom;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFCC;
	mso-pattern:auto none;
	white-space:normal;}
.xl34
	{mso-style-parent:style16;
	color:blue;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:bottom;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFCC;
	mso-pattern:auto none;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	background:#CCFFCC;
	mso-pattern:auto none;}
.xl36
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-pattern:auto none;}
.xl37
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-pattern:auto none;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;	
	mso-pattern:auto none;}
.xl39
	{mso-style-parent:style16;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;	
	mso-pattern:auto none;}
.xl40
	{mso-style-parent:style16;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;	
	mso-pattern:auto none;}
.xl41
	{mso-style-parent:style16;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-pattern:auto none;}
.xl42
	{mso-style-parent:style16;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;	
	mso-pattern:auto none;}
.xl43
	{mso-style-parent:style16;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;	
	mso-pattern:auto none;}
.xl44
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:bottom;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl45
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl46
	{mso-style-parent:style16;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:bottom;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl47
	{mso-style-parent:style16;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl48
	{mso-style-parent:style0;
	color:red;
	font-size:16.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:bottom;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl49
	{mso-style-parent:style16;
	color:red;
	font-size:16.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:bottom;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl50
	{mso-style-parent:style16;
	color:red;
	font-size:16.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:bottom;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl51
	{mso-style-parent:style16;
	color:red;
	font-size:16.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:bottom;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl52
	{mso-style-parent:style16;
	color:red;
	font-size:16.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:bottom;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid black;}
.xl53
	{mso-style-parent:style16;
	color:red;
	font-size:16.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:bottom;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>GENUWIN (SOFTWARE)</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>300</x:DefaultRowHeight>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>82</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>3</x:SplitHorizontal>
     <x:TopRowBottomPane>3</x:TopRowBottomPane>
     <x:SplitVertical>2</x:SplitVertical>
     <x:LeftColumnRightPane>2</x:LeftColumnRightPane>
     <x:ActivePane>0</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>1</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>0</x:Number>
       <x:ActiveCol>0</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>8895</x:WindowHeight>
  <x:WindowWidth>14160</x:WindowWidth>
  <x:WindowTopX>600</x:WindowTopX>
  <x:WindowTopY>15</x:WindowTopY>
  <x:TabRatio>714</x:TabRatio>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1025"/>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1250 style='border-collapse:
 collapse;table-layout:fixed;width:941pt'>
 <col width=129 style='mso-width-source:userset;mso-width-alt:4717;width:97pt'>
 <col width=0 style='display:none;mso-width-source:userset;mso-width-alt:16310'>
 <col width=56 style='mso-width-source:userset;mso-width-alt:2048;width:42pt'>
 <col class=xl24 width=60 style='mso-width-source:userset;mso-width-alt:2194;
 width:45pt'>
 <col class=xl24 width=70 span=3 style='mso-width-source:userset;mso-width-alt:
 2560;width:53pt'>
 <col class=xl24 width=78 style='mso-width-source:userset;mso-width-alt:2852;
 width:59pt'>
 <col class=xl24 width=61 style='mso-width-source:userset;mso-width-alt:2230;
 width:46pt'>
 <col class=xl24 width=42 style='mso-width-source:userset;mso-width-alt:1536;
 width:32pt'>
 <col class=xl24 width=60 span=2 style='mso-width-source:userset;mso-width-alt:
 2194;width:45pt'>
 <col class=xl24 width=55 style='mso-width-source:userset;mso-width-alt:2011;
 width:41pt'>
 <col class=xl24 width=58 style='mso-width-source:userset;mso-width-alt:2121;
 width:44pt'>
 <col class=xl24 width=61 style='mso-width-source:userset;mso-width-alt:2230;
 width:46pt'>
 <col width=64 span=5 style='width:48pt'>
 <tr height=27 style='height:20.25pt'>
  <td colspan=15 height=27 class=xl48 width=930 style='height:20.25pt;
  width:701pt'>Delivery Report</td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl25 style='height:20.25pt'><%=p_from_date.Substring(6,2) %> ~<%=p_to_date.Substring(6, 2) + "-" + p_to_date.Substring(4, 2) + "-" + p_to_date.Substring(0, 4)%> </td>
  <td class=xl26>&nbsp;</td>
  <td class=xl26>&nbsp;</td>
  <td class=xl27>&nbsp;</td>
  <td colspan=3 class=xl49 style='border-right:1.0pt solid black'>IN ACCOUNT</td>
  <td colspan=5 class=xl52 style='border-right:1.0pt solid black;border-left:
  none'>OUT ACCOUNT</td>
  <td class=xl27>&nbsp;</td>
  <td class=xl27>&nbsp;</td>
  <td class=xl53 style='border-top:none'>&nbsp;</td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=62 style='mso-height-source:userset;height:46.5pt'>
  <td height=62 class=xl28 style='height:46.5pt'>Item Code</td>
  <td class=xl29>Item name</td>
  <td class=xl29>GAGE</td>
  <td class=xl30 x:str="Begin Qty"><span style='mso-spacerun:yes'> </span>Begin
  Qty<span style='mso-spacerun:yes'> </span></td>
  <td class=xl30 x:str="Produce "><span
  style='mso-spacerun:yes'> </span>Produce<span
  style='mso-spacerun:yes'>  </span></td>
  <td class=xl30 x:str="In exch"><span style='mso-spacerun:yes'> </span>In
  exch<span style='mso-spacerun:yes'> </span></td>
  <td class=xl31 x:str="Total In"><span style='mso-spacerun:yes'> </span>Total
  In<span style='mso-spacerun:yes'> </span></td>
  <td class=xl32 width=78 style='width:59pt' x:str="Exchange &#10;Qty"><span
  style='mso-spacerun:yes'> </span>Exchange <br>
    Qty<span style='mso-spacerun:yes'> </span></td>
  <td class=xl33 width=61 style='width:46pt' x:str="Exch to&#10;Item"><span
  style='mso-spacerun:yes'> </span>Exch to<br>
    Item<span style='mso-spacerun:yes'> </span></td>
  <td class=xl33 width=42 style='width:32pt' x:str="Quatity&#10;Bad goods"><span
  style='mso-spacerun:yes'> </span>Quatity<br>
    Bad goods<span style='mso-spacerun:yes'> </span></td>
  <td class=xl33 width=60 style='width:45pt' x:str="Exported&#10;Qty"><span
  style='mso-spacerun:yes'> </span>Exported<br>
    Qty<span style='mso-spacerun:yes'> </span></td>
  <td class=xl34 width=60 style='width:45pt' x:str="Total&#10;Out Qty"><span
  style='mso-spacerun:yes'> </span>Total<br>
    Out Qty<span style='mso-spacerun:yes'> </span></td>
  <td class=xl33 width=55 style='width:41pt' x:str="End Qty&#10;books"><span
  style='mso-spacerun:yes'> </span>End Qty<br>
    books<span style='mso-spacerun:yes'> </span></td>
  <td class=xl33 width=58 style='width:44pt' x:str="End Qty&#10;Infact"><span
  style='mso-spacerun:yes'> </span>End Qty<br>
    Infact<span style='mso-spacerun:yes'> </span></td>
  <td class=xl33 width=61 style='width:46pt' x:str="Quatity&#10;Dif.End month"><span
  style='mso-spacerun:yes'> </span>Quatity<br>
    Dif.End month<span style='mso-spacerun:yes'> </span></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <%
            string para = " '" + p_from_date + "','" + p_to_date + "','" + p_tin_warehouse + "','" + p_tco_itemgrp + "','" + p_item + "'";
            DataTable dt;
            dt = CtlLib.TableReadOpenCursor("INV.sp_rpt_bisc00040_bkvina06", para);
            decimal TotalBeginQty = 0;
            decimal TotalProduce  = 0;
            decimal TotalExchangeQty = 0;
            decimal TotalQuantityBad = 0;
            decimal TotalExportedQty = 0;
            decimal TotalOutQty = 0;
            decimal TotalEndQtyBooks = 0;
            decimal TotalEndQtyInfact = 0;
            decimal TotalQtyDifEndMonths = 0;
            //--------------------
            for (int i = 0; i < dt.Rows.Count; i++)
            {
%>
 <tr class=xl35 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 class=xl36 style='height:15.75pt'><%= dt.Rows[i]["item_code"]%></td>
  <td class=xl37 width=0></td>
  <td class=xl38 align=right x:num><%= dt.Rows[i]["spec_nm"]%></td>
  <td class=xl39 x:num><span style='mso-spacerun:yes'>    </span><%= dt.Rows[i]["begin_qty"]%></td>
  <td class=xl40 x:num><span style='mso-spacerun:yes'>          </span><%= dt.Rows[i]["prod_qty"]%></td>
  <td class=xl40><%= dt.Rows[i]["in_exch"]%></td>
  <td class=xl41 x:num ><span
  style='mso-spacerun:yes'>          </span><%= dt.Rows[i]["total_in"]%></td>
  <td class=xl42 x:num><span style='mso-spacerun:yes'>       </span><%= dt.Rows[i]["out_exch"]%><span
  style='mso-spacerun:yes'>   </span></td>
  <td class=xl39><%= dt.Rows[i]["exch_to"]%></td>
  <td class=xl39 x:num><span style='mso-spacerun:yes'> </span><%= dt.Rows[i]["defect_qty"]%><span
  style='mso-spacerun:yes'>   </span></td>
  <td class=xl40 x:num><%= dt.Rows[i]["deli_qty"]%><span style='mso-spacerun:yes'>     </span></td>
  <td class=xl43 x:num ><%= dt.Rows[i]["total_out"]%><span
  style='mso-spacerun:yes'>     </span></td>
  <td class=xl39 x:num ><span style='mso-spacerun:yes'>  
  </span><%= dt.Rows[i]["book_qty"]%><span style='mso-spacerun:yes'>   </span></td>
  <td class=xl39 x:num><span style='mso-spacerun:yes'>    </span><%= dt.Rows[i]["infact_qty"]%><span
  style='mso-spacerun:yes'>   </span></td>
  <td class=xl39 x:num ><span style='mso-spacerun:yes'>   
  </span><%= dt.Rows[i]["diff_qty"]%><span style='mso-spacerun:yes'>   </span></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <%
     TotalBeginQty += Convert.ToDecimal(dt.Rows[i]["begin_qty"]);
     TotalProduce += Convert.ToDecimal(dt.Rows[i]["prod_qty"]);
                
     TotalExchangeQty += Convert.ToDecimal(dt.Rows[i]["out_exch"]);
     TotalQuantityBad += Convert.ToDecimal(dt.Rows[i]["defect_qty"]);
     TotalExportedQty += Convert.ToDecimal(dt.Rows[i]["deli_qty"]);
     TotalOutQty += Convert.ToDecimal(dt.Rows[i]["total_out"]);

     TotalEndQtyBooks += Convert.ToDecimal(dt.Rows[i]["book_qty"]);
     TotalEndQtyInfact += Convert.ToDecimal(dt.Rows[i]["infact_qty"]);
     TotalQtyDifEndMonths += Convert.ToDecimal(dt.Rows[i]["diff_qty"]); 
 } %>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td height=31 class=xl44 style='height:23.25pt'>TOTAL</td>
  <td class=xl45>&nbsp;</td>
  <td class=xl45>&nbsp;</td>
  <td class=xl46 align=center x:num><%= TotalBeginQty%></td>
  <td class=xl46 align=center x:num><%= TotalProduce%></td>
  <td class=xl46>&nbsp;</td>
  <td class=xl46>&nbsp;</td>
  <td class=xl46 x:num><span style='mso-spacerun:yes'>    </span><%= TotalExchangeQty%>
  </td>
  <td class=xl46>&nbsp;</td>
  <td class=xl46 x:num><span style='mso-spacerun:yes'> </span><%= TotalQuantityBad%></td>
  <td class=xl46 align=center x:num><%= TotalExportedQty%></td>
  <td class=xl47 align=center x:num><%= TotalOutQty%></td>
  <td class=xl46 align=center x:num><%= TotalEndQtyBooks%></td>
  <td class=xl46 align=center x:num><%= TotalEndQtyInfact%></td>
  <td class=xl46 x:num><span style='mso-spacerun:yes'>      </span><%= TotalQtyDifEndMonths%></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=129 style='width:97pt'></td>
  <td width=0></td>
  <td width=56 style='width:42pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=78 style='width:59pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=42 style='width:32pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=58 style='width:44pt'></td>
  <td width=61 style='width:46pt'></td>
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
