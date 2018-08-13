<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>

<% CtlLib.SetUser(Session["APP_DBUSER"].ToString());%>
<% 	
	Response.ContentType = "application/vnd.ms-excel"; 
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
    string p_date_type, p_from_dt, p_to_dt, p_slip_cust, p_item, p_bal_yn, para, str_photo_pk;
    p_date_type = Request.QueryString["p_date_type"];
    p_from_dt   = Request.QueryString["p_from_dt"];
    p_to_dt     = Request.QueryString["p_to_dt"];
    p_slip_cust = Request.QueryString["p_slip_cust"];
    p_item      = Request.QueryString["p_item"];
    p_bal_yn    = Request.QueryString["p_bal_yn"];
    
    para = "'" + p_date_type + "','" + p_from_dt + "','" + p_to_dt + "','" + p_slip_cust + "','" +p_item + "','" + p_bal_yn + "'";
    DataTable dt,dt1;
    dt1 = CtlLib.TableReadOpenCursor("sale.sp_rpt_dscd00040_1", para);
    dt = CtlLib.TableReadOpenCursor("sale.sp_rpt_dscd00040");
    if (dt.Rows.Count > 0) str_photo_pk = dt.Rows[0]["tco_bpphoto_pk"].ToString();
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="ddd_files/filelist.xml">
<link rel=Edit-Time-Data href="ddd_files/editdata.mso">
<link rel=OLE-Object-Data href="ddd_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Mr Lee</o:Author>
  <o:LastAuthor>SERVER_LG</o:LastAuthor>
  <o:LastPrinted>2011-06-13T06:48:34Z</o:LastPrinted>
  <o:Created>2011-06-10T09:01:23Z</o:Created>
  <o:LastSaved>2011-07-11T06:25:40Z</o:LastSaved>
  <o:Company>Prive</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"Page &P of &N";
	margin:.37in .27in .46in .28in;
	mso-header-margin:.33in;
	mso-footer-margin:.31in;
	mso-page-orientation:landscape;}
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
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl26
	{mso-style-parent:style21;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl31
	{mso-style-parent:style21;
	color:navy;
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
.xl32
	{mso-style-parent:style21;
	color:navy;
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
.xl33
	{mso-style-parent:style21;
	color:navy;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
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
	border-left:none;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"dd\/mm\/yy";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:right;
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
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl41
	{mso-style-parent:style21;
	color:black;
	font-size:18.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl42
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl43
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl44
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
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
    <x:Name>Sheet</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>210</x:DefaultRowHeight>
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
       <x:ActiveRow>7</x:ActiveRow>
       <x:ActiveCol>14</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>13740</x:WindowHeight>
  <x:WindowWidth>19200</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>255</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1026"/>
</xml>
<v:shape id="_x0000_s1025" type="#_x0000_t75" style='position:absolute;
   margin-left:2.25pt;margin-top:3pt;width:72.75pt;height:34.5pt;z-index:1'>
   <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt.Rows[0]["tco_bpphoto_pk"]%>&table_name=tco_bpphoto" o:title="img00001"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><![endif]-->
</head>

<body link=blue vlink=purple class=xl25>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1143 style='border-collapse:
 collapse;table-layout:fixed;width:860pt'>
 <col class=xl25 width=127 style='mso-width-source:userset;mso-width-alt:4644;
 width:95pt'>
 <col class=xl25 width=65 style='mso-width-source:userset;mso-width-alt:2377;
 width:49pt'>
 <col class=xl25 width=87 style='mso-width-source:userset;mso-width-alt:3181;
 width:65pt'>
 <col class=xl25 width=79 style='mso-width-source:userset;mso-width-alt:2889;
 width:59pt'>
 <col class=xl25 width=33 style='mso-width-source:userset;mso-width-alt:1206;
 width:25pt'>
 <col class=xl25 width=80 style='mso-width-source:userset;mso-width-alt:2925;
 width:60pt'>
 <col class=xl25 width=103 style='mso-width-source:userset;mso-width-alt:3766;
 width:77pt'>
 <col class=xl25 width=44 style='mso-width-source:userset;mso-width-alt:1609;
 width:33pt'>
 <col class=xl25 width=65 style='mso-width-source:userset;mso-width-alt:2377;
 width:49pt'>
 <col class=xl25 width=58 span=5 style='mso-width-source:userset;mso-width-alt:
 2121;width:44pt'>
 <col class=xl25 width=42 style='mso-width-source:userset;mso-width-alt:1536;
 width:32pt'>
 <col class=xl25 width=64 span=2 style='width:48pt'>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl25 width=127 style='height:15.0pt;width:95pt'></td>
  <td colspan=14 rowspan=2 class=xl41 width=888 style='width:669pt'
  x:fmla="=UPPER( &quot;Goods Delivery Checking&quot;)">GOODS DELIVERY CHECKING</td>
  <td class=xl26 width=64 style='width:48pt'></td>
  <td class=xl26 width=64 style='width:48pt'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl25 style='height:15.0pt'></td>
  <td colspan=2 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl27 style='height:15.0pt'></td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl28 width=33 style='width:25pt'>&nbsp;</td>
  <td class=xl29 width=80 style='width:60pt'>Date</td>
  <td class=xl30 colspan=3 style='mso-ignore:colspan'><%=System.DateTime.ParseExact(p_from_dt, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%> ~ <%=System.DateTime.ParseExact(p_to_dt, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%></td>
  <td class=xl28 width=58 style='width:44pt'>&nbsp;</td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl42><%= DateTime.Now.ToString("dd/MM/yyyy HH:mm") %></td>
  <td colspan=2 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
        
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl31 width=127 style='height:22.5pt;width:95pt'>Partner</td>
  <td class=xl32 width=65 style='width:49pt'>Order DT</td>
  <td class=xl32 width=87 style='width:65pt'>Slip No</td>
  <td class=xl32 width=79 style='width:59pt'>P/O No</td>
  <td class=xl33 width=33 style='width:25pt'>Seq</td>
  <td class=xl33 width=80 style='width:60pt'>Item Code</td>
  <td class=xl33 width=103 style='width:77pt'>Item Name</td>
  <td class=xl33 width=44 style='width:33pt'>UOM</td>
  <td class=xl33 width=65 style='width:49pt'>ETD</td>
  <td class=xl33 width=58 style='width:44pt'>Ord Qty</td>
  <td class=xl32 width=58 style='width:44pt'>Prod Qty</td>
  <td class=xl32 width=58 style='width:44pt'>Out Qty</td>
  <td class=xl32 width=58 style='width:44pt'>Return Qty</td>
  <td class=xl33 width=58 style='width:44pt'>Balance Qty</td>
  <td class=xl33 width=42 style='width:32pt'>Days Left</td>
  <td colspan=2 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <% 
     string strPartner = string.Empty;
     int[] arrPartner_count = new int[dt1.Rows.Count];
     int a = 0;
     int strPartner_count = 1;

     for (int y = 0; y < dt1.Rows.Count; y++)
     {
         if (strPartner == "" || strPartner == null)
         {
             strPartner = dt1.Rows[y]["partner_name"].ToString();
             strPartner_count = 1;
         }
         else
         {
             if (dt1.Rows[y]["partner_name"].ToString().Trim() != strPartner.Trim())
             {
                 arrPartner_count[a] = strPartner_count;
                 strPartner_count = 1;
                 a++;
                 strPartner = dt1.Rows[y]["partner_name"].ToString();
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
             strBillToBis = dt1.Rows[z]["partner_name"].ToString();
             strCompare = dt1.Rows[z]["po_no"].ToString();
             strOrdDate_count = 1;
         }
         else
         {
             if (!dt1.Rows[z]["order_dt"].ToString().Trim().Equals(strOrdDate.Trim()) || !dt1.Rows[z]["partner_name"].ToString().Trim().Equals(strBillToBis.Trim()) || !dt1.Rows[z]["po_no"].ToString().Trim().Equals(strCompare.Trim()))
             {
                 arrOrdDate_count[b] = strOrdDate_count;
                 strOrdDate_count = 1;
                 b++;
                 strOrdDate = dt1.Rows[z]["order_dt"].ToString();
                 strBillToBis = dt1.Rows[z]["partner_name"].ToString();
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
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
 <%
                if (strPartner != dt1.Rows[i]["partner_name"].ToString())
                {
 %>
  <td rowspan="<%=arrPartner_count[a]%>" height=25 class=xl34 width=127 style='height:18.75pt;width:95pt'><%= dt1.Rows[i]["partner_name"]%></td>
  <% 
                    strPartner = dt1.Rows[i]["partner_name"].ToString();
                    a++;
                }
  %>  
    <%
        if (!strOrdDate.Equals(dt1.Rows[i]["order_dt"].ToString()) || !strBillToBis.Equals(dt1.Rows[i]["partner_name"].ToString()) || !strCompare.Equals(dt1.Rows[i]["po_no"].ToString()))
                {
 %>
  <td rowspan="<%=arrOrdDate_count[b]%>" class=xl43 width=65 style='border-left:none;width:49pt'><%= dt1.Rows[i]["order_dt"]%></td>
  <td rowspan="<%=arrOrdDate_count[b]%>" class=xl34 width=87 style='border-left:none;width:65pt'><%= dt1.Rows[i]["slip_no"]%></td>
  <td rowspan="<%=arrOrdDate_count[b]%>" class=xl44 width=79 style='border-left:none;width:59pt'><%= dt1.Rows[i]["po_no"]%></td>
  <% 
      strOrdDate = dt1.Rows[i]["order_dt"].ToString();
      strBillToBis = dt1.Rows[i]["partner_name"].ToString();
      strCompare = dt1.Rows[i]["po_no"].ToString();
      b++;
                }
  %>  
  <td class=xl35 width=33 style='width:25pt' x:num><%= dt1.Rows[i]["seq_num"]%></td>
  <td class=xl35 width=80 style='width:60pt'><%= dt1.Rows[i]["item_code"]%></td>
  <td class=xl36 width=103 style='width:77pt'><%= dt1.Rows[i]["item_name"]%></td>
  <td class=xl37 width=44 style='width:33pt'><%= dt1.Rows[i]["ord_uom"]%></td>
  <td class=xl38 width=65 style='width:49pt'><%= dt1.Rows[i]["item_etd"]%></td>
  <td class=xl39 width=58 style='width:44pt' x:num><%= dt1.Rows[i]["ord_qty"]%>   </td>
  <td class=xl39 width=58 style='width:44pt' x:num><%= dt1.Rows[i]["prod_qty"]%>  </td>
  <td class=xl39 width=58 style='width:44pt' x:num><%= dt1.Rows[i]["out_qty"]%>   </td>
  <td class=xl39 width=58 style='width:44pt' x:num><%= dt1.Rows[i]["return_qty"]%></td>
  <td class=xl39 width=58 style='width:44pt' x:num><%= dt1.Rows[i]["bal_qty"]%>   </td>
  <td class=xl40 width=42 style='width:32pt' x:num><%= dt1.Rows[i]["days_left"]%> </td>
  <td colspan=2 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
  <%     }     %>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=127 style='width:95pt'></td>
  <td width=65 style='width:49pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=79 style='width:59pt'></td>
  <td width=33 style='width:25pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=103 style='width:77pt'></td>
  <td width=44 style='width:33pt'></td>
  <td width=65 style='width:49pt'></td>
  <td width=58 style='width:44pt'></td>
  <td width=58 style='width:44pt'></td>
  <td width=58 style='width:44pt'></td>
  <td width=58 style='width:44pt'></td>
  <td width=58 style='width:44pt'></td>
  <td width=42 style='width:32pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
