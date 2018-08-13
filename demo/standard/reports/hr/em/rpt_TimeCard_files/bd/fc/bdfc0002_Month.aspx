<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%
    ESysLib.SetUser("acnt");
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

string p_income_usd ="";
string p_income_vnd ="";
string p_spend_usd ="";
string p_spend_vnd ="";

string p_acc_cash_vnd_arr = "";
string p_acc_cash_usd_arr = "";
string p_acc_bank_vnd_arr = "";
string p_acc_bank_usd_arr = "";
    
string SQL_1;
string p_open_usd ="";
string p_open_vnd = "";
	
string p_tmp1 ="";
string p_tmp2 = "";
string p_tmp3 = "";
string p_tmp4 = "";

int i,j,k;
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
SQL_1 = " SELECT TO_CHAR(sf_get_cashddbal(" + p_company_pk + ",'" + p_from_date + "'," + p_acc_cash_usd_arr + ",'','TRANS'),'9,999,999,990.99') ,";
SQL_1 = SQL_1 + " TO_CHAR(sf_get_cashddbal(" + p_company_pk + ",'" + p_from_date + "'," + p_acc_cash_vnd_arr + ",'','TRANS'),'9,999,999,990') ";
SQL_1 = SQL_1 + " FROM DUAL ";

DataTable dt_openbal = ESysLib.TableReadOpen(SQL_1);
p_open_usd = dt_openbal.Rows[0][0].ToString();
p_open_vnd = dt_openbal.Rows[0][1].ToString();
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="monthly_files/filelist.xml">
<link rel=Edit-Time-Data href="monthly_files/editdata.mso">
<link rel=OLE-Object-Data href="monthly_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Administrator</o:Author>
  <o:LastAuthor>Administrator</o:LastAuthor>
  <o:LastPrinted>2008-07-22T07:23:35Z</o:LastPrinted>
  <o:Created>2008-07-22T07:14:07Z</o:Created>
  <o:LastSaved>2008-07-22T08:12:51Z</o:LastSaved>
  <o:Company>vinagenuwin</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.38in 0in .28in 0in;
	mso-header-margin:.21in;
	mso-footer-margin:.15in;
	mso-horizontal-page-align:center;}
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
.xl24
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl26
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;}
.xl27
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl29
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl30
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl31
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	vertical-align:middle;}
.xl32
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	vertical-align:middle;}
.xl33
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl34
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl35
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl37
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl38
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl39
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl40
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl41
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl42
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl43
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl44
	{mso-style-parent:style0;
	font-size:9.0pt;
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
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl46
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl47
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl48
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl49
	{mso-style-parent:style16;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl50
	{mso-style-parent:style16;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl51
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl52
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl53
	{mso-style-parent:style16;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl54
	{mso-style-parent:style16;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl55
	{mso-style-parent:style0;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00\;\[Red\]\#\,\#\#0\.00";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl56
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	vertical-align:middle;}
.xl57
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl58
	{mso-style-parent:style16;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl59
	{mso-style-parent:style16;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl60
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00\;\[Red\]\#\,\#\#0\.00";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl61
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl62
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl63
	{mso-style-parent:style16;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl64
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl65
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl66
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl67
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl68
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:left;
	vertical-align:middle;}
.xl69
	{mso-style-parent:style16;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;}
.xl70
	{mso-style-parent:style16;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;}
.xl71
	{mso-style-parent:style16;
	font-size:14.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"mmmm\\ d\\\,\\ yyyy";
	text-align:center;
	vertical-align:middle;}
.xl72
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl73
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;}
.xl74
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl79
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;}
.xl80
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl81
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl82
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;}
.xl83
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl84
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl85
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl86
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl90
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl91
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Monthly</x:Name>
    <x:WorksheetOptions>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>89</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>7</x:SplitHorizontal>
     <x:TopRowBottomPane>7</x:TopRowBottomPane>
     <x:SplitVertical>1</x:SplitVertical>
     <x:LeftColumnRightPane>1</x:LeftColumnRightPane>
     <x:ActivePane>0</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>1</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>0</x:Number>
       <x:ActiveCol>4</x:ActiveCol>
       <x:RangeSelection>$E$8:$E$11</x:RangeSelection>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>8445</x:WindowHeight>
  <x:WindowWidth>15240</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>15</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:SupBook>
  <x:Path>D:\Form Design\new system\Cash Books\Suheung report-M07 - 2008.xls</x:Path>
  <x:SheetName>02</x:SheetName>
  <x:SheetName>02n</x:SheetName>
  <x:SheetName>04</x:SheetName>
  <x:SheetName>04n</x:SheetName>
  <x:SheetName>31n1</x:SheetName>
  <x:SheetName>all report</x:SheetName>
  <x:SheetName>monthly</x:SheetName>
  <x:SheetName>statement</x:SheetName>
  <x:SheetName>Sheet1</x:SheetName>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>0</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>1</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>2</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>3</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>4</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>5</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>6</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>7</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>8</x:SheetIndex>
  </x:Xct>
 </x:SupBook>
 <x:ExcelName>
  <x:Name>_FilterDatabase</x:Name>
  <x:Hidden/>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Monthly!$A$7:$H$7</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Monthly!$6:$7</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1025"/>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=833 style='border-collapse:
 collapse;table-layout:fixed;width:626pt'>
 <col class=xl24 width=86 style='mso-width-source:userset;mso-width-alt:3145;
 width:65pt'>
 <col class=xl24 width=35 style='mso-width-source:userset;mso-width-alt:1280;
 width:26pt'>
 <col class=xl25 width=54 style='mso-width-source:userset;mso-width-alt:1974;
 width:41pt'>
 <col class=xl24 width=307 style='mso-width-source:userset;mso-width-alt:11227;
 width:230pt'>
 <col class=xl26 width=110 style='mso-width-source:userset;mso-width-alt:4022;
 width:83pt'>
 <col class=xl26 width=106 style='mso-width-source:userset;mso-width-alt:3876;
 width:80pt'>
 <col class=xl24 width=71 style='mso-width-source:userset;mso-width-alt:2596;
 width:53pt'>
 <col class=xl24 width=64 style='width:48pt'>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=7 rowspan=2 height=46 class=xl69 width=769 style='height:34.5pt;
  width:578pt' x:str="MONTHLY FINANCIAL SUMMARY REPORT">MONTHLY FINANCIAL SUMMARY REPORT</td>
  <td class=xl27 width=64 style='width:48pt'></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl27 style='height:18.0pt'></td>
 </tr>
 <tr height=38 style='mso-height-source:userset;height:28.5pt'>
  <td colspan=7 height=38 class=xl70 style='height:28.5pt'
  x:str><%= p_company_name %></td>
  <td class=xl27></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=7 height=24 class=xl71 style='height:18.0pt'><%= p_rpt_date2 %></td>
  <td class=xl28></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=2 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td class=xl30></td>
  <td class=xl29></td>
  <td colspan=2 class=xl31 style='mso-ignore:colspan'></td>
  <td class=xl32></td>
  <td class=xl28></td>
 </tr>
 <tr class=xl33 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td rowspan=2 height=50 class=xl72 style='border-bottom:.5pt solid black;
  height:37.5pt'>&nbsp;</td>
  <td rowspan=2 class=xl72 style='border-bottom:.5pt solid black'>NO.</td>
  <td rowspan=2 class=xl74 width=54 style='border-bottom:.5pt solid black;
  width:41pt'>CODE <br>
    NO.</td>
  <td rowspan=2 class=xl72 style='border-bottom:.5pt solid black'>DESCRIPTION</td>
  <td colspan=2 class=xl76 width=216 style='border-right:.5pt solid black;
  border-left:none;width:163pt'>AMOUNT</td>
  <td rowspan=2 class=xl78 style='border-bottom:.5pt solid black'>REMARK</td>
  <td class=xl34></td>
 </tr>
 <tr class=xl33 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl35 width=110 style='height:18.75pt;width:83pt'>USD</td>
  <td class=xl35 width=106 style='width:80pt' id="_x0000_s1030">VND</td>
  <td class=xl34 id="_x0000_s1032"></td>
 </tr>
 <%
SQL	= "SELECT TO_CHAR(SUM(DECODE(TR_CCY,'VND',0,D.TR_AMT)),'9,999,999,990.99') REC_USD, " + 
        " TO_CHAR(SUM(DECODE(TR_CCY,'VND',D.TR_AMT,0)),'9,999,999,990') REC_VND " +
        " FROM TAC_BGCASH H, TAC_BGCASHD D  " +
        " WHERE H.DEL_IF = 0  " +
        " AND h.tr_date between '"+p_from_date+"'  and '"+p_to_date+"' " +
        " AND D.DEL_IF = 0 " +
        " AND H.PK = D.TAC_BGCASH_PK " +
        " and h.tco_company_pk = " + p_company_pk+
        " and h.tac_abacctcode_pk IN  ("+p_acc_cash_vnd_arr+","+p_acc_cash_usd_arr+","+p_acc_bank_vnd_arr+","+p_acc_bank_usd_arr+") " +
        " AND DRCR_TYPE = 'C' ";
		
		DataTable dt_sum = ESysLib.TableReadOpen(SQL);
		p_income_usd = dt_sum.Rows[0][0].ToString();
		p_income_vnd = dt_sum.Rows[0][1].ToString();
 
SQL	= "SELECT TO_CHAR(DECODE(TR_CCY,'VND',0,D.TR_AMT),'9,999,999,990.99') REC_USD, " + 
        " TO_CHAR(DECODE(TR_CCY,'VND',D.TR_AMT,0),'9,999,999,990') REC_VND " +
		" , D.REMARK,D.PL_TYPE " +
        " FROM TAC_BGCASH H, TAC_BGCASHD D  " +
        " WHERE H.DEL_IF = 0  " +
        " AND h.tr_date between '"+p_from_date+"'  and '"+p_to_date+"' " +
        " AND D.DEL_IF = 0 " +
        " AND H.PK = D.TAC_BGCASH_PK " +
        " and h.tco_company_pk = " + p_company_pk+
        " and h.tac_abacctcode_pk IN  ("+p_acc_cash_vnd_arr+","+p_acc_cash_usd_arr+","+p_acc_bank_vnd_arr+","+p_acc_bank_usd_arr+") " +
        " AND DRCR_TYPE = 'C' " +
        " order by d.PL_TYPE,tr_date,D.pk " ;
	
	DataTable dt_detail = ESysLib.TableReadOpen(SQL);

	if (dt_detail.Rows.Count==0)
	{
	%>
<tr class=xl33 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td class=xl81 style='border-bottom:.5pt solid black;
  height:77.25pt;border-top:none' >I. INCOME</td>
  <td class=xl36 x:num></td>
  <td class=xl37>&nbsp;</td>
  <td class=xl38 width=307 style='width:230pt'> </td>
  <td class=xl39 x:num ></td>
  <td class=xl40 x:num ></td>
  <td class=xl41>&nbsp;</td>
  <td class=xl34></td>
 </tr>
	
	<%
	}
	else
	{
    for(i=0;i<dt_detail.Rows.Count;i++)
	{
		if (i==0)
		{
 %>
 <tr class=xl33  style='mso-height-source:userset'>
  <td rowspan=<%=(dt_detail.Rows.Count+1)%> class=xl81 style='border-bottom:.5pt solid black;border-top:none' >I. INCOME</td>
  <td class=xl36 x:num>1</td>
  <td class=xl37><%= dt_detail.Rows[i][3].ToString() %></td>
  <td class=xl38 style='white-space:normal;'> <%= dt_detail.Rows[i][2].ToString() %></td>
  <td class=xl39 x:num > <%= dt_detail.Rows[i][0].ToString() %></td>
  <td class=xl40 x:num > <%= dt_detail.Rows[i][1].ToString() %></td>
  <td class=xl41>&nbsp;</td>
  <td class=xl34></td>
 </tr>
 <%
		}
		else
		{
%>
 <tr class=xl33 >
  <td class=xl36  x:num><%= (i+1)%></td>
  <td class=xl37><%= dt_detail.Rows[i][3].ToString() %></td>
  <td class=xl42 style='white-space:normal;'><%= dt_detail.Rows[i][2].ToString() %></td>
  <td class=xl39 x:num ><%= dt_detail.Rows[i][0].ToString() %></td>
  <td class=xl40 x:num ><%= dt_detail.Rows[i][1].ToString() %></td>
  <td class=xl41>&nbsp;</td>
  <td class=xl34></td>
 </tr>
<%
		}//if i==0
	}//for
	}//if rows.count >0
%>
 <tr class=xl33 height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=3 height=28 class=xl84 style='border-right:.5pt solid black;
  height:21.0pt;border-left:none'>Total ( I ) :</td>
  <td class=xl49 style=';white-space:nowrap;mso-text-control:shrinktofit;' x:num><%=p_income_usd %></td>
  <td class=xl50 style=';white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= p_income_vnd %></td>
  <td class=xl48>&nbsp;</td>
  <td class=xl34></td>
 </tr>
 <%
 SQL	= "SELECT TO_CHAR(SUM(DECODE(TR_CCY,'VND',0,D.TR_AMT)),'9,999,999,990.99') REC_USD, " + 
        " TO_CHAR(SUM(DECODE(TR_CCY,'VND',D.TR_AMT,0)),'9,999,999,990') REC_VND " +
        " FROM TAC_BGCASH H, TAC_BGCASHD D  " +
        " WHERE H.DEL_IF = 0  " +
        " AND h.tr_date between '"+p_from_date+"'  and '"+p_to_date+"' " +
        " AND D.DEL_IF = 0 " +
        " AND H.PK = D.TAC_BGCASH_PK " +
        " and h.tco_company_pk = " + p_company_pk+
        " and h.tac_abacctcode_pk IN  ("+p_acc_cash_vnd_arr+","+p_acc_cash_usd_arr+","+p_acc_bank_vnd_arr+","+p_acc_bank_usd_arr+") " +
        " AND DRCR_TYPE = 'D' ";
		dt_sum = ESysLib.TableReadOpen(SQL);
		p_spend_usd = dt_sum.Rows[0][0].ToString();
		p_spend_vnd = dt_sum.Rows[0][1].ToString();
 
SQL	= "SELECT TO_CHAR(DECODE(TR_CCY,'VND',0,D.TR_AMT),'9,999,999,990.99') REC_USD, " + 
        " TO_CHAR(DECODE(TR_CCY,'VND',D.TR_AMT,0),'9,999,999,990') REC_VND " +
		" , D.REMARK,d.PL_TYPE " +
        " FROM TAC_BGCASH H, TAC_BGCASHD D  " +
        " WHERE H.DEL_IF = 0  " +
        " AND h.tr_date between '"+p_from_date+"'  and '"+p_to_date+"' " +
        " AND D.DEL_IF = 0 " +
        " AND H.PK = D.TAC_BGCASH_PK " +
        " and h.tco_company_pk = " + p_company_pk+
        " and h.tac_abacctcode_pk IN  ("+p_acc_cash_vnd_arr+","+p_acc_cash_usd_arr+","+p_acc_bank_vnd_arr+","+p_acc_bank_usd_arr+") " +
        " AND DRCR_TYPE = 'D' " +
        " order by d.PL_TYPE,tr_date,D.pk " ;
	
	dt_detail = ESysLib.TableReadOpen(SQL);

	if (dt_detail.Rows.Count==0)
	{
	%>
 <tr class=xl51 height=23 style='mso-height-source:userset;height:17.25pt'>
  <td class=xl87 width=86 style='border-bottom:.5pt solid black;
  height:534.75pt;border-top:none;width:65pt'><br>
    II.SPENDING</td>
  <td class=xl36>-</td>
  <td class=xl52></td>
  <td class=xl42></td>
  <td class=xl53></td>
  <td class=xl54></td>
  <td class=xl55>&nbsp;</td>
  <td class=xl56></td>
 </tr>
 	<%
	}
	else
	{
    for(i=0;i<dt_detail.Rows.Count;i++)
	{
		if (i==0)
		{
 %>
  <tr class=xl51 height=23 style='mso-height-source:userset;height:17.25pt'>
  <td rowspan=<%=(dt_detail.Rows.Count+1)%> class=xl87 width=86 style='border-bottom:.5pt solid black;
  height:534.75pt;border-top:none;width:65pt'><br>
    II.SPENDING</td>
  <td class=xl36 x:num>1</td>
  <td class=xl52><%= dt_detail.Rows[i][3].ToString() %></td>
  <td class=xl42 style='white-space:normal;'><%= dt_detail.Rows[i][2].ToString() %></td>
  <td class=xl53 x:num><%= dt_detail.Rows[i][0].ToString() %></td>
  <td class=xl54 align=right x:num><%= dt_detail.Rows[i][1].ToString() %></td>
  <td class=xl55>&nbsp;</td>
  <td class=xl56></td>
 </tr>
		<%
		}
		else
		{
		%>
 <tr class=xl51 style='mso-height-source:userset;'>
  <td class=xl36 x:num><%= (i+1)%></td>
  <td class=xl52 ><%= dt_detail.Rows[i][3].ToString() %></td>
  <td class=xl42 style='white-space:normal;'><%= dt_detail.Rows[i][2].ToString() %></td>
  <td class=xl53 x:num><%= dt_detail.Rows[i][0].ToString() %></td>
  <td class=xl54 x:num><%= dt_detail.Rows[i][1].ToString() %></td>
  <td class=xl55>&nbsp;</td>
  <td class=xl56></td>
 </tr>
 <%
		}
	}//for
	}//if
 %>
 
 <tr class=xl51 height=23 style='mso-height-source:userset;height:17.25pt'>
  <td colspan=3 height=23 class=xl84 style='border-right:.5pt solid black;
  height:17.25pt;border-left:none'>Total ( II ) :</td>
  <td class=xl61 x:num ><%= p_spend_usd %></td>
  <td class=xl62 x:num ><%= p_spend_vnd %></td>
  <td class=xl63>&nbsp;</td>
  <td class=xl56></td>
 </tr>
 <tr class=xl51 height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=4 height=28 class=xl89 style='border-right:.5pt solid black;
  height:21.0pt'>A balance carries forward from the next account</td>
  <td class=xl61 x:num></td>
  <td class=xl62>&nbsp;</td>
  <td class=xl63>&nbsp;</td>
  <td class=xl56></td>
 </tr>
 <tr class=xl64 height=33 style='mso-height-source:userset;height:24.95pt'>
  <td height=33 class=xl65 colspan=6 style='height:24.95pt;mso-ignore:colspan'>Prepared
  by : Ms. Tuyen<span
  style='mso-spacerun:yes'>                                                                          
  </span>Checked by : Mr.Cho Sung Jun</td>
  <td class=xl64></td>
  <td class=xl66></td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.95pt'>
  <td height=33 colspan=2 class=xl34 style='height:24.95pt;mso-ignore:colspan'></td>
  <td class=xl30></td>
  <td class=xl67></td>
  <td colspan=3 class=xl56 style='mso-ignore:colspan'></td>
  <td class=xl28></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 colspan=2 class=xl34 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl30></td>
  <td class=xl68></td>
  <td colspan=3 class=xl56 style='mso-ignore:colspan'></td>
  <td class=xl28></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 colspan=2 class=xl34 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl30></td>
  <td class=xl67></td>
  <td colspan=3 class=xl56 style='mso-ignore:colspan'></td>
  <td class=xl28></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 colspan=2 class=xl24 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl25></td>
  <td class=xl24></td>
  <td colspan=2 class=xl26 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 colspan=2 class=xl24 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl25></td>
  <td class=xl24></td>
  <td colspan=2 class=xl26 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 colspan=2 class=xl24 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl25></td>
  <td class=xl24></td>
  <td colspan=2 class=xl26 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 colspan=2 class=xl24 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl25></td>
  <td class=xl24></td>
  <td colspan=2 class=xl26 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 colspan=2 class=xl24 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl25></td>
  <td class=xl24></td>
  <td colspan=2 class=xl26 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=86 style='width:65pt'></td>
  <td width=35 style='width:26pt'></td>
  <td width=54 style='width:41pt'></td>
  <td width=307 style='width:230pt'></td>
  <td width=110 style='width:83pt'></td>
  <td width=106 style='width:80pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
