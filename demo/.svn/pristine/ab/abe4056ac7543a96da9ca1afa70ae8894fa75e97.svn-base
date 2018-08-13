<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<% Response.ContentType = "application/vnd.ms-excel"; %>
<% CtlLib.SetUser(Session["APP_DBUSER"].ToString());%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<% 
    string p_lang = Request.QueryString["p_lang"];
    string p_wh_type = Request.QueryString["p_wh_type"];
    string p_wh = Request.QueryString["p_wh"];
    string p_item_group = Request.QueryString["p_item_group"];
    string p_item = Request.QueryString["p_item"];
    string p_begin_01 = Request.QueryString["p_begin_01"];
    string p_end_01 = Request.QueryString["p_end_01"];
    string p_begin_02 = Request.QueryString["p_begin_02"];
    string p_end_02 = Request.QueryString["p_end_02"];
    string p_begin_03 = Request.QueryString["p_begin_03"];
    string p_end_03 = Request.QueryString["p_end_03"];
    string p_begin_04 = Request.QueryString["p_begin_04"];
    string p_end_04 = Request.QueryString["p_end_04"];
    string p_rad_type = Request.QueryString["p_rad_type"];
    string p_month = Request.QueryString["p_month"];
    
    string str_sql = @"SELECT partner_name, addr1, phone_no, fax_no, tax_code, tco_bpphoto_pk
                       FROM tco_company
                       WHERE del_if = 0 AND pk = (SELECT MAX (pk)
                                                  FROM tco_company
                                                  WHERE del_if = 0 AND active_yn = 'Y')";
    string str_sql1 = "SELECT wh_name FROM tlg_in_warehouse WHERE del_if = 0 and pk = '" + p_wh+"'";
    DataTable dt = CtlLib.TableReadOpen(str_sql);
    DataTable dt3 = CtlLib.TableReadOpen(str_sql1);
    string para = "", para1 = "";
    para = "'" + p_lang + "','" + p_wh_type + "','" + p_wh + "','" + p_item_group + "','" + p_item + "','" + p_begin_01 + "','" + p_end_01 + "','" + p_begin_02 + "','" + p_end_02 + "','" + p_begin_03 + "','" + p_end_03 + "','" + p_begin_04 + "','" + p_end_04 + "'";
    para1 = "'" + p_month + "','" + p_rad_type + "'";
    DataTable dt1 = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00050", para1);
    DataTable dt2 = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00050_1", para);        
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_bisc00050_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_bisc00050_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_bisc00050_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>VNG</o:Author>
  <o:LastAuthor>Trung</o:LastAuthor>
  <o:LastPrinted>2011-11-26T02:07:44Z</o:LastPrinted>
  <o:Created>2011-11-15T06:42:07Z</o:Created>
  <o:LastSaved>2011-11-26T02:56:06Z</o:LastSaved>
  <o:Company>Vinagenuwin</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"Page &P of &N";
	margin:.32in .17in .28in .17in;
	mso-header-margin:.35in;
	mso-footer-margin:.25in;
	mso-page-orientation:landscape;}
.font7
	{color:windowtext;
	font-size:8.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font9
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font14
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
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
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial;
	mso-generic-font-family:auto;
	mso-font-charset:129;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal;
	mso-style-id:0;}
.style20
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
	mso-style-name:Normal_PNAP;}
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
	mso-font-charset:129;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl25
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl26
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl28
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl31
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl36
	{mso-style-parent:style20;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl37
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl38
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;}
.xl41
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl42
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:normal;}
.xl43
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl44
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl45
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl46
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl47
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl48
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:normal;}
.xl49
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl50
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl51
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl52
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl53
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl54
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl55
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl56
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl57
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl58
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl59
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl60
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:normal;}
.xl61
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl62
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl63
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl64
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl65
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:none;
	border-left:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>WH CHK</x:Name>
    <x:WorksheetOptions>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:Scale>61</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>15</x:ActiveRow>
       <x:ActiveCol>2</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>8700</x:WindowHeight>
  <x:WindowWidth>15480</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>='WH CHK'!$6:$7</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="10241"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="9"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl37>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1590 style='border-collapse:
 collapse;table-layout:fixed;width:1190pt'>
 <col class=xl37 width=90 style='mso-width-source:userset;mso-width-alt:3291;
 width:68pt'>
 <col class=xl37 width=70 style='mso-width-source:userset;mso-width-alt:2560;
 width:53pt'>
 <col class=xl37 width=180 style='mso-width-source:userset;mso-width-alt:6582;
 width:135pt'>
 <col class=xl37 width=50 style='mso-width-source:userset;mso-width-alt:1828;
 width:38pt'>
 <col class=xl37 width=75 span=16 style='mso-width-source:userset;mso-width-alt:
 2742;width:56pt'>
 <tr class=xl25 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=2 rowspan=3 height=72 width=160 style='height:54.0pt;width:121pt'
  align=left valign=top><v:shape id="_x0000_s1025" type="#_x0000_t75" style='position:absolute;
   margin-left:1.5pt;margin-top:1.5pt;width:75pt;height:42pt;z-index:1'>
   <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt.Rows[0]["tco_bpphoto_pk"]%>&table_name=<%=Session["APP_DBUSER"].ToString()%>.tco_bpphoto" o:title="logo"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape></td>
  <td colspan=16 rowspan=3 class=xl64 width=1280 style='width:957pt'>W/H STOCK
  CHECKING<br>
    ( <%=dt1.Rows[0]["day_01"]%> ~ <%=dt1.Rows[0]["end_04"]%> )</td>
  <td class=xl60 width=75 style='width:56pt'></td>
  <td class=xl60 width=75 style='width:56pt'></td>
 </tr>
 <tr class=xl25 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=2 class=xl60 style='height:18.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl25 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=2 class=xl60 style='height:18.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl26 height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl30 style='height:22.5pt'>Kho<font class="font9"> </font><font
  class="font14">W/H</font></td>
  <%
      if (dt3.Rows.Count > 0)
      {
          %>
          <td class=xl43 colspan=4 style='mso-ignore:colspan'><%=dt3.Rows[0]["wh_name"] %></td>
          <% 
      }
      else
      {
        %>
            <td class=xl43 colspan=4 style='mso-ignore:colspan'></td>
        <%
      }
   %>
  
  <td class=xl26></td>
  <td class=xl40></td>
  <td class=xl36></td>
  <td class=xl26></td>
  <td class=xl27></td>
  <td class=xl26></td>
  <td class=xl30></td>
  <td colspan=7 class=xl26 style='mso-ignore:colspan'></td>
  <td class=xl40>Print Date: <%=DateTime.Now.ToString("dd/MM/yyyy HH:mm") %></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=20 class=xl37 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td rowspan=2 height=70 class=xl71 width=90 style='border-bottom:.5pt solid black;
  height:52.5pt;width:68pt'>Nhóm<br>
    <font class="font7">Group</font></td>
  <td rowspan=2 class=xl73 width=70 style='border-bottom:.5pt solid black;
  width:53pt'>Mã hàng<br>
    <font class="font7">Item Code</font></td>
  <td rowspan=2 class=xl73 width=180 style='border-bottom:.5pt solid black;
  width:135pt'>Tên hàng<br>
    <font class="font7">Item Description</font></td>
  <td rowspan=2 class=xl75 width=50 style='border-bottom:.5pt solid black;
  width:38pt'>&#272;VT<br>
    <font class="font7">Unit</font></td>
  <td colspan=4 class=xl61 width=300 style='border-right:.5pt solid black;
  border-left:none;width:224pt'><%=dt1.Rows[0]["date_1"] %></td>
  <td colspan=4 class=xl61 width=300 style='border-right:.5pt solid black;
  border-left:none;width:224pt'><%=dt1.Rows[0]["date_2"] %></td>
  <td colspan=4 class=xl61 width=300 style='border-right:.5pt solid black;
  border-left:none;width:224pt'><%=dt1.Rows[0]["date_3"] %></td>
  <td colspan=4 class=xl61 width=300 style='border-right:.5pt solid black;
  border-left:none;width:224pt'><%=dt1.Rows[0]["date_4"] %></td>
 </tr>
 <tr height=39 style='mso-height-source:userset;height:29.25pt'>
  <td height=39 class=xl28 width=75 style='height:29.25pt;border-top:none;
  border-left:none;width:56pt'>D&#432; &#273;&#7847;u <br>
    <font class="font7">Begin Qty</font></td>
  <td class=xl29 width=75 style='border-top:none;border-left:none;width:56pt'>S&#7889;
  nh&#7853;p<br>
    <font class="font7">In Qty</font></td>
  <td class=xl29 width=75 style='border-top:none;border-left:none;width:56pt'>S&#7889;
  xu&#7845;t<br>
    <font class="font7">Out Qty</font></td>
  <td class=xl31 width=75 style='border-top:none;border-left:none;width:56pt'>S&#7889;
  t&#7891;n<br>
    <font class="font7">End Qty</font></td>
  <td class=xl28 width=75 style='border-top:none;border-left:none;width:56pt'>D&#432;
  &#273;&#7847;u <br>
    <font class="font7">Begin Qty</font></td>
  <td class=xl29 width=75 style='border-top:none;border-left:none;width:56pt'>S&#7889;
  nh&#7853;p<br>
    <font class="font7">In Qty</font></td>
  <td class=xl29 width=75 style='border-top:none;border-left:none;width:56pt'>S&#7889;
  xu&#7845;t<br>
    <font class="font7">Out Qty</font></td>
  <td class=xl31 width=75 style='border-top:none;border-left:none;width:56pt'>S&#7889;
  t&#7891;n<br>
    <font class="font7">End Qty</font></td>
  <td class=xl28 width=75 style='border-top:none;border-left:none;width:56pt'>D&#432;
  &#273;&#7847;u <br>
    <font class="font7">Begin Qty</font></td>
  <td class=xl29 width=75 style='border-top:none;border-left:none;width:56pt'>S&#7889;
  nh&#7853;p<br>
    <font class="font7">In Qty</font></td>
  <td class=xl29 width=75 style='border-top:none;border-left:none;width:56pt'>S&#7889;
  xu&#7845;t<br>
    <font class="font7">Out Qty</font></td>
  <td class=xl31 width=75 style='border-top:none;border-left:none;width:56pt'>S&#7889;
  t&#7891;n<br>
    <font class="font7">End Qty</font></td>
  <td class=xl28 width=75 style='border-top:none;border-left:none;width:56pt'>D&#432;
  &#273;&#7847;u <br>
    <font class="font7">Begin Qty</font></td>
  <td class=xl29 width=75 style='border-top:none;border-left:none;width:56pt'>S&#7889;
  nh&#7853;p<br>
    <font class="font7">In Qty</font></td>
  <td class=xl29 width=75 style='border-top:none;border-left:none;width:56pt'>S&#7889;
  xu&#7845;t<br>
    <font class="font7">Out Qty</font></td>
  <td class=xl31 width=75 style='border-top:none;border-left:none;width:56pt'>S&#7889;
  t&#7891;n<br>
    <font class="font7">End Qty</font></td>
 </tr>
 <%
     double sub_to_1 = 0, sub_to_2 = 0, sub_to_3 = 0, sub_to_4 = 0, sub_to_5 = 0, sub_to_6 = 0, sub_to_7 = 0, sub_to_8 = 0;
     double sub_to_9 = 0, sub_to_10 = 0, sub_to_11 = 0, sub_to_12 = 0, sub_to_13 = 0, sub_to_14 = 0, sub_to_15 = 0, sub_to_16 = 0;
     double fin_to_1 = 0, fin_to_2 = 0, fin_to_3 = 0, fin_to_4 = 0, fin_to_5 = 0, fin_to_6 = 0, fin_to_7 = 0, fin_to_8 = 0;
     double fin_to_9 = 0, fin_to_10 = 0, fin_to_11 = 0, fin_to_12 = 0, fin_to_13 = 0, fin_to_14 = 0, fin_to_15 = 0, fin_to_16 = 0;
     if(dt2.Rows.Count>0)
     {
         sub_to_1 = sub_to_1 + CommondLib.ConvertToDbl(dt2.Rows[0]["begin_qty_01"]);
         sub_to_2 = sub_to_2 + CommondLib.ConvertToDbl(dt2.Rows[0]["in_qty_01"]);
         sub_to_3 = sub_to_3 + CommondLib.ConvertToDbl(dt2.Rows[0]["out_qty_01"]);
         sub_to_4 = sub_to_4 + CommondLib.ConvertToDbl(dt2.Rows[0]["end_qty_01"]);
         sub_to_5 = sub_to_5 + CommondLib.ConvertToDbl(dt2.Rows[0]["begin_qty_02"]);
         sub_to_6 = sub_to_6 + CommondLib.ConvertToDbl(dt2.Rows[0]["in_qty_02"]);
         sub_to_7 = sub_to_7 + CommondLib.ConvertToDbl(dt2.Rows[0]["out_qty_02"]);
         sub_to_8 = sub_to_8 + CommondLib.ConvertToDbl(dt2.Rows[0]["end_qty_02"]);
         sub_to_9 = sub_to_9 + CommondLib.ConvertToDbl(dt2.Rows[0]["begin_qty_03"]);
         sub_to_10 = sub_to_10 + CommondLib.ConvertToDbl(dt2.Rows[0]["in_qty_03"]);
         sub_to_11 = sub_to_11 + CommondLib.ConvertToDbl(dt2.Rows[0]["out_qty_03"]);
         sub_to_12 = sub_to_12 + CommondLib.ConvertToDbl(dt2.Rows[0]["end_qty_03"]);
         sub_to_13 = sub_to_13 + CommondLib.ConvertToDbl(dt2.Rows[0]["begin_qty_04"]);
         sub_to_14 = sub_to_14 + CommondLib.ConvertToDbl(dt2.Rows[0]["in_qty_04"]);
         sub_to_15 = sub_to_15 + CommondLib.ConvertToDbl(dt2.Rows[0]["out_qty_04"]);
         sub_to_16 = sub_to_16 + CommondLib.ConvertToDbl(dt2.Rows[0]["end_qty_04"]);

         fin_to_1 = fin_to_1 + CommondLib.ConvertToDbl(dt2.Rows[0]["begin_qty_01"]);
         fin_to_2 = fin_to_2 + CommondLib.ConvertToDbl(dt2.Rows[0]["in_qty_01"]);
         fin_to_3 = fin_to_3 + CommondLib.ConvertToDbl(dt2.Rows[0]["out_qty_01"]);
         fin_to_4 = fin_to_4 + CommondLib.ConvertToDbl(dt2.Rows[0]["end_qty_01"]);
         fin_to_5 = fin_to_5 + CommondLib.ConvertToDbl(dt2.Rows[0]["begin_qty_02"]);
         fin_to_6 = fin_to_6 + CommondLib.ConvertToDbl(dt2.Rows[0]["in_qty_02"]);
         fin_to_7 = fin_to_7 + CommondLib.ConvertToDbl(dt2.Rows[0]["out_qty_02"]);
         fin_to_8 = fin_to_8 + CommondLib.ConvertToDbl(dt2.Rows[0]["end_qty_02"]);
         fin_to_9 = fin_to_9 + CommondLib.ConvertToDbl(dt2.Rows[0]["begin_qty_03"]);
         fin_to_10 = fin_to_10 + CommondLib.ConvertToDbl(dt2.Rows[0]["in_qty_03"]);
         fin_to_11 = fin_to_11 + CommondLib.ConvertToDbl(dt2.Rows[0]["out_qty_03"]);
         fin_to_12 = fin_to_12 + CommondLib.ConvertToDbl(dt2.Rows[0]["end_qty_03"]);
         fin_to_13 = fin_to_13 + CommondLib.ConvertToDbl(dt2.Rows[0]["begin_qty_04"]);
         fin_to_14 = fin_to_14 + CommondLib.ConvertToDbl(dt2.Rows[0]["in_qty_04"]);
         fin_to_15 = fin_to_15 + CommondLib.ConvertToDbl(dt2.Rows[0]["out_qty_04"]);
         fin_to_16 = fin_to_16 + CommondLib.ConvertToDbl(dt2.Rows[0]["end_qty_04"]);
         
        %>
<tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 class=xl39 width=90 style='height:26.25pt;border-top:none;width:68pt'><%=dt2.Rows[0]["grp_nm"] %></td>
  <td class=xl34 width=70 style='border-top:none;border-left:none;width:53pt'x:num><%=dt2.Rows[0]["item_code"] %></td>
  <td class=xl42 width=180 style='border-top:none;border-left:none;width:135pt'><%=dt2.Rows[0]["item_name"] %></td>
  <td class=xl35 width=50 style='border-top:none;border-left:none;width:38pt'><%=dt2.Rows[0]["uom"] %></td>
  <td class=xl47 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[0]["begin_qty_01"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[0]["in_qty_01"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[0]["out_qty_01"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[0]["end_qty_01"] %></td>
  <td class=xl47 width=75 style='border-top:none;width:56pt' x:num><%=dt2.Rows[0]["begin_qty_02"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[0]["in_qty_02"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[0]["out_qty_02"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[0]["end_qty_02"] %></td>
  <td class=xl47 width=75 style='border-top:none;width:56pt' x:num><%=dt2.Rows[0]["begin_qty_03"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[0]["in_qty_03"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[0]["out_qty_03"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[0]["end_qty_03"] %></td>
  <td class=xl47 width=75 style='border-top:none;width:56pt' x:num><%=dt2.Rows[0]["begin_qty_04"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[0]["in_qty_04"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[0]["out_qty_04"] %></td>
  <td class=xl49 width=75 style='border-top:none;border-left:none;width:56pt'><%=dt2.Rows[0]["end_qty_04"] %></td>
 </tr>
        <%
     }
%>
<%
    for (int i = 1; i < dt2.Rows.Count; i++)
    {
        if (Convert.ToString(dt2.Rows[i]["tlg_it_item_pk"]) == Convert.ToString(dt2.Rows[i - 1]["tlg_it_item_pk"]))
        {
            sub_to_1 = sub_to_1 + CommondLib.ConvertToDbl(dt2.Rows[i]["begin_qty_01"]);
            sub_to_2 = sub_to_2 + CommondLib.ConvertToDbl(dt2.Rows[i]["in_qty_01"]);
            sub_to_3 = sub_to_3 + CommondLib.ConvertToDbl(dt2.Rows[i]["out_qty_01"]);
            sub_to_4 = sub_to_4 + CommondLib.ConvertToDbl(dt2.Rows[i]["end_qty_01"]);
            sub_to_5 = sub_to_5 + CommondLib.ConvertToDbl(dt2.Rows[i]["begin_qty_02"]);
            sub_to_6 = sub_to_6 + CommondLib.ConvertToDbl(dt2.Rows[i]["in_qty_02"]);
            sub_to_7 = sub_to_7 + CommondLib.ConvertToDbl(dt2.Rows[i]["out_qty_02"]);
            sub_to_8 = sub_to_8 + CommondLib.ConvertToDbl(dt2.Rows[i]["end_qty_02"]);
            sub_to_9 = sub_to_9 + CommondLib.ConvertToDbl(dt2.Rows[i]["begin_qty_03"]);
            sub_to_10 = sub_to_10 + CommondLib.ConvertToDbl(dt2.Rows[i]["in_qty_03"]);
            sub_to_11 = sub_to_11 + CommondLib.ConvertToDbl(dt2.Rows[i]["out_qty_03"]);
            sub_to_12 = sub_to_12 + CommondLib.ConvertToDbl(dt2.Rows[i]["end_qty_03"]);
            sub_to_13 = sub_to_13 + CommondLib.ConvertToDbl(dt2.Rows[i]["begin_qty_04"]);
            sub_to_14 = sub_to_14 + CommondLib.ConvertToDbl(dt2.Rows[i]["in_qty_04"]);
            sub_to_15 = sub_to_15 + CommondLib.ConvertToDbl(dt2.Rows[i]["out_qty_04"]);
            sub_to_16 = sub_to_16 + CommondLib.ConvertToDbl(dt2.Rows[i]["end_qty_04"]);
            
            
            fin_to_1 = fin_to_1 + CommondLib.ConvertToDbl(dt2.Rows[i]["begin_qty_01"]);
            fin_to_2 = fin_to_2 + CommondLib.ConvertToDbl(dt2.Rows[i]["in_qty_01"]);
            fin_to_3 = fin_to_3 + CommondLib.ConvertToDbl(dt2.Rows[i]["out_qty_01"]);
            fin_to_4 = fin_to_4 + CommondLib.ConvertToDbl(dt2.Rows[i]["end_qty_01"]);
            fin_to_5 = fin_to_5 + CommondLib.ConvertToDbl(dt2.Rows[i]["begin_qty_02"]);
            fin_to_6 = fin_to_6 + CommondLib.ConvertToDbl(dt2.Rows[i]["in_qty_02"]);
            fin_to_7 = fin_to_7 + CommondLib.ConvertToDbl(dt2.Rows[i]["out_qty_02"]);
            fin_to_8 = fin_to_8 + CommondLib.ConvertToDbl(dt2.Rows[i]["end_qty_02"]);
            fin_to_9 = fin_to_9 + CommondLib.ConvertToDbl(dt2.Rows[i]["begin_qty_03"]);
            fin_to_10 = fin_to_10 + CommondLib.ConvertToDbl(dt2.Rows[i]["in_qty_03"]);
            fin_to_11 = fin_to_11 + CommondLib.ConvertToDbl(dt2.Rows[i]["out_qty_03"]);
            fin_to_12 = fin_to_12 + CommondLib.ConvertToDbl(dt2.Rows[i]["end_qty_03"]);
            fin_to_13 = fin_to_13 + CommondLib.ConvertToDbl(dt2.Rows[i]["begin_qty_04"]);
            fin_to_14 = fin_to_14 + CommondLib.ConvertToDbl(dt2.Rows[i]["in_qty_04"]);
            fin_to_15 = fin_to_15 + CommondLib.ConvertToDbl(dt2.Rows[i]["out_qty_04"]);
            fin_to_16 = fin_to_16 + CommondLib.ConvertToDbl(dt2.Rows[i]["end_qty_04"]);
            
            %>
<tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 class=xl39 width=90 style='height:26.25pt;border-top:none;width:68pt'><%=dt2.Rows[i]["grp_nm"] %></td>
  <td class=xl34 width=70 style='border-top:none;border-left:none;width:53pt'><%=dt2.Rows[i]["item_code"] %></td>
  <td class=xl42 width=180 style='border-top:none;border-left:none;width:135pt'><%=dt2.Rows[i]["item_name"] %></td>
  <td class=xl35 width=50 style='border-top:none;border-left:none;width:38pt'><%=dt2.Rows[i]["uom"] %></td>
  <td class=xl47 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["begin_qty_01"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["in_qty_01"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["out_qty_01"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["end_qty_01"] %></td>
  <td class=xl47 width=75 style='border-top:none;width:56pt' x:num><%=dt2.Rows[i]["begin_qty_02"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["in_qty_02"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["out_qty_02"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["end_qty_02"] %></td>
  <td class=xl47 width=75 style='border-top:none;width:56pt' x:num><%=dt2.Rows[i]["begin_qty_03"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["in_qty_03"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["out_qty_03"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["end_qty_03"] %></td>
  <td class=xl47 width=75 style='border-top:none;width:56pt' x:num><%=dt2.Rows[i]["begin_qty_04"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["in_qty_04"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["out_qty_04"] %></td>
  <td class=xl49 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["end_qty_04"] %></td>
 </tr>
            <% 
    }
    else
    {
            %>
<tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=4 height=25 class=xl77 width=390 style='border-right:.5pt solid black;
  height:18.75pt;width:294pt'>Sub Total</td>
  <td class=xl50 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_1 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_2 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_3 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_4 %></td>
  <td class=xl50 width=75 style='border-top:none;width:56pt' x:num><%=sub_to_5 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_6 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_7 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_8 %></td>
  <td class=xl50 width=75 style='border-top:none;width:56pt' x:num><%=sub_to_9 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_10 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_11 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_12 %></td>
  <td class=xl50 width=75 style='border-top:none;width:56pt' x:num><%=sub_to_13 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_14 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_15 %></td>
  <td class=xl52 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_16 %></td> 
</tr>
<tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 class=xl39 width=90 style='height:26.25pt;border-top:none;width:68pt'><%=dt2.Rows[i]["grp_nm"] %></td>
  <td class=xl34 width=70 style='border-top:none;border-left:none;width:53pt'><%=dt2.Rows[i]["item_code"] %></td>
  <td class=xl42 width=180 style='border-top:none;border-left:none;width:135pt'><%=dt2.Rows[i]["item_name"] %></td>
  <td class=xl35 width=50 style='border-top:none;border-left:none;width:38pt'><%=dt2.Rows[i]["uom"] %></td>
  <td class=xl47 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["begin_qty_01"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["in_qty_01"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["out_qty_01"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["end_qty_01"] %></td>
  <td class=xl47 width=75 style='border-top:none;width:56pt' x:num><%=dt2.Rows[i]["begin_qty_02"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["in_qty_02"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["out_qty_02"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["end_qty_02"] %></td>
  <td class=xl47 width=75 style='border-top:none;width:56pt' x:num><%=dt2.Rows[i]["begin_qty_03"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["in_qty_03"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["out_qty_03"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["end_qty_03"] %></td>
  <td class=xl47 width=75 style='border-top:none;width:56pt' x:num><%=dt2.Rows[i]["begin_qty_04"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["in_qty_04"] %></td>
  <td class=xl48 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["out_qty_04"] %></td>
  <td class=xl49 width=75 style='border-top:none;border-left:none;width:56pt'x:num><%=dt2.Rows[i]["end_qty_04"] %></td>
 </tr>
            <%
                sub_to_1 = 0;
                sub_to_2 = 0;
                sub_to_3 = 0;
                sub_to_4 = 0;
                sub_to_5 = 0;
                sub_to_6 = 0;
                sub_to_7 = 0;
                sub_to_8 = 0;
                sub_to_9 = 0;
                sub_to_10 = 0;
                sub_to_11 = 0;
                sub_to_12 = 0;
                sub_to_13 = 0;
                sub_to_14 = 0;
                sub_to_15 = 0;
                sub_to_16 = 0;
                sub_to_1 = sub_to_1 + CommondLib.ConvertToDbl(dt2.Rows[i]["begin_qty_01"]);
                sub_to_2 = sub_to_2 + CommondLib.ConvertToDbl(dt2.Rows[i]["in_qty_01"]);
                sub_to_3 = sub_to_3 + CommondLib.ConvertToDbl(dt2.Rows[i]["out_qty_01"]);
                sub_to_4 = sub_to_4 + CommondLib.ConvertToDbl(dt2.Rows[i]["end_qty_01"]);
                sub_to_5 = sub_to_5 + CommondLib.ConvertToDbl(dt2.Rows[i]["begin_qty_02"]);
                sub_to_6 = sub_to_6 + CommondLib.ConvertToDbl(dt2.Rows[i]["in_qty_02"]);
                sub_to_7 = sub_to_7 + CommondLib.ConvertToDbl(dt2.Rows[i]["out_qty_02"]);
                sub_to_8 = sub_to_8 + CommondLib.ConvertToDbl(dt2.Rows[i]["end_qty_02"]);
                sub_to_9 = sub_to_9 + CommondLib.ConvertToDbl(dt2.Rows[i]["begin_qty_03"]);
                sub_to_10 = sub_to_10 + CommondLib.ConvertToDbl(dt2.Rows[i]["in_qty_03"]);
                sub_to_11 = sub_to_11 + CommondLib.ConvertToDbl(dt2.Rows[i]["out_qty_03"]);
                sub_to_12 = sub_to_12 + CommondLib.ConvertToDbl(dt2.Rows[i]["end_qty_03"]);
                sub_to_13 = sub_to_13 + CommondLib.ConvertToDbl(dt2.Rows[i]["begin_qty_04"]);
                sub_to_14 = sub_to_14 + CommondLib.ConvertToDbl(dt2.Rows[i]["in_qty_04"]);
                sub_to_15 = sub_to_15 + CommondLib.ConvertToDbl(dt2.Rows[i]["out_qty_04"]);
                sub_to_16 = sub_to_16 + CommondLib.ConvertToDbl(dt2.Rows[i]["end_qty_04"]);
            
                fin_to_1 = fin_to_1 + CommondLib.ConvertToDbl(dt2.Rows[i]["begin_qty_01"]);
                fin_to_2 = fin_to_2 + CommondLib.ConvertToDbl(dt2.Rows[i]["in_qty_01"]);
                fin_to_3 = fin_to_3 + CommondLib.ConvertToDbl(dt2.Rows[i]["out_qty_01"]);
                fin_to_4 = fin_to_4 + CommondLib.ConvertToDbl(dt2.Rows[i]["end_qty_01"]);
                fin_to_5 = fin_to_5 + CommondLib.ConvertToDbl(dt2.Rows[i]["begin_qty_02"]);
                fin_to_6 = fin_to_6 + CommondLib.ConvertToDbl(dt2.Rows[i]["in_qty_02"]);
                fin_to_7 = fin_to_7 + CommondLib.ConvertToDbl(dt2.Rows[i]["out_qty_02"]);
                fin_to_8 = fin_to_8 + CommondLib.ConvertToDbl(dt2.Rows[i]["end_qty_02"]);
                fin_to_9 = fin_to_9 + CommondLib.ConvertToDbl(dt2.Rows[i]["begin_qty_03"]);
                fin_to_10 = fin_to_10 + CommondLib.ConvertToDbl(dt2.Rows[i]["in_qty_03"]);
                fin_to_11 = fin_to_11 + CommondLib.ConvertToDbl(dt2.Rows[i]["out_qty_03"]);
                fin_to_12 = fin_to_12 + CommondLib.ConvertToDbl(dt2.Rows[i]["end_qty_03"]);
                fin_to_13 = fin_to_13 + CommondLib.ConvertToDbl(dt2.Rows[i]["begin_qty_04"]);
                fin_to_14 = fin_to_14 + CommondLib.ConvertToDbl(dt2.Rows[i]["in_qty_04"]);
                fin_to_15 = fin_to_15 + CommondLib.ConvertToDbl(dt2.Rows[i]["out_qty_04"]);
                fin_to_16 = fin_to_16 + CommondLib.ConvertToDbl(dt2.Rows[i]["end_qty_04"]);
    }
    }
 %>
<tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=4 height=25 class=xl77 width=390 style='border-right:.5pt solid black;
  height:18.75pt;width:294pt'>Sub Total</td>
  <td class=xl50 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_1 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_2 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_3 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_4 %></td>
  <td class=xl50 width=75 style='border-top:none;width:56pt' x:num><%=sub_to_5 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_6 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_7 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_8 %></td>
  <td class=xl50 width=75 style='border-top:none;width:56pt' x:num><%=sub_to_9 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_10 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_11 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_12 %></td>
  <td class=xl50 width=75 style='border-top:none;width:56pt' x:num><%=sub_to_13 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_14 %></td>
  <td class=xl51 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_15 %></td>
  <td class=xl52 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=sub_to_16 %></td> 
</tr>
 <tr class=xl59 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=4 height=25 class=xl68 width=390 style='border-right:.5pt solid black;
  height:18.75pt;width:294pt'>TOTAL</td>
  <td class=xl56 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=fin_to_1 %></td>
  <td class=xl57 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=fin_to_2 %></td>
  <td class=xl57 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=fin_to_3 %></td>
  <td class=xl58 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=fin_to_4 %></td>
  <td class=xl56 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=fin_to_5 %></td>
  <td class=xl57 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=fin_to_6 %></td>
  <td class=xl57 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=fin_to_7 %></td>
  <td class=xl58 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=fin_to_8 %></td>
  <td class=xl56 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=fin_to_9 %></td>
  <td class=xl57 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=fin_to_10 %></td>
  <td class=xl57 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=fin_to_11 %></td>
  <td class=xl58 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=fin_to_12 %></td>
  <td class=xl56 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=fin_to_13 %></td>
  <td class=xl57 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=fin_to_14 %></td>
  <td class=xl57 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=fin_to_15 %></td>
  <td class=xl58 width=75 style='border-top:none;border-left:none;width:56pt'
  x:num><%=fin_to_16 %></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 colspan=20 class=xl37 style='height:21.0pt;mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=90 style='width:68pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=180 style='width:135pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=75 style='width:56pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
