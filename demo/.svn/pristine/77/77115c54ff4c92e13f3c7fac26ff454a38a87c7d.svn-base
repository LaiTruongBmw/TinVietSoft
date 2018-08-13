<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
    string  l_tcm_invoice_pk = Request.QueryString["tcm_invoice_pk"];

    DataTable dt;
       
    dt = CtlLib.TableReadOpenCursor("ht_rpt_60260020", l_tcm_invoice_pk);
    
    string t_point_name = "" ,t_amt_vn="", t_room_no = "" , t_invoice_id = "" , t_guest_name = "" , t_invoice_date = "" , t_invoice_amt = "" , t_service_rate = "", t_vat_rate = "", t_discount_amt = "", t_invoice_amtvat = "", t_amt_in_words = "",t_payment_method="";
        
    if (dt.Rows.Count > 0)
    {
         t_point_name = dt.Rows[0]["point_name"].ToString();
         t_room_no = dt.Rows[0]["room_no"].ToString();
         t_invoice_id = dt.Rows[0]["invoice_id"].ToString();
         t_guest_name = dt.Rows[0]["guest_name"].ToString();
         t_invoice_date = dt.Rows[0]["invoice_date"].ToString();
         t_invoice_amt = dt.Rows[0]["invoice_amt"].ToString();
         t_service_rate = dt.Rows[0]["service_rate"].ToString();
         t_vat_rate = dt.Rows[0]["vat_rate"].ToString();
         t_discount_amt = dt.Rows[0]["discount_amt"].ToString();
         t_invoice_amtvat = dt.Rows[0]["total_amt"].ToString();
         t_amt_in_words = dt.Rows[0]["amt_in_words"].ToString();
		 t_amt_vn=dt.Rows[0]["amt_vnd"].ToString();
		 t_payment_method=dt.Rows[0]["payment_method"].ToString();
    }
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="htfo00070_files/filelist.xml">
<link rel=Edit-Time-Data href="htfo00070_files/editdata.mso">
<link rel=OLE-Object-Data href="htfo00070_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>VINAGENUWIN</o:Author>
  <o:LastAuthor>truong</o:LastAuthor>
  <o:LastPrinted>2010-12-26T13:50:29Z</o:LastPrinted>
  <o:Created>2010-12-15T03:50:21Z</o:Created>
  <o:LastSaved>2010-12-26T13:51:36Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .69in 1.0in .75in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;}
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style21
	{color:gray;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-style-name:Hyperlink;
	mso-style-id:8;}
a:link
	{color:gray;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
a:visited
	{color:purple;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;}
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
.style22
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
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
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl26
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl27
	{mso-style-parent:style22;
	color:black;
	font-size:18.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl28
	{mso-style-parent:style22;
	color:black;
	font-size:18.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl29
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl30
	{mso-style-parent:style21;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl31
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Medium Date";
	text-align:left;}
.xl32
	{mso-style-parent:style22;
	color:black;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl33
	{mso-style-parent:style22;
	color:black;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl34
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl35
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl36
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	}
.xl37
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\#\,\#\#0\.\#0";
	text-align:right;}
.xl38
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;}
.xl39
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl40
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl41
	{mso-style-parent:style22;
	color:black;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl42
	{mso-style-parent:style22;
	color:black;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl43
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;
	border:.5pt solid windowtext;}
.xl44
	{mso-style-parent:style22;
	color:black;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl45
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl46
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl47
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl48
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl49
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl50
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl51
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl52
	{mso-style-parent:style22;
	color:black;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl53
	{mso-style-parent:style22;
	color:black;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border:.5pt solid windowtext;}
.xl54
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl55
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl56
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl57
	{mso-style-parent:style22;
	color:black;
	font-size:18.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl58
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl59
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Medium Date";
	text-align:left;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl60
	{mso-style-parent:style0;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl61
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl62
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl63
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl64
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl65
	{mso-style-parent:style22;
	color:black;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl66
	{mso-style-parent:style22;
	color:black;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl67
	{mso-style-parent:style0;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl68
	{mso-style-parent:style0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl69
	{mso-style-parent:style22;
	color:black;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
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
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>9</x:ActiveRow>
       <x:ActiveCol>14</x:ActiveCol>
       <x:RangeSelection>$O$9:$O$10</x:RangeSelection>
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
  <x:WindowHeight>9285</x:WindowHeight>
  <x:WindowWidth>19200</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>255</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=gray vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=612 style='border-collapse:
 collapse;table-layout:fixed;width:460pt'>
 <col width=48 style='mso-width-source:userset;mso-width-alt:1755;width:36pt'>
 <col width=64 style='width:48pt'>
 <col width=57 style='mso-width-source:userset;mso-width-alt:2084;width:43pt'>
 <col width=18 style='mso-width-source:userset;mso-width-alt:658;width:14pt'>
 <col width=0 style='display:none;mso-width-source:userset;mso-width-alt:2340'>
 <col width=49 style='mso-width-source:userset;mso-width-alt:1792;width:37pt'>
 <col width=36 style='mso-width-source:userset;mso-width-alt:1316;width:27pt'>
 <col width=61 style='mso-width-source:userset;mso-width-alt:2230;width:46pt'>
 <col width=36 style='mso-width-source:userset;mso-width-alt:1316;width:27pt'>
 <col width=71 style='mso-width-source:userset;mso-width-alt:2596;width:53pt'>
 <col width=36 style='mso-width-source:userset;mso-width-alt:1316;width:27pt'>
 <col width=72 style='mso-width-source:userset;mso-width-alt:2633;width:54pt'>
 <col width=64 style='width:48pt'>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td colspan=13 height=19 class=xl25 width=612 style='border-right:1.0pt solid black;
  height:14.25pt;width:460pt'>AROMA BEACH<br>
    Add: Quarter 5, Phu Hai ward, Phan Thiet city, Binh Thuan province. Tel:  +84 (62) 3828 288  I +84 (62) 3832 345  I Fax: +84 (62) 3828 111<br>
    Website: www.aromabeachresort.com</td>
 </tr>
 <tr height=30 style='height:22.5pt'>
  <td colspan=13 height=30 class=xl27 style='border-right:1.0pt solid black;
  height:22.5pt'><%=t_point_name%> BILL</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl68 style='height:12.75pt'>&nbsp;</td>
  <td colspan=2 class=xl29>ROOM#:</td>
  <td colspan=5 class=xl29 x:num><%=t_room_no %></td>
  <td></td>
  <td class=xl29>NO</td>
  <td colspan=3 class=xl29 style='border-right:1.0pt solid black'
  ><%=t_invoice_id %></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl68 style='height:12.75pt'>&nbsp;</td>
  <td colspan=2 class=xl30>GUEST NAME:</td>
  <td colspan=5 class=xl30><%=t_guest_name %></td>
  <td></td>
  <td class=xl29>DATE</td>
  <td colspan=3 class=xl31 style='border-right:1.0pt solid black'><%=t_invoice_date %></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl32 style='height:12.75pt'><b><%=t_payment_method%></b></td>
  <td colspan=11 class=xl33 style='mso-ignore:colspan'></td>
  <td class=xl60>&nbsp;</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td rowspan=2 height=34 class=xl61 style='border-bottom:.5pt solid black;
  height:25.5pt'>NO</td>
  <td colspan=4 rowspan=2 class=xl46 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black'>DESCRIPTION</td>
  <td rowspan=2 class=xl54 width=49 style='border-bottom:.5pt solid black;
  width:37pt'>UNIT</td>
  <td colspan=2 class=xl34 style='border-right:.5pt solid black;border-left:
  none'>LAUNDRY</td>
  <td colspan=2 class=xl34 style='border-right:.5pt solid black;border-left:
  none'>DRY CLEANING</td>
  <td colspan=2 class=xl34 style='border-right:.5pt solid black;border-left:
  none'>PRESSING ONLY</td>
  <td rowspan=2 class=xl62 width=64 style='border-bottom:.5pt solid black;
  width:48pt'>TOTAL AMOUNT</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl43 style='height:12.75pt;border-top:none;border-left:
  none'>Q.TY</td>
  <td class=xl43 style='border-top:none;border-left:none'>PRICE</td>
  <td class=xl43 style='border-top:none;border-left:none'>Q.TY</td>
  <td class=xl43 style='border-top:none;border-left:none'>PRICE</td>
  <td class=xl43 style='border-top:none;border-left:none'>Q.TY</td>
  <td class=xl43 style='border-top:none;border-left:none'>PRICE</td>
 </tr>
 <%
    DataTable dt2;
       
    dt2 = CtlLib.TableReadOpenCursor("ht_rpt_60260020_1", l_tcm_invoice_pk);
            
    for (int i=0;i<dt2.Rows.Count;i++)
    {
%>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl65 style='height:12.75pt;border-top:none' x:num><%=i+1%></td>
  <td colspan=4 class=xl52 style='border-left:none'><%=dt2.Rows[i]["item"].ToString()%></td>
  <td class=xl44 style='border-top:none;border-left:none'><%=dt2.Rows[i]["unit"].ToString()%></td>
  <td class=xl44 style='border-top:none;border-left:none' x:num><%=dt2.Rows[i]["ld_qty"].ToString()%></td>
  <td class=xl66 style='border-top:none;border-left:none' x:num><%=dt2.Rows[i]["ld_price"].ToString()%></td>
  <td class=xl44 style='border-top:none;border-left:none' x:num><%=dt2.Rows[i]["dc_qty"].ToString()%></td>
  <td class=xl66 style='border-top:none;border-left:none' x:num><%=dt2.Rows[i]["dc_price"].ToString()%></td>
  <td class=xl44 style='border-top:none;border-left:none' x:num><%=dt2.Rows[i]["ps_qty"].ToString()%></td>
  <td class=xl66 style='border-top:none;border-left:none' x:num><%=dt2.Rows[i]["ps_price"].ToString()%></td>
  <td class=xl66 style='border-top:none;border-left:none' x:num><%=dt2.Rows[i]["total_amt"].ToString()%></td>
 </tr>
 <%}%>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl32 style='height:12.75pt'>&nbsp;</td>
  <td colspan=11 class=xl33 style='mso-ignore:colspan'></td>
  <td class=xl60>&nbsp;</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl68 style='height:12.75pt'>&nbsp;</td>
  <td colspan=7 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl37>TOTAL AMT</td>
  <td colspan=2 class=xl66 style='border-right:1.0pt solid black' x:num><%=t_invoice_amt %></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl68 style='height:12.75pt'>&nbsp;</td>
  <td colspan=7 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl37>SVC(5%)</td>
  <td colspan=2 class=xl66 style='border-right:1.0pt solid black' x:num><%=t_service_rate %></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl68 style='height:12.75pt'>&nbsp;</td>
  <td colspan=7 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl37>VAT(10%)</td>
  <td colspan=2 class=xl66 style='border-right:1.0pt solid black' x:num><%=t_vat_rate %></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl68 style='height:12.75pt'>&nbsp;</td>
  <td colspan=7 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl37>DISCOUNT</td>
  <td colspan=2 class=xl66 style='border-right:1.0pt solid black' x:num><%=t_discount_amt %></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl68 style='height:12.75pt'>&nbsp;</td>
  <td colspan=7 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl37>TOTAL DUE</td>
  <td colspan=2 class=xl66 style='border-right:1.0pt solid black' x:num><%=t_amt_vn %></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl68 style='height:12.75pt'>&nbsp;</td>
  <td colspan=7 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl37>TOTAL DUE(USD)</td>
  <td colspan=2 class=xl66 style='border-right:1.0pt solid black'><%=t_invoice_amtvat %> </td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl68 style='height:12.75pt'>&nbsp;</td>
  <td class=xl29 colspan=3 style='mso-ignore:colspan'>AMOUNT IN WORDS:</td>
  <td colspan=8 class=xl36 ><%=CommondLib.Num2VNText(t_amt_vn,"VND") %></td>
  <td class=xl60>&nbsp;</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=10 height=17 class=xl40 style='height:12.75pt'><%=CommondLib.Num2EngText(t_invoice_amtvat,"USD") %></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
  <td class=xl60>&nbsp;</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl68 style='height:12.75pt'>&nbsp;</td>
  <td colspan=11 style='mso-ignore:colspan'></td>
  <td class=xl60>&nbsp;</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl35 style='height:12.75pt'>&nbsp;</td>
  <td class=xl36 colspan=11 style='mso-ignore:colspan'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guest's
  Signature
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cashier's
  Signature</td>
  <td class=xl60>&nbsp;</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl32 style='height:12.75pt'>&nbsp;</td>
  <td colspan=11 class=xl33 style='mso-ignore:colspan'></td>
  <td class=xl60>&nbsp;</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl32 style='height:12.75pt'>&nbsp;</td>
  <td colspan=11 class=xl33 style='mso-ignore:colspan'></td>
  <td class=xl60>&nbsp;</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl32 style='height:12.75pt'>&nbsp;</td>
  <td colspan=11 class=xl33 style='mso-ignore:colspan'></td>
  <td class=xl60>&nbsp;</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl32 style='height:12.75pt'>&nbsp;</td>
  <td></td>
  <td colspan=10 class=xl33 style='mso-ignore:colspan'></td>
  <td class=xl60>&nbsp;</td>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl41 style='height:13.5pt'>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl67>&nbsp;</td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=48 style='width:36pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=57 style='width:43pt'></td>
  <td width=18 style='width:14pt'></td>
  <td width=0></td>
  <td width=49 style='width:37pt'></td>
  <td width=36 style='width:27pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=36 style='width:27pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=36 style='width:27pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
