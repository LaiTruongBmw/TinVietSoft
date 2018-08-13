<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%
    Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
string p_company_pk = ""+Request["company_pk"];
string p_from_date = ""+Request["from_date"];
string p_to_date = ""+Request["to_date"];
string p_acc_pk = ""+Request["acc_pk"];
string p_bank_pk = ""+Request["bank_pk"];
string SQL ="";


string p_company_name = "";
string p_rpt_date = "";
string p_rpt_date2 = "";
string p_open_date = "";
string p_tax_code = "";
string p_cmp_add = "";
string p_common_code = "A_COM";

string p_acc_cash_vnd_arr = "";
string p_acc_cash_usd_arr = "";
string p_acc_bank_vnd_arr = "";
string p_acc_bank_usd_arr = "";

string p_open_rate = "";
string p_close_rate = "";

string SQL_1;

string p_tmp1 ="";
string p_tmp2 = "";
string p_tmp3 = "";
string p_tmp4 = "";

string p_usd1 ="";
string p_usd2 ="";
string p_usd3 ="";
string p_usd4 ="";
string p_usd5 ="";
string p_usd6 ="";

string p_vnd1 ="";
string p_vnd2 ="";
string p_vnd3 ="";
string p_vnd4 ="";
string p_vnd5 ="";
string p_vnd6 ="";

string p_usd_open_bal = "";
string p_vnd_open_bal = "";
string p_book_ccy ="VND";
int i,j,k;

	String p_xls_ccy_format_book ="";
    String p_xls_ccy_format_trans = "";
	if (p_book_ccy == "VND")
    {
         p_xls_ccy_format_book = "_\\(* \\#\\,\\#\\#0_\\)\\;\\[Red\\]_\\(\\\\ \\\\\\(\\#\\,\\#\\#0\\\\\\)\\;_\\(* \\0022-\\0022??_\\)\\;_\\(\\@_\\)";
        p_xls_ccy_format_trans = "_\\(* \\#\\,\\#\\#0\\.00_\\)\\;\\[Red\\]_\\(\\\\ \\\\\\(\\#\\,\\#\\#0\\.00\\\\\\)\\;_\\(* \\0022-\\0022??_\\)\\;_\\(\\@_\\)";
    }
    else
    {
        p_xls_ccy_format_book = "_\\(* \\#\\,\\#\\#0\\.00_\\)\\;\\[Red\\]_\\(\\\\ \\\\\\(\\#\\,\\#\\#0\\.00\\\\\\)\\;_\\(* \\0022-\\0022??_\\)\\;_\\(\\@_\\)";
		p_xls_ccy_format_trans = "_\\(* \\#\\,\\#\\#0_\\)\\;\\[Red\\]_\\(\\\\ \\\\\\(\\#\\,\\#\\#0\\\\\\)\\;_\\(* \\0022-\\0022??_\\)\\;_\\(\\@_\\)";
		
    }
/*
SQL = "SELECT CODE, CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='???' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' " ;
DataTable dt_cm = ESysLib.TableReadOpen(SQL);
p_common_code = dt_cm.Rows[0][0].ToString();

*/
SQL = " SELECT partner_lname, ";
SQL += "          TRIM (TO_CHAR (TO_DATE ('"+p_from_date+"', 'YYYYMMDD'), 'MONTH'))|| ', '|| SUBSTR ('"+p_from_date+"', 0, 4) aa, ";
SQL += "          INITCAP (TRIM (TO_CHAR (SYSDATE, 'MONTH')))|| ' '|| LOWER(TO_CHAR (SYSDATE, 'DDth, YYYY')) aaa, ";
SQL += " to_char(TO_DATE ('" + p_from_date + "', 'YYYYMMDD'),'dd-mon-yy'), tax_code,ADDR1,ADDR2,ADDR3 ";
SQL += "  FROM tco_company ";
SQL += " WHERE pk =" + p_company_pk;

DataTable dt = ESysLib.TableReadOpen(SQL);
p_company_name = dt.Rows[0][0].ToString();
p_rpt_date = dt.Rows[0][1].ToString();
p_rpt_date2 = dt.Rows[0][2].ToString();
p_open_date = dt.Rows[0][3].ToString();
p_tax_code = dt.Rows[0][4].ToString();
p_cmp_add = dt.Rows[0][5].ToString();

SQL = " SELECT   a.ac_cd, a.ac_nm, a.pk, c.cha_value1 ";
SQL += "    FROM tac_abacctcode a, tco_abcode c, tco_abcodegrp d ";
SQL += "   WHERE a.del_if = 0 ";
SQL += "     AND c.del_if = 0 ";
SQL += "     AND d.del_if = 0 ";
SQL += "     AND a.leaf_yn = 'Y' ";
SQL += "     AND ID = 'FUAB0050' ";
SQL += "     AND c.use_if = '1' ";
SQL += "     AND d.pk = c.tco_abcodegrp_pk ";
SQL += "     AND c.code = a.ac_cd ";
SQL += "     AND a.tco_company_pk =  " + p_company_pk;
SQL += " ORDER BY a.ac_cd ";

DataTable dt1 = ESysLib.TableReadOpen(SQL);

for (i = 0; i < dt1.Rows.Count; i++)
{
    if (dt1.Rows[i][0].ToString().Substring(0, 3) == "111") //cash
    {
        if (dt1.Rows[i][3].ToString() == "VND")
        {
            p_acc_cash_vnd_arr += p_tmp1 + dt1.Rows[i][2].ToString();
            p_tmp1 = ",";
        }
        else if (dt1.Rows[i][3].ToString() == "USD")
        {
            p_acc_cash_usd_arr += p_tmp2 + dt1.Rows[i][2].ToString();
            p_tmp2 = ",";
        }
    }
    else if (dt1.Rows[i][0].ToString().Substring(0, 3) == "112") //bank
    {
        if (dt1.Rows[i][3].ToString() == "VND")
        {
            p_acc_bank_vnd_arr += p_tmp3 + dt1.Rows[i][2].ToString();
            p_tmp3 = ",";
        }
        else if (dt1.Rows[i][3].ToString() == "USD")
        {
            p_acc_bank_usd_arr += p_tmp4 + dt1.Rows[i][2].ToString();
            p_tmp4 = ",";
        }
    }
}
//Select Open Rate
SQL = "SELECT ttm_rate " + 
        "    FROM tac_abexrates " +
        "    WHERE del_if = 0 " +
        "    AND ccy = 'USD' " +
        "    AND tco_company_pk = " + p_company_pk+
        "    AND std_ymd = '"+p_from_date+"' ";
		
DataTable dt_rate = ESysLib.TableReadOpen(SQL);
if (dt_rate.Rows.Count >0)
{
	p_open_rate = dt_rate.Rows[0][0].ToString();
}
else
{
	SQL = " SELECT ttm_rate " + 
        "          FROM tac_abexrates " +
        "         WHERE del_if = 0 " +
        "           AND ccy = 'USD' " +
        "           AND tco_company_pk = " + p_company_pk+
        "           AND std_ymd = (SELECT MAX (std_ymd) " +
        "                            FROM tac_abexrates " +
        "                           WHERE del_if = 0 AND ccy = 'USD' AND tco_company_pk = " + p_company_pk+") " ;
	dt_rate = ESysLib.TableReadOpen(SQL);
	p_open_rate = dt_rate.Rows[0][0].ToString();
}

//Select Close Rate
SQL = "SELECT ttm_rate " + 
        "    FROM tac_abexrates " +
        "    WHERE del_if = 0 " +
        "    AND ccy = 'USD' " +
        "    AND tco_company_pk = " + p_company_pk+
        "    AND std_ymd = '"+p_to_date+"' ";
		
dt_rate = ESysLib.TableReadOpen(SQL);
if (dt_rate.Rows.Count >0)
{
	p_close_rate = dt_rate.Rows[0][0].ToString();
}
else
{
	SQL = " SELECT ttm_rate " + 
        "          FROM tac_abexrates " +
        "         WHERE del_if = 0 " +
        "           AND ccy = 'USD' " +
        "           AND tco_company_pk = " + p_company_pk+
        "           AND std_ymd = (SELECT MAX (std_ymd) " +
        "                            FROM tac_abexrates " +
        "                           WHERE del_if = 0 AND ccy = 'USD' AND tco_company_pk = " + p_company_pk+") " ;
	dt_rate = ESysLib.TableReadOpen(SQL);
	p_close_rate = dt_rate.Rows[0][0].ToString();
}
//
SQL_1 = " SELECT to_char(sf_get_cashddbal(" + p_company_pk + ",'" + p_from_date + "'," + p_acc_cash_usd_arr + ",'','TRANS'),'9,999,999,990.99') CASH_USD ,";
SQL_1 = SQL_1 + " to_char(sf_get_cashddbal(" + p_company_pk + ",'" + p_from_date + "'," + p_acc_cash_vnd_arr + ",'','TRANS'),'9,999,999,999,999,990') CASH_VND ";
SQL_1 = SQL_1 + " FROM DUAL ";

string p_cash_usd ="";
string p_cash_vnd = "";
string p_bank_usd = "";
string p_bank_vnd = "";
DataTable dt_openbal = ESysLib.TableReadOpen(SQL_1);
p_cash_usd = dt_openbal.Rows[0][0].ToString();
p_cash_vnd = dt_openbal.Rows[0][1].ToString();

	SQL_1 = "SELECT to_char(NVL (SUM (ymd_drfsum), 0) - NVL (SUM (ymd_crfsum),0),'9,999,999,999,999,990') dd_amt   " +
        " FROM tac_bgcashdepoddbal " +
        " WHERE tco_company_pk =  " + p_company_pk+
        " AND std_ymd <  '" +p_from_date+"' "+
        " AND tac_abacctcode_pk in (" + p_acc_bank_vnd_arr + ")" +
        " AND del_if = 0 ";
	dt_openbal = ESysLib.TableReadOpen(SQL_1);
	p_bank_vnd = dt_openbal.Rows[0][0].ToString();  
	
	
	SQL_1 = "SELECT to_char((NVL (SUM (ymd_drfsum), 0) - NVL (SUM (ymd_crfsum),0)),'9,999,999,990.99') dd_amt   " +
	" FROM tac_bgcashdepoddbal " +
	" WHERE tco_company_pk =  " + p_company_pk +
	" AND std_ymd <  '" + p_from_date + "' " +
	" AND tac_abacctcode_pk in (" + p_acc_bank_usd_arr + ")" +
	" AND del_if = 0 ";
    dt_openbal = ESysLib.TableReadOpen(SQL_1);
    p_bank_usd = dt_openbal.Rows[0][0].ToString();

SQL = " SELECT TO_CHAR(NVL((to_number('"+p_cash_usd+"','9,999,999,990.99') + to_number('"+p_cash_vnd+"','9,999,999,999,999,990')/("+p_open_rate+")),0),'9,999,999,990.99') USD1,";

SQL+= " TO_CHAR(NVL((to_number('"+p_cash_usd+"','9,999,999,990.99')*(" +p_open_rate+") + to_number('"+p_cash_vnd+"','9,999,999,999,999,990')),0),'9,999,999,999,999,990') VND1,";

SQL+= " TO_CHAR(NVL((to_number('"+p_bank_usd+"','9,999,999,990.99')+to_number('"+p_bank_vnd+"','9,999,999,999,999,990')/("+p_open_rate+")),0),'9,999,999,990.99') USD2,";

SQL+= " TO_CHAR(NVL((to_number('"+p_bank_usd+"','9,999,999,990.99')*(" +p_open_rate+") + to_number('"+p_bank_vnd+"','9,999,999,999,999,990')),0),'9,999,999,999,999,990') VND2,";

SQL+=" TO_CHAR(NVL((to_number('"+p_cash_usd+"','9,999,999,990.99')+to_number('"+p_cash_vnd+"','9,999,999,999,999,990')/("+p_open_rate+") + to_number('"+p_bank_usd+"', '9,999,999,990.99') + to_number('"+p_bank_vnd+"','9,999,999,999,999,990')/("+p_open_rate+")),0),'9,999,999,990.99') USD3,";

SQL+=" TO_CHAR(NVL((to_number('"+p_cash_usd+"','9,999,999,990.99')*(" +p_open_rate+") + to_number('"+p_cash_vnd +"','9,999,999,999,999,990') + to_number('"+p_bank_usd+"','9,999,999,990.99')*(" +p_open_rate+") + to_number('"+p_bank_vnd+"','9,999,999,999,999,990')),0),'9,999,999,999,999,990') VND3 FROM DUAL ";


dt_openbal = ESysLib.TableReadOpen(SQL);
p_usd1 = dt_openbal.Rows[0][0].ToString().Trim();
p_vnd1 = dt_openbal.Rows[0][1].ToString().Trim();
p_usd2 = dt_openbal.Rows[0][2].ToString().Trim();
p_vnd2 = dt_openbal.Rows[0][3].ToString().Trim();
p_usd3 = dt_openbal.Rows[0][4].ToString().Trim();
p_vnd3 = dt_openbal.Rows[0][5].ToString().Trim();

p_usd_open_bal = dt_openbal.Rows[0][4].ToString().Trim();
p_vnd_open_bal = dt_openbal.Rows[0][5].ToString().Trim();

if (p_usd1.Substring(0, 1) == "-")
{
    p_usd1 = "(" + p_usd1.Substring(1) + ")";
}
if (p_vnd1.Substring(0, 1) == "-")
{
    p_vnd1 = "(" + p_vnd1.Substring(1) + ")";
}
if (p_usd2.Substring(0, 1) == "-")
{
    p_usd2 = "(" + p_usd2.Substring(1) + ")";
}
if (p_vnd2.Substring(0, 1) == "-")
{
    p_vnd2 = "(" + p_vnd2.Substring(1) + ")";
}
if (p_usd3.Substring(0, 1) == "-")
{
    p_usd3 = "(" + p_usd3.Substring(1) + ")";
}
if (p_vnd3.Substring(0, 1) == "-")
{
    p_vnd3 = "(" + p_vnd3.Substring(1) + ")";
}    

SQL_1 = " SELECT to_char(sf_get_cashddbal(" + p_company_pk + ",'" + p_to_date + "'," + p_acc_cash_usd_arr + ",'','TRANS'),'9,999,999,990.99') CASH_USD ,";
SQL_1 = SQL_1 + " to_char(sf_get_cashddbal(" + p_company_pk + ",'" + p_to_date + "'," + p_acc_cash_vnd_arr + ",'','TRANS'),'9,999,999,999,999,990') CASH_VND ";
SQL_1 = SQL_1 + " FROM DUAL ";
dt_openbal = ESysLib.TableReadOpen(SQL_1);
p_cash_usd = dt_openbal.Rows[0][0].ToString();
p_cash_vnd = dt_openbal.Rows[0][1].ToString();
SQL_1 = "SELECT to_char(NVL (SUM (ymd_drfsum), 0) - NVL (SUM (ymd_crfsum),0),'9,999,999,999,999,990') dd_amt   " +
        " FROM tac_bgcashdepoddbal " +
        " WHERE tco_company_pk =  " + p_company_pk+
        " AND std_ymd <  '" +p_to_date+"' "+
        " AND tac_abacctcode_pk in (" + p_acc_bank_vnd_arr + ")" +
        " AND del_if = 0 ";
	dt_openbal = ESysLib.TableReadOpen(SQL_1);
	p_bank_vnd = dt_openbal.Rows[0][0].ToString();  
	
	
	SQL_1 = "SELECT to_char((NVL (SUM (ymd_drfsum), 0) - NVL (SUM (ymd_crfsum),0)),'9,999,999,990.99') dd_amt   " +
	" FROM tac_bgcashdepoddbal " +
	" WHERE tco_company_pk =  " + p_company_pk +
	" AND std_ymd <  '" + p_to_date + "' " +
	" AND tac_abacctcode_pk in (" + p_acc_bank_usd_arr + ")" +
	" AND del_if = 0 ";
    dt_openbal = ESysLib.TableReadOpen(SQL_1);
    p_bank_usd = dt_openbal.Rows[0][0].ToString();

SQL = " SELECT TO_CHAR(NVL((to_number('"+p_cash_usd+"','9,999,999,990.99') + to_number('"+p_cash_vnd+"','9,999,999,999,999,990')/("+p_close_rate+")),0),'9,999,999,990.99') USD1,";

SQL+= " TO_CHAR(NVL((to_number('"+p_cash_usd+"','9,999,999,990.99')*(" +p_close_rate+") + to_number('"+p_cash_vnd+"','9,999,999,999,999,990')),0),'9,999,999,999,999,990') VND1,";

SQL+= " TO_CHAR(NVL((to_number('"+p_bank_usd+"','9,999,999,990.99')+to_number('"+p_bank_vnd+"','9,999,999,999,999,990')/("+p_close_rate+")),0),'9,999,999,990.99') USD2,";

SQL+= " TO_CHAR(NVL((to_number('"+p_bank_usd+"','9,999,999,990.99')*(" +p_close_rate+") + to_number('"+p_bank_vnd+"','9,999,999,999,999,990')),0),'9,999,999,999,999,990') VND2,";

SQL+=" TO_CHAR(NVL((to_number('"+p_cash_usd+"','9,999,999,990.99')+to_number('"+p_cash_vnd+"','9,999,999,999,999,990')/("+p_close_rate+") + to_number('"+p_bank_usd+"', '9,999,999,990.99') + to_number('"+p_bank_vnd+"','9,999,999,999,999,990')/("+p_close_rate+")),0),'9,999,999,990.99') USD3,";

SQL+=" TO_CHAR(NVL((to_number('"+p_cash_usd+"','9,999,999,990.99')*(" +p_close_rate+") + to_number('"+p_cash_vnd +"','9,999,999,999,999,990') + to_number('"+p_bank_usd+"','9,999,999,990.99')*(" +p_close_rate+") + to_number('"+p_bank_vnd+"','9,999,999,999,999,990')),0),'9,999,999,999,999,990') VND3 FROM DUAL ";

dt_openbal = ESysLib.TableReadOpen(SQL);
p_usd4 = dt_openbal.Rows[0][0].ToString().Trim();
p_vnd4 = dt_openbal.Rows[0][1].ToString().Trim();
p_usd5 = dt_openbal.Rows[0][2].ToString().Trim();
p_vnd5 = dt_openbal.Rows[0][3].ToString().Trim();
p_usd6 = dt_openbal.Rows[0][4].ToString().Trim();
p_vnd6 = dt_openbal.Rows[0][5].ToString().Trim();

if (p_usd4.Substring(0, 1) == "-")
{
    p_usd4 = "(" + p_usd4.Substring(1) + ")";
}
if (p_vnd4.Substring(0, 1) == "-")
{
    p_vnd4 = "(" + p_vnd4.Substring(1) + ")";
}
if (p_usd5.Substring(0, 1) == "-")
{
    p_usd5 = "(" + p_usd5.Substring(1) + ")";
}
if (p_vnd5.Substring(0, 1) == "-")
{
    p_vnd5 = "(" + p_vnd5.Substring(1) + ")";
}
if (p_usd6.Substring(0, 1) == "-")
{
    p_usd6 = "(" + p_usd6.Substring(1) + ")";
}
if (p_vnd6.Substring(0, 1) == "-")
{
    p_vnd6 = "(" + p_vnd6.Substring(1) + ")";
}    


SQL = " SELECT " + 
        " INITCAP(TO_CHAR(TO_DATE(H.TR_DATE,'YYYYMMDD'),'DD-MON-YY')) DD, " +
        " D.PL_TYPE,D.REMARK,  " +
        " TO_CHAR(DECODE(D.DRCR_TYPE,'C',DECODE(D.TR_CCY,'USD',D.TR_AMT,(D.TR_AMT /"+p_close_rate+" )  ),0),'9,999,999,990.99') REC_USD, " +
        " TO_CHAR(DECODE(D.DRCR_TYPE,'C',DECODE(D.TR_CCY,'VND',D.TR_AMT,D.TR_BOOKAMT),0),'9,999,999,999,999,990') REC_VND, " +
        " TO_CHAR(DECODE(D.DRCR_TYPE,'C',0,DECODE(D.TR_CCY,'USD',D.TR_AMT,(D.TR_AMT /"+p_close_rate+" ))),'9,999,999,990.99') SPD_USD, " +
        " TO_CHAR(DECODE(D.DRCR_TYPE,'C',0,DECODE(D.TR_CCY,'VND',D.TR_AMT,D.TR_BOOKAMT)),'9,999,999,999,999,990') SPD_VND, " +
        " TO_CHAR((TO_NUMBER('"+p_usd3+"','9,999,999,999,990.99')+SUM(DECODE(D.DRCR_TYPE,'C',DECODE(D.TR_CCY,'USD',D.TR_AMT,(D.TR_AMT /"+p_close_rate+" )  ),0) - " +
        " DECODE(D.DRCR_TYPE,'C',0,DECODE(D.TR_CCY,'USD',D.TR_AMT,(D.TR_AMT /"+p_close_rate+" ))) " +
        " ) OVER (ORDER BY tr_date,D.pk )),'9,999,999,990.99') BAL_USD, " +
        " TO_CHAR((TO_NUMBER('"+p_vnd3+"','9,999,999,999,990')+SUM( " +
        " DECODE(D.DRCR_TYPE,'C',DECODE(D.TR_CCY,'VND',D.TR_AMT,D.TR_BOOKAMT),0)-  " +
        " DECODE(D.DRCR_TYPE,'C',0,DECODE(D.TR_CCY,'VND',D.TR_AMT,D.TR_BOOKAMT)) " +
        " ) OVER (ORDER BY tr_date,D.pk )),'9,999,999,999,999,990') BAL_VND, " +
        " DECODE(D.TR_CCY,'VND','"+p_close_rate+"',d.TR_EXRATE) RATE " +
        " FROM TAC_BGCASH H, TAC_BGCASHD D  " +
        " WHERE H.DEL_IF = 0  " +
        " AND D.DEL_IF = 0  " +
        " and h.tr_date between '"+p_from_date+"'  and '"+p_to_date+"'  " +
        " AND H.PK = D.TAC_BGCASH_PK  " +
        " and h.tco_company_pk = " +p_company_pk+
        " AND ((PL_TYPE IS NULL) OR DECODE('"+p_common_code+"','','1',TRIM(PL_TYPE)) <> DECODE('"+p_common_code+"','','0','"+p_common_code+"')) " +
        " order by tr_date,D.pk " ;
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="Internal_files/filelist.xml">
<link rel=Edit-Time-Data href="Internal_files/editdata.mso">
<link rel=OLE-Object-Data href="Internal_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Administrator</o:Author>
  <o:LastAuthor>Administrator</o:LastAuthor>
  <o:LastPrinted>2008-08-19T04:06:04Z</o:LastPrinted>
  <o:Created>2008-08-19T03:57:00Z</o:Created>
  <o:LastSaved>2008-08-19T04:12:19Z</o:LastSaved>
  <o:Company>vinagenuwin</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"Page &P";
	margin:.34in 0in .17in .2in;
	mso-header-margin:.25in;
	mso-footer-margin:.16in;
	mso-page-orientation:landscape;
	mso-horizontal-page-align:center;}
.font23
	{color:black;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.font27
	{color:black;
	font-size:9.0pt;
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
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl25
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[ENG\]\[$-409\]d\\-mmm\\-yy\;\@";
	text-align:center;
	vertical-align:middle;}
.xl26
	{mso-style-parent:style0;
	color:black;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style16;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style16;
	color:black;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;}
.xl29
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;}
.xl30
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl32
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl33
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;}
.xl34
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-style:italic;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.0\;\[Red\]\#\,\#\#0\.0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl35
	{mso-style-parent:style16;
	color:black;
	font-size:12.0pt;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl36
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl37
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl39
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl40
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[ENG\]\[$-409\]d\\-mmm\\-yy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl41
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl42
	{mso-style-parent:style0;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl43
	{mso-style-parent:style16;
	color:black;
	font-size:6.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl44
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl45
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl46
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl47
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl48
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl49
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl50
	{mso-style-parent:style16;
	color:red;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl51
	{mso-style-parent:style0;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;
	}
.xl52
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl53
	{mso-style-parent:style0;
	font-family:VNI-TIMES;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl54
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl55
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl56
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl57
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl58
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl59
	{mso-style-parent:style16;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl60
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl61
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl62
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[ENG\]\[$-409\]d\\-mmm\\-yy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl63
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl64
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl65
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl66
	{mso-style-parent:style16;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl67
	{mso-style-parent:style16;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl68
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl69
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl70
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl71
	{mso-style-parent:style16;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[ENG\]\[$-409\]d\\-mmm\\-yy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl73
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl75
	{mso-style-parent:style16;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl76
	{mso-style-parent:style16;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl77
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl78
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl79
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl80
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl81
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl82
	{mso-style-parent:style16;
	color:red;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl83
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl85
	{mso-style-parent:style16;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl87
	{mso-style-parent:style16;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl88
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl89
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl90
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl91
	{mso-style-parent:style16;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl92
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl93
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl95
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl96
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl97
	{mso-style-parent:style16;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl98
	{mso-style-parent:style0;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl99
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl100
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl101
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl102
	{mso-style-parent:style0;
	color:black;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl103
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl104
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl105
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl108
	{mso-style-parent:style16;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;}
.xl109
	{mso-style-parent:style16;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl110
	{mso-style-parent:style16;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl111
	{mso-style-parent:style16;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl119
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl120
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl121
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl122
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl123
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl124
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl125
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl126
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl127
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl128
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl129
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl130
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl133
	{mso-style-parent:style0;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl134
	{mso-style-parent:style0;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl135
	{mso-style-parent:style16;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl136
	{mso-style-parent:style16;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;}
.xl137
	{mso-style-parent:style16;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl138
	{mso-style-parent:style16;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl139
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl140
	{mso-style-parent:style0;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl141
	{mso-style-parent:style0;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl142
	{mso-style-parent:style0;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl143
	{mso-style-parent:style0;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>all report</x:Name>
    <x:WorksheetOptions>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>87</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>1200</x:VerticalResolution>
     </x:Print>
     <x:Zoom>90</x:Zoom>
     <x:Selected/>
     <x:LeftColumnVisible>2</x:LeftColumnVisible>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>16</x:ActiveRow>
       <x:ActiveCol>9</x:ActiveCol>
       <x:RangeSelection>$J$17:$L$17</x:RangeSelection>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>8445</x:WindowHeight>
  <x:WindowWidth>15000</x:WindowWidth>
  <x:WindowTopX>240</x:WindowTopX>
  <x:WindowTopY>345</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>_FilterDatabase</x:Name>
  <x:Hidden/>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>='all report'!$A$5:$L$12</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>='all report'!$5:$6</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1036"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1171 style='border-collapse:
 collapse;table-layout:fixed;width:879pt'>
 <col class=xl24 width=28 style='mso-width-source:userset;mso-width-alt:1024;
 width:21pt'>
 <col class=xl25 width=65 style='mso-width-source:userset;mso-width-alt:2377;
 width:49pt'>
 <col class=xl25 width=56 style='mso-width-source:userset;mso-width-alt:2048;
 width:42pt'>
 <col class=xl24 width=331 style='mso-width-source:userset;mso-width-alt:12105;
 width:248pt'>
 <col class=xl26 width=96 style='mso-width-source:userset;mso-width-alt:3510;
 width:72pt'>
 <col class=xl24 width=114 style='mso-width-source:userset;mso-width-alt:4169;
 width:86pt'>
 <col class=xl27 width=87 style='mso-width-source:userset;mso-width-alt:3181;
 width:65pt'>
 <col class=xl28 width=105 style='mso-width-source:userset;mso-width-alt:3840;
 width:79pt'>
 <col class=xl27 width=91 style='mso-width-source:userset;mso-width-alt:3328;
 width:68pt'>
 <col class=xl27 width=100 style='mso-width-source:userset;mso-width-alt:3657;
 width:75pt'>
 <col class=xl29 width=44 style='mso-width-source:userset;mso-width-alt:1609;
 width:33pt'>
 <col class=xl24 width=54 style='mso-width-source:userset;mso-width-alt:1974;
 width:41pt'>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td colspan=12 height=32 class=xl103 width=1171 style='height:24.0pt;
  width:879pt'><span style='mso-spacerun:yes'> </span>FINANCIAL REPORT IN<%= p_rpt_date %></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td colspan=12 height=23 class=xl104 style='height:17.25pt' >EXPENSE OF<span style='mso-spacerun:yes'>  </span><%= p_company_name %></td>
 </tr>
 <tr class=xl30 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=12 height=24 class=xl105 style='height:18.0pt'>1/ Financial
  status</td>
 </tr>
 <tr class=xl30 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=4 class=xl31 style='height:18.0pt;mso-ignore:colspan'></td>
  <td class=xl32></td>
  <td class=xl31></td>
  <td class=xl33></td>
  <td class=xl34>&nbsp;</td>
  <td class=xl35>Reported date: <%= p_rpt_date2  %></td>
  <td class=xl36></td>
  <td class=xl37></td>
  <td class=xl38>&nbsp;</td>
 </tr>
 <tr class=xl30 height=60 style='mso-height-source:userset;height:45.0pt'>
  <td height=60 class=xl39 id="_x0000_s1025" x:autofilter="all"
  x:autofilterrange="$A$5:$L$12" style='height:45.0pt'>NO</td>
  <td class=xl40 id="_x0000_s1026" x:autofilter="all">DATE</td>
  <td class=xl41 id="_x0000_s1027" x:autofilter="all" width=56
  style='width:42pt'>CODE<br>
    NO.</td>
  <td class=xl42 id="_x0000_s1028" x:autofilter="all" width=331
  style='width:248pt'>CONTENT</td>
  <td colspan=2 class=xl106 id="_x0000_s1029" x:autofilter="all" width=210
  style='border-right:.5pt solid black;border-left:none;width:158pt'>RECEIVING</td>
  <td colspan=2 class=xl108 id="_x0000_s1031" x:autofilter="all"
  style='border-right:.5pt solid black;border-left:none' x:str="SPENDING"><span
  style='mso-spacerun:yes'> </span>SPENDING<span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=2 class=xl110 id="_x0000_s1033" x:autofilter="all" width=191
  style='border-right:.5pt solid black;border-left:none;width:143pt'
  x:str="BALANCE "><span style='mso-spacerun:yes'> </span>BALANCE<span
  style='mso-spacerun:yes'>  </span></td>
  <td class=xl43 id="_x0000_s1034" x:autofilter="all" width=44
  style='width:33pt' x:str="Exchange &#10;Rate VND/USD"><span
  style='mso-spacerun:yes'> </span>Exchange <br>
    Rate VND/USD<span style='mso-spacerun:yes'> </span></td>
  <td class=xl44 id="_x0000_s1035" x:autofilter="all">Remark</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=4 height=22 class=xl112 width=480 style='border-right:.5pt solid black;
  height:16.5pt;width:360pt'>&nbsp;</td>
  <td class=xl45 width=96 style='width:72pt' x:str="USD"><span
  style='mso-spacerun:yes'> </span>USD<span style='mso-spacerun:yes'> </span></td>
  <td class=xl46 width=114 style='width:86pt' x:str="VND"><span
  style='mso-spacerun:yes'> </span>VND<span style='mso-spacerun:yes'> </span></td>
  <td class=xl47 width=87 style='border-top:none;width:65pt' x:str="USD"><span
  style='mso-spacerun:yes'> </span>USD<span style='mso-spacerun:yes'> </span></td>
  <td class=xl48 width=105 style='border-top:none;width:79pt' x:str="VND"><span
  style='mso-spacerun:yes'> </span>VND<span style='mso-spacerun:yes'> </span></td>
  <td class=xl46 width=91 style='width:68pt' x:str="USD"><span
  style='mso-spacerun:yes'> </span>USD<span style='mso-spacerun:yes'> </span></td>
  <td class=xl46 width=100 style='width:75pt' x:str="VND"><span
  style='mso-spacerun:yes'> </span>VND<span style='mso-spacerun:yes'> </span></td>
  <td class=xl49 width=44 style='width:33pt'>&nbsp;</td>
  <td class=xl50 width=54 style='width:41pt'>&nbsp;</td>
 </tr>
 <tr class=xl51 height=47 style='mso-height-source:userset;height:35.25pt'>
  <td colspan=3 height=47 class=xl115 width=149 style='border-right:.5pt solid black;
  height:35.25pt;width:112pt'>&nbsp;</td>
  <td class=xl52 width=331 style='width:248pt'>A balance carried forward from
  the last account</td>
  <td class=xl53 width=96 style='width:72pt'>&nbsp;</td>
  <td class=xl54 width=114 style='width:86pt'>&nbsp;</td>
  <td class=xl55>&nbsp;</td>
  <td class=xl56 width=105 style='width:79pt'>Cash : <br>
    Bank :<br>
    <font class="font27">Total:</font></td>
  <td class=xl56 width=91 style='width:68pt'><%=p_usd1 %><br>
    <%=p_usd2 %><font class="font27"><br>
    <%=p_usd3 %></font></td>
  <td class=xl56 width=100 style='width:75pt'><%=p_vnd1 %><br>
    <%=p_vnd2 %><br>
    <font class="font27"><%=p_vnd3 %></font></td>
  <td class=xl58 x:num><%= p_open_rate %></td>
  <td class=xl59>&nbsp;</td>
 </tr>
<%
	DataTable dt_detail = ESysLib.TableReadOpen(SQL);
	for(i=0;i<dt_detail.Rows.Count;i++)
	{
%>
 <tr class=xl51  style='mso-height-source:userset;'>
  <td class=xl61  x:num><%= i+1%></td>
  <td class=xl62 x:num style='white-space:nowrap;mso-text-control:shrinktofit;'><%= dt_detail.Rows[i][0].ToString()%></td>
  <td class=xl63  style='white-space:nowrap;mso-text-control:shrinktofit;'><%= dt_detail.Rows[i][1].ToString()%></td>
  <td class=xl64 width=331 style='width:248pt;white-space:normal;'><%= dt_detail.Rows[i][2].ToString()%></td>
  <td class=xl66 x:num style="mso-number-format:'<%= p_xls_ccy_format_trans %>';white-space:nowrap;mso-text-control:shrinktofit;"><%= dt_detail.Rows[i][3].ToString()%></td>
  <td class=xl66 x:num style="mso-number-format:'<%= p_xls_ccy_format_book %>';white-space:nowrap;mso-text-control:shrinktofit;"><%= dt_detail.Rows[i][4].ToString()%></td>
  <td class=xl67 x:num style="mso-number-format:'<%= p_xls_ccy_format_trans %>'; border-bottom:.5pt hairline windowtext;white-space:nowrap;mso-text-control:shrinktofit;"><%= dt_detail.Rows[i][5].ToString()%></td>
  <td class=xl66 x:num style="mso-number-format:'<%= p_xls_ccy_format_book %>';border-bottom:.5pt hairline windowtext;white-space:nowrap;mso-text-control:shrinktofit;"><%= dt_detail.Rows[i][6].ToString()%></td>
  <td class=xl68 x:num style="mso-number-format:'<%= p_xls_ccy_format_trans %>';border-bottom:.5pt hairline windowtext;white-space:nowrap;mso-text-control:shrinktofit;"><%= dt_detail.Rows[i][7].ToString()%></td>
  <td class=xl69 x:num style="mso-number-format:'<%= p_xls_ccy_format_book %>'; border-bottom:.5pt hairline windowtext;white-space:nowrap;mso-text-control:shrinktofit;"><%= dt_detail.Rows[i][8].ToString()%></td>
  <td class=xl70 x:num ><%= dt_detail.Rows[i][9].ToString()%></td>
  <td class=xl71>&nbsp;</td>
 </tr>
 <%
 }
 %>
 <% 
 
 SQL = " SELECT TO_CHAR(SUM(REC_USD),'9,999,999,990.99') REC_USD, TO_CHAR(SUM(REC_VND),'9,999,999,999,999,990')  REC_VND ,TO_CHAR(SUM(SPD_USD),'9,999,999,990.99') SPD_USD,TO_CHAR(SUM(SPD_VND),'9,999,999,999,999,990') SPD_VND FROM (SELECT " + 
        " DECODE(D.DRCR_TYPE,'C',DECODE(D.TR_CCY,'USD',D.TR_AMT,(D.TR_AMT /"+p_close_rate+" )  ),0) REC_USD, " +
        " DECODE(D.DRCR_TYPE,'C',DECODE(D.TR_CCY,'VND',D.TR_AMT,D.TR_BOOKAMT),0) REC_VND, " +
        " DECODE(D.DRCR_TYPE,'C',0,DECODE(D.TR_CCY,'USD',D.TR_AMT,(D.TR_AMT /"+p_close_rate+" ))) SPD_USD, " +
        " DECODE(D.DRCR_TYPE,'C',0,DECODE(D.TR_CCY,'VND',D.TR_AMT,D.TR_BOOKAMT)) SPD_VND "+
        " FROM TAC_BGCASH H, TAC_BGCASHD D  " +
        " WHERE H.DEL_IF = 0  " +
        " AND D.DEL_IF = 0  " +
        " and h.tr_date between '"+p_from_date+"'  and '"+p_to_date+"'  " +
        " AND H.PK = D.TAC_BGCASH_PK  " +
        " and h.tco_company_pk = " +p_company_pk+
        " AND ((PL_TYPE IS NULL) OR DECODE('"+p_common_code+"','','1',TRIM(PL_TYPE)) <> DECODE('"+p_common_code+"','','0','"+p_common_code+"')) " +
        " order by tr_date,D.pk) " ;
DataTable dt_total = ESysLib.TableReadOpen(SQL);

string p_total_recusd = "0";
string p_total_recvnd = "0";
string p_total_speusd = "0";
string p_total_spevnd = "0";
if (dt_total.Rows.Count >0)
{
	p_total_recusd = dt_total.Rows[0][0].ToString();
	p_total_recvnd = dt_total.Rows[0][1].ToString();
	p_total_speusd = dt_total.Rows[0][2].ToString();
	p_total_spevnd = dt_total.Rows[0][3].ToString();
}



 if (dt_detail.Rows.Count > 0)
 {
 %>
 <tr class=xl51 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=4 height=25 class=xl118 style='border-right:.5pt solid black;
  height:18.75pt' x:str="TOTAL ">TOTAL<span style='mso-spacerun:yes'> </span></td>
  <td class=xl88 x:num style="mso-number-format:'<%= p_xls_ccy_format_trans %>';white-space:nowrap;mso-text-control:shrinktofit;"><%= p_total_recusd %></td>
  <td class=xl89 x:num style="mso-number-format:'<%= p_xls_ccy_format_book %>';white-space:nowrap;mso-text-control:shrinktofit;"><%= p_total_recvnd%></td>
  <td class=xl88 x:num style="mso-number-format:'<%= p_xls_ccy_format_trans %>';white-space:nowrap;mso-text-control:shrinktofit;"><%= p_total_speusd %></td>
  <td class=xl89 x:num style="mso-number-format:'<%= p_xls_ccy_format_book %>';white-space:nowrap;mso-text-control:shrinktofit;"><%= p_total_spevnd %></td>
  <td class=xl88 x:num style="mso-number-format:'<%= p_xls_ccy_format_trans %>';white-space:nowrap;mso-text-control:shrinktofit;"><%= dt_detail.Rows[dt_detail.Rows.Count-1][7].ToString()%></td>
  <td class=xl89 x:num style="mso-number-format:'<%= p_xls_ccy_format_book %>';white-space:nowrap;mso-text-control:shrinktofit;"><%= dt_detail.Rows[dt_detail.Rows.Count-1][8].ToString()%></td>
  <td class=xl90>&nbsp;</td>
  <td class=xl91>&nbsp;</td>
 </tr>
 <%
 }
 else
 {
 %>
 <tr class=xl51 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=4 height=25 class=xl118 style='border-right:.5pt solid black;
  height:18.75pt' x:str="TOTAL ">TOTAL<span style='mso-spacerun:yes'> </span></td>
  <td class=xl88 x:num style="mso-number-format:'<%= p_xls_ccy_format_trans %>';white-space:nowrap;mso-text-control:shrinktofit;"><%= p_total_recusd %></td>
  <td class=xl89 x:num style="mso-number-format:'<%= p_xls_ccy_format_book %>';white-space:nowrap;mso-text-control:shrinktofit;"><%= p_total_recvnd%></td>
  <td class=xl88 x:num style="mso-number-format:'<%= p_xls_ccy_format_trans %>';white-space:nowrap;mso-text-control:shrinktofit;"><%= p_total_speusd %></td>
  <td class=xl89 x:num style="mso-number-format:'<%= p_xls_ccy_format_book %>';white-space:nowrap;mso-text-control:shrinktofit;"><%= p_total_spevnd %></td>
  <td class=xl88 x:num style="mso-number-format:'<%= p_xls_ccy_format_trans %>';">0</td>
  <td class=xl89 x:num style="mso-number-format:'<%= p_xls_ccy_format_book %>';">0</td>
  <td class=xl90>&nbsp;</td>
  <td class=xl91>&nbsp;</td>
 </tr>
 <%
 }
 %>
 <tr class=xl51 height=46 style='mso-height-source:userset;height:34.5pt'>
  <td height=46 class=xl92 style='height:34.5pt'>&nbsp;</td>
  <td class=xl93>&nbsp;</td>
  <td class=xl93>&nbsp;</td>
  <td class=xl93>&nbsp;</td>
  <td class=xl94>&nbsp;</td>
  <td class=xl95>&nbsp;</td>
  <td class=xl96>&nbsp;</td>
  <td class=xl56 width=105 style='width:79pt'>Cash : <br>
    Bank :<br>
    <font class="font27">Total:</font></td>
  <td class=xl56 width=91 style='width:68pt'><%= p_usd4%><br>
    <%= p_usd5%><font class="font27"><br>
    <%= p_usd6%></font></td>
  <td class=xl56 width=100 style='width:75pt'><%=p_vnd4%><br>
    <%=p_vnd5%><br>
    <font class="font27"><%=p_vnd6%></font></td>
  <td class=xl58 x:num><%= p_close_rate %></td>
  <td class=xl59>&nbsp;</td>
 </tr>
 <tr class=xl51 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=12 height=24 class=xl121 style='border-right:.5pt solid black;
  height:18.0pt'>2/ Employee Status</td>
 </tr>
 <tr class=xl60 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=3 height=24 class=xl124 style='border-right:.5pt solid black;
  height:18.0pt'>&nbsp;</td>
  <td class=xl99 x:str="Koreamen"><span
  style='mso-spacerun:yes'> </span>Koreamen<span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=2 class=xl128 style='border-right:.5pt solid black;border-left:
  none' x:str="Plant's Staff"><span style='mso-spacerun:yes'> </span>Plant's
  Staff<span style='mso-spacerun:yes'> </span></td>
  <td colspan=2 class=xl130 style='border-right:.5pt solid black;border-left:
  none' x:str=" Office's staff"><span style='mso-spacerun:yes'> 
  </span>Office's staff<span style='mso-spacerun:yes'> </span></td>
  <td class=xl100>&nbsp;</td>
  <td colspan=3 class=xl128 style='border-right:.5pt solid black' x:str="TOTAL"><span
  style='mso-spacerun:yes'> </span>TOTAL<span style='mso-spacerun:yes'> </span></td>
 </tr>
 <tr class=xl51 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=3 height=24 class=xl131 style='border-right:.5pt solid black;
  height:18.0pt'>&nbsp;</td>
  <td class=xl98 x:num></td>
  <td colspan=2 class=xl131 style='border-right:.5pt solid black;border-left:
  none' x:num></td>
  <td colspan=2 class=xl136 style='border-right:.5pt solid black;border-left:
  none' x:num></td>
  <td class=xl97>&nbsp;</td>
  <td colspan=3 class=xl138 style='border-right:.5pt solid black' x:num
  ></td>
 </tr>
 <tr class=xl51 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=4 height=24 class=xl121 style='border-right:.5pt solid black;
  height:18.0pt'>Prepared by: Ms. TUYEN</td>
  <td class=xl101><u style='visibility:hidden;mso-ignore:visibility'>&nbsp;</u></td>
  <td colspan=7 class=xl121 style='border-right:.5pt solid black'>Checked by:
  Mr. CHO SUNG JUN</td>
 </tr>
 <tr class=xl51 height=67 style='mso-height-source:userset;height:50.25pt'>
  <td colspan=4 height=67 class=xl140 style='border-right:.5pt solid black;
  height:50.25pt'></td>
  <td class=xl102>&nbsp;</td>
  <td colspan=7 class=xl140 style='border-right:.5pt solid black'>&nbsp;</td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=28 style='width:21pt'></td>
  <td width=65 style='width:49pt'></td>
  <td width=56 style='width:42pt'></td>
  <td width=331 style='width:248pt'></td>
  <td width=96 style='width:72pt'></td>
  <td width=114 style='width:86pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=105 style='width:79pt'></td>
  <td width=91 style='width:68pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=44 style='width:33pt'></td>
  <td width=54 style='width:41pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
