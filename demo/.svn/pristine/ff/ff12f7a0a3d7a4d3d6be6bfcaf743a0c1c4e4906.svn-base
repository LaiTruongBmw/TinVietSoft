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

    string p_so_no, p_cus_id, p_item, p_day01, p_day10;

    p_so_no = Request.QueryString["p_so_no"].ToString();
    p_cus_id = Request.QueryString["p_cus_id"].ToString();
    p_item = Request.QueryString["p_item"].ToString();
    p_day01 = Request.QueryString["p_day01"].ToString();
    p_day10 = Request.QueryString["p_day10"].ToString();
    
    string SQL1
    = "select c00, c01, c02, substr(c03,1, length(c03)-1)|| replace(substr(c03,-1),'+',decode(substr(c03,-1),'+','',substr(c03,-1))) c03, c04 " +
        "    , c05, c06, c07, c08, c09 " +
        "    , c10, c11, C12, C13 " +
        "from " +
        "(   select B.PARTNER_NAME c00,  M.SLIP_NO c01, nvl(I.VIRTUAL_CODE, I.ITEM_CODE) c02 " +
        "    , replace(TRIM(lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 1'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 2'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 3'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 4'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 5'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 6'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 7'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 8'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 9'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 10'),'SPEC_NAME') ), '++','')   c03  " +
        "    , lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'PROD SIZE'),'SPEC_NAME') AS c04 " +
        "    , D.pattern c05 " +        
        "    , lg_f_get_prod_color_item(i.pk, I.TLG_IT_ITEMGRP_PK,'MAT COLOR','SPEC_NAME','/') C06 " +
        "    , nvl(I.LOT_QTY,0) * nvl(D.ORD_QTY,0) c07 " +
        "    , PM.PLAN_QTY c08 " +
        "    , D.LOT_UOM c09 " +
        "    , to_char(to_date(PM.PLAN_DATE,'yyyymmdd'),'dd/mm/yyyy') c10   " +
        "    , PM.PLAN_DATE c11                      " +
        "    , to_char(to_date('" + p_day01 + "','yyyymmdd'),'DD-MON') c12   " +
        "    , to_char(to_date('" + p_day01 + "','yyyymmdd') + 6 ,'DD-MON') c13   " +
        "    from tlg_sa_saleorder_d d " +
        "        , tlg_it_item i " +
        "        , tlg_gd_plan_m pm " +
        "        , tlg_sa_saleorder_m m  " +
        "        , TCO_BUSPARTNER B                     " +
        "    where d.DEL_IF=0 " +
        "    and I.DEL_IF=0 " +
        "    AND B.DEL_IF = 0 " +
        "    and PM.DEL_IF=0 " +
        "    and M.DEL_IF=0 " +
        "        AND (I.ITEM_CODE LIKE '%' || UPPER('"+p_item+"') || '%'  " +
        "            OR " +
        "            I.ITEM_name LIKE '%' || UPPER('" + p_item + "') || '%' ) " +
        "        AND M.SLIP_NO LIKE '%' || UPPER('" + p_so_no + "') || '%' " +
        "        AND (B.PARTNER_ID LIKE '%' || UPPER('" + p_cus_id + "') || '%' " +
        "            OR " +
        "            B.PARTNER_NAME  LIKE '%' || UPPER('" + p_cus_id + "') || '%' ) " +
        "        and PM.PLAN_DATE between '" + p_day01 + "' and to_char(to_date('" + p_day01 + "','yyyymmdd') + 6 ,'yyyymmdd') " +
        "    AND B.PK = M.DELI_TO_PK      " +
        "    and M.PK = D.TLG_SA_SALEORDER_M_PK " +
        "    and D.PK = PM.TLG_SA_SALEORDER_D_PK " +
        "    and D.TLG_IT_ITEM_PK  = I.PK                 " +
        ") sub " +
        "order by c00, c01, c11 ";
    //Response.Write(SQL);
    //Response.End();        
    DataTable dt_table1 = CtlLib.TableReadOpen(SQL1); 
    
    if(dt_table1.Rows.Count==0)
    {
        Response.Write("There is no data");
        Response.End();
    }

    string SQL2
    = "select c00, c01 , count(*), sum(nvl(c07,0)) c07, sum(nvl(c08,0)) c08 " +
        "from " +
        "( " +
        "select c00, c01, c02, substr(c03,1, length(c03)-1)|| replace(substr(c03,-1),'+',decode(substr(c03,-1),'+','',substr(c03,-1))) c03, c04 " +
        "    , c05, c06, c07, c08, c09 " +
        "    , c10, c11 " +
        "from " +
        "(   select B.PARTNER_NAME c00,  M.SLIP_NO c01, nvl(I.VIRTUAL_CODE, I.ITEM_CODE) c02 " +
        "    , replace(TRIM(lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 1'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 2'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 3'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 4'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 5'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 6'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 7'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 8'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 9'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 10'),'SPEC_NAME') ), '++','')   c03  " +
        "    , lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'PROD SIZE'),'SPEC_NAME') AS c04 " +
        "    , D.pattern c05 " +        
        "    , lg_f_get_prod_color_item(i.pk, I.TLG_IT_ITEMGRP_PK,'MAT COLOR','SPEC_NAME','/') C06 " +
        "    , nvl(I.LOT_QTY,0) * nvl(D.ORD_QTY,0) c07 " +
        "    , PM.PLAN_QTY c08 " +
        "    , D.LOT_UOM c09 " +
        "    , to_char(to_date(PM.PLAN_DATE,'yyyymmdd'),'dd/mm/yyyy') c10   " +
        "    , PM.PLAN_DATE c11                      " +
        "    , to_char(to_date('" + p_day01 + "','yyyymmdd'),'DD-MON') c12   " +
        "    , to_char(to_date('" + p_day01 + "','yyyymmdd') + 6 ,'DD-MON') c13   " +
        "    from tlg_sa_saleorder_d d " +
        "        , tlg_it_item i " +
        "        , tlg_gd_plan_m pm " +
        "        , tlg_sa_saleorder_m m  " +
        "        , TCO_BUSPARTNER B                     " +
        "    where d.DEL_IF=0 " +
        "    and I.DEL_IF=0 " +
        "    AND B.DEL_IF = 0 " +
        "    and PM.DEL_IF=0 " +
        "    and M.DEL_IF=0 " +
        "        AND (I.ITEM_CODE LIKE '%' || UPPER('" + p_item + "') || '%'  " +
        "            OR " +
        "            I.ITEM_name LIKE '%' || UPPER('" + p_item + "') || '%' ) " +
        "        AND M.SLIP_NO LIKE '%' || UPPER('" + p_so_no + "') || '%' " +
        "        AND (B.PARTNER_ID LIKE '%' || UPPER('" + p_cus_id + "') || '%' " +
        "            OR " +
        "            B.PARTNER_NAME  LIKE '%' || UPPER('" + p_cus_id + "') || '%' ) " +
        "        and PM.PLAN_DATE between '" + p_day01 + "' and to_char(to_date('" + p_day01 + "','yyyymmdd') + 6 ,'yyyymmdd') " +
        "    AND B.PK = M.DELI_TO_PK      " +
        "    and M.PK = D.TLG_SA_SALEORDER_M_PK " +
        "    and D.PK = PM.TLG_SA_SALEORDER_D_PK " +
        "    and D.TLG_IT_ITEM_PK  = I.PK                 " +
        ") sub " +
        ") " +
        "group by c00, c01 " +
        "order by c00, c01 ";
    
        DataTable dt_table2 = CtlLib.TableReadOpen(SQL2);

        string SQL3
    = "select c00, count(*) , sum(nvl(c07,0)) c07, sum(nvl(c08,0)) c08 " +
        "from " +
        "( " +
        "select c00, c01, c02, substr(c03,1, length(c03)-1)|| replace(substr(c03,-1),'+',decode(substr(c03,-1),'+','',substr(c03,-1))) c03, c04 " +
        "    , c05, c06, c07, c08, c09 " +
        "    , c10, c11 " +
        "from " +
        "(   select B.PARTNER_NAME c00,  M.SLIP_NO c01, nvl(I.VIRTUAL_CODE, I.ITEM_CODE) c02 " +
        "    , replace(TRIM(lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 1'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 2'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 3'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 4'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 5'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 6'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 7'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 8'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 9'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 10'),'SPEC_NAME') ), '++','')   c03  " +
        "    , lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'PROD SIZE'),'SPEC_NAME') AS c04 " +
        "    , D.pattern c05 " +            
        "    , lg_f_get_prod_color_item(i.pk, I.TLG_IT_ITEMGRP_PK,'MAT COLOR','SPEC_NAME','/') C06 " +
        "    , nvl(I.LOT_QTY,0) * nvl(D.ORD_QTY,0) c07 " +
        "    , PM.PLAN_QTY c08 " +
        "    , D.LOT_UOM c09 " +
        "    , to_char(to_date(PM.PLAN_DATE,'yyyymmdd'),'dd/mm/yyyy') c10   " +
        "    , PM.PLAN_DATE c11                      " +
        "    , to_char(to_date('" + p_day01 + "','yyyymmdd'),'DD-MON') c12   " +
        "    , to_char(to_date('" + p_day01 + "','yyyymmdd') + 6 ,'DD-MON') c13   " +
        "    from tlg_sa_saleorder_d d " +
        "        , tlg_it_item i " +
        "        , tlg_gd_plan_m pm " +
        "        , tlg_sa_saleorder_m m  " +
        "        , TCO_BUSPARTNER B                     " +
        "    where d.DEL_IF=0 " +
        "    and I.DEL_IF=0 " +
        "    AND B.DEL_IF = 0 " +
        "    and PM.DEL_IF=0 " +
        "    and M.DEL_IF=0 " +
        "        AND (I.ITEM_CODE LIKE '%' || UPPER('" + p_item + "') || '%'  " +
        "            OR " +
        "            I.ITEM_name LIKE '%' || UPPER('" + p_item + "') || '%' ) " +
        "        AND M.SLIP_NO LIKE '%' || UPPER('" + p_so_no + "') || '%' " +
        "        AND (B.PARTNER_ID LIKE '%' || UPPER('" + p_cus_id + "') || '%' " +
        "            OR " +
        "            B.PARTNER_NAME  LIKE '%' || UPPER('" + p_cus_id + "') || '%' ) " +
        "        and PM.PLAN_DATE between '" + p_day01 + "' and to_char(to_date('" + p_day01 + "','yyyymmdd') + 6 ,'yyyymmdd') " +
        "    AND B.PK = M.DELI_TO_PK      " +
        "    and M.PK = D.TLG_SA_SALEORDER_M_PK " +
        "    and D.PK = PM.TLG_SA_SALEORDER_D_PK " +
        "    and D.TLG_IT_ITEM_PK  = I.PK                 " +
        ") sub " +
        ") " +
        "group by c00 " +
        "order by c00 ";

        DataTable dt_table3 = CtlLib.TableReadOpen(SQL3);

        string SQL4
    = "select c00, count(*)  " +
        "from " +
        "( " +
        "select c00,c01, count(*) " +
        "from " +
        "( " +
        "select c00, c01, c02, substr(c03,1, length(c03)-1)|| replace(substr(c03,-1),'+',decode(substr(c03,-1),'+','',substr(c03,-1))) c03, c04 " +
        "    , c05, c06, c07, c08, c09 " +
        "    , c10, c11 " +
        "from " +
        "(   select B.PARTNER_NAME c00,  M.SLIP_NO c01, nvl(I.VIRTUAL_CODE, I.ITEM_CODE) c02 " +
        "    , replace(TRIM(lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 1'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 2'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 3'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 4'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 5'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 6'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 7'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 8'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 9'),'SPEC_NAME') || '+' || " +
        "          lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'SPEC 10'),'SPEC_NAME') ), '++','')   c03  " +
        "    , lg_f_get_spec_info_item( I.PK,lg_f_get_spec_seq_item(I.TLG_IT_ITEMGRP_PK,'PROD SIZE'),'SPEC_NAME') AS c04 " +
        "    , D.pattern c05 " +            
        "    , lg_f_get_prod_color_item(i.pk, I.TLG_IT_ITEMGRP_PK,'MAT COLOR','SPEC_NAME','/') C06 " +
        "    , nvl(I.LOT_QTY,0) * nvl(D.ORD_QTY,0) c07 " +
        "    , PM.PLAN_QTY c08 " +
        "    , D.LOT_UOM c09 " +
        "    , to_char(to_date(PM.PLAN_DATE,'yyyymmdd'),'dd/mm/yyyy') c10   " +
        "    , PM.PLAN_DATE c11                      " +
        "    , to_char(to_date('" + p_day01 + "','yyyymmdd'),'DD-MON') c12   " +
        "    , to_char(to_date('" + p_day01 + "','yyyymmdd') + 6 ,'DD-MON') c13   " +
        "    from tlg_sa_saleorder_d d " +
        "        , tlg_it_item i " +
        "        , tlg_gd_plan_m pm " +
        "        , tlg_sa_saleorder_m m  " +
        "        , TCO_BUSPARTNER B                     " +
        "    where d.DEL_IF=0 " +
        "    and I.DEL_IF=0 " +
        "    AND B.DEL_IF = 0 " +
        "    and PM.DEL_IF=0 " +
        "    and M.DEL_IF=0 " +
        "        AND (I.ITEM_CODE LIKE '%' || UPPER('" + p_item + "') || '%'  " +
        "            OR " +
        "            I.ITEM_name LIKE '%' || UPPER('" + p_item + "') || '%' ) " +
        "        AND M.SLIP_NO LIKE '%' || UPPER('" + p_so_no + "') || '%' " +
        "        AND (B.PARTNER_ID LIKE '%' || UPPER('" + p_cus_id + "') || '%' " +
        "            OR " +
        "            B.PARTNER_NAME  LIKE '%' || UPPER('" + p_cus_id + "') || '%' ) " +
        "        and PM.PLAN_DATE between '" + p_day01 + "' and to_char(to_date('" + p_day01 + "','yyyymmdd') + 6 ,'yyyymmdd') " +
        "    AND B.PK = M.DELI_TO_PK      " +
        "    and M.PK = D.TLG_SA_SALEORDER_M_PK " +
        "    and D.PK = PM.TLG_SA_SALEORDER_D_PK " +
        "    and D.TLG_IT_ITEM_PK  = I.PK                 " +
        ") sub " +
        ") " +
        "group by c00, c01 " +
        ") " +
        "group by c00 " +
        "order by c00 ";

        DataTable dt_table4 = CtlLib.TableReadOpen(SQL4);
     %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_dscd00110_1_ens_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dscd00110_1_ens_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dscd00110_1_ens_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Hee Nguyen</o:Author>
  <o:LastAuthor>Hee Nguyen</o:LastAuthor>
  <o:LastPrinted>2014-09-29T04:33:27Z</o:LastPrinted>
  <o:Created>2014-09-29T04:31:18Z</o:Created>
  <o:LastSaved>2014-09-29T06:40:25Z</o:LastSaved>
  <o:Company>MSHOME</o:Company>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.66in .39in .6in .35in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-page-orientation:landscape;}
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style16
	{mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	mso-style-name:Comma;
	mso-style-id:3;}
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
.style57
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
.xl66
	{mso-style-parent:style57;
	font-size:14.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl67
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl68
	{mso-style-parent:style57;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl69
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl70
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFCC;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl71
	{mso-style-parent:style57;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFCC;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl72
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl73
	{mso-style-parent:style57;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl74
	{mso-style-parent:style57;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl75
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CC99FF;
	mso-pattern:auto none;}
.xl76
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFCC;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl77
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFCC;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl78
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFCC;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl79
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFCC;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl80
	{mso-style-parent:style57;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFCC;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl81
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFCC;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl82
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
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
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
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
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
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
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl86
	{mso-style-parent:style57;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl87
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl88
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CC99FF;
	mso-pattern:auto none;}
.xl89
	{mso-style-parent:style57;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl90
	{mso-style-parent:style57;
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
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl91
	{mso-style-parent:style57;
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
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl92
	{mso-style-parent:style57;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl93
	{mso-style-parent:style57;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl94
	{mso-style-parent:style57;
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
.xl95
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl96
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl97
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl98
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl99
	{mso-style-parent:style57;
	color:black;
	font-size:11.0pt;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl100
	{mso-style-parent:style16;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CC99FF;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
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
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>4</x:SplitHorizontal>
     <x:TopRowBottomPane>4</x:TopRowBottomPane>
     <x:ActivePane>2</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
       <x:ActiveCol>10</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>12585</x:WindowHeight>
  <x:WindowWidth>18195</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>30</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1208 style='border-collapse:
 collapse;table-layout:fixed;width:907pt'>
 <col width=188 style='mso-width-source:userset;mso-width-alt:6875;width:141pt'>
 <col width=101 style='mso-width-source:userset;mso-width-alt:3693;width:76pt'>
 <col width=105 style='mso-width-source:userset;mso-width-alt:3840;width:79pt'>
 <col width=142 style='mso-width-source:userset;mso-width-alt:5193;width:107pt'>
 <col width=111 style='mso-width-source:userset;mso-width-alt:4059;width:83pt'>
 <col width=70 style='mso-width-source:userset;mso-width-alt:2560;width:53pt'>
 <col width=127 style='mso-width-source:userset;mso-width-alt:4644;width:95pt'>
 <col width=107 style='mso-width-source:userset;mso-width-alt:3913;width:80pt'>
 <col width=104 style='mso-width-source:userset;mso-width-alt:3803;width:78pt'>
 <col width=64 style='width:48pt'>
 <col width=89 style='mso-width-source:userset;mso-width-alt:3254;width:67pt'>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl74 width=188 style='height:15.0pt;width:141pt'></td>
  <td class=xl74 width=101 style='width:76pt'></td>
  <td class=xl74 width=105 style='width:79pt'></td>
  <td class=xl74 width=142 style='width:107pt'></td>
  <td class=xl74 width=111 style='width:83pt'></td>
  <td class=xl74 width=70 style='width:53pt'></td>
  <td class=xl74 width=127 style='width:95pt'></td>
  <td class=xl74 width=107 style='width:80pt'></td>
  <td class=xl74 width=104 style='width:78pt'></td>
  <td class=xl74 width=64 style='width:48pt'></td>
  <td class=xl74 width=89 style='width:67pt'></td>
 </tr>
 <tr height=24 style='height:18.0pt'>
  <td colspan=11 height=24 class=xl66 style='height:18.0pt'>Delivery Plan
  Report (<%=dt_table1.Rows[0]["c12"].ToString() %> ~ <%=dt_table1.Rows[0]["c13"].ToString() %>)</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl95 style='height:15.0pt'>&nbsp;</td>
  <td class=xl96>&nbsp;</td>
  <td class=xl96>&nbsp;</td>
  <td class=xl96>&nbsp;</td>
  <td class=xl96>&nbsp;</td>
  <td class=xl96>&nbsp;</td>
  <td class=xl96>&nbsp;</td>
  <td class=xl96>&nbsp;</td>
  <td class=xl96>&nbsp;</td>
  <td class=xl96>&nbsp;</td>
  <td class=xl97>&nbsp;</td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl89 style='height:21.75pt;border-top:none'>Customer</td>
  <td class=xl90 style='border-top:none'>Order No</td>
  <td class=xl90 style='border-top:none'>Custom Item</td>
  <td class=xl91 style='border-top:none'>Item local name</td>
  <td class=xl91 style='border-top:none'>Size</td>
  <td class=xl91 style='border-top:none'>Pattern</td>
  <td class=xl91 style='border-top:none'>Color</td>
  <td class=xl91 style='border-top:none'>Norm Q.ty</td>
  <td class=xl91 style='border-top:none'>Deli. Q.ty</td>
  <td class=xl91 style='border-top:none'>Unit</td>
  <td class=xl90 style='border-top:none'>Deli. Date</td>
 </tr>
    <%
        int i1 = 0, i2 = 0, i3 = 0, i4 = 0;
        int flag1 = 0, flag2 = 0, flag3 = 0, flag4 = 0;
        double grand_c07 = 0, grand_c08 = 0;
        for(int i=0;i<dt_table1.Rows.Count;i++ )
        {
            grand_c07 += double.Parse( dt_table1.Rows[i]["c07"].ToString());
            grand_c08 += double.Parse( dt_table1.Rows[i]["c08"].ToString());
            //dieu kien xuat hien rowspan
            if (i == 0)
                flag1 = 1;
            else if (dt_table1.Rows[i]["c00"].ToString() != dt_table1.Rows[i - 1]["c00"].ToString())
                flag1 = 1;
            else
                flag1 = 0;

            if (i == 0)
                flag2 = 1;
            else if (dt_table1.Rows[i]["c01"].ToString() != dt_table1.Rows[i - 1]["c01"].ToString())
                flag2 = 1;
            else
                flag2 = 0;
           
            //dieu kien xuat hien subtotal

            if (i < dt_table1.Rows.Count - 1)
            {
                if (dt_table1.Rows[i]["c00"].ToString() != dt_table1.Rows[i + 1]["c00"].ToString())
                    flag4 = 1;
                else
                    flag4 = 0;
            }
            else
                flag4 = 1;

            if (i < dt_table1.Rows.Count - 1)
            {
                if (dt_table1.Rows[i]["c01"].ToString() != dt_table1.Rows[i + 1]["c01"].ToString())
                    flag3 = 1;
                else
                    flag3 = 0;
            }
            else
                flag3 = 1;
            
         %>
 <tr height=20 style='height:15.0pt'>
     <% if(flag1==1)
        { %>
  <td rowspan=<%=int.Parse( dt_table3.Rows[i3][1].ToString()) + int.Parse( dt_table4.Rows[i4++][1].ToString()) + 1   %> 
      height=90 class=xl92 style='border-bottom:.5pt solid black;
  height:67.5pt;border-top:none'><%=dt_table1.Rows[i]["c00"].ToString() %></td>
     <%
     } %>
     <%
         if(flag2==1)
         { %>
  <td rowspan=<%=int.Parse( dt_table2.Rows[i2][2].ToString()) + 1   %> class=xl98 style='border-bottom:.5pt solid black;border-top:
  none'><%=dt_table1.Rows[i]["c01"].ToString() %></td>
     <%} %>
  <td class=xl67><%=dt_table1.Rows[i]["c02"].ToString() %></td>
  <td class=xl67><%=dt_table1.Rows[i]["c03"].ToString() %></td>
  <td class=xl67><%=dt_table1.Rows[i]["c04"].ToString() %></td>
  <td class=xl67><%=dt_table1.Rows[i]["c05"].ToString() %></td>
  <td class=xl68><%=dt_table1.Rows[i]["c06"].ToString() %></td>
  <td class=xl69 x:num ><%=dt_table1.Rows[i]["c07"].ToString() %></td>
  <td class=xl69 x:num ><%=dt_table1.Rows[i]["c08"].ToString() %></td>
  <td class=xl68><%=dt_table1.Rows[i]["c09"].ToString() %></td>
  <td class=xl67><%=dt_table1.Rows[i]["c10"].ToString() %></td>
 </tr>
    <%
        if(flag3==1)
        { %>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=3 height=24 class=xl76 style='border-right:.5pt solid black;
  height:18.0pt;border-left:none'>TOTAL OF: <%=dt_table1.Rows[i]["c01"].ToString() %></td>
  <td class=xl79>&nbsp;</td>
  <td class=xl79>&nbsp;</td>
  
  <td class=xl81 x:num><%=double.Parse( dt_table2.Rows[i2]["c07"].ToString()) %></td>
  <td class=xl81 x:num ><%=double.Parse( dt_table2.Rows[i2++]["c08"].ToString()) %></td>
  <td class=xl71>&nbsp;</td>
     <td class=xl71>&nbsp;</td>
 </tr>
    <%} %>
    <%
        if(flag4==1)
        { %>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=4 height=26 class=xl82 style='border-right:.5pt solid black;
  height:19.5pt;border-left:none'>TOTAL OF: <%=dt_table1.Rows[i]["c00"].ToString() %></td>
  
  <td class=xl85>&nbsp;</td>
  <td class=xl86>&nbsp;</td>
  <td class=xl87 x:num><%=double.Parse( dt_table3.Rows[i3]["c07"].ToString()) %></td>
  <td class=xl87 x:num><%=double.Parse( dt_table3.Rows[i3++]["c08"].ToString()) %></td>
  <td class=xl73>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
 </tr>
    <%} %>
    <%
    }
     %>
    
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=4 height=28 class=xl88 style='height:21.0pt'>GRAND TOTAL</td>
  <td class=xl88 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl88 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl88 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl100 style='border-top:none;border-left:none;' x:num><%=grand_c07 %></td>
  <td class=xl100 style='border-top:none;border-left:none;' x:num><%=grand_c08 %></td>
  <td class=xl75 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl75 style='border-top:none;border-left:none'>&nbsp;</td>
 </tr>  
 
 </tr>  
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>

 </tr>
 <![endif]>
</table>

</body>

</html>
