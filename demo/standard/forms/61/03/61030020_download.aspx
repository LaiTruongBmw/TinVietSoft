<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  ESysLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
    string p_Project_Pk = Request["Project_Pk"];
    string SQL
    = "SELECT decode(A.UNDERTAKELEVEL, 1, 'Level 1', 2, 'Level 2', 3, 'Level 3', 4, 'Level 4', 5, 'Level 5', 6, 'Level 6', 7, 'Level 7', 8, 'Level 8', 9, 'Level 9', 10, 'Level 10'),  " +
        "a.undertakelevelcode, a.undertakelevelname " +
        "  FROM tecps_undertakelevelcode a " +
        " WHERE a.del_if = 0 AND a.TECPS_PROJECTSUMM_PK = '" + p_Project_Pk + "' AND a.LEAF_YN = 'T'  ORDER BY substr(a.undertakelevelcode,0,1)";

    DataTable dt = ESysLib.TableReadOpen(SQL);
 %>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="kpbp00080_download_files/filelist.xml">
<link rel=Edit-Time-Data href="kpbp00080_download_files/editdata.mso">
<link rel=OLE-Object-Data href="kpbp00080_download_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>LONG</o:Author>
  <o:LastAuthor>KENZIE</o:LastAuthor>
  <o:LastPrinted>2011-01-12T04:17:29Z</o:LastPrinted>
  <o:Created>2011-01-12T03:58:08Z</o:Created>
  <o:LastSaved>2011-07-13T06:16:25Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.98in .75in .98in .75in;
	mso-header-margin:.51in;
	mso-footer-margin:.51in;
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
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#00CCFF;
	mso-pattern:auto none;}
.xl25
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	background:#00CCFF;
	mso-pattern:auto none;}
.xl26
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#00CCFF;
	mso-pattern:auto none;}
.xl27
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl28
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl29
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl30
	{mso-style-parent:style0;
	mso-number-format:"\#\,\#\#0\.00_\)\;\[Red\]\\\(\#\,\#\#0\.00\\\)";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
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
      <x:Scale>39</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:DoNotDisplayGridlines/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>1</x:SplitHorizontal>
     <x:TopRowBottomPane>1</x:TopRowBottomPane>
     <x:ActivePane>2</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
       <x:ActiveRow>0</x:ActiveRow>
       <x:ActiveCol>7</x:ActiveCol>
       <x:RangeSelection>$H:$H</x:RangeSelection>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>6360</x:WindowHeight>
  <x:WindowWidth>11880</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>1485</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=2444 style='border-collapse:
 collapse;table-layout:fixed;width:1837pt'>
 <col width=64 span=2 style='width:48pt'>
 <col width=110 span=2 style='mso-width-source:userset;mso-width-alt:4022;
 width:83pt'>
 <col width=134 style='mso-width-source:userset;mso-width-alt:4900;width:101pt'>
 <col width=127 style='mso-width-source:userset;mso-width-alt:4644;width:95pt'>
 <col width=64 style='width:48pt'>
 <col width=250 style='mso-width-source:userset;mso-width-alt:9142;width:188pt'>
 <col width=108 style='mso-width-source:userset;mso-width-alt:3949;width:81pt'>
 <col width=135 style='mso-width-source:userset;mso-width-alt:4937;width:101pt'>
 <col width=118 style='mso-width-source:userset;mso-width-alt:4315;width:89pt'>
 <col width=145 span=8 style='mso-width-source:userset;mso-width-alt:5302;
 width:109pt'>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl24 width=64 style='height:15.0pt;width:48pt'>Seq. No.</td>
  <td class=xl25 width=64 style='width:48pt'>Level</td>
  <td class=xl25 width=110 style='width:83pt'>Level Code</td>
  <td class=xl25 width=110 style='width:83pt'>Details Seq. No.</td>
  <td class=xl25 width=134 style='width:101pt'>Contract Details No.</td>
  <td class=xl25 width=127 style='width:95pt'>Details Description</td>
  <td class=xl25 width=64 style='width:48pt'>Currency</td>
  <td class=xl25 width=250 style='width:188pt'>Name</td>
  <td class=xl25 width=108 style='width:81pt'>Standard</td>
  <td class=xl25 width=135 style='width:101pt'>Unit</td>
  <td class=xl26 width=118 style='width:89pt'>Contract Quantity</td>
  <td class=xl26 width=145 style='width:109pt'>Raw Mtrl. Cost U/P</td>
  <td class=xl26 width=145 style='width:109pt'>Raw Mtrl. Cost Amt</td>
  <td class=xl26 width=145 style='width:109pt'>Labor Cost U/P</td>
  <td class=xl26 width=145 style='width:109pt'>Labor Cost Amt</td>
  <td class=xl26 width=145 style='width:109pt'>Exp. U/P</td>
  <td class=xl26 width=145 style='width:109pt'>Exp. Amt</td>
  <td class=xl25 width=145 style='width:109pt'>Unit Price</td>
  <td class=xl25 width=145 style='width:109pt'>Contract Amt</td>
 </tr>
 <%
     int i = 0;
     for (i = 0; i < dt.Rows.Count; i++)
     {
         
      %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl27 style='height:12.75pt'>&nbsp;</td>
  <td class=xl28><%=dt.Rows[i][0]%></td>
  <td class=xl28><%=dt.Rows[i][1]%></td>
  <td class=xl28>&nbsp;</td>
  <td class=xl28>&nbsp;</td>
  <td class=xl28>&nbsp;</td>
  <td class=xl28>&nbsp;</td>
  <td class=xl29 width=250 style='width:188pt'><%=dt.Rows[i][2]%></td>
  <td class=xl29 width=108 style='width:81pt'>&nbsp;</td>
  <td class=xl29 width=135 style='width:101pt'>&nbsp;</td>
  <td class=xl30>&nbsp;</td>
  <td class=xl30>&nbsp;</td>
  <td class=xl30>&nbsp;</td>
  <td class=xl30>&nbsp;</td>
  <td class=xl30>&nbsp;</td>
  <td class=xl30>&nbsp;</td>
  <td class=xl30>&nbsp;</td>
  <td class=xl30>&nbsp;</td>
  <td class=xl30>&nbsp;</td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=110 style='width:83pt'></td>
  <td width=110 style='width:83pt'></td>
  <td width=134 style='width:101pt'></td>
  <td width=127 style='width:95pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=250 style='width:188pt'></td>
  <td width=108 style='width:81pt'></td>
  <td width=135 style='width:101pt'></td>
  <td width=118 style='width:89pt'></td>
  <td width=145 style='width:109pt'></td>
  <td width=145 style='width:109pt'></td>
  <td width=145 style='width:109pt'></td>
  <td width=145 style='width:109pt'></td>
  <td width=145 style='width:109pt'></td>
  <td width=145 style='width:109pt'></td>
  <td width=145 style='width:109pt'></td>
  <td width=145 style='width:109pt'></td>
 </tr>
 <![endif]><%} %>
</table>

</body>

</html>
