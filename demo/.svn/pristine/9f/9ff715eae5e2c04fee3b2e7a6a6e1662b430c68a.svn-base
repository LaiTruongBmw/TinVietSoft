<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<%
	string saleorderpk="";
    saleorderpk=Request.QueryString["saleorderpk"];
    //saleorderpk = "2";
    DataTable dt;
    string sql = "select * from prod.WI_PROD_CARD a where a.del_if=0 and a.PK in (" + saleorderpk + ")";
    dt = CtlLib.TableReadOpen(sql);
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">


<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_Boxlabel_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_Boxlabel_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_Boxlabel_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Window XP Service Pack 2</o:Author>
  <o:LastAuthor>HRSV1</o:LastAuthor>
  <o:LastPrinted>2009-12-09T04:00:24Z</o:LastPrinted>
  <o:Created>2008-01-28T02:29:49Z</o:Created>
  <o:LastSaved>2009-12-09T06:23:38Z</o:LastSaved>
  <o:Company>Microsoft</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
 <o:OfficeDocumentSettings>
  <o:DownloadComponents/>
  <o:LocationOfComponents HRef="file:///D:\Software\Office%20XP\"/>
 </o:OfficeDocumentSettings>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.1in .16in .1in .28in;
	mso-header-margin:0in;
	mso-footer-margin:0in;
	mso-page-orientation:landscape;}
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
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl25
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl26
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl27
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl29
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl30
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl31
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;}
.xl32
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl33
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;}
.xl34
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl35
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;}
.xl36
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl37
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl38
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl39
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl40
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl41
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl42
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl43
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl44
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl45
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl46
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl47
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl48
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl49
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl50
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl51
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl52
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl53
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl54
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl55
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl56
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl57
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl58
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl59
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl60
	{mso-style-parent:style0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl61
	{mso-style-parent:style0;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl62
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl63
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl64
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl65
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"d\\-mmm";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl75
	{mso-style-parent:style0;
	color:black;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl77
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl81
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl82
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl83
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\[ENG\]\[$-409\]mmmm\\ d\\\,\\ yyyy\;\@";
	text-align:left;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl84
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl85
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl86
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl87
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl88
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:1.0pt solid windowtext;}
.xl89
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl90
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl91
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:2.0pt double windowtext;
	border-right:1.0pt solid black;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl92
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl93
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:2.0pt double windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl94
	{mso-style-parent:style0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl95
	{mso-style-parent:style0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl96
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl97
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl98
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid black;
	border-bottom:none;
	border-left:none;}
.xl99
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl100
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl101
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl102
	{mso-style-parent:style0;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl103
	{mso-style-parent:style0;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl104
	{mso-style-parent:style0;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid black;
	border-bottom:none;
	border-left:none;}
.xl105
	{mso-style-parent:style0;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl106
	{mso-style-parent:style0;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl107
	{mso-style-parent:style0;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:none;
	border-left:none;}
.xl108
	{mso-style-parent:style0;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;}
.xl109
	{mso-style-parent:style0;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;}
.xl110
	{mso-style-parent:style0;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;}
.xl111
	{mso-style-parent:style0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:1.0pt solid windowtext;}
.xl112
	{mso-style-parent:style0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:2.0pt double windowtext;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl117
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid black;}
.xl119
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl120
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid black;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl121
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl122
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:2.0pt double windowtext;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl123
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl124
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid black;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl125
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl126
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl128
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid black;}
.xl129
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
.xl130
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl133
	{mso-style-parent:style0;
	color:black;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl134
	{mso-style-parent:style0;
	color:black;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl135
	{mso-style-parent:style0;
	color:black;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl136
	{mso-style-parent:style0;
	color:black;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl137
	{mso-style-parent:style0;
	color:black;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid black;
	border-bottom:none;
	border-left:none;}
.xl138
	{mso-style-parent:style0;
	color:black;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl139
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl140
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl141
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl142
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;}
.xl143
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl144
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl145
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid black;}
.xl146
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl147
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl148
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl149
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl150
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl151
	{mso-style-parent:style0;
	color:black;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:1.0pt solid windowtext;}
.xl152
	{mso-style-parent:style0;
	color:black;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;}
.xl153
	{mso-style-parent:style0;
	color:black;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid black;
	border-left:none;}
.xl154
	{mso-style-parent:style0;
	color:black;
	font-size:24.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:1.0pt solid black;
	border-left:none;}
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
      <x:Scale>63</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>11</x:ActiveRow>
       <x:ActiveCol>3</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
    <x:PageBreaks>
     <x:RowBreaks>
     <% 
        int irow=0;
        for(int k=0; k<dt.Rows.Count;k++) 
        {
        irow=irow+55;
     %> 
      <x:RowBreak>
       <x:Row><%=irow %></x:Row>
      </x:RowBreak>
      <%} %> 
     </x:RowBreaks>
    </x:PageBreaks>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>11850</x:WindowHeight>
  <x:WindowWidth>19200</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>2325</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 
</xml><![endif]-->
</head>
 
<body link=blue vlink=purple>

            
 
<table x:str border=0 cellpadding=0 cellspacing=0 width=1655 style='border-collapse:
 collapse;table-layout:fixed;width:1245pt'>
 <col width=105 style='mso-width-source:userset;mso-width-alt:3840;width:79pt'>
 <col width=19 style='mso-width-source:userset;mso-width-alt:694;width:14pt'>
 <col width=68 style='mso-width-source:userset;mso-width-alt:2486;width:51pt'>
 <col width=62 style='mso-width-source:userset;mso-width-alt:2267;width:47pt'>
 <col width=137 style='mso-width-source:userset;mso-width-alt:5010;width:103pt'>
 <col width=65 style='mso-width-source:userset;mso-width-alt:2377;width:49pt'>
 <col width=72 style='mso-width-source:userset;mso-width-alt:2633;width:54pt'>
 <col width=74 style='mso-width-source:userset;mso-width-alt:2706;width:56pt'>
 <col width=67 style='mso-width-source:userset;mso-width-alt:2450;width:50pt'>
 <col width=52 style='mso-width-source:userset;mso-width-alt:1901;width:39pt'>
 <col width=66 style='mso-width-source:userset;mso-width-alt:2413;width:50pt'>
 <col width=16 style='mso-width-source:userset;mso-width-alt:585;width:12pt'>
 <col width=105 style='mso-width-source:userset;mso-width-alt:3840;width:79pt'>
 <col width=19 style='mso-width-source:userset;mso-width-alt:694;width:14pt'>
 <col width=69 style='mso-width-source:userset;mso-width-alt:2523;width:52pt'>
 <col width=62 style='mso-width-source:userset;mso-width-alt:2267;width:47pt'>
 <col width=137 style='mso-width-source:userset;mso-width-alt:5010;width:103pt'>
 <col width=65 style='mso-width-source:userset;mso-width-alt:2377;width:49pt'>
 <col width=72 style='mso-width-source:userset;mso-width-alt:2633;width:54pt'>
 <col width=74 style='mso-width-source:userset;mso-width-alt:2706;width:56pt'>
 <col width=67 style='mso-width-source:userset;mso-width-alt:2450;width:50pt'>
 <col width=52 style='mso-width-source:userset;mso-width-alt:1901;width:39pt'>
 <col width=66 style='mso-width-source:userset;mso-width-alt:2413;width:50pt'>
 <col width=64 style='width:48pt'>
 
<%
        for (int i = 0; i < dt.Rows.Count; i+=2)
        {
            %>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td colspan=6 height=31 class=xl81 width=456 style='height:23.25pt;
  width:343pt' x:str="S &amp; J HOSIERY (VIETNAM) CO.,LTD. ">S &amp; J HOSIERY (VIETNAM) CO.,LTD.<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl24 width=72 style='width:54pt'>EX. FAC.:</td>
  <td colspan=2 class=xl83 width=141 style='width:106pt'><%=dt.Rows[i]["ATT05"]%></td>
  <td class=xl24 width=52 style='width:39pt'>&nbsp;</td>
  <td class=xl25 width=66 style='width:50pt'>&nbsp;</td>
  <td class=xl26 width=16 style='width:12pt'>---<span style='display:none'>-</span></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
          
  
  <td colspan=6 class=xl81 width=457 style='width:344pt'
  x:str="S &amp; J HOSIERY (VIETNAM) CO.,LTD. ">S &amp; J HOSIERY (VIETNAM)
  CO.,LTD.<span style='mso-spacerun:yes'> </span></td>
  <td class=xl24 width=72 style='width:54pt'>EX. FAC.:</td>
  <td colspan=2 class=xl83 width=141 style='width:106pt'><%=dt.Rows[i + 1]["ATT05"]%></td>
  <td class=xl24 width=52 style='width:39pt'>&nbsp;</td>
  <td class=xl25 width=66 style='width:50pt'>&nbsp;</td>
  <td width=64 style='width:48pt'></td>
          <%   
      }
      
   %>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
 
  <td height=26 class=xl27 style='height:20.1pt'>S&amp;J Order #:</td>
  <td colspan=2 class=xl84><%=dt.Rows[i]["ATT01"]%></td>
  <td class=xl28>Article #:</td>
  <td class=xl30><%=dt.Rows[i]["STYLE_ID"]%></td>
  <td class=xl29></td>
  <td class=xl31>Desc.:</td>
  <td colspan=3 class=xl85></td>
  <td class=xl32>&nbsp;</td>
  <td class=xl26></td>
  
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td class=xl27>S&amp;J Order #:</td>
  <td colspan=2 class=xl84><%=dt.Rows[i+1]["ATT01"]%></td>
  <td class=xl28>Article #:</td>
  <td class=xl30><%=dt.Rows[i+1]["STYLE_ID"]%></td>
  <td class=xl28></td>
  <td class=xl31>Desc.:</td>
  <td colspan=3 class=xl85></td>
  <td class=xl32>&nbsp;</td>
  <td class=xl26></td>
      <%   
      }
      
   %>
  
  
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl27 style='height:20.1pt'>Buyer Order #:</td>
  <td colspan=2 class=xl84><%=dt.Rows[i]["REF_PO_NO"]%></td>
  <td class=xl28>Order Qty:</td>
  <td class=xl33><%=dt.Rows[i]["ORDER_QTY"]%></td>
  <td class=xl29></td>
  <td class=xl31>Colorway:</td>
  <td colspan=2 class=xl34><%=dt.Rows[i]["SPEC01"]%></td>
  <td class=xl35>SIZE:</td>
  <td class=xl36><%=dt.Rows[i]["SPEC02"]%></td>
  <td class=xl26></td>
  
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td class=xl27>Buyer Order #:</td>
  <td colspan=2 class=xl84><%=dt.Rows[i+1]["REF_PO_NO"]%></td>
  <td class=xl28>Order Qty:</td>
  <td class=xl33><%=dt.Rows[i+1]["ORDER_QTY"]%></td>
  <td class=xl29></td>
  <td class=xl31>Colorway:</td>
  <td colspan=2 class=xl34><%=dt.Rows[i+1]["SPEC01"]%></td>
  <td class=xl35>SIZE:</td>
  <td class=xl36><%=dt.Rows[i+1]["SPEC02"]%></td>
  <td></td>
      <%   
      }
      
   %>
  
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl27 style='height:20.1pt'>Foot/Shaft/Rim:</td>
  <td colspan=2 class=xl86><%=dt.Rows[i]["ATT03"]%></td>
  <td class=xl28>Link Type:</td>
  <td class=xl34><%=dt.Rows[i]["ATT02"]%></td>
  <td class=xl37>&nbsp;</td>
  <td class=xl38>Card Qty:</td>
  <td colspan=2 class=xl87><%=dt.Rows[i]["CARD_QTY"]%></td>
  <td class=xl35>NDL.:</td>
  <td class=xl39><%=dt.Rows[i]["ATT04"]%></td>
  <td class=xl26></td>
  
   <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td class=xl27>Foot/Shaft/Rim:</td>
  <td colspan=2 class=xl86><%=dt.Rows[i+1]["ATT03"]%></td>
  <td class=xl28>Link Type:</td>
  <td class=xl34><%=dt.Rows[i+1]["ATT02"]%></td>
  <td class=xl28></td>
  <td class=xl31>Card Qty:</td>
  <td colspan=2 class=xl87><%=dt.Rows[i+1]["CARD_QTY"]%></td>
  <td class=xl35>NDL.:</td>
  <td class=xl39><%=dt.Rows[i+1]["ATT04"]%></td>
  <td></td>
      <%   
      }
      
   %>
  
  
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td colspan=5 height=19 class=xl88 style='height:14.25pt'>Printed by Knitting
  Department</td>
  <td colspan=6 class=xl90 style='border-right:1.0pt solid black'>Card <%=dt.Rows[i]["CARD_SEQ"]%> of <%=dt.Rows[i]["ATT06"]%></td>
  <td></td>
  
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=5 class=xl88>Printed by Knitting Department</td>
  <td colspan=6 class=xl90 style='border-right:1.0pt solid black'>Card <%=dt.Rows[i+1]["CARD_SEQ"]%> of <%=dt.Rows[i+1]["ATT06"]%></td>
  
  <td></td>
      <%   
      }
      
   %>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td colspan=2 height=18 class=xl92 style='border-right:.5pt solid black;
  height:13.5pt'>DEFECT LIST</td>
  <td class=xl40>Ins_ID#:</td>
  <td class=xl41>Pairing</td>
  <td class=xl41>DEFECT LIST</td>
  <td class=xl40>Inspection</td>
  <td class=xl41>Pairing</td>
  <td class=xl43>SECTION</td>
  <td class=xl44>ID #</td>
  <td class=xl45>M/C#</td>
  <td class=xl46>TL GOOD</td>
  <td></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=2 class=xl92 style='border-right:.5pt solid black'>DEFECT LIST</td>
  <td class=xl40>Ins_ID#:</td>
  <td class=xl41>Pairing</td>
  <td class=xl41>DEFECT LIST</td>
  <td class=xl40>Inspection</td>
  <td class=xl41>Pairing</td>
  <td class=xl43>SECTION</td>
  <td class=xl44>ID #</td>
  <td class=xl45>M/C#</td>
  <td class=xl46>TL GOOD</td>
 
  <td></td>
      <%   
      }
      
   %>
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl94 style='border-right:.5pt solid black;
  height:15.0pt'>Missing Logo</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl47>Yarn Prob./Offshade</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>KNITTING</td>
  <td class=xl51>&nbsp;</td>
  <td class=xl52>&nbsp;</td>
  <td class=xl53>&nbsp;</td>
  <td></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=2 class=xl94 style='border-right:.5pt solid black'>Missing Logo</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl47>Yarn Prob./Offshade</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>KNITTING</td>
  <td class=xl51>&nbsp;</td>
  <td class=xl52>&nbsp;</td>
  <td class=xl53>&nbsp;</td>
  
  <td></td>
      <%   
      }
      
   %> 
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl94 style='border-right:.5pt solid black;
  height:15.0pt'>Missing Design</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl47>Incorrect color</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>LINKING</td>
  <td class=xl51>&nbsp;</td>
  <td class=xl52>&nbsp;</td>
  <td class=xl53>&nbsp;</td>
  <td></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=2 class=xl94 style='border-right:.5pt solid black'>Missing Design</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl47>Incorrect color</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>LINKING</td>
  <td class=xl51>&nbsp;</td>
  
  <td class=xl52>&nbsp;</td>
  <td class=xl53>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl94 style='border-right:.5pt solid black;
  height:15.0pt'>Missing Terry</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl47>Loose Stitches</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>INSPEC.</td>
  <td class=xl51>&nbsp;</td>
  <td class=xl52>&nbsp;</td>
  <td class=xl53>&nbsp;</td>
  <td></td>
  
   <%
      if (i < dt.Rows.Count - 1)
      {
          %>
   <td colspan=2 class=xl94 style='border-right:.5pt solid black'>Missing Terry</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl47>Loose Stitches</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>INSPEC.</td>
  <td class=xl51>&nbsp;</td>
  
  <td class=xl52>&nbsp;</td>
  <td class=xl53>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
 
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl94 style='border-right:.5pt solid black;
  height:15.0pt'>Twisted Rubber</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Dropstitch</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>PRE-SET</td>
  <td class=xl54>&nbsp;</td>
  <td class=xl55>&nbsp;</td>
  <td class=xl56>&nbsp;</td>
  <td></td>
  
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
   <td colspan=2 class=xl94 style='border-right:.5pt solid black'>Twisted Rubber</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Dropstitch</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>PRE-SET</td>
  
  <td class=xl54>&nbsp;</td>
  <td class=xl55>&nbsp;</td>
  <td class=xl56>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl94 style='border-right:.5pt solid black;
  height:15.0pt'>Misaligned Logo</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Incorrect yarn count</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>WASHING</td>
  <td class=xl54>&nbsp;</td>
  <td class=xl55>&nbsp;</td>
  <td class=xl56>&nbsp;</td>
  <td></td>
  
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=2 class=xl94 style='border-right:.5pt solid black'>Misaligned
  Logo</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Incorrect yarn count</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>WASHING</td>
  
  <td class=xl54>&nbsp;</td>
  <td class=xl55>&nbsp;</td>
  <td class=xl56>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl94 style='border-right:.5pt solid black;
  height:15.0pt'>Plating</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Washing Oil</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>SETTING</td>
  <td class=xl51>&nbsp;</td>
  <td class=xl52>&nbsp;</td>
  <td class=xl53>&nbsp;</td>
  <td></td>
  
   <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=2 class=xl94 style='border-right:.5pt solid black'>Plating</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Washing Oil</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>SETTING</td>
  <td class=xl51>&nbsp;</td>
  
  <td class=xl52>&nbsp;</td>
  <td class=xl53>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl94 style='border-right:.5pt solid black;
  height:15.0pt'>Needle Defect</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Damage</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>PAIRING</td>
  <td class=xl51>&nbsp;</td>
  <td class=xl57>&nbsp;</td>
  <td class=xl53>&nbsp;</td>
  <td></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
   <td colspan=2 class=xl94 style='border-right:.5pt solid black'>Needle Defect</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Damage</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>PAIRING</td>
  <td class=xl51>&nbsp;</td>
  
  <td class=xl57>&nbsp;</td>
  <td class=xl53>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
  
 
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl94 style='border-right:.5pt solid black;
  height:15.0pt'>Stripping-Body</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>W/Ears Looping</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>SEWING</td>
  <td class=xl54>&nbsp;</td>
  <td class=xl55>&nbsp;</td>
  <td class=xl56>&nbsp;</td>
  <td></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
   <td colspan=2 class=xl94 style='border-right:.5pt solid black'>Stripping-Body</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>W/Ears Looping</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>SEWING</td>
  
  <td class=xl54>&nbsp;</td>
  <td class=xl55>&nbsp;</td>
  <td class=xl56>&nbsp;</td>
  <td></td>
      <%   
      }
     
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl94 style='border-right:.5pt solid black;
  height:15.0pt'>Stripping-H/T</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Bad Looping</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>LABELING</td>
  <td class=xl51>&nbsp;</td>
  <td class=xl52>&nbsp;</td>
  <td class=xl53>&nbsp;</td>
  <td></td>
   <%
      if (i < dt.Rows.Count - 1)
      {
          %>
   <td colspan=2 class=xl94 style='border-right:.5pt solid black'>Stripping-H/T</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Bad Looping</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl50>LABELING</td>
  <td class=xl51>&nbsp;</td>
  
  <td class=xl52>&nbsp;</td>
  <td class=xl53>&nbsp;</td>
  <td></td>
      <%   
      }
     
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl94 style='border-right:.5pt solid black;
  height:15.0pt'>Excess Yarn</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Dirty Looping</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl28>PACKING</td>
  <td class=xl58>&nbsp;</td>
  <td class=xl59>&nbsp;</td>
  <td class=xl32>&nbsp;</td>
  <td></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=2 class=xl94 style='border-right:.5pt solid black'>Excess Yarn</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Dirty Looping</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl28>PACKING</td>
  <td class=xl58>&nbsp;</td>
  
  <td class=xl59>&nbsp;</td>
  <td class=xl32>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl94 style='border-right:.5pt solid black;
  height:15.0pt'>Cut Yarn</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Incorrect Looping yarn</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl60>&nbsp;</td>
  <td class=xl60>&nbsp;</td>
  <td class=xl60>&nbsp;</td>
  <td class=xl61>&nbsp;</td>
  <td></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=2 class=xl94 style='border-right:.5pt solid black'>Cut Yarn</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Incorrect Looping yarn</td>
  
  <td class=xl49>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl60>&nbsp;</td>
  <td class=xl60>&nbsp;</td>
  <td class=xl60>&nbsp;</td>
  <td class=xl61>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
  
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl94 style='border-right:.5pt solid black;
  height:15.0pt'>Holes in Welt</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Bad Mending</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td colspan=4 rowspan=2 class=xl96 style='border-right:1.0pt solid black;
  border-bottom:.5pt solid black'><%=dt.Rows[i]["CARD_ID"]%></td>
  <td></td>
  
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=2 class=xl94 style='border-right:.5pt solid black'>Holes in Welt</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Bad Mending</td>
  <td class=xl49>&nbsp;</td>
  <td class=xl49>&nbsp;</td>
  <td colspan=4 rowspan=2 class=xl96 style='border-right:1.0pt solid black;
  border-bottom:.5pt solid black'><%=dt.Rows[i+1]["CARD_ID"]%></td>
 
  <td></td>
      <%   
      }
      
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl94 style='border-right:.5pt solid black;
  height:15.0pt'>Holes in Rubber</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Damage Linking</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=2 class=xl94 style='border-right:.5pt solid black'>Holes in
  Rubber</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Damage Linking</td>
  
  <td class=xl48>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td></td>
      <%   
      }
     
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl94 style='border-right:.5pt solid black;
  height:15.0pt'>Holes in Heel</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Mending Toe</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td colspan=4 rowspan=3 class=xl102 style='border-right:1.0pt solid black;
  border-bottom:.5pt solid black'>*<%=dt.Rows[i]["CARD_ID"]%>*</td>
  <td></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
 <td colspan=2 class=xl94 style='border-right:.5pt solid black'>Holes in Heel</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>Mending Toe</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td colspan=4 rowspan=3 class=xl102 style='border-right:1.0pt solid black;
  border-bottom:.5pt solid black'>*<%=dt.Rows[i+1]["CARD_ID"]%>*</td>
  
  <td></td>
      <%   
      }
      
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl94 style='border-right:.5pt solid black;
  height:15.0pt'>Holes in Toe</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>No Pair</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
 <td colspan=2 class=xl94 style='border-right:.5pt solid black'>Holes in Toe</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>No Pair</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  
  <td></td>
      <%   
      }
     
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl111 style='border-right:.5pt solid black;
  height:15.0pt'>Holes in Foot</td>
  <td class=xl62>&nbsp;</td>
  <td class=xl63>&nbsp;</td>
  <td class=xl63>Re-Setting</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td></td>
 <%
      if (i < dt.Rows.Count - 1)
      {
          %>
 <td colspan=2 class=xl111 style='border-right:.5pt solid black'>Holes in Foot</td>
  <td class=xl62>&nbsp;</td>
  <td class=xl63>&nbsp;</td>
  <td class=xl63>Re-Setting</td>
  <td class=xl48>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  
  <td></td>
      <%   
      }
      
   %> 
 
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=2 height=22 class=xl113 style='height:16.5pt'>Labelling Shift:</td>
  <td colspan=3 class=xl115 style='border-right:1.0pt solid black'><%=dt.Rows[i]["ATT01"]%> / <%=dt.Rows[i]["STYLE_ID"]%> / <%=dt.Rows[i]["SPEC01"]%> / <%=dt.Rows[i]["SPEC02"]%></td>
  <td colspan=2 class=xl118 style='border-left:none'>Packing Shift:</td>
  <td colspan=4 class=xl119 style='border-right:1.0pt solid black'><%=dt.Rows[i]["ATT01"]%> / <%=dt.Rows[i]["STYLE_ID"]%> / <%=dt.Rows[i]["SPEC01"]%> / <%=dt.Rows[i]["SPEC02"]%></td>
  <td class=xl64></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
 <td class=xl65>Labelling Shift:</td>
  <td class=xl42></td>
  <td colspan=3 class=xl121 style='border-right:1.0pt solid black'><%=dt.Rows[i+1]["ATT01"]%> / <%=dt.Rows[i+1]["STYLE_ID"]%> / <%=dt.Rows[i+1]["SPEC01"]%> / <%=dt.Rows[i+1]["SPEC02"]%></td>
  <td colspan=2 class=xl118 style='border-left:none'>Packing Shift:</td>
  <td colspan=4 class=xl123 style='border-right:1.0pt solid black'><%=dt.Rows[i+1]["ATT01"]%> / <%=dt.Rows[i+1]["STYLE_ID"]%> / <%=dt.Rows[i+1]["SPEC01"]%> / <%=dt.Rows[i+1]["SPEC02"]%></td>
  
  <td></td>
      <%   
      }
     
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl66 style='height:15.0pt'>Card Qty:</td>
  <td class=xl67><%=dt.Rows[i]["ATT06"]%></td>
  <td class=xl68>Labeler ID#:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl69>&nbsp;</td>
  <td class=xl68>Card Qty:</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl68><%=dt.Rows[i]["ATT06"]%></td>
  <td colspan=2 class=xl71>Packer_ID#:</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl64></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
 <td class=xl73>Card Qty:</td>
  <td class=xl71><%=dt.Rows[i+1]["ATT06"]%></td>
  <td class=xl68>Labeler ID#:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl69>&nbsp;</td>
  <td class=xl68>Card Qty:</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl68><%=dt.Rows[i+1]["ATT06"]%></td>
  <td colspan=2 class=xl71>Packer_ID#:</td>
  
  <td class=xl72>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl66 style='height:15.0pt'>Date Start:</td>
  <td class=xl74>&nbsp;</td>
  <td class=xl67>Date Finish:</td>
  <td class=xl67>&nbsp;</td>
  <td class=xl69>M/C# :</td>
  <td class=xl68>Date Start:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl68>&nbsp;</td>
  <td colspan=2 class=xl71>Date Finish:</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl64></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
 <td class=xl66>Date Start:</td>
  <td class=xl74>&nbsp;</td>
  <td class=xl67>Date Finish:</td>
  <td class=xl67>&nbsp;</td>
  <td class=xl69>M/C# :</td>
  <td class=xl68>Date Start:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl68>&nbsp;</td>
  <td colspan=2 class=xl71>Date Finish:</td>
  
  <td class=xl72>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=3 height=20 class=xl125 style='height:15.0pt' ><%=dt.Rows[i]["CARD_ID"]%></td>
  <td colspan=2 class=xl126 style='border-right:1.0pt solid black'>Card <%=i+1%> of <%=dt.Rows[i]["ATT06"]%></td>
  <td colspan=3 class=xl128 style='border-left:none'><%=dt.Rows[i]["CARD_ID"]%></td>
  <td colspan=3 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+1%> of <%=dt.Rows[i]["ATT06"]%></td>
  <td class=xl42></td>
   <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=3 class=xl125 ><%=dt.Rows[i+1]["CARD_ID"]%></td>
  <td colspan=2 class=xl126 style='border-right:1.0pt solid black'>Card <%=i+2%> of <%=dt.Rows[i+1]["ATT06"]%></td>
  <td colspan=3 class=xl128 style='border-left:none'><%=dt.Rows[i+1]["CARD_ID"]%></td>
  <td colspan=3 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+2%> of <%=dt.Rows[i+1]["ATT06"]%></td>
 
  <td></td>
      <%   
      }
      
   %> 
 
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=5 rowspan=2 height=55 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black;height:41.85pt'>*<%=dt.Rows[i]["CARD_ID"]%>*</td>
  <td colspan=6 rowspan=2 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'>*<%=dt.Rows[i]["CARD_ID"]%>*</td>
  <td></td>
   <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=5 rowspan=2 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'>*<%=dt.Rows[i+1]["CARD_ID"]%>*</td>
  <td colspan=6 rowspan=2 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'>*<%=dt.Rows[i+1]["CARD_ID"]%>*</td>
  
  <td></td>
      <%   
      }
     
   %> 
  
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl75 style='height:21.75pt'></td>
  <td></td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=2 height=22 class=xl139 style='border-right:.5pt solid black;
  height:16.5pt'>Pairing Shift:</td>
  <td colspan=3 class=xl142 style='border-right:1.0pt solid black;border-left:
  none'><%=dt.Rows[i]["ATT01"]%> / <%=dt.Rows[i]["STYLE_ID"]%> / <%=dt.Rows[i]["SPEC01"]%> / <%=dt.Rows[i]["SPEC02"]%></td>
  <td colspan=2 class=xl145 style='border-left:none'>Sewing Shift:</td>
  <td colspan=4 class=xl141 style='border-right:1.0pt solid black'><%=dt.Rows[i]["ATT01"]%> / <%=dt.Rows[i]["STYLE_ID"]%> / <%=dt.Rows[i]["SPEC01"]%> / <%=dt.Rows[i]["SPEC02"]%></td>
  <td></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
 <td colspan=2 class=xl139 style='border-right:.5pt solid black'>Pairing
  Shift:</td>
  <td colspan=3 class=xl142 style='border-right:1.0pt solid black;border-left:
  none'><%=dt.Rows[i+1]["ATT01"]%> / <%=dt.Rows[i+1]["STYLE_ID"]%> / <%=dt.Rows[i+1]["SPEC01"]%> / <%=dt.Rows[i+1]["SPEC02"]%></td>
  <td colspan=2 class=xl145 style='border-left:none'>Sewing Shift:</td>
  <td colspan=4 class=xl141 style='border-right:1.0pt solid black'><%=dt.Rows[i+1]["ATT01"]%> / <%=dt.Rows[i+1]["STYLE_ID"]%> / <%=dt.Rows[i+1]["SPEC01"]%> / <%=dt.Rows[i+1]["SPEC02"]%></td>
  
  <td></td>
      <%   
      }
     
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl66 style='height:15.0pt'>Card Qty:</td>
  <td class=xl70><%=dt.Rows[i]["ATT06"]%></td>
  <td class=xl68>Pairer_ID#:</td>
  <td class=xl64></td>
  <td class=xl76>&nbsp;</td>
  <td class=xl68>Card Qty:</td>
  <td class=xl70><%=dt.Rows[i]["ATT06"]%></td>
  <td class=xl68>Optr_ID#:</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl68>Mach No:</td>
  <td class=xl77>&nbsp;</td>
  <td class=xl64></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td class=xl66>Card Qty:</td>
  <td class=xl70><%=dt.Rows[i+1]["ATT06"]%></td>
  <td class=xl68>Pairer_ID#:</td>
  <td class=xl64></td>
  <td class=xl76>&nbsp;</td>
  <td class=xl68>Card Qty:</td>
  <td class=xl70><%=dt.Rows[i+1]["ATT06"]%></td>
  <td class=xl68>Optr_ID#:</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl68>Mach No:</td>
  
  <td class=xl77>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
 
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl66 style='height:15.0pt'>Date Start:</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl68>Date Finish:</td>
  <td class=xl78>&nbsp;</td>
  <td class=xl79>&nbsp;</td>
  <td class=xl68>Date Start:</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl67>Date Finish:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl67>&nbsp;</td>
  <td class=xl77>&nbsp;</td>
  <td class=xl64></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td class=xl66>Date Start:</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl68>Date Finish:</td>
  <td class=xl78>&nbsp;</td>
  <td class=xl79>&nbsp;</td>
  <td class=xl68>Date Start:</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl67>Date Finish:</td>
  
  <td class=xl68>&nbsp;</td>
  <td class=xl67>&nbsp;</td>
  <td class=xl77>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=3 height=20 class=xl125 style='height:15.0pt'><%=dt.Rows[i]["CARD_ID"]%></td>
  <td colspan=2 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+1%> of <%=dt.Rows[i]["ATT06"]%></td>
  <td colspan=3 class=xl128 style='border-left:none'><%=dt.Rows[i]["CARD_ID"]%></td>
  <td colspan=3 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+1%> of <%=dt.Rows[i]["ATT06"]%></td>
  <td></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=3 class=xl125><%=dt.Rows[i+1]["CARD_ID"]%></td>
  <td colspan=2 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+2%> of <%=dt.Rows[i+1]["ATT06"]%></td>
  <td colspan=3 class=xl128 style='border-left:none'><%=dt.Rows[i+1]["CARD_ID"]%></td>
  <td colspan=3 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+2%> of <%=dt.Rows[i+1]["ATT06"]%></td>
 
  <td></td>
      <%   
      }
      
   %> 
 
 
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=5 rowspan=2 height=55 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black;height:41.85pt'>*<%=dt.Rows[i]["CARD_ID"]%>*</td>
  <td colspan=6 rowspan=2 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'>*<%=dt.Rows[i]["CARD_ID"]%>*</td>
  <td></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=5 rowspan=2 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'>*<%=dt.Rows[i+1]["CARD_ID"]%>*</td>
  <td colspan=6 rowspan=2 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'>*<%=dt.Rows[i+1]["CARD_ID"]%>*</td>
  
  <td></td>
      <%   
      }
      
   %> 
 
  
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl75 style='height:21.75pt'></td>
  <td></td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=2 height=22 class=xl139 style='height:16.5pt'>Washing Shift:</td>
  <td colspan=3 class=xl146 style='border-right:1.0pt solid black'><%=dt.Rows[i]["ATT01"]%> / <%=dt.Rows[i]["STYLE_ID"]%> / <%=dt.Rows[i]["SPEC01"]%> / <%=dt.Rows[i]["SPEC02"]%></td>
  <td colspan=2 class=xl145 style='border-right:.5pt solid black;border-left:
  none'>Setting Shift:</td>
  <td colspan=4 class=xl142 style='border-right:1.0pt solid black;border-left:
  none'><%=dt.Rows[i]["ATT01"]%> / <%=dt.Rows[i]["STYLE_ID"]%> / <%=dt.Rows[i]["SPEC01"]%> / <%=dt.Rows[i]["SPEC02"]%></td>
  <td></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=2 class=xl139>Washing Shift:</td>
  <td colspan=3 class=xl141 style='border-right:1.0pt solid black'><%=dt.Rows[i+1]["ATT01"]%> / <%=dt.Rows[i+1]["STYLE_ID"]%> / <%=dt.Rows[i+1]["SPEC01"]%> / <%=dt.Rows[i+1]["SPEC02"]%></td>
  <td colspan=2 class=xl145 style='border-right:.5pt solid black;border-left:
  none'>Setting Shift:</td>
  <td colspan=4 class=xl142 style='border-right:1.0pt solid black;border-left:
  none'><%=dt.Rows[i+1]["ATT01"]%> / <%=dt.Rows[i+1]["STYLE_ID"]%> / <%=dt.Rows[i+1]["SPEC01"]%> / <%=dt.Rows[i+1]["SPEC02"]%></td>
  
  <td></td>
      <%   
      }
      
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl66 style='height:15.0pt'>Card Qty:</td>
  <td class=xl70><%=dt.Rows[i]["ATT06"]%></td>
  <td class=xl68>Washer :</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl69>&nbsp;</td>
  <td class=xl68>Card Qty:</td>
  <td class=xl70><%=dt.Rows[i]["ATT06"]%></td>
  <td class=xl80>Oprt_ID#:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl68>M/C # :</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl64></td>
   <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td class=xl66>Card Qty:</td>
  <td class=xl70><%=dt.Rows[i+1]["ATT06"]%></td>
  <td class=xl68>Washer :</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl69>&nbsp;</td>
  <td class=xl68>Card Qty:</td>
  <td class=xl70><%=dt.Rows[i+1]["ATT06"]%></td>
  <td class=xl80>Oprt_ID#:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl68>M/C # :</td>
 
  <td class=xl72>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl66 style='height:15.0pt'>Date Start:</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl68>Date Finish:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl68>Date Start:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl68>Date Finish:</td>
  <td class=xl64></td>
  <td class=xl68>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td class=xl66>Date Start:</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl68>Date Finish:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl68>Date Start:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl68>Date Finish:</td>
  
  <td class=xl64></td>
  <td class=xl68>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
  
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=3 height=20 class=xl125 style='height:15.0pt'><%=dt.Rows[i]["CARD_ID"]%></td>
  <td colspan=2 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+1%> of <%=dt.Rows[i]["ATT06"]%></td>
  <td colspan=3 class=xl128 style='border-left:none'><%=dt.Rows[i]["CARD_ID"]%></td>
  <td colspan=3 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+1%> of <%=dt.Rows[i]["ATT06"]%></td>
  <td class=xl42></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=3 class=xl125><%=dt.Rows[i+1]["CARD_ID"]%></td>
  <td colspan=2 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+2%> of <%=dt.Rows[i+1]["ATT06"]%></td>
  <td colspan=3 class=xl128 style='border-left:none'><%=dt.Rows[i+1]["CARD_ID"]%></td>
  <td colspan=3 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+2%> of <%=dt.Rows[i+1]["ATT06"]%></td>
  
  <td></td>
      <%   
      }
      
   %> 
  
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=5 rowspan=2 height=51 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black;height:38.85pt'>*<%=dt.Rows[i]["CARD_ID"]%>*</td>
  <td colspan=6 rowspan=2 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'>*<%=dt.Rows[i]["CARD_ID"]%>*</td>
  <td class=xl75></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=5 rowspan=2 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'>*<%=dt.Rows[i+1]["CARD_ID"]%>*</td>
  <td colspan=6 rowspan=2 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'>*<%=dt.Rows[i+1]["CARD_ID"]%>*</td>
  
  <td></td>
      <%   
      }
      
   %> 
  
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl75 style='height:18.75pt'></td>
  <td></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=2 height=26 class=xl139 style='height:20.1pt'>Inspection Shift:</td>
  <td colspan=3 class=xl141 style='border-right:1.0pt solid black'><%=dt.Rows[i]["ATT01"]%> / <%=dt.Rows[i]["STYLE_ID"]%> / <%=dt.Rows[i]["SPEC01"]%> / <%=dt.Rows[i]["SPEC02"]%></td>
  <td colspan=2 class=xl145 style='border-left:none'>Pre-Setting Shift:</td>
  <td colspan=4 class=xl141 style='border-right:1.0pt solid black'><%=dt.Rows[i]["ATT01"]%> / <%=dt.Rows[i]["STYLE_ID"]%> / <%=dt.Rows[i]["SPEC01"]%> / <%=dt.Rows[i]["SPEC02"]%></td>
  <td class=xl64></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=2 class=xl139>Inspection Shift:</td>
  <td colspan=3 class=xl141 style='border-right:1.0pt solid black'><%=dt.Rows[i+1]["ATT01"]%> / <%=dt.Rows[i+1]["STYLE_ID"]%> / <%=dt.Rows[i+1]["SPEC01"]%> / <%=dt.Rows[i+1]["SPEC02"]%></td>
  <td colspan=2 class=xl145 style='border-left:none'>Pre-Setting Shift:</td>
  <td colspan=4 class=xl141 style='border-right:1.0pt solid black'><%=dt.Rows[i+1]["ATT01"]%> / <%=dt.Rows[i+1]["STYLE_ID"]%> / <%=dt.Rows[i+1]["SPEC01"]%> / <%=dt.Rows[i+1]["SPEC02"]%></td>
  
  <td></td>
      <%   
      }
     
   %> 
  
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl66 style='height:15.0pt'>Card Qty:</td>
  <td class=xl70><%=dt.Rows[i]["ATT06"]%></td>
  <td colspan=2 class=xl78>Inspection_ID#:</td>
  <td class=xl69>&nbsp;</td>
  <td class=xl68>Card Qty:</td>
  <td class=xl70><%=dt.Rows[i]["ATT06"]%></td>
  <td class=xl68>Oprt_ID#:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl68>M/C # :</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl64></td>
 <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td class=xl66>Card Qty:</td>
  <td class=xl70><%=dt.Rows[i+1]["ATT06"]%></td>
  <td colspan=2 class=xl78>Inspection_ID#:</td>
  <td class=xl69>&nbsp;</td>
  <td class=xl68>Card Qty:</td>
  <td class=xl70><%=dt.Rows[i+1]["ATT06"]%></td>
  <td class=xl68>Oprt_ID#:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl68>M/C # :</td>
  
  <td class=xl72>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
  
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl66 style='height:15.0pt'>Date Start:</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl68>Date Finish:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl68>Date Start:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl68>Date Finish:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl64></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td class=xl66>Date Start:</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl68>Date Finish:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl68>Date Start:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl68>Date Finish:</td>
  
  <td class=xl68>&nbsp;</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td></td>
      <%   
      }
     
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=3 height=20 class=xl125 style='height:15.0pt'><%=dt.Rows[i]["CARD_ID"]%></td>
  <td colspan=2 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+1%> of <%=dt.Rows[i]["ATT06"]%></td>
  <td colspan=3 class=xl128 style='border-left:none'><%=dt.Rows[i]["CARD_ID"]%></td>
  <td colspan=3 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+1%> of <%=dt.Rows[i]["ATT06"]%></td>
  <td class=xl42></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=3 class=xl125><%=dt.Rows[i+1]["CARD_ID"]%></td>
  <td colspan=2 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+2%> of <%=dt.Rows[i+1]["ATT06"]%></td>
  <td colspan=3 class=xl128 style='border-left:none'><%=dt.Rows[i+1]["CARD_ID"]%></td>
  <td colspan=3 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+2%> of <%=dt.Rows[i+1]["ATT06"]%></td>
  
  <td></td>
      <%   
      }
     
   %> 
  
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=5 rowspan=2 height=56 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black;height:42.6pt'>*<%=dt.Rows[i]["CARD_ID"]%>*</td>
  <td colspan=6 rowspan=2 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'>*<%=dt.Rows[i]["CARD_ID"]%>*</td>
  <td class=xl75></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
   <td colspan=5 rowspan=2 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'>*<%=dt.Rows[i+1]["CARD_ID"]%>*</td>
  <td colspan=6 rowspan=2 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'>*<%=dt.Rows[i+1]["CARD_ID"]%>*</td>
  
  <td></td>
      <%   
      }
      
   %> 
 
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl75 style='height:22.5pt'></td>
  <td></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl139 style='height:15.0pt'>Knitting Shift:</td>
  <td colspan=3 class=xl141 style='border-right:1.0pt solid black'><%=dt.Rows[i]["ATT01"]%> / <%=dt.Rows[i]["STYLE_ID"]%> / <%=dt.Rows[i]["SPEC01"]%> / <%=dt.Rows[i]["SPEC02"]%></td>
  <td colspan=2 class=xl145 style='border-left:none'>Linking Shift:</td>
  <td colspan=4 class=xl141 style='border-right:1.0pt solid black'><%=dt.Rows[i]["ATT01"]%> / <%=dt.Rows[i]["STYLE_ID"]%> / <%=dt.Rows[i]["SPEC01"]%> / <%=dt.Rows[i]["SPEC02"]%></td>
  <td class=xl64></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td colspan=2 class=xl139>Knitting Shift:</td>
  <td colspan=3 class=xl141 style='border-right:1.0pt solid black'><%=dt.Rows[i+1]["ATT01"]%> / <%=dt.Rows[i+1]["STYLE_ID"]%> / <%=dt.Rows[i+1]["SPEC01"]%> / <%=dt.Rows[i+1]["SPEC02"]%></td>
  <td colspan=2 class=xl145 style='border-left:none'>Linking Shift:</td>
  <td colspan=4 class=xl141 style='border-right:1.0pt solid black'><%=dt.Rows[i+1]["ATT01"]%> / <%=dt.Rows[i+1]["STYLE_ID"]%> / <%=dt.Rows[i+1]["SPEC01"]%> / <%=dt.Rows[i+1]["SPEC02"]%></td>
 
  <td></td>
      <%   
      }
     
   %> 
 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl66 style='height:15.0pt'>Card Qty:</td>
  <td class=xl70><%=dt.Rows[i]["ATT06"]%></td>
  <td class=xl68>M/C#</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl72>Hand Linking</td>
  <td class=xl68>Card Qty:</td>
  <td class=xl70><%=dt.Rows[i]["ATT06"]%></td>
  <td class=xl68>M/C#</td>
  <td class=xl67>&nbsp;</td>
  <td colspan=2 class=xl71 style='border-right:1.0pt solid black'>Hand Linking</td>
  <td class=xl64></td>
 <%
      if (i < dt.Rows.Count - 1)
      {
          %>
  <td class=xl66>Card Qty:</td>
  <td class=xl70><%=dt.Rows[i+1]["ATT06"]%></td>
  <td class=xl68>M/C#</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl72>Hand Linking</td>
  <td class=xl68>Card Qty:</td>
  <td class=xl70><%=dt.Rows[i+1]["ATT06"]%></td>
  <td class=xl68>M/C#</td>
  <td class=xl67>&nbsp;</td>
  <td colspan=2 class=xl149 style='border-right:1.0pt solid black'>Hand Linking</td>
  
  <td></td>
      <%   
      }
      
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl66 style='height:15.0pt'>Date Start:</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl68>Date Fin:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl72>B-Grade:</td>
  <td class=xl68>Date Start:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl68>Date Fin:</td>
  <td class=xl68>&nbsp;</td>
  <td colspan=2 class=xl71 style='border-right:1.0pt solid black'>&nbsp;</td>
  <td class=xl64></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
   <td class=xl66>Date Start:</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl68>Date Fin:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl72>B-Grade:</td>
  <td class=xl68>Date Start:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl68>Date Fin:</td>
 
  <td class=xl68>&nbsp;</td>
  <td colspan=2 class=xl71 style='border-right:1.0pt solid black'>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
 
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl66 style='height:15.0pt'>Oprt ID#:</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl68>Q/C:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl72>C-Grade:</td>
  <td class=xl68>Oprt ID#:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl68>Reverser:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl64></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
   <td class=xl66>Oprt ID#:</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl68>Q/C:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl72>C-Grade:</td>
  <td class=xl68>Oprt ID#:</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl68>Reverser:</td>
  
  <td class=xl68>&nbsp;</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td></td>
      <%   
      }
      
   %> 
  
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=3 height=20 class=xl125 style='height:15.0pt'><%=dt.Rows[i]["CARD_ID"]%></td>
  <td colspan=2 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+1%> of <%=dt.Rows[i]["ATT06"]%></td>
  <td colspan=3 class=xl128 style='border-left:none'><%=dt.Rows[i]["CARD_ID"]%></td>
  <td colspan=3 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+1%> of <%=dt.Rows[i]["ATT06"]%></td>
  <td class=xl42></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
   <td colspan=3 class=xl125><%=dt.Rows[i+1]["CARD_ID"]%></td>
  <td colspan=2 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+2%> of <%=dt.Rows[i+1]["ATT06"]%></td>
  <td colspan=3 class=xl128 style='border-left:none'><%=dt.Rows[i+1]["CARD_ID"]%></td>
  <td colspan=3 class=xl129 style='border-right:1.0pt solid black'>Card <%=i+2%> of <%=dt.Rows[i+1]["ATT06"]%></td>
  
  <td></td>
      <%   
      }
      
   %> 
  
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=5 rowspan=2 height=58 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black;height:44.1pt'>*<%=dt.Rows[i]["CARD_ID"]%>*</td>
  <td colspan=6 rowspan=2 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'>*<%=dt.Rows[i]["CARD_ID"]%>*</td>
  <td class=xl75></td>
  <%
      if (i < dt.Rows.Count - 1)
      {
          %>
   <td colspan=5 rowspan=2 height=58 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black;height:44.1pt'>*<%=dt.Rows[i+1]["CARD_ID"]%>*</td>
  <td colspan=6 rowspan=2 class=xl131 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'>*<%=dt.Rows[i+1]["CARD_ID"]%>*</td>
  <td class=xl75></td>
      <%   
      }
   %> 
  
 </tr>
 
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td height=32 class=xl75 style='height:24.0pt'></td>
  <td></td>
 </tr>
  
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td height=32 class=xl75 style='height:24.0pt'></td>
  <td colspan=23 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td height=32 class=xl75 style='height:24.0pt'></td>
  <td colspan=23 style='mso-ignore:colspan'></td>
 </tr>
 <% 
        } 
     %>  
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=105 style='width:79pt'></td>
  <td width=19 style='width:14pt'></td>
  <td width=68 style='width:51pt'></td>
  <td width=62 style='width:47pt'></td>
  <td width=137 style='width:103pt'></td>
  <td width=65 style='width:49pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=74 style='width:56pt'></td>
  <td width=67 style='width:50pt'></td>
  <td width=52 style='width:39pt'></td>
  <td width=66 style='width:50pt'></td>
  <td width=16 style='width:12pt'></td>
  <td width=105 style='width:79pt'></td>
  <td width=19 style='width:14pt'></td>
  <td width=69 style='width:52pt'></td>
  <td width=62 style='width:47pt'></td>
  <td width=137 style='width:103pt'></td>
  <td width=65 style='width:49pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=74 style='width:56pt'></td>
  <td width=67 style='width:50pt'></td>
  <td width=52 style='width:39pt'></td>
  <td width=66 style='width:50pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>
       
</body>

</html>
