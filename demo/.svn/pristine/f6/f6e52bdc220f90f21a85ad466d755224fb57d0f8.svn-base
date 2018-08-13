<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string p_from_dt = Request.QueryString["p_from_dt"];
    string p_to_dt = Request.QueryString["p_to_dt"];
    string p_slip_cust = Request.QueryString["p_slip_cust"];
    string p_item = Request.QueryString["p_item"];
    string p_bal_yn = Request.QueryString["p_bal_yn"];

    string para = "'" + p_from_dt + "','" + p_to_dt + "','" + p_slip_cust + "','" + p_item + "','" + p_bal_yn + "'";
    DataTable dt, dt1;
    dt = CtlLib.TableReadOpenCursor("SALE.sp_rpt_dscd00110");
    dt1 = CtlLib.TableReadOpenCursor("SALE.sp_rpt_dscd00110_1", para);
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="ProgId" content="Excel.Sheet">
    <meta name="Generator" content="Microsoft Excel 11">
    <link rel="File-List" href="rpt_dscd00110_files/filelist.xml">
    <link rel="Edit-Time-Data" href="rpt_dscd00110_files/editdata.mso">
    <link rel="OLE-Object-Data" href="rpt_dscd00110_files/oledata.mso">
    <!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Server_Test</o:LastAuthor>
  <o:LastPrinted>2011-06-27T03:00:57Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2011-06-27T03:02:05Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
    <style>
        <!
        --table
        {
            mso-displayed-decimal-separator: "\.";
            mso-displayed-thousand-separator: "\,";
        }
        @page
        {
            mso-footer-data: "&CPage &N of &P";
            margin: .25in .25in .25in .25in;
            mso-header-margin: .25in;
            mso-footer-margin: .25in;
            mso-page-orientation: landscape;
        }
        .font6
        {
            color: windowtext;
            font-size: 9.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Tahoma, sans-serif;
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
            font-size: 9.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border: .5pt solid windowtext;
            background: #CCFFFF;
            mso-pattern: auto none;
        }
        .xl25
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            vertical-align: middle;
            border: .5pt solid windowtext;
        }
        .xl26
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            vertical-align: middle;
            border: .5pt solid windowtext;
        }
        .xl27
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border: .5pt solid windowtext;
        }
        .xl28
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
            vertical-align: middle;
            border: .5pt solid windowtext;
        }
        .xl29
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: left;
            vertical-align: middle;
            border: .5pt solid windowtext;
        }
        .xl30
        {
            mso-style-parent: style0;
            font-size: 24.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            vertical-align: middle;
        }
        .xl31
        {
            mso-style-parent: style0;
            color: blue;
            border-bottom: 2.0pt double windowtext;
            font-size: 24.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
        }
        .xl32
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border: .5pt solid windowtext;
        }
        .xl33
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            vertical-align: middle;
            border: .5pt solid windowtext;
            white-space: normal;
        }
        .xl34
        {
            mso-style-parent: style0;
            border-top: .5pt solid windowtext;
            border-right: none;
            border-bottom: .5pt solid windowtext;
            border-left: .5pt solid windowtext;
            background: #FFCC99;
            mso-pattern: auto none;
        }
        .xl35
        {
            mso-style-parent: style0;
            border-top: .5pt solid windowtext;
            border-right: none;
            border-bottom: .5pt solid windowtext;
            border-left: none;
            background: #FFCC99;
            mso-pattern: auto none;
        }
        .xl36
        {
            mso-style-parent: style0;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: none;
            background: #FFCC99;
            mso-pattern: auto none;
        }
        .xl37
        {
            mso-style-parent: style0;
            font-size: 9.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            vertical-align: middle;
        }
        .xl38
        {
            mso-style-parent: style0;
            font-size: 9.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
            vertical-align: middle;
            border: .5pt solid windowtext;
            background: #FFCC99;
            mso-pattern: auto none;
        }
        .xl39
        {
            mso-style-parent: style0;
            vertical-align: middle;
            border: .5pt solid windowtext;
            background: #FFCC99;
            mso-pattern: auto none;
        }
        -- ></style>
    <!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>8</x:ActiveRow>
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
  <x:WindowTopX>60</x:WindowTopX>
  <x:WindowTopY>1980</x:WindowTopY>
  <x:AcceptLabelsInFormulas/>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>
<body link="blue" vlink="purple">
    <table x:str border="0" cellpadding="0" cellspacing="0" width="1148" style='border-collapse: collapse;
        table-layout: fixed; width: 862pt'>
        <col width="130" style='mso-width-source: userset; mso-width-alt: 4754; width: 98pt'>
        <col width="74" style='mso-width-source: userset; mso-width-alt: 2706; width: 56pt'>
        <col width="95" style='mso-width-source: userset; mso-width-alt: 3474; width: 71pt'>
        <col width="80" style='mso-width-source: userset; mso-width-alt: 2925; width: 60pt'>
        <col width="187" style='mso-width-source: userset; mso-width-alt: 6838; width: 140pt'>
        <col width="55" style='mso-width-source: userset; mso-width-alt: 2011; width: 41pt'>
        <col width="77" style='mso-width-source: userset; mso-width-alt: 2816; width: 58pt'>
        <col width="65" style='mso-width-source: userset; mso-width-alt: 2377; width: 49pt'>
        <col width="76" style='mso-width-source: userset; mso-width-alt: 2779; width: 57pt'>
        <col width="58" style='mso-width-source: userset; mso-width-alt: 2121; width: 44pt'>
        <col width="68" style='mso-width-source: userset; mso-width-alt: 2486; width: 51pt'>
        <col width="55" style='mso-width-source: userset; mso-width-alt: 2011; width: 41pt'>
        <col width="64" span="2" style='width: 48pt'>
        <tr height="67" style='mso-height-source: userset; height: 50.25pt'>
            <td colspan="12" height="67" class="xl31" width="1020" style='height: 50.25pt; width: 766pt'>
                <v:shape id="_x0000_s2051" type="#_x0000_t75" style='position: absolute; margin-left: 1.5pt;
                    margin-top: 1.5pt; width: 78.75pt; height: 45.25pt; z-index: 1'>
                    <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt.Rows[0]["tco_bpphoto_pk"]%>&table_name=tco_bpphoto"
                        o:title="image001" />
                    <x:clientdata objecttype="Pict">
                        <x:sizewithcells />
                        <x:cf>Bitmap</x:cf>
                    </x:clientdata>
                </v:shape>
                G/D PLAN CHECKING
            </td>
            <td class="xl30" width="64" style='width: 48pt'>
            </td>
            <td class="xl30" width="64" style='width: 48pt'>
            </td>
        </tr>
        <tr height="23" style='mso-height-source: userset; height: 17.25pt'>
            <td height="23" colspan="9" style='height: 17.25pt; mso-ignore: colspan'>
            </td>
            <td class="xl37" colspan="4" style='mso-ignore: colspan'>
                Print Date<font class="font6">:
                    <%= DateTime.Now.ToString("dd/MM/yyyy HH:mm") %></font>
            </td>
            <td>
            </td>
        </tr>
        <tr height="25" style='mso-height-source: userset; height: 18.75pt'>
            <td height="25" class="xl24" style='height: 18.75pt'>
                Parter
            </td>
            <td class="xl24" style='border-left: none'>
                Ref No
            </td>
            <td class="xl24" style='border-left: none'>
                S/O Item No
            </td>
            <td class="xl24" style='border-left: none'>
                Item Code
            </td>
            <td class="xl24" style='border-left: none'>
                Item Name
            </td>
            <td class="xl24" style='border-left: none'>
                UOM
            </td>
            <td class="xl24" style='border-left: none'>
                Date
            </td>
            <td class="xl24" style='border-left: none'>
                Plan Qty
            </td>
            <td class="xl24" style='border-left: none'>
                Lot No
            </td>
            <td class="xl24" style='border-left: none'>
                Out Qty
            </td>
            <td class="xl24" style='border-left: none'>
                Return Qty
            </td>
            <td class="xl24" style='border-left: none'>
                Bal Qty
            </td>
            <td colspan="2" style='mso-ignore: colspan'>
            </td>
        </tr>
        <% 
            double plan_qty = 0;
            double out_qty = 0;
            double return_qty = 0;
            double bal_qty = 0;
            //::::: Partner
            string strPartner = string.Empty;
            int[] arrPartner_count = new int[dt1.Rows.Count];
            int a = 0;
            int strPartner_count = 1;

            for (int y = 0; y < dt1.Rows.Count; y++)
            {
                if (strPartner == "" || strPartner == null)
                {
                    strPartner = dt1.Rows[y]["bill_to_name"].ToString();
                    strPartner_count = 1;
                }
                else
                {
                    if (dt1.Rows[y]["bill_to_name"].ToString().Trim() != strPartner.Trim())
                    {
                        arrPartner_count[a] = strPartner_count;
                        strPartner_count = 1;
                        a++;
                        strPartner = dt1.Rows[y]["bill_to_name"].ToString();
                    }
                    else
                    {
                        strPartner_count++;
                    }
                }
            }
            arrPartner_count[a] = strPartner_count;
            a = 0;
            strPartner = string.Empty;
            //:::: End Partner
            //---------------------------------
            //::::: S/O Item No
            string strSOItemNo = string.Empty;
            int[] arrSOItemNo_count = new int[dt1.Rows.Count];
            int b = 0;
            int strSOItemNo_count = 1;

            for (int y = 0; y < dt1.Rows.Count; y++)
            {
                if (strSOItemNo == "" || strSOItemNo == null)
                {
                    strSOItemNo = dt1.Rows[y]["so_item_no"].ToString();
                    strSOItemNo_count = 1;
                }
                else
                {
                    if (dt1.Rows[y]["so_item_no"].ToString().Trim() != strSOItemNo.Trim())
                    {
                        arrSOItemNo_count[b] = strSOItemNo_count;
                        strSOItemNo_count = 1;
                        b++;
                        strSOItemNo = dt1.Rows[y]["so_item_no"].ToString();
                    }
                    else
                    {
                        strSOItemNo_count++;
                    }
                }
            }
            arrSOItemNo_count[b] = strSOItemNo_count;
            b = 0;
            strSOItemNo = string.Empty;
            //:::: End S/O Item No
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
        %>
        <tr height="25" style='mso-height-source: userset; height: 18.75pt'>
            <%
                if (strPartner != dt1.Rows[i]["bill_to_name"].ToString())
                {
            %>
            <td rowspan="<%=arrPartner_count[a]%>" height="25" class="xl33" width="130" style='height: 18.75pt;
                border-top: none; width: 98pt'>
                <%= dt1.Rows[i]["bill_to_name"]%>
            </td>
            <td rowspan="<%=arrPartner_count[a]%>" class="xl25" style='border-top: none; border-left: none'>
                <span style='mso-spacerun: yes'></span>
                <%= dt1.Rows[i]["ref_no"]%>
            </td>
            <% 
                strPartner = dt1.Rows[i]["bill_to_name"].ToString();
                a++;
                }
            %>
            <%
                if (strSOItemNo != dt1.Rows[i]["so_item_no"].ToString())
                {
            %>
            <td rowspan="<%=arrSOItemNo_count[b]%>" class="xl26" style='border-top: none; border-left: none'>
                <%= dt1.Rows[i]["so_item_no"]%>
            </td>
            <td rowspan="<%=arrSOItemNo_count[b]%>" class="xl29" style='border-top: none; border-left: none'
                x:num>
                <%= dt1.Rows[i]["item_code"]%>
            </td>
            <td rowspan="<%=arrSOItemNo_count[b]%>" class="xl33" width="187" style='border-top: none;
                border-left: none; width: 140pt'>
                <%= dt1.Rows[i]["item_name"]%>
            </td>
            <td rowspan="<%=arrSOItemNo_count[b]%>" class="xl27" style='border-top: none; border-left: none'>
                <%= dt1.Rows[i]["uom"]%>
            </td>
            <% 
                strSOItemNo = dt1.Rows[i]["so_item_no"].ToString();
                b++;
                }
            %>
            <td class="xl27" style='border-top: none; border-left: none'>
                <%= DateTime.ParseExact(dt1.Rows[i]["plan_date"].ToString(),"yyyyMMdd",System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy") %>
            </td>
            <td class="xl28" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= dt1.Rows[i]["stock_qty"]%>
            </td>
            <td class="xl32" style='border-top: none; border-left: none'>
                <%= dt1.Rows[i]["lot_no"]%>
            </td>
            <td class="xl28" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= dt1.Rows[i]["out_qty"]%>
            </td>
            <td class="xl28" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= dt1.Rows[i]["return_qty"]%>
            </td>
            <td class="xl28" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= dt1.Rows[i]["bal_qty"]%>
            </td>
            <td colspan="2" style='mso-ignore: colspan'>
            </td>
        </tr>
        <%
            plan_qty += Convert.ToDouble(dt1.Rows[i]["stock_qty"]);
            out_qty += Convert.ToDouble(dt1.Rows[i]["out_qty"]);
            return_qty += Convert.ToDouble(dt1.Rows[i]["return_qty"]);
            bal_qty += Convert.ToDouble(dt1.Rows[i]["bal_qty"]);
            } %>
        <tr height="25" style='mso-height-source: userset; height: 18.75pt'>
            <td height="25" class="xl34" style='height: 18.75pt; border-top: none'>
                &nbsp;
            </td>
            <td class="xl35" style='border-top: none'>
                &nbsp;
            </td>
            <td class="xl35" style='border-top: none'>
                &nbsp;
            </td>
            <td class="xl35" style='border-top: none'>
                &nbsp;
            </td>
            <td class="xl35" style='border-top: none'>
                &nbsp;
            </td>
            <td class="xl35" style='border-top: none'>
                &nbsp;
            </td>
            <td class="xl36" style='border-top: none'>
                &nbsp;
            </td>
            <td class="xl38" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= plan_qty%>
            </td>
            <td class="xl39" style='border-top: none; border-left: none'>
                &nbsp;
            </td>
            <td class="xl38" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= out_qty%>
            </td>
            <td class="xl38" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= return_qty%>
            </td>
            <td class="xl38" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= bal_qty%>
            </td>
            <td colspan="2" style='mso-ignore: colspan'>
            </td>
        </tr>
        <![if supportMisalignedColumns]>
        <tr height="0" style='display: none'>
            <td width="130" style='width: 98pt'>
            </td>
            <td width="74" style='width: 56pt'>
            </td>
            <td width="95" style='width: 71pt'>
            </td>
            <td width="80" style='width: 60pt'>
            </td>
            <td width="187" style='width: 140pt'>
            </td>
            <td width="55" style='width: 41pt'>
            </td>
            <td width="77" style='width: 58pt'>
            </td>
            <td width="65" style='width: 49pt'>
            </td>
            <td width="76" style='width: 57pt'>
            </td>
            <td width="58" style='width: 44pt'>
            </td>
            <td width="68" style='width: 51pt'>
            </td>
            <td width="55" style='width: 41pt'>
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
