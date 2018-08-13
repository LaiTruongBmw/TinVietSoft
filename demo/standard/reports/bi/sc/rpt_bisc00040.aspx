<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser("inv");
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel"
    xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string p_tin_wh = Request.QueryString["p_tin_warehouse_pk"];
    string p_from_date = Request.QueryString["p_from_date"];
    string p_to_date = Request.QueryString["p_to_date"];
    string p_item = Request.QueryString["p_item"]; 
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="ProgId" content="Excel.Sheet">
    <meta name="Generator" content="Microsoft Excel 11">
    <link rel="File-List" href="rpt_bisc00010_files/filelist.xml">
    <link rel="Edit-Time-Data" href="rpt_bisc00010_files/editdata.mso">
    <link rel="OLE-Object-Data" href="rpt_bisc00010_files/oledata.mso">
    <!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Mr. Khanh</o:LastAuthor>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2010-09-14T03:22:30Z</o:LastSaved>
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
	background:#FFCC99;
	mso-pattern:auto none;}
.xl25
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl26
	{mso-style-parent:style0;
	border:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl28
	{mso-style-parent:style0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl29
	{mso-style-parent:style0;
	color:white;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl30
	{mso-style-parent:style0;
	color:white;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl31
	{mso-style-parent:style0;
	color:blue;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid blue;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl32
	{mso-style-parent:style0;
	border-top:.5pt solid blue;
	border-right:none;
	border-bottom:.5pt solid blue;
	border-left:.5pt solid blue;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl33
	{mso-style-parent:style0;
	border-top:.5pt solid blue;
	border-right:none;
	border-bottom:.5pt solid blue;
	border-left:none;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl34
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	border:.5pt solid blue;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl35
	{mso-style-parent:style0;
	border:.5pt solid blue;
	vertical-align:middle;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid blue;}
.xl37
	{mso-style-parent:style0;
	vertical-align:middle;
	border:.5pt solid blue;}
.xl38
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid blue;}
.xl39
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	vertical-align:middle;
	border-top:.5pt solid blue;
	border-right:.5pt solid blue;
	border-bottom:none;
	border-left:.5pt solid blue;}
.xl40
	{mso-style-parent:style0;
	mso-number-format:"\#\,\#\#0\.000";
	vertical-align:middle;
	border-top:.5pt solid blue;
	border-right:.5pt solid blue;
	border-bottom:none;
	border-left:.5pt solid blue;}
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
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>7</x:ActiveRow>
       <x:ActiveCol>8</x:ActiveCol>
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
    <table x:str border="0" cellpadding="0" cellspacing="0" width="13234" style='border-collapse: collapse;
        table-layout: fixed; width: 9926pt'>
        <col width="119" style='mso-width-source: userset; mso-width-alt: 4352; width: 89pt'>
        <col width="85" span="2" style='mso-width-source: userset; mso-width-alt: 3108; width: 64pt'>
        <col width="92" style='mso-width-source: userset; mso-width-alt: 3364; width: 69pt'>
        <col width="272" style='mso-width-source: userset; mso-width-alt: 9947; width: 204pt'>
        <col width="37" style='mso-width-source: userset; mso-width-alt: 1353; width: 28pt'>
        <col width="64" style='width: 48pt'>
        <col width="104" span="8" style='mso-width-source: userset; mso-width-alt: 3803;
            width: 78pt'>
        <col width="64" span="182" style='width: 48pt'>
        <tr class="xl25" height="17" style='height: 12.75pt'>
            <td height="17" class="xl31" width="119" style='height: 12.75pt; width: 89pt'>
                W/H</td>
            <td class="xl31" width="85" style='border-left: none; width: 64pt'>
                Date</td>
            <td class="xl31" width="85" style='border-left: none; width: 64pt'>
                Group</td>
            <td class="xl31" width="92" style='border-left: none; width: 69pt'>
                Item Code</td>
            <td class="xl31" width="272" style='border-left: none; width: 204pt'>
                Item Name</td>
            <td class="xl31" width="37" style='border-left: none; width: 28pt'>
                UOM</td>
            <td class="xl31" width="64" style='border-left: none; width: 48pt'>
                Lot No</td>
            <td class="xl31" width="104" style='border-left: none; width: 78pt'>
                Begin Qty</td>
            <td class="xl31" width="104" style='border-left: none; width: 78pt'>
                Begin Amount</td>
            <td class="xl31" width="104" style='border-left: none; width: 78pt'>
                In Qty</td>
            <td class="xl31" width="104" style='border-left: none; width: 78pt'>
                In Amount</td>
            <td class="xl31" width="104" style='border-left: none; width: 78pt'>
                Out Qty</td>
            <td class="xl31" width="104" style='border-left: none; width: 78pt'>
                Out Amount</td>
            <td class="xl31" width="104" style='border-left: none; width: 78pt'>
                End Qty</td>
            <td class="xl31" width="104" style='border-left: none; width: 78pt'>
                End Amount</td>
        </tr>
        <%
            string para = " '" + p_tin_wh + "','" + p_from_date + "','" + p_to_date + "','" + p_item + "' ";
            DataTable dt;
            dt = CtlLib.TableReadOpenCursor("INV.sp_rpt_bisc00010", para);

            string strWH = string.Empty;
            string strDate = string.Empty;
            string strGroup = string.Empty;

            string strItemCode = string.Empty;
            string strItemName = string.Empty;

            string strUom = string.Empty;
            string strLotNo = string.Empty;
            //======= begin_qty,amount =========
            string strBeginQty = string.Empty;
            string strBeginAmount = string.Empty;
            decimal TotalBeginQty = 0;
            decimal TotalBeginAmount = 0;
            //======= in_qty,amount =========
            string strInQty = string.Empty;
            string strInAmount = string.Empty;
            decimal TotalInQty = 0;
            decimal TotalInAmount = 0;
            //======= out_qty,amount =========
            string strOutQty = string.Empty;
            string strOutAmount = string.Empty;
            decimal TotalOutQty = 0;
            decimal TotalOutAmount = 0;
            //======= end_qty,amount =========
            string strEndQty = string.Empty;
            string strEndAmount = string.Empty;
            decimal TotalEndQty = 0;
            decimal TotalEndAmount = 0;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                strWH = dt.Rows[i]["wh_name"].ToString();
                strDate = dt.Rows[i]["stock_date"].ToString();
                strGroup = dt.Rows[i]["grp_cd"].ToString();

                strItemCode = dt.Rows[i]["item_code"].ToString();
                strItemName = dt.Rows[i]["item_name"].ToString();

                strUom = dt.Rows[i]["uom"].ToString();
                strLotNo = dt.Rows[i]["lot_no"].ToString();
                //======= begin_qty,amount =========
                strBeginQty = dt.Rows[i]["begin_qty"].ToString();
                strBeginAmount = dt.Rows[i]["begin_amount"].ToString();
                
                TotalBeginQty += Convert.ToDecimal(dt.Rows[i]["begin_qty"]);
                TotalBeginAmount += Convert.ToDecimal(dt.Rows[i]["begin_amount"]);
                //======= in_qty,amount =========
                strInQty = dt.Rows[i]["in_qty"].ToString();
                strInAmount = dt.Rows[i]["in_amount"].ToString();
                
                TotalInQty += Convert.ToDecimal(dt.Rows[i]["in_qty"]);
                TotalInAmount += Convert.ToDecimal(dt.Rows[i]["in_amount"]);
                //======= out_qty,amount =========
                strOutQty = dt.Rows[i]["out_qty"].ToString();
                strOutAmount = dt.Rows[i]["out_amount"].ToString();
                
                TotalOutQty += Convert.ToDecimal(dt.Rows[i]["out_qty"]);
                TotalOutAmount += Convert.ToDecimal(dt.Rows[i]["out_amount"]);
                //======= end_qty,amount =========
                strEndQty = dt.Rows[i]["end_qty"].ToString();
                strEndAmount = dt.Rows[i]["end_amount"].ToString();
                
                TotalEndQty += Convert.ToDecimal(dt.Rows[i]["end_qty"]);
                TotalEndAmount += Convert.ToDecimal(dt.Rows[i]["end_amount"]);                                                                                
        %>
        <tr class="xl26" height="34" style='height: 25.5pt'>
            <td height="34" class="xl36" style='height: 25.5pt; border-top: none'>
                <%= strWH %>
            </td>
            <td class="xl37" style='border-top: none; border-left: none'>
                <%= strDate %>
            </td>
            <td class="xl37" style='border-top: none; border-left: none'>
                <%= strGroup %>
            </td>
            <td class="xl36" style='border-top: none; border-left: none'>
                <%= strItemCode %>
            </td>
            <td class="xl35" width="272" style='border-top: none; border-left: none; width: 204pt'>
                <%= strItemName %>
            </td>
            <td class="xl38" style='border-top: none; border-left: none'>
                <%= strUom %>
            </td>
            <td class="xl37" style='border-top: none; border-left: none'>
                <%= strLotNo%>
            </td>
            <td class="xl39" style='border-top: none; border-left: none' x:num>
                <%= strBeginQty%>
            </td>
            <td class="xl40" style='border-top: none; border-left: none' x:num>
                <%= strBeginAmount%>
            </td>
            <td class="xl39" align="right" style='border-top: none; border-left: none' x:num>
                <%= strInQty%>
            </td>
            <td class="xl40" align="right" style='border-top: none; border-left: none' x:num>
                <%= strInAmount%>
            </td>
            <td class="xl39" align="right" style='border-top: none; border-left: none' x:num>
                <%= strOutQty%>
            </td>
            <td class="xl40" align="right" style='border-top: none; border-left: none' x:num>
                <%= strOutAmount%>
            </td>
            <td class="xl39" align="right" style='border-top: none; border-left: none' x:num>
                <%= strEndQty%>
            </td>
            <td class="xl40" align="right" style='border-top: none; border-left: none' x:num>
                <%= strEndAmount%>
            </td>
            <td colspan="181" class="xl30" style='mso-ignore: colspan'>
            </td>
        </tr>
        <%
            }
        %>
        <tr class="xl24" height="17" style='height: 12.75pt'>
            <td height="17" class="xl32" style='height: 12.75pt; border-top: none'>
                </td>
            <td class="xl33" style='border-top: none'>
                &nbsp;</td>
            <td class="xl33" style='border-top: none'>
                &nbsp;</td>
            <td class="xl33" style='border-top: none'>
                &nbsp;</td>
            <td class="xl33" style='border-top: none'>
                &nbsp;</td>
            <td class="xl33" style='border-top: none'>
                &nbsp;</td>
            <td class="xl33" style='border-top: none'>
                <b>Tổng cộng</b></td>
            <td class="xl34" align="right" x:num>
                <%= TotalBeginQty %>
            </td>
            <td class="xl34" align="right" style='border-left: none' x:num>
                <%= TotalBeginAmount %>
            </td>
            <td class="xl34" align="right" style='border-left: none' x:num>
                <%= TotalInQty %>
            </td>
            <td class="xl34" align="right" style='border-left: none' x:num>
                <%= TotalInAmount %>
            </td>
            <td class="xl34" align="right" style='border-left: none' x:num>
                <%= TotalOutQty %>
            </td>
            <td class="xl34" align="right" style='border-left: none' x:num>
                <%= TotalOutAmount %>
            </td>
            <td class="xl34" align="right" style='border-left: none' x:num>
                <%= TotalEndQty %>
            </td>
            <td class="xl34" align="right" style='border-left: none' x:num>
                <%= TotalEndAmount %>
            </td>
            <td colspan="181" class="xl30" style='mso-ignore: colspan'>
            </td>
            <td class="xl24">
                &nbsp;</td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td height="17" colspan="197" style='height: 12.75pt; mso-ignore: colspan'>
            </td>
        </tr>
        <![if supportMisalignedColumns]>
        <tr height="0" style='display: none'>
            <td width="119" style='width: 89pt'>
            </td>
            <td width="85" style='width: 64pt'>
            </td>
            <td width="85" style='width: 64pt'>
            </td>
            <td width="92" style='width: 69pt'>
            </td>
            <td width="272" style='width: 204pt'>
            </td>
            <td width="37" style='width: 28pt'>
            </td>
            <td width="64" style='width: 48pt'>
            </td>
            <td width="104" style='width: 78pt'>
            </td>
            <td width="104" style='width: 78pt'>
            </td>
            <td width="104" style='width: 78pt'>
            </td>
            <td width="104" style='width: 78pt'>
            </td>
            <td width="104" style='width: 78pt'>
            </td>
            <td width="104" style='width: 78pt'>
            </td>
            <td width="104" style='width: 78pt'>
            </td>
            <td width="104" style='width: 78pt'>
            </td>
        </tr>
        <![endif]>
    </table>
</body>
</html>
