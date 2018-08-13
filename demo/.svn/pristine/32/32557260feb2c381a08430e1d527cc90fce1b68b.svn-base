<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser("inv");
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string p_from_date = Request.QueryString["from_date"];
    string p_to_date = Request.QueryString["to_date"];
    string p_tin_warehouse = Request.QueryString["tin_warehouse"];
    string p_tin_warehouse_name = Request.QueryString["tin_warehouse_name"];
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="ddddddddddddd_files/filelist.xml">
<link rel=Edit-Time-Data href="ddddddddddddd_files/editdata.mso">
<link rel=OLE-Object-Data href="ddddddddddddd_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Mr Khanh</o:LastAuthor>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2010-12-15T07:58:00Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .75in 1.0in .75in;
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
	color:blue;
	text-align:center;
	border:.5pt solid windowtext;}
.xl25
	{mso-style-parent:style0;
	color:red;}
.xl26
	{mso-style-parent:style0;
	color:red;
	font-size:18.0pt;
	text-align:center;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl30
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
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
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>11</x:ActiveRow>
       <x:ActiveCol>2</x:ActiveCol>
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
  <x:AcceptLabelsInFormulas/>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=996 style='border-collapse:
 collapse;table-layout:fixed;width:749pt'>
 <col width=98 style='mso-width-source:userset;mso-width-alt:3584;width:74pt'>
 <col width=161 style='mso-width-source:userset;mso-width-alt:5888;width:121pt'>
 <col width=62 style='mso-width-source:userset;mso-width-alt:2267;width:47pt'>
 <col width=80 style='mso-width-source:userset;mso-width-alt:2925;width:60pt'>
 <col width=98 style='mso-width-source:userset;mso-width-alt:3584;width:74pt'>
 <col width=161 style='mso-width-source:userset;mso-width-alt:5888;width:121pt'>
 <col width=80 style='mso-width-source:userset;mso-width-alt:2925;width:60pt'>
 <tr height=17 style='height:12.75pt'>
  <td colspan=7 rowspan=2 height=34 class=xl26 width=740 style='height:25.5pt;
  width:557pt'>GOOD DELIVERY EXCHANGE</td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=4 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td height=31 class=xl27 style='height:23.25pt'>W/H: <%= p_tin_warehouse_name %><span
  style='mso-spacerun:yes'></span></td>
  <td colspan=3 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl27>Date: <%= System.DateTime.ParseExact(p_from_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%> 
  ~ <%= System.DateTime.ParseExact(p_to_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%><span style='mso-spacerun:yes'> </span></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt'>Out Item Code</td>
  <td class=xl24 style='border-left:none'>Out Item Name</td>
  <td class=xl24 style='border-left:none'>UOM</td>
  <td class=xl24 style='border-left:none'>Quantity</td>
  <td class=xl24 style='border-left:none'>Ex.Item Code</td>
  <td class=xl24 style='border-left:none'>Ex.Item Name</td>
  <td class=xl24 style='border-left:none'>Ex.Quantity</td>
 </tr>
 <%
     string para = "'" + p_from_date + "','" + p_to_date + "','" + p_tin_warehouse + "'";
     DataTable dt = CtlLib.TableReadOpenCursor("INV.sp_rpt_bisc00040_bkvn07", para);
     //------------------- Item Code -------------------    
     string strItemCode = string.Empty;
     int[] arrItemCode_count = new int[100];
     int strItemCode_count = 1;
     int a = 0;
     for (int y = 0; y < dt.Rows.Count; y++)
     {
         if (strItemCode == "" || strItemCode == null)
         {
             strItemCode = dt.Rows[y]["item_code"].ToString().Trim();
             strItemCode_count = 1;
         }
         else
         {
             if (dt.Rows[y]["item_code"].ToString().Trim() != strItemCode.Trim())
             {
                 arrItemCode_count[a] = strItemCode_count;
                 strItemCode_count = 1;
                 a++;
                 strItemCode = dt.Rows[y]["item_code"].ToString().Trim();
             }
             else
             {
                 strItemCode_count++;
             }
         }
     }
     //------------------------ 
     arrItemCode_count[a] = strItemCode_count;
     a = 0;
     strItemCode = string.Empty;
     //--------------- End Item Code ------------------- 
     for (int i = 0; i < dt.Rows.Count; i++)
     {
 %>
 <tr height=17 style='height:12.75pt'>
 <%  if (strItemCode != dt.Rows[i]["item_code"].ToString())
                {%>   
  <td rowspan="<%= arrItemCode_count[a] %>" height=17 class=xl28 width=98 style='height:12.75pt;width:74pt'><%= dt.Rows[i]["item_code"]%></td>
  <td rowspan="<%= arrItemCode_count[a] %>" class=xl28 width=161 style='border-left:none;width:121pt'><%= dt.Rows[i]["item_name"]%></td>
    <td rowspan="<%= arrItemCode_count[a] %>" class=xl29 style='border-left:none'><%= dt.Rows[i]["out_uom"]%></td>
  <td rowspan="<%= arrItemCode_count[a] %>" class=xl30 align=right style='border-left:none' x:num><%= dt.Rows[i]["out_qty"]%></td>
              <%                         
                strItemCode = dt.Rows[i]["item_code"].ToString();
                a++;}%> 
  

  <td class=xl28 width=98 style='border-left:none;width:74pt'><%= dt.Rows[i]["in_item_code"]%></td>
  <td class=xl28 width=161 style='border-left:none;width:121pt'><%= dt.Rows[i]["in_item_name"]%></td>
  <td class=xl30 align=right style='border-left:none' x:num><%= dt.Rows[i]["in_qty"]%></td>
 </tr>
 <%} %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=11 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=10 style='height:12.75pt;mso-ignore:colspan'></td>
  <td class=xl25></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=98 style='width:74pt'></td>
  <td width=161 style='width:121pt'></td>
  <td width=62 style='width:47pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=98 style='width:74pt'></td>
  <td width=161 style='width:121pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
