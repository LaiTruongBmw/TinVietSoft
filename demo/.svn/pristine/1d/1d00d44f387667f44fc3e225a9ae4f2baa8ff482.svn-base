<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<% Response.ContentType = "application/vnd.ms-excel"; %>
<% CtlLib.SetUser(Session["APP_DBUSER"].ToString());%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string p_lang = Request.QueryString["p_lang"];
    string p_item_grp = Request.QueryString["p_item_grp"];
    string p_item = Request.QueryString["p_item"];
    string p_rad_type = Request.QueryString["p_rad_type"]; 
    string p_dt_from = Request.QueryString["p_dt_from"]; 
    string p_dt_to = Request.QueryString["p_dt_to"]; 
    string p_wh_pk_1 = Request.QueryString["p_wh_pk_1"]; 
    string p_wh_pk_2 = Request.QueryString["p_wh_pk_2"]; 
    string p_wh_pk_3 = Request.QueryString["p_wh_pk_3"]; 
    string p_wh_pk_4 = Request.QueryString["p_wh_pk_4"]; 
    string p_wh_pk_5 = Request.QueryString["p_wh_pk_5"];
    string p_wh_pk_6 = Request.QueryString["p_wh_pk_6"];
    string p_wh_pk_7 = Request.QueryString["p_wh_pk_7"];
    string p_wh_pk_8 = Request.QueryString["p_wh_pk_8"];
    string p_wh_pk_9 = Request.QueryString["p_wh_pk_9"];
    string p_wh_pk_10 = Request.QueryString["p_wh_pk_10"];
        
    string p_storage = Request.QueryString["p_storage"];

    string para = "'" + p_lang + "','" + p_item_grp + "','" + p_item + "','" + p_rad_type + "','" + p_dt_from + "','" + p_dt_to + "','";
    para += p_wh_pk_1 + "','" + p_wh_pk_2 + "','" + p_wh_pk_3 + "','" + p_wh_pk_4 + "','" + p_wh_pk_5 + "','";
    para += p_wh_pk_6 + "','" + p_wh_pk_7 + "','" + p_wh_pk_8 + "','" + p_wh_pk_9 + "','" + p_wh_pk_10 + "'";
    
    string para1 = "'" + p_storage + "'";
    DataTable dt, dt1, dt2;
    dt1 = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00100", para1);
    dt2 = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00100_1", para);
    string str_sql = @"SELECT partner_name, addr1, phone_no, fax_no, tax_code, tco_bpphoto_pk
                       FROM tco_company
                       WHERE del_if = 0 AND pk = (SELECT MAX (pk)
                                                  FROM tco_company
                                                  WHERE del_if = 0 AND active_yn = 'Y')";
    dt = CtlLib.TableReadOpen(str_sql);
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="group_sub_total_files/filelist.xml">
<link rel=Edit-Time-Data href="group_sub_total_files/editdata.mso">
<link rel=OLE-Object-Data href="group_sub_total_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Administrator</o:Author>
  <o:LastAuthor>DATAVINA</o:LastAuthor>
  <o:LastPrinted>2011-12-19T06:32:06Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2013-03-15T03:41:41Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"&CPage &P of &N";
	margin:.1in .17in .33in .18in;
	mso-header-margin:0in;
	mso-footer-margin:.17in;
	mso-page-orientation:landscape;}
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
.style58
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
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl67
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl68
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl69
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:normal;}
.xl70
	{mso-style-parent:style58;
	color:black;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;}
.xl72
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl73
	{mso-style-parent:style58;
	color:black;
	font-size:8.0pt;
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
.xl74
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl76
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
.xl77
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\\\(\#\,\#\#0\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:auto none;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl80
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl81
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
.xl82
	{mso-style-parent:style58;
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
	border-left:.5pt solid black;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl83
	{mso-style-parent:style58;
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
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl84
	{mso-style-parent:style58;
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
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl85
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
.xl86
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:auto none;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:auto none;
	white-space:normal;}
.xl89
	{mso-style-parent:style58;
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
.xl90
	{mso-style-parent:style58;
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
.xl91
	{mso-style-parent:style58;
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
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>210</x:DefaultRowHeight>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>47</x:Scale>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>21</x:ActiveRow>
       <x:ActiveCol>4</x:ActiveCol>
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
  <x:WindowHeight>9300</x:WindowHeight>
  <x:WindowWidth>15135</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$6:$6</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl66>

<table x:str border=0 cellpadding=0 cellspacing=0 width=3308 style='border-collapse:
 collapse;table-layout:fixed;width:2501pt'>
 <col class=xl66 width=119 style='mso-width-source:userset;mso-width-alt:4352;
 width:89pt'>
 <col class=xl66 width=107 style='mso-width-source:userset;mso-width-alt:3913;
 width:80pt'>
 <col class=xl66 width=221 style='mso-width-source:userset;mso-width-alt:8082;
 width:166pt'>
 <col class=xl66 width=61 style='mso-width-source:userset;mso-width-alt:2230;
 width:46pt'>
 <col class=xl66 width=70 span=40 style='mso-width-source:userset;mso-width-alt:
 2560;width:53pt'>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl67 width=119 style='height:15.0pt;width:89pt'><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:2px;margin-top:2px;width:100px;
  height:56px'><img width=100 height=56 src="rpt_bisc00100_grand_files/image002.jpg"
  v:shapes="_x0000_s1025"></span></td>
  <td class=xl66 width=107 style='width:80pt'></td>
  <td class=xl68 width=221 style='width:166pt'><%=dt.Rows[0]["partner_name"]%></td>
  <td class=xl68 width=61 style='width:46pt'></td>
  <td class=xl67 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl69 width=70 style='width:53pt'></td>
  <td class=xl69 width=70 style='width:53pt'></td>
  <td class=xl69 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td colspan=3 class=xl80 width=210 style='width:159pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td colspan=3 class=xl80 width=210 style='width:159pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td colspan=3 class=xl80 width=210 style='width:159pt'></td>
  <td class=xl66 width=70 style='width:53pt'></td>
  <td colspan=3 class=xl80 width=210 style='width:159pt'>Tel: <%=dt.Rows[0]["phone_no"] %></td>
  <td class=xl66 width=70 style='width:53pt'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl67 style='height:15.0pt'></td>
  <td class=xl66></td>
  <td class=xl67 colspan=4 style='mso-ignore:colspan'><%=dt.Rows[0]["addr1"]%></td>
  <td colspan=3 class=xl69 style='mso-ignore:colspan'></td>
  <td colspan=19 class=xl66 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl80></td>
  <td class=xl66></td>
  <td colspan=3 class=xl80></td>
  <td class=xl66></td>
  <td colspan=3 class=xl80></td>
  <td class=xl66></td>
  <td colspan=3 class=xl80>Fax: <%=dt.Rows[0]["fax_no"]%></td>
  <td class=xl66></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl67 style='height:15.0pt'></td>
  <td class=xl66></td>
  <td class=xl67>Tax code: <%=dt.Rows[0]["tax_code"]%></td>
  <td colspan=2 class=xl67 style='mso-ignore:colspan'></td>
  <td class=xl66></td>
  <td class=xl70 width=70 style='width:53pt'>&nbsp;</td>
  <td class=xl70 width=70 style='width:53pt'>&nbsp;</td>
  <td class=xl70 width=70 style='width:53pt'>&nbsp;</td>
  <td colspan=19 class=xl66 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl81>&nbsp;</td>
  <td class=xl66></td>
  <td colspan=3 class=xl81>&nbsp;</td>
  <td class=xl79>&nbsp;</td>
  <td colspan=3 class=xl81>&nbsp;</td>
  <td class=xl79>&nbsp;</td>
  <td colspan=3 class=xl81>Print date : <%=DateTime.Now.ToString("dd/MM/yyyy hh:mm") %></td>
  <td class=xl79>&nbsp;</td>
 </tr>
 <tr height=48 style='mso-height-source:userset;height:36.0pt'>
  <td colspan=44 height=48 class=xl85 width=3308 style='height:36.0pt;
  width:2501pt'>REPORT W/H STOCK CHECKING</td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl67 style='height:21.0pt'>W/H Name :<font class="font7">
  </font><font class="font6"><span style='mso-spacerun:yes'>  </span></font></td>
  <td colspan=2 class=xl67 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td class=xl67></td>
  <td class=xl71></td>
  <td colspan=2 class=xl72 style='mso-ignore:colspan'></td>
  <td class=xl67></td>
  <td colspan=35 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td rowspan=2 height=50 class=xl89 width=119 style='border-bottom:.5pt solid black;
  height:37.5pt;width:89pt'>Group</td>
  <td rowspan=2 class=xl89 width=107 style='border-bottom:.5pt solid black;
  width:80pt'>Item Code</td>
  <td rowspan=2 class=xl89 width=221 style='border-bottom:.5pt solid black;
  width:166pt'>Item Name</td>
  <td rowspan=2 class=xl89 width=61 style='border-bottom:.5pt solid black;
  width:46pt'>UOM</td>
  <td colspan=4 class=xl91 width=280 style='border-right:.5pt solid black;
  border-left:none;width:212pt'><%=dt1.Rows[0]["wh_01_nm"]%></td>
  <td colspan=4 class=xl82 width=280 style='border-right:.5pt solid black;
  border-left:none;width:212pt'><%=dt1.Rows[0]["wh_02_nm"]%></td>
  <td colspan=4 class=xl82 width=280 style='border-right:.5pt solid black;
  border-left:none;width:212pt'><%=dt1.Rows[0]["wh_03_nm"]%></td>
  <td colspan=4 class=xl82 width=280 style='border-right:.5pt solid black;
  border-left:none;width:212pt'><%=dt1.Rows[0]["wh_04_nm"]%></td>
  <td colspan=4 class=xl82 width=280 style='border-right:.5pt solid black;
  border-left:none;width:212pt'><%=dt1.Rows[0]["wh_05_nm"]%></td>
  <td colspan=4 class=xl82 width=280 style='border-right:.5pt solid black;
  border-left:none;width:212pt'><%=dt1.Rows[0]["wh_06_nm"]%></td>
  <td colspan=4 class=xl82 width=280 style='border-right:.5pt solid black;
  border-left:none;width:212pt'><%=dt1.Rows[0]["wh_07_nm"]%></td>
  <td colspan=4 class=xl82 width=280 style='border-right:.5pt solid black;
  border-left:none;width:212pt'><%=dt1.Rows[0]["wh_08_nm"]%></td>
  <td colspan=4 class=xl82 width=280 style='border-right:.5pt solid black;
  border-left:none;width:212pt'><%=dt1.Rows[0]["wh_09_nm"]%></td>
  <td colspan=4 class=xl82 width=280 style='border-right:.5pt solid black;
  border-left:none;width:212pt'><%=dt1.Rows[0]["wh_10_nm"]%></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td height=23 class=xl73 width=70 style='height:17.25pt;width:53pt'>Begin</td>
  <td class=xl73 width=70 style='width:53pt'>In</td>
  <td class=xl73 width=70 style='width:53pt'>Out</td>
  <td class=xl73 width=70 style='width:53pt'>End</td>
  <td class=xl73 width=70 style='width:53pt'>Begin</td>
  <td class=xl73 width=70 style='width:53pt'>In</td>
  <td class=xl73 width=70 style='width:53pt'>Out</td>
  <td class=xl73 width=70 style='width:53pt'>End</td>
  <td class=xl73 width=70 style='width:53pt'>Begin</td>
  <td class=xl73 width=70 style='width:53pt'>In</td>
  <td class=xl73 width=70 style='width:53pt'>Out</td>
  <td class=xl73 width=70 style='width:53pt'>End</td>
  <td class=xl73 width=70 style='width:53pt'>Begin</td>
  <td class=xl73 width=70 style='width:53pt'>In</td>
  <td class=xl73 width=70 style='width:53pt'>Out</td>
  <td class=xl73 width=70 style='width:53pt'>End</td>
  <td class=xl73 width=70 style='width:53pt'>Begin</td>
  <td class=xl73 width=70 style='width:53pt'>In</td>
  <td class=xl73 width=70 style='width:53pt'>Out</td>
  <td class=xl73 width=70 style='width:53pt'>End</td>
  <td class=xl73 width=70 style='width:53pt'>Begin</td>
  <td class=xl73 width=70 style='width:53pt'>In</td>
  <td class=xl73 width=70 style='width:53pt'>Out</td>
  <td class=xl73 width=70 style='width:53pt'>End</td>
  <td class=xl73 width=70 style='width:53pt'>Begin</td>
  <td class=xl73 width=70 style='width:53pt'>In</td>
  <td class=xl73 width=70 style='width:53pt'>Out</td>
  <td class=xl73 width=70 style='width:53pt'>End</td>
  <td class=xl73 width=70 style='width:53pt'>Begin</td>
  <td class=xl73 width=70 style='width:53pt'>In</td>
  <td class=xl73 width=70 style='width:53pt'>Out</td>
  <td class=xl73 width=70 style='width:53pt'>End</td>
  <td class=xl73 width=70 style='width:53pt'>Begin</td>
  <td class=xl73 width=70 style='width:53pt'>In</td>
  <td class=xl73 width=70 style='width:53pt'>Out</td>
  <td class=xl73 width=70 style='width:53pt'>End</td>
  <td class=xl73 width=70 style='width:53pt'>Begin</td>
  <td class=xl73 width=70 style='width:53pt'>In</td>
  <td class=xl73 width=70 style='width:53pt'>Out</td>
  <td class=xl73 width=70 style='width:53pt'>End</td>
 </tr>
<%
     double total1 = 0, total2 = 0, total3 = 0, total4 = 0, total5 = 0, total6 = 0, total7 = 0, total8 = 0, total9 = 0, total10 = 0, total11 = 0, total12 = 0;
     double total13 = 0, total14 = 0, total15 = 0, total16 = 0, total17 = 0, total18 = 0, total19 = 0, total20 = 0, total21 = 0, total22 = 0, total23 = 0, total24 = 0, total25 = 0, total26 = 0, total27 = 0, total28 = 0;
     double total29 = 0, total30 = 0, total31 = 0, total32 = 0, total33 = 0, total34 = 0, total35 = 0, total36 = 0, total37 = 0, total38 = 0, total39 = 0, total40 = 0;

     double m_total1 = 0, m_total2 = 0, m_total3 = 0, m_total4 = 0, m_total5 = 0, m_total6 = 0, m_total7 = 0, m_total8 = 0, m_total9 = 0, m_total10 = 0, m_total11 = 0, m_total12 = 0;
     double m_total13 = 0, m_total14 = 0, m_total15 = 0, m_total16 = 0, m_total17 = 0, m_total18 = 0, m_total19 = 0, m_total20 = 0, m_total21 = 0, m_total22 = 0, m_total23 = 0, m_total24 = 0, m_total25 = 0, m_total26 = 0, m_total27 = 0, m_total28 = 0;
     double m_total29 = 0, m_total30 = 0, m_total31 = 0, m_total32 = 0, m_total33 = 0, m_total34 = 0, m_total35 = 0, m_total36 = 0, m_total37 = 0, m_total38 = 0, m_total39 = 0, m_total40 = 0;
     
     for (int i = 0; i < dt2.Rows.Count; i++)
     {
         m_total1 = m_total1 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty1"]);
         m_total2 = m_total2 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty2"]);
         m_total3 = m_total3 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty3"]);
         m_total4 = m_total4 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty4"]);
         m_total5 = m_total5 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty5"]);
         m_total6 = m_total6 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty6"]);
         m_total7 = m_total7 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty7"]);
         m_total8 = m_total8 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty8"]);
         m_total9 = m_total9 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty9"]);
         m_total10 = m_total10 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty10"]);
         
         m_total11 = m_total11 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty11"]);
         m_total12 = m_total12 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty12"]);
         m_total13 = m_total13 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty13"]);
         m_total14 = m_total14 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty14"]);
         m_total15 = m_total15 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty15"]);
         m_total16 = m_total16 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty16"]);
         m_total17 = m_total17 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty17"]);
         m_total18 = m_total18 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty18"]);
         m_total19 = m_total19 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty19"]);
         
         m_total20 = m_total20 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty20"]);
         m_total21 = m_total21 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty21"]);
         m_total22 = m_total22 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty22"]);
         m_total23 = m_total23 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty23"]);
         m_total24 = m_total24 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty24"]);
         m_total25 = m_total25 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty25"]);
         m_total26 = m_total26 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty26"]);
         m_total27 = m_total27 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty27"]);
         m_total28 = m_total28 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty28"]);
         m_total29 = m_total29 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty29"]);
         m_total30 = m_total30 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty30"]);

         m_total31 = m_total31 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty31"]);
         m_total32 = m_total32 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty32"]);
         m_total33 = m_total33 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty33"]);
         m_total34 = m_total34 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty34"]);
         m_total35 = m_total35 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty35"]);
         m_total36 = m_total36 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty36"]);
         m_total37 = m_total37 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty37"]);
         m_total38 = m_total38 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty38"]);
         m_total39 = m_total39 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty39"]);
         m_total40 = m_total40 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty40"]);
         if (i == 0)
         {
             total1 = total1 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty1"]);
             total2 = total2 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty2"]);
             total3 = total3 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty3"]);
             total4 = total4 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty4"]);
             total5 = total5 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty5"]);
             total6 = total6 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty6"]);
             total7 = total7 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty7"]);
             total8 = total8 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty8"]);
             total9 = total9 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty9"]);
             total10 = total10 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty10"]);
             total11 = total11 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty11"]);
             total12 = total12 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty12"]);
             total13 = total13 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty13"]);
             total14 = total14 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty14"]);
             total15 = total15 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty15"]);
             total16 = total16 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty16"]);
             total17 = total17 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty17"]);
             total18 = total18 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty18"]);
             total19 = total19 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty19"]);
             total20 = total20 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty20"]);
             total21 = total21 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty21"]);
             total22 = total22 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty22"]);
             total23 = total23 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty23"]);
             total24 = total24 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty24"]);
             total25 = total25 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty25"]);
             total26 = total26 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty26"]);
             total27 = total27 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty27"]);
             total28 = total28 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty28"]);
             total29 = total29 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty29"]);
             total30 = total30 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty30"]);

             total31 = total31 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty31"]);
             total32 = total32 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty32"]);
             total33 = total33 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty33"]);
             total34 = total34 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty34"]);
             total35 = total35 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty35"]);
             total36 = total36 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty36"]);
             total37 = total37 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty37"]);
             total38 = total38 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty38"]);
             total39 = total39 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty39"]);
             total40 = total40 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty40"]);
         %>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl74 width=119 style='height:22.5pt;width:89pt'><%=dt2.Rows[i]["grp_nm"]%></td>
  <td class=xl75 width=107 style='width:80pt'><%=dt2.Rows[i]["item_code"]%></td>
  <td class=xl75 width=221 style='width:166pt'><%=dt2.Rows[i]["item_name"]%></td>
  <td class=xl76 width=61 style='width:46pt'><%=dt2.Rows[i]["uom"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty1"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty2"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty3"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty4"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty5"]%>  </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty6"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty7"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty8"]%>  </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty9"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty10"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty11"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty12"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty13"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty14"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty15"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty16"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty17"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty18"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty19"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty20"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty21"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty22"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty23"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty24"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty25"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty26"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty27"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty28"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty29"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty30"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty31"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty32"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty33"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty34"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty35"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty36"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty37"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty38"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty39"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty40"]%></td>
 </tr>
          <% 
     }
         else if (dt2.Rows[i]["tlg_it_itemgrp_pk"].ToString() != dt2.Rows[i - 1]["tlg_it_itemgrp_pk"].ToString())
     {
          %>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=4 height=30 class=xl86 width=508 style='border-right:.5pt solid black;
  height:22.5pt;width:381pt'>&nbsp;</td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total1%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total2%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total3%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total4%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total5%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total6%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total7%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total8%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total9%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total10%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total11%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total12%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total13%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total14%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total15%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total16%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total17%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total18%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total19%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total20%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total21%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total22%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total23%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total24%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total25%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total26%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total27%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total28%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total29%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total30%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total31%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total32%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total33%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total34%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total35%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total36%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total37%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total38%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total39%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total40%></td>
 </tr>
  <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl74 width=119 style='height:22.5pt;width:89pt'><%=dt2.Rows[i]["grp_nm"]%></td>
  <td class=xl75 width=107 style='width:80pt'><%=dt2.Rows[i]["item_code"]%></td>
  <td class=xl75 width=221 style='width:166pt'><%=dt2.Rows[i]["item_name"]%></td>
  <td class=xl76 width=61 style='width:46pt'><%=dt2.Rows[i]["uom"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty1"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty2"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty3"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty4"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty5"]%>  </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty6"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty7"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty8"]%>  </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty9"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty10"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty11"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty12"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty13"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty14"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty15"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty16"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty17"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty18"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty19"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty20"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty21"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty22"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty23"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty24"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty25"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty26"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty27"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty28"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty29"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty30"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty31"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty32"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty33"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty34"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty35"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty36"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty37"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty38"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty39"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty40"]%></td>
 </tr>
   <%
          total1 = 0;        total11 = 0;      total21 = 0;       total31 = 0;
          total2 = 0;        total12 = 0;      total22 = 0;       total32 = 0;
          total3 = 0;        total13 = 0;      total23 = 0;       total33 = 0;
          total4 = 0;        total14 = 0;      total24 = 0;       total34 = 0;
          total5 = 0;        total15 = 0;      total25 = 0;       total35 = 0;
          total6 = 0;        total16 = 0;      total26 = 0;       total36 = 0;
          total7 = 0;        total17 = 0;      total27 = 0;       total37 = 0;
          total8 = 0;        total18 = 0;      total28 = 0;       total38 = 0;
          total9 = 0;        total19 = 0;      total29 = 0;       total39 = 0;
          total10 = 0;       total20 = 0;      total30 = 0;       total40 = 0;

          total1 = total1 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty1"]);
          total2 = total2 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty2"]);
          total3 = total3 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty3"]);
          total4 = total4 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty4"]);
          total5 = total5 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty5"]);
          total6 = total6 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty6"]);
          total7 = total7 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty7"]);
          total8 = total8 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty8"]);
          total9 = total9 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty9"]);
          total10 = total10 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty10"]);
          total11 = total11 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty11"]);
          total12 = total12 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty12"]);
          total13 = total13 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty13"]);
          total14 = total14 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty14"]);
          total15 = total15 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty15"]);
          total16 = total16 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty16"]);
          total17 = total17 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty17"]);
          total18 = total18 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty18"]);
          total19 = total19 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty19"]);
          total20 = total20 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty20"]);
          total21 = total21 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty21"]);
          total22 = total22 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty22"]);
          total23 = total23 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty23"]);
          total24 = total24 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty24"]);
          total25 = total25 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty25"]);
          total26 = total26 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty26"]);
          total27 = total27 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty27"]);
          total28 = total28 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty28"]);
          total29 = total29 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty29"]);
          total30 = total30 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty30"]);

          total31 = total31 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty31"]);
          total32 = total32 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty32"]);
          total33 = total33 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty33"]);
          total34 = total34 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty34"]);
          total35 = total35 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty35"]);
          total36 = total36 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty36"]);
          total37 = total37 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty37"]);
          total38 = total38 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty38"]);
          total39 = total39 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty39"]);
          total40 = total40 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty40"]);                       
         }
         else if (dt2.Rows[i]["tlg_it_itemgrp_pk"].ToString() == dt2.Rows[i - 1]["tlg_it_itemgrp_pk"].ToString())
         {
             total1 = total1 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty1"]);
             total2 = total2 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty2"]);
             total3 = total3 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty3"]);
             total4 = total4 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty4"]);
             total5 = total5 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty5"]);
             total6 = total6 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty6"]);
             total7 = total7 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty7"]);
             total8 = total8 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty8"]);
             total9 = total9 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty9"]);
             total10 = total10 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty10"]);
             total11 = total11 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty11"]);
             total12 = total12 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty12"]);
             total13 = total13 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty13"]);
             total14 = total14 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty14"]);
             total15 = total15 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty15"]);
             total16 = total16 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty16"]);
             total17 = total17 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty17"]);
             total18 = total18 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty18"]);
             total19 = total19 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty19"]);
             total20 = total20 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty20"]);
             total21 = total21 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty21"]);
             total22 = total22 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty22"]);
             total23 = total23 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty23"]);
             total24 = total24 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty24"]);
             total25 = total25 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty25"]);
             total26 = total26 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty26"]);
             total27 = total27 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty27"]);
             total28 = total28 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty28"]);       
             total29 = total29 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty29"]);
             total30 = total30 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty30"]);

             total31 = total31 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty31"]);
             total32 = total32 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty32"]);
             total33 = total33 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty33"]);
             total34 = total34 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty34"]);
             total35 = total35 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty35"]);
             total36 = total36 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty36"]);
             total37 = total37 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty37"]);
             total38 = total38 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty38"]);
             total39 = total39 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty39"]);
             total40 = total40 + CommondLib.ConvertToDbl(dt2.Rows[i]["qty40"]);                   
         %>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl74 width=119 style='height:22.5pt;width:89pt'><%=dt2.Rows[i]["grp_nm"]%></td>
  <td class=xl75 width=107 style='width:80pt'><%=dt2.Rows[i]["item_code"]%></td>
  <td class=xl75 width=221 style='width:166pt'><%=dt2.Rows[i]["item_name"]%></td>
  <td class=xl76 width=61 style='width:46pt'><%=dt2.Rows[i]["uom"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty1"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty2"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty3"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty4"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty5"]%>  </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty6"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty7"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty8"]%>  </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty9"]%> </td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty10"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty11"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty12"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty13"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty14"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty15"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty16"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty17"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty18"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty19"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty20"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty21"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty22"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty23"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty24"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty25"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty26"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty27"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty28"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty29"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty30"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty31"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty32"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty33"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty34"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty35"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty36"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty37"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty38"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty39"]%></td>
  <td class=xl77 width=70 style='width:53pt' x:num><%=dt2.Rows[i]["qty40"]%></td>
 </tr>
           <%
          }
 }
      %>
<tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=4 height=30 class=xl86 width=508 style='border-right:.5pt solid black;
  height:22.5pt;width:381pt'>&nbsp;</td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total1%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total2%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total3%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total4%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total5%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total6%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total7%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total8%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total9%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total10%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total11%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total12%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total13%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total14%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total15%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total16%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total17%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total18%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total19%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total20%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total21%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total22%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total23%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total24%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total25%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total26%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total27%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total28%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total29%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total30%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total31%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total32%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total33%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total34%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total35%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total36%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total37%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total38%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total39%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=total40%></td>
 </tr>

 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=4 height=30 class=xl86 width=508 style='border-right:.5pt solid black;
  height:22.5pt;width:381pt'>GRAND TOTAL</td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total1%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total2%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total3%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total4%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total5%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total6%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total7%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total8%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total9%> </td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total10%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total11%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total12%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total13%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total14%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total15%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total16%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total17%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total18%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total19%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total20%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total21%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total22%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total23%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total24%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total25%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total26%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total27%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total28%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total29%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total30%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total31%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total32%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total33%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total34%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total35%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total36%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total37%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total38%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total39%></td>
  <td class=xl78 width=70 style='width:53pt' x:num><%=m_total40%></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=119 style='width:89pt'></td>
  <td width=107 style='width:80pt'></td>
  <td width=221 style='width:166pt'></td>
  <td width=61 style='width:46pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
