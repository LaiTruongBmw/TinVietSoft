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
<link rel=File-List href="rpt_epfm00050_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_epfm00050_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_epfm00050_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>VINAGENUWIN</o:Author>
  <o:LastAuthor>Mr. Khanh</o:LastAuthor>
  <o:LastPrinted>2010-10-13T07:54:26Z</o:LastPrinted>
  <o:Created>2010-09-10T10:47:34Z</o:Created>
  <o:LastSaved>2010-10-13T07:54:37Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.34in .16in .21in .17in;
	mso-header-margin:.26in;
	mso-footer-margin:.16in;}
.font6
	{color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font8
	{color:windowtext;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font9
	{color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font10
	{color:windowtext;
	font-size:11.0pt;
	font-weight:700;
	font-style:italic;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font15
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
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
	font-family:Arial;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal_PNAP;}
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
	{mso-style-parent:style21;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl26
	{mso-style-parent:style21;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl27
	{mso-style-parent:style21;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl28
	{mso-style-parent:style21;
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
.xl29
	{mso-style-parent:style21;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl30
	{mso-style-parent:style16;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	font-weight:700;}
.xl32
	{mso-style-parent:style21;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:normal;}
.xl33
	{mso-style-parent:style21;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl34
	{mso-style-parent:style21;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-size:23.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl36
	{mso-style-parent:style21;
	font-size:11.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl37
	{mso-style-parent:style21;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl38
	{mso-style-parent:style21;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl39
	{mso-style-parent:style21;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;}
.xl40
	{mso-style-parent:style21;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl41
	{mso-style-parent:style21;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl42
	{mso-style-parent:style21;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl43
	{mso-style-parent:style21;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl44
	{mso-style-parent:style21;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl45
	{mso-style-parent:style21;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl46
	{mso-style-parent:style21;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl47
	{mso-style-parent:style21;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl48
	{mso-style-parent:style21;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl49
	{mso-style-parent:style21;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl50
	{mso-style-parent:style21;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl51
	{mso-style-parent:style21;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl52
	{mso-style-parent:style21;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl53
	{mso-style-parent:style21;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl54
	{mso-style-parent:style21;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl55
	{mso-style-parent:style21;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl56
	{mso-style-parent:style16;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl57
	{mso-style-parent:style16;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl58
	{mso-style-parent:style0;
	font-size:9.0pt;}
.xl59
	{mso-style-parent:style21;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl60
	{mso-style-parent:style21;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl61
	{mso-style-parent:style21;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl62
	{mso-style-parent:style21;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl63
	{mso-style-parent:style21;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
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
       <x:ActiveRow>15</x:ActiveRow>
       <x:ActiveCol>15</x:ActiveCol>
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
  <x:WindowHeight>8790</x:WindowHeight>
  <x:WindowWidth>19200</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>255</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=720 style='border-collapse:
 collapse;table-layout:fixed;width:543pt'>
 <col width=30 style='mso-width-source:userset;mso-width-alt:1097;width:23pt'>
 <col width=130 style='mso-width-source:userset;mso-width-alt:4754;width:98pt'>
 <col width=60 style='mso-width-source:userset;mso-width-alt:2194;width:45pt'>
 <col width=45 style='mso-width-source:userset;mso-width-alt:1645;width:34pt'>
 <col width=80 style='mso-width-source:userset;mso-width-alt:2925;width:60pt'>
 <col width=48 style='mso-width-source:userset;mso-width-alt:1755;width:36pt'>
 <col width=36 style='mso-width-source:userset;mso-width-alt:1316;width:27pt'>
 <col width=37 style='mso-width-source:userset;mso-width-alt:1353;width:28pt'>
 <col width=70 style='mso-width-source:userset;mso-width-alt:2560;width:53pt'>
 <col width=73 style='mso-width-source:userset;mso-width-alt:2669;width:55pt'>
 <col width=38 style='mso-width-source:userset;mso-width-alt:1389;width:29pt'>
 <col width=73 style='mso-width-source:userset;mso-width-alt:2669;width:55pt'>
        <%
            DataTable dt2 = CtlLib.TableReadOpenCursor("st_lg__rpt_dscd00070_2", "'" + master_pk + "'");
            DataTable dt;
            dt = CtlLib.TableReadOpenCursor("st_lg__rpt_dscd00070", "'" + master_pk + "'");            

        %> 
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=4 rowspan=4 height=91 class=xl34 width=265 style='height:68.25pt;
  width:200pt'><%= dt2.Rows[0]["partner_name"]%><font class="font6"><br>
    <%=dt2.Rows[0]["addr1"] %><span style='mso-spacerun:yes'></span></font></td>
  <td colspan=8 rowspan=3 class=xl35 width=455 style='width:343pt'>PHIẾU XUẤT KHO<br>
    <font class="font8">( Số : <%= dt.Rows[0]["slip_no"]%> )</font></td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=8 height=25 class=xl36 style='height:18.75pt'>Ngày <font
  class="font10"><%= dt.Rows[0]["dd"]%></font><font class="font9"> tháng </font><font class="font10"><%=dt.Rows[0]["mm"] %>
  </font><font class="font9"> năm </font><font class="font10"><%=dt.Rows[0]["yyyy"] %><span
  style='mso-spacerun:yes'></span></font></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=12 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=6 height=25 class=xl37 style='height:18.75pt'>Bên nhận : <font
  class="font10"><%= dt.Rows[0]["supplier_name"] %><span
  style='mso-spacerun:yes'></span></font></td>
  <td colspan=6 class=xl37>Kho xuất : <font class="font10"><%= dt.Rows[0]["wh_name"] %><span
  style='mso-spacerun:yes'></span></font></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=6 height=25 class=xl37 style='height:18.75pt'>Ghi chú: <%=dt.Rows[0]["description"] %></td>
  <td colspan=6 class=xl37>Số yêu cầu : <font class="font10"><%=dt.Rows[0]["ref_no"]%><span
  style='mso-spacerun:yes'></span></font></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=12 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl58 height=16 style='height:12.0pt'>
  <td rowspan=2 height=48 class=xl38 style='border-bottom:.5pt solid black;
  height:36.0pt'>STT</td>
  <td colspan=3 rowspan=2 class=xl40 width=235 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:177pt'>Tên</td>
  <td rowspan=2 class=xl38 style='border-bottom:.5pt solid black'>Mã số</td>
  <td rowspan=2 class=xl38 style='border-bottom:.5pt solid black'>ĐVT</td>
  <td colspan=2 class=xl60 style='border-right:.5pt solid black;border-left:
  none'>Số lượng</td>
  <td rowspan=2 class=xl38 style='border-bottom:.5pt solid black'>Đơn giá</td>
  <td rowspan=2 class=xl38 style='border-bottom:.5pt solid black'>Thành tiền</td>
  <td rowspan=2 class=xl62 width=38 style='border-bottom:.5pt solid black;
  width:29pt'>VAT (%)</td>
  <td rowspan=2 class=xl38 style='border-bottom:.5pt solid black'>Thành tiền</td>
 </tr>
 <tr class=xl58 height=32 style='height:24.0pt'>
  <td height=32 class=xl59 width=36 style='height:24.0pt;width:27pt'>Theo<br>
    c.từ</td>
  <td class=xl59 width=37 style='width:28pt'>Thực<br>
    xuất</td>
 </tr>
 <%
            DataTable dt1;
            dt1 = CtlLib.TableReadOpenCursor("sale.sp_rpt_dscd00070_1", "'" + master_pk + "'");
            decimal ItemAmount = 0;
            decimal TotalAmount = 0;
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                
        %> 
 <tr class=xl58 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl49 width=30 style='height:30.0pt;width:23pt' x:num><%=dt1.Rows[i]["seq"]%></td>
  <td colspan=3 class=xl50 width=235 style='border-right:.5pt solid black;
  border-left:none;width:177pt'><%=dt1.Rows[i]["item_name"]%><font class="font15"><br>
    <%=dt1.Rows[i]["item_lname"] %><span style='mso-spacerun:yes'></span></font></td>
  <td class=xl53 width=80 style='width:60pt'><%=dt1.Rows[i]["item_code"] %></td>
  <td class=xl53 width=48 style='width:36pt'><%=dt1.Rows[i]["out_uom"]%></td>
  <td class=xl54 width=36 style='width:27pt' x:num><%=dt1.Rows[i]["req_qty"] %></td>
  <td class=xl55 width=37 style='width:28pt' x:num><%=dt1.Rows[i]["out_qty"] %></td>
  <td class=xl56 width=70 style='width:53pt' x:num><span
  style='mso-spacerun:yes'></span><%=dt1.Rows[i]["unit_price"] %></td>
  <td class=xl57 width=73 style='width:55pt' x:num><span
  style='mso-spacerun:yes'></span><%=dt1.Rows[i]["item_amount"] %></td>
  <td class=xl56 width=38 style='width:29pt' x:num><span
  style='mso-spacerun:yes'></span><%=dt1.Rows[i]["vat_rate"]%></td>
  <td class=xl57 width=73 style='width:55pt' x:num><span
  style='mso-spacerun:yes'></span><%=dt1.Rows[i]["total_amount"] %></td>
 </tr>
  <%
     ItemAmount += Convert.ToDecimal(dt1.Rows[i]["item_amount"]);
     TotalAmount += Convert.ToDecimal(dt1.Rows[i]["total_amount"]);
            } %>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 class=xl26 width=30 style='height:26.25pt;width:23pt'>&nbsp;</td>
  <td colspan=3 class=xl47 width=235 style='border-right:.5pt solid black;
  border-left:none;width:177pt'>Cộng : </td>
  <td class=xl27 width=80 style='width:60pt'>&nbsp;</td>
  <td class=xl28 width=48 style='width:36pt'>&nbsp;</td>
  <td class=xl29 width=36 style='width:27pt'>&nbsp;</td>
  <td class=xl30 width=37 style='width:28pt'>&nbsp;</td>
  <td class=xl29 width=70 style='width:53pt'>&nbsp;</td>
  <td class=xl57 width=73 style='width:55pt' x:num><span
  style='mso-spacerun:yes'></span><%=ItemAmount%></td>
  <td class=xl29 width=38 style='width:29pt'>&nbsp;</td>
  <td class=xl57 width=73 style='width:55pt' x:num><span
  style='mso-spacerun:yes'></span><%=TotalAmount%></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=12 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 style='height:12.75pt'></td>
  <td class=xl31>Người lập phiếu</td>
  <td></td>
  <td class=xl31 colspan=2 style='mso-ignore:colspan'>Người nhận hàng</td>
  <td colspan=2 style='mso-ignore:colspan'></td>
  <td class=xl31 colspan=2 style='mso-ignore:colspan'>Thủ kho</td>
  <td class=xl31 colspan=3 style='mso-ignore:colspan'><span
  style='mso-spacerun:yes'></span>Giám sát</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=2 class=xl32 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=6 class=xl33 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl32 style='mso-ignore:colspan'></td>
  <td class=xl25></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=2 class=xl32 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=6 class=xl33 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=2 class=xl32 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=6 class=xl33 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 style='height:12.75pt'></td>
  <td><%=dt.Rows[0]["charger_name"]%></td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=30 style='width:23pt'></td>
  <td width=130 style='width:98pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=45 style='width:34pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=48 style='width:36pt'></td>
  <td width=36 style='width:27pt'></td>
  <td width=37 style='width:28pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=38 style='width:29pt'></td>
  <td width=73 style='width:55pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
