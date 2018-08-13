<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%    
   
    string p_from_date = Request.QueryString["from_date"];
    string p_to_date = Request.QueryString["to_date"];
    string sql = "select to_char(to_date('" + p_from_date + "','yyyymmdd'),'dd/mm/yyyy'),to_char(to_date('" + p_to_date + "','yyyymmdd'),'dd/mm/yyyy')from dual";
    DataTable dt1 = CtlLib.TableReadOpen(sql);
    DataTable dt = CtlLib.TableReadOpenCursor("SALE.sp_rpt_dsbs00250_1_csz", "'" + p_from_date + "','" + p_to_date + "'");

%>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_dsbs00250_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dsbs00250_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dsbs00250_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Trung</o:LastAuthor>
  <o:LastPrinted>2012-01-11T02:38:06Z</o:LastPrinted>
  <o:LastSaved>2012-01-11T02:38:27Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .35in 1.0in .5in;
	mso-header-margin:.5in;
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
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl25
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl26
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl27
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl28
	{mso-style-parent:style0;
	font-size:11.0pt;
	mso-number-format:"Short Date";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	font-size:11.0pt;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl30
	{mso-style-parent:style0;
	font-size:11.0pt;
	mso-number-format:Standard;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl31
	{mso-style-parent:style0;
	font-size:11.0pt;
	mso-number-format:Standard;
	text-align:right;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl32
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl33
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl34
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	mso-diagonal-down:.5pt solid windowtext;}
.xl35
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	mso-diagonal-down:.5pt solid windowtext;}
.xl36
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl37
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl38
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl39
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl40
	{mso-style-parent:style0;
	border:.5pt solid windowtext;}
.xl41
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl42
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border:.5pt solid windowtext;}
.xl43
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:right;
	border:.5pt solid windowtext;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>rpt_dsbs00250</x:Name>
    <x:WorksheetOptions>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>66</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:DoNotDisplayGridlines/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>14</x:ActiveRow>
       <x:ActiveCol>3</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>9090</x:WindowHeight>
  <x:WindowWidth>15180</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>105</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>
<!--The following information was generated by Microsoft Office Excel's Publish
as Web Page wizard.--><!--If the same item is republished from Excel, all information between the DIV
tags will be replaced.--><!-----------------------------><!--START OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD --><!----------------------------->

<table x:str border=0 cellpadding=0 cellspacing=0 width=1020 style='border-collapse:
 collapse;table-layout:fixed;width:766pt'>
 <col width=83 style='mso-width-source:userset;mso-width-alt:3035;width:62pt'>
 <col width=101 style='mso-width-source:userset;mso-width-alt:3693;width:76pt'>
 <col width=105 style='mso-width-source:userset;mso-width-alt:3840;width:79pt'>
 <col width=95 style='mso-width-source:userset;mso-width-alt:3474;width:71pt'>
 <col width=107 style='mso-width-source:userset;mso-width-alt:3913;width:80pt'>
 <col width=101 style='mso-width-source:userset;mso-width-alt:3693;width:76pt'>
 <col width=99 style='mso-width-source:userset;mso-width-alt:3620;width:74pt'>
 <col width=110 style='mso-width-source:userset;mso-width-alt:4022;width:83pt'>
 <col width=106 style='mso-width-source:userset;mso-width-alt:3876;width:80pt'>
 <col width=113 style='mso-width-source:userset;mso-width-alt:4132;width:85pt'>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 width=83 style='height:12.75pt;width:62pt'></td>
  <td width=101 style='width:76pt'></td>
  <td width=105 style='width:79pt'></td>
  <td width=95 style='width:71pt'></td>
  <td width=107 style='width:80pt'></td>
  <td width=101 style='width:76pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=110 style='width:83pt'></td>
  <td width=106 style='width:80pt'></td>
  <td width=113 style='width:85pt'></td>
 </tr>
 <tr height=39 style='mso-height-source:userset;height:29.25pt'>
  <td colspan=10 height=39 class=xl33 style='height:29.25pt'>BALANCE OF<span style='mso-spacerun:yes'> 
  </span>ALL ORDERS IN <%=dt1.Rows[0][0]%> - <%=dt1.Rows[0][1]%><span style='mso-spacerun:yes'> </span></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 colspan=10 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.95pt'>
  <td rowspan=2 height=50 class=xl34 style='border-bottom:.5pt solid black;
  height:37.9pt'>DATE</td>
  <td colspan=2 class=xl36 style='border-right:.5pt solid black;border-left:
  none'>ZIPPER (M)</td>
  <td colspan=2 class=xl36 style='border-right:.5pt solid black;border-left:
  none'>SLIDER (PCS)</td>
  <td colspan=2 class=xl36 style='border-right:.5pt solid black;border-left:
  none'>OPEN (SET)</td>
  <td class=xl24 width=110 style='border-left:none;width:83pt'>TOTAL</td>
  <td colspan=2 class=xl38 style='border-right:.5pt solid black;border-left:
  none'>APPROVED BY</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.95pt'>
  <td height=25 class=xl26 style='height:18.95pt' x:str="Q'TY ">Q'TY<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl26>AMOUNT</td>
  <td class=xl26>Q'TY</td>
  <td class=xl26>AMOUNT</td>
  <td class=xl26>Q'TY</td>
  <td class=xl26>AMOUNT</td>
  <td class=xl25 width=110 style='border-left:none;width:83pt'>AMOUNT (USD)</td>
  <td class=xl27>STAFF</td>
  <td class=xl27>MANAGER</td>
 </tr>
 <%      
     double total =0;
     double total1 = 0, total2 = 0, total3 = 0, total4 = 0, total5 = 0, total6 = 0, total7 = 0;
     for (int i = 0; i < dt.Rows.Count; i++)
     {   
         total =  CommondLib.ConvertToDbl(dt.Rows[i]["m_amt"]) + CommondLib.ConvertToDbl(dt.Rows[i]["pcs_amt"]) + CommondLib.ConvertToDbl(dt.Rows[i]["set_amt"]);
         total1 = total1 + CommondLib.ConvertToDbl(dt.Rows[i]["m_qty"]);
         total2 = total2 + CommondLib.ConvertToDbl(dt.Rows[i]["m_amt"]);
         total3 = total3 + CommondLib.ConvertToDbl(dt.Rows[i]["pcs_qty"]);
         total4 = total4 + CommondLib.ConvertToDbl(dt.Rows[i]["pcs_amt"]);
         total5 = total5 + CommondLib.ConvertToDbl(dt.Rows[i]["set_qty"]);
         total6 = total6 + CommondLib.ConvertToDbl(dt.Rows[i]["set_amt"]);
         total7 = total7 + total;
         
        %>
 <tr height=25 style='mso-height-source:userset;height:18.95pt'>
  <td height=25 class=xl28 style='height:18.95pt'><%=dt.Rows[i]["so_date"]%></td>
  <td class=xl29 x:num><%=dt.Rows[i]["m_qty"]%></td>
  <td class=xl30 x:num><%=dt.Rows[i]["m_amt"]%></td>
  <td class=xl29 x:num><%=dt.Rows[i]["pcs_qty"]%></td>
  <td class=xl30 x:num><%=dt.Rows[i]["pcs_amt"]%></td>
  <td class=xl29 x:num><%=dt.Rows[i]["set_qty"]%></td>
  <td class=xl30 x:num><%=dt.Rows[i]["set_amt"]%></td>
  <td class=xl31 x:num><%=total%></td>
  <td class=xl32></td>
  <td class=xl32></td>
 </tr>
 <%
     total = 0;
   }
      %>
 <tr height=25 style='mso-height-source:userset;height:18.95pt'>
  <td height=25 class=xl41 style='height:18.95pt;border-top:none'>TOTAL</td>
  <td class=xl42 style='border-top:none;border-left:none'x:num><%=total1 %></td>
  <td class=xl43 style='border-top:none;border-left:none'x:num><%=total2 %></td>
  <td class=xl42 style='border-top:none;border-left:none'x:num><%=total3 %></td>
  <td class=xl43 style='border-top:none;border-left:none'x:num><%=total4 %></td>
  <td class=xl42 style='border-top:none;border-left:none'x:num><%=total5 %></td>
  <td class=xl43 style='border-top:none;border-left:none'x:num><%=total6 %></td>
  <td class=xl43 style='border-top:none;border-left:none'x:num><%=total7 %></td>
  <td class=xl40 style='border-top:none;border-left:none'x:num></td>
  <td class=xl40 style='border-top:none;border-left:none'><!-----------------------------><!--END OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD--><!-----------------------------></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=83 style='width:62pt'></td>
  <td width=101 style='width:76pt'></td>
  <td width=105 style='width:79pt'></td>
  <td width=95 style='width:71pt'></td>
  <td width=107 style='width:80pt'></td>
  <td width=101 style='width:76pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=110 style='width:83pt'></td>
  <td width=106 style='width:80pt'></td>
  <td width=113 style='width:85pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
