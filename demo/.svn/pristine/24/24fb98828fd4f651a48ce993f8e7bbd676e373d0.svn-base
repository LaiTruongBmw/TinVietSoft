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
    //string p_company_pk = Request.QueryString["p_company_pk"];
    //string p_tlg_mt_div_pk = Request.QueryString["p_tlg_mt_div_pk"];
    //string p_date_type = Request.QueryString["p_date_type"];
    //string p_from_date = Request.QueryString["p_from_date"];
    //string p_to_date = Request.QueryString["p_to_date"];
    //string p_item = Request.QueryString["p_item"];
    //string p_bill_to = Request.QueryString["p_bill_to"];
    //string p_so_uprice = Request.QueryString["p_so_uprice"];
    //string p_order_type = Request.QueryString["p_order_type"];
    string p_parent_pk = Request.QueryString["p_parent_pk"];
    string SQL
    = "SELECT substr(c00,1, length(c00)-1)|| replace(substr(c00,-1),'+',decode(substr(c00,-1),'+','',substr(c00,-1))) c00 " +
        "    , C01 " +
        "    , C02, C03, C04, C05, C06, C07, C08, C09, C10, C11 " +
        "FROM " +
        "( " +
        "select REPLACE( TRIM(lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 1'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 2'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 3'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 4'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 5'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 6'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 7'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 8'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 9'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 10'),'SPEC_NAME') ) " +
        "          ,'++','') c00  " +
        "    , lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'PROD SIZE'),'SPEC_NAME') AS c01  " +
        "    , lg_f_get_prod_color_item(i.pk, I.TLG_IT_ITEMGRP_PK,'MAT COLOR','SPEC_NAME','/') c02  " +
        "    , D.ORD_QTY c03  " +
        "    , I.UOM_LOT c04  " +
        "    , null c05  " +
        "    , I.ITEM_CODE||'('||d.ORD_UOM||')' c06  " +
        "    , B.PARTNER_NAME c07  " +
        "    , M.SLIP_NO c08  " +
        "    , to_char(to_date(M.ORDER_DT,'yyyymmdd'),'dd/mm/yyyy') c09  " +
        "    , to_char(to_date(M.ETD ,'yyyymmdd'),'dd/mm/yyyy') c10  " +
        "    , M.PO_NO c11             " +
        "from tlg_it_item i, tlg_sa_saleorder_m m, tlg_sa_saleorder_d d, tlg_it_itemgrp grp  " +
        "    , tco_buspartner b   " +
        "where I.DEL_IF = 0   " +
        "and M.DEL_IF=0   " +
        "and m.pk = " + p_parent_pk +
        "and B.DEL_IF(+) = 0  " +
        "and B.PK(+) = M.DELI_TO_PK  " +
        "and D.DEL_IF = 0   " +
        "and I.PK = D.TLG_IT_ITEM_PK   " +
        "and m.pk = D.TLG_SA_SALEORDER_M_PK   " +
        "and grp.del_if = 0   " +
        "and GRP.PK = I.TLG_IT_ITEMGRP_PK   " +
        "and instr(I.ITEM_NAME,'+') > 0    " +
        ") ";   
    //Response.Write(SQL);
    //Response.End();
    DataTable dt_total = CtlLib.TableReadOpen(SQL);            
    if(dt_total.Rows.Count==0)
    {
        Response.Write("There is no data");
        Response.End();
    }
     %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_dsbs00200_2_ens_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dsbs00200_2_ens_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dsbs00200_2_ens_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>DENNYHO</o:Author>
  <o:LastAuthor>Hee Nguyen</o:LastAuthor>
  <o:LastPrinted>2014-10-01T02:08:25Z</o:LastPrinted>
  <o:Created>2014-09-18T04:00:08Z</o:Created>
  <o:LastSaved>2014-10-01T02:08:51Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.36in .35in .45in .33in;
	mso-header-margin:.3in;
	mso-footer-margin:.3in;}
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
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
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
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
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
.xl65
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl66
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl67
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#969696;
	mso-pattern:auto none;}
.xl68
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl69
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl70
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl71
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl72
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl73
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl74
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl75
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl76
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl77
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl78
	{mso-style-parent:style0;
	color:windowtext;
	font-size:20.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl79
	{mso-style-parent:style0;
	color:windowtext;
	font-size:20.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl80
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl81
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl82
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl83
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl84
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl85
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl86
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl87
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl88
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl89
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;}
.xl90
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl91
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#969696;
	mso-pattern:auto none;}
.xl92
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#969696;
	mso-pattern:auto none;}
.xl93
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl94
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;}
.xl95
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl96
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;}
.xl97
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;}
.xl98
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;}
.xl99
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl100
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl101
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl102
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl103
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl104
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;}
.xl105
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl106
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl107
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl108
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl109
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl110
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl111
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>2. BONDING VIEW</x:Name>
    <x:WorksheetOptions>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>70</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>12</x:ActiveRow>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>11580</x:WindowHeight>
  <x:WindowWidth>19200</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>1800</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl65>

<table x:str border=0 cellpadding=0 cellspacing=0 width=954 style='border-collapse:
 collapse;table-layout:fixed;width:718pt'>
 <col class=xl65 width=64 style='width:48pt'>
 <col class=xl65 width=42 style='mso-width-source:userset;mso-width-alt:1536;
 width:32pt'>
 <col class=xl65 width=64 span=2 style='width:48pt'>
 <col class=xl65 width=235 style='mso-width-source:userset;mso-width-alt:8594;
 width:176pt'>
 <col class=xl65 width=94 style='mso-width-source:userset;mso-width-alt:3437;
 width:71pt'>
 <col class=xl65 width=93 style='mso-width-source:userset;mso-width-alt:3401;
 width:70pt'>
 <col class=xl65 width=41 style='mso-width-source:userset;mso-width-alt:1499;
 width:31pt'>
 <col class=xl65 width=45 style='mso-width-source:userset;mso-width-alt:1645;
 width:34pt'>
 <col class=xl65 width=42 style='mso-width-source:userset;mso-width-alt:1536;
 width:32pt'>
 <col class=xl65 width=85 span=2 style='mso-width-source:userset;mso-width-alt:
 3108;width:64pt'>
 <col class=xl65 width=82 style='mso-width-source:userset;mso-width-alt:2998;
 width:62pt'>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl65 width=64 style='height:15.0pt;width:48pt'></td>
  <td colspan=3 class=xl77 width=170 style='width:128pt'></td>
  <td class=xl65 width=235 style='width:176pt'></td>
  <td class=xl65 width=94 style='width:71pt'></td>
  <td class=xl65 width=93 style='width:70pt'></td>
  <td class=xl65 width=41 style='width:31pt'></td>
  <td class=xl65 width=45 style='width:34pt'></td>
  <td class=xl65 width=42 style='width:32pt'></td>
  <td class=xl65 width=85 style='width:64pt'></td>
  <td class=xl65 width=85 style='width:64pt'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl65 style='height:15.0pt'></td>
  <td colspan=7 rowspan=3 class=xl78 style='border-right:.5pt solid black'>BONDING
  PLAN</td>
  <td colspan=2 class=xl80 style='border-right:.5pt solid black;border-left:
  none'>Made by</td>
  <td class=xl66>Manager</td>
  <td class=xl66>Director</td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl65 style='height:15.0pt'></td>
  <td colspan=2 rowspan=4 class=xl81 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black'>&nbsp;</td>
  <td rowspan=4 class=xl74 style='border-bottom:.5pt solid black;border-top:
  none'>&nbsp;</td>
  <td rowspan=4 class=xl74 style='border-bottom:.5pt solid black;border-top:
  none'>&nbsp;</td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl65 style='height:15.0pt'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=8 class=xl65 style='height:15.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=8 class=xl65 style='height:15.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=12 class=xl65 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.95pt'>
  <td height=25 class=xl65 style='height:18.95pt'></td>
  <td colspan=2 class=xl89>BUYER:</td>
  <td colspan=3 class=xl90><%=dt_total.Rows[0]["c07"].ToString() %></td>
  <td class=xl65></td>
  <td colspan=3 class=xl89>DATE:</td>
  <td colspan=2 class=xl90><%=dt_total.Rows[0]["c09"].ToString() %></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.95pt'>
  <td height=25 class=xl65 style='height:18.95pt'></td>
  <td colspan=2 class=xl89>O/D NO:</td>
  <td colspan=3 class=xl90><%=dt_total.Rows[0]["c08"].ToString() %></td>
  <td class=xl65></td>
  <td colspan=3 class=xl89>E/D:</td>
  <td colspan=2 class=xl90><%=dt_total.Rows[0]["c10"].ToString() %></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.95pt'>
  <td height=25 colspan=7 class=xl65 style='height:18.95pt;mso-ignore:colspan'></td>
  <td colspan=3 class=xl89>PO:</td>
  <td colspan=2 class=xl111><%=dt_total.Rows[0]["c11"].ToString() %></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=12 class=xl65 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl67 style='height:18.0pt'>Seq</td>
  <td colspan=4 class=xl91 style='border-right:.5pt solid black;border-left:
  none'>Material</td>
  <td class=xl67>Size</td>
  <td class=xl67>Color</td>
  <td colspan=2 class=xl91 style='border-right:.5pt solid black;border-left:
  none'>Qty</td>
  <td class=xl67>Total</td>
  <td colspan=2 class=xl91 style='border-right:.5pt solid black;border-left:
  none'>Remark</td>
 </tr>
    <%
        double ttl = 0;
        for(int i=0;i<dt_total.Rows.Count;i++)
        {
            ttl += double.Parse(dt_total.Rows[i]["c03"].ToString());
            %>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl101 style='height:18.0pt;border-top:none' x:num><%=i+1 %></td>
  <td colspan=4 class=xl102 style='border-left:none'><%=dt_total.Rows[i]["c00"].ToString() %></td>
  <td class=xl104 style='border-top:none;border-left:none'><%=dt_total.Rows[i]["c01"].ToString() %></td>
  <td class=xl105 style='border-top:none;border-left:none'><%=dt_total.Rows[i]["c02"].ToString() %></td>
  <td class=xl68 style='border-top:none' x:num><%=dt_total.Rows[i]["c03"].ToString() %></td>
  <td class=xl68 style='border-top:none'><%=dt_total.Rows[i]["c04"].ToString() %></td>
  <td class=xl69 style='border-top:none'><%=dt_total.Rows[i]["c05"].ToString() %></td>
  <td colspan=2 class=xl87 style='border-right:.5pt solid black;border-left:
  none'><%=dt_total.Rows[i]["c06"].ToString() %></td>
 </tr>
    <%} %>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=7 height=24 class=xl106 style='height:18.0pt'>TOTAL</td>
  <td class=xl70 x:num><%=ttl %></td>
  <td colspan=4 class=xl87 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=4 height=24 class=xl107 style='height:18.0pt'>*REMARK:</td>
  <td colspan=8 rowspan=4 class=xl103 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black'>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl71 style='height:18.0pt'>&nbsp;</td>
  <td colspan=3 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl71 style='height:18.0pt'>&nbsp;</td>
  <td colspan=3 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl72 style='height:18.0pt'>&nbsp;</td>
  <td class=xl110>&nbsp;</td>
  <td class=xl73>&nbsp;</td>
  <td class=xl73>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=12 class=xl65 style='height:18.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=12 class=xl65 style='height:18.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=12 class=xl65 style='height:18.0pt;mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=64 style='width:48pt'></td>
  <td width=42 style='width:32pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=235 style='width:176pt'></td>
  <td width=94 style='width:71pt'></td>
  <td width=93 style='width:70pt'></td>
  <td width=41 style='width:31pt'></td>
  <td width=45 style='width:34pt'></td>
  <td width=42 style='width:32pt'></td>
  <td width=85 style='width:64pt'></td>
  <td width=85 style='width:64pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
