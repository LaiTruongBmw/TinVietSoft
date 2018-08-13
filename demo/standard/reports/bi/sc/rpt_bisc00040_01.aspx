<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser("prod");
    Response.ContentType = "application/vnd.ms-excel";
    Response.Charaset = "utf-8";
    Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string fromMonth = Request.QueryString["fromMonth"];
    string toMonth = Request.QueryString["toMonth"];
    string whMonth = Request.QueryString["whMonth"];
    string groupMonth = Request.QueryString["groupMonth"]; 
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="aa_files/filelist.xml">
<link rel=Edit-Time-Data href="aa_files/editdata.mso">
<link rel=OLE-Object-Data href="aa_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Mr Long</o:LastAuthor>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2010-08-19T07:32:59Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
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
	font-size:16.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #99CCFF;
	border-left:none;}
.xl25
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid #99CCFF;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl26
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	border:.5pt solid #99CCFF;
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	vertical-align:middle;
	border:.5pt solid #99CCFF;}
.xl29
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid #99CCFF;}
.xl30
	{mso-style-parent:style0;
	mso-number-format:Standard;
	vertical-align:middle;
	border:.5pt solid #99CCFF;
	background:yellow;
	mso-pattern:auto none;}
.xl31
	{mso-style-parent:style0;
	mso-number-format:Standard;
	border-top:none;
	border-right:.5pt solid #99CCFF;
	border-bottom:.5pt solid #99CCFF;
	border-left:.5pt solid #99CCFF;
	background:#FFCC99;
	mso-pattern:auto none;}	
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>6</x:ActiveRow>
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

<table x:str border=0 cellpadding=0 cellspacing=0 width=1106 style='border-collapse:
 collapse;table-layout:fixed;width:831pt'>
 <col width=119 style='mso-width-source:userset;mso-width-alt:4352;width:89pt'>
 <col width=116 style='mso-width-source:userset;mso-width-alt:4242;width:87pt'>
 <col width=306 style='mso-width-source:userset;mso-width-alt:11190;width:230pt'>
 <col width=113 span=2 style='mso-width-source:userset;mso-width-alt:4132;
 width:85pt'>
 <col width=113 style='mso-width-source:userset;mso-width-alt:4132;width:85pt'>
 <col width=113 style='mso-width-source:userset;mso-width-alt:4132;width:85pt'>
 <col width=113 style='mso-width-source:userset;mso-width-alt:4132;width:85pt'>
 <tr height=27 style='height:20.25pt'>
  <td colspan=8 height=27 class=xl24 width=1106 style='height:20.25pt;
  width:831pt'>STOCK ITEM IN/OUT TYPE 1</td>
 </tr>
 <tr class=xl26 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl25 style='height:18.0pt;border-top:none'>WH_NAME</td>
  <td class=xl25 style='border-top:none;border-left:none'>ITEM_CODE</td>
  <td class=xl25 style='border-top:none;border-left:none'>ITEM_NAME</td>
  <td class=xl25 style='border-top:none;border-left:none'>UOM</td>
  <td class=xl25 style='border-top:none;border-left:none'>BEGIN_QTY</td>
  <td class=xl25 style='border-top:none;border-left:none'>INPUT_QTY</td>
  <td class=xl25 style='border-top:none;border-left:none'>OUT_QTY</td>
  <td class=xl25 style='border-top:none;border-left:none'>END_QTY</td>
 </tr>
<%
            string para = " '" + fromMonth + "','" + toMonth + "','" + whMonth + "','" + groupMonth + "' ";
            DataTable dt;
            dt = CtlLib.TableReadOpenCursor("INV.sp_rpt_bisc00040_bkvina01", para);

            string whName = string.Empty;
            double begin_qty = 0, input = 0, output = 0, end_qty = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
%>
 <tr height=51 style='height:38.25pt'>
  <td height=51 class=xl28 style='height:38.25pt;border-top:none'><%=dt.Rows[i]["wh_name"]%></td>
  <td class=xl28 style='border-top:none;border-left:none'><%=dt.Rows[i]["item_code"]%></td>
  <td class=xl27 width=306 style='border-top:none;border-left:none;width:230pt'><%=dt.Rows[i]["item_name"]%></td>
  <td class=xl29 style='border-top:none;border-left:none'><%=dt.Rows[i]["uom"]%></td>
  <td class=xl30 align=right style='border-top:none;border-left:none' x:num><%=dt.Rows[i]["begin_qty"]%></td>
  <td class=xl30 align=right style='border-top:none;border-left:none' x:num><%=dt.Rows[i]["input_qty"]%></td>
  <td class=xl30 align=right style='border-top:none;border-left:none' x:num><%=dt.Rows[i]["output_qty"]%></td>
  <td class=xl30 align=right style='border-top:none;border-left:none' x:num><%=dt.Rows[i]["end_qty"]%></td>
 </tr>
<%
                begin_qty += Convert.ToDouble(dt.Rows[i]["begin_qty"]);
                input += Convert.ToDouble(dt.Rows[i]["input_qty"]);
                output += Convert.ToDouble(dt.Rows[i]["output_qty"]);
                end_qty += Convert.ToDouble(dt.Rows[i]["end_qty"]);   
}
%>
<tr height="15" style='mso-height-source: userset; height: 11.25pt'>
            <td class="xl31" style='border-left: none'>
            </td>
            <td class="xl31" style='border-left: none'>
            </td>
            <td class="xl31" style='border-left: none'>
            </td>
            <td class="xl31" style='border-left: none' x:num>
            </td>
            <td class="xl31" style='border-left: none' x:num>
                <%= begin_qty%>
            </td>
            <td class="xl31" style='border-left: none' x:num>
                <%= input%>
            </td>
            <td class="xl31" style='border-left: none' x:num>
                <%= output%>
            </td>
            <td class="xl31" style='border-left: none' x:num>
                <%= end_qty%>
            </td>
        </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=119 style='width:89pt'></td>
  <td width=116 style='width:87pt'></td>
  <td width=306 style='width:230pt'></td>
  <td width=113 style='width:85pt'></td>
  <td width=113 style='width:85pt'></td>
  <td width=113 style='width:85pt'></td>
  <td width=113 style='width:85pt'></td>
  <td width=113 style='width:85pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
