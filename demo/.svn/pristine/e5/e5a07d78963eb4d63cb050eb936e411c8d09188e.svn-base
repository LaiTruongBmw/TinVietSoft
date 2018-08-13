<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>

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
    string l_user = Session["APP_DBUSER"].ToString() + ".";
    
    string p_master_pk = Request.QueryString["master_pk"];
    string para = "'" + p_master_pk + "'";
    DataTable dt, dt1, dt2;
    dt = CtlLib.TableReadOpenCursor("st_lg__rpt_dscd00073");
    dt1 = CtlLib.TableReadOpenCursor("st_lg__rpt_dscd00073_1", para);
    dt2 = CtlLib.TableReadOpenCursor("st_lg__rpt_dscd00073_2", para);
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="test_files/filelist.xml">
<link rel=Edit-Time-Data href="test_files/editdata.mso">
<link rel=OLE-Object-Data href="test_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Mr Khanh</o:LastAuthor>
  <o:LastPrinted>2011-09-16T06:05:25Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2011-09-16T06:08:14Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"&L&G&CPage &P of &N";
	margin:.33in .28in .4in .32in;
	mso-header-margin:.26in;
	mso-footer-margin:0in;}
.font5
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font6
	{color:windowtext;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font7
	{color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font8
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font10
	{color:windowtext;
	font-size:14.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font11
	{color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font12
	{color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font14
	{color:windowtext;
	font-size:8.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font15
	{color:black;
	font-size:8.0pt;
	font-weight:400;
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
.style22
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:\B3CB\C6C0, monospace;
	mso-font-charset:129;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal_Sheet1;}
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
.xl25
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl27
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl29
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl30
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl31
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl32
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl33
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl36
	{mso-style-parent:style22;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl41
	{mso-style-parent:style16;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl42
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:top;}
.xl43
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:right;}
.xl44
	{mso-style-parent:style16;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl45
	{mso-style-parent:style16;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl46
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	white-space:normal;}
.xl47
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl48
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl49
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl50
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl51
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl52
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl53
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl54
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl55
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl56
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl57
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl58
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl59
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl60
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl61
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl62
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid black;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl63
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl64
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl65
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl66
	{mso-style-parent:style22;
	color:black;
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
.xl67
	{mso-style-parent:style22;
	color:black;
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
.xl68
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl69
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl71
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl72
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl76
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl77
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl78
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl80
	{mso-style-parent:style22;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl81
	{mso-style-parent:style22;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl82
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl83
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl85
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl86
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>95</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>4</x:ActiveRow>
       <x:ActiveCol>10</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>9690</x:WindowHeight>
  <x:WindowWidth>19080</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>255</x:WindowTopY>
  <x:AcceptLabelsInFormulas/>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$12:$13</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl25>

<table x:str border=0 cellpadding=0 cellspacing=0 width=731 style='border-collapse:
 collapse;table-layout:fixed;width:551pt'>
 <col class=xl25 width=31 style='mso-width-source:userset;mso-width-alt:1133;
 width:23pt'>
 <col class=xl25 width=90 style='mso-width-source:userset;mso-width-alt:3291;
 width:68pt'>
 <col class=xl25 width=160 style='mso-width-source:userset;mso-width-alt:5851;
 width:120pt'>
 <col class=xl25 width=90 style='mso-width-source:userset;mso-width-alt:3291;
 width:68pt'>
 <col class=xl25 width=50 style='mso-width-source:userset;mso-width-alt:1828;
 width:38pt'>
 <col class=xl25 width=70 span=2 style='mso-width-source:userset;mso-width-alt:
 2560;width:53pt'>
 <col class=xl25 width=80 style='mso-width-source:userset;mso-width-alt:2925;
 width:60pt'>
 <col class=xl25 width=90 style='mso-width-source:userset;mso-width-alt:3291;
 width:68pt'>
 <tr class=xl26 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 rowspan=3 height=20 class=xl80 width=121 style='border-bottom:
  2.0pt double black;height:15.0pt;width:91pt'><!--[if gte vml 1]><v:shape
   id="_x0000_s1025" style='position:absolute;margin-left:6pt;margin-top:3.75pt;
   width:81pt;height:37.5pt;z-index:1;visibility:visible' coordsize="21600,21600"
   o:spt="100" o:preferrelative="t" adj="0,,0" path="m@4@5l@4@11@9@11@9@5xe"
   filled="f" stroked="f">
   <v:stroke joinstyle="miter"/>
   <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt.Rows[0]["tco_bpphoto_pk"]%>&table_name=<%=l_user%>tco_bpphoto" o:title="img00001"/>
   <v:formulas/>
   <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/>
   <o:lock v:ext="edit" aspectratio="t"/>
   <x:ClientData ObjectType="Pict">
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]-->LOGO</td>
  <td colspan=4 class=xl82 width=370 style='width:279pt'><%= dt.Rows[0]["partner_name"]%></td>
  <td colspan=3 class=xl83 width=240 style='width:181pt'>Tel: <%= dt.Rows[0]["phone_no"]%></td>
 </tr>
 <tr class=xl26 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=4 height=20 class=xl84 style='height:15.0pt'><%= dt.Rows[0]["addr1"]%></td>
  <td colspan=3 class=xl83 width=240 style='width:181pt'>Fax: <%= dt.Rows[0]["fax_no"]%></td>
 </tr>
 <tr class=xl26 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=4 height=20 class=xl85 style='height:15.0pt'>Tax No: <%= dt.Rows[0]["tax_code"]%></td>
  <td colspan=3 class=xl86 width=240 style='width:181pt'>Print date :
  <%= DateTime.Now.ToString("dd/MM/yyyy HH:mm") %></td>
 </tr>
 <tr height=70 style='mso-height-source:userset;height:52.5pt'>
  <td colspan=9 height=70 class=xl74 width=731 style='height:52.5pt;width:551pt'>PHI&#7870;U
  XU&#7844;T KHO THÀNH PH&#7848;M<br>
    <font class="font10">( GOODS DELIVERY )</font></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=9 height=20 class=xl75 style='height:15.0pt'><span
  style='mso-spacerun:yes'> </span><font class="font5">S&#7889; :</font><font
  class="font11"> </font><font class="font12"><%= dt1.Rows[0]["slip_no"]%></font><font class="font5"><span
  style='mso-spacerun:yes'>  </span>/</font><font class="font11"> </font><font
  class="font5">Ngày</font><font class="font11"> <%= dt1.Rows[0]["out_dd"]%></font><font class="font5">
  Tháng </font><font class="font11"><%= dt1.Rows[0]["out_mm"]%></font><font class="font5"> N&#259;m </font><font
  class="font11"><%= dt1.Rows[0]["out_yy"]%></font></td>
 </tr>
 <tr height=10 style='mso-height-source:userset;height:7.5pt'>
  <td height=10 colspan=2 class=xl25 style='height:7.5pt;mso-ignore:colspan'></td>
  <td colspan=5 class=xl28 style='mso-ignore:colspan'></td>
  <td class=xl29>&nbsp;</td>
  <td class=xl29>&nbsp;</td>
 </tr>
 <tr class=xl26 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=2 height=21 class=xl76 style='height:15.75pt'
  x:str="Khách hàng (Buyer) ">Khách hàng (Buyer)<span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=7 class=xl78 width=610 style='border-right:.5pt solid black;
  width:460pt'><%= dt1.Rows[0]["partner_name"]%></td>
 </tr>
 <tr class=xl26 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=2 height=21 class=xl70 style='height:15.75pt'>&#272;&#7883;a
  ch&#7881; (Address)</td>
  <td colspan=7 class=xl72 width=610 style='border-right:.5pt solid black;
  width:460pt'><%= dt1.Rows[0]["addr1"]%><span
  style='mso-spacerun:yes'>     </span><font class="font14">Tel </font><font
  class="font6"> </font><font class="font7"><%= dt1.Rows[0]["phone_no"]%><span
  style='mso-spacerun:yes'>     </span></font><font class="font14"><span
  style='mso-spacerun:yes'> </span>Fax </font><font class="font7"><%= dt1.Rows[0]["fax_no"]%></font></td>
 </tr>
 <tr class=xl26 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=2 height=21 class=xl70 style='height:15.75pt'>Giao hàng (Address)</td>
  <td colspan=7 class=xl72 width=610 style='border-right:.5pt solid black;
  width:460pt'><%= dt1.Rows[0]["addr1"]%></td>
 </tr>
 <tr class=xl26 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=2 height=21 class=xl52 style='height:15.75pt'>Ghi chú (Remark)</td>
  <td colspan=7 class=xl54 width=610 style='border-right:.5pt solid black;
  width:460pt'><%= dt1.Rows[0]["description"]%></td>
 </tr>
 <tr height=10 style='mso-height-source:userset;height:7.5pt'>
  <td height=10 class=xl30 style='height:7.5pt'>&nbsp;</td>
  <td class=xl31>&nbsp;</td>
  <td class=xl31>&nbsp;</td>
  <td class=xl31>&nbsp;</td>
  <td class=xl31>&nbsp;</td>
  <td class=xl31>&nbsp;</td>
  <td class=xl31>&nbsp;</td>
  <td class=xl31>&nbsp;</td>
  <td class=xl31>&nbsp;</td>
 </tr>
 <tr class=xl32 height=15 style='mso-height-source:userset;height:11.25pt'>
  <td rowspan=2 height=45 class=xl56 width=31 style='border-bottom:.5pt solid black;
  height:33.75pt;border-top:none;width:23pt'>STT</td>
  <td colspan=2 rowspan=2 class=xl58 width=250 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:188pt'>Tên hàng<font class="font15"><br>
    </font><font class="font8">Item Description</font></td>
  <td rowspan=2 class=xl62 width=90 style='border-bottom:.5pt solid black;
  border-top:none;width:68pt'>Quy cách<font class="font15"><br>
    </font><font class="font8">Spec</font></td>
  <td rowspan=2 class=xl64 width=50 style='border-bottom:.5pt solid black;
  border-top:none;width:38pt'>&#272;VT<font class="font15"><br>
    </font><font class="font8">UOM</font></td>
  <td colspan=2 class=xl66 width=140 style='border-right:.5pt solid black;
  border-left:none;width:106pt'>S&#7889; l&#432;&#7907;ng <font class="font8">Quantity</font></td>
  <td rowspan=2 class=xl64 width=80 style='border-bottom:.5pt solid black;
  border-top:none;width:60pt'>S&#7889; &#273;&#7889;i chi&#7871;u<font
  class="font15"><br>
    </font><font class="font8">P/O Ref No</font></td>
  <td rowspan=2 class=xl68 width=90 style='border-bottom:.5pt solid black;
  border-top:none;width:68pt'>Ghi chú<font class="font15"><br>
    </font><font class="font8">Remark</font></td>
 </tr>
 <tr class=xl32 height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl33 width=70 style='height:22.5pt;width:53pt'>Yêu
  c&#7847;u<font class="font15"> </font><font class="font8">Request</font></td>
  <td class=xl33 width=70 style='width:53pt'>Th&#7921;c xu&#7845;t<font
  class="font15"> </font><font class="font8">Actual</font></td>
 </tr>
 <% 
     for (int i = 0; i < dt2.Rows.Count; i++)
     {
      %>
 <tr class=xl34 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl35 width=31 style='height:30.0pt;width:23pt' x:num><%= dt2.Rows[i]["seq"]%></td>
  <td colspan=2 class=xl47 width=250 style='border-right:.5pt solid black;
  border-left:none;width:188pt'><%= dt2.Rows[i]["item_name"]%></td>
  <td class=xl36 width=90 style='width:68pt'><%= dt2.Rows[i]["spec"]%></td>
  <td class=xl37 width=50 style='width:38pt'><%= dt2.Rows[i]["uom"]%></td>
  <td class=xl38 width=70 style='width:53pt' x:num><span
  style='mso-spacerun:yes'>           </span><%= dt2.Rows[i]["req_qty"]%></td>
  <td class=xl38 width=70 style='width:53pt' x:num><span
  style='mso-spacerun:yes'>             </span><%= dt2.Rows[i]["out_qty"]%></td>
  <td class=xl39 width=80 style='width:60pt'><%= dt2.Rows[i]["ref_no"]%></td>
  <td class=xl40 width=90 style='width:68pt'><%= dt2.Rows[i]["description"]%></td>
 </tr>
 <%} %>
 <tr class=xl34 height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=3 height=30 class=xl49 width=281 style='border-right:.5pt solid black;
  height:22.5pt;width:211pt'>Total</td>
  <td class=xl38 width=90 style='width:68pt'>&nbsp;</td>
  <td class=xl38 width=50 style='width:38pt'>&nbsp;</td>
  <td class=xl38 width=70 style='width:53pt' x:num x:fmla="=<%if(dt2.Rows.Count==0){ %>SUM(F20:F20)<%}else{ %>SUM(F14:F<%= dt2.Rows.Count+13 %>)<%} %>"><span
  style='mso-spacerun:yes'>           </span></td>
  <td class=xl41 width=70 style='width:53pt' x:num x:fmla="=<%if(dt2.Rows.Count==0){ %>SUM(E20:E20)<%}else{ %>SUM(G14:G<%= dt2.Rows.Count+13 %>)<%} %>"><span
  style='mso-spacerun:yes'>             </span></td>
  <td colspan=2 class=xl44 width=170 style='border-right:.5pt solid black;
  border-left:none;width:128pt'>&nbsp;</td>
 </tr>
 <tr class=xl26 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=3 class=xl42 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl42 style='mso-ignore:colspan'></td>
  <td class=xl43></td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 class=xl27 style='height:26.25pt'></td>
  <td colspan=2 class=xl46 width=250 style='width:188pt'>Qu&#7843;n lý<font
  class="font6"><br>
    </font><font class="font14">Manager</font></td>
  <td colspan=3 class=xl46 width=210 style='width:159pt'>Ng&#432;&#7901;i
  nh&#7853;n<font class="font6"><br>
    </font><font class="font14">Receiver</font></td>
  <td colspan=3 class=xl46 width=240 style='width:181pt'>Th&#7911; kho<font
  class="font6"><br>
    </font><font class="font14">W/H Keeper</font></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=31 style='width:23pt'></td>
  <td width=90 style='width:68pt'></td>
  <td width=160 style='width:120pt'></td>
  <td width=90 style='width:68pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=90 style='width:68pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
