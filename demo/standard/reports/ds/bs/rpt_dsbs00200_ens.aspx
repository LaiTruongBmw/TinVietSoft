<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8";
	Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
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
    = "select c00,  substr(c01,1, length(c01)-1)|| replace(substr(c01,-1),'+',decode(substr(c01,-1),'+','',substr(c01,-1))) c01 " +
        "    , c02, c03 , c04, c05, c06, c07, c08, c09, c10, c11 " +
        "from " +
        "( " +
        "select lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'STYLE'),'SPEC_NAME') AS c00  " +
        "     ,replace(TRIM(lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 1'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 2'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 3'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 4'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 5'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 6'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 7'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 8'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 9'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 10'),'SPEC_NAME') ) " +
        "          ,'++','') c01  " +
        "    , lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'PROD SIZE'),'SPEC_NAME') AS c02  " +
        "    , lg_f_get_prod_color_item(i.pk, I.TLG_IT_ITEMGRP_PK,'MAT COLOR','SPEC_NAME','/') c03  " +
        "    , D.ORD_QTY c04  " +
        "    , D.ORD_UOM c05       " +
        "    , D.DESCRIPTION c06  " +
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
        ")  ";


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
<link rel=File-List href="rpt_dsbs00200_ens_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dsbs00200_ens_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dsbs00200_ens_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>DENNYHO</o:Author>
  <o:LastAuthor>Hee Nguyen</o:LastAuthor>
  <o:LastPrinted>2014-09-10T04:02:01Z</o:LastPrinted>
  <o:Created>2014-09-09T06:31:50Z</o:Created>
  <o:LastSaved>2014-09-10T04:03:06Z</o:LastSaved>
  <o:Version>11.6568</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.75in .36in .75in .7in;
	mso-header-margin:.3in;
	mso-footer-margin:.3in;
	mso-page-orientation:landscape;}
.font9
	{color:black;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style43
	{mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	mso-style-name:Comma;
	mso-style-id:3;}
.style44
	{mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	mso-style-name:"Comma \[0\]";
	mso-style-id:6;}
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
.style56
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
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:"Normal_nov\.";}
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
.xl66
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl67
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;}
.xl68
	{mso-style-parent:style43;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl69
	{mso-style-parent:style43;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl70
	{mso-style-parent:style56;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:white gray-0625;}
.xl71
	{mso-style-parent:style56;
	font-size:10.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl72
	{mso-style-parent:style56;
	font-size:10.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl73
	{mso-style-parent:style56;
	color:windowtext;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl74
	{mso-style-parent:style56;
	font-size:9.5pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl75
	{mso-style-parent:style56;
	color:red;
	font-size:13.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl76
	{mso-style-parent:style44;
	color:red;
	font-size:10.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";}
.xl77
	{mso-style-parent:style56;
	color:red;
	font-size:10.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl78
	{mso-style-parent:style56;
	font-size:26.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl79
	{mso-style-parent:style56;
	color:red;
	font-size:14.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	background:white;
	mso-pattern:white none;}
.xl80
	{mso-style-parent:style56;
	font-size:10.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	background:white;
	mso-pattern:white gray-0625;}
.xl81
	{mso-style-parent:style56;
	font-size:12.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	background:white;
	mso-pattern:white none;}
.xl82
	{mso-style-parent:style56;
	color:red;
	font-size:10.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	background:white;
	mso-pattern:white none;}
.xl83
	{mso-style-parent:style56;
	font-size:16.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Medium Date";
	background:white;
	mso-pattern:white gray-0625;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl84
	{mso-style-parent:style0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl85
	{mso-style-parent:style0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl86
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl87
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl88
	{mso-style-parent:style56;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl89
	{mso-style-parent:style56;
	font-size:14.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Medium Date";
	text-align:left;
	background:white;
	mso-pattern:white gray-0625;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl90
	{mso-style-parent:style56;
	font-size:12.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	background:white;
	mso-pattern:white gray-0625;}
.xl91
	{mso-style-parent:style56;
	font-size:16.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Medium Date";
	text-align:left;
	background:white;
	mso-pattern:white gray-0625;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl92
	{mso-style-parent:style56;
	font-size:26.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;}
.xl93
	{mso-style-parent:style56;
	color:red;
	font-size:10.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl94
	{mso-style-parent:style56;
	font-size:26.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl95
	{mso-style-parent:style44;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	border:.5pt solid windowtext;}
.xl96
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl97
	{mso-style-parent:style43;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl98
	{mso-style-parent:style56;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl99
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl100
	{mso-style-parent:style43;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl101
	{mso-style-parent:style44;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;}
.xl102
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl103
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl104
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl105
	{mso-style-parent:style56;
	font-size:12.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>300</x:DefaultRowHeight>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>82</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>8</x:ActiveRow>
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
  <x:WindowTopY>600</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1544 style='border-collapse:
 collapse;table-layout:fixed;width:1161pt'>
 <col width=48 style='mso-width-source:userset;mso-width-alt:1755;width:36pt'>
 <col width=93 style='mso-width-source:userset;mso-width-alt:3401;width:70pt'>
 <col width=409 style='mso-width-source:userset;mso-width-alt:14957;width:307pt'>
 <col width=170 span=2 style='mso-width-source:userset;mso-width-alt:6217;
 width:128pt'>
 <col width=122 style='mso-width-source:userset;mso-width-alt:4461;width:92pt'>
 <col width=118 style='mso-width-source:userset;mso-width-alt:4315;width:89pt'>
 <col width=134 style='mso-width-source:userset;mso-width-alt:4900;width:101pt'>
 <col width=96 style='mso-width-source:userset;mso-width-alt:3510;width:72pt'>
 <col width=105 style='mso-width-source:userset;mso-width-alt:3840;width:79pt'>

 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td height=23 class=xl71 width=48 style='height:17.25pt;width:36pt'></td>
  <td class=xl105 colspan=2 width=362 style='mso-ignore:colspan;width:272pt'>E
  N S Foam Co.,Ltd.</td>
  <td class=xl74 width=110 style='width:83pt'></td>
  <td class=xl74 width=108 style='width:81pt'></td>
  
  <td class=xl95 width=83 style='width:62pt' x:str="MADE BY"><span
  style='mso-spacerun:yes'> </span>MADE BY<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl95 width=96 style='border-left:none;width:72pt' x:str="MANAGER"><span
  style='mso-spacerun:yes'> </span>MANAGER<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl95 width=105 style='border-left:none;width:79pt' x:str="DIRECTOR"><span
  style='mso-spacerun:yes'> </span>DIRECTOR<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl76 width=79 style='width:59pt'></td>
 </tr>
 <tr height=68 style='mso-height-source:userset;height:51.0pt'>
  <td height=68 class=xl71 style='height:51.0pt'></td>
  <td colspan=4 class=xl78 style='border-right:.5pt solid black'>ORDER SHEET</td>
  <td class=xl92 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl92 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl93 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl77></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 class=xl71 style='height:14.25pt'></td>
  <td class=xl72></td>
  <td colspan=7 class=xl78 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl77 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=24 style='height:18.0pt'>
  <td height=24 class=xl79 style='height:18.0pt'>&nbsp;</td>
  <td class=xl80>BILL TO<font class="font9"> :</font></td>
  <td colspan=2 class=xl90><%=dt_total.Rows[0]["c07"].ToString() %></td>
  <td class=xl81>DATE</td>
  <td colspan=3 class=xl89><%=dt_total.Rows[0]["c09"].ToString() %></td>

 </tr>
 <tr height=24 style='height:18.0pt'>
  <td height=24 class=xl79 style='height:18.0pt'>&nbsp;</td>
  <td class=xl80>SHIP TO<font class="font9"> :</font></td>
  <td colspan=2 class=xl90><%=dt_total.Rows[0]["c07"].ToString() %></td>
  <td class=xl81>E/D</td>
  <td colspan=3 class=xl89><%=dt_total.Rows[0]["c10"].ToString() %></td>
 </tr>
 <tr height=26 style='height:19.5pt'>
  <td height=26 class=xl79 style='height:19.5pt'>&nbsp;</td>
  <td class=xl80>O/D NO</td>
  <td colspan=2 class=xl90><%=dt_total.Rows[0]["c08"].ToString() %></td>
  <td class=xl81>P.O No</td>
  <td colspan=3 class=xl91><%=dt_total.Rows[0]["c11"].ToString() %></td>
 </tr>
 <tr height=40 style='height:30.0pt;mso-xlrowspan:2'>
  <td height=40 colspan=11 style='height:30.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl66 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl70 style='height:21.75pt'>No.</td>
  <td class=xl70 style='border-left:none'>Prod Type</td>
  <td class=xl70 style='border-left:none' x:str="Spec (Description) ">Spec
  (Description)<span style='mso-spacerun:yes'> </span></td>
  <td class=xl67 style='border-left:none'>Size</td>
  <td class=xl70 style='border-left:none'>Color</td>
  <td class=xl70 style='border-left:none'>QTY</td>
  <td class=xl70 style='border-left:none'>Unit</td>  
  <td class=xl70 style='border-left:none'>Remark</td>
 </tr>
    <%
        int i;
        string[] _array = new string [dt_total.Columns.Count ];
        int j = 0;
        
        
        double sub_ttl = 0;
        for(i=0;i<dt_total.Rows.Count;i++)
        {                        
            //for (j = 0; j < _array.Length; j++)
            //    _array[j] = dt_total.Rows[i][j].ToString();
            //_cnt = int.Parse( _array[0] );
            //_size = _array[_cnt - 1];
            //_color = _array[_cnt];
            //_grp_code = _array[11];
            sub_ttl += double.Parse(dt_total.Rows[i]["c04"].ToString());
            //for (int l = 1; l <= _cnt - 2; l++)
            //    _spec = _spec + " " +  _array[l] ;
            
            %>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl96 style='height:22.5pt;border-top:none' x:num><%=i+1 %></td>
  <td class=xl98 style='border-top:none;border-left:none'><%=dt_total.Rows[i]["c00"].ToString() %></td>
  <td class=xl98 style='border-top:none;border-left:none; white-space:nowrap;mso-text-control:shrinktofit;'><%=dt_total.Rows[i]["c01"].ToString() %></td>
  <td class=xl98 style='border-top:none;border-left:none; white-space:nowrap;mso-text-control:shrinktofit;'><%=dt_total.Rows[i]["c02"].ToString() %></td>
  <td class=xl69 style='border-top:none;border-left:none; white-space:nowrap;mso-text-control:shrinktofit;'><%=dt_total.Rows[i]["c03"].ToString() %></td>
  <td class=xl68 style='border-top:none;border-left:none' x:num><%=dt_total.Rows[i]["c04"].ToString() %></td>
  <td class=xl97 style='border-top:none;border-left:none'><%=dt_total.Rows[i]["c05"].ToString() %></td>
  
  <td class=xl99 style='border-top:none;border-left:none'><%=dt_total.Rows[i]["C06"].ToString() %></td>
  <td></td>
 </tr>
    <%  
    
        
    } %>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td colspan=5 height=32 class=xl102 style='border-right:.5pt solid black;
  height:24.0pt'>TOTAL</td>
  <td class=xl101 style='border-left:none' x:num><%=sub_ttl %></td>
  <td class=xl96 style='border-top:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  
  <td></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=7 style='height:15.0pt;mso-ignore:colspan'></td>
  <td class=xl85 style='border-top:none'>&nbsp;</td>
  <td></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=7 style='height:15.0pt;mso-ignore:colspan'></td>
  <td class=xl86>&nbsp;</td>
  <td></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=7 style='height:15.0pt;mso-ignore:colspan'></td>
  <td class=xl86>&nbsp;</td>
  <td></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=2 height=20 class=xl88 style='height:15.0pt'>*REMARK</td>
  <td colspan=5 style='mso-ignore:colspan'></td>
  <td class=xl86>&nbsp;</td>
  <td></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=7 style='height:15.0pt;mso-ignore:colspan'></td>
  <td class=xl86>&nbsp;</td>
  <td></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=7 style='height:15.0pt;mso-ignore:colspan'></td>
  <td class=xl86>&nbsp;</td>
  <td></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl84 style='height:15.0pt'>&nbsp;</td>
  <td class=xl84>&nbsp;</td>
  <td class=xl84>&nbsp;</td>
  <td class=xl84>&nbsp;</td>
  <td class=xl84>&nbsp;</td>
  <td class=xl84>&nbsp;</td>
  <td class=xl84>&nbsp;</td>
  
  <td class=xl87>&nbsp;</td>
  <td></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=48 style='width:36pt'></td>
  <td width=93 style='width:70pt'></td>
  <td width=269 style='width:202pt'></td>
  <td width=110 style='width:83pt'></td>
  <td width=108 style='width:81pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=81 style='width:61pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=96 style='width:72pt'></td>
  <td width=105 style='width:79pt'></td>
  <td width=79 style='width:59pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
