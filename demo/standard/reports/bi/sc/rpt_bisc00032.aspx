<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser("prod");
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>

<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<% 
    string to_date = Request.QueryString["to_date"];
    string wh = Request.QueryString["warehouse_pk"];
    string wh_name = Request.QueryString["warehouse_name"];
    string a, b, c;
    a = to_date.Substring(0, 4);
    b = to_date.Substring(4, 2);
    c = to_date.Substring(6, 2);      
    DataTable dt = CtlLib.TableReadOpenCursor("INV.sp_rpt_bisc00032", "'" + to_date + "','" + wh + "'");
    string str_sql = @"SELECT partner_name, addr1, phone_no, fax_no, tax_code, tco_bpphoto_pk
                       FROM comm.tco_company
                       WHERE del_if = 0 AND pk = (SELECT MAX (pk)
                                                  FROM comm.tco_company
                                                  WHERE del_if = 0 AND active_yn = 'Y')";
    DataTable dt1 = CtlLib.TableReadOpen(str_sql);
  
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_bisc00032_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_bisc00032_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_bisc00032_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>VINAGENUWIN</o:LastAuthor>
  <o:LastPrinted>2012-01-13T03:10:59Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2012-01-13T03:12:47Z</o:LastSaved>
  <o:Version>11.6360</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"&CPage &P of &N";
	margin:.1in .1in .4in .1in;
	mso-header-margin:0in;
	mso-footer-margin:0in;
	mso-page-orientation:landscape;}
.font9
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font11
	{color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
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
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
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
.xl25
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:normal;}
.xl29
	{mso-style-parent:style21;
	color:black;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl30
	{mso-style-parent:style21;
	color:black;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl33
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl34
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl36
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	white-space:normal;}
.xl37
	{mso-style-parent:style21;
	color:black;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl41
	{mso-style-parent:style0;
	color:silver;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl42
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl43
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl44
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;}
.xl45
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl46
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl47
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl48
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.0";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl49
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl50
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl51
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl52
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl53
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	text-align:right;
	vertical-align:middle;}
.xl54
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl55
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl56
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl57
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl58
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl59
	{mso-style-parent:style0;
	text-align:center;}
.xl60
	{mso-style-parent:style21;
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
.xl61
	{mso-style-parent:style21;
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
.xl62
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl63
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl64
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl65
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>210</x:DefaultRowHeight>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>80</x:Scale>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>18</x:ActiveRow>
       <x:ActiveCol>7</x:ActiveCol>
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
  <x:WindowHeight>12120</x:WindowHeight>
  <x:WindowWidth>19200</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>255</x:WindowTopY>
  <x:AcceptLabelsInFormulas/>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$6:$6</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1025"/>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl25>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1519 style='border-collapse:
 collapse;table-layout:fixed;width:1137pt'>
 <col class=xl25 width=80 style='mso-width-source:userset;mso-width-alt:2925;
 width:60pt'>
 <col class=xl25 width=160 style='mso-width-source:userset;mso-width-alt:5851;
 width:120pt'>
 <col class=xl25 width=45 style='mso-width-source:userset;mso-width-alt:1645;
 width:34pt'>
 <col class=xl25 width=70 style='mso-width-source:userset;mso-width-alt:2560;
 width:53pt'>
 <col class=xl25 width=75 span=12 style='mso-width-source:userset;mso-width-alt:
 2742;width:56pt'>
 <col class=xl25 width=71 style='mso-width-source:userset;mso-width-alt:2596;
 width:53pt'>
 <col class=xl25 width=56 style='mso-width-source:userset;mso-width-alt:2048;
 width:42pt'>
 <col class=xl25 width=73 style='mso-width-source:userset;mso-width-alt:2669;
 width:55pt'>
 <col class=xl25 width=64 style='width:48pt'>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl26 width=80 style='height:15.0pt;width:60pt'></td>
  <td class=xl27 align=left width=160 style='width:120pt'><%=dt1.Rows[0]["partner_name"] %></td>
  <td class=xl27 width=45 style='width:34pt'></td>
  <td class=xl27 width=70 style='width:53pt'></td>
  <td class=xl26 width=75 style='width:56pt'></td>
  <td class=xl25 width=75 style='width:56pt'></td>
  <td class=xl28 width=75 style='width:56pt'></td>
  <td class=xl28 width=75 style='width:56pt'></td>
  <td class=xl28 width=75 style='width:56pt'></td>
  <td class=xl28 width=75 style='width:56pt'></td>
  <td class=xl28 width=75 style='width:56pt'></td>
  <td colspan=5 class=xl36 width=375 style='width:280pt'>Tel :<%=dt1.Rows[0]["phone_no"] %></td>
  <td class=xl28 width=71 style='width:53pt'></td>
  <td class=xl28 width=56 style='width:42pt'></td>
  <td class=xl25 width=73 style='width:55pt'></td>
  <td class=xl25 width=64 style='width:48pt'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl26 style='height:15.0pt'></td>
  <td class=xl26 align=left><%=dt1.Rows[0]["addr1"] %></td>
  <td colspan=3 class=xl26 style='mso-ignore:colspan'></td>
  <td class=xl25></td>
  <td colspan=5 class=xl28 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl36 width=375 style='width:280pt'>Fax :<%=dt1.Rows[0]["fax_no"]%></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl26 style='height:15.0pt'></td>
  <td class=xl26 align=left>Tax :<%=dt1.Rows[0]["tax_code"]%></td>
  <td colspan=3 class=xl26 style='mso-ignore:colspan'></td>
  <td class=xl25></td>
  <td class=xl29 width=75 style='width:56pt'>&nbsp;</td>
  <td class=xl29 width=75 style='width:56pt'>&nbsp;</td>
  <td class=xl29 width=75 style='width:56pt'>&nbsp;</td>
  <td class=xl29 width=75 style='width:56pt'>&nbsp;</td>
  <td class=xl29 width=75 style='width:56pt'>&nbsp;</td>
  <td colspan=5 class=xl37 width=375 style='width:280pt'>Print date :
  <%=DateTime.Now.ToString("dd/MM/yyyy hh:mm") %></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=48 style='mso-height-source:userset;height:36.0pt'>
  <td colspan=16 height=48 class=xl38 width=1255 style='height:36.0pt;
  width:939pt'>REPORT W/H CLOSING CHECKING</td>
  <td colspan=3 class=xl31 style='mso-ignore:colspan'></td>
  <td class=xl25></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl42 style='height:21.0pt'></td>
  <td colspan=3 class=xl26 style='mso-ignore:colspan'></td>
  <td class=xl42 colspan=3 align=left style='mso-ignore:colspan'>W/H Name :<font
  class="font11"><%=wh_name%></font><font class="font9"><span
  style='mso-spacerun:yes'>  </span></font></td>
  <td class=xl44></td>
  <td class=xl45 colspan=3 style='mso-ignore:colspan'>Date :<font class="font11">
  <%= c %>/<%= b %>/<%= a %></font></td>
  <td colspan=4 class=xl32 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl25 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl60 width=80 style='height:30.0pt;width:60pt'>Item Code</td>
  <td class=xl61 width=160 style='width:120pt'>Item Name</td>
  <td class=xl61 width=45 style='width:34pt'>UOM</td>
  <td class=xl61 width=70 style='width:53pt'>ACC Code</td>
  <td class=xl61 width=75 style='width:56pt'>Begin Qty</td>
  <td class=xl61 width=75 style='width:56pt'>Begin Amt</td>
  <td class=xl61 width=75 style='width:56pt'>In Qty</td>
  <td class=xl61 width=75 style='width:56pt'>In Amt</td>
  <td class=xl61 width=75 style='width:56pt'>Trans In Qty</td>
  <td class=xl61 width=75 style='width:56pt'>Transfer Amt</td>
  <td class=xl61 width=75 style='width:56pt'>Out Qty</td>
  <td class=xl61 width=75 style='width:56pt'>Out Amt</td>
  <td class=xl61 width=75 style='width:56pt'>Trans Out Qty</td>
  <td class=xl61 width=75 style='width:56pt'>Trans Out Amt</td>
  <td class=xl61 width=75 style='width:56pt'>End Qty</td>
  <td class=xl61 width=75 style='width:56pt'>End Amt</td>
  <td colspan=4 class=xl59 style='mso-ignore:colspan'></td>
 </tr>
 <%
     double to1 = 0, to2 = 0, to3 = 0, to4 = 0, to5 = 0, to6 = 0, to7 = 0, to8 = 0, to9 = 0, to10 = 0, to11 = 0, to12 = 0;
     for (int i = 0; i < dt.Rows.Count; i++)
     {
         to1 = to1 + CommondLib.ConvertToDbl(dt.Rows[i]["begin_qty"]);
         to2 = to2 + CommondLib.ConvertToDbl(dt.Rows[i]["begin_amount"]);
         to3 = to3 + CommondLib.ConvertToDbl(dt.Rows[i]["in_qty"]);
         to4 = to4 + CommondLib.ConvertToDbl(dt.Rows[i]["in_amount"]);
         to5 = to5 + CommondLib.ConvertToDbl(dt.Rows[i]["others_in_qty"]);
         to6 = to6 + CommondLib.ConvertToDbl(dt.Rows[i]["other_in_amount"]);
         to7 = to7 + CommondLib.ConvertToDbl(dt.Rows[i]["out_qty"]);
         to8 = to8 + CommondLib.ConvertToDbl(dt.Rows[i]["out_amount"]);
         to9 = to9 + CommondLib.ConvertToDbl(dt.Rows[i]["others_out_qty"]);
         to10 = to10 + CommondLib.ConvertToDbl(dt.Rows[i]["other_out_amount"]);
         to11 = to11 + CommondLib.ConvertToDbl(dt.Rows[i]["end_qty"]);
         to12 = to12 + CommondLib.ConvertToDbl(dt.Rows[i]["end_amount"]);
        %>
        
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl33 align=left style='height:22.5pt'><%=dt.Rows[i]["item_code"] %></td>
  <td class=xl34 align=left width=160 style='width:120pt'><%=dt.Rows[i]["item_name"] %></td>
  <td class=xl35><%=dt.Rows[i]["uom"] %></td>
  <td class=xl39 width=70 style='width:53pt'><%=dt.Rows[i]["ac_cd"] %></td>
  <td class=xl40 align=right x:num><%=dt.Rows[i]["begin_qty"] %></td>
  <td class=xl55 align=right x:num><%=dt.Rows[i]["begin_amount"] %></td>
  <td class=xl46 align=right x:num><%=dt.Rows[i]["in_qty"] %></td>
  <td class=xl57 align=right x:num><%=dt.Rows[i]["in_amount"] %></td>
  <td class=xl46 align=right x:num><%=dt.Rows[i]["others_in_qty"] %></td>
  <td class=xl57 align=right x:num><%=dt.Rows[i]["other_in_amount"] %></td>
  <td class=xl47 align=right x:num><%=dt.Rows[i]["out_qty"] %></td>
  <td class=xl48 align=right x:num><%=dt.Rows[i]["out_amount"] %></td>
  <td class=xl47 align=right x:num><%=dt.Rows[i]["others_out_qty"] %></td>
  <td class=xl56 align=right x:num><%=dt.Rows[i]["other_out_amount"]%></td>
  <td class=xl40 align=right x:num><%=dt.Rows[i]["end_qty"]%></td>
  <td class=xl55 align=right x:num><%=dt.Rows[i]["end_amount"]%></td>
  <td colspan=4 style='mso-ignore:colspan'></td>
 </tr>
        <%
     }
      %>
 
 <tr class=xl54 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=4 height=25 class=xl49 style='border-right:.5pt solid black;
  height:18.75pt'>Total</td>
  <td class=xl52 align=right x:num><%=to1 %></td>
  <td class=xl58 align=right x:num><%=to2 %></td>
  <td class=xl62 align=right x:num><%=to3 %></td>
  <td class=xl63 align=right x:num><%=to4 %></td>
  <td class=xl62 align=right x:num><%=to5 %></td>
  <td class=xl63 align=right x:num><%=to6 %></td>
  <td class=xl64 align=right x:num><%=to7 %></td>
  <td class=xl65 align=right x:num><%=to8 %></td>
  <td class=xl64 align=right x:num><%=to9 %></td>
  <td class=xl65 align=right x:num><%=to10 %></td>
  <td class=xl52 align=right x:num><%=to11 %></td>
  <td class=xl58 align=right x:num><%=to12 %></td>
  <td colspan=3 class=xl53 style='mso-ignore:colspan'></td>
  <td class=xl54></td>
 </tr>
 <tr height=14 style='height:10.5pt'>
  <td height=14 colspan=20 class=xl25 style='height:10.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=14 style='height:10.5pt'>
  <td height=14 colspan=20 class=xl25 style='height:10.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=14 style='height:10.5pt'>
  <td height=14 colspan=20 class=xl25 style='height:10.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=14 style='height:10.5pt'>
  <td height=14 colspan=20 class=xl25 style='height:10.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=14 style='height:10.5pt'>
  <td height=14 colspan=20 class=xl25 style='height:10.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=14 style='height:10.5pt'>
  <td height=14 colspan=20 class=xl25 style='height:10.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=14 style='height:10.5pt'>
  <td height=14 colspan=20 class=xl25 style='height:10.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=14 style='height:10.5pt'>
  <td height=14 colspan=20 class=xl25 style='height:10.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=14 style='height:10.5pt'>
  <td height=14 colspan=11 class=xl25 style='height:10.5pt;mso-ignore:colspan'></td>
  <td class=xl41></td>
  <td colspan=8 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=80 style='width:60pt'></td>
  <td width=160 style='width:120pt'></td>
  <td width=45 style='width:34pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=56 style='width:42pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
