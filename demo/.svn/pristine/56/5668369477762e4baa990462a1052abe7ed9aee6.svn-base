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
       
    dt = CtlLib.TableReadOpenCursor("rpt_60280040_3", l_tcm_invoice_pk);
    
    string t_point_name = "" ,t_amt_vn="", t_room_no = "" , t_invoice_id = "" , t_guest_name = "" , t_invoice_date = "" , t_invoice_amt = "" , t_service_rate = "", t_vat_rate = "", t_discount_amt = "", t_invoice_amtvat = "", t_amt_in_words = "";
        
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
         t_invoice_amtvat = dt.Rows[0]["invoice_amtvat"].ToString();
         t_amt_in_words = dt.Rows[0]["amt_in_words"].ToString();
		 t_amt_vn=dt.Rows[0]["amt_vnd"].ToString();
    }
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="123321_files/filelist.xml">
<link rel=Edit-Time-Data href="123321_files/editdata.mso">
<link rel=OLE-Object-Data href="123321_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>VINAGENUWIN</o:Author>
  <o:LastAuthor>dieu</o:LastAuthor>
  <o:LastPrinted>2010-12-21T09:22:43Z</o:LastPrinted>
  <o:Created>2010-12-15T03:50:21Z</o:Created>
  <o:LastSaved>2010-12-21T09:23:52Z</o:LastSaved>
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
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl27
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl28
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl29
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl30
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl31
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl32
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl33
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl34
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl35
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl36
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl37
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl38
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl39
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl40
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl41
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl42
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl43
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:none;
	border-left:none;}
.xl44
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl45
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl46
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:none;
	border-left:none;}
.xl47
	{mso-style-parent:style22;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\#\,\#\#0\.\#0";
	text-align:right;}
.xl48
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl49
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl50
	{mso-style-parent:style21;
	font-size:11.0pt;
	font-weight:700;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl51
	{mso-style-parent:style21;
	font-size:11.0pt;
	font-weight:700;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl52
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Medium Date";
	text-align:left;}
.xl53
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl54
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl55
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
.xl56
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
.xl57
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl58
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
.xl59
	{mso-style-parent:style22;
	color:black;
	font-size:18.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl60
	{mso-style-parent:style22;
	color:black;
	font-size:18.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:none;
	border-left:none;}
.xl61
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl62
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl63
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl64
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;}
.xl65
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:none;
	border-left:none;}
.xl66
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl67
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl68
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl69
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl70
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0.00";
	text-align:right;}
.xl71
	{mso-style-parent:style22;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;}
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
       <x:ActiveRow>21</x:ActiveRow>
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
  <x:WindowHeight>8790</x:WindowHeight>
  <x:WindowWidth>19200</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>255</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=gray vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=601 style='border-collapse:
 collapse;table-layout:fixed;width:451pt'>
 <col width=48 style='mso-width-source:userset;mso-width-alt:1755;width:36pt'>
 <col width=64 span=5 style='width:48pt'>
 <col width=41 style='mso-width-source:userset;mso-width-alt:1499;width:31pt'>
 <col width=64 span=3 style='width:48pt'>
 <tr height=19 style='height:14.25pt'>
  <td colspan=10 height=19 class=xl55 width=601 style='border-right:1.0pt solid black;
  height:14.25pt;width:451pt'>SONG GIA SUITE HOTEL BY HUYNDAI<br>
    Luu Kiem, Thuy Nguyen, Hai Phong. Tel: +84 313963215 Fax: +84
  313963332<br>
    www.songgia@songgia.com</td>
 </tr>
 <tr height=30 style='height:22.5pt'>
  <td colspan=10 height=30 class=xl58 style='border-right:1.0pt solid black;
  height:22.5pt'><%=t_point_name%> HOTEL BILL</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl45 style='height:15.0pt'>ROOM#:</td>
  <td colspan=3 class=xl26 x:num><%=t_room_no %></td>
  <td class=xl26>NO</td>
  <td colspan=2 class=xl26 x:num><%=t_invoice_id %></td>
  <td class=xl27></td>
  <td class=xl28>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl50 style='height:15.0pt'>GUEST NAME:</td>
  <td colspan=3 class=xl51><%=t_guest_name %></td>
  <td class=xl26>DATE</td>
  <td colspan=2 class=xl52 x:num><%=t_invoice_date %></td>
  <td class=xl27></td>
  <td class=xl28>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl32 style='height:14.25pt'>NO</td>
  <td colspan=4 class=xl53 style='border-right:.5pt solid black;border-left:
  none'>DESCRIPTION</td>
  <td class=xl33>UNIT</td>
  <td class=xl34>QTY</td>
  <td class=xl34>PRICE</td>
  <td colspan=2 class=xl48 style='border-right:1.0pt solid black;border-left:
  none'>AMOUNT</td>
 </tr>
 <%
    DataTable dt2;
       
    dt2 = CtlLib.TableReadOpenCursor("sp_rpt_htfo00260_1", l_tcm_invoice_pk);
            
    for (int i=0;i<dt2.Rows.Count;i++)
    {
%>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl35 style='height:15.0pt' x:num><%=i+1%></td>
  <td colspan=4 class=xl66 style='border-right:.5pt solid black;border-left:
  none'><%=dt2.Rows[i]["item"].ToString()%></td>
  <td class=xl36><%=dt2.Rows[i]["unit"].ToString()%></td>
  <td class=xl69 x:num><%=dt2.Rows[i]["item_qty"].ToString()%></td>
  <td class=xl61 x:num=><%=dt2.Rows[i]["price"].ToString()%></td>
  <td colspan=2 class=xl62 style='border-right:1.0pt solid black;border-left:
  none' x:num><%=dt2.Rows[i]["amount"].ToString()%></td>
 </tr>
 <%}%>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl37 style='height:14.25pt'>&nbsp;</td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl47>TOTAL AMT</td>
  <td colspan=4 class=xl64 style='border-right:1.0pt solid black' x:num><%=t_invoice_amt %></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl37 style='height:14.25pt'>&nbsp;</td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl47>SVC(5%)</td>
  <td colspan=4 class=xl64 style='border-right:1.0pt solid black' x:num><%=t_service_rate %></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl37 style='height:14.25pt'>&nbsp;</td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl47>VAT(10%)</td>
  <td colspan=4 class=xl64 style='border-right:1.0pt solid black' x:num><%=t_vat_rate %></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl37 style='height:14.25pt'>&nbsp;</td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl47>DISCOUNT</td>
  <td colspan=4 class=xl64 style='border-right:1.0pt solid black' x:num><%=t_discount_amt %></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl37 style='height:14.25pt'>&nbsp;</td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl47>TOTAL DUE</td>
  <td colspan=4 class=xl71 style='border-right:1.0pt solid black' x:num><%=t_amt_vn %></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl37 style='height:14.25pt'>&nbsp;</td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl47>TOTAL DUE(USD)</td>
  <td colspan=4 class=xl70 style='border-right:1.0pt solid black' x:num><%=t_invoice_amtvat %>$</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl37 colspan=3 style='height:14.25pt;mso-ignore:colspan'>AMOUNT
  IN WORDS:</td>
  <td colspan=7 class=xl42 style='border-right:1.0pt solid black'></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td colspan=10 height=19 class=xl44 style='border-right:1.0pt solid black;
  height:14.25pt'><%=CommondLib.Num2EngText(t_invoice_amtvat,"USD") %></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td colspan=10 height=19 class=xl45 style='border-right:1.0pt solid black;
  height:14.25pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guest's
  Signature
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cashier's
  Signature</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl37 style='height:14.25pt'>&nbsp;</td>
  <td colspan=8 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl38>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl29 style='height:15.0pt'>&nbsp;</td>
  <td colspan=8 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl39 style='height:15.75pt'>&nbsp;</td>
  <td class=xl40>&nbsp;</td>
  <td class=xl40>&nbsp;</td>
  <td class=xl40>&nbsp;</td>
  <td class=xl40>&nbsp;</td>
  <td class=xl40>&nbsp;</td>
  <td class=xl40>&nbsp;</td>
  <td class=xl40>&nbsp;</td>
  <td class=xl40>&nbsp;</td>
  <td class=xl41>&nbsp;</td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=48 style='width:36pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=41 style='width:31pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
