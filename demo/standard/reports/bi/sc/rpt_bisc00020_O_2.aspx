<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8";
    Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<%
    string p_from_date = Request.QueryString["p_from_date"];
    string p_to_date = Request.QueryString["p_to_date"];
    string p_wh_type = Request.QueryString["p_wh_type"];
    string p_wh = Request.QueryString["p_wh"];
    string p_wh_name = Request.QueryString["p_wh_name"];
	string p_use_yn = Request.QueryString["p_use_yn"];
    string p_item_grp = Request.QueryString["p_item_grp"];
    string p_item = Request.QueryString["p_item"];
    string p_lang = Request.QueryString["p_lang"];

    string para = "'" + p_from_date + "','" + p_to_date + "','" + p_wh_type + "','" + p_wh + "','" + p_use_yn + "','" + p_item_grp + "','" + p_item + "','" + p_lang + "'";
    DataTable dt, dt1;
    dt = CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00020_O_3", "'" + Session["User_ID"].ToString() + "'");
    dt1 = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00020_O_2", para);
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="ProgId" content="Excel.Sheet">
    <meta name="Generator" content="Microsoft Excel 11">
    <link rel="File-List" href="rpt_bisc00020_files/filelist.xml">
    <link rel="Edit-Time-Data" href="rpt_bisc00020_files/editdata.mso">
    <link rel="OLE-Object-Data" href="rpt_bisc00020_files/oledata.mso">
    <!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Mr Khanh</o:LastAuthor>
  <o:LastPrinted>2012-02-04T09:06:05Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2012-02-04T09:06:07Z</o:LastSaved>
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
            margin: .1in .25in .41in .25in;
            mso-header-margin: 0in;
            mso-footer-margin: .11in;
            mso-page-orientation: landscape;
        }
        .font5
        {
            color: windowtext;
            font-size: 8.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
        }
        .font6
        {
            color: windowtext;
            font-size: 8.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
        }
        .font7
        {
            color: black;
            font-size: 8.0pt;
            font-weight: 400;
            font-style: italic;
            text-decoration: none;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
        }
        .font9
        {
            color: black;
            font-size: 8.0pt;
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
        .style21
        {
            mso-number-format: General;
            text-align: general;
            vertical-align: bottom;
            white-space: nowrap;
            mso-rotate: 0;
            mso-background-source: auto;
            mso-pattern: auto;
            color: windowtext;
            font-size: 11.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 돋움, monospace;
            mso-font-charset: 129;
            border: none;
            mso-protection: locked visible;
            mso-style-name: Normal_Sheet1;
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
        .xl25
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
        }
        .xl26
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            vertical-align: middle;
        }
        .xl27
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            vertical-align: middle;
        }
        .xl28
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            vertical-align: middle;
            border-top: none;
            border-right: none;
            border-bottom: 2.0pt double windowtext;
            border-left: none;
        }
        .xl29
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: right;
            vertical-align: middle;
        }
        .xl30
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: left;
            vertical-align: middle;
        }
        .xl31
        {
            mso-style-parent: style21;
            color: black;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: none;
            border-left: .5pt solid windowtext;
            background: #CCFFFF;
            mso-pattern: auto none;
            white-space: normal;
        }
        .xl32
        {
            mso-style-parent: style21;
            color: black;
            font-size: 8.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: none;
            background: #CCFFFF;
            mso-pattern: auto none;
            white-space: normal;
        }
        .xl33
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border: .5pt solid windowtext;
            white-space: normal;
        }
        .xl34
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: none;
            white-space: normal;
        }
        .xl35
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: none;
            white-space: normal;
        }
        .xl36
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "\@";
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: none;
            white-space: normal;
        }
        .xl37
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
            text-align: right;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: none;
            white-space: normal;
        }
        .xl38
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
            text-align: right;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: none;
        }
        .xl39
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
            text-align: right;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: none;
            white-space: normal;
        }
        .xl40
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            mso-number-format: Standard;
            text-align: right;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            border-left: none;
        }
        .xl41
        {
            mso-style-parent: style0;
            font-size: 8.0pt;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: right;
            vertical-align: middle;
            white-space: normal;
        }
        .xl42
        {
            mso-style-parent: style21;
            color: black;
            font-size: 8.0pt;
            font-style: italic;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: right;
            vertical-align: middle;
            border-top: none;
            border-right: none;
            border-bottom: 2.0pt double windowtext;
            border-left: none;
            white-space: normal;
        }
        .xl43
        {
            mso-style-parent: style0;
            font-size: 18.0pt;
            font-weight: 700;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: 2.0pt double windowtext;
            border-right: none;
            border-bottom: none;
            border-left: none;
            white-space: normal;
        }
        .xl44
        {
            mso-style-parent: style0;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: none;
            border-bottom: .5pt solid windowtext;
            border-left: .5pt solid windowtext;
        }
        .xl45
        {
            mso-style-parent: style0;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: none;
            border-bottom: .5pt solid windowtext;
            border-left: none;
        }
        .xl46
        {
            mso-style-parent: style0;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid black;
            border-bottom: .5pt solid windowtext;
            border-left: none;
        }
        --></style>
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
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>6</x:ActiveRow>
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
  <x:WindowHeight>7455</x:WindowHeight>
  <x:WindowWidth>14790</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>1365</x:WindowTopY>
  <x:AcceptLabelsInFormulas/>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$6:$6</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
    <!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1026"/>
</xml><![endif]-->
</head>
<body link="blue" vlink="purple" class="xl25">
    <table x:str border="0" cellpadding="0" cellspacing="0" width="1020" style='border-collapse: collapse;
        table-layout: fixed; width: 768pt'>
        <col class="xl25" width="30" style='mso-width-source: userset; mso-width-alt: 1097;
            width: 23pt'>
        <col class="xl25" width="74" style='mso-width-source: userset; mso-width-alt: 2706;
            width: 56pt'>
        <col class="xl25" width="233" style='mso-width-source: userset; mso-width-alt: 8521;
            width: 175pt'>
        <col class="xl25" width="61" style='mso-width-source: userset; mso-width-alt: 2230;
            width: 46pt'>
        <col class="xl25" width="64" style='width: 48pt'>
        <col class="xl25" width="93" span="6" style='mso-width-source: userset; mso-width-alt: 3401;
            width: 70pt'>
        <tr height="20" style='mso-height-source: userset; height: 15.0pt'>
            <td height="20" class="xl26" width="30" style='height: 15.0pt; width: 23pt'>
                <!--[if gte vml 1]><v:shape id="_x0000_s1025" type="#_x0000_t75" style='position:absolute;
   margin-left:1.5pt;margin-top:1.5pt;width:75pt;height:42pt;z-index:1'>
   <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt.Rows[0]["tco_bpphoto_pk"]%>&table_name=tco_bpphoto" o:title="logo"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]-->
            </td>
            <td class="xl25" width="74" style='width: 56pt'>
            </td>
            <td class="xl27" align="left" width="233" style='width: 175pt'>
                <%= dt.Rows[0]["partner_name"]%>
            </td>
            <td class="xl27" width="61" style='width: 46pt'>
            </td>
            <td class="xl26" width="64" style='width: 48pt'>
            </td>
            <td class="xl25" width="93" style='width: 70pt'>
            </td>
            <td colspan="5" class="xl41" width="465" style='width: 350pt'>
                Tel:
                <%= dt.Rows[0]["phone_no"]%>
            </td>
        </tr>
        <tr height="20" style='mso-height-source: userset; height: 15.0pt'>
            <td height="20" class="xl26" style='height: 15.0pt'>
            </td>
            <td class="xl25">
            </td>
            <td class="xl26" align="left">
                <%= dt.Rows[0]["addr1"]%>
            </td>
            <td colspan="2" class="xl26" style='mso-ignore: colspan'>
            </td>
            <td class="xl25">
            </td>
            <td colspan="5" class="xl41" width="465" style='width: 350pt'>
                Fax:
                <%= dt.Rows[0]["fax_no"]%>
            </td>
        </tr>
        <tr height="20" style='mso-height-source: userset; height: 15.0pt'>
            <td height="20" class="xl28" style='height: 15.0pt'>
                &nbsp;
            </td>
            <td class="xl25">
            </td>
            <td class="xl28" align="left">
                Tax code:
                <%= dt.Rows[0]["tax_code"]%>
            </td>
            <td class="xl28">
                &nbsp;
            </td>
            <td class="xl28">
                &nbsp;
            </td>
            <td class="xl25">
            </td>
            <td colspan="5" class="xl42" width="465" style='width: 350pt'>
                Print date :
                <%= DateTime.Now.ToString("dd/MM/yyyy HH:mm") %>
            </td>
        </tr>
        <tr height="48" style='mso-height-source: userset; height: 36.0pt'>
            <td colspan="11" height="48" class="xl43" width="1020" style='height: 36.0pt; width: 768pt'>
                REPORT W/H STOCK CHECKING
            </td>
        </tr>
        <tr height="28" style='mso-height-source: userset; height: 21.0pt'>
            <td height="28" class="xl26" colspan="2" align="left" style='height: 21.0pt; mso-ignore: colspan'>
                W/H Name :<font class="font6"><%= p_wh_name %></font><font class="font5"><span style='mso-spacerun: yes'>
                </span></font>
            </td>
            <td class="xl26">
            </td>
            <td class="xl27">
            </td>
            <td class="xl26">
            </td>
            <td class="xl29">
                Date:
            </td>
            <td class="xl30" colspan="2" style='mso-ignore: colspan'>
                <%=System.DateTime.ParseExact(p_from_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%>
                -
                <%=System.DateTime.ParseExact(p_to_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%>
            </td>
            <td colspan="2" class="xl30" style='mso-ignore: colspan'>
            </td>
            <td class="xl26">
            </td>
        </tr>
        <tr height="40" style='mso-height-source: userset; height: 30.0pt'>
            <td height="40" class="xl31" width="30" style='height: 30.0pt; width: 23pt'>
                STT
            </td>
            <td class="xl32" width="74" style='width: 56pt'>
                Mã hàng<br>
                <font class="font7">Item Code</font>
            </td>
            <td class="xl32" width="233" style='width: 175pt'>
                Tên hàng<font class="font9"><br>
                </font><font class="font7">Item Description</font>
            </td>
            <td class="xl32" width="61" style='width: 46pt'>
                ĐVT<font class="font9"><br>
                </font><font class="font7">UOM</font>
            </td>
            <td class="xl32" width="64" style='width: 48pt'>
                Lot No
            </td>
            <td class="xl32" width="93" style='width: 70pt'>
                SL Tồn đầu<br>
                <font class="font7">Begin Qty</font>
            </td>
            <td class="xl32" width="93" style='width: 70pt'>
                SL Nhập<br>
                <font class="font7">In Qty</font>
            </td>
            <td class="xl32" width="93" style='width: 70pt'>
                Nhập khác<br>
                <font class="font7">Others In</font>
            </td>
            <td class="xl32" width="93" style='width: 70pt'>
                SL Xuất<font class="font7"><br>
                    Out Qty</font>
            </td>
            <td class="xl32" width="93" style='width: 70pt'>
                Xuất khác<font class="font7"><br>
                    Others Out</font>
            </td>
            <td class="xl32" width="93" style='width: 70pt'>
                SL Tồn cuối<br>
                <font class="font7">End Qty</font>
            </td>
        </tr>
        <%
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
        %>
        <tr height="30" style='mso-height-source: userset; height: 22.5pt'>
            <td height="30" class="xl33" width="30" style='height: 22.5pt; width: 23pt' x:num>
                <%= i + 1 %>
            </td>
            <td class="xl34" align="left" width="74" style='width: 56pt'>
                <%= dt1.Rows[i]["item_code"]%>
            </td>
            <td class="xl34" align="left" width="233" style='width: 175pt'>
                <%= dt1.Rows[i]["item_name"]%>
            </td>
            <td class="xl35" width="61" style='width: 46pt'>
                <%= dt1.Rows[i]["uom"]%>
            </td>
            <td class="xl36" width="64" style='width: 48pt'>
                <%= dt1.Rows[i]["lot_no"]%>
            </td>
            <td class="xl37" width="93" style='width: 70pt' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= dt1.Rows[i]["begin_qty"]%>
            </td>
            <td class="xl37" width="93" style='width: 70pt' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= dt1.Rows[i]["in_qty"]%>
            </td>
            <td class="xl37" width="93" style='width: 70pt' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= dt1.Rows[i]["or_in_qty"]%>
            </td>
            <td class="xl37" width="93" style='width: 70pt' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= dt1.Rows[i]["out_qty"]%>
            </td>
            <td class="xl37" width="93" style='width: 70pt' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= dt1.Rows[i]["or_out_qty"]%>
            </td>
            <td class="xl38" x:num>
                <span style='mso-spacerun: yes'></span>
                <%= dt1.Rows[i]["end_qty"]%>
            </td>
        </tr>
        <% } %>
        <tr height="35" style='mso-height-source: userset; height: 26.25pt'>
            <td colspan="5" height="35" class="xl44" style='border-right: .5pt solid black; height: 26.25pt'>
                Total
            </td>
            <td class="xl39" width="93" style='width: 70pt' x:num x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>F7:F<%= dt1.Rows.Count+6%><%}else{%>F8:F8<%}%>)">
                <span style='mso-spacerun: yes'></span>
            </td>
            <td class="xl39" width="93" style='width: 70pt' x:num x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>G7:G<%= dt1.Rows.Count+6%><%}else{%>G8:G8<%}%>)">
                <span style='mso-spacerun: yes'></span>
            </td>
            <td class="xl39" width="93" style='width: 70pt' x:num x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>H7:H<%= dt1.Rows.Count+6%><%}else{%>H8:H8<%}%>)">
                <span style='mso-spacerun: yes'></span>
            </td>
            <td class="xl39" width="93" style='width: 70pt' x:num x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>I7:I<%= dt1.Rows.Count+6%><%}else{%>I8:I8<%}%>)">
                <span style='mso-spacerun: yes'></span>
            </td>
            <td class="xl39" width="93" style='width: 70pt' x:num x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>J7:J<%= dt1.Rows.Count+6%><%}else{%>J8:J8<%}%>)">
                <span style='mso-spacerun: yes'></span>
            </td>
            <td class="xl40" x:num x:fmla="=SUM(<% if(dt1.Rows.Count > 0){%>K7:K<%= dt1.Rows.Count+6%><%}else{%>K8:K8<%}%>)">
            </td>
        </tr>
        <![if supportMisalignedColumns]>
        <tr height="0" style='display: none'>
            <td width="30" style='width: 23pt'>
            </td>
            <td width="74" style='width: 56pt'>
            </td>
            <td width="233" style='width: 175pt'>
            </td>
            <td width="61" style='width: 46pt'>
            </td>
            <td width="64" style='width: 48pt'>
            </td>
            <td width="93" style='width: 70pt'>
            </td>
            <td width="93" style='width: 70pt'>
            </td>
            <td width="93" style='width: 70pt'>
            </td>
            <td width="93" style='width: 70pt'>
            </td>
            <td width="93" style='width: 70pt'>
            </td>
            <td width="93" style='width: 70pt'>
            </td>
        </tr>
        <![endif]>
    </table>
</body>
</html>