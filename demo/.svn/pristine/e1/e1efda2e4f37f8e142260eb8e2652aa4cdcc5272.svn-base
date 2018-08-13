<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser("prod");
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel"
    xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string p_from_date = Request.QueryString["from_date"];
    string p_to_date = Request.QueryString["to_date"];
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="ProgId" content="Excel.Sheet">
    <meta name="Generator" content="Microsoft Excel 11">
    <link rel="File-List" href="rpt_bisc00040_bkvina04_files/filelist.xml">
    <link rel="Edit-Time-Data" href="rpt_bisc00040_bkvina04_files/editdata.mso">
    <link rel="OLE-Object-Data" href="rpt_bisc00040_bkvina04_files/oledata.mso">
    <!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Mr. Khanh</o:LastAuthor>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2010-09-23T03:59:00Z</o:LastSaved>
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
.xl24
	{mso-style-parent:style0;
	border:.5pt solid windowtext;}
.xl25
	{mso-style-parent:style0;
	mso-number-format:Standard;
	border:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	color:blue;
	text-align:center;
	border:.5pt solid windowtext;
	background:#CCFFCC;
	mso-pattern:auto none;}
.xl27
	{mso-style-parent:style0;
	color:red;
	font-size:18.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl28
	{mso-style-parent:style0;
	border:.5pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl29
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	border:.5pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;}	
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
       <x:ActiveRow>8</x:ActiveRow>
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
  <x:WindowHeight>9300</x:WindowHeight>
  <x:WindowWidth>15135</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:AcceptLabelsInFormulas/>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>
<body link="blue" vlink="purple">
    <table x:str border="0" cellpadding="0" cellspacing="0" width="582" style='border-collapse: collapse;
        table-layout: fixed; width: 437pt'>
        <col width="80" style='mso-width-source: userset; mso-width-alt: 2925; width: 60pt'>
        <col width="67" style='mso-width-source: userset; mso-width-alt: 2450; width: 50pt'>
        <col width="73" style='mso-width-source: userset; mso-width-alt: 2669; width: 55pt'>
        <col width="80" style='mso-width-source: userset; mso-width-alt: 2925; width: 60pt'>
        <col width="90" style='mso-width-source: userset; mso-width-alt: 3291; width: 68pt'>
        <col width="64" span="3" style='width: 48pt'>
        <tr height="31" style='height: 23.25pt'>
            <td colspan="8" height="31" class="xl27" width="582" style='height: 23.25pt; width: 437pt'>
                Delivery Report</td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td height="17" class="xl26" style='height: 12.75pt; border-top: none'>
                Item Code</td>
            <td class="xl26" style='border-top: none; border-left: none'>
                Spec NM</td>
            <td class="xl26" style='border-top: none; border-left: none'>
                Begin Qty</td>
            <td class="xl26" style='border-top: none; border-left: none'>
                In Qty</td>
            <td class="xl26" style='border-top: none; border-left: none'>
                Exchange Qty</td>
            <td class="xl26" style='border-top: none; border-left: none'>
                Deli Qty</td>
            <td class="xl26" style='border-top: none; border-left: none'>
                Out Qty</td>
            <td class="xl26" style='border-top: none; border-left: none'>
                End Qty</td>
        </tr>
        <%
            string para = "'" + p_from_date + "','" + p_to_date + "'";
            DataTable dt;
            dt = CtlLib.TableReadOpenCursor("INV.sp_rpt_bisc00040_bkvina04", para);

            decimal TotalBeginQty = 0;
            decimal TotalInQty = 0;
            decimal TotalExchangeQty = 0;
            decimal TotalDeliQty = 0;
            decimal TotalOutQty = 0;
            decimal TotalEndQty = 0;
            
            for (int i = 0; i < dt.Rows.Count; i++)
            {
        %>
        <tr height="17" style='height: 12.75pt'>
            <td height="17" class="xl24" style='height: 12.75pt; border-top: none'>
                <%= dt.Rows[i]["item_code"] %>
            </td>
            <td class="xl24" style='border-top: none; border-left: none'>
                <%= dt.Rows[i]["spec_nm"] %>
            </td>
            <td class="xl25" align="right" style='border-top: none; border-left: none' x:num>
                <%= dt.Rows[i]["begin_qty"] %>
            </td>
            <td class="xl25" align="right" style='border-top: none; border-left: none' x:num>
                <%= dt.Rows[i]["in_qty"] %>
            </td>
            <td class="xl25" align="right" style='border-top: none; border-left: none' x:num>
                <%= dt.Rows[i]["exchange_qty"] %>
            </td>
            <td class="xl25" align="right" style='border-top: none; border-left: none' x:num>
                <%= dt.Rows[i]["deli_qty"] %>
            </td>
            <td class="xl25" align="right" style='border-top: none; border-left: none' x:num>
                <%= dt.Rows[i]["out_qty"] %>
            </td>
            <td class="xl25" align="right" style='border-top: none; border-left: none' x:num>
                <%= dt.Rows[i]["end_qty"] %>
            </td>
        </tr>
        <% 
            TotalBeginQty += Convert.ToDecimal(dt.Rows[i]["begin_qty"]);
            TotalInQty += Convert.ToDecimal(dt.Rows[i]["in_qty"]);
            TotalExchangeQty += Convert.ToDecimal(dt.Rows[i]["exchange_qty"]);
            TotalDeliQty += Convert.ToDecimal(dt.Rows[i]["deli_qty"]);
            TotalOutQty += Convert.ToDecimal(dt.Rows[i]["out_qty"]);
            TotalEndQty += Convert.ToDecimal(dt.Rows[i]["end_qty"]);  
            } %>
        <tr height="17" style='height: 12.75pt'>
            <td height="17" class="xl28" style='height: 12.75pt; border-top: none'>
                &nbsp;</td>
            <td class="xl28" style='border-top: none; border-left: none'>
                &nbsp;</td>
            <td class="xl29" align="right" style='border-top: none; border-left: none' x:num>
                <%=TotalBeginQty %></td>
            <td class="xl29" align="right" style='border-top: none; border-left: none' x:num>
                <%=TotalInQty %></td>
            <td class="xl29" align="right" style='border-top: none; border-left: none' x:num>
                <%=TotalExchangeQty %></td>
            <td class="xl29" align="right" style='border-top: none; border-left: none' x:num>
                <%=TotalDeliQty %></td>
            <td class="xl29" align="right" style='border-top: none; border-left: none' x:num>
                <%=TotalOutQty %></td>
            <td class="xl29" align="right" style='border-top: none; border-left: none' x:num>
                <%=TotalEndQty %></td>
        </tr>
        <![if supportMisalignedColumns]>
        <tr height="0" style='display: none'>
            <td width="80" style='width: 60pt'>
            </td>
            <td width="67" style='width: 50pt'>
            </td>
            <td width="73" style='width: 55pt'>
            </td>
            <td width="80" style='width: 60pt'>
            </td>
            <td width="90" style='width: 68pt'>
            </td>
            <td width="64" style='width: 48pt'>
            </td>
            <td width="64" style='width: 48pt'>
            </td>
            <td width="64" style='width: 48pt'>
            </td>
        </tr>
        <![endif]>
    </table>
</body>
</html>
