<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<%
	string saleorderpk="";
    string SJ_order="",buyer_order="",article="",description="",link_type="",ex_fac="",order_qty="",mt_nr="";
    saleorderpk = Request.QueryString["Sale_order_pk"];
    DataTable dt,dt2,dt1,dt3,dt4 ;
    dt = CtlLib.TableReadOpenCursor("SALE.sp_rpt_dsbs00010_2", "'" + saleorderpk + "'");
    if (dt.Rows.Count > 0)
    {
        SJ_order = dt.Rows[0]["sj_order"].ToString();
        buyer_order = dt.Rows[0]["buyer_order"].ToString();
        article = dt.Rows[0]["article"].ToString();
        description = dt.Rows[0]["description"].ToString();
        link_type = dt.Rows[0]["link_type"].ToString();
        ex_fac = dt.Rows[0]["ex_fac"].ToString();
        order_qty = dt.Rows[0]["order_qty"].ToString();
    }
    dt1 = CtlLib.TableReadOpenCursor("SALE.sp_rpt_dsbs00010_3", "'" + saleorderpk + "'");
    dt2 = CtlLib.TableReadOpenCursor("SALE.sp_rpt_dsbs00010_4", "'" + saleorderpk + "'"); 
%>

<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="report_s&amp;j_files/filelist.xml">
<link rel=Edit-Time-Data href="report_s&amp;j_files/editdata.mso">
<link rel=OLE-Object-Data href="report_s&amp;j_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>thai</o:Author>
  <o:LastAuthor>HRSV1</o:LastAuthor>
  <o:LastPrinted>2009-12-18T08:06:02Z</o:LastPrinted>
  <o:Created>2007-10-28T14:38:29Z</o:Created>
  <o:LastSaved>2009-12-18T08:08:53Z</o:LastSaved>
  <o:Company>vinagenuwin</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.57in .39in .57in .54in;
	mso-header-margin:.54in;
	mso-footer-margin:.5in;}
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
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl25
	{mso-style-parent:style0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl27
	{mso-style-parent:style0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl28
	{mso-style-parent:style0;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl29
	{mso-style-parent:style0;
	font-size:8.0pt;}
.xl30
	{mso-style-parent:style0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl31
	{mso-style-parent:style0;
	font-weight:700;}
.xl32
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl33
	{mso-style-parent:style0;
	font-size:8.0pt;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl34
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl35
	{mso-style-parent:style0;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl36
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;}
.xl37
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl38
	{mso-style-parent:style0;
	font-size:8.0pt;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl39
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl40
	{mso-style-parent:style0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl41
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl42
	{mso-style-parent:style0;
	font-size:8.0pt;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl43
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl44
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:right;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl45
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl46
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl47
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl48
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl49
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl50
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	mso-number-format:"\#\,\#\#0";
	text-align:right;}
.xl51
	{mso-style-parent:style0;
	font-size:8.0pt;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl52
	{mso-style-parent:style0;
	font-size:8.0pt;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl53
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:justify;}
.xl54
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:justify;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl55
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl56
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl57
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl58
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:right;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl59
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl60
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl61
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl62
	{mso-style-parent:style0;
	font-size:8.0pt;
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
.xl63
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl64
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl65
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl66
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl67
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl68
	{mso-style-parent:style0;
	font-size:8.0pt;
	mso-number-format:0%;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl69
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl70
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:right;
	vertical-align:justify;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl71
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;
	vertical-align:justify;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl72
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl73
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;
	vertical-align:justify;}
.xl74
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;}
.xl75
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:right;}
.xl76
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl77
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl78
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl79
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl80
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:justify;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl81
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:justify;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl82
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;
	vertical-align:justify;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl83
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	mso-text-control:shrinktofit;}
.xl84
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl85
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl86
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl87
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl88
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl89
	{mso-style-parent:style0;
	font-size:22.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl90
	{mso-style-parent:style0;
	font-size:22.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid black;
	border-bottom:none;
	border-left:none;}
.xl91
	{mso-style-parent:style0;
	font-size:22.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl92
	{mso-style-parent:style0;
	font-size:22.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:none;
	border-left:none;}
.xl93
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl94
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl95
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl96
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl97
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl98
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl99
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:right;}
.xl100
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:left;}
.xl101
	{mso-style-parent:style0;
	font-weight:700;
	mso-number-format:"\#\,\#\#0";
	text-align:right;}
.xl102
	{mso-style-parent:style0;
	font-weight:700;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;}
.xl103
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;}
.xl104
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl105
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl106
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl107
	{mso-style-parent:style0;
	color:white;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	background:black;
	mso-pattern:auto none;}
.xl108
	{mso-style-parent:style0;
	color:white;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	background:black;
	mso-pattern:auto none;}
.xl109
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl110
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl111
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl112
	{mso-style-parent:style0;
	color:white;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:black;
	mso-pattern:auto none;}
.xl113
	{mso-style-parent:style0;
	color:white;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:black;
	mso-pattern:auto none;}
.xl114
	{mso-style-parent:style0;
	color:white;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:black;
	mso-pattern:auto none;}
.xl115
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl116
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;}
.xl117
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl118
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl119
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;}
.xl120
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl121
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;}
.xl122
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;}
.xl123
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl124
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:justify;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl125
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:justify;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl126
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:left;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-text-control:shrinktofit;}
.xl127
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:left;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-text-control:shrinktofit;}
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
      <x:Scale>83</x:Scale>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>6</x:ActiveRow>
       <x:ActiveCol>17</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
    <x:PageBreaks>
     <x:ColBreaks>
      <x:ColBreak>
       <x:Column>16</x:Column>
      </x:ColBreak>
     </x:ColBreaks>
    </x:PageBreaks>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>8580</x:WindowHeight>
  <x:WindowWidth>11340</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>45</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Area</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$A$1:$P$44</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1361 style='border-collapse:
 collapse;table-layout:fixed;width:1021pt'>
 <col width=63 style='mso-width-source:userset;mso-width-alt:2304;width:47pt'>
 <col width=44 style='mso-width-source:userset;mso-width-alt:1609;width:33pt'>
 <col width=55 style='mso-width-source:userset;mso-width-alt:2011;width:41pt'>
 <col width=54 style='mso-width-source:userset;mso-width-alt:1974;width:41pt'>
 <col width=51 style='mso-width-source:userset;mso-width-alt:1865;width:38pt'>
 <col width=49 style='mso-width-source:userset;mso-width-alt:1792;width:37pt'>
 <col width=51 style='mso-width-source:userset;mso-width-alt:1865;width:38pt'>
 <col width=48 style='mso-width-source:userset;mso-width-alt:1755;width:36pt'>
 <col width=47 style='mso-width-source:userset;mso-width-alt:1718;width:35pt'>
 <col width=51 style='mso-width-source:userset;mso-width-alt:1865;width:38pt'>
 <col width=49 style='mso-width-source:userset;mso-width-alt:1792;width:37pt'>
 <col width=48 style='mso-width-source:userset;mso-width-alt:1755;width:36pt'>
 <col width=49 style='mso-width-source:userset;mso-width-alt:1792;width:37pt'>
 <col width=44 style='mso-width-source:userset;mso-width-alt:1609;width:33pt'>
 <col width=49 style='mso-width-source:userset;mso-width-alt:1792;width:37pt'>
 <col width=44 style='mso-width-source:userset;mso-width-alt:1609;width:33pt'>
 <col width=64 style='width:48pt'>
 <col width=64 span=3 style='width:48pt'>
 <col width=29 style='mso-width-source:userset;mso-width-alt:1060;width:22pt'>
 <col width=64 span=3 style='width:48pt'>
 <col width=24 style='mso-width-source:userset;mso-width-alt:877;width:18pt'>
 <col width=64 style='width:48pt'>
 
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td colspan=12 rowspan=2 height=34 class=xl85 width=610 style='height:25.5pt;
  width:457pt'><a name="Print_Area">S&amp;J HOSIERY (VIETNAM) Co.,LTD</a></td>
  <td colspan=4 rowspan=2 class=xl89 width=186 style='border-right:1.0pt solid black;
  width:140pt'>*<%=SJ_order%>*</td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=29 style='width:22pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=24 style='width:18pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 colspan=10 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'>&nbsp;</td>
  <td colspan=14 style='mso-ignore:colspan'></td>
  <td class=xl26>&nbsp;</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=12 height=17 class=xl93 style='height:12.75pt'>INTERNAL ORDER
  SHEET</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
  <td class=xl28>&nbsp;</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=3 height=20 class=xl95 style='height:15.0pt'>S&amp;J ORDER # :</td>
  <td colspan=3 class=xl97><%=SJ_order%></td>
  <td colspan=3 class=xl96>EX.FAC. :</td>
  <td colspan=3 class=xl97><%=ex_fac%></td>
  <td class=xl30>&nbsp;</td>
  <td class=xl30>&nbsp;</td>
  <td class=xl30>&nbsp;</td>
  <td class=xl26>&nbsp;</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=3 height=20 class=xl98 style='height:15.0pt'>BUYER ORDER # :</td>
  <td colspan=3 class=xl100><%=buyer_order%></td>
  <td colspan=3 class=xl99>ORDER QTY :</td>
  <td colspan=3 class=xl101 style='border-right:.5pt solid black'x:num><%=order_qty%></td>
  <td class=xl31>PRS</td>
  <td colspan=2 class=xl31 style='mso-ignore:colspan'></td>
  <td class=xl26>&nbsp;</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=3 height=20 class=xl98 style='height:15.0pt'>ARTICLE # :</td>
  <td colspan=3 class=xl100><%=article%></td>
  <td colspan=3 class=xl103></td>
  <td colspan=3 class=xl100></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
  <td class=xl26>&nbsp;</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=3 height=20 class=xl98 style='height:15.0pt'>DESCRIPTION :</td>
  <td colspan=3 class=xl100><%=description%></td>
  <td colspan=3 class=xl99>MT-Nr. :</td>
  <td colspan=3 class=xl100></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
  <td class=xl26>&nbsp;</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=3 height=20 class=xl104 style='height:15.0pt'>Link Type :</td>
  <td colspan=3 class=xl106><%=link_type%></td>
  <td colspan=4 class=xl29 style='mso-ignore:colspan'></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
  <td class=xl26>&nbsp;</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=3 height=20 class=xl107 style='height:15.0pt'>KNITTING
  INSTRUCTION</td>
  <td colspan=3 class=xl29 style='mso-ignore:colspan'></td>
  <td class=xl33>&nbsp;</td>
  <td class=xl33>&nbsp;</td>
  <td class=xl33>&nbsp;</td>
  <td class=xl33>&nbsp;</td>
  <td class=xl34>&nbsp;</td>
  <td class=xl34>&nbsp;</td>
  <td class=xl24>&nbsp;</td>
  <td class=xl24>&nbsp;</td>
  <td class=xl24>&nbsp;</td>
  <td class=xl35>&nbsp;</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>

 
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=3 height=20 class=xl109 style='height:15.0pt'>&nbsp;</td>
  <td class=xl29></td>
  <td class=xl29></td>
  <td class=xl29></td>
  <td class=xl29></td>
  <td class=xl36></td>
  <td class=xl29></td>
  <td></td>
  <td></td>
  
  <td class=xl29></td>
  <td class=xl29></td>
  <td class=xl29></td>
  <td class=xl29></td>

  <td class=xl37>&nbsp;</td>
  <td class=xl36></td>
  <td colspan=2 class=xl29 style='mso-ignore:colspan'></td>
 
  <td></td>
  <td colspan=6 style='mso-ignore:colspan'></td>
 </tr>
   
   
   <%
    for (int j = 0; j < dt1.Rows.Count; j++)
    {
        %>
        
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>

  <td colspan=3 height=20 class=xl109 style='height:15.0pt'><%=dt1.Rows[j]["ATT01"] %></td>
  <td class=xl29><%=dt1.Rows[j]["ATT02"] %></td>
  <td class=xl29><%=dt1.Rows[j]["ATT03"] %></td>
  <td class=xl29><%=dt1.Rows[j]["ATT04"] %></td>
  <td class=xl29><%=dt1.Rows[j]["ATT05"] %></td>
  <td class=xl29><%=dt1.Rows[j]["ATT06"] %></td>
  <td class=xl29><%=dt1.Rows[j]["ATT07"] %></td>
  <td class=xl29></td>
  <td class=xl29></td> 
  <td class=xl100></td>
  <td class=xl29><%=dt1.Rows[j]["ATT08"] %></td>
  <td class=xl29><%=dt1.Rows[j]["ATT09"] %></td>
  <td class=xl29><%=dt1.Rows[j]["ATT10"] %></td>
  <td class=xl38>&nbsp;</td>
  <td colspan=2 class=xl29 style='mso-ignore:colspan'></td>
  <td class=xl36></td>
  <td class=xl29></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 
  <td class=xl29></td>
  <td class=xl29></td>
  <td class=xl29></td>
  <td class=xl29></td>
 </tr>
 
      <% 
    }
 %>
 
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=3 height=20 class=xl110 style='height:15.0pt'>&nbsp;</td>
  <td class=xl39>&nbsp;</td>
  <td class=xl39>&nbsp;</td>
  <td class=xl39>&nbsp;</td>
  <td class=xl39>&nbsp;</td>
  <td class=xl39>&nbsp;</td>
  <td class=xl39>&nbsp;</td>
  <td colspan=2 class=xl39>&nbsp;</td>
  <td class=xl40>&nbsp;</td>
  <td class=xl40>&nbsp;</td>
  <td class=xl27>&nbsp;</td>
  <td class=xl27>&nbsp;</td>
  <td class=xl28>&nbsp;</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
<!--  KNITTING PRODUCTION QTY -->
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=4 height=20 class=xl112 style='border-right:.5pt solid black;
  height:15.0pt'>KNITTING PRODUCTION QTY</td>
  <td class=xl41>&nbsp;</td>
  <td colspan=2 class=xl115 style='border-right:.5pt solid black'>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42>&nbsp;</td>
  <td class=xl27>&nbsp;</td>
  <td class=xl27>&nbsp;</td>
  <td class=xl43>&nbsp;</td>
  <td class=xl43>&nbsp;</td>
  <td class=xl43>&nbsp;</td>
  <td class=xl28>&nbsp;</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
<%
    string a = "", b = "", c = "", d = "", e = "", f = "";
    if (dt2.Rows.Count > 0)
    {
        a = dt2.Rows[0][2].ToString();
        b = dt2.Rows[0][3].ToString();
        c = dt2.Rows[0][4].ToString();
        d = dt2.Rows[0][5].ToString();
        e = dt2.Rows[0][6].ToString();
        f = dt2.Rows[0][7].ToString();
         
    }
 %>
<tr height=34 style='mso-height-source:userset;height:25.5pt'>
  <td colspan=2 height=34 class=xl117 style='border-right:.5pt solid black;
  height:25.5pt'>Color #</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid black;border-left:
  none'>Color Name</td>
  <td class=xl44>Loss</td>
  <td colspan=2 class=xl64 style='border-right:.5pt solid black;border-left:
  none'>SIZE</td>
  <td class=xl44><%=a %></td>
  <td class=xl44><%=b %></td>
  <td class=xl44><%=c %></td>
  <td class=xl44><%=d %></td>
  <td class=xl44><%=e %></td>
  <td class=xl44><%=f %></td>
  <td class=xl45 width=44 style='width:33pt'>Total Q'ty</td>
  <td class=xl45 width=49 style='width:37pt'>&nbsp;</td>
  <td class=xl46>&nbsp;</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
        
 <%
     
     double total2 = 0;
     double total3 = 0;
     double total4 = 0;
     double total5 = 0;
     double total6 = 0;
     double total7 = 0;
     double total8 = 0;
     for (int k = 1; k < dt2.Rows.Count; k++)
     {
         total2 = total2 + CommondLib.ConvertToDbl(dt2.Rows[k][2]);
         total3 = total3 + CommondLib.ConvertToDbl(dt2.Rows[k][3]);
         total4 = total4 + CommondLib.ConvertToDbl(dt2.Rows[k][4]);
         total5 = total5 + CommondLib.ConvertToDbl(dt2.Rows[k][5]);
         total6 = total6 + CommondLib.ConvertToDbl(dt2.Rows[k][6]);
         total7 = total7 + CommondLib.ConvertToDbl(dt2.Rows[k][7]);
         total8 = total8 + CommondLib.ConvertToDbl(dt2.Rows[k][8]);
         %>
            
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
 <%
     if (dt2.Rows[k][0].ToString() == "0")
     {
 %>
 <td colspan=2 height=20 class=xl120 style='border-right:.5pt solid black;
  height:15.0pt'></td>
 <%        
     }
         else
         {
             %>
             <td colspan=2 height=20 class=xl127 x:num style='border-right:.5pt solid black;
  height:15.0pt'><%=dt2.Rows[k][0] %></td>
             <%
             
         }     
 %>
 
 <%
         if (dt2.Rows[k][0].ToString() == "0")
     {
 %>
 <td colspan=2 class=xl122 style='border-right:.5pt solid black;border-left:
  none'></td>
 <%
              
     }
     else
         {
             %>
             <td colspan=2 class=xl127 x:num style='border-right:.5pt solid black;border-left:
  none'><%=dt2.Rows[k][1] %></td>
             <%
             
         }    
 %>
  <td class=xl47 >101%</td>
  <td class=xl39>&nbsp;</td>
  <td class=xl47></td>
  <%
     if (dt2.Rows[k][2].ToString() == "0")
     {
 %>
 <td class=xl48></td>
 <%        
     }
         else
         {
             %>
             <td class=xl127 x:num><%=dt2.Rows[k][2].ToString()%></td>
             <%
             
         }     
 %>
  
  
  
 <%
     if (dt2.Rows[k][3].ToString() == "0")
     {
 %>
 <td class=xl48></td>
 <%        
     }
         else
         {
             %>
             <td class=xl127 x:num><%=dt2.Rows[k][3].ToString()%></td>
             <%
             
         }     
 %>
  
 
  
 <%
       if (dt2.Rows[k][4].ToString() == "0")
     {
 %>
 <td class=xl48></td>
 <%        
     }
         else
         {
             %>
              <td class=xl127 x:num><%=dt2.Rows[k][4].ToString()%></td>
             <%
             
         }     
 %>
  
  
  <%
      if (dt2.Rows[k][5].ToString() == "0")
     {
 %>
 <td class=xl48></td>
 <%        
     }
         else
         {
             %>
             <td class=xl127 x:num><%=dt2.Rows[k][5].ToString()%></td>
             <%
             
         }     
 %>
 
 <%
     if (dt2.Rows[k][6].ToString() == "0")
     {
 %>
 <td class=xl48></td>
 <%        
     }
         else
         {
             %>
             <td class=xl127 x:num><%=dt2.Rows[k][6].ToString()%></td>
             <%
             
         }     
 %>
  
  
  
 
  <%
     if (dt2.Rows[k][7].ToString() == "0")
     {
 %>
 <td class=xl48></td>
 <%        
     }
         else
         {
             %>
             <td class=xl127 x:num><%=dt2.Rows[k][7].ToString()%></td>
             <%
             
         }     
 %>
  
  
 <%
     if (dt2.Rows[k][8].ToString() == "0")
     {
 %>
 <td class=xl48></td>
 <%        
     }
         else
         {
             %>
             <td class=xl127 x:num><%=dt2.Rows[k][8].ToString()%></td>
             <%
             
         }     
 %> 
  
 
  <td class=xl48>prs.</td>
  
  <td class=xl49>&nbsp;</td>
  
  <td class=xl50></td>
  
  <td class=xl50></td>
  
  <td class=xl50></td>
  
  <td class=xl50></td>
  <td class=xl32></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
       
         <% 
     }
  %>    
 
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl51 style='height:15.0pt'>&nbsp;</td>
  <td class=xl52>&nbsp;</td>
  <td colspan=2 class=xl124 style='border-right:.5pt solid black;border-left:
  none'>TOTAL :</td>
  <td class=xl54>&nbsp;</td>
  <td class=xl55></td>
  <td class=xl54></td>
  <%
      string total_2 = "", total_3 = "", total_4 = "", total_5 = "", total_6 = "", total_7 = "", total_8 = "";
      if (total2 == 0)
      {
          total_2 = "";
      }
      else
          total_2 = total2.ToString();

      if (total3 == 0)
      {
          total_3 = "";
      }
      else
          total_3 = total3.ToString();

      if (total4 == 0)
      {
          total_4 = "";
      }
      else
          total_4 = total4.ToString();

      if (total5 == 0)
      {
          total_5 = "";
      }
      else
          total_5 = total5.ToString();
      
      if (total6 == 0)
      {
          total_6 = "";
      }
      else
          total_6 = total6.ToString();


      if (total7 == 0)
      {
          total_7 = "";
      }
      else
          total_7 = total7.ToString();

      if (total8 == 0)
      {
          total_8 = "";
      }
      else
          total_8 = total8.ToString();
       %>
  <td class=xl127 x:num><%=total_2%></td>
  
  <td class=xl127 x:num><%=total_3%></td>
  
  <td class=xl127 x:num><%=total_4%></td>
  
  <td class=xl127 x:num><%=total_5%></td>
 
  <td class=xl127 x:num><%=total_6%></td>
  
  <td class=xl127 x:num><%=total_7%></td>
 
  <td class=xl127 x:num><%=total_8%></td>
 
  <td class=xl48>&nbsp;</td>
  
  <td class=xl49>&nbsp;</td>
  
  <td class=xl50></td>
  
  <td class=xl50></td>
  
  <td class=xl50></td>
  
  <td class=xl50></td>
  <td class=xl32></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
  
     
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl56 colspan=3 style='height:15.0pt;mso-ignore:colspan'>YARN
  CONSUMPTION</td>
  <td class=xl39>&nbsp;</td>
  <td class=xl41>&nbsp;</td>
  <td class=xl41>&nbsp;</td>
  <td class=xl58>&nbsp;</td>
  <td class=xl58>&nbsp;</td>
  <td class=xl52>&nbsp;</td>
  <td class=xl52>&nbsp;</td>
  <td class=xl43>&nbsp;</td>
  <td class=xl43>&nbsp;</td>
  <td class=xl43>&nbsp;</td>
  <td class=xl43>&nbsp;</td>
  <td class=xl43>&nbsp;</td>
  <td class=xl28>&nbsp;</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl59 style='height:27.75pt'>Colorway</td>
  <td class=xl45 width=44 style='width:33pt'>Yarn Count</td>
  <td class=xl60>Part</td>
  <td class=xl61 width=54 style='width:41pt'>Color Name</td>
  <td class=xl45 width=51 style='width:38pt'>Color No</td>
  <td class=xl45 width=49 style='width:37pt'>Weight Per Pair</td>
  <td class=xl45 width=51 style='width:38pt'>Loss</td>
  <td class=xl44><%=a %></td>
  <td class=xl44><%=b %></td>
  <td class=xl44><%=c %></td>
  <td class=xl44><%=d %></td>
  <td class=xl44><%=e %></td>
  <td class=xl44><%=f %></td>
  <td class=xl62 width=44 style='width:33pt'>Total Q'ty</td>
  <td class=xl62 width=49 style='width:37pt'>Req'd Qty</td>
  <td class=xl46>Unit</td>
  <td colspan=4 class=xl53 style='mso-ignore:colspan'></td>
  <td colspan=6 style='mso-ignore:colspan'></td>
 </tr>
 
<%
    dt3 = CtlLib.TableReadOpenCursor("SALE.sp_rpt_dsbs00010_5", "'" + saleorderpk + "'");
    double tot1 = 0, tot2 = 0, tot3 = 0, tot4 = 0, tot5 = 0, tot6 = 0, tot7 = 0, tot8 = 0;
    for (int t = 0; t < dt3.Rows.Count; t++)
    { 
        dt4 = CtlLib.TableReadOpenCursor("SALE.sp_rpt_dsbs00010_6 ", "'" + saleorderpk + "','"+dt3.Rows[t][9].ToString()+"'");
        double x=0;
        tot2 = tot2 + CommondLib.ConvertToDbl(dt3.Rows[t][2]);
        tot3 = tot3 + CommondLib.ConvertToDbl(dt3.Rows[t][3]);
        tot4 = tot4 + CommondLib.ConvertToDbl(dt3.Rows[t][4]);
        tot5 = tot5 + CommondLib.ConvertToDbl(dt3.Rows[t][5]);
        tot6 = tot6 + CommondLib.ConvertToDbl(dt3.Rows[t][6]);
        tot7 = tot7 + CommondLib.ConvertToDbl(dt3.Rows[t][7]);
        tot8 = tot8 + CommondLib.ConvertToDbl(dt3.Rows[t][8]);
        for (int s = 0; s < dt4.Rows.Count; s++)
        {
            x = x + CommondLib.ConvertToDbl(dt4.Rows[s][4]);
            double y = 0;
            y = CommondLib.ConvertToDbl(dt3.Rows[t][8]) * 1.12 * CommondLib.ConvertToDbl(dt4.Rows[s][4])/1000;
            if (s == 0)
            {
                  %>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  
  <td height=37 class=xl63 style='height:27.75pt'><%=dt3.Rows[t][0]%></td>
  
  <td class=xl64 ><%= dt4.Rows[s][0]%></td>
  
  <td class=xl65><%= dt4.Rows[s][1]%></td>
  
  <td class=xl60><%= dt4.Rows[s][2]%></td>
  <td class=xl66><%= dt4.Rows[s][3]%></td>
  <td class=xl126 x:num><%= dt4.Rows[s][4]%></td>
  <td class=xl44>112%</td>
  <td class=xl127 x:num><%= dt3.Rows[t][2]%></td>
  <td class=xl127 x:num><%= dt3.Rows[t][3]%></td>
  
  <td class=xl127 x:num><%= dt3.Rows[t][4]%></td>
  
  <td class=xl127 x:num><%= dt3.Rows[t][5]%></td>
  
  <td class=xl127 x:num><%= dt3.Rows[t][6]%></td>
  
  <td class=xl127 x:num><%= dt3.Rows[t][7]%></td>
  
  <td class=xl127 x:num><%= dt3.Rows[t][8]%></td>
 
  <td class=xl126 x:num><%=y%></td>
  
  <td class=xl126 x:num>kgs</td>
 
  <td class=xl73></td>
  
  <td class=xl74></td>
  
  <td class=xl73></td>
  
  <td class=xl74></td>
  
  <td class=xl73></td>
  
  <td class=xl74></td>
  
  <td class=xl74></td>
  <td class=xl75></td>
  <td class=xl76></td>
  <td></td>
 </tr>
 <%
    }
    else
    { 
                if (s == 1)
            {  
    %>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  
  <td height=37 class=xl63 style='height:27.75pt'><%=dt3.Rows[t][1]%></td>
  
  <td class=xl64><%= dt4.Rows[s][0]%></td>
  
  <td class=xl65><%= dt4.Rows[s][1]%></td>
  
  <td class=xl60><%= dt4.Rows[s][2]%></td>
  <td class=xl66><%= dt4.Rows[s][3]%></td>
  <td class=xl126 x:num><%= dt4.Rows[s][4]%></td>
  <td class=xl44>112%</td>
  <td class=xl44></td>
  <td class=xl68></td>
  
  <td class=xl69>&nbsp;</td>
  
  <td class=xl70>&nbsp;</td>
  
  <td class=xl69>&nbsp;</td>
  
  <td class=xl70>&nbsp;</td>
  
  <td class=xl69>&nbsp;</td>
 
  <td class=xl126 x:num><%=y %></td>
  
  <td class=xl72>kgs</td>
 
  <td class=xl73></td>
  
  <td class=xl74></td>
  
  <td class=xl73></td>
  
  <td class=xl74></td>
  
  <td class=xl73></td>
  
  <td class=xl74></td>
  
  <td class=xl74></td>
  <td class=xl75></td>
  <td class=xl76></td>
  <td></td>
 </tr>
 <%
     }
     else
     { 
                    %>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  
  <td height=37 class=xl63 style='height:27.75pt'></td>
  
  <td class=xl64><%= dt4.Rows[s][0]%></td>
  
  <td class=xl65><%= dt4.Rows[s][1]%></td>
  
  <td class=xl60><%= dt4.Rows[s][2]%></td>
  <td class=xl66><%= dt4.Rows[s][3]%></td>
  <td class=xl126 x:num><%= dt4.Rows[s][4]%></td>
  <td class=xl44>112%</td>
  <td class=xl44></td>
  <td class=xl68></td>
  
  <td class=xl69>&nbsp;</td>
  
  <td class=xl70>&nbsp;</td>
  
  <td class=xl69>&nbsp;</td>
  
  <td class=xl70>&nbsp;</td>
  
  <td class=xl69>&nbsp;</td>
 
  <td class=xl126 x:num><%=y %></td>
  
  <td class=xl72>kgs</td>
 
  <td class=xl73></td>
  
  <td class=xl74></td>
  
  <td class=xl73></td>
  
  <td class=xl74></td>
  
  <td class=xl73></td>
  
  <td class=xl74></td>
  
  <td class=xl74></td>
  <td class=xl75></td>
  <td class=xl76></td>
  <td></td>
 </tr>
 <%
            }
        }
        }
       %>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  
  <td height=37 class=xl63 style='height:27.75pt'></td>
  
  <td class=xl64>&nbsp;</td>
  
  <td class=xl65>&nbsp;</td>
  
  <td class=xl60>&nbsp;</td>
  <td class=xl66>&nbsp;</td>
  <td class=xl126 x:num><%= x %></td>
  <td class=xl44></td>
  <td class=xl44>&nbsp;</td>
  <td class=xl68 x:num></td>
  
  <td class=xl69>&nbsp;</td>
  
  <td class=xl70>&nbsp;</td>
  
  <td class=xl69>&nbsp;</td>
  
  <td class=xl70>&nbsp;</td>
  
  <td class=xl69>&nbsp;</td>
 
  <td class=xl71>&nbsp;</td>
  
  <td class=xl72></td>
 
  <td class=xl73></td>
  
  <td class=xl74></td>
  
  <td class=xl73></td>
  
  <td class=xl74></td>
  
  <td class=xl73></td>
  
  <td class=xl74></td>
  
  <td class=xl74></td>
  <td class=xl75></td>
  <td class=xl76></td>
  <td></td>
 </tr>
<% 
    }
 %>

 <%--<tr height=37 style='mso-height-source:userset;height:27.75pt'>
  
  <td height=37 class=xl63 style='height:27.75pt'></td>
  
  <td class=xl64>&nbsp;</td>
  
  <td class=xl65>&nbsp;</td>
  
  <td class=xl60>&nbsp;</td>
  <td class=xl66>&nbsp;</td>
  <td class=xl67>&nbsp;</td>
  <td class=xl44>112%</td>
  <td class=xl44>&nbsp;</td>
  <td class=xl68 x:num></td>
  
  <td class=xl69>&nbsp;</td>
  
  <td class=xl70>&nbsp;</td>
  
  <td class=xl69>&nbsp;</td>
  
  <td class=xl70>&nbsp;</td>
  
  <td class=xl69>&nbsp;</td>
 
  <td class=xl71>&nbsp;</td>
  
  <td class=xl72>kgs</td>
 
  <td class=xl73></td>
  
  <td class=xl74></td>
  
  <td class=xl73></td>
  
  <td class=xl74></td>
  
  <td class=xl73></td>
  
  <td class=xl74></td>
  
  <td class=xl74></td>
  <td class=xl75></td>
  <td class=xl76></td>
  <td></td>
 </tr>--%>

<%-- <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl77 style='height:27.75pt'>&nbsp;</td>
  <td class=xl60>&nbsp;</td>
  <td class=xl66>&nbsp;</td>
  <td class=xl67>&nbsp;</td>
  <td class=xl44>&nbsp;</td>
  <td class=xl44>&nbsp;</td>
  <td class=xl68>&nbsp;</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl69>&nbsp;</td>
  <td class=xl44>&nbsp;</td>
  <td class=xl78>&nbsp;</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>--%>
 
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl79 style='height:27.75pt'>TOTAL:</td>
  <td class=xl80>&nbsp;</td>
  <td class=xl80>&nbsp;</td>
  <td class=xl81>&nbsp;</td>
  <td class=xl80>&nbsp;</td>
  <td class=xl80>&nbsp;</td>
  <td class=xl82>&nbsp;</td>
  
  <td class=xl83 x:num><%=tot2 %></td>
  
  <td class=xl83 x:num><%=tot3 %></td>
  
  <td class=xl83 x:num><%=tot4 %></td>
  
  <td class=xl83 x:num><%=tot5 %></td>
  
  <td class=xl83 x:num><%=tot6 %></td>
  
  <td class=xl83 x:num><%=tot7 %></td>
  
  <td class=xl83 x:num><%=tot8 %></td>
  
  <td class=xl83></td>
 
  <td class=xl84>&nbsp;</td>
  
  <td class=xl50></td>
  
  <td class=xl50></td>
  
  <td class=xl50></td>
  
  <td class=xl74></td>
  <td class=xl75></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl29 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=16 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=63 style='width:47pt'></td>
  <td width=44 style='width:33pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=54 style='width:41pt'></td>
  <td width=51 style='width:38pt'></td>
  <td width=49 style='width:37pt'></td>
  <td width=51 style='width:38pt'></td>
  <td width=48 style='width:36pt'></td>
  <td width=47 style='width:35pt'></td>
  <td width=51 style='width:38pt'></td>
  <td width=49 style='width:37pt'></td>
  <td width=48 style='width:36pt'></td>
  <td width=49 style='width:37pt'></td>
  <td width=44 style='width:33pt'></td>
  <td width=49 style='width:37pt'></td>
  <td width=44 style='width:33pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=29 style='width:22pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=24 style='width:18pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
