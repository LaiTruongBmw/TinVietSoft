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
    
    string v_date = DateTime.Now.ToString("yyyymmdd");    
    
    string p_from_date  = Request.QueryString["p_from_date"];
    string p_to_date    = Request.QueryString["p_to_date"];
	string p_wh_type    = Request.QueryString["p_wh_type"];
    string p_wh         = Request.QueryString["p_wh"];
    string p_use_yn     = Request.QueryString["p_use_yn"];
    string p_item       = Request.QueryString["p_item"];
    string para = "'" + p_from_date + "','" + p_to_date + "','" + p_wh_type + "','" + p_wh + "','" + p_use_yn + "','" + p_item + "'";  
    DataTable dt,dt1;
    dt = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00022_1", "'" + Session["User_ID"].ToString() + "'");
    if (dt == null || dt.Rows.Count == 0)
    {
        dt.Columns.Add();
        dt.Rows.Add();
    }
    dt1 = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00022", para);
     
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
<link rel=File-List href="bbbb_files/filelist.xml">
<link rel=Edit-Time-Data href="bbbb_files/editdata.mso">
<link rel=OLE-Object-Data href="bbbb_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>DATAVINA</o:LastAuthor>
  <o:LastPrinted>2012-03-01T08:03:08Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2013-03-12T02:39:19Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"&CPage &P of &N";
	margin:.1in .25in .3in .25in;
	mso-header-margin:0in;
	mso-footer-margin:.11in;
	mso-page-orientation:landscape;}
.font6
	{color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font7
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font9
	{color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font10
	{color:windowtext;
	font-size:8.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font12
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font14
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.font15
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
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
.style21
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
.xl25
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl29
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;}
.xl30
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	vertical-align:middle;}
.xl32
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl33
	{mso-style-parent:style21;
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
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:auto none;
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
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl41
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl42
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl43
	{mso-style-parent:style0;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl44
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	white-space:normal;}
.xl45
	{mso-style-parent:style21;
	color:black;
	font-size:8.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl46
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
.xl47
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl48
	{mso-style-parent:style21;
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
.xl49
	{mso-style-parent:style21;
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
.xl50
	{mso-style-parent:style21;
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
.xl51
	{mso-style-parent:style21;
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
.xl52
	{mso-style-parent:style21;
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
.xl53
	{mso-style-parent:style21;
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
.xl54
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl55
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl56
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl57
	{mso-style-parent:style0;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
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
      <x:Scale>98</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>16</x:ActiveRow>
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
  <x:WindowHeight>9360</x:WindowHeight>
  <x:WindowWidth>15360</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>255</x:WindowTopY>
  <x:AcceptLabelsInFormulas/>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$7:$7</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1026"/>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl25>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1101 style='border-collapse:
 collapse;table-layout:fixed;width:826pt'>
 <col class=xl25 width=70 style='mso-width-source:userset;mso-width-alt:2560;
 width:53pt'>
 <col class=xl25 width=55 style='mso-width-source:userset;mso-width-alt:2011;
 width:41pt'>
 <col class=xl25 width=75 style='mso-width-source:userset;mso-width-alt:2742;
 width:56pt'>
 <col class=xl25 width=176 style='mso-width-source:userset;mso-width-alt:6436;
 width:132pt'>
 <col class=xl25 width=64 span=2 style='width:48pt'>
 <col class=xl25 width=70 style='mso-width-source:userset;mso-width-alt:2560;
 width:53pt'>
 <col class=xl25 width=91 style='mso-width-source:userset;mso-width-alt:3328;
 width:68pt'>
 <col class=xl25 width=75 style='mso-width-source:userset;mso-width-alt:2742;
 width:56pt'>
 <col class=xl25 width=102 style='mso-width-source:userset;mso-width-alt:3730;
 width:77pt'>
 <col class=xl25 width=75 style='mso-width-source:userset;mso-width-alt:2742;
 width:56pt'>
 <col class=xl25 width=97 style='mso-width-source:userset;mso-width-alt:3547;
 width:73pt'>
 <col class=xl25 width=87 style='mso-width-source:userset;mso-width-alt:3181;
 width:65pt'>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl26 width=70 style='height:15.0pt;width:53pt'><v:shape id="_x0000_s1025" type="#_x0000_t75" style='position:absolute;
   margin-left:1.5pt;margin-top:1.5pt;width:75pt;height:42pt;z-index:1'>
   <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt.Rows[0]["tco_bpphoto_pk"]%>&table_name=<%=Session["APP_DBUSER"].ToString()%>.tco_bpphoto" o:title="logo"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape></td>
  <td class=xl25 width=55 style='width:41pt'></td>
  <td class=xl27 colspan=3 width=315 style='mso-ignore:colspan;width:236pt'><%= dt.Rows[0]["partner_name"]%></td>
  <td class=xl27 width=64 style='width:48pt'></td>
  <td class=xl26 width=70 style='width:53pt'></td>
  <td class=xl25 width=91 style='width:68pt'></td>
  <td colspan=5 class=xl44 width=436 style='width:327pt'>Tel: <%= dt.Rows[0]["phone_no"]%></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl26 style='height:15.0pt'></td>
  <td class=xl25></td>
  <td class=xl26 colspan=2 style='mso-ignore:colspan'><%= dt.Rows[0]["addr1"]%></td>
  <td colspan=3 class=xl26 style='mso-ignore:colspan'></td>
  <td class=xl25></td>
  <td colspan=5 class=xl44 width=436 style='width:327pt'>Fax: <%= dt.Rows[0]["fax_no"]%></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl28 style='height:15.0pt'>&nbsp;</td>
  <td class=xl25></td>
  <td class=xl28 colspan=2 style='mso-ignore:colspan'>Tax code: <%= dt.Rows[0]["tax_code"]%></td>
  <td class=xl28>&nbsp;</td>
  <td class=xl28>&nbsp;</td>
  <td class=xl28>&nbsp;</td>
  <td class=xl25></td>
  <td colspan=5 class=xl45 width=436 style='width:327pt'>Print date :
  <%= DateTime.Now.ToString("dd/MM/yyyy HH:mm") %></td>
 </tr>
 <tr height=64 style='mso-height-source:userset;height:48.0pt'>
  <td colspan=13 height=64 class=xl46 width=1101 style='height:48.0pt;
  width:826pt'>BÁO CÁO CHI TIẾT NHẬP-XUẤT-TỒN<br>
    <font class="font9">(INPUT- OUTPUT- IN STOCK DETAIL REPORT)</font></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl29 colspan=4 style='height:15.0pt;mso-ignore:colspan'>Tên
  hàng/<font class="font10">Item Desc:</font><font class="font6"><%= dt1.Rows[0]["item_name"]%></font></td>
  <td colspan=5 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31>Kho<font class="font12">/</font><font class="font10">W/H :</font></td>
  <td colspan=3 class=xl30 width=259 style='width:194pt'><%= dt1.Rows[0]["wh_name"]%></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl29 colspan=3 style='height:15.0pt;mso-ignore:colspan'>Mã
  hàng/<font class="font10">Item Code:</font><font class="font6"> <%= dt1.Rows[0]["item_code"]%></font></td>
  <td colspan=6 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl32>Ngày<font class="font12">/</font><font class="font10">Date</font></td>
  <td colspan=3 class=xl47 width=259 style='width:194pt'><%= dt1.Rows[0]["period"]%></td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=2 height=22 class=xl48 width=125 style='border-right:.5pt solid black;
  height:16.5pt;width:94pt'>Chứng từ/<font class="font7">Voucher</font></td>
  <td rowspan=2 class=xl50 width=75 style='border-bottom:.5pt solid black;
  width:56pt'>Số hóa đơn<br>
    <font class="font7">Invoice No</font></td>
  <td rowspan=2 class=xl50 width=176 style='border-bottom:.5pt solid black;
  width:132pt'>Diễn giải/<font class="font7"> Description</font></td>
  <td rowspan=2 class=xl50 width=64 style='border-bottom:.5pt solid black;
  width:48pt'>Giá Đơn Vị<font class="font14"><br>
    </font><font class="font7">Unit Price</font></td>
  <td rowspan=2 class=xl50 width=64 style='border-bottom:.5pt solid black;
  width:48pt'>Đơn Vị<font class="font14"><br>
    </font><font class="font7">UOM</font></td>
  <td colspan=2 class=xl48 width=161 style='border-right:.5pt solid black;
  border-left:none;width:121pt'>Nhập/<font class="font7">In</font></td>
  <td colspan=2 class=xl53 width=177 style='border-right:.5pt solid black;
  border-left:none;width:133pt'>Xuất/<font class="font7">Out</font></td>
  <td colspan=2 class=xl53 width=172 style='border-right:.5pt solid black;
  border-left:none;width:129pt'>Tồn/<font class="font7">In Stock</font></td>
  <td rowspan=2 class=xl50 width=87 style='border-bottom:.5pt solid black;
  border-top:none;width:65pt'>Ghi chú<br>
    <font class="font7">Remark</font></td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:23.1pt'>
  <td height=30 class=xl33 width=70 style='height:23.1pt;width:53pt'>Số
  hiệu<br>
    <font class="font7">No.</font></td>
  <td class=xl33 width=55 style='width:41pt'>Ngày<br>
    <font class="font7">Date</font></td>
  <td class=xl33 width=70 style='width:53pt'>Số lượng<br>
    <font class="font7">Quantity</font></td>
  <td class=xl33 width=91 style='width:68pt'>Thành tiền<br>
    <font class="font14">Amount</font></td>
  <td class=xl33 width=75 style='width:56pt'>Số lượng<br>
    <font class="font7">Quantity</font></td>
  <td class=xl33 width=102 style='width:77pt'>Thành tiền<br>
    <font class="font14">Amount</font></td>
  <td class=xl33 width=75 style='width:56pt'>Số lượng<br>
    <font class="font7">Quantity</font></td>
  <td class=xl33 width=97 style='width:73pt'>Thành tiền<br>
    <font class="font14">Amount</font></td>
 </tr>
  <% 
      int l_row = 8;
      for (int i = 0; i < dt1.Rows.Count; i++)
      {
          l_row++;
          if (i == 0)
          {
  %>
 <tr height=30 style='mso-height-source:userset;height:23.1pt'>
  <td height=30 class=xl34 width=70 style='height:23.1pt;width:53pt'><%= dt1.Rows[i]["slip_no"]%></td>
  <td class=xl34 width=55 style='width:41pt'><%= dt1.Rows[i]["tr_date"]%></td>
  <td class=xl34 width=75 style='width:56pt'>&nbsp;</td>
  <td class=xl34 width=176 style='width:132pt'><%= dt1.Rows[i]["line_name"]%></td>
  <td class=xl34 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl34 width=64 style='width:48pt'><%= dt1.Rows[i]["in_qty"]%></td>
  <td class=xl34 width=70 style='width:53pt'>&nbsp;</td>
  <td class=xl34 width=91 style='width:68pt'><%= dt1.Rows[i]["out_qty"]%></td>
  <td class=xl34 width=75 style='width:56pt'>&nbsp;</td>
  <td class=xl34 width=102 style='width:77pt'></td>
  <td class=xl34 width=75 style='width:56pt' x:num><%= dt1.Rows[i]["begin_qty"]%><span
  style='mso-spacerun:yes'>                 </span> </td>
  <td class=xl34 width=97 style='width:73pt'>&nbsp;</td>
  <td class=xl34 width=87 style='width:65pt'>&nbsp;</td>
 </tr>
 <%
     }
     else
     {
  %>
 <tr height=30 style='mso-height-source:userset;height:23.1pt'>
  <td height=30 class=xl35 width=70 style='height:23.1pt;width:53pt'><%= dt1.Rows[i]["slip_no"]%></td>
  <td class=xl36 width=55 style='width:41pt'><%= dt1.Rows[i]["tr_date"]%></td>
  <td class=xl37 width=75 style='width:56pt'>&nbsp;</td>
  <td class=xl37 width=176 style='width:132pt'><%= dt1.Rows[i]["description"]%></td>
  <td class=xl38 width=64 style='width:48pt'><%= dt1.Rows[i]["unit_price"]%></td>
  <td class=xl38 width=64 style='width:48pt'><%= dt1.Rows[i]["uom"]%></td>
  <td class=xl39 width=70 style='width:53pt' x:num><span
  style='mso-spacerun:yes'>                   </span><%= dt1.Rows[i]["in_qty"]%> </td>
  <td class=xl40 width=91 style='width:68pt' x:num><span
  style='mso-spacerun:yes'>                        </span><%= dt1.Rows[i]["in_amount"]%><span
  style='mso-spacerun:yes'>   </span></td>
  <td class=xl39 width=75 style='width:56pt' x:num><span
  style='mso-spacerun:yes'>                    </span><%= dt1.Rows[i]["out_qty"]%> </td>
  <td class=xl40 width=102 style='width:77pt'><%= dt1.Rows[i]["out_amount"]%></td>
  <td class=xl39 width=75 style='width:56pt' x:num><span
  style='mso-spacerun:yes'>               </span><%= dt1.Rows[i]["begin_qty"]%> </td>
  <td class=xl40 width=97 style='width:73pt'>&nbsp;</td>
  <td class=xl40 width=87 style='width:65pt'><%= dt1.Rows[i]["line_name"]%></td>
 </tr>
   <% 
          }
    
      }
       %>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=5 height=35 class=xl54 style='border-right:.5pt solid black;
  height:26.25pt'>Cộng cuối kỳ<font class="font12">/</font><font class="font15">Total</font></td>
  <td class=xl42>&nbsp;</td>
  <td class=xl42 width=70 style='width:53pt' x:num  x:fmla="=SUM(G9:G<%=l_row%>)"><span
  style='mso-spacerun:yes'>                 </span>-<span
  style='mso-spacerun:yes'>   </span></td>
  <td class=xl42 width=91 style='width:68pt' x:num x:fmla="=SUM(H9:H<%=l_row%>)"><span
  style='mso-spacerun:yes'>                        </span>-<span
  style='mso-spacerun:yes'>   </span></td>
  <td class=xl42 width=75 style='width:56pt' x:num x:fmla="=SUM(I9:I<%=l_row%>)"><span
  style='mso-spacerun:yes'>              </span> </td>
  <td class=xl42 width=102 style='width:77pt' x:num x:fmla="=SUM(J9:J<%=l_row%>)"><span
  style='mso-spacerun:yes'>                           </span>-<span
  style='mso-spacerun:yes'>   </span></td>
  <td class=xl42 width=75 style='width:56pt'>&nbsp;</td>
  <td class=xl42 width=97 style='width:73pt'>&nbsp;</td>
  <td class=xl42 width=87 style='width:65pt'>&nbsp;</td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=13 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=10 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl56>Ngày<span style='mso-spacerun:yes'>  </span><%= dt1.Rows[0]["cur_date"].ToString().Substring(6,2)%><span
  style='mso-spacerun:yes'>  </span>tháng<span style='mso-spacerun:yes'> 
  </span><%=dt1.Rows[0]["cur_date"].ToString().Substring(4, 2)%> năm <%=dt1.Rows[0]["cur_date"].ToString().Substring(0, 4)%></td>
  <td class=xl25></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl25 style='height:15.0pt'></td>
  <td class=xl43 colspan=2 style='mso-ignore:colspan'>Người ghi sổ</td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl43 colspan=2 style='mso-ignore:colspan'>Kế Toán Trưởng</td>
  <td colspan=2 class=xl25 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl57>Giám đốc</td>
  <td class=xl25></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=13 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=13 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=13 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=13 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=13 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=70 style='width:53pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=176 style='width:132pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=91 style='width:68pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=102 style='width:77pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=97 style='width:73pt'></td>
  <td width=87 style='width:65pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
