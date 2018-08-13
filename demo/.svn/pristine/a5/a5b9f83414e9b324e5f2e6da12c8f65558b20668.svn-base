<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
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
    string p1= Request.QueryString["p_fr"];
	string p2= Request.QueryString["p_to"];
	string l_parameter = "'" +  p1 + "','" + p2 + "'";
	
	DataTable dt;
    dt = CtlLib.TableReadOpenCursor("rpt_60270030_item_invoice",l_parameter);
    if (dt.Rows.Count == 0)
    {
        Response.Write("There is no data");
        Response.End();
    }
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="htrt00090_Session_files/filelist.xml">
<link rel=Edit-Time-Data href="htrt00090_Session_files/editdata.mso">
<link rel=OLE-Object-Data href="htrt00090_Session_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>SVDEMO</o:Author>
  <o:LastAuthor>Windows User</o:LastAuthor>
  <o:Created>2012-03-11T03:35:57Z</o:Created>
  <o:LastSaved>2012-03-10T17:55:56Z</o:LastSaved>
  <o:Company>Vina</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .75in 1.0in .75in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-page-orientation:landscape;}
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style45
	{mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	mso-style-name:"Comma 2";}
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
.style59
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
	mso-style-name:"Normal 2";}
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
.xl67
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl68
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl69
	{mso-style-parent:style59;
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
	border-left:none;}
.xl70
	{mso-style-parent:style59;
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
	border-left:.5pt solid windowtext;}
.xl71
	{mso-style-parent:style59;
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
	border-left:1.0pt solid windowtext;}
.xl72
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl73
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl74
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl75
	{mso-style-parent:style45;
	color:black;
	font-size:6.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\\\(\#\,\#\#0\.00\\\)";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl76
	{mso-style-parent:style45;
	color:black;
	font-size:6.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\\\(\#\,\#\#0\.00\\\)";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl77
	{mso-style-parent:style45;
	color:black;
	font-size:6.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\\\(\#\,\#\#0\.00\\\)";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl78
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl79
	{mso-style-parent:style45;
	color:black;
	font-size:6.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\\\(\#\,\#\#0\.00\\\)";
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl80
	{mso-style-parent:style45;
	color:black;
	font-size:6.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\\\(\#\,\#\#0\.00\\\)";
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl81
	{mso-style-parent:style0;
	font-weight:700;}
.xl82
	{mso-style-parent:style45;
	color:black;
	font-size:6.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\\\(\#\,\#\#0\.00\\\)";
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl83
	{mso-style-parent:style45;
	color:black;
	font-size:6.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\\\(\#\,\#\#0\.00\\\)";
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl84
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;}
.xl85
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl86
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;}
.xl87
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl88
	{mso-style-parent:style45;
	color:black;
	font-size:6.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\\\(\#\,\#\#0\.00\\\)";
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl89
	{mso-style-parent:style45;
	color:black;
	font-size:6.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\\\(\#\,\#\#0\.00\\\)";
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl90
	{mso-style-parent:style45;
	color:black;
	font-size:6.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl91
	{mso-style-parent:style45;
	color:black;
	font-size:6.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl92
	{mso-style-parent:style45;
	color:black;
	font-size:6.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl93
	{mso-style-parent:style45;
	color:black;
	font-size:6.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl94
	{mso-style-parent:style45;
	color:black;
	font-size:6.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl95
	{mso-style-parent:style59;
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
	border-left:1.0pt solid windowtext;}
.xl96
	{mso-style-parent:style59;
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
	border-left:none;}
.xl97
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl98
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl99
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl100
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl101
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl102
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl103
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid black;}
.xl104
	{mso-style-parent:style59;
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
	border-left:1.0pt solid windowtext;
	mso-rotate:-90;}
.xl105
	{mso-style-parent:style59;
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
	mso-rotate:-90;}
.xl106
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	mso-rotate:-90;}
.xl107
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	mso-rotate:-90;}
.xl108
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid windowtext;
	mso-rotate:-90;}
.xl109
	{mso-style-parent:style59;
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
	border-left:none;
	mso-rotate:-90;}
.xl110
	{mso-style-parent:style59;
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
	border-left:.5pt solid black;}
.xl111
	{mso-style-parent:style59;
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
	white-space:normal;}
.xl112
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl113
	{mso-style-parent:style59;
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
	border-left:.5pt solid black;
	white-space:normal;}
.xl114
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	mso-rotate:-90;}
.xl115
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	mso-rotate:-90;}
.xl116
	{mso-style-parent:style59;
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
	border-left:1.0pt solid windowtext;
	mso-rotate:-90;}
.xl117
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	mso-rotate:-90;}
.xl118
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	mso-rotate:-90;}
.xl119
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	mso-rotate:-90;}
.xl120
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	mso-rotate:-90;}
.xl121
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-rotate:-90;}
.xl122
	{mso-style-parent:style59;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid black;
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
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:DoNotDisplayZeros/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>20</x:ActiveRow>
       <x:ActiveCol>20</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
   <x:ExcelWorksheet>
    <x:Name>Sheet2</x:Name>
    <x:WorksheetOptions>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
   <x:ExcelWorksheet>
    <x:Name>Sheet3</x:Name>
    <x:WorksheetOptions>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>9855</x:WindowHeight>
  <x:WindowWidth>19020</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>45</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=893 style='border-collapse:
 collapse;table-layout:fixed;width:674pt'>
 <col width=19 style='mso-width-source:userset;mso-width-alt:694;width:14pt'>
 <col width=17 style='mso-width-source:userset;mso-width-alt:621;width:13pt'>
 <col width=40 style='mso-width-source:userset;mso-width-alt:1462;width:30pt'>
 <col width=29 style='mso-width-source:userset;mso-width-alt:1060;width:22pt'>
 <col width=43 style='mso-width-source:userset;mso-width-alt:1572;width:32pt'>
 <col width=44 style='mso-width-source:userset;mso-width-alt:1609;width:33pt'>
 <col width=50 span=2 style='mso-width-source:userset;mso-width-alt:1828;
 width:38pt'>
 <col class=xl81 width=58 style='mso-width-source:userset;mso-width-alt:2121;
 width:44pt'>
 <col width=52 span=4 style='mso-width-source:userset;mso-width-alt:1901;
 width:39pt'>
 <col class=xl81 width=65 style='mso-width-source:userset;mso-width-alt:2377;
 width:49pt'>
 <col width=50 span=4 style='mso-width-source:userset;mso-width-alt:1828;
 width:38pt'>
 <col class=xl81 width=70 style='mso-width-source:userset;mso-width-alt:2560;
 width:53pt'>
 <tr height=34 style='mso-height-source:userset;height:25.5pt'>
  <td height=34 width=19 style='height:25.5pt;width:14pt' align=left
  valign=top><!--[if gte vml 1]><v:shapetype id="_x0000_t75" coordsize="21600,21600"
   o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe" filled="f"
   stroked="f">
   <v:stroke joinstyle="miter"/>
   <v:formulas>
    <v:f eqn="if lineDrawn pixelLineWidth 0"/>
    <v:f eqn="sum @0 1 0"/>
    <v:f eqn="sum 0 0 @1"/>
    <v:f eqn="prod @2 1 2"/>
    <v:f eqn="prod @3 21600 pixelWidth"/>
    <v:f eqn="prod @3 21600 pixelHeight"/>
    <v:f eqn="sum @0 0 1"/>
    <v:f eqn="prod @6 1 2"/>
    <v:f eqn="prod @7 21600 pixelWidth"/>
    <v:f eqn="sum @8 21600 0"/>
    <v:f eqn="prod @7 21600 pixelHeight"/>
    <v:f eqn="sum @10 21600 0"/>
   </v:formulas>
   <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/>
   <o:lock v:ext="edit" aspectratio="t"/>
  </v:shapetype><v:shape id="_x0000_s1025" type="#_x0000_t75" style='position:absolute;
   margin-left:10.5pt;margin-top:4.5pt;width:75pt;height:63.75pt;z-index:1'>
   <v:imagedata src="htrt00090_Session_files/image001.jpg" o:title="lotusmuine"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:14px;margin-top:6px;width:100px;
  height:85px'><img width=100 height=85
  src="htrt00090_Session_files/image002.jpg" v:shapes="_x0000_s1025"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=34 class=xl85 width=19 style='height:25.5pt;width:14pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl85 width=17 style='width:13pt'></td>
  <td colspan=16 rowspan=2 class=xl98 width=787 style='width:594pt'>F&amp;B
  Session Report</td>
  <td rowspan=2 class=xl98 width=70 style='width:53pt'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=2 class=xl67 style='height:12.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=3 class=xl67 style='height:12.0pt;mso-ignore:colspan'></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
  <td class=xl86 x:str="From : ">From :<span style='mso-spacerun:yes'> </span></td>
  <td class=xl87><%=dt.Rows[0][0]%></td>
  <td colspan=2 class=xl67 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl86 x:str="Print : ">Print :<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl87><%=dt.Rows[0][1]%></td>
  <td colspan=2 class=xl67 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl86></td>
  <td class=xl87></td>
  <td class=xl67></td>
  <td class=xl84></td>
 </tr>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td height=31 colspan=8 class=xl68 style='height:23.25pt;mso-ignore:colspan'></td>
  <td class=xl78></td>
  <td colspan=4 class=xl68 style='mso-ignore:colspan'></td>
  <td class=xl78></td>
  <td colspan=4 class=xl68 style='mso-ignore:colspan'></td>
  <td class=xl78></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=9 height=17 class=xl99 style='border-right:1.0pt solid black;
  height:12.75pt'>Today</td>
  <td colspan=5 class=xl99 style='border-right:1.0pt solid black;border-left:
  none'>MTD</td>
  <td colspan=5 class=xl103 style='border-right:1.0pt solid black;border-left:
  none'>YTD</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=4 height=17 class=xl95 style='border-right:.5pt solid black;
  height:12.75pt'>Outlet</td>
  <td class=xl69>Marina</td>
  <td class=xl69>Orchid</td>
  <td class=xl69>Mbeach</td>
  <td class=xl69>RoomSV</td>
  <td class=xl70 style='border-top:none;border-left:none'>Total</td>
  <td class=xl71>Marina</td>
  <td class=xl69>Orchid</td>
  <td class=xl69>Mbeach</td>
  <td class=xl69>RoomSV</td>
  <td class=xl72 style='border-left:none'>Total</td>
  <td class=xl69>Marina</td>
  <td class=xl69>Orchid</td>
  <td class=xl69>Mbeach</td>
  <td class=xl69>RoomSV</td>
  <td class=xl73>Total</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 rowspan=8 height=136 class=xl104 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;height:102.0pt'>Total F&amp;B</td>
  <td colspan=2 class=xl110 style='border-right:.5pt solid black;border-left:
  none'>Food </td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][3]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][3]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][3]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][3]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E7:H7)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][3]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][3]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][3]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][3]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J7:M7)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][3]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][3]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][3]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][3]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O7:R7)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl110 style='border-right:.5pt solid black;
  height:12.75pt;border-left:none'>Bever</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][4]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][4]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][4]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][4]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E8:H8)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][4]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][4]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][4]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][4]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J8:M8)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][4]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][4]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][4]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][4]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O8:R8)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl110 style='border-right:.5pt solid black;height:12.75pt;border-left:none'>Other</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][5]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][5]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][5]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][5]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E9:H9)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][5]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][5]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][5]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][5]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J9:M9)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][5]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][5]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][5]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][5]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O9:R9)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl110 style='border-right:.5pt solid black;height:12.75pt;border-left:none'>Total</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][9]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][9]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][9]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][9]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E10:H10)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][9]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][9]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][9]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][9]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J10:M10)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][9]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][9]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][9]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][9]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O10:R10)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl110 style='border-right:.5pt solid black; height:12.75pt;border-left:none'>Cover</td>
  <td class=xl90 align=right x:num><%=dt.Rows[4][6]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[5][6]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[6][6]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[7][6]%> </td>
  <td class=xl94 align=right x:num x:fmla="=SUM(E11:H11)"> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[0][6]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[1][6]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[2][6]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[3][6]%> </td>
  <td class=xl94 align=right x:num x:fmla="=SUM(J11:M11)"> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[8][6]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[9][6]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[10][6]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[11][6]%> </td>
  <td class=xl94 align=right x:num x:fmla="=SUM(O11:R11)"> </td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td rowspan=3 height=51 class=xl111 width=40 style='border-bottom:.5pt solid black;height:38.25pt;border-top:none;width:30pt'>Avg <br>check</td>
  <td class=xl69>Food</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][7]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][7]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][7]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][7]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E12:H12)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][7]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][7]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][7]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][7]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J12:M12)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][7]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][7]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][7]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][7]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O12:R12)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl69 style='height:12.75pt'>Bvr</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][8]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][8]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][8]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][8]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E13:H13)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][8]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][8]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][8]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][8]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J13:M13)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][8]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][8]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][8]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][8]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O13:R13)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl69 style='height:12.75pt'>F&amp;B</td>
  <td class=xl75 align=right x:num x:fmla="=E10/IF(E11=&quot;&quot,1,IF(E11=0,1,E11))"></td>
  <td class=xl75 align=right x:num x:fmla="=F10/IF(F11=&quot;&quot,1,IF(F11=0,1,F11))"></td>
  <td class=xl75 align=right x:num x:fmla="=G10/IF(G11=&quot;&quot,1,IF(G11=0,1,G11))"></td>
  <td class=xl75 align=right x:num x:fmla="=H10/IF(H11=&quot;&quot,1,IF(H11=0,1,H11))"></td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E14:H14)"></td>
  <td class=xl88 align=right x:num x:fmla="=J10/IF(J11=&quot;&quot,1,IF(J11=0,1,J11))"></td>
  <td class=xl89 align=right x:num x:fmla="=K10/IF(K11=&quot;&quot,1,IF(K11=0,1,K11))"></td>
  <td class=xl89 align=right x:num x:fmla="=L10/IF(L11=&quot;&quot,1,IF(L11=0,1,L11))"></td>
  <td class=xl89 align=right x:num x:fmla="=M10/IF(M11=&quot;&quot,1,IF(M11=0,1,M11))"></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J14:M14)"></td>
  <td class=xl75 align=right x:num x:fmla="=O10/IF(O11=&quot;&quot,1,IF(O11=0,1,O11))"></td>
  <td class=xl89 align=right x:num x:fmla="=P10/IF(P11=&quot;&quot,1,IF(P11=0,1,P11))"></td>
  <td class=xl89 align=right x:num x:fmla="=Q10/IF(Q11=&quot;&quot,1,IF(Q11=0,1,Q11))"></td>
  <td class=xl89 align=right x:num x:fmla="=R10/IF(R11=&quot;&quot,1,IF(R11=0,1,R11))"></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O14:R14)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td rowspan=8 height=136 class=xl114 style='border-bottom:.5pt solid black;height:102.0pt;border-top:none'>Breakfast</td>
  <td rowspan=8 class=xl117 style='border-bottom:.5pt solid black;border-top:none'>6.00 AM - 11.00 AM</td>
  <td colspan=2 class=xl110 style='border-right:.5pt solid black'>Food</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][10]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][10]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][10]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][10]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E15:H15)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][10]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][10]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][10]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][10]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J15:M15)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][10]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][10]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][10]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][10]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O15:R15)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl70 style='border-right:.5pt solid black;height:12.75pt'>Bever</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][11]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][11]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][11]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][11]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E16:H16)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][11]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][11]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][11]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][11]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J16:M16)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][11]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][11]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][11]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][11]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O16:R16)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl70 style='border-right:.5pt solid black;height:12.75pt'>Other</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][12]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][12]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][12]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][12]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E17:H17)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][12]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][12]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][12]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][12]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J17:M17)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][12]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][12]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][12]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][12]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O17:R17)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl70 style='border-right:.5pt solid black;height:12.75pt'>Total</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][16]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][16]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][16]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][16]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E18:H18)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][16]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][16]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][16]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][16]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J18:M18)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][16]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][16]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][16]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][16]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O18:R18)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl70 style='border-right:.5pt solid black; height:12.75pt'>Cover</td>
  <td class=xl90 align=right x:num><%=dt.Rows[4][13]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[5][13]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[6][13]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[7][13]%> </td>
  <td class=xl94 align=right x:num x:fmla="=SUM(E19:H19)"> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[0][13]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[1][13]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[2][13]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[3][13]%> </td>
  <td class=xl94 align=right x:num x:fmla="=SUM(J19:M19)"> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[8][13]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[9][13]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[10][13]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[11][13]%> </td>
  <td class=xl94 align=right x:num x:fmla="=SUM(O19:R19)"> </td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td rowspan=3 height=51 class=xl111 width=40 style='border-bottom:.5pt solid black;height:38.25pt;border-top:none;width:30pt'>Avg <br>check</td>
  <td class=xl69>Food</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][14]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][14]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][14]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][14]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E20:H20)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][14]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][14]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][14]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][14]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J20:M20)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][14]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][14]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][14]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][14]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O20:R20)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl69 style='height:12.75pt'>Bvr</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][15]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][15]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][15]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][15]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E21:H21)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][15]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][15]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][15]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][15]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J21:M21)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][15]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][15]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][15]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][15]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O21:R21)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl69 style='height:12.75pt'>F&amp;B</td>
  <td class=xl75 align=right x:num x:fmla="=E18/IF(E19=&quot;&quot,1,IF(E19=0,1,E19))"></td>
  <td class=xl75 align=right x:num x:fmla="=F18/IF(F19=&quot;&quot,1,IF(F19=0,1,F19))"></td>
  <td class=xl75 align=right x:num x:fmla="=G18/IF(G19=&quot;&quot,1,IF(G19=0,1,G19))"></td>
  <td class=xl75 align=right x:num x:fmla="=H18/IF(H19=&quot;&quot,1,IF(H19=0,1,H19))"></td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E22:H22)"></td>
  <td class=xl88 align=right x:num x:fmla="=J18/IF(J19=&quot;&quot,1,IF(J19=0,1,J19))"></td>
  <td class=xl89 align=right x:num x:fmla="=K18/IF(K19=&quot;&quot,1,IF(K19=0,1,K19))"></td>
  <td class=xl89 align=right x:num x:fmla="=L18/IF(L19=&quot;&quot,1,IF(L19=0,1,L19))"></td>
  <td class=xl89 align=right x:num x:fmla="=M18/IF(M19=&quot;&quot,1,IF(M19=0,1,M19))"></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J22:M22)"></td>
  <td class=xl75 align=right x:num x:fmla="=O18/IF(O19=&quot;&quot,1,IF(O19=0,1,O19))"></td>
  <td class=xl89 align=right x:num x:fmla="=P18/IF(P19=&quot;&quot,1,IF(P19=0,1,P19))"></td>
  <td class=xl89 align=right x:num x:fmla="=Q18/IF(Q19=&quot;&quot,1,IF(Q19=0,1,Q19))"></td>
  <td class=xl89 align=right x:num x:fmla="=R18/IF(R19=&quot;&quot,1,IF(R19=0,1,R19))"></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O22:R22)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td rowspan=8 height=136 class=xl114 style='border-bottom:.5pt solid black;height:102.0pt;border-top:none'>Lunch</td>
  <td rowspan=8 class=xl117 style='border-bottom:.5pt solid black;border-top:none'>11.00 AM - 4.00 PM</td>
  <td colspan=2 class=xl70 style='border-right:.5pt solid black'>Food</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][17]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][17]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][17]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][17]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E23:H23)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][17]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][17]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][17]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][17]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J23:M23)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][17]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][17]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][17]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][17]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O23:R23)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl70 style='border-right:.5pt solid black;height:12.75pt'>Bever</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][18]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][18]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][18]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][18]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E24:H24)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][18]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][18]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][18]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][18]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J24:M24)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][18]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][18]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][18]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][18]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O24:R24)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl70 style='border-right:.5pt solid black;height:12.75pt'>Other</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][19]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][19]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][19]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][19]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E25:H25)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][19]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][19]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][19]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][19]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J25:M25)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][19]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][19]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][19]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][19]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O25:R25)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl70 style='border-right:.5pt solid black;height:12.75pt'>Total</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][23]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][23]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][23]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][23]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E26:H26)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][23]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][23]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][23]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][23]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J26:M26)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][23]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][23]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][23]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][23]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O26:R26)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl70 style='border-right:.5pt solid black;height:12.75pt'>Cover</td>
  <td class=xl90 align=right x:num><%=dt.Rows[4][20]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[5][20]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[6][20]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[7][20]%> </td>
  <td class=xl94 align=right x:num x:fmla="=SUM(E27:H27)"> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[0][20]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[1][20]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[2][20]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[3][20]%> </td>
  <td class=xl94 align=right x:num x:fmla="=SUM(J27:M27)"> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[8][20]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[9][20]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[10][20]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[11][20]%> </td>
  <td class=xl94 align=right x:num x:fmla="=SUM(O27:R27)"> </td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td rowspan=3 height=51 class=xl111 width=40 style='border-bottom:.5pt solid black;height:38.25pt;border-top:none;width:30pt'>Avg <br>check</td>
  <td class=xl69>Food</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][21]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][21]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][21]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][21]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E28:H28)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][21]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][21]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][21]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][21]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J28:M28)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][21]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][21]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][21]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][21]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O28:R28)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl69 style='height:12.75pt'>Bvr</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][22]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][22]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][22]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][22]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E29:H29)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][22]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][22]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][22]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][22]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J29:M29)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][22]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][22]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][22]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][22]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O29:R29)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl69 style='height:12.75pt'>F&amp;B</td>
  <td class=xl75 align=right x:num x:fmla="=E26/IF(E27=&quot;&quot,1,IF(E27=0,1,E27))"></td>
  <td class=xl75 align=right x:num x:fmla="=F26/IF(F27=&quot;&quot,1,IF(F27=0,1,F27))"></td>
  <td class=xl75 align=right x:num x:fmla="=G26/IF(G27=&quot;&quot,1,IF(G27=0,1,G27))"></td>
  <td class=xl75 align=right x:num x:fmla="=H26/IF(H27=&quot;&quot,1,IF(H27=0,1,H27))"></td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E30:H30)"></td>
  <td class=xl88 align=right x:num x:fmla="=J26/IF(J27=&quot;&quot,1,IF(J27=0,1,J27))"></td>
  <td class=xl89 align=right x:num x:fmla="=K26/IF(K27=&quot;&quot,1,IF(K27=0,1,K27))"></td>
  <td class=xl89 align=right x:num x:fmla="=L26/IF(L27=&quot;&quot,1,IF(L27=0,1,L27))"></td>
  <td class=xl89 align=right x:num x:fmla="=M26/IF(M27=&quot;&quot,1,IF(M27=0,1,M27))"></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J30:M30)"></td>
  <td class=xl75 align=right x:num x:fmla="=O26/IF(O27=&quot;&quot,1,IF(O27=0,1,O27))"></td>
  <td class=xl89 align=right x:num x:fmla="=P26/IF(P27=&quot;&quot,1,IF(P27=0,1,P27))"></td>
  <td class=xl89 align=right x:num x:fmla="=Q26/IF(Q27=&quot;&quot,1,IF(Q27=0,1,Q27))"></td>
  <td class=xl89 align=right x:num x:fmla="=R26/IF(R27=&quot;&quot,1,IF(R27=0,1,R27))"></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O30:R30)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td rowspan=8 height=136 class=xl114 style='border-bottom:.5pt solid black; height:102.0pt;border-top:none'>Dinner</td>
  <td rowspan=8 class=xl117 style='border-bottom:.5pt solid black;border-top:none'>4.00 PM - 10.00 PM</td>
  <td colspan=2 class=xl70 style='border-right:.5pt solid black'>Food</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][24]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][24]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][24]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][24]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E31:H31)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][24]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][24]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][24]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][24]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J31:M31)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][24]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][24]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][24]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][24]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O31:R31)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl70 style='border-right:.5pt solid black; height:12.75pt'>Bever</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][25]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][25]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][25]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][25]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E32:H32)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][25]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][25]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][25]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][25]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J32:M32)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][25]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][25]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][25]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][25]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O32:R32)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl70 style='border-right:.5pt solid black; height:12.75pt'>Other</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][26]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][26]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][26]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][26]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E33:H33)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][26]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][26]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][26]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][26]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J33:M33)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][26]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][26]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][26]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][26]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O33:R33)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl70 style='border-right:.5pt solid black; height:12.75pt'>Total</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][30]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][30]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][30]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][30]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E34:H34)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][30]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][30]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][30]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][30]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J34:M34)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][30]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][30]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][30]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][30]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O34:R34)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl70 style='border-right:.5pt solid black;height:12.75pt'>Cover</td>
  <td class=xl90 align=right x:num><%=dt.Rows[4][27]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[5][27]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[6][27]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[7][27]%> </td>
  <td class=xl94 align=right x:num x:fmla="=SUM(E35:H35)"> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[0][27]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[1][27]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[2][27]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[3][27]%> </td>
  <td class=xl94 align=right x:num x:fmla="=SUM(J35:M35)"> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[8][27]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[9][27]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[10][27]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[11][27]%> </td>
  <td class=xl94 align=right x:num x:fmla="=SUM(O35:R35)"> </td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td rowspan=3 height=51 class=xl111 width=40 style='border-bottom:.5pt solid black;height:38.25pt;border-top:none;width:30pt'>Avg <br>check</td>
  <td class=xl69>Food</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][28]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][28]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][28]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][28]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E36:H36)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][28]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][28]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][28]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][28]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J36:M36)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][28]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][28]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][28]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][28]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O36:R36)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl69 style='height:12.75pt'>Bvr</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][29]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][29]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][29]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][29]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E37:H37)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][29]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][29]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][29]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][29]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J37:M37)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][29]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][29]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][29]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][29]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O37:R37)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl69 style='height:12.75pt'>F&amp;B</td>
  <td class=xl75 align=right x:num x:fmla="=E34/IF(E35=&quot;&quot,1,IF(E35=0,1,E35))"></td>
  <td class=xl75 align=right x:num x:fmla="=F34/IF(F35=&quot;&quot,1,IF(F35=0,1,F35))"></td>
  <td class=xl75 align=right x:num x:fmla="=G34/IF(G35=&quot;&quot,1,IF(G35=0,1,G35))"></td>
  <td class=xl75 align=right x:num x:fmla="=H34/IF(H35=&quot;&quot,1,IF(H35=0,1,H35))"></td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E38:H38)"></td>
  <td class=xl88 align=right x:num x:fmla="=J34/IF(J35=&quot;&quot,1,IF(J35=0,1,J35))"></td>
  <td class=xl89 align=right x:num x:fmla="=K34/IF(K35=&quot;&quot,1,IF(K35=0,1,K35))"></td>
  <td class=xl89 align=right x:num x:fmla="=L34/IF(L35=&quot;&quot,1,IF(L35=0,1,L35))"></td>
  <td class=xl89 align=right x:num x:fmla="=M34/IF(M35=&quot;&quot,1,IF(M35=0,1,M35))"></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J38:M38)"></td>
  <td class=xl75 align=right x:num x:fmla="=O34/IF(O35=&quot;&quot,1,IF(O35=0,1,O35))"></td>
  <td class=xl89 align=right x:num x:fmla="=P34/IF(P35=&quot;&quot,1,IF(P35=0,1,P35))"></td>
  <td class=xl89 align=right x:num x:fmla="=Q34/IF(Q35=&quot;&quot,1,IF(Q35=0,1,Q35))"></td>
  <td class=xl89 align=right x:num x:fmla="=R34/IF(R35=&quot;&quot,1,IF(R35=0,1,R35))"></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O38:R38)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td rowspan=8 height=137 class=xl114 style='border-bottom:1.0pt solid black;height:102.75pt;border-top:none'>Night</td>
  <td rowspan=8 class=xl117 style='border-bottom:1.0pt solid black;border-top:none'>10.00 PM - 6.00 AM</td>
  <td colspan=2 class=xl70 style='border-right:.5pt solid black'>Food</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][31]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][31]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][31]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][31]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E39:H39)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][31]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][31]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][31]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][31]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J39:M39)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][31]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][31]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][31]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][31]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O39:R39)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl70 style='border-right:.5pt solid black;height:12.75pt'>Bever</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][32]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][32]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][32]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][32]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E40:H40)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][32]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][32]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][32]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][32]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J40:M40)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][32]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][32]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][32]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][32]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O40:R40)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl70 style='border-right:.5pt solid black; height:12.75pt'>Other</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][33]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][33]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][33]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][33]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E41:H41)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][33]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][33]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][33]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][33]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J41:M41)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][33]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][33]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][33]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][33]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O41:R41)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl70 style='border-right:.5pt solid black; height:12.75pt'>Total</td>
<td class=xl75 align=right x:num><%=dt.Rows[4][37]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][37]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][37]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][37]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E42:H42)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][37]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][37]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][37]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][37]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J42:M42)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][37]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][37]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][37]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][37]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O42:R42)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=2 height=17 class=xl70 style='border-right:.5pt solid black; height:12.75pt'>Cover</td>
  <td class=xl90 align=right x:num><%=dt.Rows[4][34]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[5][34]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[6][34]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[7][34]%> </td>
  <td class=xl94 align=right x:num x:fmla="=SUM(E43:H43)"> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[0][34]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[1][34]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[2][34]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[3][34]%> </td>
  <td class=xl94 align=right x:num x:fmla="=SUM(J43:M43)"> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[8][34]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[9][34]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[10][34]%> </td>
  <td class=xl90 align=right x:num><%=dt.Rows[11][34]%> </td>
  <td class=xl94 align=right x:num x:fmla="=SUM(O43:R43)"> </td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td rowspan=3 height=52 class=xl111 width=40 style='border-bottom:1.0pt solid black;height:39.0pt;border-top:none;width:30pt'>Avg <br>check</td>
  <td class=xl69>Food</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][35]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][35]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][35]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][35]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E44:H44)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][35]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][35]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][35]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][35]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J44:M44)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][35]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][35]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][35]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][35]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O44:R44)"></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl69 style='height:12.75pt'>Bvr</td>
  <td class=xl75 align=right x:num><%=dt.Rows[4][36]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[5][36]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[6][36]%> </td>
  <td class=xl75 align=right x:num><%=dt.Rows[7][36]%> </td>
  <td class=xl79 align=right x:num x:fmla="=SUM(E45:H45)"></td>
  <td class=xl88 align=right x:num><%=dt.Rows[0][36]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[1][36]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[2][36]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[3][36]%> </td>
  <td class=xl82 align=right x:num x:fmla="=SUM(J45:M45)"></td>
  <td class=xl75 align=right x:num><%=dt.Rows[8][36]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[9][36]%> </td>
  <td class=xl89 align=right x:num><%=dt.Rows[10][36]%></td>
  <td class=xl89 align=right x:num><%=dt.Rows[11][36]%></td>
  <td class=xl82 align=right x:num x:fmla="=SUM(O45:R45)"></td>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl74 style='height:13.5pt'>F&amp;B</td>
  <td class=xl76 x:num x:fmla="=E42/IF(E43=&quot;&quot,1,IF(E43=0,1,E43))"></td>
  <td class=xl76 x:num x:fmla="=F42/IF(F43=&quot;&quot,1,IF(F43=0,1,F43))"></td>
  <td class=xl76 x:num x:fmla="=G42/IF(G43=&quot;&quot,1,IF(G43=0,1,G43))"></td>
  <td class=xl76 x:num x:fmla="=H42/IF(H43=&quot;&quot,1,IF(H43=0,1,H43))"></td>
  <td class=xl80 x:num x:fmla="=SUM(E46:H46)"></td>
  <td class=xl77 x:num x:fmla="=J42/IF(J43=&quot;&quot,1,IF(J43=0,1,J43))"></td>
  <td class=xl76 x:num x:fmla="=K42/IF(K43=&quot;&quot,1,IF(K43=0,1,K43))"></td>
  <td class=xl76 x:num x:fmla="=L42/IF(L43=&quot;&quot,1,IF(L43=0,1,L43))"></td>
  <td class=xl76 x:num x:fmla="=M42/IF(M43=&quot;&quot,1,IF(M43=0,1,M43))"></td>
  <td class=xl83 x:num x:fmla="=SUM(J46:M46)"></td>
  <td class=xl76 x:num x:fmla="=O42/IF(O43=&quot;&quot,1,IF(O43=0,1,O43))"></td>
  <td class=xl76 x:num x:fmla="=P42/IF(P43=&quot;&quot,1,IF(P43=0,1,P43))"></td>
  <td class=xl76 x:num x:fmla="=Q42/IF(Q43=&quot;&quot,1,IF(Q43=0,1,Q43))"></td>
  <td class=xl76 x:num x:fmla="=R42/IF(R43=&quot;&quot,1,IF(R43=0,1,R43))"></td>
  <td class=xl83 align=right x:num x:fmla="=SUM(O46:R46)"></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=19 style='width:14pt'></td>
  <td width=17 style='width:13pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=29 style='width:22pt'></td>
  <td width=43 style='width:32pt'></td>
  <td width=44 style='width:33pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=58 style='width:44pt'></td>
  <td width=52 style='width:39pt'></td>
  <td width=52 style='width:39pt'></td>
  <td width=52 style='width:39pt'></td>
  <td width=52 style='width:39pt'></td>
  <td width=65 style='width:49pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=70 style='width:53pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
