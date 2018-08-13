<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<% CtlLib.SetUser(Session["APP_DBUSER"].ToString());%>
<% 	
    Response.ContentType = "application/vnd.ms-excel";
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string p_master_pk = Request.QueryString["master_pk"];
    string para = "'" + p_master_pk + "'";
    DataTable dt, dt1, dt2;
    dt = CtlLib.TableReadOpenCursor("SALE.sp_rpt_dscd00020");
    dt1 = CtlLib.TableReadOpenCursor("SALE.sp_rpt_dscd00020_1", para);
    dt2 = CtlLib.TableReadOpenCursor("SALE.sp_rpt_dscd00020_2", para);
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_dscd00020_droco_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dscd00020_droco_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dscd00020_droco_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Mr.Cuong</o:Author>
  <o:LastAuthor>Trung</o:LastAuthor>
  <o:LastPrinted>2012-02-13T06:16:19Z</o:LastPrinted>
  <o:Created>2011-10-13T06:18:26Z</o:Created>
  <o:LastSaved>2012-02-13T06:17:25Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"&C&P\/&N";
	margin:.49in .39in .79in .53in;
	mso-header-margin:.2in;
	mso-footer-margin:.31in;}
.font5
	{color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font6
	{color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font8
	{color:black;
	font-size:12.0pt;
	font-weight:700;
	font-style:italic;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font9
	{color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font10
	{color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font11
	{color:black;
	font-size:12.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:"Times New Roman", serif;
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
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal;
	mso-style-id:0;}
.style58
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
	font-family:"\.VnTime", sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:"Normal 3";}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
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
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl67
	{mso-style-parent:style43;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";}
.xl68
	{mso-style-parent:style43;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";}
.xl69
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl70
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl71
	{mso-style-parent:style43;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl72
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl73
	{mso-style-parent:style43;
	font-size:10.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl74
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	white-space:normal;}
.xl76
	{mso-style-parent:style43;
	font-size:12.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";}
.xl77
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl78
	{mso-style-parent:style43;
	font-size:10.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl79
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl81
	{mso-style-parent:style43;
	font-size:14.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";}
.xl82
	{mso-style-parent:style43;
	font-size:14.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";}
.xl83
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl84
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl85
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;}
.xl86
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl87
	{mso-style-parent:style43;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:middle;}
.xl88
	{mso-style-parent:style43;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:middle;}
.xl89
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl90
	{mso-style-parent:style43;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl92
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	white-space:normal;}
.xl94
	{mso-style-parent:style43;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl97
	{mso-style-parent:style43;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	color:blue;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl99
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl100
	{mso-style-parent:style58;
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl102
	{mso-style-parent:style43;
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00000_\)\;_\(* \\\(\#\,\#\#0\.00000\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl103
	{mso-style-parent:style43;
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl104
	{mso-style-parent:style0;
	color:blue;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";}
.xl105
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl106
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
	border-left:none;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl109
	{mso-style-parent:style43;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl110
	{mso-style-parent:style43;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl111
	{mso-style-parent:style43;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl112
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:top;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl114
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl123
	{mso-style-parent:style43;
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl124
	{mso-style-parent:style43;
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl125
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl128
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl129
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl131
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;}
.xl132
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[$-1010000\]d\/m\/yyyy\;\@";
	text-align:left;
	vertical-align:middle;}
.xl133
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl135
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
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
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
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
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl139
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl140
	{mso-style-parent:style43;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Fixed;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl141
	{mso-style-parent:style43;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Fixed;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl142
	{mso-style-parent:style43;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Fixed;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl143
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>yeu cau xuat kho</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>315</x:DefaultRowHeight>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>77</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:TabColorIndex>40</x:TabColorIndex>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>10</x:ActiveRow>
       <x:ActiveCol>10</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>11580</x:WindowHeight>
  <x:WindowWidth>15480</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>105</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>='yeu cau xuat kho'!$13:$16</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl66>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1120 style='border-collapse:
 collapse;table-layout:fixed;width:841pt'>
 <col class=xl66 width=37 style='mso-width-source:userset;mso-width-alt:1353;
 width:28pt'>
 <col class=xl66 width=200 style='mso-width-source:userset;mso-width-alt:7314;
 width:150pt'>
 <col class=xl66 width=107 style='mso-width-source:userset;mso-width-alt:3913;
 width:80pt'>
 <col class=xl66 width=78 style='mso-width-source:userset;mso-width-alt:2852;
 width:59pt'>
 <col class=xl66 width=89 style='mso-width-source:userset;mso-width-alt:3254;
 width:67pt'>
 <col class=xl68 width=75 style='mso-width-source:userset;mso-width-alt:2742;
 width:56pt'>
 <col class=xl66 width=80 style='mso-width-source:userset;mso-width-alt:2925;
 width:60pt'>
 <col class=xl67 width=180 style='mso-width-source:userset;mso-width-alt:6582;
 width:135pt'>
 <col class=xl66 width=82 style='mso-width-source:userset;mso-width-alt:2998;
 width:62pt'>
 <col class=xl66 width=64 span=3 style='width:48pt'>
 <tr height=21 style='height:15.75pt'>
  <td colspan=3 height=21 class=xl127 width=344 style='height:15.75pt;
  width:258pt'>Công ty TNHH Dorco Vina</td>
  <td class=xl66 width=78 style='width:59pt'></td>
  <td class=xl66 width=89 style='width:67pt'></td>
  <td class=xl68 width=75 style='width:56pt'></td>
  <td class=xl66 width=80 style='width:60pt'><span
  style='mso-spacerun:yes'> </span>M&#7851;u s&#7889;:02</td>
  <td class=xl67 width=180 style='width:135pt'></td>
  <td class=xl68 width=82 style='width:62pt'></td>
  <td class=xl68 width=64 style='width:48pt'></td>
  <td class=xl66 width=64 style='width:48pt'></td>
  <td class=xl66 width=64 style='width:48pt'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=3 height=21 class=xl128 style='height:15.75pt'>&#272;&#432;&#7901;ng
  B3, khu B, KCN Ph&#7889; N&#7889;i A</td>
  <td class=xl70>S&#7889;/No: <%=dt1.Rows[0]["slip_no"]%></td>
  <td class=xl70></td>
  <td class=xl68></td>
  <td class=xl66 colspan=2 style='mso-ignore:colspan'>Q&#272;
  s&#7889;:15/2006/Q&#272;/BTC</td>
  <td colspan=4 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=3 height=21 class=xl129 width=344 style='height:15.75pt;
  width:258pt'>Xã Minh H&#7843;i Huy&#7879;n V&#259;n Lâm, H&#432;ng Yên</td>
  <td class=xl70 colspan=2 style='mso-ignore:colspan'>&#272;&#417;n hàng/PO: <%=dt1.Rows[0]["ref_no"]%></td>
  <td class=xl68></td>
  <td class=xl72 colspan=2 style='mso-ignore:colspan'>Decree No
  15/2006/Q&#272;/BTC</td>
  <td colspan=2 class=xl68 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl74 style='height:15.0pt'></td>
  <td class=xl75></td>
  <td colspan=3 class=xl66 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl66 colspan=2 style='mso-ignore:colspan'>Ngày 20/3/2006 c&#7911;a
  B&#7897; tr&#432;&#7903;ng BTC</td>
  <td colspan=2 class=xl76 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 colspan=2 class=xl75 style='height:16.5pt;mso-ignore:colspan'></td>
  <td colspan=4 class=xl113 style='mso-ignore:colspan'></td>
  <td class=xl77 colspan=2 style='mso-ignore:colspan'>Dated Mar,20th,2006 of
  Financial Ministry</td>
  <td colspan=2 class=xl68 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
  <td colspan=8 height=36 class=xl139 width=846 style='height:27.0pt;
  width:635pt'>PHI&#7870;U YÊU C&#7846;U XU&#7844;T KHO THÀNH PH&#7848;M</td>
  <td colspan=2 class=xl76 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td colspan=2 height=25 class=xl130 style='height:18.75pt'></td>
  <td colspan=2 class=xl131><span style='mso-spacerun:yes'>             
  </span>Ngày/ Date:</td>
  <td colspan=2 class=xl132> <%=dt1.Rows[0]["out_dd"]%>/<%=dt1.Rows[0]["out_mm"]%>/<%=dt1.Rows[0]["out_yy"]%></td>
  <td class=xl80></td>
  <td class=xl81></td>
  <td colspan=2 class=xl82 style='mso-ignore:colspan'></td>
  <td class=xl83></td>
  <td class=xl66></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:13.15pt'>
  <td height=17 colspan=2 class=xl84 style='height:13.15pt;mso-ignore:colspan'></td>
  <td class=xl85></td>
  <td colspan=2 class=xl69 style='mso-ignore:colspan'></td>
  <td class=xl76></td>
  <td class=xl86></td>
  <td class=xl87></td>
  <td colspan=2 class=xl88 style='mso-ignore:colspan'></td>
  <td class=xl89></td>
  <td class=xl66></td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.45pt'>
  <td colspan=8 height=27 class=xl133 width=846 style='height:20.45pt;
  width:635pt' >&#272;&#417;n
  v&#7883; nh&#7853;n hàng: <%=dt1.Rows[0]["partner_name"]%></td>
  <td colspan=2 class=xl90 style='mso-ignore:colspan'></td>
  <td class=xl91></td>
  <td class=xl66></td>
 </tr>
 <tr class=xl80 height=27 style='mso-height-source:userset;height:20.45pt'>
  <td colspan=8 height=27 class=xl133 width=846 style='height:20.45pt;
  width:635pt' >&#272;&#7883;a
  ch&#7881;: <%=dt1.Rows[0]["addr1"]%></td>
  <td colspan=2 class=xl70 style='mso-ignore:colspan'></td>
  <td class=xl92></td>
  <td class=xl80></td>
 </tr>
 <tr class=xl69 height=27 style='mso-height-source:userset;height:20.45pt'>
 <%
     if (dt2.Rows.Count > 0)
     {
         %>
         <td colspan=8 height=27 class=xl133 width=846 style='height:20.45pt;
  width:635pt'>Xu&#7845;t t&#7841;i
  kho: <%=dt2.Rows[0]["wh_name"]%></td>
         <% 
     }
     else
     {
         %>
         <td colspan=8 height=27 class=xl133 width=846 style='height:20.45pt;
  width:635pt'>Xu&#7845;t t&#7841;i
  kho: </td>
         <% 
     }
      %>
  
  <td colspan=2 class=xl68 style='mso-ignore:colspan'></td>
  <td class=xl79></td>
  <td class=xl69></td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.45pt'>
  <td colspan=8 height=27 class=xl134 style='height:20.45pt' >Chi
  chú:<%=dt1.Rows[0]["description"]%></td>
  <td colspan=4 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td rowspan=3 height=96 class=xl135 width=37 style='border-bottom:.5pt solid black;
  height:72.0pt;border-top:none;width:28pt'><font class="font9">STT</font><font
  class="font5"><br>
    <span style='mso-spacerun:yes'> </span>No</font></td>
  <td rowspan=3 class=xl135 width=200 style='border-bottom:.5pt solid black;
  border-top:none;width:150pt'>Tên s&#7843;n ph&#7849;m<br>
    <font class="font6">(Product name)</font></td>
  <td rowspan=3 class=xl135 width=107 style='border-bottom:.5pt solid black;
  border-top:none;width:80pt'>Mã s&#7889;<br>
    <font class="font6">(Code)</font></td>
  <td rowspan=3 class=xl135 width=78 style='border-bottom:.5pt solid black;
  border-top:none;width:59pt'>&#272;&#417;n v&#7883; tính<br>
    (<font class="font6">UOM)</font></td>
  <td colspan=2 rowspan=3 class=xl115 width=164 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:123pt'>S&#7889; l&#432;&#7907;ng yêu
  c&#7847;u<span style='mso-spacerun:yes'>  </span><br>
    ( <font class="font11">Request quantity</font><font class="font10">)</font></td>
  <td rowspan=3 class=xl135 width=80 style='border-bottom:.5pt solid black;
  border-top:none;width:60pt'>&#272;&#417;n giá<br>
    <font class="font6">(Unit price)<br>
    USD</font></td>
  <td rowspan=3 class=xl140 width=180 style='border-bottom:.5pt solid black;
  border-top:none;width:135pt'>Thành ti&#7873;n<br>
    <span style='mso-spacerun:yes'> </span>(<font class="font11">USD Amount</font><font
  class="font10">)</font></td>
  <td colspan=4 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td height=32 colspan=4 class=xl66 style='height:24.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td height=32 colspan=2 class=xl66 style='height:24.0pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl94 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.45pt'>
  <td height=23 class=xl95 width=37 style='height:17.45pt;width:28pt'>A</td>
  <td class=xl96 width=200 style='width:150pt'>B</td>
  <td class=xl96 width=107 style='width:80pt'>C</td>
  <td class=xl96 width=78 style='width:59pt'>D</td>
  <td colspan=2 class=xl121 width=164 style='border-right:.5pt solid black;
  border-left:none;width:123pt' x:num>1</td>
  <td class=xl96 width=80 style='width:60pt' x:num>2</td>
  <td class=xl97 width=180 style='width:135pt' x:num>3</td>
  <td colspan=4 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <%
     for (int i = 0; i < dt2.Rows.Count; i++)
     {
         %>
<tr class=xl98 height=87 style='mso-height-source:userset;height:65.25pt'>
  <td height=87 class=xl114 width=37 style='height:65.25pt;width:28pt' x:num><%=i+1 %></td>
  <td class=xl99 width=200 style='width:150pt'><%=dt2.Rows[i]["item_name"]%></td>
  <td class=xl100 width=107 style='width:80pt'><%=dt2.Rows[i]["item_code"]%></td>
  <td class=xl101><%=dt2.Rows[i]["uom"]%></td>
  <td colspan=2 class=xl123 style='border-right:.5pt solid black;border-left:
  none'x:num><%=dt2.Rows[i]["req_qty"]%></td>
  <td class=xl102></td>
  <td class=xl103></td>
  <td colspan=2 class=xl104 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl98 style='mso-ignore:colspan'></td>
 </tr>
         <% 
     }
  %>
 
 <tr class=xl70 height=42 style='mso-height-source:userset;height:31.9pt'>
  <td height=42 class=xl105 width=37 style='height:31.9pt;width:28pt'>&nbsp;</td>
  <td class=xl106 width=200 style='width:150pt'>C&#7897;ng/<font class="font8">
  Total</font></td>
  <td class=xl107 width=107 style='width:80pt'>&nbsp;</td>
  <td class=xl107 width=78 style='width:59pt'>&nbsp;</td>
  <td colspan=2 class=xl125 width=164 style='border-right:.5pt solid black;
  border-left:none;width:123pt'>&nbsp;</td>
  <td class=xl108 width=80 style='width:60pt'>&nbsp;</td>
  <td class=xl109 width=180 style='width:135pt'>&nbsp;</td>
  <td colspan=4 class=xl70 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=5 class=xl66 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl66></td>
  <td class=xl67></td>
  <td colspan=4 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=2 height=21 class=xl138 style='height:15.75pt'>Ng&#432;&#7901;i
  l&#7853;p phi&#7871;u</td>
  <td colspan=2 class=xl138>Ng&#432;&#7901;i nh&#7853;n</td>
  <td colspan=2 class=xl138>Th&#7911; kho</td>
  <td class=xl93></td>
  <td class=xl110>Qu&#7843;n lý kho</td>
  <td class=xl93></td>
  <td colspan=3 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=2 height=21 class=xl138 style='height:15.75pt'>Prepared by</td>
  <td colspan=2 class=xl138>Receiver</td>
  <td colspan=2 class=xl143>Stock keeper</td>
  <td class=xl67></td>
  <td class=xl110>Warehouse manager</td>
  <td colspan=4 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=2 height=21 class=xl138 style='height:15.75pt'>(Ký, h&#7885; tên-
  Signature)</td>
  <td class=xl66 colspan=2 style='mso-ignore:colspan'>(Ký, h&#7885; tên-
  Signature)</td>
  <td colspan=2 class=xl138>(Ký, h&#7885; tên- Signature)</td>
  <td class=xl66></td>
  <td class=xl111><span style='mso-spacerun:yes'>  </span>(Ký, h&#7885; tên-
  Signature)</td>
  <td colspan=4 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=4 class=xl74 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl66></td>
  <td class=xl68></td>
  <td class=xl66></td>
  <td class=xl67></td>
  <td colspan=4 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=4 class=xl74 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl66></td>
  <td class=xl68></td>
  <td class=xl66></td>
  <td class=xl67></td>
  <td colspan=4 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=4 class=xl74 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl66></td>
  <td class=xl68></td>
  <td class=xl66></td>
  <td class=xl67></td>
  <td colspan=4 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl112 style='height:15.75pt'></td>
  <td colspan=3 class=xl74 style='mso-ignore:colspan'></td>
  <td class=xl66></td>
  <td class=xl68></td>
  <td class=xl66></td>
  <td class=xl67></td>
  <td colspan=4 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=5 class=xl66 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl66></td>
  <td class=xl67></td>
  <td colspan=4 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=5 class=xl66 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl66></td>
  <td class=xl67></td>
  <td colspan=4 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=5 class=xl66 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl66></td>
  <td class=xl67></td>
  <td colspan=4 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=5 class=xl66 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl66></td>
  <td class=xl67></td>
  <td colspan=4 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=37 style='width:28pt'></td>
  <td width=200 style='width:150pt'></td>
  <td width=107 style='width:80pt'></td>
  <td width=78 style='width:59pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=180 style='width:135pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
