<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser("prod");
    Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8";
    Response.Buffer = false;
%>

<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<% 
    string style_pk = Request.QueryString["style_pk"];

%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="ttt_files/filelist.xml">
<link rel=Edit-Time-Data href="ttt_files/editdata.mso">
<link rel=OLE-Object-Data href="ttt_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Mr Long</o:LastAuthor>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2010-07-22T03:23:15Z</o:LastSaved>
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
	mso-footer-margin:.5in;
	mso-page-orientation:landscape;}
.font6
	{color:red;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
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
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid #99CCFF;
	border-right:none;
	border-bottom:.5pt solid #99CCFF;
	border-left:.5pt solid #99CCFF;}
.xl25
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid #99CCFF;
	border-right:none;
	border-bottom:.5pt solid #99CCFF;
	border-left:none;}
.xl26
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid #99CCFF;
	border-right:none;
	border-bottom:.5pt solid #99CCFF;
	border-left:none;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid #99CCFF;
	border-right:.5pt solid #99CCFF;
	border-bottom:.5pt solid #99CCFF;
	border-left:none;}
.xl28
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid #99CCFF;
	border-bottom:none;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl29
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt solid #CCFFFF;
	border-bottom:none;
	border-left:none;}
.xl30
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid #99CCFF;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl31
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt solid #99CCFF;
	border-bottom:none;
	border-left:none;}
.xl32
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt solid #99CCFF;
	border-bottom:.5pt solid #99CCFF;
	border-left:none;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl33
	{mso-style-parent:style0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #99CCFF;
	border-left:.5pt solid #99CCFF;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl34
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt solid #99CCFF;
	border-bottom:.5pt solid #99CCFF;
	border-left:.5pt solid #99CCFF;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl35
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid #99CCFF;
	border-right:.5pt solid #99CCFF;
	border-bottom:none;
	border-left:.5pt solid #99CCFF;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl36
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid #99CCFF;
	border-bottom:none;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	border:.5pt solid #99CCFF;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;
	}
.xl38
	{mso-style-parent:style0;
	mso-number-format:Fixed;
	border:.5pt solid #99CCFF;}
.xl39
	{mso-style-parent:style0;
	mso-number-format:Fixed;
	border-top:.5pt solid #99CCFF;
	border-right:.5pt solid #99CCFF;
	border-bottom:.5pt solid #99CCFF;
	border-left:none;}
.xl40
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:.5pt solid #99CCFF;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl41
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Fixed;
	border:.5pt solid #99CCFF;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl42
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Fixed;
	border-top:none;
	border-right:.5pt solid #99CCFF;
	border-bottom:.5pt solid #99CCFF;
	border-left:none;
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
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:Scale>91</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>8</x:ActiveRow>
       <x:ActiveCol>9</x:ActiveCol>
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

<table x:str border=0 cellpadding=0 cellspacing=0 width=947 style='border-collapse:
 collapse;table-layout:fixed;width:712pt'>
 <col width=70 style='mso-width-source:userset;mso-width-alt:2560;width:53pt'>
 <col width=74 style='mso-width-source:userset;mso-width-alt:2706;width:56pt'>
 <col width=67 style='mso-width-source:userset;mso-width-alt:2450;width:50pt'>
 <col width=59 style='mso-width-source:userset;mso-width-alt:2157;width:44pt'>
 <col width=66 style='mso-width-source:userset;mso-width-alt:2413;width:50pt'>
 <col width=65 style='mso-width-source:userset;mso-width-alt:2377;width:49pt'>
 <col width=72 style='mso-width-source:userset;mso-width-alt:2633;width:54pt'>
 <col width=53 style='mso-width-source:userset;mso-width-alt:1938;width:40pt'>
 <col width=232 style='mso-width-source:userset;mso-width-alt:8484;width:174pt'>
 <col width=60 style='mso-width-source:userset;mso-width-alt:2194;width:45pt'>
 <col width=53 style='mso-width-source:userset;mso-width-alt:1938;width:40pt'>
 <col width=76 style='mso-width-source:userset;mso-width-alt:2779;width:57pt'>
<%
    DataTable dt1;
    dt1 = CtlLib.TableReadOpenCursor("prod.sp_rpt_fpib00012_1", "'" + style_pk + "'");      
	 
	 string strStyle = String.Empty;

	 for (int i = 0; i < dt1.Rows.Count; i++)
     {
		strStyle = dt1.Rows[i]["style"].ToString();
	 }

%> 
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl24 colspan=12 width=270 style='height:22.5pt;mso-ignore:
  colspan;width:203pt'>Style : <font class="font6"><%=strStyle%></font></td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl30 style='height:22.5pt;border-top:none'>W/P ID</td>
  <td class=xl28>W/P Name</td>
  <td class=xl28>Avg Time</td>
  <td class=xl28>O/P Seq</td>
  <td class=xl28>O/P Time</td>
  <td class=xl28>Task Seq</td>
  <td class=xl28>Task Time</td>
  <td class=xl35 style='border-top:none;border-left:none'>Task ID</td>
  <td class=xl36 width=77 style='width:100pt'>Task Name</td>
  <td class=xl28>ST Time</td>
  <td class=xl35 style='border-top:none;border-left:none'>M/P(%)</td>
  <td class=xl35 style='border-top:none;border-left:none'>Point Time</td>
 </tr>
<%
    DataTable dt;
    dt = CtlLib.TableReadOpenCursor("prod.sp_rpt_fpib00012", "'" + style_pk + "'");  

	string strEmpty = String.Empty;	
	
	string strID = String.Empty;

	string strOpSeq = String.Empty;

	double StTime = 0;double MP = 0;
    
	 
	 for (int i = 0; i < dt.Rows.Count; i++)
     {
%>
<%  
   
if( strID != dt.Rows[i]["wp_id"].ToString() && i != 0 )
{

%>
 <tr height=15 style='mso-height-source:userset;height:11.25pt'>
  <td height=15 class=xl33 style='height:11.25pt'></td>
  <td class=xl34></td>
  <td class=xl34 style='border-left:none'></td>
  <td class=xl34 style='border-left:none'></td>
  <td class=xl34 style='border-left:none'></td>
  <td class=xl34 style='border-left:none'></td>
  <td class=xl34 style='border-left:none'></td>
  <td class=xl33 style='border-left:none'></td>
  <td class=xl34></td>
  <td class=xl42 align=right x:num><%=StTime%></td>
  <td class=xl41 align=right style='border-top:none;border-left:none' x:num><%=MP%></td>
  <td class=xl34 style='border-left:none'></td>
 </tr>

<%

StTime = 0;
MP = 0;

} 

%>
 <tr height=17 style='height:12.75pt'>
   <%

if(strID == dt.Rows[i]["wp_id"].ToString() )
{
	%> 
  <td height=17 class=xl40 style='height:12.75pt;border-top:none'></td>
  <td class=xl37 width=193 style='border-left:none'></td>
  <td class=xl38 align=right style='border-left:none' x:num></td>
  	<% 
}
else 
{ 
	%>
	<td height=17 class=xl40 style='height:12.75pt;border-top:none'><%=dt.Rows[i]["wp_id"]%></td>
	<td class=xl37 width=193 style='border-left:none'><%=dt.Rows[i]["wp_name"]%></td>
  <td class=xl38 align=right style='border-left:none' x:num><%=dt.Rows[i]["avg_time"]%></td>	
		<% 
	strID = dt.Rows[i]["wp_id"].ToString() ; 
}
	%>   
	
<%
if(strOpSeq == dt.Rows[i]["op_seq"].ToString())
{
	%>
  <td class=xl40 align=right style='border-left:none' x:num></td>
  <td class=xl38 align=right style='border-left:none' x:num></td>
  	<% 
}
else 
{ 
	%>
	<td class=xl40 align=right style='border-left:none' x:num><%=dt.Rows[i]["op_seq"]%></td>
	<td class=xl38 align=right style='border-left:none' x:num><%=dt.Rows[i]["op_time"]%></td>
		<% 
	strOpSeq = dt.Rows[i]["op_seq"].ToString(); 
}
%>  

  <td class=xl40 align=right style='border-left:none' x:num><%=dt.Rows[i]["task_seq"]%></td>
  <td class=xl38 align=right style='border-left:none' x:num><%=dt.Rows[i]["task_time"]%></td>
  <td class=xl40 style='border-left:none'><%=dt.Rows[i]["task_id"]%></td>
  <td class=xl37 style='border-left:none'><%=dt.Rows[i]["task_name"]%></td>
  <td class=xl38 align=right style='border-left:none' x:num><%=dt.Rows[i]["st_time"]%></td>
  <%

StTime += Convert.ToDouble(dt.Rows[i]["st_time"]);
MP += Convert.ToDouble(dt.Rows[i]["hr_cost"]);

%>
  <td class=xl38 align=right style='border-left:none' x:num><%=dt.Rows[i]["hr_cost"]%></td>
  <td class=xl39 align=right x:num><%=dt.Rows[i]["point_time"]%></td>
 </tr>
 
    <%
     }
         %> 
 <tr height=15 style='mso-height-source:userset;height:11.25pt'>
  <td height=15 class=xl33 style='height:11.25pt'></td>
  <td class=xl34></td>
  <td class=xl34 style='border-left:none'></td>
  <td class=xl34 style='border-left:none'></td>
  <td class=xl34 style='border-left:none'></td>
  <td class=xl34 style='border-left:none'></td>
  <td class=xl34 style='border-left:none'></td>
  <td class=xl33 style='border-left:none'></td>
  <td class=xl34></td>
  <td class=xl42 align=right x:num><%=StTime%></td>
  <td class=xl41 align=right style='border-top:none;border-left:none' x:num><%=MP%> </td>
  <td class=xl32></td>
 </tr>

 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=70 style='width:53pt'></td>
  <td width=74 style='width:56pt'></td>
  <td width=67 style='width:50pt'></td>
  <td width=59 style='width:44pt'></td>
  <td width=66 style='width:50pt'></td>
  <td width=65 style='width:49pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=53 style='width:100pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=60 style='width:45pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=76 style='width:57pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
