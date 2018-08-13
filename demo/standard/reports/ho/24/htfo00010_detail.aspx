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
    string l_pk = Request.QueryString["p_pk"];
	String l_print_date="";
    string l_parameter = "'" + l_pk + "'";
    DataTable dt, dt1;
    dt = CtlLib.TableReadOpenCursor("ht_rpt_60240020_detail",l_parameter);
    if (dt.Rows.Count == 0)
    {
        Response.Write("There is no data");
        Response.End();
    }
	string SQL3 = "select to_char(sysdate,'dd-Mon-yyyy hh24:mi') print_date from dual";
    DataTable dt_sysdate = CtlLib.TableReadOpen(SQL3);
    if (dt_sysdate.Rows.Count > 0)
    {
        l_print_date = dt_sysdate.Rows[0][0].ToString();
    }
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="htfo00010_detail_files/filelist.xml">
<link rel=Edit-Time-Data href="htfo00010_detail_files/editdata.mso">
<link rel=OLE-Object-Data href="htfo00010_detail_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Compaq-500B</o:Author>
  <o:LastAuthor>dieu</o:LastAuthor>
  <o:LastPrinted>2010-12-12T01:08:14Z</o:LastPrinted>
  <o:Created>2010-12-06T07:07:55Z</o:Created>
  <o:LastSaved>2010-12-12T01:14:38Z</o:LastSaved>
  <o:Company>HP Compaq</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.9in .2in .75in .28in;
	mso-header-margin:.68in;
	mso-footer-margin:.3in;}
.font5
	{color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font6
	{color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Wingdings;
	mso-generic-font-family:auto;
	mso-font-charset:2;}
.font8
	{color:black;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
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
td
	{mso-style-parent:style0;
	padding:0px;
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
.xl65
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl66
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl67
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl68
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl69
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl70
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl71
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl72
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl73
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl74
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl75
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl76
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl77
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl78
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl79
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl80
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl81
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl82
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl83
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl84
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;
	mso-text-control:shrinktofit;}
.xl85
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl86
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border:none;}
.xl88
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl89
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl90
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl91
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl92
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl93
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl94
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl95
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl96
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl97
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl98
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl99
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl100
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl101
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl102
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl103
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl104
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl105
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl106
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl108
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl109
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl110
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl111
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl112
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl113
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl114
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl115
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl116
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl117
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl118
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl119
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl120
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl121
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl122
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl123
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl124
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl125
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl126
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	border:.5pt solid windowtext;}
.xl127
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl128
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl129
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>htrm00030</x:Name>
    <x:WorksheetOptions>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>27</x:ActiveRow>
       <x:ActiveCol>11</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>8190</x:WindowHeight>
  <x:WindowWidth>15480</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>15</x:WindowTopY>
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

<body link=blue vlink=purple class=xl65>

<table x:str border=0 cellpadding=0 cellspacing=0 width=721 style='border-collapse:
 collapse;table-layout:fixed;width:541pt'>
 <col class=xl65 width=37 style='mso-width-source:userset;mso-width-alt:1184;
 width:28pt'>
 <col class=xl65 width=51 style='mso-width-source:userset;mso-width-alt:1632;
 width:38pt'>
 <col class=xl65 width=100 style='mso-width-source:userset;mso-width-alt:3200;
 width:75pt'>
 <col class=xl65 width=51 style='mso-width-source:userset;mso-width-alt:1632;
 width:38pt'>
 <col class=xl65 width=73 style='mso-width-source:userset;mso-width-alt:2336;
 width:55pt'>
 <col class=xl65 width=99 style='mso-width-source:userset;mso-width-alt:3168;
 width:74pt'>
 <col class=xl65 width=109 style='mso-width-source:userset;mso-width-alt:3788;
 width:82pt'>
 <col class=xl65 width=156 style='mso-width-source:userset;mso-width-alt:4992;
 width:117pt'>
 <col class=xl65 width=45 style='mso-width-source:userset;mso-width-alt:1440;
 width:34pt'>
 <col class=xl65 width=73 span=247 style='mso-width-source:userset;mso-width-alt:
 2336;width:55pt'>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl65 width=37 style='height:13.5pt;width:28pt'></td>
  <td class=xl65 width=51 style='width:38pt'></td>
  <td class=xl65 width=100 style='width:75pt'></td>
  <td class=xl65 width=51 style='width:38pt'></td>
  <td class=xl65 width=73 style='width:55pt'></td>
  <td class=xl65 width=99 style='width:74pt'></td>
  <td class=xl65 width=109 style='width:82pt'></td>
  <td class=xl65 width=156 style='width:117pt'></td>
  <td class=xl65 width=45 style='width:34pt'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl65 style='height:12.75pt'></td>
  <td class=xl76>&nbsp;</td>
  <td class=xl77>&nbsp;</td>
  <td class=xl77>&nbsp;</td>
  <td align=left valign=top><!--[if gte vml 1]><v:shapetype id="_x0000_t75"
   coordsize="21600,21600" o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe"
   filled="f" stroked="f">
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
  </v:shapetype><v:shape id="_x0000_s1026" type="#_x0000_t75" style='position:absolute;
   margin-left:36.75pt;margin-top:.75pt;width:99.75pt;height:63.75pt;z-index:1'>
   <v:imagedata src="htfo00010_detail_files/image001.png" o:title="image001"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:49px;margin-top:1px;width:133px;
  height:85px'><img width=133 height=85
  src="htfo00010_detail_files/image002.jpg" v:shapes="_x0000_s1026"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=17 class=xl77 width=73 style='height:12.75pt;width:55pt'>&nbsp;</td>
   </tr>
  </table>
  </span></td>
  <td class=xl77>&nbsp;</td>
  <td class=xl77>&nbsp;</td>
  <td class=xl77>&nbsp;</td>
  <td class=xl78>&nbsp;</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl65 style='height:12.75pt'></td>
  <td class=xl79>&nbsp;</td>
  <td colspan=6 class=xl65 style='mso-ignore:colspan'></td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl65 style='height:12.75pt'></td>
  <td class=xl79>&nbsp;</td>
  <td colspan=6 class=xl65 style='mso-ignore:colspan'></td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl65 style='height:12.75pt'></td>
  <td class=xl79>&nbsp;</td>
  <td colspan=6 class=xl65 style='mso-ignore:colspan'></td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl65 style='height:12.75pt'></td>
  <td class=xl79>&nbsp;</td>
  <td colspan=6 class=xl65 style='mso-ignore:colspan'></td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl65 style='height:21.0pt'></td>
  <td class=xl79>&nbsp;</td>
  <td colspan=3 class=xl95>Registration Form</td>
  <td colspan=3 class=xl65 style='mso-ignore:colspan'></td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl65 style='height:20.1pt'></td>
  <td class=xl79>&nbsp;</td>
  <td class=xl88 style='border-top:none'>Account Number</td>
  <td colspan=2 class=xl96 style='border-right:.5pt solid black;border-left:
  none'>Arrival Date</td>
  <td class=xl88 style='border-left:none'>Departure Date</td>
  <td class=xl88 style='border-left:none'>Arrival Time</td>
  <td class=xl88 style='border-left:none'>Room Type</td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl65 style='height:20.1pt'></td>
  <td class=xl79>&nbsp;</td>
  <td class=xl84 style='border-top:none'><%=dt.Rows[0][24]%></td>
  <td colspan=2 class=xl111 style='border-right:.5pt solid black;border-left:
  none'><%=dt.Rows[0][6]%></td>
  <td class=xl84 style='border-top:none;border-left:none'><%=dt.Rows[0][7]%></td>
  <td class=xl84 style='border-top:none;border-left:none'></td>
  <td class=xl84 style='border-top:none;border-left:none'><%=dt.Rows[0][11]%></td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl65 style='height:20.1pt'></td>
  <td class=xl79>&nbsp;</td>
  <td class=xl88 style='border-top:none'>Rental Rate</td>
  <td colspan=2 class=xl96 style='border-right:.5pt solid black;border-left:
  none'>No Of Guest</td>
  <td colspan=2 class=xl88 style='border-left:none'>Advance Deposit</td>
  <td class=xl88 style='border-top:none;border-left:none'>Room No</td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl65 style='height:20.1pt'></td>
  <td class=xl79>&nbsp;</td>
  <td class=xl84 style='border-top:none' x:num><%=dt.Rows[0][9]%></td>
  <td class=xl84 style='border-top:none;border-left:none' x:num><%=dt.Rows[0][15]%></td>
  <td class=xl84 style='border-top:none;border-left:none' x:num><%=dt.Rows[0][17]%></td>
  <td colspan=2 class=xl126 style='border-left:none' x:num><%=dt.Rows[0][8]%></td>
  <td class=xl84 style='border-top:none;border-left:none' x:num><%=dt.Rows[0][10]%></td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td height=31 class=xl65 style='height:23.25pt'></td>
  <td class=xl79>&nbsp;</td>
  <td class=xl66 style='border-top:none'>&nbsp;</td>
  <td class=xl66 style='border-top:none'>&nbsp;</td>
  <td class=xl66 style='border-top:none'>&nbsp;</td>
  <td class=xl66 style='border-top:none'>&nbsp;</td>
  <td class=xl66 style='border-top:none'>&nbsp;</td>
  <td class=xl66 style='border-top:none'>&nbsp;</td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.95pt'>
  <td height=33 class=xl65 style='height:24.95pt'></td>
  <td class=xl79>&nbsp;</td>
  <td class=xl89 style='border-top:none'>Mr/Mrs/Miss:</td>
  <td colspan=5 class=xl117 style='border-right:.5pt solid black'><%=dt.Rows[0][3]%></td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.95pt'>
  <td height=33 class=xl65 style='height:24.95pt'></td>
  <td class=xl79>&nbsp;</td>
  <td colspan=3 class=xl128>Surname:<font class="font5"><%=dt.Rows[0][25]%></font></td>
  <td colspan=2 class=xl129>First Name:<font class="font5"><%=dt.Rows[0][26]%></font></td>
  <td class=xl90>Initial:</td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=42 style='mso-height-source:userset;height:31.5pt'>
  <td height=42 class=xl65 style='height:31.5pt'></td>
  <td class=xl79>&nbsp;</td>
  <td colspan=6 class=xl120 style='border-right:.5pt solid black'>Address:<%=dt.Rows[0][28]%><font
  class="font5"></font></td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=41 style='mso-height-source:userset;height:30.75pt'>
  <td height=41 class=xl65 style='height:30.75pt'></td>
  <td class=xl79>&nbsp;</td>
  <td colspan=3 class=xl128>City:<%=dt.Rows[0][29]%><font class="font5"></font></td>
  <td class=xl91>Zip Code:<font class="font5"></font></td>
  <td colspan=2 class=xl127 style='border-right:.5pt solid black'>Country:<font
  class="font5"><%=dt.Rows[0][5]%></font></td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.95pt'>
  <td height=33 class=xl65 style='height:24.95pt'></td>
  <td class=xl79>&nbsp;</td>
  <td colspan=4 class=xl98 style='border-right:.5pt solid black'>Name Of
  Company: <span style='font-weight:normal'><%=dt.Rows[0]["company_name"]%></span></td>
  <td colspan=2 class=xl98 style='border-right:.5pt solid black;border-left:
  none'>Occupation:</td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl65 style='height:12.75pt'></td>
  <td class=xl79>&nbsp;</td>
  <td colspan=4 class=xl100 style='border-right:.5pt solid black'>&nbsp;</td>
  <td colspan=2 class=xl123 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.95pt'>
  <td height=33 class=xl65 style='height:24.95pt'></td>
  <td class=xl79>&nbsp;</td>
  <td colspan=2 class=xl98 style='border-right:.5pt solid black'>Nationality:</td>
  <td class=xl89 style='border-top:none;border-left:none'>Passport No:</td>
  <td class=xl83 style='border-top:none' x:num></td>
  <td class=xl93 style='border-top:none;border-left:none'>Date/Place of issue</td>
  <td class=xl94 style='border-top:none;border-left:none'>Date of Birth</td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.95pt'>
  <td height=33 class=xl65 style='height:24.95pt'></td>
  <td class=xl79>&nbsp;</td>
  <td colspan=2 class=xl100 style='border-right:.5pt solid black'>&nbsp;</td>
  <td class=xl92 style='border-left:none'>Expire Date:</td>
  <td class=xl72></td>
  <td class=xl73 style='border-left:none'>&nbsp;</td>
  <td class=xl73 style='border-left:none'>&nbsp;</td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl65 style='height:30.0pt'></td>
  <td class=xl79>&nbsp;</td>
  <td colspan=3 class=xl103>Name Of Guest's Accompanying :</td>
  <td class=xl67 style='border-top:none'>&nbsp;</td>
  <td class=xl67 style='border-top:none'>&nbsp;</td>
  <td class=xl68 style='border-top:none'>&nbsp;</td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td height=27 class=xl65 style='height:20.25pt'></td>
  <td class=xl79>&nbsp;</td>
  <td class=xl74>&nbsp;</td>
  <td colspan=4 class=xl65 style='mso-ignore:colspan'></td>
  <td class=xl75>&nbsp;</td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl65 style='height:21.75pt'></td>
  <td class=xl79>&nbsp;</td>
  <td class=xl69>&nbsp;</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl70>&nbsp;</td>
  <td class=xl72>&nbsp;</td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl65 style='height:19.5pt'></td>
  <td class=xl79>&nbsp;</td>
  <td class=xl89 style='border-top:none'>Payment by</td>
  <td class=xl67 style='border-top:none'>&nbsp;</td>
  <td class=xl67 style='border-top:none'>&nbsp;</td>
  <td class=xl67 style='border-top:none'>&nbsp;</td>
  <td class=xl67 style='border-top:none'>&nbsp;</td>
  <td class=xl68 style='border-top:none'>&nbsp;</td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl65 style='height:19.5pt'></td>
  <td class=xl79>&nbsp;</td>
  <td class=xl69><font class="font6">o</font><font class="font8">Cash</font></td>
  <td colspan=2 class=xl97><font class="font6">o</font><font class="font8">T/A</font></td>
  <td class=xl70><font class="font6">o</font><font class="font8">Co.</font></td>
  <td class=xl70><font class="font6">o</font><font class="font8">Credit Card</font></td>
  <td class=xl71><font class="font6">o</font><font class="font8">Others</font></td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl65 style='height:27.75pt'></td>
  <td class=xl79>&nbsp;</td>
  <td colspan=4 class=xl114 style='border-right:.5pt solid black'>Remarks</td>
  <td colspan=2 class=xl114 style='border-right:.5pt solid black;border-left:
  none'>Receptionist's Initial</td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=59 style='mso-height-source:userset;height:44.25pt'>
  <td height=59 class=xl65 style='height:44.25pt'></td>
  <td class=xl79>&nbsp;</td>
  <td colspan=4 class=xl111 style='border-right:.5pt solid black'>&nbsp;</td>
  <td colspan=2 class=xl111 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
  <td class=xl80>&nbsp;</td>
 </tr>
 <tr height=146 style='mso-height-source:userset;height:109.5pt'>
  <td height=146 class=xl65 style='height:109.5pt'></td>
  <td class=xl81>&nbsp;</td>
  <td colspan=3 class=xl108 style='border-right:.5pt solid black'>Guest's
  Signature</td>
  <td colspan=3 class=xl106 width=265 style='border-left:none;width:199pt'>I
  hereby agree to be joinly and severely liable <br>
    with the person, company or association as <br>
    may be indicated on this registration card for<br>
    all charges incurred on all accounts as I may<br>
    now or hereafter maintain with the Hotel Service <br>
    . I authorize the service Residence<br>
    to change to my credit card if I choose not<br>
    to check out with the Receptionist.</td>
  <td class=xl82>&nbsp;</td>
 </tr>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td height=31 colspan=2 class=xl65 style='height:23.25pt;mso-ignore:colspan'></td>
  <td class=xl85>&nbsp;</td>
  <td class=xl85>&nbsp;</td>
  <td class=xl85>&nbsp;</td>
  <td class=xl85>&nbsp;</td>
  <td class=xl86 width=109 style='width:82pt'>&nbsp;</td>
  <td class=xl85>&nbsp;</td>
  <td class=xl65></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl65 style='height:12.75pt'></td>
  <td colspan=8 class=xl87 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=9 class=xl65 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=37 style='width:28pt'></td>
  <td width=51 style='width:38pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=51 style='width:38pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=109 style='width:82pt'></td>
  <td width=156 style='width:117pt'></td>
  <td width=45 style='width:34pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
