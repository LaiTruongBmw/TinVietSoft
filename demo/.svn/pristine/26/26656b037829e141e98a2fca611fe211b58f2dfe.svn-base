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
<link rel=File-List href="bdfc0001_SUHEUNG_files/filelist.xml">
<link rel=Edit-Time-Data href="bdfc0001_SUHEUNG_files/editdata.mso">
<link rel=OLE-Object-Data href="bdfc0001_SUHEUNG_files/oledata.mso">
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
  <o:LastPrinted>2008-07-17T02:13:09Z</o:LastPrinted>
  <o:Created>2008-07-16T03:20:04Z</o:Created>
  <o:LastSaved>2008-07-17T02:13:32Z</o:LastSaved>
  <o:Company>vinagenuwin</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.4in 0in .4in 0in;
	mso-header-margin:.22in;
	mso-footer-margin:.21in;
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
	color:black;
	font-size:14.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl25
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl26
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:normal;}
.xl27
	{mso-style-parent:style16;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style16;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00\;\[Red\]\#\,\#\#0\.00";
	text-align:right;
	vertical-align:middle;}
.xl29
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl30
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl31
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl32
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl33
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl34
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl35
	{mso-style-parent:style0;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl36
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl38
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00\;\[Red\]\#\,\#\#0\.00";
	text-align:center;
	vertical-align:middle;}
.xl39
	{mso-style-parent:style0;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl40
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl41
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00\;\[Red\]\#\,\#\#0\.00";}
.xl42
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl43
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
	border-left:.5pt solid windowtext;}
.xl44
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[ENG\]\[$-409\]dd\\-mmm\\-yy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl45
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[ENG\]\[$-409\]dd\\-mmm\\-yy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl46
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
.xl47
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
.xl48
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
.xl49
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
.xl50
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
.xl51
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl52
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl53
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
.xl54
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl55
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
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl59
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl60
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl61
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl62
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
.xl63
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl64
	{mso-style-parent:style16;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl65
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
.xl66
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl67
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl70
	{mso-style-parent:style16;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl71
	{mso-style-parent:style16;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl72
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl73
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl74
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl75
	{mso-style-parent:style16;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl77
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
.xl78
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl80
	{mso-style-parent:style16;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl81
	{mso-style-parent:style16;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl82
	{mso-style-parent:style16;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl83
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl84
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0_\)\;\[Red\]\\\(0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl85
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl86
	{mso-style-parent:style16;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl87
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl90
	{mso-style-parent:style16;
	color:red;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl92
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl93
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl94
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl95
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl97
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl98
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0_\)\;\[Red\]\\\(0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl99
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl100
	{mso-style-parent:style16;
	color:red;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl101
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl102
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;\[Red\]_\(\\ \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl103
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl104
	{mso-style-parent:style16;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl106
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl107
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl108
	{mso-style-parent:style0;
	color:black;
	font-size:18.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl109
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl110
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
.xl111
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
.xl112
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
.xl113
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
.xl114
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
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Daily</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>300</x:DefaultRowHeight>
     <x:StandardWidth>2340</x:StandardWidth>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>7</x:SplitHorizontal>
     <x:TopRowBottomPane>7</x:TopRowBottomPane>
     <x:ActivePane>2</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>3</x:ActiveRow>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
       <x:ActiveRow>3</x:ActiveRow>
       <x:RangeSelection>$A$4:$L$4</x:RangeSelection>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>8700</x:WindowHeight>
  <x:WindowWidth>15240</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>_FilterDatabase</x:Name>
  <x:Hidden/>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Daily!$A$7:$N$7</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl40>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1213 style='border-collapse:
 collapse;table-layout:fixed;width:912pt'>
 <col class=xl40 width=30 style='mso-width-source:userset;mso-width-alt:1097;
 width:23pt'>
 <col class=xl40 width=67 style='mso-width-source:userset;mso-width-alt:2450;
 width:50pt'>
 <col class=xl40 width=45 style='mso-width-source:userset;mso-width-alt:1645;
 width:34pt'>
 <col class=xl40 width=269 style='mso-width-source:userset;mso-width-alt:9837;
 width:202pt'>
 <col class=xl40 width=78 span=3 style='mso-width-source:userset;mso-width-alt:
 2852;width:59pt'>
 <col class=xl41 width=88 span=2 style='mso-width-source:userset;mso-width-alt:
 3218;width:66pt'>
 <col class=xl40 width=88 style='mso-width-source:userset;mso-width-alt:3218;
 width:66pt'>
 <col class=xl40 width=62 style='mso-width-source:userset;mso-width-alt:2267;
 width:47pt'>
 <col class=xl40 width=52 style='mso-width-source:userset;mso-width-alt:1901;
 width:39pt'>
 <col class=xl40 width=95 span=244 style='mso-width-source:userset;mso-width-alt:
 3474;width:71pt'>
 <tr class=xl35 height=25 style='height:18.75pt'>
  <td height=25 class=xl34 width=30 style='height:18.75pt;width:23pt'></td>
  <td class=xl24 colspan=3 width=381 style='mso-ignore:colspan;width:286pt'><%= p_company_name %></td>
  <td class=xl27 width=78 style='width:59pt'></td>
  <td class=xl27 width=78 style='width:59pt'></td>
  <td class=xl27 width=78 style='width:59pt'></td>
  <td class=xl28 width=88 style='width:66pt'></td>
  <td class=xl28 width=88 style='width:66pt'></td>
  <td class=xl29 width=88 style='width:66pt'></td>
  <td class=xl29 width=62 style='width:47pt'></td>
  <td class=xl29 width=52 style='width:39pt'></td>
  <td class=xl35 width=95 style='width:71pt'></td>
  <td class=xl35 width=95 style='width:71pt'></td>
 </tr>
 <tr class=xl35 height=22 style='height:16.5pt'>
  <td height=22 class=xl34 style='height:16.5pt'></td>
  <td class=xl30 colspan=3 style='mso-ignore:colspan'><%= p_cmp_add %></td>
  <td colspan=3 class=xl31 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl29 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl35 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl35 height=21 style='height:15.75pt'>
  <td height=21 class=xl34 style='height:15.75pt'></td>
  <td class=xl32 colspan=3 style='mso-ignore:colspan'>MST : <%= p_tax_code %></td>
  <td colspan=3 class=xl31 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl29 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl35 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl35 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=12 height=26 class=xl108 style='height:19.5pt'> <%= p_company_name %> - DETAIL SPENDING REPORT </td>
  <td colspan=2 class=xl35 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl35 height=15 style='mso-height-source:userset;height:11.25pt'>
  <td height=15 class=xl34 style='height:11.25pt'></td>
  <td colspan=11 class=xl33 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl35 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl35 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl34 style='height:19.5pt'></td>
  <td colspan=2 class=xl29 style='mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td colspan=3 class=xl31 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl109>Reported date: <%= p_rpt_date2  %></td>
  <td colspan=2 class=xl35 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl52 height=60 style='mso-height-source:userset;height:45.0pt'>
  <td height=60 class=xl46 id="_x0000_s1025" x:autofilter="all"
  x:autofilterrange="$A$7:$N$7" style='height:45.0pt'>NO</td>
  <td class=xl47 id="_x0000_s1026" x:autofilter="all" style='border-left:none'>DATE</td>
  <td class=xl48 id="_x0000_s1027" x:autofilter="all" width=45
  style='border-left:none;width:34pt'>CODE<br>
    NO.</td>
  <td class=xl49 id="_x0000_s1028" x:autofilter="all" width=269
  style='border-left:none;width:202pt'>CONTENT</td>
  <td colspan=2 class=xl110 id="_x0000_s1029" x:autofilter="all" width=156
  style='border-right:.5pt solid black;border-left:none;width:118pt'>RECEIVING</td>
  <td colspan=2 class=xl112 id="_x0000_s1031" x:autofilter="all"
  style='border-left:none' x:str="SPENDING"><span
  style='mso-spacerun:yes'> </span>SPENDING<span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=2 class=xl113 id="_x0000_s1033" x:autofilter="all" width=176
  style='border-right:.5pt solid black;border-left:none;width:132pt'
  x:str="BALANCE "><span style='mso-spacerun:yes'> </span>BALANCE<span
  style='mso-spacerun:yes'>  </span></td>
  <td class=xl50 id="_x0000_s1035" x:autofilter="all" width=62
  style='border-top:none;border-left:none;width:47pt'
  x:str="Exchange Rate &#10;VND/USD"><span
  style='mso-spacerun:yes'> </span>Exchange Rate <br>
    VND/USD<span style='mso-spacerun:yes'> </span></td>
  <td class=xl51 x:autofilter="all" style='border-top:none;border-left:none'>Remark</td>
  <td class=xl52 x:autofilter="all" width=95 style='width:71pt'></td>
  <td class=xl52 x:autofilter="all" width=95 style='width:71pt'></td>
 </tr>
<tr class=xl31 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=4 height=22 class=xl36 width=411 style='height:16.5pt;width:309pt'></td>
  <td class=xl53 width=78 style='border-top:none;border-left:none;width:59pt'
  x:str="USD"><span style='mso-spacerun:yes'> </span>USD<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl53 width=78 style='border-top:none;border-left:none;width:59pt'
  x:str="VND"><span style='mso-spacerun:yes'> </span>VND<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl53 width=78 style='border-left:none;width:59pt' x:str="USD"><span
  style='mso-spacerun:yes'> </span>USD<span style='mso-spacerun:yes'> </span></td>
  <td class=xl53 width=88 style='border-left:none;width:66pt' x:str="VND"><span
  style='mso-spacerun:yes'> </span>VND<span style='mso-spacerun:yes'> </span></td>
  <td class=xl53 width=88 style='border-top:none;border-left:none;width:66pt'
  x:str="USD"><span style='mso-spacerun:yes'> </span>USD<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl53 width=88 style='border-top:none;border-left:none;width:66pt'
  x:str="VND"><span style='mso-spacerun:yes'> </span>VND<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl54 style='border-left:none'>&nbsp;</td>
  <td class=xl55 width=52 style='border-top:none;border-left:none;width:39pt'>&nbsp;</td>
  <td colspan=2 class=xl31 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl31 height=47 style='mso-height-source:userset;height:35.25pt'>
  <td height=47 class=xl42 width=30 style='height:35.25pt;border-top:none;
  width:23pt;text-align:left;' colspan="3" ><b>&nbsp;&nbsp;CASH ON HAND</b></td>
  <td class=xl36 width=269 style='border-top:none;border-left:none;width:202pt'>A
  balance carried forward from the last account</td>
  <td class=xl58 width=78 style='border-top:none;border-left:none;width:59pt'>&nbsp;</td>
  <td class=xl59 width=78 style='border-top:none;border-left:none;width:59pt'>&nbsp;</td>
  <td class=xl60 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl61 width=88 style='border-top:none;border-left:none;width:66pt'>&nbsp;</td>
  <td class=xl62 width=88 style='border-top:none;border-left:none;width:66pt' x:num><%= p_open_usd %></td>
  <td class=xl61 width=88 style='border-top:none;border-left:none;width:66pt' x:num><%= p_open_vnd %></td>
  <td class=xl63 style='border-top:none;border-left:none' x:num></td>
  <td class=xl64 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=2 class=xl31 style='mso-ignore:colspan'></td>
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
    SQL_1 = SQL_1 + " , TO_CHAR((TO_NUMBER('"+p_open_usd+"','9,999,999,990.99')+ SUM(DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',D.TR_AMT,0)) - DECODE(TR_CCY,'VND',0,DECODE(DRCR_TYPE,'C',0,D.TR_AMT)))  over (order by h.tr_date,d.pk)),'9,999,999,990.99') Bal_USD ";
    SQL_1 = SQL_1 + " , TO_CHAR((TO_NUMBER('"+p_open_vnd+"','9,999,999,990')+ SUM(DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',D.TR_AMT,0),0) - DECODE(TR_CCY,'VND',DECODE(DRCR_TYPE,'C',0,D.TR_AMT),0))  over (order by h.tr_date,d.pk)),'9,999,999,990.99') Bal_VND "; 
    SQL_1 = SQL_1 + " FROM TAC_BGCASH H, TAC_BGCASHD D ";
    SQL_1 = SQL_1 + " WHERE H.DEL_IF = 0 ";
    SQL_1 = SQL_1 + " and h.tr_date = '" + p_from_date + "' ";
    SQL_1 = SQL_1 + " AND D.DEL_IF = 0 ";
    SQL_1 = SQL_1 + " AND H.PK = D.TAC_BGCASH_PK ";
    SQL_1 = SQL_1 + " and h.tco_company_pk = " + p_company_pk;
    SQL_1 = SQL_1 + " and h.tac_abacctcode_pk IN  (" + p_acc_cash_vnd_arr + "," + p_acc_cash_usd_arr + ") ";
    SQL_1 = SQL_1 + " order by tr_date,pk ";
    DataTable dt_cash = ESysLib.TableReadOpen(SQL_1);
    for (i = 0; i < dt_cash.Rows.Count; i++)
    {  
 %>
 <tr class=xl31 height=60 style='height:45.0pt'>
  <td height=60 class=xl65 style='height:45.0pt;border-top:none' x:num><%= (i+1)%></td>
  <td class=xl44 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][5].ToString()%></td>
  <td class=xl66 style='border-top:none;border-left:none'><%= dt_cash.Rows[i][8].ToString()%></td>
  <td class=xl67 width=269 style='border-top:none;border-left:none;width:202pt' ><%= dt_cash.Rows[i][6].ToString()%></td>
  <td class=xl68 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][9].ToString()%></td>
  <td class=xl69 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][10].ToString()%></td>
  <td class=xl70 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][11].ToString()%></td>
  <td class=xl71 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][12].ToString()%></td>
  <td class=xl72 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][13].ToString()%></td>
  <td class=xl73 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][14].ToString()%></td>
  <td class=xl74 style='border-top:none;border-left:none' x:num></td>
  <td class=xl75 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=2 class=xl31 style='mso-ignore:colspan'></td>
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
    SQL_1 = SQL_1 + " and h.tr_date = '" + p_from_date + "' ";
    SQL_1 = SQL_1 + " AND D.DEL_IF = 0 ";
    SQL_1 = SQL_1 + " AND H.PK = D.TAC_BGCASH_PK ";
    SQL_1 = SQL_1 + " and h.tco_company_pk = " + p_company_pk;
    SQL_1 = SQL_1 + " and h.tac_abacctcode_pk IN  (" + p_acc_cash_vnd_arr + "," + p_acc_cash_usd_arr + ") ";

    DataTable dt_cash_total = ESysLib.TableReadOpen(SQL_1); 
    if(dt_cash.Rows.Count>0)
    { 
 %> 
 <tr class=xl31 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=4 height=25 class=xl105 style='height:18.75pt' x:str>TOTAL</td>
  <td class=xl101  x:num><%= dt_cash_total.Rows[0][0].ToString() %></td>
  <td class=xl102  x:num><%= dt_cash_total.Rows[0][1].ToString() %></td>
  <td class=xl101  x:num><%= dt_cash_total.Rows[0][2].ToString() %></td>
  <td class=xl102  x:num><%= dt_cash_total.Rows[0][3].ToString() %></td>
  <td class=xl101  x:num><%= dt_cash.Rows[dt_cash.Rows.Count - 1][13].ToString()%></td>
  <td class=xl102  x:num><%= dt_cash.Rows[dt_cash.Rows.Count - 1][14].ToString()%></td>
  <td class=xl103  x:num></td>
  <td class=xl104 >&nbsp;</td>
  <td colspan=2 class=xl31 style='mso-ignore:colspan'></td>
 </tr>
<%
    }
    else
    {  
 %> 
<tr class=xl31 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=4 height=25 class=xl105 style='height:18.75pt' x:str>TOTAL</td>
  <td class=xl101  x:num><%= dt_cash_total.Rows[0][0].ToString() %></td>
  <td class=xl102  x:num><%= dt_cash_total.Rows[0][1].ToString() %></td>
  <td class=xl101  x:num><%= dt_cash_total.Rows[0][2].ToString() %></td>
  <td class=xl102  x:num><%= dt_cash_total.Rows[0][3].ToString() %></td>
  <td class=xl101  x:num></td>
  <td class=xl102  x:num></td>
  <td class=xl103  x:num></td>
  <td class=xl104 >&nbsp;</td>
  <td colspan=2 class=xl31 style='mso-ignore:colspan'></td>
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
  <tr class=xl31 height=47 style='mso-height-source:userset;height:35.25pt'>
  <td height=47 class=xl42 width=30 style='height:35.25pt;border-top:none;
  width:23pt' colspan="3" align="left"><b>&nbsp;&nbsp;CASH IN BANK</b></td>
  <td class=xl36 width=269 style='border-top:none;border-left:none;width:202pt'>A
  balance carried forward from the last account</td>
  <td class=xl58 width=78 style='border-top:none;border-left:none;width:59pt'>&nbsp;</td>
  <td class=xl59 width=78 style='border-top:none;border-left:none;width:59pt'>&nbsp;</td>
  <td class=xl60 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl61 width=88 style='border-top:none;border-left:none;width:66pt'>&nbsp;</td>
  <td class=xl62 width=88 style='border-top:none;border-left:none;width:66pt' x:num><%= p_open_usd %></td>
  <td class=xl61 width=88 style='border-top:none;border-left:none;width:66pt' x:num><%= p_open_vnd %></td>
  <td class=xl63 style='border-top:none;border-left:none' x:num></td>
  <td class=xl64 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=2 class=xl31 style='mso-ignore:colspan'></td>
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
    SQL_1 = SQL_1 + " and h.tr_date = '" + p_from_date + "' ";
    SQL_1 = SQL_1 + " AND D.DEL_IF = 0 ";
    SQL_1 = SQL_1 + " AND H.PK = D.TAC_BGCASH_PK ";
    SQL_1 = SQL_1 + " and h.tco_company_pk = " + p_company_pk;
    SQL_1 = SQL_1 + " and h.tac_abacctcode_pk IN  (" + p_acc_bank_vnd_arr + "," + p_acc_bank_usd_arr + ") ";
    SQL_1 = SQL_1 + " order by tr_date,pk ";
	
    dt_cash = ESysLib.TableReadOpen(SQL_1);
	
    for (i = 0; i < dt_cash.Rows.Count; i++)
    {  
 %>
 <tr class=xl31 height=60 style='height:45.0pt'>
  <td height=60 class=xl65 style='height:45.0pt;border-top:none' x:num><%= (i+1)%></td>
  <td class=xl44 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][5].ToString()%></td>
  <td class=xl66 style='border-top:none;border-left:none'><%= dt_cash.Rows[i][8].ToString()%></td>
  <td class=xl67 width=269 style='border-top:none;border-left:none;width:202pt' ><%= dt_cash.Rows[i][6].ToString()%></td>
  <td class=xl68 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][9].ToString()%></td>
  <td class=xl69 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][10].ToString()%></td>
  <td class=xl70 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][11].ToString()%></td>
  <td class=xl71 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][12].ToString()%></td>
  <td class=xl72 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][13].ToString()%></td>
  <td class=xl73 style='border-top:none;border-left:none' x:num><%= dt_cash.Rows[i][14].ToString()%></td>
  <td class=xl74 style='border-top:none;border-left:none' x:num></td>
  <td class=xl75 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=2 class=xl31 style='mso-ignore:colspan'></td>
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
    SQL_1 = SQL_1 + " and h.tr_date = '" + p_from_date + "' ";
    SQL_1 = SQL_1 + " AND D.DEL_IF = 0 ";
    SQL_1 = SQL_1 + " AND H.PK = D.TAC_BGCASH_PK ";
    SQL_1 = SQL_1 + " and h.tco_company_pk = " + p_company_pk;
    SQL_1 = SQL_1 + " and h.tac_abacctcode_pk IN  (" + p_acc_bank_vnd_arr + "," + p_acc_bank_usd_arr + ") ";

    dt_cash_total = ESysLib.TableReadOpen(SQL_1); 
    if(dt_cash.Rows.Count>0)
    { 
 %> 
 <tr class=xl31 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=4 height=25 class=xl105 style='height:18.75pt' x:str>TOTAL</td>
  <td class=xl101  x:num><%= dt_cash_total.Rows[0][0].ToString() %></td>
  <td class=xl102  x:num><%= dt_cash_total.Rows[0][1].ToString() %></td>
  <td class=xl101  x:num><%= dt_cash_total.Rows[0][2].ToString() %></td>
  <td class=xl102  x:num><%= dt_cash_total.Rows[0][3].ToString() %></td>
  <td class=xl101  x:num><%= dt_cash.Rows[dt_cash.Rows.Count - 1][13].ToString()%></td>
  <td class=xl102  x:num><%= dt_cash.Rows[dt_cash.Rows.Count - 1][14].ToString()%></td>
  <td class=xl103  x:num></td>
  <td class=xl104 >&nbsp;</td>
  <td colspan=2 class=xl31 style='mso-ignore:colspan'></td>
 </tr>
<%
    }
    else
    {  
 %> 
<tr class=xl31 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=4 height=25 class=xl105 style='height:18.75pt' x:str>TOTAL</td>
  <td class=xl101  x:num><%= dt_cash_total.Rows[0][0].ToString() %></td>
  <td class=xl102  x:num><%= dt_cash_total.Rows[0][1].ToString() %></td>
  <td class=xl101  x:num><%= dt_cash_total.Rows[0][2].ToString() %></td>
  <td class=xl102  x:num><%= dt_cash_total.Rows[0][3].ToString() %></td>
  <td class=xl101  x:num></td>
  <td class=xl102  x:num></td>
  <td class=xl103  x:num></td>
  <td class=xl104 >&nbsp;</td>
  <td colspan=2 class=xl31 style='mso-ignore:colspan'></td>
<%
    }
   %> 
 <tr class=xl39 height=39 style='mso-height-source:userset;height:29.25pt'>
  <td height=39 class=xl37 style='height:29.25pt'></td>
  <td colspan=3 class=xl106>Prepared by: Ms. Tuyen</td>
  <td colspan=3 class=xl38 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl107>Approved by : President /Mr.Cho Sung Jun</td>
  <td colspan=2 class=xl39 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=7 class=xl40 style='height:14.25pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl41 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl40 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=30 style='width:23pt'></td>
  <td width=67 style='width:50pt'></td>
  <td width=45 style='width:34pt'></td>
  <td width=269 style='width:202pt'></td>
  <td width=78 style='width:59pt'></td>
  <td width=78 style='width:59pt'></td>
  <td width=78 style='width:59pt'></td>
  <td width=88 style='width:66pt'></td>
  <td width=88 style='width:66pt'></td>
  <td width=88 style='width:66pt'></td>
  <td width=62 style='width:47pt'></td>
  <td width=52 style='width:39pt'></td>
  <td width=95 style='width:71pt'></td>
  <td width=95 style='width:71pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
