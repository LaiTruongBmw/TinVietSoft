<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser("sale");
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string p_from_date = Request.QueryString["p_from_date"];
    string p_to_date = Request.QueryString["p_to_date"];
    string p_wh_pk = Request.QueryString["p_wh_pk"];
    string p_report_type = Request.QueryString["p_report_type"];
    
    string p_wh_01_pk = string.Empty;
    string p_wh_02_pk = string.Empty;
    string p_wh_03_pk = string.Empty;
    string p_wh_04_pk = string.Empty;
    string p_wh_05_pk = string.Empty;
    string p_wh_06_pk = string.Empty;
    string p_wh_07_pk = string.Empty;

    string p_rp_type = Request.QueryString["p_report_type"];
    
    string para = p_wh_pk;
    DataTable dt, dt1;
    dt1 = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00030_sw02", para);
    if (dt1.Rows.Count > 0)
    {
        p_wh_01_pk = dt1.Rows[0][0].ToString();
        p_wh_02_pk = dt1.Rows[0][1].ToString();
        p_wh_03_pk = dt1.Rows[0][2].ToString();
        p_wh_04_pk = dt1.Rows[0][3].ToString();
        p_wh_05_pk = dt1.Rows[0][4].ToString();
        p_wh_06_pk = dt1.Rows[0][5].ToString();
        p_wh_07_pk = dt1.Rows[0][6].ToString();
    }

    para = "'" + p_wh_pk + "','" + p_from_date + "','" + p_to_date + "','" + p_wh_01_pk + 
                   "','" + p_wh_02_pk + "','" + p_wh_03_pk + "','" + p_wh_04_pk + "','" + p_wh_05_pk + 
                   "','" + p_wh_06_pk + "','" + p_wh_07_pk + "'";
    
    if (p_report_type == "3") // kg
    {
        dt = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00030_sw01", para);
    }
    else
    {
        dt = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00030_sw03", para);
    }
    

%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="abc__files/filelist.xml">
<link rel=Edit-Time-Data href="abc__files/editdata.mso">
<link rel=OLE-Object-Data href="abc__files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>SZ-MEO</o:Author>
  <o:LastAuthor>Mr Khanh</o:LastAuthor>
  <o:LastPrinted>2012-06-14T07:42:25Z</o:LastPrinted>
  <o:Created>2009-12-07T11:52:30Z</o:Created>
  <o:LastSaved>2012-06-14T07:42:35Z</o:LastSaved>
  <o:Company>Terry Gallery</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.47in .1in .45in .1in;
	mso-header-margin:.3in;
	mso-footer-margin:.3in;}
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"\B9D1\C740 \ACE0\B515", monospace;
	mso-font-charset:129;
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
	font-family:\B3CB\C6C0, monospace;
	mso-font-charset:129;
	border:none;
	mso-protection:locked visible;
	mso-style-name:"\D45C\C900 3";}
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
	font-family:"\B9D1\C740 \ACE0\B515", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl25
	{mso-style-parent:style21;
	color:windowtext;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:bottom;}
.xl26
	{mso-style-parent:style21;
	color:windowtext;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:bottom;}
.xl27
	{mso-style-parent:style21;
	color:windowtext;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl28
	{mso-style-parent:style21;
	color:windowtext;
	font-size:7.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:bottom;}
.xl29
	{mso-style-parent:style21;
	color:windowtext;
	font-size:7.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl30
	{mso-style-parent:style21;
	color:windowtext;
	font-size:7.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl31
	{mso-style-parent:style21;
	color:windowtext;
	font-size:10.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;}
.xl32
	{mso-style-parent:style21;
	color:windowtext;
	font-size:10.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl33
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl34
	{mso-style-parent:style21;
	color:windowtext;
	font-size:7.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:bottom;
	white-space:normal;}
.xl35
	{mso-style-parent:style21;
	color:windowtext;
	font-size:7.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	white-space:normal;}
.xl36
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl37
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl38
	{mso-style-parent:style21;
	color:#003366;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl39
	{mso-style-parent:style21;
	color:red;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl40
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl41
	{mso-style-parent:style21;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#969696;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl42
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	background:#969696;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl43
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	background:#969696;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl44
	{mso-style-parent:style21;
	color:windowtext;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl45
	{mso-style-parent:style21;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl46
	{mso-style-parent:style21;
	color:windowtext;
	font-size:9.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl47
	{mso-style-parent:style21;
	color:windowtext;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl48
	{mso-style-parent:style21;
	color:windowtext;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl49
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#969696;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl50
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	background:#969696;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl51
	{mso-style-parent:style21;
	color:windowtext;
	font-size:9.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl52
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl53
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl54
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl55
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl56
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl57
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl58
	{mso-style-parent:style21;
	color:windowtext;
	font-size:9.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl59
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl60
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl61
	{mso-style-parent:style21;
	color:windowtext;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>&#54408;&#47785;&#48324;&#47732;&#49324;&#51068;&#44036;&#51116;&#44256;</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>540</x:DefaultRowHeight>
     <x:Unsynced/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>75</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>203</x:VerticalResolution>
     </x:Print>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>5</x:SplitHorizontal>
     <x:TopRowBottomPane>5</x:TopRowBottomPane>
     <x:SplitVertical>3</x:SplitVertical>
     <x:LeftColumnRightPane>3</x:LeftColumnRightPane>
     <x:ActivePane>0</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>1</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>0</x:Number>
       <x:ActiveRow>10</x:ActiveRow>
       <x:ActiveCol>14</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>9840</x:WindowHeight>
  <x:WindowWidth>15480</x:WindowWidth>
  <x:WindowTopX>-1725</x:WindowTopX>
  <x:WindowTopY>-225</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=&#54408;&#47785;&#48324;&#47732;&#49324;&#51068;&#44036;&#51116;&#44256;!$A:$O,&#54408;&#47785;&#48324;&#47732;&#49324;&#51068;&#44036;&#51116;&#44256;!$1:$4</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1025"/>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl25>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1115 style='border-collapse:
 collapse;table-layout:fixed;width:839pt'>
 <col class=xl26 width=77 style='mso-width-source:userset;mso-width-alt:2464;
 width:58pt'>
 <col class=xl25 width=70 span=2 style='mso-width-source:userset;mso-width-alt:
 2240;width:53pt'>
 <col class=xl25 width=60 span=2 style='mso-width-source:userset;mso-width-alt:
 1920;width:45pt'>
 <col class=xl25 width=22 style='mso-width-source:userset;mso-width-alt:704;
 width:17pt'>
 <col class=xl25 width=60 span=6 style='mso-width-source:userset;mso-width-alt:
 1920;width:45pt'>
 <col class=xl25 width=63 style='mso-width-source:userset;mso-width-alt:2016;
 width:47pt'>
 <col class=xl25 width=70 span=2 style='mso-width-source:userset;mso-width-alt:
 2240;width:53pt'>
 <col class=xl25 width=121 style='mso-width-source:userset;mso-width-alt:3872;
 width:91pt'>
 <col class=xl25 width=72 style='width:54pt'>
 <tr height=66 style='mso-height-source:userset;height:49.5pt'>
  <td colspan=15 height=66 class=xl44 width=960 style='height:49.5pt;
  width:722pt'>SONGWOL VINA YARN INVENTORY SHEET<span style='mso-spacerun:yes'></span></td>
  <td class=xl27 width=121 style='width:91pt'></td>
  <td class=xl25 width=72 style='width:54pt'></td>
 </tr>
 <tr class=xl28 height=36 style='mso-height-source:userset;height:27.0pt'>
  <td height=36 class=xl45 style='height:27.0pt'><%= DateTime.Now.ToString("F") %><span
  style='mso-spacerun:yes'></span></td>
  <td class=xl29>&nbsp;</td>
  <td colspan=10 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl31></td>
  <td class=xl32></td>
  <td class=xl30></td>
  <td class=xl28></td>
 </tr>
 <tr class=xl28 height=36 style='mso-height-source:userset;height:27.0pt'>
  <td rowspan=3 height=99 class=xl51 style='height:74.25pt;border-top:none'>YARN</td>
  <td colspan=2 class=xl52  style='border-left:none'>ORIGIN</td>
  <td colspan=10 class=xl53 style='border-left:none'>IN PUT/ OUT PUT OF YARN</td>
  <td colspan=2 class=xl52 style='border-left:none'>TOTAL STOCK (C/T)</td>
  <td class=xl30></td>
  <td class=xl28></td>
 </tr>
 <tr class=xl28 height=34 style='mso-height-source:userset;height:25.5pt'>
  <td rowspan=2 height=63 class=xl54 style='height:47.25pt'>COUNTRY</td>
  <td rowspan=2 class=xl54 style='border-bottom:.5pt solid black;border-top:
  none'>BRAND</td>
  <td rowspan=2 class=xl55 width=60 style='border-bottom:.5pt solid black;
  border-top:none;width:45pt'>PREV <br>
    STOCK</td>
  <td colspan=2 rowspan=2 class=xl56 style='border-bottom:.5pt solid black'>IN
  PUT</td>
  <td colspan=7 class=xl57 style='border-left:none'>OUT PUT</td>
  <td rowspan=2 class=xl55 width=70 style='border-bottom:.5pt solid black;
  border-top:none;width:53pt'>TOTAL<br>
    BY ITEM</td>
  <td rowspan=2 class=xl54 style='border-bottom:.5pt solid black;border-top:
  none;border-left:.5pt solid windowtext'>TOTAL</td>
  <td class=xl30 style="border-left:.5pt solid windowtext"></td>
  <td class=xl28></td>
 </tr>
  <% 
     string[] wh = new string[7];
     for (int i = 0; i < 7; i++)
     {
         wh[i] = dt1.Rows[0][7 + i].ToString();
     } 
 %>
 <tr class=xl28 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl61 style='height:21.75pt;border-left:none'><%= wh[0] %></td>
  <td class=xl61 style='border-left:none'><%= wh[1] %></td>
  <td class=xl61 style='border-left:none'><%= wh[2] %></td>
  <td class=xl59 style='border-left:none'><%= wh[3] %></td>
  <td class=xl61 style='border-left:none'><%= wh[4] %></td>
  <td class=xl61 style='border-left:none'><%= wh[5] %></td>
  <td class=xl61 style='border-left:none'><%= wh[6] %></td>
  <td class=xl30 style="border-left:.5pt solid windowtext"></td>
  <td class=xl28></td>
 </tr>
 <%
     int arr_count;
     int[] arrYarn_count = new int[dt.Rows.Count];
     
     double total_by_yarn = 0;
     double[] arrTotal = new double[dt.Rows.Count];
     
     int a = 0;
     int strYarn_count = 1;
     
     string pro = string.Empty;
     string item_group = string.Empty;
     
     for (int y = 0; y < dt.Rows.Count; y++)
     { 
         if (string.IsNullOrEmpty(pro))
         {
             pro = dt.Rows[y]["yarn"].ToString();
             item_group = dt.Rows[y]["item_group"].ToString();
             strYarn_count = 1;
             total_by_yarn = Convert.ToDouble(dt.Rows[y]["total_by_item"]);
         }
         else
         {
             if (dt.Rows[y]["yarn"].ToString().Trim() != pro.Trim() || dt.Rows[y]["item_group"].ToString().Trim() != item_group.Trim())
             {
                 arrYarn_count[a] = strYarn_count;
                 strYarn_count = 1;

                 arrTotal[a] = total_by_yarn;
                 total_by_yarn = Convert.ToDouble(dt.Rows[y]["total_by_item"]);
                 
                 a++;
                 pro = dt.Rows[y]["yarn"].ToString();
                 item_group = dt.Rows[y]["item_group"].ToString();
             }
             else
             {
                 total_by_yarn += Convert.ToDouble(dt.Rows[y]["total_by_item"]);
                 strYarn_count++;
             }
         }
     }
     arrYarn_count[a] = strYarn_count;
     arrTotal[a] = total_by_yarn;
     a = 0;
     pro = string.Empty;
     item_group = string.Empty; 
     string item_grp = string.Empty;
     //-------SUB TOTAL----
     double pre_stock = 0;
     double input_01 = 0;
     double input_02 = 0;
     double out_01 = 0;
     double out_02 = 0;
     double out_03 = 0;
     double out_04 = 0;
     double out_05 = 0;
     double out_06 = 0;
     double out_07 = 0;
     
     double total_by_item = 0;
     double total = 0;
     
     for (int z = 0; z < dt.Rows.Count; z++)
     {
         if (!item_grp.Equals(dt.Rows[z]["item_group"]) && z != 0)
         {
             %>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
  <td height=36 class=xl41 width=77 style='height:27.0pt;width:58pt'>&nbsp;</td>
  <td colspan=2 class=xl49 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
  <td class=xl42 x:num><%= pre_stock%></td>
  <td colspan="2" class=xl42 x:num><%= input_01%></td>
  <td class=xl42 x:num><%= out_01%></td>
  <td class=xl42 x:num><%= out_02%></td>
  <td class=xl42 x:num><%= out_03%></td>
  <td class=xl42 x:num><%= out_04%></td>
  <td class=xl42 x:num><%= out_05%></td>
  <td class=xl42 x:num><%= out_06%></td>
  <td class=xl42 x:num><%= out_07%></td>
  <td class=xl42 x:num><%= total_by_item%></td>
  <td class=xl43 x:num><%= total_by_item%></td>
  <td class=xl27></td>
  <td class=xl25></td>  
 </tr>
          <%
     }
         if (!item_grp.Equals(dt.Rows[z]["item_group"]))
         {
 %>             
 <tr class=xl34 height=36 style='mso-height-source:userset;height:27.0pt'>
  <td colspan=15 height=36 class=xl47 style='border-right:.5pt solid black;
  height:27.0pt'><%= dt.Rows[z]["item_group"]%></td>
  <td class=xl35></td>
  <td class=xl34></td>
 </tr>
 <%pre_stock = 0;
   input_01 = 0;
   out_01 = 0;
   out_02 = 0;
   out_03 = 0;
   out_04 = 0;
   out_05 = 0;
   out_06 = 0;
   out_07 = 0;
   total_by_item = 0;
         }   
 %>

 <tr class=xl34 height=36 style='mso-height-source:userset;height:27.0pt'>
            <%
                if (pro != dt.Rows[z]["yarn"].ToString() || !item_grp.Equals(dt.Rows[z]["item_group"]))
                {
            %>
                <td rowspan="<%=arrYarn_count[a]%>" height=36 class=xl36 style='height:27.0pt'><%= dt.Rows[z]["yarn"]%></td>
            <% 
                }
            %> 
  <td class=xl33><%= dt.Rows[z]["country"]%></td>
  <td class=xl33><%= dt.Rows[z]["brand"]%></td>
  <td class=xl37 x:num><%= dt.Rows[z]["pre_stock"]%></td>
  <td colspan="2" class=xl38 x:num><%= dt.Rows[z]["input_qty"]%></td>
  <td class=xl38 x:num><%= dt.Rows[z]["out_qty_01"]%></td>
  <td class=xl38 x:num><%= dt.Rows[z]["out_qty_02"]%></td>
  <td class=xl38 x:num><%= dt.Rows[z]["out_qty_03"]%></td>
  <td class=xl38 x:num><%= dt.Rows[z]["out_qty_04"]%></td>
  <td class=xl39 x:num><%= dt.Rows[z]["out_qty_05"]%></td>
  <td class=xl39 x:num><%= dt.Rows[z]["out_qty_06"]%></td>
  <td class=xl39 x:num><%= dt.Rows[z]["out_qty_07"]%></td>
  <td class=xl37 x:num><font
  color="#FF0000" style='mso-ignore:color'><%= dt.Rows[z]["total_by_item"]%></font></td>
     <%
       if (pro != dt.Rows[z]["yarn"].ToString() || !item_grp.Equals(dt.Rows[z]["item_group"]))
       {
   %>
          <td rowspan="<%=arrYarn_count[a]%>" class=xl40 x:num><font color="#FF0000"
          style='mso-ignore:color'><%= arrTotal[a]%></font></td>
   <% 
       pro = dt.Rows[z]["yarn"].ToString();
       item_grp = dt.Rows[z]["item_group"].ToString();
       a++;
       }%> 
  <td class=xl35 style="border-left:.5pt solid black"></td>
  <td class=xl34></td>
 </tr>
  <% 
     pre_stock += Convert.ToDouble(dt.Rows[z]["pre_stock"]);
     input_01 += Convert.ToDouble(dt.Rows[z]["input_qty"]);
     out_01 += Convert.ToDouble(dt.Rows[z]["out_qty_01"]);
     out_02 += Convert.ToDouble(dt.Rows[z]["out_qty_02"]);
     out_03 += Convert.ToDouble(dt.Rows[z]["out_qty_03"]);
     out_04 += Convert.ToDouble(dt.Rows[z]["out_qty_04"]);
     out_05 += Convert.ToDouble(dt.Rows[z]["out_qty_05"]);
     out_06 += Convert.ToDouble(dt.Rows[z]["out_qty_06"]);
     out_07 += Convert.ToDouble(dt.Rows[z]["out_qty_07"]);
     total_by_item += Convert.ToDouble(dt.Rows[z]["total_by_item"]);
 } // end for loop
 %>
<tr height=36 style='mso-height-source:userset;height:27.0pt'>
  <td height=36 class=xl41 width=77 style='height:27.0pt;width:58pt'>&nbsp;</td>
  <td colspan=2 class=xl49 style='border-right:.5pt solid black;border-left:
  none'>&nbsp;</td>
  <td class=xl42 x:num><%= pre_stock %></td>
  <td colspan="2" class=xl42 x:num><%= input_01 %></td>
  <td class=xl42 x:num><%= out_01 %></td>
  <td class=xl42 x:num><%= out_02 %></td>
  <td class=xl42 x:num><%= out_03 %></td>
  <td class=xl42 x:num><%= out_04 %></td>
  <td class=xl42 x:num><%= out_05 %></td>
  <td class=xl42 x:num><%= out_06 %></td>
  <td class=xl42 x:num><%= out_07 %></td>
  <td class=xl42 x:num><%= total_by_item %></td>
  <td class=xl43 x:num><%= total_by_item%></td>
  <td class=xl27></td>
  <td class=xl25></td>  
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=77 style='width:58pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=63 style='width:47pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=121 style='width:91pt'></td>
  <td width=72 style='width:54pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
