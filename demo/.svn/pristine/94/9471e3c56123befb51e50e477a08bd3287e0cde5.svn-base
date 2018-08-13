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
    //path += '?p_so_no=' + txtSONo.text + '&p_cus_id=' + txtCusID.text + '&p_item=' + txtItemCode.text;
    //path += '&p_day01=' + txtDay01.text + '&p_day10=' + txtDay10.text;

    string p_so_no, p_cus_id, p_item, p_day_01, p_day_10;

    p_so_no = Request.QueryString["p_so_no"].ToString();
    p_cus_id = Request.QueryString["p_cus_id"].ToString();
    p_item = Request.QueryString["p_item"].ToString();
    p_day_01 = Request.QueryString["p_day01"].ToString();
    p_day_10 = Request.QueryString["p_day10"].ToString();

    string SQL1
    = "select c00, c01, c02, c03 " +
        "        , sum(nvl(c13,0)) c13, sum(nvl(c14,0)) c14 " +
        "        , sum(nvl(c15,0)) c15, sum(nvl(c16,0)) c16, sum(nvl(c17,0)) c17, sum(nvl(c18,0)) c18, sum(nvl(c19,0)) c19         " +
        "        , SUM(NVL(C13,0) + NVL(C14,0) + NVL(C15,0) + NVL(C16,0) + NVL(C17,0) + NVL(C18,0) + NVL(C19,0) ) C20 " +
        "        , C28, C29, C30, C31, C32, C33, C34   "+
        "    from " +
        "    ( " +
        "        select null c00, B.PARTNER_NAME c01, M.SLIP_NO c02, M.PO_NO c03,  I.ITEM_CODE c04 " +
        "            , lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'STYLE'),'SPEC_NAME') c05 " +
        "            , replace(TRIM(lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 1'),'SPEC_NAME') || '+' || " +
        "              lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 2'),'SPEC_NAME') || '+' || " +
        "              lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 3'),'SPEC_NAME') || '+' || " +
        "              lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 4'),'SPEC_NAME') || '+' || " +
        "              lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 5'),'SPEC_NAME') || '+' || " +
        "              lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 6'),'SPEC_NAME') || '+' || " +
        "              lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 7'),'SPEC_NAME') || '+' || " +
        "              lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 8'),'SPEC_NAME') || '+' || " +
        "              lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 9'),'SPEC_NAME') || '+' || " +
        "              lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 10'),'SPEC_NAME') ) " +
        "              ,'++','') " +
        "               c06 " +
        "            , lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'PROD SIZE'),'SPEC_NAME') AS c07 " +
        "            , D.pattern  c08    " +
        "            , lg_f_get_prod_color_item(i.pk, I.TLG_IT_ITEMGRP_PK,'MAT COLOR','SPEC_NAME','/') c09 " +
        "            , D.ORD_UOM  c10 " +
        "            , D.ORD_QTY  c11  " +
        "            , nvl(D.ORD_QTY,0)  " +
        "              -DECODE(PM.PLAN_DATE,'"+p_day_01+"',NVL(PM.PLAN_QTY,0),0) " +
        "              -DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+1,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              -DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+2,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              -DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+3,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              -DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+4,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              -DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+5,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              -DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+6,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0)  c12 " +
        "            , DECODE(PM.PLAN_DATE,'"+p_day_01+"',NVL(PM.PLAN_QTY,0),0) c13  " +
        "            , DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+1,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) c14 " +
        "            , DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+2,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) c15 " +
        "            , DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+3,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) c16 " +
        "            , DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+4,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) c17 " +
        "            , DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+5,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) c18 " +
        "            , DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+6,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) c19 " +
        "            , DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+7,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) c20 " +
        "            , DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+8,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) c21 " +
        "            , DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+9,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) c22 " +
        "            , DECODE(PM.PLAN_DATE,'"+p_day_01+"',NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+1,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+2,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+3,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+4,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+5,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+6,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) c23 " +
        "            , nvl( D2.IN_QTY,0 ) c24 " +
        "            , DECODE(PM.PLAN_DATE,'"+p_day_01+"',NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+1,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+2,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+3,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+4,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+5,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+6,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              - nvl( D2.IN_QTY,0 ) c25 " +
        "            , nvl( D3.REQ_QTY,0 ) c26 " +
        "            , DECODE(PM.PLAN_DATE,'"+p_day_01+"',NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+1,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+2,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+3,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+4,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+5,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              +DECODE(PM.PLAN_DATE,TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+6,'YYYYMMDD'),NVL(PM.PLAN_QTY,0),0) " +
        "              - nvl( D3.REQ_QTY,0 ) c27 " +
        "              , TO_CHAR(TO_DATE('" + p_day_01 + "','YYYYMMDD')+0,'DD-MON' ) C28 " +
        "              , TO_CHAR(TO_DATE('" + p_day_01 + "','YYYYMMDD')+1,'DD-MON' ) C29 " +
        "              , TO_CHAR(TO_DATE('" + p_day_01 + "','YYYYMMDD')+2,'DD-MON' ) C30 " +
        "              , TO_CHAR(TO_DATE('" + p_day_01 + "','YYYYMMDD')+3,'DD-MON' ) C31 " +
        "              , TO_CHAR(TO_DATE('" + p_day_01 + "','YYYYMMDD')+4,'DD-MON' ) C32 " +
        "              , TO_CHAR(TO_DATE('" + p_day_01 + "','YYYYMMDD')+5,'DD-MON' ) C33 " +
        "              , TO_CHAR(TO_DATE('" + p_day_01 + "','YYYYMMDD')+6,'DD-MON' ) C34  " +
        "        from tlg_sa_saleorder_d d " +
        "            , tlg_it_item i " +
        "            , tlg_gd_plan_m pm " +
        "            , tlg_sa_saleorder_m m " +
        "            , TCO_BUSPARTNER B  " +
        "            , tlg_pr_prod_income_d d2 " +
        "            , tlg_gd_outgo_d d3                    " +
        "        where d.DEL_IF=0 " +
        "        AND B.DEL_IF(+) = 0 " +
        "        and D2.DEL_IF(+) = 0 " +
        "        and d3.del_if(+) = 0 " +
        "        and d.pk = D3.TLG_SA_SALEORDER_D_PK(+) " +
        "        and d.pk = D2.TLG_SA_SALEORDER_D_PK(+) " +
        "        AND B.PK(+) = M.DELI_TO_PK  " +
        "        and I.DEL_IF=0 " +
        "        and PM.DEL_IF=0 " +
        "        and M.DEL_IF=0 " +
        "        and M.PK = D.TLG_SA_SALEORDER_M_PK " +
        "        and D.PK = PM.TLG_SA_SALEORDER_D_PK " +
        "        AND (I.ITEM_CODE LIKE '%' || UPPER('" + p_item + "') || '%'  " +
        "            OR " +
        "            I.ITEM_name LIKE '%' || UPPER('" + p_item + "') || '%' ) " +
        "        AND M.SLIP_NO LIKE '%' || UPPER('" + p_so_no + "') || '%' " +
        "        AND (B.PARTNER_ID LIKE '%' || UPPER('" + p_cus_id + "') || '%' " +
        "            OR " +
        "            B.PARTNER_NAME  LIKE '%' || UPPER('" + p_cus_id + "') || '%' ) " +
        "        and D.TLG_IT_ITEM_PK  = I.PK " +
        "        and PM.PLAN_DATE between '"+p_day_01+"' and TO_CHAR(TO_DATE('"+p_day_01+"','YYYYMMDD')+6,'YYYYMMDD') " +
        "      ) sub  " +
        "      group by c00, c01, c02, c03, C28, C29, C30, C31, C32, C33, C34 " +
        "      ORDER BY c00, c01, c02, c03 ";

    //Response.Write(SQL1);
    //Response.End();        
    DataTable dt_table1 = CtlLib.TableReadOpen(SQL1); 
    
    if(dt_table1.Rows.Count==0)
    {
        Response.Write("There is no data");
        Response.End();
    }

    
     %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_dscd00110_2_ens_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dscd00110_2_ens_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dscd00110_2_ens_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>DENNYHO</o:Author>
  <o:LastAuthor>Hee Nguyen</o:LastAuthor>
  <o:LastPrinted>2014-10-06T04:07:51Z</o:LastPrinted>
  <o:Created>2014-09-18T04:00:08Z</o:Created>
  <o:LastSaved>2014-10-06T04:07:56Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.37in .38in .75in .39in;
	mso-header-margin:.3in;
	mso-footer-margin:.3in;
	mso-page-orientation:landscape;}
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style45
	{mso-number-format:"_-* \#\,\#\#0\.00_-\;\\-* \#\,\#\#0\.00_-\;_-* \0022-\0022??_-\;_-\@_-";
	mso-style-name:Comma_Sheet1;}
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
.xl66
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl67
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl68
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"dd\\-mmm";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl69
	{mso-style-parent:style0;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
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
.xl70
	{mso-style-parent:style45;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl71
	{mso-style-parent:style45;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl72
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl73
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl74
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl75
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl76
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl77
	{mso-style-parent:style45;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl78
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl79
	{mso-style-parent:style0;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl80
	{mso-style-parent:style0;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl81
	{mso-style-parent:style0;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl82
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl83
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl84
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl85
	{mso-style-parent:style0;
	color:windowtext;
	font-size:22.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl86
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
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl87
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;}
.xl88
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl89
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
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl90
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
	border-bottom:none;
	border-left:none;}
.xl91
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl92
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl93
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"dd\\-mmm";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl94
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"dd\\-mmm";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl95
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"dd\\-mmm";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl96
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"dd\\-mmm";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl97
	{mso-style-parent:style0;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"dd\\-mmm";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl98
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl99
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>5. TONGHOP(MRBAE)</x:Name>
    <x:WorksheetOptions>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:Scale>83</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>1</x:ActiveRow>
       <x:RangeSelection>$A$2:$A$3</x:RangeSelection>
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
  <x:WindowTopY>2400</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl66>

<table x:str border=0 cellpadding=0 cellspacing=0 width=2628 style='border-collapse:
 collapse;table-layout:fixed;width:1974pt'>
 <col class=xl72 width=145 style='mso-width-source:userset;mso-width-alt:5302;
 width:109pt'>
 <col class=xl73 width=111 style='mso-width-source:userset;mso-width-alt:4059;
 width:83pt'>
 <col class=xl66 width=78 style='mso-width-source:userset;mso-width-alt:2852;
 width:59pt'>
 <col class=xl66 width=127 style='mso-width-source:userset;mso-width-alt:4644;
 width:95pt'>
 <col class=xl66 width=70 span=6 style='mso-width-source:userset;mso-width-alt:
 2560;width:53pt'>
 <col class=xl66 width=63 style='mso-width-source:userset;mso-width-alt:2304;
 width:47pt'>
 <col class=xl66 width=75 style='mso-width-source:userset;mso-width-alt:2742;
 width:56pt'>
 <col class=xl66 width=73 style='mso-width-source:userset;mso-width-alt:2669;
 width:55pt'>
 <col class=xl66 width=64 span=24 style='width:48pt'>
 <tr height=37 style='height:27.75pt'>
  <td colspan=13 height=37 class=xl85 width=1092 style='height:27.75pt;
  width:822pt' x:str>DELIVERY SCHEDULE (<%=dt_table1.Rows[0]["c28"].ToString()%> ~ <%=dt_table1.Rows[0]["c34"].ToString()%> )<span style='mso-spacerun:yes'> </span></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <tr class=xl67 height=17 style='height:12.75pt'>
  <td rowspan=2 height=34 class=xl86 style='border-bottom:.5pt solid black;
  height:25.5pt;border-top:none'>Customer</td>
  <td rowspan=2 class=xl86 style='border-bottom:.5pt solid black;border-top:
  none'>ES</td>
  <td colspan=2 rowspan=2 class=xl89 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black'>PO</td>
  <td colspan=7 class=xl93 style='border-right:.5pt solid black;border-left:
  none'>DELIVERY DATE</td>
  <td rowspan=2 class=xl96 style='border-bottom:.5pt solid black;border-top:
  none'>T.Schedule</td>
  <td rowspan=2 class=xl86 style='border-bottom:.5pt solid black;border-top:
  none'>Remark</td>
  <td colspan=24 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl67 height=17 style='height:12.75pt'>
  <td height=17 class=xl68 style='height:12.75pt'><%=dt_table1.Rows[0]["c28"].ToString()%></td>
  <td class=xl68><%=dt_table1.Rows[0]["c29"].ToString()%></td>
  <td class=xl68><%=dt_table1.Rows[0]["c30"].ToString()%></td>
  <td class=xl68><%=dt_table1.Rows[0]["c31"].ToString()%></td>
  <td class=xl68><%=dt_table1.Rows[0]["c32"].ToString()%></td>
  <td class=xl68><%=dt_table1.Rows[0]["c33"].ToString()%></td>
  <td class=xl68><%=dt_table1.Rows[0]["c34"].ToString()%></td>
  <td colspan=24 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
    <%
        int flag = 0;
        double[] subttl = new double[12];
        double[] grdttl = new double[12];
        for(int i=0;i<dt_table1.Rows.Count;i++)
        {
            if (i < dt_table1.Rows.Count - 1)
            {
                if (dt_table1.Rows[i]["c01"].ToString() != dt_table1.Rows[i + 1]["c01"].ToString())
                    flag = 1;
                else
                    flag = 0;
            }
            else
                flag = 1;

            for (int j = 4;  j < 12;j++ )
            {
                subttl[j] += double.Parse(dt_table1.Rows[i][j].ToString());
                grdttl[j] += double.Parse(dt_table1.Rows[i][j].ToString());
            }
            
            %>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl69 style='height:21.0pt'><%=dt_table1.Rows[i]["c01"].ToString() %></td>
  <td class=xl76><%=dt_table1.Rows[i]["c02"].ToString() %></td>
  <td colspan=2 class=xl98 style='border-right:.5pt solid black;border-left:
  none'><%=dt_table1.Rows[i]["c03"].ToString() %></td>
  <td class=xl70 x:num><%=dt_table1.Rows[i]["c13"].ToString() %></td>
  <td class=xl70 x:num><%=dt_table1.Rows[i]["c14"].ToString() %></td>
  <td class=xl70 x:num><%=dt_table1.Rows[i]["c15"].ToString() %></td>
  <td class=xl70 x:num><%=dt_table1.Rows[i]["c16"].ToString() %></td>
  <td class=xl70 x:num><%=dt_table1.Rows[i]["c17"].ToString() %></td>
  <td class=xl70 x:num><%=dt_table1.Rows[i]["c18"].ToString() %></td>
  <td class=xl70 x:num><%=dt_table1.Rows[i]["c19"].ToString() %></td>
  <td class=xl70 x:num><%=dt_table1.Rows[i]["c20"].ToString() %></td>
  <td class=xl74></td>
  <td colspan=24 style='mso-ignore:colspan'></td>
 </tr>
    <%
        if (flag == 1)
        { %>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=4 height=26 class=xl79 style='border-right:.5pt solid black;
  height:19.5pt'>TOTAL OF: <%=dt_table1.Rows[i]["c01"].ToString() %></td>
  <td class=xl71 x:num><%=subttl[4] %></td>
  <td class=xl71 x:num><%=subttl[5] %></td>
  <td class=xl71 x:num><%=subttl[6] %></td>
  <td class=xl71 x:num><%=subttl[7] %></td>
  <td class=xl71 x:num><%=subttl[8] %></td>
  <td class=xl71 x:num><%=subttl[9] %></td>
  <td class=xl71 x:num><%=subttl[10] %></td>
  <td class=xl71 x:num><%=subttl[11] %></td>
  <td class=xl75>&nbsp;</td>
  <td colspan=24 style='mso-ignore:colspan'></td>
 </tr>
    <%  
            for (int jj = 0; jj < 12; jj++)
                subttl[jj] = 0;
        } %>
    <%
    } %>

 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td colspan=4 height=27 class=xl82 style='border-right:.5pt solid black;
  height:20.25pt'>GRAND TOTAL</td>
  <td class=xl77 x:num><%=grdttl[4] %></td>
  <td class=xl77 x:num><%=grdttl[5] %></td>
  <td class=xl77 x:num><%=grdttl[6] %></td>
  <td class=xl77 x:num><%=grdttl[7] %></td>
  <td class=xl77 x:num><%=grdttl[8] %></td>
  <td class=xl77 x:num><%=grdttl[9] %></td>
  <td class=xl77 x:num><%=grdttl[10] %></td>
  <td class=xl77 x:num><%=grdttl[11] %></td>
  <td class=xl78>&nbsp;</td>
  <td colspan=24 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  
 </tr>
 <![endif]>
</table>

</body>

</html>
