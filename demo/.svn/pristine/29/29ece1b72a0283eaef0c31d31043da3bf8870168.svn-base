<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8";
    Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel"
    xmlns="http://www.w3.org/TR/REC-html40">
<% 
    string master_pk = Request.QueryString["req_pk"];
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="ProgId" content="Excel.Sheet">
    <meta name="Generator" content="Microsoft Excel 11">
    <link rel="File-List" href="Packing%20list_files/filelist.xml">
    <link rel="Edit-Time-Data" href="Packing%20list_files/editdata.mso">
    <link rel="OLE-Object-Data" href="Packing%20list_files/oledata.mso">
    <!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Mr Khanh</o:LastAuthor>
  <o:LastPrinted>2011-01-04T10:13:20Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2011-01-04T10:13:26Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
    <style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.25in 0in .25in .75in;
	mso-header-margin:.5in;
	mso-footer-margin:0in;}
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
.xl65
	{mso-style-parent:style0;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl66
	{mso-style-parent:style0;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl67
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl68
	{mso-style-parent:style0;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl69
	{mso-style-parent:style0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl70
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl71
	{mso-style-parent:style0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl72
	{mso-style-parent:style0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl73
	{mso-style-parent:style0;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl74
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl75
	{mso-style-parent:style0;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl76
	{mso-style-parent:style0;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl77
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl78
	{mso-style-parent:style0;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl79
	{mso-style-parent:style0;
	border:1.0pt solid windowtext;}
.xl80
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:1.0pt solid windowtext;}
.xl81
	{mso-style-parent:style0;
	mso-number-format:"Medium Date";
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl82
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl83
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;}
.xl84
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl85
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl86
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl87
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl88
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl89
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl90
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	border:1.0pt solid windowtext;}
.xl91
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	border:1.0pt solid windowtext;}
.xl92
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl93
	{mso-style-parent:style0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl94
	{mso-style-parent:style0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl95
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl96
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl97
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl98
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl99
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:1.0pt solid windowtext;}
.xl100
	{mso-style-parent:style0;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl101
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	font-size:20.0pt;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl111
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl112
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl113
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl114
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl115
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl116
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl117
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl118
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl119
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl120
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl121
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl122
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl123
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl124
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
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
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>256</x:PaperSizeIndex>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>13</x:ActiveRow>
       <x:RangeSelection>$14:$14</x:RangeSelection>
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
</xml><![endif]-->
</head>
<body link="blue" vlink="purple">
    <table x:str border="0" cellpadding="0" cellspacing="0" width="683" style='border-collapse: collapse;
        table-layout: fixed; width: 514pt'>
        <col width="64" span="6" style='width: 48pt'>
        <col width="77" style='mso-width-source: userset; mso-width-alt: 2816; width: 58pt'>
        <col width="74" span="3" style='mso-width-source: userset; mso-width-alt: 2706; width: 56pt'>
        <tr height="35" style='mso-height-source: userset; height: 26.25pt'>
            <td colspan="10" height="35" class="xl110" width="683" style='height: 26.25pt; width: 514pt'>
                PACKING LIST</td>
        </tr>
        <tr height="18" style='height: 13.5pt'>
            <td height="18" colspan="10" style='height: 13.5pt; mso-ignore: colspan'>
            </td>
        </tr>
        <%
            DataTable dt = CtlLib.TableReadOpenCursor("sale.sp_rpt_dscd00031", "'" + master_pk + "'");
            DataTable dt1 = CtlLib.TableReadOpenCursor("sale.sp_rpt_dscd00031_1", "'" + master_pk + "'");  
        %>
        <tr height="20" style='mso-height-source: userset; height: 15.0pt'>
            <td height="20" class="xl87" colspan="2" style='height: 15.0pt; mso-ignore: colspan'>
                Shipper/Export</td>
            <td class="xl65">
                &nbsp;</td>
            <td class="xl65">
                &nbsp;</td>
            <td class="xl65">
                &nbsp;</td>
            <td class="xl65">
                &nbsp;</td>
            <td class="xl66">
                &nbsp;</td>
            <td class="xl87" colspan="2" style='mso-ignore: colspan'>
                No.&amp; date of Invoice</td>
            <td class="xl66">
                &nbsp;</td>
        </tr>
        <tr height="23" style='mso-height-source: userset; height: 17.25pt'>
            <td height="23" class="xl77" style='height: 17.25pt'>
                DEAWON CHEMICAL VINA Co., LTD</td>
            <td colspan="5" style='mso-ignore: colspan'>
            </td>
            <td class="xl68">
                &nbsp;</td>
            <td class="xl85" colspan="2" style='mso-ignore: colspan'>
                <%= dt.Rows[0]["slip_no"] %>
            </td>
            <td class="xl81" align="right">
                <%= dt.Rows[0]["out_date"] %>
            </td>
        </tr>
        <tr height="23" style='mso-height-source: userset; height: 17.25pt'>
            <td height="23" class="xl67" colspan="2" style='height: 17.25pt; mso-ignore: colspan'>
                LONGTHANH INDUSTRIAL ZONE,</td>
            <td colspan="4" style='mso-ignore: colspan'>
            </td>
            <td class="xl68">
                &nbsp;</td>
            <td class="xl89" colspan="2" style='mso-ignore: colspan'>
                No.&amp; date of L/C</td>
            <td class="xl68">
                &nbsp;</td>
        </tr>
        <tr height="23" style='mso-height-source: userset; height: 17.25pt'>
            <td height="23" class="xl67" colspan="6" style='height: 17.25pt; mso-ignore: colspan'>
                LONGTHANH DISTRICT, DONGNAI PROVINCE, VIETNAM</td>
            <td class="xl68">
                &nbsp;</td>
            <td class="xl69" style='border-left: none'>
                &nbsp;</td>
            <td>
            </td>
            <td class="xl68">
                &nbsp;</td>
        </tr>
        <tr height="23" style='mso-height-source: userset; height: 17.25pt'>
            <td height="23" class="xl74" style='height: 17.25pt'>
                &nbsp;</td>
            <td class="xl72">
                &nbsp;</td>
            <td class="xl72">
                &nbsp;</td>
            <td class="xl72">
                &nbsp;</td>
            <td class="xl72">
                &nbsp;</td>
            <td class="xl72">
                &nbsp;</td>
            <td class="xl73">
                &nbsp;</td>
            <td class="xl82" style='border-left: none'>
                Remark:<%= dt.Rows[0]["remark"] %></td>
            <td class="xl75">
                &nbsp;</td>
            <td class="xl76">
                &nbsp;</td>
        </tr>
        <tr height="20" style='mso-height-source: userset; height: 15.0pt'>
            <td height="20" class="xl87" style='height: 15.0pt; border-top: none'>
                The Buyer:</td>
            <td class="xl65" style='border-top: none'>
                &nbsp;</td>
            <td class="xl65" style='border-top: none'>
                &nbsp;</td>
            <td class="xl65" style='border-top: none'>
                &nbsp;</td>
            <td class="xl65" style='border-top: none'>
                &nbsp;</td>
            <td class="xl65" style='border-top: none'>
                &nbsp;</td>
            <td class="xl68">
                &nbsp;</td>
            <td class="xl69" style='border-left: none'>
                &nbsp;</td>
            <td>
            </td>
            <td class="xl68">
                &nbsp;</td>
        </tr>
        <tr height="23" style='mso-height-source: userset; height: 17.25pt'>
            <td height="23" class="xl77" style='height: 17.25pt'>
                <%= dt.Rows[0]["partner_name"] %>
            </td>
            <td colspan="5" style='mso-ignore: colspan'>
            </td>
            <td class="xl68">
            </td>
            <td colspan="3" rowspan="9" class="xl101" width="222" style='border-right: 1.0pt solid black;
                border-bottom: 1.0pt solid black; width: 168pt' x:str="* T/T 90 saidhjklahd hiadlah jh jkhjkh hio hih iug uigygiu yh ii uou po ">
                * T/T 90 saidhjklahd hiadlah jh jkhjkh hio hih iug uigygiu yh ii uou po<span style='mso-spacerun: yes'>
                </span>
            </td>
        </tr>
        <tr height="23" style='mso-height-source: userset; height: 17.25pt'>
            <td colspan="7" rowspan="2" height="46" class="xl107" width="461" style='border-right: 1.0pt solid black;
                height: 34.5pt; width: 346pt'>
                <%= dt.Rows[0]["addr1"] %>
            </td>
        </tr>
        <tr height="23" style='mso-height-source: userset; height: 17.25pt'>
        </tr>
        <tr height="20" style='mso-height-source: userset; height: 15.0pt'>
            <td height="20" class="xl74" colspan="2" style='height: 15.0pt; mso-ignore: colspan'>
                TEL:
                <%= dt.Rows[0]["phone_no"] %>
                , FAX:
                <%= dt.Rows[0]["fax_no"] %>
            </td>
            <td class="xl72">
                &nbsp;</td>
            <td class="xl72">
                &nbsp;</td>
            <td class="xl72">
                &nbsp;</td>
            <td class="xl72">
                &nbsp;</td>
            <td class="xl73">
                &nbsp;</td>
        </tr>
        <tr height="20" style='mso-height-source: userset; height: 15.0pt'>
            <td height="20" class="xl87" style='height: 15.0pt; border-top: none'>
                Delivery to:</td>
            <td class="xl65" style='border-top: none'>
                &nbsp;</td>
            <td class="xl65" style='border-top: none'>
                &nbsp;</td>
            <td class="xl65" style='border-top: none'>
                &nbsp;</td>
            <td class="xl65" style='border-top: none'>
                &nbsp;</td>
            <td class="xl65" style='border-top: none'>
                &nbsp;</td>
            <td class="xl68">
                &nbsp;</td>
        </tr>
        <tr height="23" style='mso-height-source: userset; height: 17.25pt'>
            <td height="23" class="xl77" colspan="2" style='height: 17.25pt; mso-ignore: colspan'>
                <%= dt.Rows[0]["partner_name_1"] %>
            </td>
            <td colspan="4" style='mso-ignore: colspan'>
            </td>
            <td class="xl68">
                &nbsp;</td>
        </tr>
        <tr height="23" style='mso-height-source: userset; height: 17.25pt'>
            <td colspan="7" rowspan="2" height="46" class="xl107" width="461" style='border-right: 1.0pt solid black;
                height: 34.5pt; width: 346pt'>
                <%= dt.Rows[0]["addr1_1"] %>
            </td>
        </tr>
        <tr height="23" style='mso-height-source: userset; height: 17.25pt'>
        </tr>
        <tr height="20" style='mso-height-source: userset; height: 15.0pt'>
            <td height="20" class="xl74" colspan="2" style='height: 15.0pt; mso-ignore: colspan'>
                TEL:
                <%= dt.Rows[0]["phone_no_1"] %>
                , FAX:
                <%= dt.Rows[0]["fax_no_1"] %>
            </td>
            <td class="xl72">
                &nbsp;</td>
            <td class="xl72">
                &nbsp;</td>
            <td class="xl72">
                &nbsp;</td>
            <td class="xl72">
                &nbsp;</td>
            <td class="xl73">
                &nbsp;</td>
        </tr>
        <tr height="22" style='mso-height-source: userset; height: 16.5pt'>
            <td height="22" class="xl87" colspan="2" style='height: 16.5pt; mso-ignore: colspan'>
                Port of loading</td>
            <td class="xl65" style='border-top: none'>
                &nbsp;</td>
            <td class="xl66" style='border-top: none'>
                &nbsp;</td>
            <td class="xl88" colspan="2" style='mso-ignore: colspan'>
                Final destination</td>
            <td class="xl68">
                &nbsp;</td>
            <td class="xl89" colspan="2" style='mso-ignore: colspan'>
                Terms of delivery</td>
            <td class="xl68">
                &nbsp;</td>
        </tr>
        <tr height="5" style='mso-height-source: userset; height: 3.75pt'>
            <td height="5" class="xl67" style='height: 3.75pt'>
                &nbsp;</td>
            <td colspan="2" style='mso-ignore: colspan'>
            </td>
            <td class="xl68">
                &nbsp;</td>
            <td class="xl70">
            </td>
            <td>
            </td>
            <td class="xl68">
                &nbsp;</td>
            <td class="xl67" style='border-left: none'>
                &nbsp;</td>
            <td>
            </td>
            <td class="xl68">
                &nbsp;</td>
        </tr>
        <tr height="22" style='mso-height-source: userset; height: 16.5pt'>
            <td height="22" class="xl74" colspan="2" style='height: 16.5pt; mso-ignore: colspan'>
                <%= dt.Rows[0]["loading_port"] %>
            </td>
            <td class="xl72">
                &nbsp;</td>
            <td class="xl73">
                &nbsp;</td>
            <td colspan="3" class="xl114" style='border-right: 1.0pt solid black; border-left: none'>
                <%= dt.Rows[0]["dest_nation"] %>
            </td>
            <td colspan="3" rowspan="3" class="xl120" style='border-right: 1.0pt solid black;
                border-bottom: 1.0pt solid black'>
                <%= dt.Rows[0]["deli_term"] %>
            </td>
        </tr>
        <tr height="22" style='mso-height-source: userset; height: 16.5pt'>
            <td height="22" class="xl87" style='height: 16.5pt; border-top: none'>
                Carrier</td>
            <td class="xl65" style='border-top: none'>
                &nbsp;</td>
            <td class="xl65" style='border-top: none'>
                &nbsp;</td>
            <td class="xl66" style='border-top: none'>
                &nbsp;</td>
            <td colspan="3" class="xl117" style='border-right: 1.0pt solid black; border-left: none'>
                Sailing on or about</td>
        </tr>
        <tr height="22" style='mso-height-source: userset; height: 16.5pt'>
            <td height="22" class="xl71" style='height: 16.5pt'>
                <%= dt.Rows[0]["carrier"] %>
            </td>
            <td class="xl72">
                &nbsp;</td>
            <td class="xl72">
                &nbsp;</td>
            <td class="xl73">
                &nbsp;</td>
            <td colspan="3" class="xl114" style='border-right: 1.0pt solid black; border-left: none'>
                <%= dt.Rows[0]["sailing_dt"] %>
            </td>
        </tr>
        <tr height="26" style='mso-height-source: userset; height: 19.5pt'>
            <td height="26" class="xl99" style='height: 19.5pt; border-top: none'>
                Roll. No.</td>
            <td class="xl99" style='border-top: none; border-left: none'>
                Total Roll</td>
            <td colspan="4" class="xl111">
                Goods description</td>
            <td class="xl100">
                &nbsp;</td>
            <td class="xl99" style='border-top: none; border-left: none'>
                Quantity</td>
            <td class="xl99" style='border-top: none; border-left: none'>
                N.W</td>
            <td class="xl99" style='border-top: none; border-left: none'>
                G.W</td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td height="17" class="xl78" style='height: 12.75pt'>
                &nbsp;</td>
            <td class="xl78" style='border-left: none'>
                &nbsp;</td>
            <td colspan="4" style='mso-ignore: colspan'>
            </td>
            <td class="xl66" style='border-top: none'>
                &nbsp;</td>
            <td class="xl86" style='border-top: none; border-left: none'>
                MET</td>
            <td class="xl86" style='border-top: none; border-left: none'>
                KGS</td>
            <td class="xl86" style='border-top: none; border-left: none'>
                KGS</td>
        </tr>
        <tr height="22" style='mso-height-source: userset; height: 16.5pt'>
            <td height="22" class="xl78" style='height: 16.5pt'>
                &nbsp;</td>
            <td class="xl78" style='border-left: none'>
                &nbsp;</td>
            <td class="xl97">
                TSTSSD</td>
            <td colspan="3" class="xl83" style='mso-ignore: colspan'>
            </td>
            <td class="xl84">
                &nbsp;</td>
            <td class="xl92" style='border-left: none'>
                &nbsp;</td>
            <td class="xl92" style='border-left: none'>
                &nbsp;</td>
            <td class="xl92" style='border-left: none'>
                &nbsp;</td>
        </tr>
        <tr height="22" style='mso-height-source: userset; height: 16.5pt'>
            <td height="22" class="xl78" style='height: 16.5pt'>
                &nbsp;</td>
            <td class="xl78" style='border-left: none'>
                &nbsp;</td>
            <td class="xl96" colspan="2" style='mso-ignore: colspan'>
                (UITIGUIOOLJ)</td>
            <td colspan="2" class="xl83" style='mso-ignore: colspan'>
            </td>
            <td class="xl84">
                &nbsp;</td>
            <td class="xl92" style='border-left: none'>
                &nbsp;</td>
            <td class="xl92" style='border-left: none'>
                &nbsp;</td>
            <td class="xl92" style='border-left: none'>
                &nbsp;</td>
        </tr>
        <%  decimal total_met = 0, total_kgs = 0, total_kgs2 = 0;
            string roll_no = string.Empty;
            int c1 = 0, c2 = 0;
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                    if (i == 0)
                    {
                        c1 = Convert.ToInt32(dt1.Rows[i]["total_roll"]);
                        c2 = Convert.ToInt32(dt1.Rows[i]["total_roll"]);
                        roll_no = c1.ToString();
                    }
                    else
                    {
                        c1 = c1 + Convert.ToInt32(dt1.Rows[i - 1]["total_roll"]);
                        c2 = c2 + Convert.ToInt32(dt1.Rows[i]["total_roll"]);
                        if (c1.Equals(c2) == true)
                        {
                            roll_no = c1.ToString();
                        }
                        else
                        {
                            roll_no = c1.ToString() + " - " + c2.ToString(); 
                        }
                    }  
        %>
        <tr height="22" style='mso-height-source: userset; height: 16.5pt'>
            <td height="22" class="xl95" style='height: 16.5pt; text-align:center' >
                <%= roll_no %>
            </td>
            <td class="xl95" style='border-left: none' x:num>
                <%= dt1.Rows[i]["total_roll"]%>
            </td>
            <td class="xl98" colspan="2" style='mso-ignore: colspan'>
                <%= dt1.Rows[i]["item_name"]%>
            </td>
            <td colspan="2" class="xl83" style='mso-ignore: colspan'>
            </td>
            <td class="xl84">
                &nbsp;</td>
            <td class="xl93" style='border-left: none' x:num>
                <%= dt1.Rows[i]["out_qty"]%>
            </td>
            <td class="xl94" style='border-left: none' x:num>
                <%= dt1.Rows[i]["net_qty"]%>
            </td>
            <td class="xl94" style='border-left: none' x:num>
                <%= dt1.Rows[i]["gross_qty"]%>
            </td>
        </tr>
        <%
            total_met += Convert.ToDecimal(dt1.Rows[i]["out_qty"]);
            total_kgs += Convert.ToDecimal(dt1.Rows[i]["net_qty"]);
            total_kgs2 += Convert.ToDecimal(dt1.Rows[i]["gross_qty"]);
        } %>
        <tr height="22" style='mso-height-source: userset; height: 16.5pt'>
            <td height="22" class="xl95" style='height: 16.5pt'>
                &nbsp;</td>
            <td class="xl95" style='border-left: none'>
                &nbsp;</td>
            <td class="xl98">
            </td>
            <td colspan="3" class="xl83" style='mso-ignore: colspan'>
            </td>
            <td class="xl84">
                &nbsp;</td>
            <td class="xl93" style='border-left: none'>
                &nbsp;</td>
            <td class="xl94" style='border-left: none'>
                &nbsp;</td>
            <td class="xl94" style='border-left: none'>
                &nbsp;</td>
        </tr>
        <tr height="18" style='height: 13.5pt'>
            <td height="18" class="xl80" style='height: 13.5pt'>
                <%= c2 %>
                ROOLS</td>
            <td class="xl79" style='border-left: none'>
                &nbsp;</td>
            <td colspan="4" class="xl112" style='border-left: none'>
                TOTAL</td>
            <td class="xl76">
                &nbsp;</td>
            <td class="xl90" style='border-left: none' x:num>
                <%= total_met%>
            </td>
            <td class="xl91" style='border-left: none' x:num>
                <%= total_kgs %>
            </td>
            <td class="xl91" style='border-left: none' x:num>
                <%=  total_kgs2 %>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td height="17" class="xl65" style='height: 12.75pt; border-top: none'>
                &nbsp;</td>
            <td colspan="9" style='mso-ignore: colspan'>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td height="17" colspan="10" style='height: 12.75pt; mso-ignore: colspan'>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td height="17" colspan="10" style='height: 12.75pt; mso-ignore: colspan'>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td height="17" colspan="10" style='height: 12.75pt; mso-ignore: colspan'>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td height="17" colspan="10" style='height: 12.75pt; mso-ignore: colspan'>
            </td>
        </tr>
        <![if supportMisalignedColumns]>
        <tr height="0" style='display: none'>
            <td width="64" style='width: 48pt'>
            </td>
            <td width="64" style='width: 48pt'>
            </td>
            <td width="64" style='width: 48pt'>
            </td>
            <td width="64" style='width: 48pt'>
            </td>
            <td width="64" style='width: 48pt'>
            </td>
            <td width="64" style='width: 48pt'>
            </td>
            <td width="77" style='width: 58pt'>
            </td>
            <td width="74" style='width: 56pt'>
            </td>
            <td width="74" style='width: 56pt'>
            </td>
            <td width="74" style='width: 56pt'>
            </td>
        </tr>
        <![endif]>
    </table>
</body>
</html>
