<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string strSQL = @"SELECT partner_name, addr1, phone_no, fax_no, tax_code, tco_bpphoto_pk 
                      FROM tco_company 
                      WHERE del_if = 0 AND pk = (SELECT MAX (pk)
                                                  FROM tco_company
                                                  WHERE del_if = 0 AND active_yn = 'Y')";
												  
    string p_company_pk 	= Request.QueryString["p_company_pk"];
	string p_tlg_mt_div_pk  = Request.QueryString["p_tlg_mt_div_pk"];	
    string p_date_type 	    = Request.QueryString["p_date_type"];
    string p_from_date 		= Request.QueryString["p_from_date"];
    string p_to_date 		= Request.QueryString["p_to_date"];
    string p_item 		    = Request.QueryString["p_item"];
    string p_bill_to 		= Request.QueryString["p_bill_to"];
	string p_so_uprice		= Request.QueryString["p_so_uprice"];
    string p_order_type 	= Request.QueryString["p_order_type"];

    string para = "'" + p_company_pk + "','" + p_tlg_mt_div_pk + "','" + p_date_type + "','" + p_from_date + "','" + p_to_date + "','" + p_item + "','" + p_order_type + "','" + p_bill_to + "','" + p_so_uprice + "'"; 
	//trung
    DataTable dt, dt1;
    dt = CtlLib.TableReadOpen(strSQL);
    dt1 = CtlLib.TableReadOpenCursor("st_lg__rpt_dsbs00060", para);	   
   
    if(dt1.Rows.Count == 0){Response.Write("No Data"); Response.End();}
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="ProgId" content="Excel.Sheet">
    <meta name="Generator" content="Microsoft Excel 11">
    <link rel="File-List" href="rptdsbs00060_files/filelist.xml">
    <link rel="Edit-Time-Data" href="rptdsbs00060_files/editdata.mso">
    <link rel="OLE-Object-Data" href="rptdsbs00060_files/oledata.mso">
    <!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>SERVER_LG</o:LastAuthor>
  <o:LastPrinted>2011-07-08T08:58:56Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2011-07-08T08:59:13Z</o:LastSaved>
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
            mso-footer-data: "&CPage &P of &N";
            margin: .1in .25in .25in .25in;
            mso-header-margin: 0in;
            mso-footer-margin: 0in;
            mso-page-orientation: landscape;
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
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
        }
        .xl25
        {
            mso-style-parent: style0;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border: .5pt solid windowtext;
            background: #CCFFFF;
            mso-pattern: auto none;
        }
        .xl26
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
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
            mso-number-format: Standard;
            vertical-align: middle;
            border: .5pt solid windowtext;
        }
        .xl28
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            mso-number-format: Standard;
            vertical-align: middle;
            border: .5pt solid windowtext;
        }
        .xl29
        {
            mso-style-parent: style0;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            mso-number-format: Fixed;
            vertical-align: middle;
        }
        .xl30
        {
            mso-style-parent: style0;
            font-size: 9.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            mso-number-format: Fixed;
            vertical-align: middle;
        }
        .xl31
        {
            mso-style-parent: style0;
            font-size: 9.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            mso-number-format: Fixed;
            text-align: right;
            vertical-align: middle;
            border-top: none;
            border-right: none;
            border-bottom: .5pt solid windowtext;
            border-left: none;
        }
        .xl32
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            mso-number-format: Standard;
            vertical-align: middle;
            border: .5pt solid windowtext;
            background: #FFCC99;
            mso-pattern: auto none;
        }
        .xl33
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            mso-number-format: Standard;
            vertical-align: middle;
            border: .5pt solid windowtext;
            background: #FFCC99;
            mso-pattern: auto none;
        }
        .xl34
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            mso-number-format: Standard;
            vertical-align: middle;
            border: .5pt solid windowtext;
            background: #FFCC99;
            mso-pattern: auto none;
        }
        .xl35
        {
            mso-style-parent: style0;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: none;
            border-bottom: .5pt solid windowtext;
            border-left: .5pt solid windowtext;
            background: #FFCC99;
            mso-pattern: auto none;
        }
        .xl36
        {
            mso-style-parent: style0;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: none;
            border-bottom: .5pt solid windowtext;
            border-left: none;
            background: #FFCC99;
            mso-pattern: auto none;
        }
        .xl37
        {
            mso-style-parent: style0;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: none;
            background: #FFCC99;
            mso-pattern: auto none;
        }
        .xl38
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border: .5pt solid windowtext;
        }
        .xl39
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            vertical-align: middle;
            border: .5pt solid windowtext;
            white-space: normal;
        }
        .xl40
        {
            mso-style-parent: style0;
            color: blue;
            font-size: 24.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: none;
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
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>11</x:ActiveRow>
       <x:ActiveCol>10</x:ActiveCol>
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
<body link="blue" vlink="purple" class="xl24">
    <table x:str border="0" cellpadding="0" cellspacing="0" width="1020" style='border-collapse: collapse;
        table-layout: fixed; width: 767pt'>
        <col class="xl24" width="106" style='mso-width-source: userset; mso-width-alt: 3876;
            width: 80pt'>
        <col class="xl24" width="64" style='width: 48pt'>
        <col class="xl24" width="72" style='mso-width-source: userset; mso-width-alt: 2633;
            width: 54pt'>
        <col class="xl24" width="39" style='mso-width-source: userset; mso-width-alt: 1426;
            width: 29pt'>
        <col class="xl24" width="81" style='mso-width-source: userset; mso-width-alt: 2962;
            width: 61pt'>
        <col class="xl24" width="111" style='mso-width-source: userset; mso-width-alt: 4059;
            width: 83pt'>
        <col class="xl24" width="49" style='mso-width-source: userset; mso-width-alt: 1792;
            width: 37pt'>
        <col class="xl24" width="65" style='mso-width-source: userset; mso-width-alt: 2377;
            width: 49pt'>
        <col class="xl24" width="53" style='mso-width-source: userset; mso-width-alt: 1938;
            width: 40pt'>
        <col class="xl24" width="93" style='mso-width-source: userset; mso-width-alt: 3401;
            width: 70pt'>
        <col class="xl24" width="53" style='mso-width-source: userset; mso-width-alt: 1938;
            width: 40pt'>
        <col class="xl24" width="93" style='mso-width-source: userset; mso-width-alt: 3401;
            width: 70pt'>
        <col class="xl24" width="53" style='mso-width-source: userset; mso-width-alt: 1938;
            width: 40pt'>
        <col class="xl24" width="88" style='mso-width-source: userset; mso-width-alt: 3218;
            width: 66pt'>
        <!--[if gte vml 1]><v:shape id="_x0000_s1025" type="#_x0000_t75" style='position:absolute;
   margin-left:1.5pt;margin-top:1.5pt;width:78pt;height:42pt;z-index:1'>
   <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt.Rows[0]["tco_bpphoto_pk"]%>&table_name=<%=Session["APP_DBUSER"].ToString() %>.tco_bpphoto" o:title="logo"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]-->
        <tr height="60" style='mso-height-source: userset; height: 45.0pt'>
            <td colspan="14" height="60" class="xl40" width="1020" style='height: 45.0pt; width: 767pt'>
                S/O CHECKING
            </td>
        </tr>
        <tr height="22" style='mso-height-source: userset; height: 16.5pt'>
            <td height="22" class="xl29" style='height: 16.5pt'>
            </td>
            <td class="xl30" colspan="4" style='mso-ignore: colspan'>
                Date:
                <%=System.DateTime.ParseExact(p_from_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%>
                ~
                <%=System.DateTime.ParseExact(p_to_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%>
            </td>
            <td colspan="6" class="xl29" style='mso-ignore: colspan'>
            </td>
            <td colspan="3" class="xl31">
                Print Date:
                <%= DateTime.Now.ToString("dd/MM/yyyy HH:mm") %>
            </td>
        </tr>
        <tr height="22" style='mso-height-source: userset; height: 16.5pt'>
            <td height="22" class="xl25" style='height: 16.5pt'>
                Bill To
            </td>
            <td class="xl25" style='border-left: none'>
                Ord Date
            </td>
            <td class="xl25" style='border-left: none'>
                P/O No
            </td>
            <td class="xl25" style='border-left: none'>
                Seq
            </td>
            <td class="xl25" style='border-left: none'>
                Item Code
            </td>
            <td class="xl25" style='border-left: none'>
                Item Name
            </td>
            <td class="xl25" style='border-left: none'>
                UOM
            </td>
            <td class="xl25" style='border-left: none'>
                U/P
            </td>
            <td class="xl25" style='border-left: none'>
                Ord Qty
            </td>
            <td class="xl25" style='border-left: none'>
                <span style='mso-spacerun: yes'></span>Amount
            </td>
            <td class="xl25" style='border-left: none'>
                Deli Qty
            </td>
            <td class="xl25" style='border-top: none; border-left: none'>
                Amount
            </td>
            <td class="xl25" style='border-top: none; border-left: none'>
                Bal Qty
            </td>
            <td class="xl25" style='border-top: none; border-left: none'>
                Bal Amount
            </td>
        </tr>
        <%
			decimal ord_qty = 0;
            decimal amount = 0;
            decimal deli_qty = 0;
			decimal deli_amount = 0;
            decimal bal_qty = 0;
            decimal bal_amount = 0;
            string _strBillTo = string.Empty;
            //-----
            string strBillTo = string.Empty;
            int[] arrBillTo_count = new int[dt1.Rows.Count];
            int a = 0;
            int strBillTo_count = 1;

            for (int y = 0; y < dt1.Rows.Count; y++)
            {
                if (strBillTo == string.Empty)
                {
                    strBillTo = dt1.Rows[y]["bill_to_name"].ToString();
                    strBillTo_count = 1;
                }
                else
                {
                    if (!dt1.Rows[y]["bill_to_name"].ToString().Trim().Equals(strBillTo.Trim()))
                    {
                        arrBillTo_count[a] = strBillTo_count;
                        strBillTo_count = 1;
                        a++;
                        strBillTo = dt1.Rows[y]["bill_to_name"].ToString();
                    }
                    else
                    {
                        strBillTo_count++;
                    }
                }
            }
            arrBillTo_count[a] = strBillTo_count;
            a = 0;
            strBillTo = string.Empty;
            //-----
            string strOrdDate = string.Empty;
            string strBillToBis = string.Empty;
            string strCompare = string.Empty;
            int[] arrOrdDate_count = new int[dt1.Rows.Count];
            int b = 0;
            int strOrdDate_count = 1;

            for (int z = 0; z < dt1.Rows.Count; z++)
            {
                if (strOrdDate == string.Empty)
                {
                    strOrdDate = dt1.Rows[z]["order_dt"].ToString();
                    strBillToBis = dt1.Rows[z]["bill_to_name"].ToString();
                    strCompare = dt1.Rows[z]["po_no"].ToString();
                    strOrdDate_count = 1;
                }
                else
                {
                    if (!dt1.Rows[z]["order_dt"].ToString().Trim().Equals(strOrdDate.Trim()) || !dt1.Rows[z]["bill_to_name"].ToString().Trim().Equals(strBillToBis.Trim()) || !dt1.Rows[z]["po_no"].ToString().Trim().Equals(strCompare.Trim()))
                    {
                        arrOrdDate_count[b] = strOrdDate_count;
                        strOrdDate_count = 1;
                        b++;
                        strOrdDate = dt1.Rows[z]["order_dt"].ToString();
                        strBillToBis = dt1.Rows[z]["bill_to_name"].ToString();
                        strCompare = dt1.Rows[z]["po_no"].ToString();
                    }
                    else
                    {
                        strOrdDate_count++;
                    }
                }
            }
            arrOrdDate_count[b] = strOrdDate_count;
            b = 0;
            strOrdDate = string.Empty;
            strBillToBis = string.Empty;
            strCompare = string.Empty;
            //-----
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
        %>
        <%
            if (!_strBillTo.Equals(dt1.Rows[i]["bill_to_name"]) && i != 0)
            {
        %>
        <tr height="20" style='mso-height-source: userset; height: 15.0pt'>
            <td colspan="9" height="20" class="xl35" style='border-right: .5pt solid black; height: 15.0pt'>
                Total
            </td>
            <td class="xl33" align="right" style='border-top: none; border-left: none' x:num>
                <%= amount %>
            </td>
            <td class="xl34" align="right" style='border-top: none; border-left: none' x:num>
                <%= deli_qty %>
            </td>
            <td class="xl32" style='border-top: none; border-left: none'>
                &nbsp;
            </td>
            <td class="xl34" align="right" style='border-top: none; border-left: none' x:num>
                <%= bal_qty %>
            </td>
            <td class="xl33" align="right" style='border-top: none; border-left: none' x:num>
                <%= bal_amount %>
            </td>
        </tr>
        <%
            ord_qty = 0 ;
			amount = 0;
            deli_qty = 0;
			deli_amount = 0;
            bal_qty = 0;
            bal_amount = 0;

            }
        %>
        <%
            if (!strBillTo.Equals(dt1.Rows[i]["bill_to_name"].ToString()))
            {
        %>
        <tr height="20" style='mso-height-source: userset; height: 15.0pt'>
            <td rowspan="<%=arrBillTo_count[a]%>" height="20" class="xl39" width="106" style='height: 15.0pt;
                border-top: none; width: 80pt'>
                <%= dt1.Rows[i]["bill_to_name"] %>
            </td>
            <% 
                strBillTo = dt1.Rows[i]["bill_to_name"].ToString();
                a++;
            }
            %>
            <%
                if (!strOrdDate.Equals(dt1.Rows[i]["order_dt"].ToString()) || !strBillToBis.Equals(dt1.Rows[i]["bill_to_name"].ToString()) || !strCompare.Equals(dt1.Rows[i]["po_no"].ToString()))
                {
            %>
            <td rowspan="<%=arrOrdDate_count[b]%>" class="xl38" style='border-top: none; border-left: none'>
                <%=System.DateTime.ParseExact(dt1.Rows[i]["order_dt"].ToString(), "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%>
            </td>
            <td rowspan="<%=arrOrdDate_count[b]%>" class="xl26" style='border-top: none; border-left: none'>
                <%= dt1.Rows[i]["po_no"]%>
            </td>
            <% 
                strOrdDate = dt1.Rows[i]["order_dt"].ToString();
                strBillToBis = dt1.Rows[i]["bill_to_name"].ToString();
                strCompare = dt1.Rows[i]["po_no"].ToString();
                b++;
            }
            %>
            <td class="xl38" style='border-top: none; border-left: none' x:num>
                <%= dt1.Rows[i]["seq_num"]%>
            </td>
            <td class="xl26" style='border-top: none; border-left: none'>
                <%= dt1.Rows[i]["item_code"]%>
            </td>
            <td class="xl39" width="111" style='border-top: none; border-left: none; width: 83pt'>
                <%= dt1.Rows[i]["item_name"]%>
            </td>
            <td class="xl38" style='border-top: none; border-left: none'>
                <%= dt1.Rows[i]["ord_uom"]%>
            </td>
            <td class="xl27" align="right" style='border-top: none; border-left: none' x:num>
                <%= dt1.Rows[i]["unit_price"]%>
            </td>
            <td class="xl28" align="right" style='border-top: none; border-left: none' x:num>
                <%= dt1.Rows[i]["ord_qty"]%>
            </td>
            <td class="xl27" align="right" style='border-top: none; border-left: none' x:num>
                <%= dt1.Rows[i]["amount"]%>
            </td>
            <td class="xl28" align="right" style='border-top: none; border-left: none' x:num>
                <%= dt1.Rows[i]["out_qty"]%>
            </td>
            <td class="xl27" align="right" style='border-top: none; border-left: none' x:num>
                <%= dt1.Rows[i]["deli_amount"]%>
            </td>
            <td class="xl28" align="right" style='border-top: none; border-left: none' x:num>
                <%= dt1.Rows[i]["bal_qty"]%>
            </td>
            <td class="xl27" align="right" style='border-top: none; border-left: none' x:num>
                <%= dt1.Rows[i]["bal_amount"]%>
            </td>
        </tr>
        <%
            if (dt1.Rows[i]["ord_qty"].ToString() != "")
            {
                ord_qty += Convert.ToDecimal(dt1.Rows[i]["ord_qty"]);
            }
            if (dt1.Rows[i]["amount"].ToString() != "")
            {
                amount += Convert.ToDecimal(dt1.Rows[i]["amount"]);
            }
            if (dt1.Rows[i]["out_qty"].ToString() != "")
            {
                deli_qty += Convert.ToDecimal(dt1.Rows[i]["out_qty"]);
            }
            if (dt1.Rows[i]["deli_amount"].ToString() != "")
            {
                deli_amount += Convert.ToDecimal(dt1.Rows[i]["deli_amount"]);
            }
            if (dt1.Rows[i]["bal_qty"].ToString() != "")
            {
                bal_qty += Convert.ToDecimal(dt1.Rows[i]["bal_qty"]);
            }
            if (dt1.Rows[i]["bal_amount"].ToString() != "")
            {
                bal_amount += Convert.ToDecimal(dt1.Rows[i]["bal_amount"]);
            }
            _strBillTo = dt1.Rows[i]["bill_to_name"].ToString();
            } %>
        <tr height="20" style='mso-height-source: userset; height: 15.0pt'>
            <td colspan="8" height="20" class="xl35" style='border-right: .5pt solid black; height: 15.0pt'>
                Total
            </td>
			<td class="xl34" align="right" style='border-top: none; border-left: none' x:num>
                <%= ord_qty %>
            </td>
            <td class="xl34" align="right" style='border-top: none; border-left: none' x:num>
                <%= amount %>
            </td>
            <td class="xl34" align="right" style='border-top: none; border-left: none' x:num>
                <%= deli_qty %>
            </td>
            <td class="xl34" style='border-top: none; border-left: none'  x:num>
                <%= deli_amount %>
            </td>
            <td class="xl34" align="right" style='border-top: none; border-left: none' x:num>
                <%= bal_qty %>
            </td>
            <td class="xl33" align="right" style='border-top: none; border-left: none' x:num>
                <%= bal_amount %>
            </td>
        </tr>
        <![if supportMisalignedColumns]>
        <tr height="0" style='display: none'>
            <td width="106" style='width: 80pt'>
            </td>
            <td width="64" style='width: 48pt'>
            </td>
            <td width="72" style='width: 54pt'>
            </td>
            <td width="39" style='width: 29pt'>
            </td>
            <td width="81" style='width: 61pt'>
            </td>
            <td width="111" style='width: 83pt'>
            </td>
            <td width="49" style='width: 37pt'>
            </td>
            <td width="65" style='width: 49pt'>
            </td>
            <td width="53" style='width: 40pt'>
            </td>
            <td width="93" style='width: 70pt'>
            </td>
            <td width="53" style='width: 40pt'>
            </td>
            <td width="93" style='width: 70pt'>
            </td>
            <td width="53" style='width: 40pt'>
            </td>
            <td width="88" style='width: 66pt'>
            </td>
        </tr>
        <![endif]>
    </table>
</body>
</html>
