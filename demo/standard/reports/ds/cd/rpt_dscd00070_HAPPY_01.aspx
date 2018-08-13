<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  
    CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
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

    dt  = CtlLib.TableReadOpenCursor("st_lg__rpt_dscd00070_HAPPY_01_1", para);
    dt1 = CtlLib.TableReadOpenCursor("st_lg__rpt_dscd00070_HAPPY_01_2", para);
    dt2 = CtlLib.TableReadOpenCursor("st_lg__rpt_dscd00070_HAPPY_01_3", para);    
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="Xl0000004_files/filelist.xml">
<link rel=Edit-Time-Data href="Xl0000004_files/editdata.mso">
<link rel=OLE-Object-Data href="Xl0000004_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>tuyen</o:LastAuthor>
  <o:LastPrinted>2012-09-18T10:04:41Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2012-09-19T09:18:44Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"&L&G&CPage &P of &N";
	margin:.28in .28in .16in .32in;
	mso-header-margin:.23in;
	mso-footer-margin:.19in;
	mso-page-orientation:landscape;}
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
	font-size:10.0pt;
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
.font16
	{color:black;
	font-size:8.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font17
	{color:windowtext;
	font-size:8.0pt;
	font-weight:700;
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
.style43
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
.style56
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
	font-family:돋움, monospace;
	mso-font-charset:129;
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
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl67
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl68
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl70
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl71
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl72
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:normal;}
.xl74
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
.xl75
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
.xl76
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
.xl77
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
.xl78
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
.xl79
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:top;}
.xl80
	{mso-style-parent:style56;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl81
	{mso-style-parent:style56;
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
	text-align:left;}
.xl84
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl85
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl86
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	white-space:normal;}
.xl87
	{mso-style-parent:style43;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl90
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;
	vertical-align:middle;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;}
.xl92
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl93
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl94
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl96
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl98
	{mso-style-parent:style43;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:2.0pt double windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl105
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:2.0pt double windowtext;}
.xl106
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl107
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:2.0pt double windowtext;}
.xl108
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:2.0pt double windowtext;}
.xl109
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:2.0pt double windowtext;}
.xl110
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:2.0pt double windowtext;
	border-bottom:none;
	border-left:none;}
.xl111
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:2.0pt double windowtext;}
.xl112
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl113
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:2.0pt double windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl116
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl117
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:2.0pt double windowtext;}
.xl118
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl119
	{mso-style-parent:style56;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	white-space:normal;}
.xl121
	{mso-style-parent:style56;
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
.xl122
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
.xl123
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl124
	{mso-style-parent:style56;
	color:black;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	border-top:none;
	border-right:2.0pt double windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl127
	{mso-style-parent:style56;
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
.xl128
	{mso-style-parent:style56;
	color:black;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl129
	{mso-style-parent:style56;
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
.xl130
	{mso-style-parent:style56;
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
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl136
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl140
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl141
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl142
	{mso-style-parent:style56;
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
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl143
	{mso-style-parent:style56;
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
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl144
	{mso-style-parent:style56;
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
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl145
	{mso-style-parent:style56;
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
.xl146
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl147
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:2.0pt double windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl149
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:2.0pt double windowtext;
	border-right:2.0pt double windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl150
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:2.0pt double windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl151
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:2.0pt double windowtext;
	border-bottom:none;
	border-left:none;}
.xl152
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl153
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:2.0pt double windowtext;
	border-right:2.0pt double windowtext;
	border-bottom:none;
	border-left:none;}
.xl154
	{mso-style-parent:style43;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl155
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
	white-space:normal;}
.xl156
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
	white-space:normal;}
.xl157
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
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
.xl158
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl159
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl160
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl161
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl162
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl163
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl164
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl165
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl166
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
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
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>92</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:TopRowVisible>6</x:TopRowVisible>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>18</x:ActiveRow>
       <x:RangeSelection>$A$19:$D$21</x:RangeSelection>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>9150</x:WindowHeight>
  <x:WindowWidth>15360</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>1365</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl66>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1097 style='border-collapse:
 collapse;table-layout:fixed;width:825pt'>
 <col class=xl66 width=47 style='mso-width-source:userset;mso-width-alt:1718;
 width:35pt'>
 <col class=xl66 width=107 style='mso-width-source:userset;mso-width-alt:3913;
 width:80pt'>
 <col class=xl66 width=120 style='mso-width-source:userset;mso-width-alt:4388;
 width:90pt'>
 <col class=xl66 width=82 style='mso-width-source:userset;mso-width-alt:2998;
 width:62pt'>
 <col class=xl66 width=42 style='mso-width-source:userset;mso-width-alt:1536;
 width:32pt'>
 <col class=xl66 width=85 style='mso-width-source:userset;mso-width-alt:3108;
 width:64pt'>
 <col class=xl66 width=88 style='mso-width-source:userset;mso-width-alt:3218;
 width:66pt'>
 <col class=xl66 width=81 style='mso-width-source:userset;mso-width-alt:2962;
 width:61pt'>
 <col class=xl66 width=94 style='mso-width-source:userset;mso-width-alt:3437;
 width:71pt'>
 <col class=xl66 width=86 span=2 style='mso-width-source:userset;mso-width-alt:
 3145;width:65pt'>
 <col class=xl66 width=179 style='mso-width-source:userset;mso-width-alt:6546;
 width:134pt'>
 <tr class=xl67 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 rowspan=3 height=60 class=xl80 width=154 style='border-bottom:
  2.0pt double black;height:45.0pt;width:115pt'><v:shape id="_x0000_s1025" type="#_x0000_t75" style='position:absolute;
   margin-left:10.5pt;margin-top:1.5pt;width:75pt;height:42pt;z-index:1'>
   <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt.Rows[0]["tco_bpphoto_pk"]%>&table_name=<%=l_user%>tco_bpphoto" o:title="logo"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape></td>
  <td class=xl80 width=120 style='width:90pt'></td>
  <td colspan=6 class=xl82 width=472 style='width:356pt'></td>
  <td class=xl82 width=86 style='width:65pt'></td>
  <td colspan=2 class=xl120 width=265 style='width:199pt'></td>
 </tr>
 <tr class=xl67 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl80 style='height:15.0pt'></td>
  <td colspan=6 class=xl83></td>
  <td class=xl83></td>
  <td colspan=2 class=xl120 width=265 style='width:199pt'></td>
 </tr>
 <tr class=xl67 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl81 style='height:15.0pt'>&nbsp;</td>
  <td colspan=6 class=xl84>&nbsp;</td>
  <td class=xl84>&nbsp;</td>
  <td colspan=2 class=xl121 width=265 style='width:199pt'>Print date :
  <%= DateTime.Now.ToString("dd/MM/yyyy HH:mm") %></td>
 </tr>
 <tr height=70 style='mso-height-source:userset;height:52.5pt'>
  <td colspan=12 height=70 class=xl122 width=1097 style='height:52.5pt;
  width:825pt'>BIÊN BẢN XÁC NHẬN HÀNG GIAO<br>
    <font class="font10">( GOODS DELIVERY )</font></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=12 height=20 class=xl123 style='height:15.0pt'><span
  style='mso-spacerun:yes'> </span><font class="font5">Số :</font><font
  class="font11"> </font><font class="font12"><%= dt1.Rows[0]["slip_no"]%></font><font
  class="font5"><span style='mso-spacerun:yes'>  </span>/</font><font
  class="font11"> </font><font class="font5">Ngày</font><font class="font11">
  <%= dt1.Rows[0]["out_dd"]%></font><font class="font5"> Tháng </font><font class="font11"><%= dt1.Rows[0]["out_mm"]%></font><font
  class="font5"> Năm </font><font class="font11"><%= dt1.Rows[0]["out_yy"]%></font></td>
 </tr>
 <tr height=10 style='mso-height-source:userset;height:7.5pt'>
  <td height=10 colspan=3 class=xl66 style='height:7.5pt;mso-ignore:colspan'></td>
  <td colspan=8 class=xl69 style='mso-ignore:colspan'></td>
  <td class=xl104></td>
 </tr>
 <tr class=xl67 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl105 colspan=2 style='height:19.5pt;mso-ignore:colspan'><font
  class="font17">Bên Giao</font><font class="font14"> (Delivery)</font></td>
  <td colspan=4 class=xl152 style='border-right:2.0pt double black'><%= dt.Rows[0]["partner_name"]%></td>
  <td class=xl105 colspan=2 style='mso-ignore:colspan'><font class="font17">Bên
  Nhận</font><font class="font14">(Receive)<span
  style='mso-spacerun:yes'> </span></font></td>
  <td colspan=4 class=xl148 width=445 style='border-right:2.0pt double black;
  width:335pt'><%= dt1.Rows[0]["receive"]%></td>
 </tr>
 <tr class=xl67 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl108 style='height:19.5pt'><font class="font17">Địa chỉ</font><font
  class="font14"> (A</font><span style='display:none'><font class="font14">ddress)</font></span></td>
  <td class=xl67></td>
  <td colspan=4 class=xl97 style='border-right:2.0pt double black'><%= dt.Rows[0]["addr1"]%></td>
  <td class=xl107 style='border-left:none'><font class="font17">Tên KH</font><font
  class="font14"> (Customer</font><span style='display:none'><font
  class="font14"> Name)</font></span></td>
  <td class=xl93></td>
  <td colspan=4 class=xl96 width=445 style='border-right:2.0pt double black;
  width:335pt'><%= dt1.Rows[0]["partner_name"]%></td>
 </tr>
 <tr class=xl67 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl108 style='height:19.5pt'><font class="font17">MST</font><font
  class="font14"> (Tax</font><span style='display:none'><font class="font14">
  code)</font></span></td>
  <td class=xl67></td>
  <td colspan=2 class=xl82 x:num><%= dt.Rows[0]["tax_code"]%></td>
  <td class=xl94></td>
  <td class=xl103 width=85 style='width:64pt'>&nbsp;</td>
  <td class=xl108 style='border-left:none'><font class="font17">Địa chỉ </font><font
  class="font14">(Address)</font></td>
  <td class=xl95></td>
  <td colspan=4 class=xl96 width=445 style='border-right:2.0pt double black;
  width:335pt'><%= dt1.Rows[0]["addr1"]%></td>
 </tr>
 <tr class=xl67 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl108 style='height:19.5pt'><font class="font17">ĐT</font><font
  class="font14"> (Tel)</font></td>
  <td class=xl67></td>
  <td class=xl92><%= dt.Rows[0]["phone_no"]%></td>
  <td class=xl67 colspan=2 style='mso-ignore:colspan'>Fax: <font class="font7"><%= dt.Rows[0]["fax_no"]%></font></td>
  <td class=xl103 width=85 style='width:64pt'>&nbsp;</td>
  <td class=xl109 style='border-left:none'><font class="font17">MST</font><font
  class="font6"> </font><font class="font14">(Tax Code)</font></td>
  <td class=xl93></td>
  <td class=xl96 width=94 style='width:71pt' x:num><%= dt1.Rows[0]["tax_code"]%></td>
  <td colspan=2 class=xl96 style='mso-ignore:colspan'></td>
  <td class=xl110>&nbsp;</td>
 </tr>
 <tr class=xl67 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl108 style='height:19.5pt'><font class="font17">Địa chỉ
  n</font><span style='display:none'><font class="font17">hận hàng</font><font
  class="font14"> (Deli Loc)</font></span></td>
  <td class=xl67></td>
  <td colspan=4 class=xl125 width=329 style='border-right:2.0pt double black;
  width:248pt'><%= dt1.Rows[0]["loc_nm"]%></td>
  <td class=xl108 style='border-left:none'><font class="font17">ĐT</font><font
  class="font14"> (Tel)</font></td>
  <td class=xl67></td>
  <td class=xl97><%= dt1.Rows[0]["phone_no"]%></td>
  <td class=xl91>Fax:</td>
  <td class=xl82><%= dt1.Rows[0]["fax_no"]%></td>
  <td class=xl110>&nbsp;</td>
 </tr>
 <tr class=xl67 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl117 colspan=2 style='height:19.5pt;mso-ignore:colspan'><font
  class="font17">Ghi chú</font><font class="font14"> (Remark)</font></td>
  <td colspan=4 class=xl146 width=329 style='border-right:2.0pt double black;
  width:248pt'><%= dt1.Rows[0]["description"]%></td>
  <td class=xl111 colspan=2 style='mso-ignore:colspan'><font class="font17">Ngày
  Đặt hàng</font><font class="font14"> (Ord Date)</font></td>
  <td class=xl113 width=94 style='width:71pt'><%= dt1.Rows[0]["ord_date"]%></td>
  <td class=xl114 width=86 style='width:65pt'>&nbsp;</td>
  <td class=xl114 width=86 style='width:65pt'>&nbsp;</td>
  <td class=xl115>&nbsp;</td>
 </tr>
 <tr class=xl67 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 colspan=2 class=xl89 style='height:19.5pt;mso-ignore:colspan'></td>
  <td colspan=4 class=xl86 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl85 style='mso-ignore:colspan'></td>
  <td class=xl90></td>
  <td colspan=2 class=xl86 style='mso-ignore:colspan'></td>
  <td class=xl67></td>
 </tr>
 <tr height=10 style='mso-height-source:userset;height:7.5pt'>
  <td height=10 class=xl70 style='height:7.5pt'>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
  <td class=xl71>&nbsp;</td>
 </tr>
 <tr class=xl72 height=15 style='mso-height-source:userset;height:11.25pt'>
  <td rowspan=2 height=45 class=xl124 width=47 style='height:33.75pt;
  border-top:none;width:35pt'><font class="font16">STT<br>
    </font><font class="font8">No</font></td>
  <td rowspan=2 class=xl124 width=107 style='border-top:none;width:80pt'><font
  class="font16">Mã hàng</font><font class="font15"><br>
    </font><font class="font8">Item Code</font></td>
  <td colspan=2 rowspan=2 class=xl142 width=202 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:152pt'>Tên hàng<font class="font15"><br>
    </font><font class="font8">Item Name</font></td>
  <td rowspan=2 class=xl119 width=42 style='border-top:none;width:32pt'>ĐVT<font
  class="font15"><br>
    </font><font class="font8">UOM</font></td>
  <td rowspan=2 class=xl119 width=85 style='border-top:none;width:64pt'>Số
  lượng <font class="font8">Quantity</font></td>
  <td rowspan=2 class=xl124 width=88 style='border-top:none;width:66pt'><font
  class="font16">Giá trước thuế</font><font class="font8"><br>
    U/Price Not VAT</font></td>
  <td rowspan=2 class=xl127 width=81 style='border-bottom:.5pt solid black;
  border-top:none;width:61pt'><font class="font16">CK(%)</font><font
  class="font15"><br>
    </font><font class="font8">Discount Rate</font></td>
  <td rowspan=2 class=xl119 width=94 style='border-top:none;width:71pt'>Giảm
  giá<br>
    <font class="font8">Discount Amt</font></td>
  <td rowspan=2 class=xl129 width=86 style='border-bottom:.5pt solid black;
  border-top:none;width:65pt'>Thành tiền<br>
    <font class="font8">Amount</font></td>
  <td rowspan=2 class=xl119 width=86 style='border-top:none;width:65pt'>Số đối
  chiếu<br>
    <font class="font8">(Ref No)</font></td>
  <td rowspan=2 class=xl129 width=179 style='border-bottom:.5pt solid black;
  border-top:none;width:134pt'>Ghi Chú<br>
    <font class="font8">Remark</font></td>
 </tr>
 <tr class=xl72 height=30 style='mso-height-source:userset;height:22.5pt'>
 </tr>
  <%
        for(int i = 0; i < dt2.Rows.Count; i++)
        {
  %>
 <tr class=xl73 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl74 width=47 style='height:30.0pt;width:35pt' x:num><%= dt2.Rows[i]["seq"]%></td>
  <td class=xl102 width=107 style='width:80pt'><%= dt2.Rows[i]["out_item_code"]%></td>
  <td colspan=2 class=xl137 width=202 style='border-right:.5pt solid black;
  width:152pt'><%= dt2.Rows[i]["out_item_fname"]%><br>
    <font class="font7"><%= dt2.Rows[i]["out_item_name"]%></font></td>
  <td class=xl75 width=42 style='width:32pt'><%= dt2.Rows[i]["out_uom"]%></td>
  <td class=xl76 width=85 style='width:64pt' x:num><span
  style='mso-spacerun:yes'>                     </span><%= dt2.Rows[i]["out_qty"]%> </td>
  <td class=xl98 width=88 style='width:66pt' x:num><span
  style='mso-spacerun:yes'>             </span><%= dt2.Rows[i]["unit_price"]%> </td>
  <td class=xl75 width=81 style='width:61pt' x:num><%= dt2.Rows[i]["disc_rate"]%></td>
  <td class=xl76 width=94 style='width:71pt' x:num><span
  style='mso-spacerun:yes'>                  </span><%= dt2.Rows[i]["disc_amt"]%> </td>
  <td class=xl76 width=86 style='width:65pt' x:num><span style='mso-spacerun:yes'>      
  </span><%= dt2.Rows[i]["amount"]%> </td>
  <td class=xl77 width=86 style='width:65pt'><%= dt2.Rows[i]["ref_no"]%></td>
  <td class=xl78 width=179 style='width:134pt'><%= dt2.Rows[i]["description"]%></td>
 </tr>
  <%} %>
 <tr class=xl73 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=4 rowspan=3 height=72 class=xl162 width=356 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:54.0pt;width:267pt'>Tổng
  cộng 10% thuế GTGT Tổng Số Tiền Phải Thanh Toán Thanh Toán Còn Lại</td>
  <td rowspan=3 class=xl135 width=42 style='border-bottom:.5pt solid black;
  border-top:none;width:32pt'>&nbsp;</td>
  <td class=xl99 width=85 style='border-top:none;border-left:none;width:64pt'
  x:num x:fmla="=SUM(<% if(dt2.Rows.Count > 0){%>F17:F<%= dt2.Rows.Count+16%><%}else{%>F20:F20<%}%>)"><span
  style='mso-spacerun:yes'>                     </span></td>
  <td colspan=2 class=xl140 width=169 style='border-right:.5pt solid black;
  border-left:none;width:127pt'>&nbsp;</td>
  <td class=xl76 width=94 style='width:71pt' x:num x:fmla="=SUM(<% if(dt2.Rows.Count > 0){%>I17:I<%= dt2.Rows.Count+16%><%}else{%>I20:I20<%}%>)"><span style='mso-spacerun:yes'>                 
  </span></td>
  <td class=xl76 width=86 style='width:65pt' x:num x:fmla="=SUM(<% if(dt2.Rows.Count > 0){%>J17:J<%= dt2.Rows.Count+16%><%}else{%>J20:J20<%}%>)"><span style='mso-spacerun:yes'>       </span>
  </td>
  <td class=xl77 width=86 style='width:65pt'>&nbsp;</td>
  <td class=xl88 width=179 style='border-top:none;border-left:none;width:134pt'>&nbsp;</td>
 </tr>
 <tr class=xl73 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl100 width=85 style='height:18.0pt;border-left:none;
  width:64pt'>&nbsp;</td>
  <td colspan=2 class=xl155 width=169 style='border-right:.5pt solid black;
  border-left:none;width:127pt'>VAT Amount</td>
  <td class=xl76 width=94 style='width:71pt'>&nbsp;</td>
  <td class=xl76 width=86 style='width:65pt' x:num x:fmla="=<% if(dt2.Rows.Count > 0){%>J<%= dt2.Rows.Count+17%>*10%<%}else{%>J20<%}%>"><span
  style='mso-spacerun:yes'>           </span></td>
  <td class=xl77 width=86 style='width:65pt'>&nbsp;</td>
  <td class=xl88 width=179 style='border-top:none;border-left:none;width:134pt'>&nbsp;</td>
 </tr>
 <tr class=xl73 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl101 width=85 style='height:18.0pt;border-left:none;
  width:64pt'>&nbsp;</td>
  <td colspan=2 class=xl157 width=169 style='border-right:.5pt solid black;
  border-left:none;width:127pt'>Total Amount</td>
  <td class=xl87 width=94 style='border-top:none;border-left:none;width:71pt'>&nbsp;</td>
  <td class=xl87 width=86 style='border-top:none;border-left:none;width:65pt'
  x:num x:fmla="=<% if(dt2.Rows.Count > 0){%>J<%= dt2.Rows.Count+17%>+J<%= dt2.Rows.Count+18%><%}else{%>J20<%}%>"><span style='mso-spacerun:yes'>      
  </span></td>
  <td colspan=2 class=xl154 width=265 style='border-left:none;width:199pt'>&nbsp;</td>
 </tr>
 <tr class=xl67 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=4 class=xl79 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=6 class=xl66 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl79 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 class=xl68 style='height:26.25pt'></td>
  <td colspan=3 class=xl72 width=309 style='width:232pt'>Kế Toán<font
  class="font6"><br>
    </font><font class="font14">(Ký ghi rõ họ tên)</font></td>
  <td colspan=3 class=xl139 width=215 style='width:162pt'><font class="font7">Nhân
  viên xuất kho</font><font class="font6"><br>
    </font><font class="font14">(Ký ghi rõ họ tên)</font></td>
  <td colspan=3 class=xl72 width=261 style='width:197pt'>Nhân viên giao
  hàng<br>
    <font class="font14">(Ký ghi rõ họ tên)</font></td>
  <td colspan=2 class=xl139 width=265 style='width:199pt'><font class="font7">Đại
  diện bên nhận</font><font class="font6"><br>
    </font><font class="font14">(Ký ghi rõ họ tên)</font></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=47 style='width:35pt'></td>
  <td width=107 style='width:80pt'></td>
  <td width=120 style='width:90pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=42 style='width:32pt'></td>
  <td width=85 style='width:64pt'></td>
  <td width=88 style='width:66pt'></td>
  <td width=81 style='width:61pt'></td>
  <td width=94 style='width:71pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=179 style='width:134pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
