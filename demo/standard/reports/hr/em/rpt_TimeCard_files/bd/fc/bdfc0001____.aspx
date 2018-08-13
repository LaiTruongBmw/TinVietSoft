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

SQL = " SELECT partner_lname, ";
SQL += "          TRIM (TO_CHAR (TO_DATE ('"+p_from_date+"', 'YYYYMMDD'), 'MONTH'))|| ', '|| SUBSTR ('"+p_from_date+"', 0, 4) aa, ";
SQL += "          INITCAP (TRIM (TO_CHAR (SYSDATE, 'MONTH')))|| ' '|| TO_CHAR (SYSDATE, 'DDth, YYYY') aaa, ";
SQL += " to_char(TO_DATE ('"+p_from_date+"', 'YYYYMMDD'),'dd-mon-yy') ";
SQL += "  FROM tco_company ";
SQL += " WHERE pk =" + p_company_pk;

DataTable dt = ESysLib.TableReadOpen(SQL);
p_company_name = dt.Rows[0][0].ToString();
p_rpt_date = dt.Rows[0][1].ToString();
p_rpt_date2 = dt.Rows[0][2].ToString();
p_open_date = dt.Rows[0][3].ToString();

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

%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="Cashbook_files/filelist.xml">
<link rel=Edit-Time-Data href="Cashbook_files/editdata.mso">
<link rel=OLE-Object-Data href="Cashbook_files/oledata.mso">
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
  <o:LastPrinted>2008-07-11T02:06:16Z</o:LastPrinted>
  <o:Created>2008-07-10T09:54:38Z</o:Created>
  <o:LastSaved>2008-07-11T02:07:14Z</o:LastSaved>
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
	font-family:Arial, sans-serif;;
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
	font-family:Arial, sans-serif;;
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
.xl33
	{mso-style-parent:style16;
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
.xl34
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
.xl35
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl36
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl37
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
.xl38
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
.xl39
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
.xl40
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
.xl41
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
	border-left:none;
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
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl44
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;;
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
.xl45
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
.xl46
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
.xl47
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;;
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
.xl48
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
.xl49
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
.xl50
	{mso-style-parent:style0;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl51
	{mso-style-parent:style0;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl52
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[ENG\]\[$-409\]d\\-mmm\\-yy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl53
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl54
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
.xl55
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl56
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl57
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl58
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl59
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl60
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl61
	{mso-style-parent:style16;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl62
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl63
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
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl64
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
	border-left:none;
	white-space:normal;}
.xl65
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:top;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl69
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
	border-left:none;}
.xl70
	{mso-style-parent:style16;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl71
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl72
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl73
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
.xl74
	{mso-style-parent:style16;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl75
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
	border-left:none;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl78
	{mso-style-parent:style16;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl79
	{mso-style-parent:style16;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[ENG\]\[$-409\]d\\-mmm\\-yy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl84
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl85
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl86
	{mso-style-parent:style16;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl87
	{mso-style-parent:style16;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl88
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl89
	{mso-style-parent:style16;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl90
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
	border-bottom:none;
	border-left:none;}
.xl91
	{mso-style-parent:style16;
	color:red;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl92
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl93
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl94
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl95
	{mso-style-parent:style16;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl96
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
.xl97
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
.xl98
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl99
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl100
	{mso-style-parent:style16;
	color:black;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl101
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl102
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl103
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
.xl104
	{mso-style-parent:style16;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl105
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
.xl106
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
.xl107
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
.xl108
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
.xl109
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;;
	mso-generic-font-family:auto;
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
	font-family:Arial, sans-serif;;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl111
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl112
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl113
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl114
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
.xl115
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
.xl116
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
.xl117
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
.xl118
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
.xl119
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
.xl120
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
.xl121
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
.xl122
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
.xl123
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
.xl124
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
.xl125
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
.xl126
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
.xl127
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
.xl128
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
.xl129
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
.xl130
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
.xl131
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
.xl132
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
.xl133
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
.xl134
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
.xl135
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
.xl136
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
.xl137
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
.xl138
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
.xl139
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
.xl140
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
.xl141
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
.xl142
	{mso-style-parent:style16;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl143
	{mso-style-parent:style16;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl144
	{mso-style-parent:style16;
	color:black;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl145
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
.xl146
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
.xl147
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
.xl148
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
.xl149
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
    <x:Name>Cashbook</x:Name>
    <x:WorksheetOptions>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>86</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>1200</x:VerticalResolution>
     </x:Print>
     <x:Zoom>95</x:Zoom>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>4</x:ActiveRow>
       <x:ActiveCol>3</x:ActiveCol>
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
  <x:WindowTopY>375</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>_FilterDatabase</x:Name>
  <x:Hidden/>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Cashbook!$A$5:$L$9</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Cashbook!$5:$6</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1036"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1164 style='border-collapse:
 collapse;table-layout:fixed;width:874pt'>
 <col class=xl24 width=24 style='mso-width-source:userset;mso-width-alt:877;
 width:18pt'>
 <col class=xl25 width=68 style='mso-width-source:userset;mso-width-alt:2486;
 width:51pt'>
 <col class=xl25 width=56 style='mso-width-source:userset;mso-width-alt:2048;
 width:42pt'>
 <col class=xl24 width=366 style='mso-width-source:userset;mso-width-alt:13385;
 width:275pt'>
 <col class=xl26 width=84 style='mso-width-source:userset;mso-width-alt:3072;
 width:63pt'>
 <col class=xl24 width=100 style='mso-width-source:userset;mso-width-alt:3657;
 width:75pt'>
 <col class=xl27 width=87 style='mso-width-source:userset;mso-width-alt:3181;
 width:65pt'>
 <col class=xl28 width=98 style='mso-width-source:userset;mso-width-alt:3584;
 width:74pt'>
 <col class=xl27 width=83 style='mso-width-source:userset;mso-width-alt:3035;
 width:62pt'>
 <col class=xl27 width=100 style='mso-width-source:userset;mso-width-alt:3657;
 width:75pt'>
 <col class=xl29 width=44 style='mso-width-source:userset;mso-width-alt:1609;
 width:33pt'>
 <col class=xl24 width=54 style='mso-width-source:userset;mso-width-alt:1974;
 width:41pt'>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td colspan=12 height=32 class=xl111 width=1164 style='height:24.0pt;
  width:874pt'> FINANCIAL REPORT <%= p_rpt_date %></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td colspan=12 height=23 class=xl112 style='height:17.25pt'>EXPENSE OF SUHEUNG VIET NAM
  CO., LTD</td>
 </tr>
 <tr class=xl30 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=12 height=24 class=xl113 style='height:18.0pt'>1/ Financial
  status</td>
 </tr>
 <tr class=xl30 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=6 class=xl31 style='height:18.0pt;mso-ignore:colspan'></td>
  <td class=xl32></td>
  <td class=xl33>&nbsp;</td>
  <td class=xl34>Reported date : <%= p_rpt_date2  %></td>
  <td class=xl35></td>
  <td class=xl36></td>
  <td class=xl37>&nbsp;</td>
 </tr>
 <tr class=xl30 height=60 style='mso-height-source:userset;height:45.0pt'>
  <td height=60 class=xl38 id="_x0000_s1025" x:autofilter="all"
  x:autofilterrange="$A$5:$L$9" style='height:45.0pt'>NO</td>
  <td class=xl39 id="_x0000_s1026" x:autofilter="all">DATE</td>
  <td class=xl40 id="_x0000_s1027" x:autofilter="all" width=56
  style='width:42pt'>CODE<br>
    NO.</td>
  <td class=xl41 id="_x0000_s1028" x:autofilter="all" width=366
  style='width:275pt'>CONTENT</td>
  <td colspan=2 class=xl114 id="_x0000_s1029" x:autofilter="all" width=184
  style='border-right:.5pt solid black;border-left:none;width:138pt'>RECEIVING</td>
  <td colspan=2 class=xl116 id="_x0000_s1031" x:autofilter="all"
  style='border-right:.5pt solid black;border-left:none' x:str="SPENDING"><span
  style='mso-spacerun:yes'> </span>SPENDING<span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=2 class=xl118 id="_x0000_s1033" x:autofilter="all" width=183
  style='border-right:.5pt solid black;border-left:none;width:137pt'
  x:str="BALANCE "><span style='mso-spacerun:yes'> </span>BALANCE<span
  style='mso-spacerun:yes'>  </span></td>
  <td class=xl42 id="_x0000_s1034" x:autofilter="all" width=44
  style='width:33pt' x:str="Exchange &#10;Rate VND/USD"><span
  style='mso-spacerun:yes'> </span>Exchange <br>
    Rate VND/USD<span style='mso-spacerun:yes'> </span></td>
  <td class=xl43 id="_x0000_s1035" x:autofilter="all">Remark</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=4 height=22 class=xl120 width=514 style='border-right:.5pt solid black;
  height:16.5pt;width:386pt'>&nbsp;</td>
  <td class=xl44 width=84 style='width:63pt' x:str="USD"><span
  style='mso-spacerun:yes'> </span>USD<span style='mso-spacerun:yes'> </span></td>
  <td class=xl45 width=100 style='width:75pt' x:str="VND"><span
  style='mso-spacerun:yes'> </span>VND<span style='mso-spacerun:yes'> </span></td>
  <td class=xl46 width=87 style='border-top:none;width:65pt' x:str="USD"><span
  style='mso-spacerun:yes'> </span>USD<span style='mso-spacerun:yes'> </span></td>
  <td class=xl47 width=98 style='border-top:none;width:74pt' x:str="VND"><span
  style='mso-spacerun:yes'> </span>VND<span style='mso-spacerun:yes'> </span></td>
  <td class=xl45 width=83 style='width:62pt' x:str="USD"><span
  style='mso-spacerun:yes'> </span>USD<span style='mso-spacerun:yes'> </span></td>
  <td class=xl45 width=100 style='width:75pt' x:str="VND"><span
  style='mso-spacerun:yes'> </span>VND<span style='mso-spacerun:yes'> </span></td>
  <td class=xl48 width=44 style='width:33pt'>&nbsp;</td>
  <td class=xl49 width=54 style='width:41pt'>&nbsp;</td>
 </tr>
<%
    int i ,j,k,l,m,n;
    string SQL2 ="";
    string SQL3 ="";  
    string SQL4=""; 
    DataTable dtloop_1,dtloop_2,dtbank; 
    string p_open_bal_usd = "";
    string p_open_bal_vnd = "";
    float p_p1,p_p2,p_p3;

    for (i = 0; i < dt1.Rows.Count; i++)
    {
        SQL4 = "SELECT account_no, bank_id, pk";
        SQL4 += "FROM tac_abdepomt WHERE del_if = 0";
        SQL4 += "AND tco_company_pk = " + p_company_pk + " AND ccy = '" + dt1.Rows[i][3].ToString()+"' ";

        //dtbank = ESysLib.TableReadOpen(SQL4);
        
        
        SQL2 = "SELECT SF_GET_CASHDDBAL('" + p_company_pk + "', '" + p_from_date + "', '" + dt1.Rows[i][2].ToString() + "', '" + p_bank_pk + "', 'TRANS'), SF_GET_CASHDDBAL('" + p_company_pk + "', '" + p_from_date + "', '" + dt1.Rows[i][2].ToString() + "', '" + p_bank_pk + "', 'BOOKS') from dual";
        dtloop_1 = ESysLib.TableReadOpen(SQL2);
        p_open_bal_usd = dtloop_1.Rows[0][0].ToString();
        p_open_bal_vnd = dtloop_1.Rows[0][1].ToString();
        p_p1 = float.Parse(p_open_bal_usd);
        p_p2 = float.Parse(p_open_bal_vnd);
        SQL3 = " SELECT  ";
        SQL3 += "         TO_CHAR(TO_DATE(H.TR_DATE,'YYYYMMDD'),'DD-MON-yy')  ";
        SQL3 += "        ,D.REMARK ";
        SQL3 += "        ,DECODE(D.DRCR_TYPE,'C',DECODE(D.TR_EXRATE,'1',D.TR_AMT,0),0) RT ";
        SQL3 += "        ,DECODE(D.DRCR_TYPE,'D',DECODE(D.TR_EXRATE,'1',D.TR_AMT,0),0) Payment_Trans ";
        SQL3 += "        ,0 Balance_Trans ";
        SQL3 += "        ,D.DRCR_TYPE ";
        SQL3 += "        ,D.TR_CCY ";
        SQL3 += "        ,DECODE(D.DRCR_TYPE,'C',DECODE(D.TR_EXRATE,'1',D.TR_BOOKAMT,0),0) Receipt_Books ";
        SQL3 += "        ,DECODE(D.DRCR_TYPE,'D',DECODE(D.TR_EXRATE,'1',D.TR_BOOKAMT,0),0) Payment_Books ";
        SQL3 += "        ,0 Balance_Books ";
        SQL3 += "        ,D.TR_EXRATE       ";
        SQL3 += "        ,H.TR_DATE ";
        
        SQL3 += "        ,TO_CHAR(DECODE(D.DRCR_TYPE,'C',DECODE(D.TR_EXRATE,'1',D.TR_AMT,0),0),'9,999,999,999.99') RT ";
        SQL3 += "        ,TO_CHAR(DECODE(D.DRCR_TYPE,'D',DECODE(D.TR_EXRATE,'1',D.TR_AMT,0),0),'9,999,999,999') Payment_Trans ";

        SQL3 += "        ,TO_CHAR(DECODE(D.DRCR_TYPE,'C',DECODE(D.TR_EXRATE,'1',D.TR_BOOKAMT,0),0),'9,999,999,999.99') Receipt_Books ";
        SQL3 += "        ,TO_CHAR(DECODE(D.DRCR_TYPE,'D',DECODE(D.TR_EXRATE,'1',D.TR_BOOKAMT,0),0),'9,999,999,999') Payment_Books ";
        
        SQL3 += "FROM ";
        SQL3 += "    TAC_BGCASHD D,TAC_BGCASH H ";
        SQL3 += "WHERE ";
        SQL3 += "     D.DEL_IF = 0 ";
        SQL3 += "     AND D.TAC_BGCASH_PK = h.pk ";
        SQL3 += "     AND h.TCO_COMPANY_PK = " + p_company_pk;
        SQL3 += "     AND H.TR_DATE BETWEEN '" + p_from_date + "' AND '" + p_to_date + "'";
        SQL3 += "     AND h.tac_abacctcode_pk = " + dt1.Rows[i][2].ToString();
        SQL3 += "     AND decode('" + p_bank_pk + "','',1,h.tac_bfdepomt_pk) =  decode('" + p_bank_pk + "','',1,'" + p_bank_pk + "') ";
        SQL3 += "ORDER BY TR_DATE desc,d.PK ";
        dtloop_2 = ESysLib.TableReadOpen(SQL3);
 %>
 <tr class=xl50 height=47 style='mso-height-source:userset;height:35.25pt'>
  <td height=47 class=xl51 width=24 style='height:35.25pt;width:18pt'>&nbsp;</td>
  <td class=xl52 width=68 style='width:51pt'><%= p_open_date%></td>
  <td class=xl53>&nbsp;</td>
  <td class=xl54 width=366 style='width:275pt'>A balance carried forward <%= dt1.Rows[i][0].ToString()%> - <%= dt1.Rows[i][1].ToString()%></td>
  <td class=xl55 width=84 style='width:63pt' x:num></td>
  <td class=xl56 width=100 style='width:75pt' x:num></td>
  <td class=xl57>&nbsp;</td>
  <td class=xl58 width=98 style='width:74pt'>&nbsp;</td>
  <td class=xl59 width=83 style='width:62pt'><%=p_open_bal_usd%></td>
  <td class=xl58 width=100 style='width:75pt'><%=p_open_bal_vnd%></td>
  <td class=xl60>&nbsp;</td>
  <td class=xl61>&nbsp;</td>
 </tr>
        <%
    for (j = 0; j < dtloop_2.Rows.Count; j++)
    {
         
         %> 
 <tr class=xl50 height=40 style='height:30.0pt'>
  <td height=40 class=xl63 width=24 style='height:30.0pt;width:18pt' x:num><%= j+1 %></td>
  <td class=xl64 width=68 style='width:51pt' x:num><%= dtloop_2.Rows[j][0].ToString() %></td>
  <td class=xl65 width=56 style='width:42pt'></td>
  <td class=xl66 width=366 style='width:275pt'><%= dtloop_2.Rows[j][1].ToString() %></td>
  <td class=xl67 x:num><%= dtloop_2.Rows[j][12].ToString() %></td>
  <td class=xl68 x:num><%= dtloop_2.Rows[j][13].ToString() %></td>
  <td class=xl69 x:num><%= dtloop_2.Rows[j][14].ToString() %></td>
  <td class=xl70 x:num><%= dtloop_2.Rows[j][15].ToString() %></td>
  <td class=xl71>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl73 x:num><%= dtloop_2.Rows[j][10].ToString() %></td>
  <td class=xl74>&nbsp;</td>
 </tr>
<%
    }
}
 %> 
 <tr class=xl50 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl63 width=24 style='height:18.0pt;width:18pt'>&nbsp;</td>
  <td class=xl75 width=68 style='width:51pt' x:num="39601">2-Jun-08</td>
  <td class=xl76 width=56 style='width:42pt'>Kiet Kiet</td>
  <td class=xl77>Transfer fee</td>
  <td class=xl67>&nbsp;</td>
  <td class=xl78>&nbsp;</td>
  <td class=xl79 x:num="176">176.00 </td>
  <td class=xl70>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl73>&nbsp;</td>
  <td class=xl74>&nbsp;</td>
 </tr>
 <tr class=xl50 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl80 width=24 style='height:18.0pt;width:18pt'>&nbsp;</td>
  <td class=xl81 width=68 style='width:51pt'>&nbsp;</td>
  <td class=xl82 width=56 style='width:42pt'>&nbsp;</td>
  <td class=xl83>&nbsp;</td>
  <td class=xl84>&nbsp;</td>
  <td class=xl85>&nbsp;</td>
  <td class=xl86>&nbsp;</td>
  <td class=xl87>&nbsp;</td>
  <td class=xl88>&nbsp;</td>
  <td class=xl89>&nbsp;</td>
  <td class=xl90>&nbsp;</td>
  <td class=xl91>&nbsp;</td>
 </tr>
 <tr class=xl50 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=4 height=25 class=xl123 style='border-right:.5pt solid black;
  height:18.75pt' x:str="TOTAL ">TOTAL<span style='mso-spacerun:yes'> </span></td>
  <td class=xl92>&nbsp;</td>
  <td class=xl93>&nbsp;</td>
  <td class=xl92>&nbsp;</td>
  <td class=xl93>&nbsp;</td>
  <td class=xl92>&nbsp;</td>
  <td class=xl93>&nbsp;</td>
  <td class=xl94>&nbsp;</td>
  <td class=xl95>&nbsp;</td>
 </tr>
 <tr class=xl50 height=46 style='mso-height-source:userset;height:34.5pt'>
  <td height=46 class=xl96 style='height:34.5pt'>&nbsp;</td>
  <td class=xl97>&nbsp;</td>
  <td class=xl97>&nbsp;</td>
  <td class=xl97>&nbsp;</td>
  <td class=xl98>&nbsp;</td>
  <td class=xl99>&nbsp;</td>
  <td class=xl100>&nbsp;</td>
  <td class=xl101 width=98 style='width:74pt'>&nbsp;</td>
  <td class=xl102 width=83 style='width:62pt'>&nbsp;</td>
  <td class=xl101 width=100 style='width:75pt'>&nbsp;</td>
  <td class=xl103>&nbsp;</td>
  <td class=xl104>&nbsp;</td>
 </tr>
 <tr class=xl50 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=12 height=24 class=xl126 style='border-right:.5pt solid black;
  height:18.0pt'>2/ Employee Status</td>
 </tr>
 <tr class=xl62 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=3 height=24 class=xl129 style='border-right:.5pt solid black;
  height:18.0pt'>&nbsp;</td>
  <td class=xl107 x:str="Koreamen"><span
  style='mso-spacerun:yes'> </span>Koreamen<span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=2 class=xl133 style='border-right:.5pt solid black;border-left:
  none' x:str="Plant's Staff"><span style='mso-spacerun:yes'> </span>Plant's
  Staff<span style='mso-spacerun:yes'> </span></td>
  <td colspan=2 class=xl135 style='border-right:.5pt solid black;border-left:
  none' x:str=" Office's staff"><span style='mso-spacerun:yes'> 
  </span>Office's staff<span style='mso-spacerun:yes'> </span></td>
  <td class=xl108>&nbsp;</td>
  <td colspan=3 class=xl133 style='border-right:.5pt solid black' x:str="TOTAL"><span
  style='mso-spacerun:yes'> </span>TOTAL<span style='mso-spacerun:yes'> </span></td>
 </tr>
 <tr class=xl50 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=3 height=24 class=xl136 style='border-right:.5pt solid black;
  height:18.0pt'>&nbsp;</td>
  <td class=xl106>&nbsp;</td>
  <td colspan=2 class=xl136 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
  <td colspan=2 class=xl140 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
  <td class=xl105>&nbsp;</td>
  <td colspan=3 class=xl142 style='border-right:.5pt solid black' x:num="0">0 </td>
 </tr>
 <tr class=xl50 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=4 height=24 class=xl126 style='border-right:.5pt solid black;
  height:18.0pt'>Prepared by: Ms. TUYEN</td>
  <td class=xl109><u style='visibility:hidden;mso-ignore:visibility'>&nbsp;</u></td>
  <td colspan=7 class=xl126 style='border-right:.5pt solid black'>Checked by:
  Mr. CHO SUNG JUN</td>
 </tr>
 <tr class=xl50 height=67 style='mso-height-source:userset;height:50.25pt'>
  <td colspan=4 height=67 class=xl146 style='border-right:.5pt solid black;
  height:50.25pt'>&nbsp;</td>
  <td class=xl110>&nbsp;</td>
  <td colspan=7 class=xl146 style='border-right:.5pt solid black'>&nbsp;</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.95pt'>
  <td height=33 class=xl24 style='height:24.95pt'></td>
  <td colspan=2 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl24></td>
  <td class=xl26></td>
  <td class=xl24></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td class=xl24></td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.95pt'>
  <td height=33 class=xl24 style='height:24.95pt'></td>
  <td colspan=2 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl24></td>
  <td class=xl26></td>
  <td class=xl24></td>
  <td class=xl27></td>
  <td class=xl28></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td class=xl24></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=24 style='width:18pt'></td>
  <td width=68 style='width:51pt'></td>
  <td width=56 style='width:42pt'></td>
  <td width=366 style='width:275pt'></td>
  <td width=84 style='width:63pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=98 style='width:74pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=44 style='width:33pt'></td>
  <td width=54 style='width:41pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
