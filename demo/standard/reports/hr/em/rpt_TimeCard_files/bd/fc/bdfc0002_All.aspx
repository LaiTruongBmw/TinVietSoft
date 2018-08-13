<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%
    ESysLib.SetUser("acnt");
    Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
	
	//Neu tien book la USD, thi report nay chua the hien duoc -->sua decode general
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
string p_common_code = "";//A_COM

int i,j,k;
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
string p_acc_cash_vnd_arr = "";
string p_acc_cash_usd_arr = "";
string p_acc_bank_vnd_arr = "";
string p_acc_bank_usd_arr = "";
    

string p_tmp1 ="";
string p_tmp2 = "";
string p_tmp3 = "";
string p_tmp4 = "";
    
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
string SQL_1;
string p_open_usd ="";
string p_open_vnd = "";

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
<link rel=File-List href="bdfc0002_Month_files/filelist.xml">
<link rel=Edit-Time-Data href="bdfc0002_Month_files/editdata.mso">
<link rel=OLE-Object-Data href="bdfc0002_Month_files/oledata.mso">
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
  <o:LastPrinted>2008-07-18T08:01:55Z</o:LastPrinted>
  <o:Created>2008-07-18T07:45:36Z</o:Created>
  <o:LastSaved>2008-07-18T08:15:06Z</o:LastSaved>
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
	margin:.34in 0in .17in 0in;
	mso-header-margin:.25in;
	mso-footer-margin:.16in;
	mso-page-orientation:landscape;
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
	font-size:18.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl25
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl26
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl30
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
.xl31
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
.xl32
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl33
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
.xl34
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[ENG\]\[$-409\]dd\\-mmm\\-yy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl35
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
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl36
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
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl37
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
.xl38
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
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl39
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
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl40
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
.xl41
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
	border-left:none;
	white-space:normal;}
.xl42
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
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl43
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl44
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl45
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl46
	{mso-style-parent:style16;
	color:red;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl47
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[ENG\]\[$-409\]dd\\-mmm\\-yy\;\@";
	text-align:center;
	vertical-align:middle;}
.xl48
	{mso-style-parent:style16;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;}
.xl49
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;}
.xl50
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[ENG\]\[$-409\]dd\\-mmm\\-yy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl51
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[ENG\]\[$-409\]dd\\-mmm\\-yy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl52
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl53
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl54
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.0\;\[Red\]\#\,\#\#0\.0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl55
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl56
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[ENG\]\[$-409\]dd\\-mmm\\-yy\;\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl57
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl58
	{mso-style-parent:style16;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl59
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl60
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl61
	{mso-style-parent:style16;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl62
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl63
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl64
	{mso-style-parent:style16;
	color:red;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl65
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl66
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl67
	{mso-style-parent:style16;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl71
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl72
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl73
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl74
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl75
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl77
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl79
	{mso-style-parent:style16;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
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
	color:black;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl89
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl93
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border:.5pt solid windowtext;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl95
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl98
	{mso-style-parent:style16;
	color:black;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl99
	{mso-style-parent:style16;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl100
	{mso-style-parent:style16;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl101
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl102
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl103
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl105
	{mso-style-parent:style16;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl106
	{mso-style-parent:style16;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl107
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl108
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl109
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl110
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl111
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl112
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl113
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;}
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
      <x:Scale>90</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>1200</x:VerticalResolution>
     </x:Print>
     <x:Zoom>95</x:Zoom>
     <x:Selected/>
     <x:LeftColumnVisible>3</x:LeftColumnVisible>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>5</x:SplitHorizontal>
     <x:TopRowBottomPane>5</x:TopRowBottomPane>
     <x:ActivePane>2</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
       <x:ActiveRow>4</x:ActiveRow>
       <x:ActiveCol>6</x:ActiveCol>
       <x:RangeSelection>$G$5:$H$5</x:RangeSelection>
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
 <x:ExcelName>
  <x:Name>_FilterDatabase</x:Name>
  <x:Hidden/>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>='all report'!$A$5:$L$8</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>='all report'!$5:$6</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1034"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl25>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1515 style='border-collapse:
 collapse;table-layout:fixed;width:1138pt'>
 <col class=xl25 width=24 style='mso-width-source:userset;mso-width-alt:877;
 width:18pt'>
 <col class=xl47 width=62 style='mso-width-source:userset;mso-width-alt:2267;
 width:47pt'>
 <col class=xl47 width=56 style='mso-width-source:userset;mso-width-alt:2048;
 width:42pt'>
 <col class=xl25 width=348 style='mso-width-source:userset;mso-width-alt:12726;
 width:261pt'>
 <col class=xl25 width=89 span=2 style='mso-width-source:userset;mso-width-alt:
 3254;width:67pt'>
 <col class=xl48 width=89 span=2 style='mso-width-source:userset;mso-width-alt:
 3254;width:67pt'>
 <col class=xl48 width=89 span=2 style='mso-width-source:userset;mso-width-alt:
 3254;width:67pt'>
 <col class=xl49 width=59 style='mso-width-source:userset;mso-width-alt:2157;
 width:44pt'>
 <col class=xl25 width=48 style='mso-width-source:userset;mso-width-alt:1755;
 width:36pt'>
 <col class=xl25 width=64 span=6 style='width:48pt'>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td colspan=12 height=32 class=xl24 width=1131 style='height:24.0pt;
  width:850pt'><span style='mso-spacerun:yes'> </span>FINANCIAL REPORT IN <%= p_rpt_date %></td>
  <td class=xl25 width=64 style='width:48pt'></td>
  <td class=xl25 width=64 style='width:48pt'></td>
  <td class=xl25 width=64 style='width:48pt'></td>
  <td class=xl25 width=64 style='width:48pt'></td>
  <td class=xl25 width=64 style='width:48pt'></td>
  <td class=xl25 width=64 style='width:48pt'></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td colspan=12 height=23 class=xl26 style='height:17.25pt'
  x:str >EXPENSE OF <%= p_company_name %><span style='mso-spacerun:yes'> </span></td>
  <td colspan=6 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=12 height=24 class=xl27 style='height:18.0pt'>1/ Financial status</td>
  <td colspan=6 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=6 class=xl29 style='height:18.0pt;mso-ignore:colspan'></td>
  <td class=xl30></td>
  <td class=xl54>&nbsp;</td>
  <td class=xl31>Reported date : <%= p_rpt_date2  %></td>
  <td class=xl28></td>
  <td class=xl32></td>
  <td class=xl31>&nbsp;</td>
  <td colspan=6 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=60 style='mso-height-source:userset;height:45.0pt'>
  <td height=60 class=xl33 id="_x0000_s1025" x:autofilter="all"
  x:autofilterrange="$A$5:$L$8" style='height:45.0pt'>NO</td>
  <td class=xl34 id="_x0000_s1026" x:autofilter="all" style='border-left:none'>DATE</td>
  <td class=xl35 id="_x0000_s1027" x:autofilter="all" width=56
  style='border-left:none;width:42pt'>CODE<br>
    NO.</td>
  <td class=xl36 id="_x0000_s1028" x:autofilter="all" width=348
  style='border-left:none;width:261pt'>CONTENT</td>
  <td colspan=2 class=xl37 id="_x0000_s1029" x:autofilter="all" width=178
  style='border-right:.5pt solid black;border-left:none;width:134pt'>RECEIVING</td>
  <td colspan=2 class=xl39 id="_x0000_s1031" x:autofilter="all"
  style='border-left:none' x:str="SPENDING"><span
  style='mso-spacerun:yes'> </span>SPENDING<span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=2 class=xl40 id="_x0000_s1033" x:autofilter="all" width=178
  style='border-right:.5pt solid black;border-left:none;width:134pt'
  x:str="BALANCE "><span style='mso-spacerun:yes'> </span>BALANCE<span
  style='mso-spacerun:yes'>  </span></td>
  <td class=xl42 x:autofilter="all" width=59 style='border-left:none;
  width:44pt' x:str="Exchange &#10;Rate VND/USD"><span
  style='mso-spacerun:yes'> </span>Exchange <br>
    Rate VND/USD<span style='mso-spacerun:yes'> </span></td>
  <td class=xl43 x:autofilter="all" style='border-top:none;border-left:none'>Remark</td>
  <td colspan=6 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl25 height=22 style='mso-height-source:userset;height:16.5pt'>
      <td colspan=4 height=22 class=xl44 width=490 style='height:16.5pt;width:368pt'></td>
      <td class=xl45 width=89 style='border-top:none;border-left:none;width:67pt'
      x:str="USD"><span style='mso-spacerun:yes'> </span>USD<span
      style='mso-spacerun:yes'> </span></td>
      <td class=xl45 width=89 style='border-top:none;border-left:none;width:67pt'
      x:str="VND"><span style='mso-spacerun:yes'> </span>VND<span
      style='mso-spacerun:yes'> </span></td>
      <td class=xl45 width=89 style='border-left:none;width:67pt' x:str="USD"><span
      style='mso-spacerun:yes'> </span>USD<span style='mso-spacerun:yes'> </span></td>
      <td class=xl45 width=89 style='border-left:none;width:67pt' x:str="VND"><span
      style='mso-spacerun:yes'> </span>VND<span style='mso-spacerun:yes'> </span></td>
      <td class=xl45 width=89 style='border-top:none;border-left:none;width:67pt'
      x:str="USD"><span style='mso-spacerun:yes'> </span>USD<span
      style='mso-spacerun:yes'> </span></td>
      <td class=xl45 width=89 style='border-top:none;border-left:none;width:67pt'
      x:str="VND"><span style='mso-spacerun:yes'> </span>VND<span
      style='mso-spacerun:yes'> </span></td>
      <td class=xl95 width=59 style='border-left:none;width:44pt'>&nbsp;</td>
      <td class=xl46 width=48 style='border-top:none;border-left:none;width:36pt'>&nbsp;</td>
      <td colspan=6 class=xl25 style='mso-ignore:colspan'></td>
     </tr>
 <tr class=xl25 height=47 style='mso-height-source:userset;height:35.25pt'>
  <td height=47 class=xl55  style='height:35.25pt;border-top:none;text-align:left;'
  colspan="3" ><b>&nbsp;&nbsp;CASH ON HAND</b></td>
  <td class=xl44 width=348 style='border-top:none;border-left:none;width:261pt'>A
  balance carried forward from the last account</td>
  <td class=xl92 width=89 style='border-top:none;border-left:none;width:67pt'>&nbsp;</td>
  <td class=xl89 width=89 style='border-top:none;border-left:none;width:67pt'>&nbsp;</td>
  <td class=xl93 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl90 width=89 style='border-top:none;border-left:none;width:67pt'>&nbsp;</td>
  <td class=xl94 width=89 style='border-top:none;border-left:none;width:67pt' x:num><%= p_open_usd %></td>
  <td class=xl91 width=89 style='border-top:none;border-left:none;width:67pt' x:num><%= p_open_vnd %></td>
  <td class=xl113 style='border-top:none;border-left:none' x:num></td>
  <td class=xl58 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=6 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
<%
SQL_1 = " SELECT  ";
    SQL_1 = SQL_1 + " DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',D.TR_AMT,0)) REC_USD ";
    SQL_1 = SQL_1 + " ,DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',D.TR_AMT,0),0) REC_VND ";
    SQL_1 = SQL_1 + " ,DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',0,D.TR_AMT)) SPE_USD";
    SQL_1 = SQL_1 + " ,DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',0,D.TR_AMT),0)  SPE_VND ";
    SQL_1 = SQL_1 + " ,d.pk, to_char(to_date(h.tr_date,'YYYYMMDD'),'dd-Mon-yy') DSP_DATE, d.remark, d.TR_EXRATE, d.PL_TYPE ";
    SQL_1 = SQL_1 + " ,TO_CHAR(DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',D.TR_AMT,0)),'9,999,999,990.99') REC_USD ";
    SQL_1 = SQL_1 + " ,TO_CHAR(DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',D.TR_AMT,0),0),'9,999,999,990') REC_VND ";
    SQL_1 = SQL_1 + " ,TO_CHAR(DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',0,D.TR_AMT)),'9,999,999,990.99') SPE_USD";
    SQL_1 = SQL_1 + " ,TO_CHAR(DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',0,D.TR_AMT),0),'9,999,999,990')  SPE_VND ";
    SQL_1 = SQL_1 + " , TO_CHAR((TO_NUMBER('"+p_open_usd+"','9,999,999,990.99')+ SUM(DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',D.TR_AMT,0)) - DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',0,D.TR_AMT)))  over (order by h.tr_date,d.pk)),'9,999,999,990.99') Bal_USD ";
    SQL_1 = SQL_1 + " , TO_CHAR((TO_NUMBER('"+p_open_vnd+"','9,999,999,990')+ SUM(DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',D.TR_AMT,0),0) - DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',0,D.TR_AMT),0))  over (order by h.tr_date,d.pk)),'9,999,999,990.99') Bal_VND "; 
    SQL_1 = SQL_1 + " FROM TAC_BGCASH H, TAC_BGCASHD D ";
    SQL_1 = SQL_1 + " WHERE H.DEL_IF = 0 ";
    SQL_1 = SQL_1 + " and h.tr_date between '"+p_from_date +"'  and '"+p_to_date+"' ";
    SQL_1 = SQL_1 + " AND D.DEL_IF = 0 ";
    SQL_1 = SQL_1 + " AND H.PK = D.TAC_BGCASH_PK ";
    SQL_1 = SQL_1 + " and h.tco_company_pk = " + p_company_pk;
	SQL_1 = SQL_1 + " AND ((PL_TYPE IS NULL) OR DECODE('"+p_common_code+"','','1',TRIM(PL_TYPE)) <> DECODE('"+p_common_code+"','','0','"+p_common_code+"')) " ;
    SQL_1 = SQL_1 + " and h.tac_abacctcode_pk IN  (" + p_acc_cash_vnd_arr + "," + p_acc_cash_usd_arr + ") ";
    SQL_1 = SQL_1 + " order by tr_date,pk ";
	
    DataTable dt_cash = ESysLib.TableReadOpen(SQL_1);
    for (i = 0; i < dt_cash.Rows.Count; i++)
    {  
%> 
 <tr class=xl25 height=40 style='height:30.0pt'>
  <td height=40 class=xl59 style='height:30.0pt;border-top:none' x:num><%= (i+1)%></td>
  <td class=xl50 width=62 style='border-left:none;width:47pt;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash.Rows[i][5].ToString()%></td>
  <td class=xl60 style='border-left:none;mso-text-control:shrinktofit;'><%= dt_cash.Rows[i][8].ToString()%></td>
  <td class=xl52 width=348 style='border-left:none;width:261pt'><%= dt_cash.Rows[i][6].ToString()%></td>
  <td class=xl96 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][9].ToString()%></td>
  <td class=xl97 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][10].ToString()%></td>
  <td class=xl98 style='border-left:none' x:num><%= dt_cash.Rows[i][11].ToString()%></td>
  <td class=xl99 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][12].ToString()%></td>
  <td class=xl100 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][13].ToString()%></td>
  <td class=xl99 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][14].ToString()%></td>
  <td class=xl101 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][7].ToString()%></td>
  <td class=xl61 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=6 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
<%
   }
    SQL_1 = " SELECT  ";
    SQL_1 = SQL_1 + " TO_CHAR(SUM(DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',D.TR_AMT,0))),'9,999,999,990.99') REC_USD ";
    SQL_1 = SQL_1 + " ,TO_CHAR(SUM(DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',D.TR_AMT,0),0)),'9,999,999,990') REC_VND ";
    SQL_1 = SQL_1 + " ,TO_CHAR(SUM(DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',0,D.TR_AMT))),'9,999,999,990.99') SPE_USD";
    SQL_1 = SQL_1 + " ,TO_CHAR(SUM(DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',0,D.TR_AMT),0)),'9,999,999,990')  SPE_VND ";
    SQL_1 = SQL_1 + " FROM TAC_BGCASH H, TAC_BGCASHD D ";
    SQL_1 = SQL_1 + " WHERE H.DEL_IF = 0 ";
    SQL_1 = SQL_1 + " and h.tr_date between '"+p_from_date +"'  and '"+p_to_date+"' ";
    SQL_1 = SQL_1 + " AND D.DEL_IF = 0 ";
    SQL_1 = SQL_1 + " AND H.PK = D.TAC_BGCASH_PK ";
    SQL_1 = SQL_1 + " and h.tco_company_pk = " + p_company_pk;
	SQL_1 = SQL_1 + "  AND ((PL_TYPE IS NULL) OR DECODE('"+p_common_code+"','','1',TRIM(PL_TYPE)) <> DECODE('"+p_common_code+"','','0','"+p_common_code+"')) " ;
    SQL_1 = SQL_1 + " and h.tac_abacctcode_pk IN  (" + p_acc_cash_vnd_arr + "," + p_acc_cash_usd_arr + ") ";

    DataTable dt_cash_total = ESysLib.TableReadOpen(SQL_1); 
    if(dt_cash.Rows.Count>0)
    { 
   %>  
 <tr class=xl25 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=4 height=25 class=xl65 style='height:18.75pt' x:str="TOTAL ">TOTAL<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl108 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash_total.Rows[0][0].ToString()%></td>
  <td class=xl109 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash_total.Rows[0][1].ToString()%></td>
  <td class=xl108 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash_total.Rows[0][2].ToString()%></td>
  <td class=xl109 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash_total.Rows[0][3].ToString()%></td>
  <td class=xl108 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash.Rows[dt_cash.Rows.Count - 1][13].ToString()%></td>
  <td class=xl109 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash.Rows[dt_cash.Rows.Count - 1][14].ToString()%></td>
  <td class=xl110 style='border-left:none'>&nbsp;</td>
  <td class=xl67 style='border-left:none'>&nbsp;</td>
  <td colspan=6 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <%
    }
    else
    {  
 %> 
  <tr class=xl25 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=4 height=25 class=xl65 style='height:18.75pt' x:str="TOTAL ">TOTAL<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl108 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash_total.Rows[0][0].ToString()%></td>
  <td class=xl109 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash_total.Rows[0][1].ToString()%></td>
  <td class=xl108 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash_total.Rows[0][2].ToString()%></td>
  <td class=xl109 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash_total.Rows[0][3].ToString()%></td>
  <td class=xl108 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash.Rows[dt_cash.Rows.Count - 1][13].ToString()%></td>
  <td class=xl109 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash.Rows[dt_cash.Rows.Count - 1][14].ToString()%></td>
  <td class=xl110 style='border-left:none'>&nbsp;</td>
  <td class=xl67 style='border-left:none'>&nbsp;</td>
  <td colspan=6 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <%
    }
	SQL_1 = "SELECT TO_CHAR((NVL (SUM (ymd_drfsum), 0) - NVL (SUM (ymd_crfsum),0)),'9,999,999,990.99') dd_amt   " +
        " FROM tac_bgcashdepoddbal " +
        " WHERE tco_company_pk =  " + p_company_pk+
        " AND std_ymd <  '" +p_from_date+"' "+
        " AND tac_abacctcode_pk in (" + p_acc_bank_vnd_arr + ")" +
        " AND del_if = 0 ";
    DataTable dt_openbal_vnd_bank = ESysLib.TableReadOpen(SQL_1);
    p_open_vnd = dt_openbal_vnd_bank.Rows[0][0].ToString();

    SQL_1 = "SELECT TO_CHAR(NVL (SUM (ymd_drfsum), 0) - NVL (SUM (ymd_crfsum),0),'9,999,999,990.99') dd_amt   " +
        " FROM tac_bgcashdepoddbal " +
        " WHERE tco_company_pk =  " + p_company_pk +
        " AND std_ymd <  '" + p_from_date + "' " +
        " AND tac_abacctcode_pk in (" + p_acc_bank_usd_arr + ")" +
        " AND del_if = 0 ";
     dt_openbal_vnd_bank = ESysLib.TableReadOpen(SQL_1);
    p_open_usd = dt_openbal_vnd_bank.Rows[0][0].ToString();  

     %> 
<tr class=xl25 height=47 style='mso-height-source:userset;height:35.25pt'>
  <td height=47 class=xl55  style='height:35.25pt;border-top:none;text-align:left;'
  colspan="3" ><b>&nbsp;&nbsp;CASH IN BANK</b></td>
  <td class=xl44 width=348 style='border-top:none;border-left:none;width:261pt'>A
  balance carried forward from the last account</td>
  <td class=xl92 width=89 style='border-top:none;border-left:none;width:67pt'>&nbsp;</td>
  <td class=xl89 width=89 style='border-top:none;border-left:none;width:67pt'>&nbsp;</td>
  <td class=xl93 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl90 width=89 style='border-top:none;border-left:none;width:67pt'>&nbsp;</td>
  <td class=xl94 width=89 style='border-top:none;border-left:none;width:67pt' x:num><%= p_open_usd %></td>
  <td class=xl91 width=89 style='border-top:none;border-left:none;width:67pt' x:num><%= p_open_vnd %></td>
  <td class=xl113 style='border-top:none;border-left:none' x:num></td>
  <td class=xl58 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=6 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <%
    SQL_1 = " SELECT  ";
    SQL_1 = SQL_1 + " DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',D.TR_AMT,0)) REC_USD ";
    SQL_1 = SQL_1 + " ,DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',D.TR_AMT,0),0) REC_VND ";
    SQL_1 = SQL_1 + " ,DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',0,D.TR_AMT)) SPE_USD";
    SQL_1 = SQL_1 + " ,DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',0,D.TR_AMT),0)  SPE_VND ";
    SQL_1 = SQL_1 + " ,d.pk, to_char(to_date(h.tr_date,'YYYYMMDD'),'dd-Mon-yy'), d.remark, d.TR_EXRATE, d.PL_TYPE ";
    SQL_1 = SQL_1 + " ,TO_CHAR(DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',D.TR_AMT,0)),'9,999,999,990.99') REC_USD ";
    SQL_1 = SQL_1 + " ,TO_CHAR(DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',D.TR_AMT,0),0),'9,999,999,990') REC_VND ";
    SQL_1 = SQL_1 + " ,TO_CHAR(DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',0,D.TR_AMT)),'9,999,999,990.99') SPE_USD";
    SQL_1 = SQL_1 + " ,TO_CHAR(DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',0,D.TR_AMT),0),'9,999,999,990')  SPE_VND ";
    SQL_1 = SQL_1 + " , TO_CHAR((TO_NUMBER('"+p_open_usd +"','9,999,999,990.99')+ SUM(DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',D.TR_AMT,0)) - DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',0,D.TR_AMT)))  over (order by h.tr_date,d.pk)),'9,999,999,990.99') Bal_USD ";
    SQL_1 = SQL_1 + " , TO_CHAR((TO_NUMBER('"+p_open_vnd+"','9,999,999,990.99')+ SUM(DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',D.TR_AMT,0),0) - DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',0,D.TR_AMT),0))  over (order by h.tr_date,d.pk)),'9,999,999,990') Bal_VND ";
    SQL_1 = SQL_1 + " FROM TAC_BGCASH H, TAC_BGCASHD D ";
    SQL_1 = SQL_1 + " WHERE H.DEL_IF = 0 ";
    SQL_1 = SQL_1 + " and h.tr_date between '"+p_from_date +"'  and '"+p_to_date+"' ";
    SQL_1 = SQL_1 + " AND D.DEL_IF = 0 ";
    SQL_1 = SQL_1 + " AND H.PK = D.TAC_BGCASH_PK ";
    SQL_1 = SQL_1 + " and h.tco_company_pk = " + p_company_pk;
	SQL_1 = SQL_1 + " AND ((PL_TYPE IS NULL) OR DECODE('"+p_common_code+"','','1',TRIM(PL_TYPE)) <> DECODE('"+p_common_code+"','','0','"+p_common_code+"')) ";
    SQL_1 = SQL_1 + " and h.tac_abacctcode_pk IN  (" + p_acc_bank_vnd_arr + "," + p_acc_bank_usd_arr + ") ";
    SQL_1 = SQL_1 + " order by tr_date,pk ";
	
    dt_cash = ESysLib.TableReadOpen(SQL_1);
	
    for (i = 0; i < dt_cash.Rows.Count; i++)
    {  
 %>
 <tr class=xl25 >
  <td class=xl59 style='border-top:none' x:num><%= (i+1)%></td>
  <td class=xl50 width=62 style='border-left:none;width:47pt;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash.Rows[i][5].ToString()%></td>
  <td class=xl60 style='border-left:none'><%= dt_cash.Rows[i][8].ToString()%></td>
  <td class=xl52 width=348 style='border-left:none;width:261pt'><%= dt_cash.Rows[i][6].ToString()%></td>
  <td class=xl96 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][9].ToString()%></td>
  <td class=xl97 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][10].ToString()%></td>
  <td class=xl98 style='border-left:none' x:num><%= dt_cash.Rows[i][11].ToString()%></td>
  <td class=xl99 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][12].ToString()%></td>
  <td class=xl100 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][13].ToString()%></td>
  <td class=xl99 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][14].ToString()%></td>
  <td class=xl101 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][7].ToString()%></td>
  <td class=xl61 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=6 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <%
    }
	
    SQL_1 = " SELECT  ";
    SQL_1 = SQL_1 + " TO_CHAR(SUM(DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',D.TR_AMT,0))),'9,999,999,990.99') REC_USD ";
    SQL_1 = SQL_1 + " ,TO_CHAR(SUM(DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',D.TR_AMT,0),0)),'9,999,999,990') REC_VND ";
    SQL_1 = SQL_1 + " ,TO_CHAR(SUM(DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',0,D.TR_AMT))),'9,999,999,990.99') SPE_USD";
    SQL_1 = SQL_1 + " ,TO_CHAR(SUM(DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',0,D.TR_AMT),0)),'9,999,999,990')  SPE_VND ";
    SQL_1 = SQL_1 + " FROM TAC_BGCASH H, TAC_BGCASHD D ";
    SQL_1 = SQL_1 + " WHERE H.DEL_IF = 0 ";
    SQL_1 = SQL_1 + " and h.tr_date between '"+p_from_date +"'  and '"+p_to_date+"' ";
    SQL_1 = SQL_1 + " AND D.DEL_IF = 0 ";
    SQL_1 = SQL_1 + " AND H.PK = D.TAC_BGCASH_PK ";
    SQL_1 = SQL_1 + " and h.tco_company_pk = " + p_company_pk;
	SQL_1 = SQL_1 + " AND DECODE('"+p_common_code+"','','1',PL_TYPE) <> DECODE('"+p_common_code+"','','0','"+p_common_code+"')";
    SQL_1 = SQL_1 + " and h.tac_abacctcode_pk IN  (" + p_acc_bank_vnd_arr + "," + p_acc_bank_usd_arr + ") ";

    dt_cash_total = ESysLib.TableReadOpen(SQL_1); 
    if(dt_cash.Rows.Count>0)
    { 
 %> 
  <tr class=xl25 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=4 height=25 class=xl65 style='height:18.75pt' x:str="TOTAL ">TOTAL<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl108 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash_total.Rows[0][0].ToString()%></td>
  <td class=xl109 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash_total.Rows[0][1].ToString()%></td>
  <td class=xl108 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash_total.Rows[0][2].ToString()%></td>
  <td class=xl109 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash_total.Rows[0][3].ToString()%></td>
  <td class=xl108 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash.Rows[dt_cash.Rows.Count - 1][13].ToString()%></td>
  <td class=xl109 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash.Rows[dt_cash.Rows.Count - 1][14].ToString()%></td>
  <td class=xl110 style='border-left:none'>&nbsp;</td>
  <td class=xl67 style='border-left:none'>&nbsp;</td>
  <td colspan=6 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <%
    }
    else
    {  
 %> 
  <tr class=xl25 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=4 height=25 class=xl65 style='height:18.75pt' x:str="TOTAL ">TOTAL<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl108 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash_total.Rows[0][0].ToString()%></td>
  <td class=xl109 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash_total.Rows[0][1].ToString()%></td>
  <td class=xl108 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash_total.Rows[0][2].ToString()%></td>
  <td class=xl109 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash_total.Rows[0][3].ToString()%></td>
  <td class=xl108 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash.Rows[dt_cash.Rows.Count - 1][13].ToString()%></td>
  <td class=xl109 style='border-left:none;white-space:nowrap;mso-text-control:shrinktofit;' x:num><%= dt_cash.Rows[dt_cash.Rows.Count - 1][14].ToString()%></td>
  <td class=xl110 style='border-left:none'>&nbsp;</td>
  <td class=xl67 style='border-left:none'>&nbsp;</td>
  <td colspan=6 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <%
    }
 %> 
 <tr class=xl25 height=46 style='mso-height-source:userset;height:34.5pt'>
  <td height=46 class=xl65 style='height:34.5pt;border-top:none'>&nbsp;</td>
  <td class=xl65 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl65 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl65 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl111 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl109 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl108 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl90 width=89 style='border-top:none;border-left:none;width:67pt'>&nbsp;</td>
  <td class=xl94 width=89 style='border-top:none;border-left:none;width:67pt'>&nbsp;</td>
  <td class=xl90 width=89 style='border-top:none;border-left:none;width:67pt'>&nbsp;</td>
  <td class=xl112 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl58 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=6 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl25 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=12 height=24 class=xl68 style='height:18.0pt'>2/ Employee Status</td>
  <td colspan=6 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl75 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=3 height=24 class=xl70 style='height:18.0pt'>&nbsp;</td>
  <td class=xl66 style='border-top:none;border-left:none' x:str="Koreamen"><span
  style='mso-spacerun:yes'> </span>Koreamen<span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=2 class=xl71 style='border-right:.5pt solid black;border-left:
  none' x:str="Plant's Staff"><span style='mso-spacerun:yes'> </span>Plant's
  Staff<span style='mso-spacerun:yes'> </span></td>
  <td colspan=2 class=xl71 style='border-right:.5pt solid black;border-left:
  none' x:str=" Office's staff"><span style='mso-spacerun:yes'> 
  </span>Office's staff<span style='mso-spacerun:yes'> </span></td>
  <td class=xl73 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=3 class=xl71 style='border-right:.5pt solid black' x:str="TOTAL"><span
  style='mso-spacerun:yes'> </span>TOTAL<span style='mso-spacerun:yes'> </span></td>
  <td colspan=6 class=xl75 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=3 height=24 class=xl76 style='height:18.0pt'>&nbsp;</td>
  <td class=xl76 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=2 class=xl77 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
  <td colspan=2 class=xl77 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
  <td class=xl79 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=3 class=xl77 style='border-right:.5pt solid black'>&nbsp;</td>
  <td colspan=6 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=4 height=24 class=xl81 style='height:18.0pt'>Prepared by: Ms.
  TUYEN</td>
  <td class=xl82 style='border-top:none;border-left:none'><u style='visibility:
  hidden;mso-ignore:visibility'>&nbsp;</u></td>
  <td colspan=7 class=xl82 style='border-right:.5pt solid black'>Checked by:
  Mr. CHO SUNG JUN</td>
  <td colspan=6 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=67 style='mso-height-source:userset;height:50.25pt'>
  <td colspan=4 height=67 class=xl85 style='height:50.25pt'>&nbsp;</td>
  <td class=xl86 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=7 class=xl86 style='border-right:.5pt solid black'>&nbsp;</td>
  <td colspan=6 class=xl25 style='mso-ignore:colspan'></td>
 </tr>

 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=24 style='width:18pt'></td>
  <td width=62 style='width:47pt'></td>
  <td width=56 style='width:42pt'></td>
  <td width=348 style='width:261pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=59 style='width:44pt'></td>
  <td width=48 style='width:36pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
