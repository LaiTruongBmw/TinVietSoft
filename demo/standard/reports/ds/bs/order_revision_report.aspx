<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html 
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
    string poPK;
  int i,j;
  string sOldValue ="" ,sNewValue="";
  poPK = "" + Request["poPK"];
  string []arr = {"Note","SO Item No","Item Code","Item Name"
                    ,"Cust Item","St Order Qty","St Unit","Order qty","Item Unit"
                    ,"Unit Price","Vat","Amount","Oder Type","Deli Method","ETD"
                    ,"ETA","Description","Status","Att01","Att02","Att03","Att04"
                    ,"Att05","Att06","Att07","Att08","Att09","Att10","Att11"};
  string SQL
     = "SELECT   note_columns, re_so_item_no, re_item_code, " +
         "         re_item_name, re_cust_item_nm, re_st_ord_qty, re_st_unit, re_ord_qty, " +
         "         re_item_unit, re_unit_price, re_vat_rate, re_amount, " +
         "         re_ord_item_type, re_deli_item_method, to_char(to_date(re_item_etd,'yyyymmdd'),'dd/mm/yyyy'), to_char(to_date(re_item_eta,'yyyymmdd'),'dd/mm/yyyy'), " +
         "         re_description,comm.sf_get_codename ('SAAB0080',  re_ord_item_status) status, re_att01, re_att02, re_att03, " +
         "         re_att04, re_att05, re_att06, re_att07, re_att08, re_att09, re_att10, " +
         "         re_att11, original_data_yn, TO_CHAR(a.re_crt_dt,'mm/dd'), " +
         "         TO_CHAR (TO_DATE (b.revision_date, 'yyyymmdd'), 'mm/dd'), " +
         "         comm.sf_get_partnerloc_nm (c.deli_loc_pk), NVL(sf_get_dsbs00010_1 ('PEARL', a.re_tco_item_pk), '') || ' ' || NVL(sf_get_dsbs00010_1 ('PROD COLOR', a.re_tco_item_pk), ''), " +
         "         sf_get_dsbs00010_1 ('BACK COLOR', a.re_tco_item_pk) back_color,b.SUBJECT,b.ATT01 " +
         "    FROM sale.tsa_sod_revision a, tsa_revision b, tsa_saleorder c " +
         "   WHERE a.del_if = 0 " +
         "     AND b.del_if = 0 " +
         "     AND c.del_if = 0 " +
         "     AND c.pk = a.re_tsa_saleorder_pk " +
         "     AND c.close_yn = 'N' " +
         "     AND b.pk = a.tsa_revision_pk " +
         "     AND a.close_yn = 'N' " +
         "     AND b.close_yn = 'N' " +
         "     AND b.pk in ("+ poPK +")"+
         "ORDER BY re_tsa_saleorder_pk, " +
         "         re_tsa_saleorderd_pk, " +
         "         tsa_revision_pk, " +
         "         a.seq_num ASC, " +
         "         a.original_data_yn DESC ";
	
  DataTable dt = CtlLib.TableReadOpen(SQL);
  %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="order_revision_report_files/filelist.xml">
<link rel=Edit-Time-Data href="order_revision_report_files/editdata.mso">
<link rel=OLE-Object-Data href="order_revision_report_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>tuyen</o:LastAuthor>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2008-08-15T04:32:58Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.5in .5in .5in .5in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-page-orientation:landscape;
	mso-horizontal-page-align:center;}
.font5
	{color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Batang, serif;
	mso-font-charset:129;}
.font6
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font7
	{color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
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
	padding:0px;
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
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl25
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;}
.xl26
	{mso-style-parent:style0;
	color:red;
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl29
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\0022M\0022";
	text-align:right;
	vertical-align:middle;}
.xl30
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl31
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;}
.xl32
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;}
.xl33
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl34
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl35
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl36
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\0022M\0022";
	text-align:right;}
.xl37
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;}
.xl38
	{mso-style-parent:style0;
	font-weight:700;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	background:yellow;
	mso-pattern:auto none;}
.xl39
	{mso-style-parent:style0;
	font-weight:700;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:yellow;
	mso-pattern:auto none;}
.xl40
	{mso-style-parent:style0;
	font-weight:700;
    font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:yellow;
	mso-pattern:auto none;}
.xl41
	{mso-style-parent:style0;
	font-weight:700;
    font-size:12.0pt;
	font-family:Arial, sans-serif;	
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:yellow;
	mso-pattern:auto none;}
.xl42
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:yellow;
	mso-pattern:auto none;}
.xl43
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	font-size:12.0pt;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\0022M\0022";
	text-align:right;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:yellow;
	mso-pattern:auto none;}
.xl44
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	font-size:12.0pt;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	background:yellow;
	mso-pattern:auto none;}
.xl45
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	font-size:12.0pt;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:yellow;
	mso-pattern:auto none;}
.xl46
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl47
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl48
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl49
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	}
.xl50
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl51
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\0022M\0022";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl52
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl53
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl54
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl55
	{mso-style-parent:style0;
	font-family:"Century Gothic", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl56
	{mso-style-parent:style0;
	font-family:"Century Gothic", sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl57
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Century Gothic", sans-serif;
	mso-font-charset:0;
	mso-number-format:"0\.00_\)\;\[Red\]\\\(0\.00\\\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl58
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Century Gothic", sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl59
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl60
	{mso-style-parent:style0;
	color:black;
	font-family:굴림체, monospace;
	mso-font-charset:129;}
.xl61
	{mso-style-parent:style0;
	color:black;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:right;}
.xl62
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;}
.xl63
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\00221팀-\0022General";
	vertical-align:middle;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>345</x:DefaultRowHeight>
     <x:Unsynced/>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>48</x:Scale>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:TopRowVisible>27</x:TopRowVisible>
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
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1043"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=2017 style='border-collapse:
 collapse;table-layout:fixed;width:1514pt'>
 <col class=xl25 width=35 style='mso-width-source:userset;mso-width-alt:1280;
 width:26pt'>
 <col class=xl25 width=109 style='mso-width-source:userset;mso-width-alt:3986;
 width:82pt'>
 <col class=xl25 width=133 style='mso-width-source:userset;mso-width-alt:4864;
 width:100pt'>
 <col class=xl25 width=116 style='mso-width-source:userset;mso-width-alt:4242;
 width:87pt'>
 <col class=xl26 width=115 style='mso-width-source:userset;mso-width-alt:4205;
 width:86pt'>
 <col class=xl27 width=114 style='mso-width-source:userset;mso-width-alt:4169;
 width:86pt'>
 <col class=xl26 width=142 style='mso-width-source:userset;mso-width-alt:5193;
 width:107pt'>
 <col class=xl26 width=156 style='mso-width-source:userset;mso-width-alt:5705;
 width:117pt'>
 <col class=xl24 width=166 style='mso-width-source:userset;mso-width-alt:6070;
 width:125pt'>
 <col class=xl24 width=122 style='mso-width-source:userset;mso-width-alt:4461;
 width:92pt'>
 <col class=xl28 width=59 style='mso-width-source:userset;mso-width-alt:2157;
 width:44pt'>
 <col class=xl26 width=187 style='mso-width-source:userset;mso-width-alt:6838;
 width:140pt'>
 <col class=xl26 width=139 style='mso-width-source:userset;mso-width-alt:5083;
 width:104pt'>
 <col class=xl29 width=187 style='mso-width-source:userset;mso-width-alt:6838;
 width:140pt'>
 <col class=xl29 width=213 style='mso-width-source:userset;mso-width-alt:7789;
 width:160pt'>
 <col class=xl30 width=101 style='mso-width-source:userset;mso-width-alt:3693;
 width:76pt'>
 <col class=xl24 width=98 span=240 style='mso-width-source:userset;mso-width-alt:
 3584;width:74pt'> 
 <tr height=45 style='mso-height-source:userset;height:33.75pt'>
  <td colspan=16 height=45 class=xl62 width=2017 style='height:33.75pt;
  width:1514pt' x:str="       ORDER REVISION "><span
  style='mso-spacerun:yes'>       </span>ORDER REVISION<span
  style='mso-spacerun:yes'> </span></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td height=23 class=xl25 style='height:17.25pt'></td>
  <td class=xl26></td>
  <td colspan=2 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <tr class=xl35 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=3 height=22 class=xl63 style='height:16.5pt'></td>
  <td class=xl32></td>
  <td class=xl33></td>
  <td class=xl34></td>
  <td colspan=2 class=xl33 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl35 style='mso-ignore:colspan'></td>
  <td class=xl36></td>
  <td colspan=4 class=xl33 style='mso-ignore:colspan'></td>
  <td class=xl37></td>
 </tr>
 <tr class=xl46 height=31 style='mso-height-source:userset;height:23.25pt'>
  <td height=31 class=xl38 style='height:23.25pt'>No.</td>
  <td class=xl39 style='border-left:none'>ISSUE DATE</td>
  <td class=xl39 style='border-left:none'>REVISION DATE</td>
  <td class=xl39 style='border-left:none'>PRODUCTION</td>
  <td class=xl40 style='border-left:none'>CUSTOMER</td>
  <td class=xl40 style='border-left:none'>PROD. No.</td>
  <td class=xl41 style='border-left:none'>ITEM</td>
  <td class=xl41 style='border-left:none'>PATTERN</td>
  <td class=xl41 style='border-left:none'>COLOR</td>
  <td class=xl41 style='border-left:none'>BACK COLOR</td>
  <td class=xl41 style='border-left:none'>Q'TY</td>
  <td class=xl40 style='border-left:none'>REVISION</td>
  <td class=xl40 style='border-left:none'>REASON</td>
  <td class=xl44>BEFORE REVISION</td>
  <td class=xl40 style='border-left:none'>AFTER REVISION</td>
  <td class=xl45 style='border-left:none'>REMARK</td>
 </tr>
<% if (dt.Rows.Count > 0)
   {
       int count = 0;
       for (i = 1; i < dt.Rows.Count; i=i+2)
       {
           count++;
           sOldValue = "";
           sNewValue = "";
           for (j = 1; j < arr.Length; j++)
           {
               if (!dt.Rows[i][j].Equals(dt.Rows[i - 1][j]))
               {
                   sOldValue = sOldValue + arr[j]+":" + dt.Rows[i - 1][j].ToString()+" <br>";
                   sNewValue = sNewValue + arr[j]+":" + dt.Rows[i][j].ToString() + " <br>";
               }
           }
             %> 
             <% 
                 if (i < dt.Rows.Count - 1)
                 {
             %>
                  <tr class=xl24 height=69 style='mso-height-source:userset'>
                  <td height=69 class=xl47 style='border-left:1pt solid windowtext'><%=count%></td>
                  <td class=xl47 style='border-left:none'><%=dt.Rows[i - 1][30].ToString()%></td>
                  <td class=xl47 style='border-left:none'><%=dt.Rows[i - 1][31].ToString()%></td>
                  <td class=xl47 style='border-left:none'><%=dt.Rows[i - 1][12].ToString()%></td>
                  <td class=xl48 style='border-left:none'><%=dt.Rows[i - 1][32].ToString()%></td>
                  <td class=xl49 style='border-left:none'><%=dt.Rows[i - 1][1].ToString()%></td>
                  <td class=xl50 style='border-left:none'><%=dt.Rows[i - 1][3].ToString()%></td>
                  <td class=xl50 style='border-left:none'><%=dt.Rows[i - 1][22].ToString()%></td>
                  <td class=xl50 style='border-left:none'><%=dt.Rows[i - 1][33].ToString()%></td>
                  <td class=xl50 style='border-left:none'><%=dt.Rows[i - 1][34].ToString()%></td>
                  <td class=xl51 style='border-left:none'><%=dt.Rows[i - 1][7].ToString() + dt.Rows[i - 1][8].ToString()%></td>
                  <td class=xl48 style='border-left:none'><%=dt.Rows[i - 1][35].ToString()%></td>
                  <td class=xl52 width=139 style='border-left:none;width:104pt'><%=dt.Rows[i][0].ToString()%></td>
                  <td class=xl50 style='border-left:none'><%=sOldValue%></td>
                  <td class=xl50 style='border-left:none'><%=sNewValue%></td>
                  <td class=xl53 style='border-left:none;border-right:1pt solid windowtext'><%=dt.Rows[i - 1][36].ToString()%></td>
                 </tr>                  
                 <% 
                 }
                 else
                 { 
                 %>
                      <tr class=xl24 height=69 style='mso-height-source:userset'>
                      <td height=69 class=xl47 style='border-left:1pt solid windowtext;border-bottom:1pt solid windowtext'><%=count%></td>
                      <td class=xl47 style='border-left:none;border-bottom:1pt solid windowtext'><%=dt.Rows[i - 1][30].ToString()%></td>
                      <td class=xl47 style='border-left:none;border-bottom:1pt solid windowtext'><%=dt.Rows[i - 1][31].ToString()%></td>
                      <td class=xl47 style='border-left:none;border-bottom:1pt solid windowtext'><%=dt.Rows[i - 1][12].ToString()%></td>
                      <td class=xl48 style='border-left:none;border-bottom:1pt solid windowtext'><%=dt.Rows[i - 1][32].ToString()%></td>
                      <td class=xl49 style='border-left:none;border-bottom:1pt solid windowtext'><%=dt.Rows[i - 1][1].ToString()%></td>
                      <td class=xl50 style='border-left:none;border-bottom:1pt solid windowtext'><%=dt.Rows[i - 1][3].ToString()%></td>
                      <td class=xl50 style='border-left:none;border-bottom:1pt solid windowtext'><%=dt.Rows[i - 1][22].ToString()%></td>
                      <td class=xl50 style='border-left:none;border-bottom:1pt solid windowtext'><%=dt.Rows[i - 1][33].ToString()%></td>
                      <td class=xl50 style='border-left:none;border-bottom:1pt solid windowtext'><%=dt.Rows[i - 1][34].ToString()%></td>
                      <td class=xl51 style='border-left:none;border-bottom:1pt solid windowtext'><%=dt.Rows[i - 1][7].ToString() + dt.Rows[i - 1][8].ToString()%></td>
                      <td class=xl48 style='border-left:none;border-bottom:1pt solid windowtext'><%=dt.Rows[i - 1][35].ToString()%></td>
                      <td class=xl52 width=139 style='border-left:none;width:104pt;border-bottom:1pt solid windowtext'><%=dt.Rows[i][0].ToString()%></td>
                      <td class=xl50 style='border-left:none;border-bottom:1pt solid windowtext'><%=sOldValue%></td>
                      <td class=xl50 style='border-left:none;border-bottom:1pt solid windowtext'><%=sNewValue%></td>
                      <td class=xl53 style='border-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid windowtext'><%=dt.Rows[i - 1][36].ToString()%></td>                                     
               <% } %>
               <%
           
       }
   }
%>     
 <tr height=23 style='height:17.25pt'>
  <td height=23 colspan=4 class=xl25 style='height:17.25pt;mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 colspan=4 class=xl25 style='height:17.25pt;mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl25 style='height:17.25pt'></td>
  <td align=left valign=top>
  <![if !vml]><span
  style='mso-ignore:vglayout;position:absolute;z-index:1;margin-left:63px;
  margin-top:11px;width:785px;height:168px'><img width=785 height=168
  src="order_revision_report_files/image001.gif" v:shapes="_x0000_s1025 _x0000_s1026 _x0000_s1027 _x0000_s1028 _x0000_s1029 _x0000_s1030 _x0000_s1031 _x0000_s1032 _x0000_s1033 Text_x0020_7 Text_x0020_8 Text_x0020_9 Text_x0020_10 Text_x0020_11 Text_x0020_12 Text_x0020_13 _x0000_s1041 Text_x0020_44"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=23 class=xl25 width=88 style='height:17.25pt;width:66pt'></td>
   </tr>
  </table>
  </span></td>
  <td colspan=2 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 colspan=4 class=xl25 style='height:17.25pt;mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 colspan=4 class=xl25 style='height:17.25pt;mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 colspan=4 class=xl25 style='height:17.25pt;mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 colspan=4 class=xl25 style='height:17.25pt;mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 colspan=4 class=xl25 style='height:17.25pt;mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 colspan=4 class=xl25 style='height:17.25pt;mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 colspan=4 class=xl25 style='height:17.25pt;mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td height=23 colspan=4 class=xl25 style='height:17.25pt;mso-ignore:colspan'></td>
  <td colspan=7 class=xl60 style='mso-ignore:colspan'></td>
  <td class=xl61></td>
  <td class=xl27></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td height=23 colspan=4 class=xl25 style='height:17.25pt;mso-ignore:colspan'></td>
  <td colspan=8 style='mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td height=23 colspan=4 class=xl25 style='height:17.25pt;mso-ignore:colspan'></td>
  <td colspan=7 class=xl60 style='mso-ignore:colspan'></td>
  <td class=xl61></td>
  <td class=xl27></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td height=23 colspan=4 class=xl25 style='height:17.25pt;mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td height=23 colspan=4 class=xl25 style='height:17.25pt;mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td height=23 colspan=4 class=xl25 style='height:17.25pt;mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td height=23 colspan=4 class=xl25 style='height:17.25pt;mso-ignore:colspan'></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=35 style='width:26pt'></td>
  <td width=109 style='width:82pt'></td>
  <td width=133 style='width:100pt'></td>
  <td width=116 style='width:87pt'></td>
  <td width=115 style='width:86pt'></td>
  <td width=114 style='width:86pt'></td>
  <td width=142 style='width:107pt'></td>
  <td width=156 style='width:117pt'></td>
  <td width=166 style='width:125pt'></td>
  <td width=122 style='width:92pt'></td>
  <td width=59 style='width:44pt'></td>
  <td width=187 style='width:140pt'></td>
  <td width=139 style='width:104pt'></td>
  <td width=187 style='width:140pt'></td>
  <td width=213 style='width:160pt'></td>
  <td width=101 style='width:76pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
