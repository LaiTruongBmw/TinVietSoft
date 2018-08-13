<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser("sale");
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string p_from_date = Request.QueryString["p_from_date"];
    string p_to_date = Request.QueryString["p_to_date"];
    string p_wh_type = Request.QueryString["p_wh_type"];
    
    DataTable dt, dt
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="ProgId" content="Excel.Sheet">
    <meta name="Generator" content="Microsoft Excel 11">
    <link rel="File-List" href="pl%20daily%20report_files/filelist.xml">
    <link rel="Edit-Time-Data" href="pl%20daily%20report_files/editdata.mso">
    <link rel="OLE-Object-Data" href="pl%20daily%20report_files/oledata.mso">
    <!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Mr. Khanh</o:LastAuthor>
  <o:LastPrinted>2010-10-28T09:53:18Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2010-10-28T09:58:38Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
    <style>
        <!--table
        {
            mso-displayed-decimal-separator: "\.";
            mso-displayed-thousand-separator: "\,";
        }
        @page
        {
            margin: .25in .25in .25in .25in;
            mso-header-margin: .25in;
            mso-footer-margin: .25in;
        }
        .font5
        {
            color: windowtext;
            font-size: 10.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: underline;
            text-underline-style: single;
            font-family: Arial;
            mso-generic-font-family: auto;
            mso-font-charset: 0;
        }
        tr
        {
            mso-height-source: auto;
        }
        col
        {
            mso-width-source: auto;
        }
        br
        {
            mso-data-placement: same-cell;
        }
        .style0
        {
            mso-number-format: General;
            text-align: general;
            vertical-align: bottom;
            white-space: nowrap;
            mso-rotate: 0;
            mso-background-source: auto;
            mso-pattern: auto;
            color: windowtext;
            font-size: 10.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Arial;
            mso-generic-font-family: auto;
            mso-font-charset: 0;
            border: none;
            mso-protection: locked visible;
            mso-style-name: Normal;
            mso-style-id: 0;
        }
        td
        {
            mso-style-parent: style0;
            padding-top: 1px;
            padding-right: 1px;
            padding-left: 1px;
            mso-ignore: padding;
            color: windowtext;
            font-size: 10.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Arial;
            mso-generic-font-family: auto;
            mso-font-charset: 0;
            mso-number-format: General;
            text-align: general;
            vertical-align: bottom;
            border: none;
            mso-background-source: auto;
            mso-pattern: auto;
            mso-protection: locked visible;
            white-space: nowrap;
            mso-rotate: 0;
        }
        .xl24
        {
            mso-style-parent: style0;
            font-weight: 700;
            text-decoration: underline;
            text-underline-style: single;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
        }
        .xl25
        {
            mso-style-parent: style0;
            border-top: 2.0pt double windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: .5pt solid windowtext;
        }
        .xl26
        {
            mso-style-parent: style0;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: 2.0pt double windowtext;
            border-left: .5pt solid windowtext;
        }
        .xl27
        {
            mso-style-parent: style0;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: 2.0pt double windowtext;
            border-left: .5pt solid windowtext;
        }
        .xl28
        {
            mso-style-parent: style0;
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: .5pt solid windowtext;
        }
        .xl29
        {
            mso-style-parent: style0;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: none;
            border-bottom: 2.0pt double windowtext;
            border-left: .5pt solid windowtext;
        }
        .xl30
        {
            mso-style-parent: style0;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: 2.0pt double windowtext;
            border-left: none;
        }
        .xl31
        {
            mso-style-parent: style0;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: none;
            border-bottom: 2.0pt double windowtext;
            border-left: none;
        }
        .xl32
        {
            mso-style-parent: style0;
            font-weight: 700;
            text-decoration: underline;
            text-underline-style: single;
            mso-number-format: "\#\,\#\#0\.\#0";
            text-align: right;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: none;
            border-bottom: 2.0pt double windowtext;
            border-left: .5pt solid windowtext;
        }
        .xl33
        {
            mso-style-parent: style0;
            font-weight: 700;
            text-decoration: underline;
            text-underline-style: single;
            mso-number-format: "\#\,\#\#0";
            text-align: right;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: 2.0pt double windowtext;
            border-left: none;
        }
        .xl34
        {
            mso-style-parent: style0;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: 2.0pt double windowtext;
            border-left: .5pt solid windowtext;
        }
        .xl35
        {
            mso-style-parent: style0;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: none;
            border-left: .5pt solid windowtext;
        }
        .xl36
        {
            mso-style-parent: style0;
            text-align: center;
            border-top: none;
            border-right: none;
            border-bottom: none;
            border-left: .5pt solid windowtext;
        }
        .xl37
        {
            mso-style-parent: style0;
            text-align: center;
            border-top: none;
            border-right: .5pt solid windowtext;
            border-bottom: none;
            border-left: none;
        }
        .xl38
        {
            mso-style-parent: style0;
            text-align: center;
            border-top: none;
            border-right: none;
            border-bottom: .5pt solid windowtext;
            border-left: .5pt solid windowtext;
        }
        .xl39
        {
            mso-style-parent: style0;
            text-align: center;
            border-top: none;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: none;
        }
        .xl40
        {
            mso-style-parent: style0;
            text-align: center;
            border-top: 2.0pt double windowtext;
            border-right: none;
            border-bottom: none;
            border-left: .5pt solid windowtext;
        }
        .xl41
        {
            mso-style-parent: style0;
            text-align: center;
            border-top: 2.0pt double windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: none;
            border-left: none;
        }
        .xl42
        {
            mso-style-parent: style0;
            text-align: center;
            border-top: none;
            border-right: .5pt solid windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: .5pt solid windowtext;
        }
        .xl43
        {
            mso-style-parent: style0;
            text-align: center;
            border-top: 2.0pt double windowtext;
            border-right: none;
            border-bottom: 1.0pt solid windowtext;
            border-left: .5pt solid windowtext;
        }
        .xl44
        {
            mso-style-parent: style0;
            text-align: center;
            border-top: 2.0pt double windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: none;
        }
        .xl45
        {
            mso-style-parent: style0;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "\#\,\#\#0\.\#0";
            text-align: right;
            border-top: 2.0pt double windowtext;
            border-right: none;
            border-bottom: 1.0pt solid windowtext;
            border-left: .5pt solid windowtext;
        }
        .xl46
        {
            mso-style-parent: style0;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "\#\,\#\#0";
            text-align: right;
            border-top: 2.0pt double windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: none;
        }
        .xl47
        {
            mso-style-parent: style0;
            vertical-align: middle;
            border-top: .5pt solid windowtext;            
            border-right: none;
            border-bottom: .5pt solid windowtext;
            border-left: .5pt solid windowtext;
        }
        .xl48
        {
            mso-style-parent: style0;
            vertical-align: middle;
            border-top: 2.0pt double windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: none;
        }
        .xl49
        {
            mso-style-parent: style0;
            vertical-align: middle;
            border-top: 2.0pt double windowtext;
            border-right: none;
            border-bottom: .5pt solid windowtext;
            border-left: none;
        }
        .xl50
        {
            mso-style-parent: style0;
            mso-number-format: "\#\,\#\#0\.\#0";
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: none;
            border-bottom: .5pt solid windowtext;
            border-left: .5pt solid windowtext;
        }
        .xl51
        {
            mso-style-parent: style0;
            mso-number-format: "\#\,\#\#0";
            vertical-align: middle;
            border-top: 2.0pt double windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: none;
        }
        .xl52
        {
            mso-style-parent: style0;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: none;
            border-bottom: 2.0pt double windowtext;
            border-left: .5pt solid windowtext;
        }
        .xl53
        {
            mso-style-parent: style0;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: none;
            border-bottom: 2.0pt double windowtext;
            border-left: none;
        }
        .xl54
        {
            mso-style-parent: style0;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: 2.0pt double windowtext;
            border-left: none;
        }
        .xl55
        {
            mso-style-parent: style0;
            text-decoration: underline;
            text-underline-style: single;
            text-align: right;
            mso-number-format: "\#\,\#\#0\.\#0";
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: none;
            border-bottom: 2.0pt double windowtext;
            border-left: .5pt solid windowtext;
        }
        .xl56
        {
            mso-style-parent: style0;
            text-decoration: underline;
            text-underline-style: single;
            text-align: right;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: 2.0pt double windowtext;
            border-left: none;
        }
        --></style>
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
       <x:ActiveRow>17</x:ActiveRow>
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
</xml><![endif]-->
</head>
<body link="blue" vlink="purple">
    <table x:str border="0" cellpadding="0" cellspacing="0" width="705" style='border-collapse: collapse;
        table-layout: fixed; width: 530pt'>
        <col width="64" style='width: 48pt'>
        <col width="85" style='mso-width-source: userset; mso-width-alt: 3108; width: 64pt'>
        <col width="64" span="6" style='width: 48pt'>
        <col width="54" style='mso-width-source: userset; mso-width-alt: 1974; width: 41pt'>
        <col width="64" style='width: 48pt'>
        <col width="54" style='mso-width-source: userset; mso-width-alt: 1974; width: 41pt'>
        <tr height="18" style='height: 13.5pt'>
            <td height="18" class="xl24" colspan="2" width="149" style='height: 13.5pt; mso-ignore: colspan;
                width: 112pt'>
                P/L DAILY REPORT
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
            <td colspan="2" class="xl34" width="118" style='width: 89pt'>
                WRITER
            </td>
            <td colspan="2" class="xl35" width="118" style='border-left: none; width: 89pt'>
                CHECK
            </td>
        </tr>
        <tr height="18" style='height: 13.5pt'>
            <td height="18" colspan="7" style='height: 13.5pt; mso-ignore: colspan'>
            </td>
            <td colspan="2" rowspan="4" class="xl36" style='border-right: .5pt solid black; border-bottom: .5pt solid black'>
                &nbsp;
            </td>
            <td colspan="2" rowspan="4" class="xl40" style='border-right: .5pt solid black; border-bottom: .5pt solid black'>
                &nbsp;
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td height="17" colspan="7" style='height: 12.75pt; mso-ignore: colspan'>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td height="17" class="xl24" colspan="2" style='height: 12.75pt; mso-ignore: colspan'>
                DATE<font class="font5">:
                    <%=System.DateTime.ParseExact(p_from_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy/MM/dd")%> - 
                    <%=System.DateTime.ParseExact(p_to_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy/MM/dd")%></font>
            </td>
            <td colspan="5" style='mso-ignore: colspan'>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td height="17" colspan="7" style='height: 12.75pt; mso-ignore: colspan'>
            </td>
        </tr>
        <tr height="35" style='mso-height-source: userset; height: 26.25pt'>
            <td colspan="2" height="35" class="xl29" style='border-right: .5pt solid black; height: 26.25pt'>
                PL
            </td>
            <td colspan="4" class="xl29" style='border-right: .5pt solid black; border-left: none'>
                ITEM
            </td>
            <td class="xl27" style='border-left: none'>
                UNIT
            </td>
            <td colspan="2" class="xl29" style='border-right: .5pt solid black; border-left: none'>
                INPUT
            </td>
            <td colspan="2" class="xl29" style='border-right: .5pt solid black; border-left: none'>
                OUTPUT
            </td>
        </tr>
        <%
            string para = "'" + p_from_date + "','" + p_to_date + "','" + p_wh_type + "'";
            DataTable dt;
            decimal TotalInput = 0;
            decimal TotalOutput = 0;
            decimal TotalInputAll = 0;
            decimal TotalOutputAll = 0;
            string pro = string.Empty;
            dt = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00030", para);
            //---------------------
            int arr_count ;
            int[] arrID_count = new int[dt.Rows.Count > 0 ? dt.Rows.Count : 1];
            int a = 0;
            int strID_count = 1;

            for (int y = 0; y < dt.Rows.Count; y++)
            {
                if (pro == "" || pro == null)
                {
                    pro = dt.Rows[y]["plc_nm"].ToString();
                    strID_count = 1;
                }
                else
                {
                    if (dt.Rows[y]["plc_nm"].ToString().Trim() != pro.Trim())
                    {
                        arrID_count[a] = strID_count;
                        strID_count = 1;
                        a++;
                        pro = dt.Rows[y]["plc_nm"].ToString();
                    }
                    else
                    {
                        strID_count++;
                    }
                }
            }
            arrID_count[a] = strID_count;
            a = 0;
            pro = string.Empty;
            //------------------------
            for (int i = 0; i < dt.Rows.Count; i++)
            {              
        %>
        <%     
            if (pro != dt.Rows[i]["plc_nm"].ToString() && i != 0)
            {
        %>
        <tr height="21" style='mso-height-source: userset; height: 15.75pt'>
            <td colspan="2" height="21" class="xl29" style='border-right: .5pt solid black; height: 15.75pt'>
                SUB TOTAL
            </td>
            <td colspan="4" class="xl52" style='border-right: .5pt solid black; border-left: none'>
                &nbsp;
            </td>
            <td class="xl26" style='border-top: none; border-left: none'>
                &nbsp;
            </td>
            <td colspan="2" class="xl32" style='border-right: .5pt solid black; border-left: none'
                x:num>
                <%= TotalInput %>
            </td>
            <td colspan="2" class="xl32" style='border-right: .5pt solid black; border-left: none'
                x:num>
                <%= TotalOutput %>
            </td>
        </tr>
        <%
            TotalInputAll += TotalInput;
            TotalOutputAll += TotalOutput;
            TotalInput = 0;
            TotalOutput = 0;
            }
        %>
        <tr height="18" style='height: 13.5pt'>
            <%
                if (pro != dt.Rows[i]["plc_nm"].ToString())
                {
            %>
            <td rowspan="<%=arrID_count[a]%>" colspan="2" height="18" class="xl47" style='border-right: .5pt solid black;
                height: 13.5pt'>
                <%= dt.Rows[i]["plc_nm"]%>
            </td>
            <% 
                pro = dt.Rows[i]["plc_nm"].ToString();
                a++;
                }
            %>
            <td colspan="4" class="xl47" style='border-right: .5pt solid black; border-left: none'>
                <%= dt.Rows[i]["item_name"]%>
            </td>
            <td class="xl28" style='border-left: none'>
                <%= dt.Rows[i]["uom"]%>
            </td>
            <td colspan="2" class="xl50" align="right" style='border-right: .5pt solid black;
                border-left: none' x:num>
                <%= dt.Rows[i]["in_qty"]%>
            </td>
            <td colspan="2" class="xl50" align="right" style='border-right: .5pt solid black;
                border-left: none' x:num>
                <%= dt.Rows[i]["out_qty"]%>
            </td>
        </tr>
        <% 
            TotalInput += Convert.ToDecimal(dt.Rows[i]["in_qty"]);
            TotalOutput += Convert.ToDecimal(dt.Rows[i]["out_qty"]);
            }     
        %>
        <tr height="21" style='mso-height-source: userset; height: 15.75pt'>
            <td colspan="2" height="21" class="xl29" style='border-right: .5pt solid black; height: 15.75pt'>
                SUB TOTAL
            </td>
            <td colspan="4" class="xl52" style='border-right: .5pt solid black; border-left: none'>
                &nbsp;
            </td>
            <td class="xl26" style='border-top: none; border-left: none'>
                &nbsp;
            </td>
            <td colspan="2" class="xl32" style='border-right: .5pt solid black; border-left: none'
                x:num>
                <%= TotalInput %>
            </td>
            <% TotalInputAll += TotalInput; %>
            <td colspan="2" class="xl32" style='border-right: .5pt solid black; border-left: none'
                x:num>
                <%= TotalOutput %>
            </td>
            <% TotalOutputAll += TotalOutput; %>
        </tr>
        <tr height="19" style='height: 14.25pt'>
            <td colspan="6" height="19" class="xl42" style='height: 14.25pt'>
                GRAND TOTAL
            </td>
            <td class="xl25" style='border-left: none'>
                &nbsp;
            </td>
            <td colspan="2" class="xl45" style='border-right: .5pt solid black; border-left: none'
                x:num>
                <%= TotalInputAll %>
            </td>
            <td colspan="2" class="xl45" style='border-right: .5pt solid black; border-left: none'
                x:num>
                <%= TotalOutputAll %>
            </td>
        </tr>
        <![if supportMisalignedColumns]>
        <tr height="0" style='display: none'>
            <td width="64" style='width: 48pt'>
            </td>
            <td width="85" style='width: 64pt'>
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
            <td width="64" style='width: 48pt'>
            </td>
            <td width="54" style='width: 41pt'>
            </td>
            <td width="64" style='width: 48pt'>
            </td>
            <td width="54" style='width: 41pt'>
            </td>
        </tr>
        <![endif]>
    </table>
</body>
</html>
