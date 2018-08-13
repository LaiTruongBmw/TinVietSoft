<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser("inv");
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
  	Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
    string l_to_dt="", l_tin_warehouse_pk ="", l_tco_itemgrp_pk="", l_item="", l_wh_type="";
    object[] values = new object[5];
    DataTable dt;
    l_to_dt = Request.QueryString["from_dt"];
    l_tin_warehouse_pk = Request.QueryString["warehouse_pk"];
    l_tco_itemgrp_pk = Request.QueryString["itemgrp_pk"];
    l_item = Request.QueryString["item"];
    l_wh_type = Request.QueryString["wh_type"];
    
      
    values[0] = l_to_dt;
    values[1] = l_tin_warehouse_pk;
    values[2] = l_tco_itemgrp_pk;
    values[3] = l_item;
    values[4] = l_wh_type;

    dt = CtlLib.TableReadOpenCursor("INV.sp_rpt_bisc00040_DW", "'" + l_to_dt + "','" + l_tin_warehouse_pk + "','" + l_tco_itemgrp_pk + "','" + l_item + "','" + l_wh_type + "'");
    
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_bisc00040_DW_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_bisc00040_DW_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_bisc00040_DW_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Dang Thi Thuy Van</o:Author>
  <o:LastAuthor>tuyen</o:LastAuthor>
  <o:LastPrinted>2011-03-28T06:03:35Z</o:LastPrinted>
  <o:Created>2011-03-11T09:54:08Z</o:Created>
  <o:LastSaved>2011-03-28T06:14:36Z</o:LastSaved>
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
.style17
	{mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	mso-style-name:"Comma \[0\]";
	mso-style-id:6;}
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
	font-size:16.0pt;
	font-family:-가시나무B, serif;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl25
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:-가시나무B, serif;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl26
	{mso-style-parent:style0;
	color:red;
	font-size:16.0pt;
	font-weight:700;
	font-family:-가시나무B, serif;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl27
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl28
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl29
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	background:#FF99CC;
	mso-pattern:auto none;}
.xl30
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl31
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl32
	{mso-style-parent:style17;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"0_ ";
	vertical-align:middle;
	background:#FF99CC;
	mso-pattern:auto none;}
.xl33
	{mso-style-parent:style17;
	font-size:9.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl34
	{mso-style-parent:style17;
	color:black;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl35
	{mso-style-parent:style17;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl36
	{mso-style-parent:style0;
	color:red;
	font-family:굴림, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl37
	{mso-style-parent:style0;
	color:red;
	font-size:9.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl38
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl39
	{mso-style-parent:style0;
	color:red;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl40
	{mso-style-parent:style0;
	color:red;
	font-size:20.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl41
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl42
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl43
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	background:#FF99CC;
	mso-pattern:auto none;}
.xl44
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl45
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl46
	{mso-style-parent:style17;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	background:#FF99CC;
	mso-pattern:auto none;}
.xl47
	{mso-style-parent:style17;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl48
	{mso-style-parent:style17;
	color:black;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl49
	{mso-style-parent:style17;
	color:black;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl50
	{mso-style-parent:style0;
	color:red;
	font-size:9.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl51
	{mso-style-parent:style0;
	color:red;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl52
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	background:#FF99CC;
	mso-pattern:auto none;}
.xl53
	{mso-style-parent:style0;
	color:blue;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"yyyy\0022년\0022\\ m\0022월\0022\\ d\0022일\0022";
	text-align:left;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl54
	{mso-style-parent:style17;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"0_ ";
	vertical-align:middle;
	background:#FF99CC;
	mso-pattern:auto none;}
.xl55
	{mso-style-parent:style17;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl56
	{mso-style-parent:style17;
	color:black;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl57
	{mso-style-parent:style0;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl58
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl59
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl60
	{mso-style-parent:style0;
	color:red;
	font-size:16.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl61
	{mso-style-parent:style17;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	background:#FF99CC;
	mso-pattern:auto none;}
.xl62
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:1.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl63
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:1.5pt solid windowtext;
	background:#FF99CC;
	mso-pattern:auto none;}
.xl64
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:1.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl65
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl66
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl67
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl68
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#FF99CC;
	mso-pattern:auto none;}
.xl69
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl70
	{mso-style-parent:style17;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl71
	{mso-style-parent:style17;
	color:black;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl72
	{mso-style-parent:style17;
	color:black;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl73
	{mso-style-parent:style0;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center-across;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl74
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center-across;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl75
	{mso-style-parent:style0;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center-across;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:1.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl76
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FF99CC;
	mso-pattern:auto none;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl83
	{mso-style-parent:style17;
	color:black;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl84
	{mso-style-parent:style17;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl91
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl92
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl93
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FF99CC;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl94
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl95
	{mso-style-parent:style17;
	color:black;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl96
	{mso-style-parent:style17;
	color:black;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl97
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl98
	{mso-style-parent:style0;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl99
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl100
	{mso-style-parent:style0;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl101
	{mso-style-parent:style0;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl102
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:1.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl103
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl104
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl105
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl106
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#FF99CC;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl107
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl108
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl109
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl110
	{mso-style-parent:style17;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"0_ ";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#FF99CC;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl111
	{mso-style-parent:style17;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl112
	{mso-style-parent:style17;
	color:black;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl113
	{mso-style-parent:style17;
	color:black;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl114
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	mso-protection:unlocked visible;}
.xl115
	{mso-style-parent:style0;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:white;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl116
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl117
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.5pt solid windowtext;
	border-bottom:1.5pt solid windowtext;
	border-left:1.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto none;}
.xl118
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl119
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl120
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FF99CC;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl121
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl122
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl123
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl124
	{mso-style-parent:style17;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FF99CC;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl125
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl126
	{mso-style-parent:style17;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl127
	{mso-style-parent:style0;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl128
	{mso-style-parent:style17;
	color:black;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl129
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt hairline windowtext;
	mso-protection:unlocked visible;}
.xl130
	{mso-style-parent:style0;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt hairline windowtext;
	mso-protection:unlocked visible;}
.xl131
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl132
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.xl133
	{mso-style-parent:style0;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";}
.xl134
	{mso-style-parent:style0;
	background:#FF99CC;
	mso-pattern:auto none;}
.xl135
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;}
.xl136
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.xl137
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.xl138
	{mso-style-parent:style0;
	color:blue;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"Short Date";
	text-align:left;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl139
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl140
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	border-top:1.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl141
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl142
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	mso-protection:unlocked visible;}
.xl143
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl144
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl145
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:1.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl146
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	mso-protection:unlocked visible;}
.xl147
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:1.5pt solid windowtext;
	background:#FF99CC;
	mso-pattern:auto none;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl149
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>43</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>13</x:ActiveRow>
       <x:ActiveCol>5</x:ActiveCol>
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
  <x:WindowHeight>8955</x:WindowHeight>
  <x:WindowWidth>15480</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>30</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=14430 style='border-collapse:
 collapse;table-layout:fixed;width:10824pt'>
 <col class=xl132 width=63 style='mso-width-source:userset;mso-width-alt:2304;
 width:47pt'>
 <col width=73 style='mso-width-source:userset;mso-width-alt:2669;width:55pt'>
 <col width=34 style='mso-width-source:userset;mso-width-alt:1243;width:26pt'>
 <col class=xl132 width=109 span=2 style='mso-width-source:userset;mso-width-alt:
 3986;width:82pt'>
 <col width=154 style='mso-width-source:userset;mso-width-alt:5632;width:116pt'>
 <col width=48 style='mso-width-source:userset;mso-width-alt:1755;width:36pt'>
 <col class=xl134 width=39 style='mso-width-source:userset;mso-width-alt:1426;
 width:29pt'>
 <col width=207 style='mso-width-source:userset;mso-width-alt:7570;width:155pt'>
 <col width=45 style='mso-width-source:userset;mso-width-alt:1645;width:34pt'>
 <col width=118 style='mso-width-source:userset;mso-width-alt:4315;width:89pt'>
 <col width=207 style='mso-width-source:userset;mso-width-alt:7570;width:155pt'>
 <col class=xl135 width=156 style='mso-width-source:userset;mso-width-alt:5705;
 width:117pt'>
 <col class=xl134 width=87 style='mso-width-source:userset;mso-width-alt:3181;
 width:65pt'>
 <col width=60 style='mso-width-source:userset;mso-width-alt:2194;width:45pt'>
 <col width=56 style='mso-width-source:userset;mso-width-alt:2048;width:42pt'>
 <col width=27 style='mso-width-source:userset;mso-width-alt:987;width:20pt'>
 <col width=171 style='mso-width-source:userset;mso-width-alt:6253;width:128pt'>
 <col width=68 style='mso-width-source:userset;mso-width-alt:2486;width:51pt'>
 <col class=xl136 width=32 style='mso-width-source:userset;mso-width-alt:1170;
 width:24pt'>
 <col class=xl137 width=44 style='mso-width-source:userset;mso-width-alt:1609;
 width:33pt'>
 <col class=xl136 width=33 style='mso-width-source:userset;mso-width-alt:1206;
 width:25pt'>
 <col class=xl137 width=44 style='mso-width-source:userset;mso-width-alt:1609;
 width:33pt'>
 <col class=xl136 width=33 style='mso-width-source:userset;mso-width-alt:1206;
 width:25pt'>
 <col class=xl137 width=44 style='mso-width-source:userset;mso-width-alt:1609;
 width:33pt'>
 <col class=xl136 width=40 style='mso-width-source:userset;mso-width-alt:1462;
 width:30pt'>
 <col class=xl137 width=41 style='mso-width-source:userset;mso-width-alt:1499;
 width:31pt'>
 <col width=64 span=192 style='width:48pt'>
 <tr class=xl27 height=31 style='mso-height-source:userset;height:23.25pt'>
  <td height=31 class=xl24 width=63 style='height:23.25pt;width:47pt'>&nbsp;</td>
  <td class=xl25 width=73 style='width:55pt'>&nbsp;</td>
  <td class=xl26 colspan=3 width=252 style='mso-ignore:colspan;width:190pt'
  x:str="▶ Total stock ">▶ Total stock<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl26 width=154 style='width:116pt'>&nbsp;</td>
  <td class=xl28 width=48 style='width:36pt'>&nbsp;</td>
  <td class=xl29 width=39 style='width:29pt'>&nbsp;</td>
  <td class=xl26 width=207 style='width:155pt' >-<%=l_to_dt.Substring(4,2)+ "/" + l_to_dt.Substring(6, 2) + "/" + l_to_dt.Substring(0, 4)%>-</td>
  <td class=xl30 width=45 style='width:34pt'>&nbsp;</td>
  <td class=xl27 width=118 style='width:89pt'>&nbsp;</td>
  <td class=xl27 width=207 style='width:155pt'>&nbsp;</td>
  <td class=xl31 width=156 style='width:117pt'>&nbsp;</td>
  <td class=xl32 width=87 style='width:65pt'>&nbsp;</td>
  <td class=xl27 width=60 style='width:45pt'>&nbsp;</td>
  <td class=xl31 width=56 style='width:42pt'>&nbsp;</td>
  <td class=xl33 width=27 style='width:20pt'>&nbsp;</td>
  <td class=xl34 width=171 style='width:128pt'>&nbsp;</td>
  <td class=xl35 width=68 style='width:51pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl27 width=64 style='width:48pt'>&nbsp;</td>
 </tr>
 <tr class=xl42 height=23 style='mso-height-source:userset;height:17.25pt'>
  <td height=23 colspan=3 class=xl38 style='height:17.25pt;mso-ignore:colspan'>&nbsp;</td>
  <td class=xl27>&nbsp;</td>
  <td class=xl40>&nbsp;</td>
  <td class=xl41>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl43>&nbsp;</td>
  <td class=xl44>&nbsp;</td>
  <td class=xl41>&nbsp;</td>
  <td colspan=2 class=xl42 style='mso-ignore:colspan'>&nbsp;</td>
  <td class=xl38>&nbsp;</td>
  <td class=xl46>&nbsp;</td>
  <td class=xl45>&nbsp;</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl45>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td colspan=1 class=xl49 style='mso-ignore:colspan'>&nbsp;</td>
  <td colspan=192 class=xl42 style='mso-ignore:colspan'>&nbsp;</td>
 </tr>
 <tr class=xl42 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 colspan=2 class=xl42 style='height:15.75pt;mso-ignore:colspan'>&nbsp;</td>
  <td colspan=3 class=xl138  ></td>
  <td class=xl42>&nbsp;</td>
  <td class=xl41>&nbsp;</td>
  <td class=xl52>&nbsp;</td>
  <td class=xl53>&nbsp;</td>
  <td class=xl44>&nbsp;</td>
  <td colspan=2 class=xl42 style='mso-ignore:colspan'>&nbsp;</td>
  <td class=xl45>&nbsp;</td>
  <td class=xl54>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl45>&nbsp;</td>
  <td class=xl55>&nbsp;</td>
  <td class=xl56>&nbsp;</td>
  <td colspan=1 class=xl49 style='mso-ignore:colspan'>&nbsp;</td>
  <td colspan=192 class=xl42 style='mso-ignore:colspan'>&nbsp;</td>
 </tr>
 <tr class=xl42 height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl41 style='height:21.0pt'>&nbsp;</td>
  <td class=xl59>&nbsp;</td>
  <td class=xl60 colspan=4 style='mso-ignore:colspan'>▼ Stock standard packing
  unit</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl43>&nbsp;</td>
  <td class=xl44><span style='mso-spacerun:yes'> &nbsp;</span></td>
  <td class=xl41>&nbsp;</td>
  <td colspan=2 class=xl42 style='mso-ignore:colspan'>&nbsp;</td>
  <td class=xl38>&nbsp;</td>
  <td class=xl61>&nbsp;</td>
  <td class=xl45>&nbsp;</td>
  <td class=xl47>&nbsp;</td>
  <td class=xl45>&nbsp;</td>
  <td class=xl48>&nbsp;</td>
  <td colspan=1 class=xl49 style='mso-ignore:colspan'>&nbsp;</td>
  <td colspan=192 class=xl42 style='mso-ignore:colspan'>&nbsp;</td>
 </tr>
 <tr class=xl42 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 class=xl62 style='height:15.75pt'>REC</td>
  <td class=xl63>&nbsp;</td>
  <td class=xl64>REC</td>
  <td class=xl65 style='border-left:none'>&nbsp;</td>
  <td class=xl66 style='border-left:none'>&nbsp;</td>
  <td class=xl66 style='border-left:none'>&nbsp;</td>
  <td class=xl67 style='border-left:none'>&nbsp;</td>
  <td class=xl68 style='border-left:none'>&nbsp;</td>
  <td class=xl66 style='border-left:none'>&nbsp;</td>
  <td class=xl67 style='border-left:none'>&nbsp;</td>
  <td class=xl66 style='border-left:none'>&nbsp;</td>
  <td class=xl66 style='border-left:none'>&nbsp;</td>
  <td class=xl69 style='border-left:none'>&nbsp;</td>
  <td class=xl68>&nbsp;</td>
  <td colspan=2 class=xl139 style='border-right:.5pt solid black;border-left:
  none'>Stock category (June)</td>
  <td class=xl70 style='border-left:none'>&nbsp;</td>
  <td class=xl71 style='border-left:none'><span
  style='mso-spacerun:yes'> &nbsp;</span></td>
  <td class=xl72 style='border-left:none'>&nbsp;</td>
  <td colspan=192 class=xl42 style='mso-ignore:colspan'>&nbsp;</td>
 </tr>
 <tr class=xl89 height=121 style='mso-height-source:userset;height:90.75pt'>
  <td height=121 class=xl76 width=63 style='height:90.75pt;width:47pt'
  x:str="No. ">No.<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl147 width=73 style='width:55pt'>PALLET</td>
  <td class=xl76 width=34 style='width:26pt' x:str="No. ">No.<span
  style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl77 width=109 style='border-left:none;width:82pt'>Stock No.<br>
    Số tt kho</td>
  <td class=xl78 width=109 style='border-left:none;width:82pt'>S/O No.<br>
    Số đơn hàng</td>
  <td class=xl78 width=154 style='border-left:none;width:116pt'>Buyer <br>
    người mua</td>
  <td class=xl79 width=48 style='border-left:none;width:36pt'
  x:str="Inspection date &#10;ngày nhập ">Inspection date <br>
    ngày nhập<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl80 width=39 style='border-left:none;width:29pt'>Delivery date
  <br>
    Ngày giao</td>
  <td class=xl78 width=207 style='border-left:none;width:155pt'>Item<br>
    Tên hàng</td>
  <td class=xl79 width=45 style='border-left:none;width:34pt'>Spec.<br>
    QUY CACH</td>
  <td class=xl81 width=118 style='border-left:none;width:89pt'>PATTERN<br>
    mẫu</td>
  <td class=xl81 width=207 style='border-left:none;width:155pt'>Surface
  COLOR<br>
    màu bề mặt</td>
  <td class=xl78 width=156 style='border-left:none;width:117pt'>REMARK</td>
  <td class=xl80 width=87 style='border-left:none;width:65pt'
  x:str="Balance &#10;TỒN ">Balance <br>
    TỒN<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl81 width=60 style='border-left:none;width:45pt'
  x:str="Stock category&#10;Loại hàng tồn ">Stock category<br>
    Loại hàng tồn<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl81 width=56 style='border-left:none;width:42pt'
  x:str="Stock category code&#10;Mã loại hàng tồn ">Stock category code<br>
    Mã loại hàng tồn<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl82 width=27 style='border-left:none;width:20pt'>ROLL별수량(포직명)</td>
  <td class=xl83 width=171 style='border-left:none;width:128pt'>Reservation No.
  <br>
    Số lượng đặt trước</td>
  <td class=xl84 width=68 style='border-left:none;width:51pt'
  x:str="Reserved Q'ty&#10;Số lượng được làm trước"><span
  style='mso-spacerun:yes'> &nbsp;</span>Reserved Q'ty<br>
    Số lượng được làm trước<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td colspan=192 class=xl89 style='mso-ignore:colspan'>&nbsp;</td>
 </tr>
 <tr class=xl45 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl143 style='height:15.0pt'>&nbsp;</td>
  <td class=xl148>&nbsp;</td>
  <td class=xl145>REC</td>
  <td class=xl65 style='border-left:none'>&nbsp;</td>
  <td class=xl66 style='border-left:none'>&nbsp;</td>
  <td class=xl66 style='border-left:none'>&nbsp;</td>
  <td class=xl67 style='border-left:none'>&nbsp;</td>
  <td class=xl68 style='border-left:none'>&nbsp;</td>
  <td class=xl66 style='border-left:none'>&nbsp;</td>
  <td class=xl67 style='border-left:none'>&nbsp;</td>
  <td class=xl66 style='border-left:none'>&nbsp;</td>
  <td class=xl66 style='border-left:none'>&nbsp;</td>
  <td class=xl69 style='border-left:none'>&nbsp;</td>
  <td class=xl68>&nbsp;</td>
  <td colspan=2 class=xl139 style='border-right:.5pt solid black;border-left:
  none'>판정(<span style='mso-spacerun:yes'>&nbsp; </span>월)</td>
  <td class=xl70 style='border-left:none'>&nbsp;</td>
  <td class=xl71 style='border-left:none' x:str="예약재고 ">예약재고<span
  style='mso-spacerun:yes'>&nbsp;</span></td>
  <td class=xl72 style='border-left:none' x:str="예약재고 "><span
  style='mso-spacerun:yes'> &nbsp;</span>예약재고<span style='mso-spacerun:yes'> &nbsp;</span></td>
  <td colspan=192 class=xl45 style='mso-ignore:colspan'>&nbsp;</td>
 </tr>
 <tr class=xl101 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl144 style='height:15.0pt'>&nbsp;</td>
  <td class=xl149>&nbsp;</td>
  <td class=xl146>번호</td>
  <td class=xl90 style='border-left:none'>재고번호</td>
  <td class=xl91 style='border-left:none'>계획번호</td>
  <td class=xl91 style='border-left:none'>거래처</td>
  <td class=xl92 style='border-left:none'>검사일</td>
  <td class=xl93 style='border-left:none'>납기</td>
  <td class=xl91 style='border-left:none'>품 목 명</td>
  <td class=xl92 style='border-left:none'>규 격</td>
  <td class=xl91 style='border-left:none'>PATTERN</td>
  <td class=xl91 style='border-left:none'>표면 COLOR</td>
  <td class=xl91 style='border-left:none'>REMARK</td>
  <td class=xl93 style='border-left:none'>잔량</td>
  <td class=xl91 style='border-left:none'>제품상태</td>
  <td class=xl91 style='border-left:none'>판정</td>
  <td class=xl94 style='border-left:none'>RO<span style='display:none'>LL별수량(포직명)</span></td>
  <td class=xl95 style='border-left:none'>내역</td>
  <td class=xl96 style='border-left:none' x:str="잔량"><span
  style='mso-spacerun:yes'> &nbsp;</span>잔량<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td colspan=192 class=xl101 style='mso-ignore:colspan'>&nbsp;</td>
 </tr>
 <%
     double l_price=0;
    for(int i =0; i<dt.Rows.Count;i++)
    {
    %>
 <tr class=xl42 height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 class=xl102 style='height:14.25pt'><%=dt.Rows[i]["rec"] %></td>
  <td class=xl102><%=dt.Rows[i]["pallet"] %></td>
  <td class=xl102 x:num><%=dt.Rows[i]["rec1"] %></td>
  <td class=xl103 style='border-left:none'><%=dt.Rows[i]["stock_no"] %></td>
  <td class=xl104 style='border-left:none'><%=dt.Rows[i]["so_item_no"] %></td>
  <td class=xl104 style='border-left:none'><%=dt.Rows[i]["partner_name"] %></td>
  <td class=xl105 style='border-left:none'><%=dt.Rows[i]["takein_dt"] %></td>
  <td class=xl106 style='border-left:none'><%=dt.Rows[i]["etd"] %></td>
  <td class=xl104 style='border-left:none'><%=dt.Rows[i]["item_name"] %></td>
  <td class=xl107 style='border-left:none'><%=dt.Rows[i]["takein_dt"] %></td>
  <td class=xl108 style='border-left:none'></td>
  <td class=xl104 style='border-left:none'></td>
  <td class=xl109 style='border-left:none'>&nbsp;</td>
  <td class=xl110 align=right style='border-left:none' x:num="0"><%=dt.Rows[i]["end_qty"] %></td>
  <td class=xl104 style='border-left:none'>STANDBY</td>
  <td class=xl109 style='border-left:none'>A</td>
  <td class=xl111 style='border-left:none'>&nbsp;</td>
  <td class=xl112 style='border-left:none'>&nbsp;</td>
  <td class=xl113 style='border-left:none'>&nbsp;</td>
  <td colspan=192 class=xl42 style='mso-ignore:colspan'>&nbsp;</td>
 </tr>
  <%
    }
  %>
 <tr class=xl42 height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 class=xl117 style='height:14.25pt'>&nbsp;</td>
  <td class=xl117 style='border-left:none'>&nbsp;</td>
  <td colspan=2 class=xl141 style='border-right:.5pt solid black;border-left:
  none'>총<span style='mso-spacerun:yes'>&nbsp; </span>계</td>
  <td class=xl118 style='border-left:none'>&nbsp;</td>
  <td class=xl118 style='border-left:none'>&nbsp;</td>
  <td class=xl119 style='border-left:none' x:str="'-">-</td>
  <td class=xl120 style='border-left:none'>&nbsp;</td>
  <td class=xl121 style='border-left:none' x:str="'-">-</td>
  <td class=xl122 style='border-left:none'>&nbsp;</td>
  <td class=xl123 style='border-left:none'>&nbsp;</td>
  <td class=xl118 style='border-left:none'>&nbsp;</td>
  <td class=xl121 style='border-left:none'>&nbsp;</td>
  <td class=xl124 style='border-left:none' x:num="0" x:fmla="=SUM(N9:N9)"><span
  style='mso-spacerun:yes'>        &nbsp; &nbsp; &nbsp; &nbsp; </span>- </td>
  <td class=xl125 style='border-left:none'>&nbsp;</td>
  <td class=xl121 style='border-left:none'>&nbsp;</td>
  <td class=xl126 style='border-left:none'>&nbsp;</td>
  <td class=xl127 style='border-left:none'>&nbsp;</td>
  <td class=xl128 style='border-left:none'>&nbsp;</td>
  <td colspan=192 class=xl42 style='mso-ignore:colspan'>&nbsp;</td>
 </tr>
 
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=63 style='width:47pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=34 style='width:26pt'></td>
  <td width=109 style='width:82pt'></td>
  <td width=109 style='width:82pt'></td>
  <td width=154 style='width:116pt'></td>
  <td width=48 style='width:36pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=207 style='width:155pt'></td>
  <td width=45 style='width:34pt'></td>
  <td width=118 style='width:89pt'></td>
  <td width=207 style='width:155pt'></td>
  <td width=156 style='width:117pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=56 style='width:42pt'></td>
  <td width=27 style='width:20pt'></td>
  <td width=171 style='width:128pt'></td>
  <td width=68 style='width:51pt'></td>
  <td width=32 style='width:24pt'></td>
  <td width=44 style='width:33pt'></td>
  <td width=33 style='width:25pt'></td>
  <td width=44 style='width:33pt'></td>
  <td width=33 style='width:25pt'></td>
  <td width=44 style='width:33pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=41 style='width:31pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]></table>

</body>

</html>
