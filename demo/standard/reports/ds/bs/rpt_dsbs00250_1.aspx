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
    DataTable dt = CtlLib.TableReadOpenCursor("SALE.sp_rpt_dsbs00251_csz", "'" + p_from_date + "','" + p_to_date + "'");

%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_dsbs00250_1_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dsbs00250_1_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dsbs00250_1_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Trung</o:LastAuthor>
  <o:LastPrinted>2012-02-04T07:15:30Z</o:LastPrinted>
  <o:Created>2012-02-04T07:07:35Z</o:Created>
  <o:LastSaved>2012-02-04T07:17:13Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.75in .25in .75in .25in;
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
.xl65
	{mso-style-parent:style0;
	font-size:11.0pt;
	mso-number-format:"Short Date";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl66
	{mso-style-parent:style0;
	font-size:11.0pt;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl67
	{mso-style-parent:style0;
	font-size:11.0pt;
	mso-number-format:Standard;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl68
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl69
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl70
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl71
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl72
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:right;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl73
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
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
      <x:Scale>85</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:DoNotDisplayGridlines/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>17</x:ActiveRow>
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

<table x:str border=0 cellpadding=0 cellspacing=0 width=1161 style='border-collapse:
 collapse;table-layout:fixed;width:871pt'>
 <col width=118 style='mso-width-source:userset;mso-width-alt:4315;width:89pt'>
 <col width=119 span=6 style='mso-width-source:userset;mso-width-alt:4352;
 width:89pt'>
 <col width=110 style='mso-width-source:userset;mso-width-alt:4022;width:83pt'>
 <col width=106 style='mso-width-source:userset;mso-width-alt:3876;width:80pt'>
 <col width=113 style='mso-width-source:userset;mso-width-alt:4132;width:85pt'>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 width=118 style='height:12.75pt;width:89pt'></td>
  <td width=119 style='width:89pt'></td>
  <td width=119 style='width:89pt'></td>
  <td width=119 style='width:89pt'></td>
  <td width=119 style='width:89pt'></td>
  <td width=119 style='width:89pt'></td>
  <td width=119 style='width:89pt'></td>
  <td width=110 style='width:83pt'></td>
  <td width=106 style='width:80pt'></td>
  <td width=113 style='width:85pt'></td>
 </tr>
 <tr height=39 style='mso-height-source:userset;height:29.25pt'>
  <td colspan=7 height=39 class=xl73 style='height:29.25pt'>ALL ORDER RECEIVE IN
  <%=dt1.Rows[0][0]%> - <%=dt1.Rows[0][1]%></td>
  <td colspan=3 class=xl70 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 colspan=10 style='height:21.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=44 style='mso-height-source:userset;height:33.0pt'>
  <td height=44 class=xl69 style='height:33.0pt'>ORDER DATE</td>
  <td class=xl69 style='border-left:none'>M Q'TY</td>
  <td class=xl69 style='border-left:none'>M AMOUNT</td>
  <td class=xl69 style='border-left:none'>PCS Q'TY</td>
  <td class=xl69 style='border-left:none'>PCS AMOUNT</td>
  <td class=xl69 style='border-left:none'>SET Q'TY</td>
  <td class=xl69 style='border-left:none'>SET AMOUNT</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <%
     double tot1 = 0, tot2 = 0, tot3 = 0, tot4 = 0, tot5 = 0, tot6 = 0;
     for (int i = 0; i < dt.Rows.Count; i++)
     {
         tot1 = tot1 + CommondLib.ConvertToDbl(dt.Rows[i]["m_qty"]);
         tot2 = tot2 + CommondLib.ConvertToDbl(dt.Rows[i]["m_amt"]);
         tot3 = tot3 + CommondLib.ConvertToDbl(dt.Rows[i]["pcs_qty"]);
         tot4 = tot4 + CommondLib.ConvertToDbl(dt.Rows[i]["pcs_amt"]);
         tot5 = tot5 + CommondLib.ConvertToDbl(dt.Rows[i]["set_qty"]);
         tot6 = tot6 + CommondLib.ConvertToDbl(dt.Rows[i]["set_amt"]);
         
%>
<tr height=25 style='mso-height-source:userset;height:18.95pt'>
  <td height=25 class=xl65 style='height:18.95pt'><%=dt.Rows[i]["so_date"]%></td>
  <td class=xl66 x:num><%=dt.Rows[i]["m_qty"]%></td>
  <td class=xl67 x:num><%=dt.Rows[i]["m_amt"]%></td>
  <td class=xl66 x:num><%=dt.Rows[i]["pcs_qty"]%></td>
  <td class=xl67 x:num><%=dt.Rows[i]["pcs_amt"]%></td>
  <td class=xl66 x:num><%=dt.Rows[i]["set_qty"]%></td>
  <td class=xl67 x:num><%=dt.Rows[i]["set_amt"]%></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
<%
     }
  %>
 <tr height=25 style='mso-height-source:userset;height:18.95pt'>
  <td height=25 class=xl68 style='height:18.95pt'>TOTAL</td>
  <td class=xl71 x:num><%=tot1 %></td>
  <td class=xl72 x:num><%=tot2 %></td>
  <td class=xl71 x:num><%=tot3 %></td>
  <td class=xl72 x:num><%=tot4 %></td>
  <td class=xl71 x:num><%=tot5 %></td>
  <td class=xl72 x:num><%=tot6 %></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=118 style='width:89pt'></td>
  <td width=119 style='width:89pt'></td>
  <td width=119 style='width:89pt'></td>
  <td width=119 style='width:89pt'></td>
  <td width=119 style='width:89pt'></td>
  <td width=119 style='width:89pt'></td>
  <td width=119 style='width:89pt'></td>
  <td width=110 style='width:83pt'></td>
  <td width=106 style='width:80pt'></td>
  <td width=113 style='width:85pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
