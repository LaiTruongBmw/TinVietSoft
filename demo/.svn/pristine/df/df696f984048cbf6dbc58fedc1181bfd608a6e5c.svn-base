<%@ page language="C#" %>

<%@ import namespace="System.Data" %>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%  
    
    string str_sql = @"SELECT partner_name, addr1, phone_no, fax_no, tax_code, tco_bpphoto_pk
                       FROM tco_company
                       WHERE del_if = 0 AND pk = (SELECT MAX (pk)
                                                  FROM tco_company
                                                  WHERE del_if = 0 AND active_yn = 'Y')";
    DataTable dt2 = CtlLib.TableReadOpen(str_sql);		  
    
    string master_pk  = Request.QueryString["master_pk"];
    string para = "'" + master_pk + "','" + Session["User_ID"].ToString() + "'";
    DataTable dt,dt1;
    dt = CtlLib.TableReadOpenCursor("st_lg__rpt_dscd00070_kb_01_1", para);
    dt1 = CtlLib.TableReadOpenCursor("st_lg__rpt_dscd00070_kb_01_2", "'" + master_pk + "'");
     
    if(dt1.Rows.Count ==0)
    {
        Response.Write("There is no data.");
        Response.End();
    }
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="Copy%20of%20GD_PACKING_LIST_1_files/filelist.xml">
<link rel=Edit-Time-Data href="Copy%20of%20GD_PACKING_LIST_1_files/editdata.mso">
<link rel=OLE-Object-Data href="Copy%20of%20GD_PACKING_LIST_1_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>tuyen</o:LastAuthor>
  <o:LastPrinted>2013-01-28T01:43:13Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2013-01-28T01:43:20Z</o:LastSaved>
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
	mso-header-margin:.17in;
	mso-footer-margin:.23in;}
.font8
	{color:windowtext;
	font-size:14.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font12
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font13
	{color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font14
	{color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font15
	{color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
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
.xl65
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl66
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl67
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl68
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl69
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	font-weight:700;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:2.0pt double windowtext;}
.xl71
	{mso-style-parent:style0;
	font-weight:700;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:2.0pt double windowtext;}
.xl72
	{mso-style-parent:style0;
	font-weight:700;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:2.0pt double windowtext;}
.xl73
	{mso-style-parent:style0;
	font-weight:700;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:2.0pt double windowtext;}
.xl74
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:2.0pt double windowtext;}
.xl75
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:2.0pt double windowtext;}
.xl76
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:2.0pt double windowtext;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl80
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:none;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	font-size:12.0pt;
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
.xl83
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl84
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
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
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl87
	{mso-style-parent:style0;
	font-size:12.0pt;
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
.xl88
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl92
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:2.0pt double windowtext;
	border-right:2.0pt double windowtext;
	border-bottom:none;
	border-left:none;}
.xl93
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl94
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:2.0pt double windowtext;
	border-bottom:none;
	border-left:none;}
.xl95
	{mso-style-parent:style0;
	font-weight:700;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl96
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl97
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	font-size:12.0pt;
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
.xl99
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	font-weight:700;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl101
	{mso-style-parent:style0;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	font-weight:700;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:2.0pt double windowtext;
	border-bottom:none;
	border-left:none;}
.xl104
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:2.0pt double windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	font-size:12.0pt;
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
.xl110
	{mso-style-parent:style0;
	font-size:12.0pt;
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
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>16</x:ActiveRow>
       <x:ActiveCol>9</x:ActiveCol>
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
 <o:shapedefaults v:ext="edit" spidmax="3073"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl65>

<table x:str border=0 cellpadding=0 cellspacing=0 width=675 style='border-collapse:
 collapse;table-layout:fixed;width:508pt'>
 <col class=xl65 width=47 style='mso-width-source:userset;mso-width-alt:1718;
 width:35pt'>
 <col class=xl65 width=120 style='mso-width-source:userset;mso-width-alt:4388;
 width:90pt'>
 <col class=xl65 width=82 style='mso-width-source:userset;mso-width-alt:2998;
 width:62pt'>
 <col class=xl65 width=85 style='mso-width-source:userset;mso-width-alt:3108;
 width:64pt'>
 <col class=xl65 width=71 style='mso-width-source:userset;mso-width-alt:2596;
 width:53pt'>
 <col class=xl65 width=90 span=3 style='mso-width-source:userset;mso-width-alt:
 3291;width:68pt'>
 <tr height=77 style='mso-height-source:userset;height:57.75pt'>
  <td colspan=2 rowspan=2 height=97 width=167 style='height:72.75pt;width:125pt'
  align=left valign=top><!--[if gte vml 1]><v:shape id="_x0000_s1025" type="#_x0000_t75" style='position:absolute;
   margin-left:15.5pt;margin-top:1.5pt;width:75pt;height:42pt;z-index:1'>
   <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt2.Rows[0]["tco_bpphoto_pk"]%>&table_name=tco_bpphoto" o:title="logo"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:47px;margin-top:6px;width:72px;
  height:71px'><img width=72 height=71
  src="Copy%20of%20GD_PACKING_LIST_1_files/image002.jpg" alt="logo kyungbang 1"
  v:shapes="Picture_x0020_3"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=2 rowspan=2 height=97 class=xl83 width=167 style='height:72.75pt;
    width:125pt'>KYUNGBANG VIETNAM</td>
   </tr>
  </table>
  </span></td>
  <td colspan=6 class=xl85 width=508 style='width:383pt'>BẢNG KÊ CHI TiẾT<br>
    <font class="font8">( PACKING LIST )</font></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=6 height=20 class=xl86 style='height:15.0pt'><span
  style='mso-spacerun:yes'> </span><font class="font14">Số :</font><font
  class="font13"> </font><font class="font15"><%= dt.Rows[0]["slip_no"]%></font><font
  class="font14"> /</font><font class="font13"> </font><font class="font14">Ngày</font><font
  class="font13"> <%= dt.Rows[0]["out_dd"]%></font><font class="font14"> Tháng </font><font
  class="font13"><%= dt.Rows[0]["out_mm"]%></font><font class="font14"> Năm </font><font class="font13"><%= dt.Rows[0]["out_yy"]%></font></td>
 </tr>
 <tr class=xl66 height=18 style='mso-height-source:userset;height:13.5pt'>
  <td colspan=8 height=18 class=xl95 style='height:13.5pt'>&nbsp;</td>
 </tr>
 <tr class=xl66 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl70 style='height:19.5pt;border-top:none'>Bên Nh<span
  style='display:none'>ận<font class="font12">(Delivery)</font></span></td>
  <td class=xl74 style='border-top:none'>&nbsp;</td>
  <td colspan=6 class=xl91 style='border-right:2.0pt double black'><%= dt.Rows[0]["partner_name"]%></td>
 </tr>
 <tr class=xl66 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl71 style='height:19.5pt'>Địa chỉ<span style='display:
  none'><font class="font12"> (Address)</font></span></td>
  <td class=xl75>&nbsp;</td>
  <td colspan=6 class=xl93 style='border-right:2.0pt double black'><%= dt.Rows[0]["addr1"]%></td>
 </tr>
 <tr class=xl66 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl71 style='height:19.5pt'>MST<font class="font12"> (T</font><span
  style='display:none'><font class="font12">ax code)</font></span></td>
  <td class=xl75>&nbsp;</td>
  <td colspan=6 class=xl93 style='border-right:2.0pt double black'
  x:num><%= dt.Rows[0]["tax_code"]%></td>
 </tr>
 <tr class=xl66 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl71 style='height:19.5pt'>ĐT<font class="font12"> (Tel</font><span
  style='display:none'><font class="font12">)</font></span></td>
  <td class=xl73>&nbsp;</td>
  <td colspan=2 class=xl100><%= dt.Rows[0]["phone_no"]%></td>
  <td class=xl66>Fax</td>
  <td colspan=3 class=xl100 style='border-right:2.0pt double black'><%= dt.Rows[0]["fax_no"]%></td>
 </tr>
 <tr class=xl66 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl72 style='height:19.5pt'>Nơi gia<span style='display:
  none'>o<font class="font12">(Delivery Loc)</font></span></td>
  <td class=xl76 width=120 style='width:90pt'>&nbsp;</td>
  <td colspan=6 class=xl104 width=508 style='border-right:2.0pt double black;
  width:383pt'><%= dt.Rows[0]["loc_addr"]%></td>
 </tr>
 <%
     // merge
     string strLotNo = string.Empty;
     string strItemCode = string.Empty;
     
     int[] arrLotNo_count = new int[dt1.Rows.Count];
     int a = 0;
     int LotNo_count = 1;

     for (int y = 0; y < dt1.Rows.Count; y++)
     {
         if (string.IsNullOrEmpty(strLotNo))
         {
             strLotNo = dt1.Rows[y]["lot_no"].ToString();
             strItemCode = dt1.Rows[y]["item_code"].ToString();
             LotNo_count = 1;
         }
         else
         {
             if (dt1.Rows[y]["lot_no"].ToString().Trim() != strLotNo.Trim() || dt1.Rows[y]["item_code"].ToString().Trim() != strItemCode.Trim())
             {
                 arrLotNo_count[a] = LotNo_count;
                 LotNo_count = 1;
                 a++;
                 strLotNo = dt1.Rows[y]["lot_no"].ToString();
                 strItemCode = dt1.Rows[y]["item_code"].ToString();
             }
             else
             {
                 LotNo_count++;
             }
         }
     }
     arrLotNo_count[a] = LotNo_count;
     a = 0;
     strLotNo = string.Empty;
     strItemCode = string.Empty;
     // end merge
     string s_item_code = string.Empty, s_item_name = string.Empty, item = string.Empty;
     int count  = 1;
     decimal seq = 0, weight = 0, coin = 0;
     for (int i = 0; i < dt1.Rows.Count; i++)
   {
       if (s_item_code == dt1.Rows[i]["item_code"].ToString() || i == 0)
               {
                   seq += Convert.ToDecimal(dt1.Rows[i]["box_seq"]);
                   weight += Convert.ToDecimal(dt1.Rows[i]["weight"]);
                   coin += Convert.ToDecimal(dt1.Rows[i]["coin_num"]);
                   s_item_code = dt1.Rows[i]["item_code"].ToString();
               }
               else
               {
     %>
 <tr class=xl69 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=2 height=25 class=xl87 width=167 style='height:18.75pt;
  width:125pt'>Total</td>
  <td colspan=2 class=xl88 width=167 style='width:126pt' x:num><%= seq %></td>
  <td colspan=2 class=xl89 width=161 style='border-left:none;width:121pt'
  x:num><span
  style='mso-spacerun:yes'>                    </span><%= weight %> </td>
  <td colspan=2 class=xl90 width=180 style='border-left:none;width:136pt'
  x:num><span
  style='mso-spacerun:yes'>                             </span><%= coin %> </td>
 </tr>
 <%
        
                weight = Convert.ToDecimal(dt1.Rows[i]["weight"]);
                coin = Convert.ToDecimal(dt1.Rows[i]["coin_num"]);
                seq = Convert.ToDecimal(dt1.Rows[i]["box_seq"]);
                count = 1;
                s_item_code = dt1.Rows[i]["item_code"].ToString();
              }

       if (item != dt1.Rows[i]["item_code"].ToString())
               {
                   item = dt1.Rows[i]["item_code"].ToString();
              
         %>  
          <tr class=xl69 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=8 height=20 class=xl109 width=675 style='height:15.0pt;
  width:508pt'>&nbsp;</td>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td colspan=2 height=40 class=xl79 style='border-right:.5pt hairline black;
  height:30.0pt' x:str="Item ">Item<span style='mso-spacerun:yes'> </span></td>
  <td colspan=2 class=xl97 width=167 style='border-right:.5pt hairline black;
  border-left:none;width:126pt'><%= dt1.Rows[i]["item_code"] %></td>
  <td colspan=4 class=xl97 width=341 style='border-right:.5pt solid black;
  border-left:none;width:257pt'><%= dt1.Rows[i]["item_nm"] %></td>
 </tr>
 <tr class=xl69 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl77 width=47 style='height:18.75pt;border-top:none;
  width:35pt'>No</td>
  <td class=xl77 width=120 style='border-top:none;border-left:none;width:90pt'>Lot
  No</td>
  <td colspan=2 class=xl77 width=167 style='border-left:none;width:126pt'>Box
  Seq</td>
  <td colspan=2 class=xl77 width=161 style='border-left:none;width:121pt'>Weight
  (KG)</td>
  <td colspan=2 class=xl101 width=180 style='border-left:none;width:136pt'
  x:str="Coin Num"><span style='mso-spacerun:yes'> </span>Coin Num<span
  style='mso-spacerun:yes'> </span></td>
 </tr>
 <%                    
    } %>
 
 <tr class=xl69 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl78 width=47 style='height:18.75pt;border-top:none;
  width:35pt' x:num><%= count++ %></td>
  
   <%
       if (strLotNo != dt1.Rows[i]["lot_no"].ToString() || strItemCode != dt1.Rows[i]["item_code"].ToString())
                {
 %>
  <td rowspan="<%=arrLotNo_count[a]%>" class=xl80 width=120 style='border-bottom:.5pt solid black;
  border-top:none;width:90pt'><%= dt1.Rows[i]["lot_no"] %></td>
  <% 
      strLotNo = dt1.Rows[i]["lot_no"].ToString();
      strItemCode = dt1.Rows[i]["item_code"].ToString();
                    a++;
                }
  %>  
  <td colspan=2 class=xl102 width=167 style='border-left:none;width:126pt' x:num><%= dt1.Rows[i]["box_seq"] %></td>
  <td colspan=2 class=xl106 width=161 style='border-left:none;width:121pt'
  x:num><span style='mso-spacerun:yes'>                     </span><%= dt1.Rows[i]["weight"] %>
  </td>
  <td colspan=2 class=xl107 width=180 style='border-right:.5pt solid black;
  border-left:none;width:136pt' x:num><span
  style='mso-spacerun:yes'>                               </span><%= dt1.Rows[i]["coin_num"] %></td>
 </tr>
   <% 
} %>
  <tr class=xl69 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=2 height=25 class=xl87 width=167 style='height:18.75pt;
  width:125pt'>Total</td>
  <td colspan=2 class=xl88 width=167 style='width:126pt' x:num><%= seq %></td>
  <td colspan=2 class=xl89 width=161 style='border-left:none;width:121pt'
  x:num><span
  style='mso-spacerun:yes'>                    </span><%= weight %> </td>
  <td colspan=2 class=xl90 width=180 style='border-left:none;width:136pt'
  x:num><span
  style='mso-spacerun:yes'>                             </span><%= coin %> </td>
 </tr>
 <tr class=xl69 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=8 height=20 class=xl109 width=675 style='height:15.0pt;
  width:508pt'>&nbsp;</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=8 class=xl65 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=47 style='width:35pt'></td>
  <td width=120 style='width:90pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=85 style='width:64pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=90 style='width:68pt'></td>
  <td width=90 style='width:68pt'></td>
  <td width=90 style='width:68pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
