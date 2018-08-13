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
    DataTable dt = CtlLib.TableReadOpenCursor("SALE.sp_rpt_dsbs00252_csz", "'" + p_from_date + "','" + p_to_date + "'");

%>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_dsbs00250_2_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dsbs00250_2_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dsbs00250_2_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Trung</o:LastAuthor>
  <o:LastPrinted>2012-02-04T07:15:30Z</o:LastPrinted>
  <o:Created>2012-02-04T07:07:35Z</o:Created>
  <o:LastSaved>2012-02-04T08:43:52Z</o:LastSaved>
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
.xl24
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl25
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl27
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	font-size:12.0pt;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	font-size:12.0pt;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl30
	{mso-style-parent:style0;
	font-size:12.0pt;
	mso-number-format:Standard;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl31
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl32
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl33
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	vertical-align:middle;
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
      <x:Scale>85</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:DoNotDisplayGridlines/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>9</x:ActiveRow>
       <x:ActiveCol>1</x:ActiveCol>
       <x:RangeSelection>$B$10:$B$12</x:RangeSelection>
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

<table x:str border=0 cellpadding=0 cellspacing=0 width=1299 style='border-collapse:
 collapse;table-layout:fixed;width:974pt'>
 <col width=256 style='mso-width-source:userset;mso-width-alt:9362;width:192pt'>
 <col width=119 span=6 style='mso-width-source:userset;mso-width-alt:4352;
 width:89pt'>
 <col width=110 style='mso-width-source:userset;mso-width-alt:4022;width:83pt'>
 <col width=106 style='mso-width-source:userset;mso-width-alt:3876;width:80pt'>
 <col width=113 style='mso-width-source:userset;mso-width-alt:4132;width:85pt'>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 width=256 style='height:12.75pt;width:192pt'></td>
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
  <td colspan=7 height=39 class=xl27 style='height:29.25pt'>PARTNER DELI
  BALANCE IN <%=dt1.Rows[0][0]%> - <%=dt1.Rows[0][1]%></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 colspan=10 style='height:21.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=44 style='mso-height-source:userset;height:33.0pt'>
  <td height=44 class=xl25 style='height:33.0pt'>PARTNER</td>
  <td class=xl26>M Q'TY</td>
  <td class=xl26>M AMOUNT</td>
  <td class=xl26>PCS Q'TY</td>
  <td class=xl26>PCS AMOUNT</td>
  <td class=xl26>SET Q'TY</td>
  <td class=xl26>SET AMOUNT</td>
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
<tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 width=256 style='height:15.0pt;border-top:none;
  width:192pt'><%=dt.Rows[i]["partner"] %></td>
  <td class=xl29 style='border-top:none;border-left:none'x:num><%=dt.Rows[i]["m_qty"] %></td>
  <td class=xl30 style='border-top:none;border-left:none'x:num><%=dt.Rows[i]["m_amt"] %></td>
  <td class=xl29 style='border-top:none;border-left:none'x:num><%=dt.Rows[i]["pcs_qty"] %></td>
  <td class=xl30 style='border-top:none;border-left:none'x:num><%=dt.Rows[i]["pcs_amt"] %></td>
  <td class=xl29 style='border-top:none;border-left:none'x:num><%=dt.Rows[i]["set_qty"] %></td>
  <td class=xl30 style='border-top:none;border-left:none'x:num><%=dt.Rows[i]["set_amt"] %></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
         <% 
     }
      %>
 
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl31 style='height:19.5pt;border-top:none'>TOTAL</td>
  <td class=xl32 style='border-top:none;border-left:none'x:num><%=tot1 %></td>
  <td class=xl33 style='border-top:none;border-left:none'x:num><%=tot2 %></td>
  <td class=xl32 style='border-top:none;border-left:none'x:num><%=tot3 %></td>
  <td class=xl33 style='border-top:none;border-left:none'x:num><%=tot4 %></td>
  <td class=xl32 style='border-top:none;border-left:none'x:num><%=tot5 %></td>
  <td class=xl33 style='border-top:none;border-left:none'x:num><%=tot6 %></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=256 style='width:192pt'></td>
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
