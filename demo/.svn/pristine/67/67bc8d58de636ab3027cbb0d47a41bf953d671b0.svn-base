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
        "    , c02, c03 , c04, c05, c06, c07, c08, c09, c10, c11, c12 " +
        "from " +
        "( " +
        "select  lg_f_get_spec_info_item(I.PK, lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'STYLE') , 'SPEC_NAME') c00,   " +
        "       replace(TRIM(lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 1'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 2'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 3'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 4'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 5'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 6'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 7'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 8'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 9'),'SPEC_NAME') || '+' ||   " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 10'),'SPEC_NAME') )  " +
        "          ,'++','')c01  " +
        "    , lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'PROD SIZE'),'SPEC_NAME') AS c02  " +
        "    , lg_f_get_prod_color_item(i.pk, I.TLG_IT_ITEMGRP_PK,'MAT COLOR','SPEC_NAME','/') c03  " +
        "    , D.ORD_QTY c04  " +
        "    , D.ORD_UOM c05  " +
        "    , I.LOT_QTY c06  " +
        "    , D.DESCRIPTION  c07  " +
        "    , B.PARTNER_NAME c08  " +
        "    , M.SLIP_NO c09  " +
        "    , to_char(to_date(M.ORDER_DT,'yyyymmdd'),'dd/mm/yyyy') c10  " +
        "    , to_char(to_date(M.ETD ,'yyyymmdd'),'dd/mm/yyyy') c11  " +
        "    , M.PO_NO c12          " +
        "from tlg_it_item i, tlg_sa_saleorder_m m, tlg_sa_saleorder_d d, tlg_it_itemgrp grp  " +
        "    , tco_buspartner b   " +
        "where I.DEL_IF = 0   " +
        "and M.DEL_IF=0   " +
        "and B.DEL_IF(+) = 0  " +
        "and m.pk = " + p_parent_pk +
        "and B.PK (+)= M.DELI_TO_PK  " +
        "and D.DEL_IF = 0  " +
        "and instr(GRP.GRP_CD,'M') > 0 " +
        "and (nvl(GRP.PROD_YN,'N') = 'Y' or nvl(GRP.SEMI_PROD_YN,'N')='Y' )  "+
        "and I.PK = D.TLG_IT_ITEM_PK   " +
        "and m.pk = D.TLG_SA_SALEORDER_M_PK   " +
        "and grp.del_if = 0   " +
        "and GRP.PK = I.TLG_IT_ITEMGRP_PK   " +
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
<link rel=File-List href="rpt_dsbs00200_3_ens_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dsbs00200_3_ens_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dsbs00200_3_ens_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>DENNYHO</o:Author>
  <o:LastAuthor>Hee Nguyen</o:LastAuthor>
  <o:LastPrinted>2014-10-01T06:34:15Z</o:LastPrinted>
  <o:Created>2014-09-18T04:00:08Z</o:Created>
  <o:LastSaved>2014-10-01T06:36:55Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.44in .28in .36in .33in;
	mso-header-margin:.3in;
	mso-footer-margin:.3in;}
.font15
	{color:black;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style45
	{mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	mso-style-name:"Comma \[0\]_May";}
.style46
	{mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	mso-style-name:Comma_May;}
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
.style59
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:16.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:VNI-Times, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal_May;}
.style61
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
	mso-style-name:"Normal_nov\._May";}
.style62
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
	mso-style-name:"Normal_nov\._May_SEP";}
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
.xl73
	{mso-style-parent:style59;
	color:windowtext;
	font-size:16.0pt;
	font-family:VNI-Times, sans-serif;
	mso-font-charset:0;}
.xl74
	{mso-style-parent:style61;
	font-size:10.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.xl75
	{mso-style-parent:style61;
	font-size:9.5pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;}
.xl76
	{mso-style-parent:style61;
	font-size:10.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.xl77
	{mso-style-parent:style45;
	font-size:9.5pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;}
.xl78
	{mso-style-parent:style61;
	color:red;
	font-size:10.0pt;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.xl79
	{mso-style-parent:style61;
	color:red;
	font-size:13.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;}
.xl80
	{mso-style-parent:style61;
	color:red;
	font-size:10.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.xl81
	{mso-style-parent:style61;
	font-size:26.0pt;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl82
	{mso-style-parent:style61;
	font-size:26.0pt;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl83
	{mso-style-parent:style45;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;}
.xl84
	{mso-style-parent:style62;
	font-size:12.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;
	background:white;
	mso-pattern:#CCFFFF gray-0625;}
.xl85
	{mso-style-parent:style62;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	background:white;
	mso-pattern:#CCFFFF gray-0625;}
.xl86
	{mso-style-parent:style62;
	color:red;
	font-size:14.0pt;
	font-family:VNI-Times, sans-serif;
	mso-font-charset:0;}
.xl87
	{mso-style-parent:style45;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;}
.xl88
	{mso-style-parent:style62;
	font-size:12.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	background:white;
	mso-pattern:#CCFFFF gray-0625;}
.xl89
	{mso-style-parent:style62;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	background:white;
	mso-pattern:#CCFFFF gray-0625;}
.xl90
	{mso-style-parent:style62;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:white;
	mso-pattern:#CCFFFF gray-0625;}
.xl91
	{mso-style-parent:style45;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl92
	{mso-style-parent:style62;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl93
	{mso-style-parent:style62;
	color:red;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl94
	{mso-style-parent:style62;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;}
.xl95
	{mso-style-parent:style62;
	font-size:16.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Vni-times, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Medium Date";
	text-align:left;
	background:white;
	mso-pattern:#CCFFFF gray-0625;}
.xl96
	{mso-style-parent:style62;
	color:red;
	font-size:14.0pt;
	font-family:VNI-Times, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl97
	{mso-style-parent:style59;
	color:windowtext;
	font-size:16.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl98
	{mso-style-parent:style62;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:#339966 gray-0625;}
.xl99
	{mso-style-parent:style62;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:none;
	background:white;
	mso-pattern:#339966 gray-0625;}
.xl100
	{mso-style-parent:style62;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:white;
	mso-pattern:#339966 gray-0625;}
.xl101
	{mso-style-parent:style59;
	color:windowtext;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl102
	{mso-style-parent:style61;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl103
	{mso-style-parent:style59;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl104
	{mso-style-parent:style61;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl105
	{mso-style-parent:style61;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl106
	{mso-style-parent:style46;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl107
	{mso-style-parent:style61;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl108
	{mso-style-parent:style46;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCCCFF;
	mso-pattern:#FFFF99 gray-0625;}
.xl109
	{mso-style-parent:style61;
	font-size:14.0pt;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCCCFF;
	mso-pattern:#FFFF99 gray-0625;}
.xl110
	{mso-style-parent:style61;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl111
	{mso-style-parent:style61;
	color:red;
	font-size:10.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl112
	{mso-style-parent:style59;
	color:windowtext;
	font-size:16.0pt;
	font-family:VNI-Times, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl113
	{mso-style-parent:style61;
	color:red;
	font-size:10.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl114
	{mso-style-parent:style59;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl115
	{mso-style-parent:style62;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:#339966 gray-0625;}
.xl116
	{mso-style-parent:style62;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;}
.xl117
	{mso-style-parent:style59;
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
.xl118
	{mso-style-parent:style59;
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
.xl119
	{mso-style-parent:style61;
	font-size:26.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl120
	{mso-style-parent:style61;
	font-size:26.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:white;
	mso-pattern:auto none;}
.xl121
	{mso-style-parent:style61;
	font-size:26.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:white;
	mso-pattern:auto none;}
.xl122
	{mso-style-parent:style62;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:#339966 gray-0625;}
.xl123
	{mso-style-parent:style62;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:white;
	mso-pattern:#339966 gray-0625;}
.xl124
	{mso-style-parent:style62;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;
	background:white;
	mso-pattern:#339966 gray-0625;}
.xl125
	{mso-style-parent:style62;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:white;
	mso-pattern:#339966 gray-0625;}
.xl126
	{mso-style-parent:style62;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;
	background:white;
	mso-pattern:#339966 gray-0625;}
.xl127
	{mso-style-parent:style62;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:white;
	mso-pattern:#339966 gray-0625;}
.xl128
	{mso-style-parent:style62;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	background:white;
	mso-pattern:#CCFFFF gray-0625;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl129
	{mso-style-parent:style46;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.0000_\)\;\\\(\#\,\#\#0\.0000\\\)";
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl130
	{mso-style-parent:style46;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.0000_\)\;\\\(\#\,\#\#0\.0000\\\)";
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl131
	{mso-style-parent:style59;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl132
	{mso-style-parent:style59;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl133
	{mso-style-parent:style59;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl134
	{mso-style-parent:style61;
	font-size:10.0pt;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl135
	{mso-style-parent:style61;
	font-size:10.0pt;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl136
	{mso-style-parent:style61;
	font-size:10.0pt;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl137
	{mso-style-parent:style45;
	color:red;
	font-size:10.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl138
	{mso-style-parent:style45;
	color:red;
	font-size:10.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl139
	{mso-style-parent:style45;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl140
	{mso-style-parent:style45;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl141
	{mso-style-parent:style45;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl142
	{mso-style-parent:style61;
	color:red;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl143
	{mso-style-parent:style61;
	color:red;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl144
	{mso-style-parent:style61;
	color:red;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:justify;
	vertical-align:top;
	white-space:normal;}
.xl145
	{mso-style-parent:style61;
	color:red;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:justify;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl146
	{mso-style-parent:style61;
	color:red;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:justify;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl147
	{mso-style-parent:style61;
	color:red;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:justify;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>3. MOLDING VIEW</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>405</x:DefaultRowHeight>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>54</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Zoom>90</x:Zoom>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveCol>1</x:ActiveCol>
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
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="5121"/>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl73>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1264 style='border-collapse:
 collapse;table-layout:fixed;width:949pt'>
 <col class=xl73 width=12 style='mso-width-source:userset;mso-width-alt:438;
 width:9pt'>
 <col class=xl73 width=131 style='mso-width-source:userset;mso-width-alt:4790;
 width:98pt'>
 <col class=xl73 width=504 style='mso-width-source:userset;mso-width-alt:18432;
 width:378pt'>
 <col class=xl73 width=137 style='mso-width-source:userset;mso-width-alt:5010;
 width:103pt'>
 <col class=xl73 width=105 style='mso-width-source:userset;mso-width-alt:3840;
 width:79pt'>
 <col class=xl73 width=55 style='mso-width-source:userset;mso-width-alt:2011;
 width:41pt'>
 <col class=xl73 width=31 style='mso-width-source:userset;mso-width-alt:1133;
 width:23pt'>
 <col class=xl73 width=72 style='mso-width-source:userset;mso-width-alt:2633;
 width:54pt'>
 <col class=xl73 width=76 style='mso-width-source:userset;mso-width-alt:2779;
 width:57pt'>
 <col class=xl73 width=42 style='mso-width-source:userset;mso-width-alt:1536;
 width:32pt'>
 <col class=xl73 width=33 style='mso-width-source:userset;mso-width-alt:1206;
 width:25pt'>
 <col class=xl73 width=49 style='mso-width-source:userset;mso-width-alt:1792;
 width:37pt'>
 <col class=xl73 width=17 style='mso-width-source:userset;mso-width-alt:621;
 width:13pt'>
 <col class=xl73 width=77 span=243 style='mso-width-source:userset;mso-width-alt:
 2816;width:58pt'>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl73 width=12 style='height:18.75pt;width:9pt'></td>
  <td class=xl74 colspan=2 width=635 style='mso-ignore:colspan;width:476pt'>E N
  S Foam Co.,Ltd.</td>
  <td class=xl75 width=137 style='width:103pt'></td>
  <td class=xl76 width=105 style='width:79pt'></td>
  <td class=xl77 width=55 style='width:41pt'></td>
  <td class=xl78 width=31 style='width:23pt'></td>
  <td class=xl114 width=72 style='width:54pt'>MADE BY</td>
  <td class=xl114 width=76 style='border-left:none;width:57pt'>MANAGER</td>
  <td colspan=2 class=xl117 width=75 style='border-right:.5pt solid black;
  border-left:none;width:57pt'>DIRECTOR</td>
  <td class=xl79 width=49 style='width:37pt'></td>
  <td class=xl78 width=17 style='width:13pt'></td>
 </tr>
 <tr height=83 style='mso-height-source:userset;height:62.25pt'>
  <td height=83 class=xl73 style='height:62.25pt'></td>
  <td colspan=5 class=xl119 style='border-right:.5pt solid black'>MOLDING
  PRODUCTION PLAN</td>
  <td class=xl78></td>
  <td class=xl114 style='border-top:none'>&nbsp;</td>
  <td class=xl114 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=2 class=xl117 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
  <td class=xl79></td>
  <td class=xl78></td>
 </tr>
 <tr height=13 style='mso-height-source:userset;height:9.75pt'>
  <td height=13 class=xl73 style='height:9.75pt'></td>
  <td colspan=5 class=xl81 style='mso-ignore:colspan'>&nbsp;</td>
  <td colspan=6 class=xl82 style='mso-ignore:colspan'>&nbsp;</td>
  <td class=xl80></td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td height=32 class=xl73 style='height:24.0pt'></td>
  <td class=xl84>BUYER<font class="font15"> :</font></td>
  <td class=xl85><%=dt_total.Rows[0]["c08"].ToString() %></td>
  <td class=xl83></td>
  <td colspan=2 class=xl116>DATE:</td>
  <td class=xl73></td>
  <td class=xl89><%=dt_total.Rows[0]["c10"].ToString() %></td>
  <td class=xl73></td>
  <td colspan=3 class=xl89 style='mso-ignore:colspan'>&nbsp;</td>
  <td class=xl86></td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td height=32 class=xl73 style='height:24.0pt'></td>
  <td class=xl84>O/D NO<font class="font15"> :</font></td>
  <td class=xl85><%=dt_total.Rows[0]["c09"].ToString() %></td>
  <td class=xl83></td>
  <td colspan=2 class=xl116>ETD :</td>
  <td class=xl73></td>
  <td class=xl89><%=dt_total.Rows[0]["c11"].ToString() %></td>
  <td class=xl73></td>
  <td colspan=3 class=xl89 style='mso-ignore:colspan'>&nbsp;</td>
  <td class=xl86></td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td height=32 class=xl73 style='height:24.0pt'></td>
  <td class=xl88><u style='visibility:hidden;mso-ignore:visibility'>&nbsp;</u></td>
  <td class=xl89>&nbsp;</td>
  <td class=xl83></td>
  <td colspan=2 class=xl116>PO No :</td>
  <td class=xl73></td>
  <td colspan=5 class=xl128><%=dt_total.Rows[0]["c12"].ToString() %></td>
  <td class=xl86></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl73 style='height:20.25pt'></td>
  <td class=xl90>&nbsp;</td>
  <td class=xl89>&nbsp;</td>
  <td class=xl91>&nbsp;</td>
  <td class=xl83></td>
  <td class=xl87></td>
  <td class=xl92></td>
  <td colspan=2 class=xl93 style='mso-ignore:colspan'></td>
  <td class=xl94></td>
  <td colspan=2 class=xl95 style='mso-ignore:colspan'><u style='visibility:
  hidden;mso-ignore:visibility'>&nbsp;</u></td>
  <td class=xl96>&nbsp;</td>
 </tr>
 <tr class=xl97 height=27 style='height:20.25pt'>
  <td height=27 class=xl97 style='height:20.25pt'></td>
  <td class=xl98>Style</td>
  <td class=xl99>Materials</td>
  <td class=xl115 style='border-left:none'>Size</td>
  <td class=xl100>C'lor</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid black;border-left:
  none'>Q'Ty</td>
  <td colspan=2 class=xl124 style='border-right:.5pt solid black;border-left:
  none'>Norm</td>
  <td colspan=4 class=xl126 style='border-right:.5pt solid black;border-left:
  none'>Remark</td>
 </tr>
    <%
        double ttl = 0;
        for(int i=0;i<dt_total.Rows.Count;i++)
        {
            ttl += double.Parse(dt_total.Rows[i]["c04"].ToString());
            %>
 <tr class=xl101 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl101 style='height:18.0pt'></td>
  <td class=xl102><%=dt_total.Rows[i]["c00"].ToString() %></td>
  <td class=xl103><%=dt_total.Rows[i]["c01"].ToString() %></td>
  <td class=xl104 style='border-top:none'><%=dt_total.Rows[i]["c02"].ToString() %></td>
  <td class=xl105><%=dt_total.Rows[i]["c03"].ToString() %></td>
  <td class=xl106 align=right x:num><%=dt_total.Rows[i]["c04"].ToString() %></td>
  <td class=xl107 style='border-top:none'><%=dt_total.Rows[i]["c05"].ToString() %></td>
  <td colspan=2 class=xl129 style='border-right:.5pt solid black;border-left:
  none' x:num><%=dt_total.Rows[i]["c06"].ToString() %></td>
  <td colspan=4 class=xl131 style='border-right:.5pt solid black;border-left:
  none'><%=dt_total.Rows[i]["c07"].ToString() %></td>
 </tr>
    <%} %>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl73 style='height:20.25pt'></td>
  <td colspan=4 class=xl134 style='border-right:.5pt solid black'>TOTAL</td>
  <td class=xl108 x:num><span style='mso-spacerun:yes'>  </span><%=ttl %></td>
  <td class=xl109>&nbsp;</td>
  <td colspan=2 class=xl137 style='border-right:.5pt solid black'>&nbsp;</td>
  <td colspan=4 class=xl139 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl73 style='height:20.25pt'></td>
  <td class=xl110>* REMARK :</td>
  <td colspan=11 rowspan=3 class=xl142 width=1121 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:842pt'>&nbsp;</td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl73 style='height:20.25pt'></td>
  <td class=xl111>&nbsp;</td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td height=27 class=xl112 style='height:20.25pt'>&nbsp;</td>
  <td class=xl113>&nbsp;</td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=12 style='width:9pt'></td>
  <td width=131 style='width:98pt'></td>
  <td width=504 style='width:378pt'></td>
  <td width=137 style='width:103pt'></td>
  <td width=105 style='width:79pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=31 style='width:23pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=76 style='width:57pt'></td>
  <td width=42 style='width:32pt'></td>
  <td width=33 style='width:25pt'></td>
  <td width=49 style='width:37pt'></td>
  <td width=17 style='width:13pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
