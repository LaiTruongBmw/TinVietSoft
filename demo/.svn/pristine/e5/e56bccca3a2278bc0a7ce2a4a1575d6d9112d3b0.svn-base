<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser("CRM");
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
   string  p_date = Request["p_date"];
   string  ex_rate = Request["p_ex_rate"];
	DataTable  dt_revenue_daily = CtlLib.TableReadOpenCursor("crm.SP_SEL_REVENUE_DAILY", p_date);
	DataTable  dt_inhouse_list = CtlLib.TableReadOpenCursor("crm.SP_SEL_VIP_INHOUSE_LIST", p_date);
	DataTable  dt_arrival_list = CtlLib.TableReadOpenCursor("crm.SP_SEL_VIP_ARRIVAL_LIST", p_date);
	DataTable  dt_comp_list= CtlLib.TableReadOpenCursor("crm.SP_SEL_COMP_LIST", p_date);
	DataTable  dt_ooo_list = CtlLib.TableReadOpenCursor("crm.SP_SEL_OOO_LIST", p_date);
	
	   string  format_date="";
	format_date = p_date.Substring(6, 2) + "/" + p_date.Substring(4, 2)+ "/" + p_date.Substring(0, 4);
	string l_print_date="";
		string SQL3 = "select to_char(sysdate,'dd-Mon-yyyy hh24:mi') print_date from dual";
		DataTable dt_sysdate = CtlLib.TableReadOpen(SQL3);
		if (dt_sysdate.Rows.Count > 0)
		{
			l_print_date = dt_sysdate.Rows[0][0].ToString();
		}
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_jama00150_Nigh_Audit_daily_VND_files/filelist.xml">
<link rel=Edit-Time-Data
href="rpt_jama00150_Nigh_Audit_daily_VND_files/editdata.mso">
<link rel=OLE-Object-Data
href="rpt_jama00150_Nigh_Audit_daily_VND_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>PCVINA002</o:Author>
  <o:LastAuthor>PCVINA002</o:LastAuthor>
  <o:LastPrinted>2011-03-14T01:31:04Z</o:LastPrinted>
  <o:Created>2011-03-14T00:33:34Z</o:Created>
  <o:LastSaved>2011-03-15T01:27:50Z</o:LastSaved>
  <o:Company>VINA</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.2in .04in .2in .17in;
	mso-header-margin:.51in;
	mso-footer-margin:.2in;
	mso-page-orientation:landscape;}
.font0
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial;
	mso-generic-font-family:auto;
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
.xl24
	{mso-style-parent:style0;
	font-size:7.0pt;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl25
	{mso-style-parent:style0;
	font-size:7.0pt;
	mso-number-format:"\#\,\#\#0";
	border:.5pt solid windowtext;
	mso-text-control:shrinktofit;} 
.xl26
	{mso-style-parent:style0;
	font-size:7.0pt;
	border:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	font-size:7.0pt;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl28
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl29
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;}
.xl30
	{mso-style-parent:style0;
	font-size:7.0pt;
	text-align:center;
	border:.5pt solid windowtext;}
.xl31
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl32
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl33
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl34
	{mso-style-parent:style0;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl35
	{mso-style-parent:style0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl36
	{mso-style-parent:style0;
	text-align:center;}
.xl37
	{mso-style-parent:style0;
	font-size:7.0pt;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl38
	{mso-style-parent:style0;
	font-size:7.0pt;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl39
	{mso-style-parent:style0;
	font-size:7.0pt;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl40
	{mso-style-parent:style0;
	font-size:7.0pt;
	text-align:left;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl41
	{mso-style-parent:style0;
	color:#3366FF;
	font-size:12.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;}
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
      <x:Scale>78</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>13</x:ActiveRow>
       <x:ActiveCol>9</x:ActiveCol>
       <x:RangeSelection>$J$14:$Q$14</x:RangeSelection>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>8190</x:WindowHeight>
  <x:WindowWidth>11355</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>105</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1325 style='border-collapse:
 collapse;table-layout:fixed;width:998pt'>
 <col width=35 style='mso-width-source:userset;mso-width-alt:1280;width:26pt'>
 <col width=73 style='mso-width-source:userset;mso-width-alt:2669;width:55pt'>
 <col width=50 span=6 style='mso-width-source:userset;mso-width-alt:1828;
 width:38pt'>
 <col width=15 style='mso-width-source:userset;mso-width-alt:548;width:11pt'>
 <col width=32 style='mso-width-source:userset;mso-width-alt:1170;width:24pt'>
 <col width=65 style='mso-width-source:userset;mso-width-alt:2377;width:49pt'>
 <col width=66 style='mso-width-source:userset;mso-width-alt:2413;width:50pt'>
 <col width=59 style='mso-width-source:userset;mso-width-alt:2300;width:60pt'>
 <col width=62 style='mso-width-source:userset;mso-width-alt:2267;width:47pt'>
 <col width=64 style='width:48pt'>
 <col width=32 style='mso-width-source:userset;mso-width-alt:1170;width:24pt'>
 <col width=458 style='mso-width-source:userset;mso-width-alt:16749;width:344pt'>
 <col width=64 style='width:48pt'>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td colspan=18 height=27 class=xl41 width=1325 style='height:20.25pt;
  width:998pt'>Night Audit Daily Report</td>
 </tr>
 <tr height=65 style='mso-height-source:userset;height:48.75pt'>
  <td colspan=2 height=65 width=108 style='height:48.75pt;width:81pt'
  align=left valign=top><!--[if gte vml 1]><v:shapetype id="_x0000_t75"
   coordsize="21600,21600" o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe"
   filled="f" stroked="f">
   <v:stroke joinstyle="miter"/>
   <v:formulas>
    <v:f eqn="if lineDrawn pixelLineWidth 0"/>
    <v:f eqn="sum @0 1 0"/>
    <v:f eqn="sum 0 0 @1"/>
    <v:f eqn="prod @2 1 2"/>
    <v:f eqn="prod @3 21600 pixelWidth"/>
    <v:f eqn="prod @3 21600 pixelHeight"/>
    <v:f eqn="sum @0 0 1"/>
    <v:f eqn="prod @6 1 2"/>
    <v:f eqn="prod @7 21600 pixelWidth"/>
    <v:f eqn="sum @8 21600 0"/>
    <v:f eqn="prod @7 21600 pixelHeight"/>
    <v:f eqn="sum @10 21600 0"/>
   </v:formulas>
   <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/>
   <o:lock v:ext="edit" aspectratio="t"/>
  </v:shapetype><v:shape id="_x0000_s1026" type="#_x0000_t75" style='position:absolute;
   margin-left:5.25pt;margin-top:.75pt;width:101.25pt;height:43.5pt;z-index:1'>
   <v:imagedata src="rpt_jama00150_Nigh_Audit_daily_VND_files/image001.jpg"
    o:title="image001"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:7px;margin-top:1px;width:135px;
  height:58px'><img width=135 height=58
  src="rpt_jama00150_Nigh_Audit_daily_VND_files/image002.jpg" v:shapes="_x0000_s1026"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=2 height=65 class=xl36 width=108 style='height:48.75pt;
    width:81pt'></td>
   </tr>
  </table>
  </span></td>
  <td colspan=15 class=xl36></td>
  <td></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=2 style='height:12.75pt;mso-ignore:colspan'></td>
  <td class=xl28>Date:</td>
  <td colspan=2 class=xl35><%=format_date%></td>
  <td class=xl29>Unit:</td>
  <td colspan=2 class=xl35>x1000 VND</td>
  <td colspan=1 style='mso-ignore:colspan'></td>
  <td colspan=2 style='mso-ignore:colspan'>Ex.Rate:</td>
  <td colspan=2 style='mso-ignore:colspan'><%=ex_rate%></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
  <td class=xl28>Print Date :<font class="font0"> <%=l_print_date%></font></td>
  <td></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td rowspan=2 height=34 class=xl33 style='height:25.5pt'>PNT</td>
  <td rowspan=2 class=xl33>Category</td>
  <td colspan=2 class=xl31 style='border-left:none'>Today</td>
  <td colspan=2 class=xl31 style='border-left:none'>MTD</td>
  <td colspan=2 class=xl31 style='border-left:none'>YTD</td>
  <td></td>
  <td colspan=9 class=xl34>VIP INHOUSE</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl31 style='height:12.75pt;border-top:none;border-left:
  none'>#</td>
  <td class=xl31 style='border-top:none;border-left:none'>Revenue</td>
  <td class=xl31 style='border-top:none;border-left:none'>#</td>
  <td class=xl31 style='border-top:none;border-left:none'>Revenue</td>
  <td class=xl31 style='border-top:none;border-left:none'>#</td>
  <td class=xl31 style='border-top:none;border-left:none'>Revenue</td>
  <td></td>
  <td class=xl32>RM#</td>
  <td class=xl32 style='border-left:none'>Last Name</td>
  <td class=xl32 style='border-left:none'>First Name</td>
  <td class=xl32 style='border-left:none'>Type</td>
  <td class=xl32 style='border-left:none'>Checkin</td>
  <td class=xl32 style='border-left:none'>Departure</td>
  <td class=xl32 style='border-left:none'>VIP</td>
  <td class=xl32 style='border-left:none'>Remark</td>
  <td></td>
 </tr>
 <%
		if(dt_revenue_daily.Rows.Count > 0  &&  dt_inhouse_list.Rows.Count > 0)
		{			
	 %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'><%= dt_revenue_daily.Rows[0][1].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[0][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[0][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[0][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[0][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[0][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[0][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[0][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_inhouse_list.Rows[0][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[0][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[0][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[0][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[0][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[0][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[0][5].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[0][6].ToString()%></td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 0  &&  dt_inhouse_list.Rows.Count  < 1)
		{			
	 %>
	 <tr height=17 style='height:12.75pt'>
	  <td height=17 class=xl24 style='height:12.75pt;border-top:none'><%= dt_revenue_daily.Rows[0][1].ToString()%></td>
	  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[0][2].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[0][6].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[0][3].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none'
	  x:num><%= dt_revenue_daily.Rows[0][7].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[0][4].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[0][8].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[0][5].ToString()%></td>
	  <td></td>
	  <td class=xl27 style='border-top:none' x:num></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td></td>
	 </tr>
 <%
	}
	%>
		
<%
	if(dt_revenue_daily.Rows.Count > 1  &&  dt_inhouse_list.Rows.Count > 1)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[1][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[1][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[1][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[1][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[1][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[1][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[1][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_inhouse_list.Rows[1][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[1][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[1][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[1][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[1][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[1][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[1][5].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[1][6].ToString()%></td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 1  &&  dt_inhouse_list.Rows.Count  < 2)
		{			
	 %>
	 <tr height=17 style='height:12.75pt'>
	  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[1][2].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[1][6].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[1][3].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none'
	  x:num><%= dt_revenue_daily.Rows[1][7].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[1][4].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[1][8].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[1][5].ToString()%></td>
  <td></td>
	  <td class=xl27 style='border-top:none' x:num></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td></td>
	 </tr>
 <%
	}
	%>		
	<%
	if(dt_revenue_daily.Rows.Count > 2  &&  dt_inhouse_list.Rows.Count > 2)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[2][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[2][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[2][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[2][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[2][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[2][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[2][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_inhouse_list.Rows[2][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[2][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[2][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[2][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[2][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[2][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[2][5].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[2][6].ToString()%></td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 2  &&  dt_inhouse_list.Rows.Count  < 3)
		{			
	 %>
	 <tr height=17 style='height:12.75pt'>
	  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[2][2].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[2][6].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[2][3].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none'
	  x:num><%= dt_revenue_daily.Rows[2][7].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[2][4].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[2][8].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[2][5].ToString()%></td>
	  <td></td>
	  <td class=xl27 style='border-top:none' x:num></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td></td>
	 </tr>
 <%
	}
	%>		
	<%
	if(dt_revenue_daily.Rows.Count > 3  &&  dt_inhouse_list.Rows.Count > 3)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[3][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[3][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[3][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[3][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[3][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[3][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[3][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_inhouse_list.Rows[3][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[3][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[3][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[3][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[3][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[3][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[3][5].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[3][6].ToString()%></td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 3  &&  dt_inhouse_list.Rows.Count  < 4)
		{			
	 %>
	 <tr height=17 style='height:12.75pt'>
	  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[3][2].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[3][6].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[3][3].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none'
	  x:num><%= dt_revenue_daily.Rows[3][7].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[3][4].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[3][8].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[3][5].ToString()%></td>
	  <td></td>
	  <td class=xl27 style='border-top:none' x:num></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td></td>
	 </tr>
 <%
	}
	%>	
<%
	if(dt_revenue_daily.Rows.Count > 4  &&  dt_inhouse_list.Rows.Count > 4)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[4][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[4][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[4][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[4][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[4][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[4][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[4][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_inhouse_list.Rows[4][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[4][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[4][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[4][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[4][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[4][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[4][5].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[4][6].ToString()%></td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 4  &&  dt_inhouse_list.Rows.Count  < 5)
		{			
	 %>
	 <tr height=17 style='height:12.75pt'>
	  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[4][2].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[4][6].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[4][3].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none'
	  x:num><%= dt_revenue_daily.Rows[4][7].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[4][4].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[4][8].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[4][5].ToString()%></td>
	  <td></td>
	  <td class=xl27 style='border-top:none' x:num></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td></td>
	 </tr>
 <%
	}
	%>		

	<%
	if(dt_revenue_daily.Rows.Count > 5  &&  dt_inhouse_list.Rows.Count > 5)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[5][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[5][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[5][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[5][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[5][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[5][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[5][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_inhouse_list.Rows[5][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[5][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[5][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[5][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[5][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[5][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[5][5].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[5][6].ToString()%></td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 5  &&  dt_inhouse_list.Rows.Count  < 6)
		{			
	 %>
	 <tr height=17 style='height:12.75pt'>
	  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[5][2].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[5][6].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[5][3].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none'
	  x:num><%= dt_revenue_daily.Rows[5][7].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[5][4].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[5][8].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[5][5].ToString()%></td>
	  <td></td>
	  <td class=xl27 style='border-top:none' x:num></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td></td>
	 </tr>
 <%
	}
	%>				
	<%
	if(dt_revenue_daily.Rows.Count > 6  &&  dt_inhouse_list.Rows.Count > 6)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[6][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[6][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[6][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[6][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[6][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[6][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[6][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_inhouse_list.Rows[6][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[6][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[6][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[6][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[6][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[6][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[6][5].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_inhouse_list.Rows[6][6].ToString()%></td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 6  &&  dt_inhouse_list.Rows.Count  < 7)
		{			
	 %>
	 <tr height=17 style='height:12.75pt'>
	  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[6][2].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[6][6].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[6][3].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none'
	  x:num><%= dt_revenue_daily.Rows[6][7].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[6][4].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[6][8].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[6][5].ToString()%></td>
	  <td></td>
	  <td class=xl27 style='border-top:none' x:num></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td></td>
	 </tr>
 <%
	}
	%>				
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[7][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[7][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[7][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[7][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[7][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[7][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[7][5].ToString()%></td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[8][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[8][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[8][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[8][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[8][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[8][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[8][5].ToString()%></td>
  <td></td>
  <td colspan=8 class=xl34>VIP ARRIVAL</td>
  <td></td>
 </tr>
 
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[9][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[9][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[9][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[9][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[9][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[9][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[9][5].ToString()%></td>
  <td></td>
  <td class=xl32>RM#</td>
  <td class=xl32 style='border-left:none'>Last Name</td>
  <td class=xl32 style='border-left:none'>First Name</td>
  <td class=xl32 style='border-left:none'>Type</td>
  <td class=xl32 style='border-left:none'>Checkin</td>
  <td class=xl32 style='border-left:none'>Departure</td>
  <td class=xl32 style='border-left:none'>VIP</td>
  <td class=xl32 style='border-left:none'>Remark</td>
  <td></td>
 </tr>
 <%
	if(dt_revenue_daily.Rows.Count > 10 &&  dt_arrival_list.Rows.Count > 0)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[10][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[10][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[10][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[10][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[10][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[10][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[10][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_arrival_list.Rows[0][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[0][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[0][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[0][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[0][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[0][5].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[0][6].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[0][7].ToString()%></td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 10  &&  dt_arrival_list.Rows.Count  < 1)
		{			
	 %>
	 <tr height=17 style='height:12.75pt'>
	  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[10][2].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[10][6].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none'
	  x:num><%= dt_revenue_daily.Rows[10][3].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none'
	  x:num><%= dt_revenue_daily.Rows[10][7].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[10][4].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[10][8].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[10][5].ToString()%></td>
	  <td></td>
	  <td class=xl27 style='border-top:none' x:num></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td></td>
	 </tr>
 <%}%>
 <%
	if(dt_revenue_daily.Rows.Count > 11 &&  dt_arrival_list.Rows.Count > 1)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[11][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[11][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[11][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[11][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[11][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[11][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[11][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_arrival_list.Rows[1][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[1][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[1][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[1][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[1][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[1][5].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[1][6].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[1][7].ToString()%></td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 11  &&  dt_arrival_list.Rows.Count  < 2)
		{			
	 %>
	 <tr height=17 style='height:12.75pt'>
	  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[11][2].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[11][6].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none'
	  x:num><%= dt_revenue_daily.Rows[11][3].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none'
	  x:num><%= dt_revenue_daily.Rows[11][7].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[11][4].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[11][8].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[11][5].ToString()%></td>
	  <td></td>
	  <td class=xl27 style='border-top:none' x:num></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td></td>
	 </tr>
 <%}%>
 
 <%
	if(dt_revenue_daily.Rows.Count > 12 &&  dt_arrival_list.Rows.Count > 2)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[12][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[12][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[12][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[12][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[12][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[12][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[12][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_arrival_list.Rows[2][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[2][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[2][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[2][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[2][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[2][5].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[2][6].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[2][7].ToString()%></td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 12  &&  dt_arrival_list.Rows.Count  < 3)
		{			
	 %>
	 <tr height=17 style='height:12.75pt'>
	  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[12][2].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[12][6].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none'
	  x:num><%= dt_revenue_daily.Rows[12][3].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none'
	  x:num><%= dt_revenue_daily.Rows[12][7].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[12][4].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[12][8].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[12][5].ToString()%></td>
	  <td></td>
	  <td class=xl27 style='border-top:none' x:num></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td></td>
	 </tr>
 <%}%>
 <%
	if(dt_revenue_daily.Rows.Count > 13&&  dt_arrival_list.Rows.Count > 3)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[13][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[13][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[13][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[13][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[13][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[13][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[13][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_arrival_list.Rows[3][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[3][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[3][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[3][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[3][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[3][5].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[3][6].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[3][7].ToString()%></td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 13  &&  dt_arrival_list.Rows.Count  < 4)
		{			
	 %>
	 <tr height=17 style='height:12.75pt'>
	  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[13][2].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[13][6].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none'
	  x:num><%= dt_revenue_daily.Rows[13][3].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none'
	  x:num><%= dt_revenue_daily.Rows[13][7].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[13][4].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[13][8].ToString()%></td>
	  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[13][5].ToString()%></td>
	  <td></td>
	  <td class=xl27 style='border-top:none' x:num></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl26 style='border-top:none;border-left:none'></td>
	  <td class=xl24 style='border-top:none;border-left:none'></td>
	  <td></td>
	 </tr>
 <%}%>
 <%
	if(dt_revenue_daily.Rows.Count > 14&&  dt_arrival_list.Rows.Count > 4)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'><b><%= dt_revenue_daily.Rows[14][1].ToString()%></b></td>
  <td class=xl24 style='border-top:none;border-left:none'><b><%= dt_revenue_daily.Rows[14][2].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[14][6].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[14][3].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[14][7].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[14][4].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[14][8].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[14][5].ToString()%></b></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_arrival_list.Rows[4][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[4][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[4][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[4][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[4][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[4][5].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[4][6].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_arrival_list.Rows[4][7].ToString()%></td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 14  &&  dt_arrival_list.Rows.Count  < 5)
		{			
	 %>
	 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'><b><%= dt_revenue_daily.Rows[14][1].ToString()%></b></td>
  <td class=xl24 style='border-top:none;border-left:none'><b><%= dt_revenue_daily.Rows[14][2].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[14][6].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[14][3].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[14][7].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[14][4].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[14][8].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[14][5].ToString()%></b></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num></td>
  <td class=xl24 style='border-top:none;border-left:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'></td>
  <td></td>
 </tr>
 <%}%>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'><%= dt_revenue_daily.Rows[15][1].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[15][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[15][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[15][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[15][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[15][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[15][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[15][5].ToString()%></td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[16][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[16][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[16][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[16][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[16][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[16][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[16][5].ToString()%></td>
  <td></td>
  <td colspan=8 class=xl34>COMPLEMENTARY</td>
  <td></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[17][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[17][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[17][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[17][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[17][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[17][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[17][5].ToString()%></td>
  <td></td>
  <td class=xl32>RM#</td>
  <td class=xl32 style='border-left:none'>Last Name</td>
  <td class=xl32 style='border-left:none'>First Name</td>
  <td class=xl32 style='border-left:none'>Type</td>
  <td class=xl32 style='border-left:none'>Checkin</td>
  <td class=xl32 style='border-left:none'>Departure</td>
  <td colspan=2 class=xl32 style='border-left:none'>Remark</td>
  <td></td>
 </tr>
 <%
	if(dt_revenue_daily.Rows.Count > 18&&  dt_comp_list.Rows.Count > 0)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[18][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[18][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[18][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[18][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[18][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[18][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[18][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_comp_list.Rows[0][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[0][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[0][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[0][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[0][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[0][5].ToString()%></td>
  <td colspan=2 class=xl40 style='border-left:none'>room <%= dt_comp_list.Rows[0][6].ToString()%>. User
  trantuyet re</td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 18  &&  dt_comp_list.Rows.Count  < 1)
		{			
	 %>
	 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[18][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[18][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[18][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[18][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[18][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[18][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[18][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num></td>
  <td class=xl24 style='border-top:none;border-left:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td colspan=2 class=xl40 style='border-left:none'></td>
  <td></td>
 </tr>
 <%}%>
 
 <%
	if(dt_revenue_daily.Rows.Count > 19&&  dt_comp_list.Rows.Count > 1)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[19][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[19][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[19][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[19][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[19][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[19][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[19][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_comp_list.Rows[1][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[1][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[1][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[1][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[1][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[1][5].ToString()%></td>
  <td colspan=2 class=xl40 style='border-left:none'>room <%= dt_comp_list.Rows[1][6].ToString()%>. User
  trantuyet re</td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 19  &&  dt_comp_list.Rows.Count  < 2)
		{			
	 %>
	 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[19][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[19][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[19][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[19][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[19][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[19][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[19][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num></td>
  <td class=xl24 style='border-top:none;border-left:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td colspan=2 class=xl40 style='border-left:none'></td>
  <td></td>
 </tr>
 <%}%>
 
 <%
	if(dt_revenue_daily.Rows.Count > 20&&  dt_comp_list.Rows.Count > 2)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[20][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[18][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[20][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[20][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[20][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[20][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[20][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_comp_list.Rows[2][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[2][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[2][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[2][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[2][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[2][5].ToString()%></td>
  <td colspan=2 class=xl40 style='border-left:none'>room <%= dt_comp_list.Rows[2][6].ToString()%>. User
  trantuyet re</td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 18  &&  dt_comp_list.Rows.Count  < 3)
		{			
	 %>
	 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[20][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[18][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[20][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[20][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[20][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[20][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[20][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num></td>
  <td class=xl24 style='border-top:none;border-left:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td colspan=2 class=xl40 style='border-left:none'></td>
  <td></td>
 </tr>
 <%}%>
 
 <%
	if(dt_revenue_daily.Rows.Count > 21&&  dt_comp_list.Rows.Count > 3)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[21][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[21][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[21][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[21][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[21][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[21][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[21][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_comp_list.Rows[3][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[3][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[3][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[3][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[3][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[3][5].ToString()%></td>
  <td colspan=2 class=xl40 style='border-left:none'>room <%= dt_comp_list.Rows[3][6].ToString()%>. User
  trantuyet re</td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 21  &&  dt_comp_list.Rows.Count  < 4)
		{			
	 %>
	<tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[21][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[21][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[21][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[21][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[21][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[21][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[21][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num></td>
  <td class=xl24 style='border-top:none;border-left:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td colspan=2 class=xl40 style='border-left:none'></td>
  <td></td>
 </tr>
 <%}%>
 
 <%
	if(dt_revenue_daily.Rows.Count > 22&&  dt_comp_list.Rows.Count > 4)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[22][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[22][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[22][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[22][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[22][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[22][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[22][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_comp_list.Rows[4][0].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[4][2].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[4][3].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[4][1].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[4][4].ToString()%></td>
  <td class=xl26 style='border-top:none;border-left:none'><%= dt_comp_list.Rows[4][5].ToString()%></td>
  <td colspan=2 class=xl40 style='border-left:none'>room <%= dt_comp_list.Rows[4][6].ToString()%>. User
  trantuyet re</td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 22 &&  dt_comp_list.Rows.Count  < 5)
		{			
	 %>
	 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[22][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[22][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[22][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[22][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[22][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[22][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[22][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num></td>
  <td class=xl24 style='border-top:none;border-left:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td class=xl26 style='border-top:none;border-left:none'></td>
  <td colspan=2 class=xl40 style='border-left:none'></td>
  <td></td>
 </tr>
 <%}%>
 
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[23][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[23][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[23][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[23][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[23][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[23][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[23][5].ToString()%></td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'><b><%= dt_revenue_daily.Rows[24][1].ToString()%></b></td>
  <td class=xl24 style='border-top:none;border-left:none'><b><%= dt_revenue_daily.Rows[24][2].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[24][6].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[24][3].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[24][7].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[24][4].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[24][8].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[24][5].ToString()%></b></td>
  <td></td>
  <td colspan=8 class=xl34>OUT OF ORDER</td>
  <td></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'><%= dt_revenue_daily.Rows[25][1].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[25][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[25][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[25][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[25][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[25][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[25][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[25][5].ToString()%></td>
  <td></td>
  <td class=xl32>Type</td>
  <td class=xl32 style='border-left:none'>Total</td>
  <td class=xl32 style='border-left:none'>Date From</td>
  <td class=xl32 style='border-left:none'>Date To</td>
  <td colspan=4 class=xl32 style='border-left:none'>Remark</td>
  <td></td>
 </tr>
 <%
	if(dt_revenue_daily.Rows.Count > 26&&  dt_ooo_list.Rows.Count > 0)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[26][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[26][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[26][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[26][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[26][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[26][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[26][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_ooo_list.Rows[0][0].ToString()%></td>
  <td class=xl27 style='border-top:none;border-left:none'><%= dt_ooo_list.Rows[0][1].ToString()%></td>
  <td class=xl27 style='border-top:none;border-left:none'><%= dt_ooo_list.Rows[0][2].ToString()%></td>
  <td class=xl30 style='border-top:none;border-left:none'><%= dt_ooo_list.Rows[0][3].ToString()%></td>
  <td colspan=4 class=xl40 style='border-left:none'><%= dt_ooo_list.Rows[0][4].ToString()%></td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 26 &&  dt_ooo_list.Rows.Count  < 1)
		{			
	 %>
	<tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[26][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[26][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[26][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[26][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[26][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[26][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[26][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num></td>
  <td class=xl27 style='border-top:none;border-left:none'></td>
  <td class=xl27 style='border-top:none;border-left:none'></td>
  <td class=xl30 style='border-top:none;border-left:none'></td>
  <td colspan=4 class=xl40 style='border-left:none'></td>
  <td></td>
 </tr>
<%}%> 

<%
	if(dt_revenue_daily.Rows.Count > 27&&  dt_ooo_list.Rows.Count > 1)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[27][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[27][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[27][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[27][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[27][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[27][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[27][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_ooo_list.Rows[1][0].ToString()%></td>
  <td class=xl27 style='border-top:none;border-left:none'><%= dt_ooo_list.Rows[1][1].ToString()%></td>
  <td class=xl27 style='border-top:none;border-left:none'><%= dt_ooo_list.Rows[1][2].ToString()%></td>
  <td class=xl30 style='border-top:none;border-left:none'><%= dt_ooo_list.Rows[1][3].ToString()%></td>
  <td colspan=4 class=xl40 style='border-left:none'><%= dt_ooo_list.Rows[1][4].ToString()%></td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 27 &&  dt_ooo_list.Rows.Count  < 2)
		{			
	 %>
	<tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[27][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[27][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[27][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[27][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[27][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[27][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[27][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num></td>
  <td class=xl27 style='border-top:none;border-left:none'></td>
  <td class=xl27 style='border-top:none;border-left:none'></td>
  <td class=xl30 style='border-top:none;border-left:none'></td>
  <td colspan=4 class=xl40 style='border-left:none'></td>
  <td></td>
 </tr>
<%}%> 

<%
	if(dt_revenue_daily.Rows.Count > 28&&  dt_ooo_list.Rows.Count > 2)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[28][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[28][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[28][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[28][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[28][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[28][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[28][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_ooo_list.Rows[2][0].ToString()%></td>
  <td class=xl27 style='border-top:none;border-left:none'><%= dt_ooo_list.Rows[2][1].ToString()%></td>
  <td class=xl27 style='border-top:none;border-left:none'><%= dt_ooo_list.Rows[2][2].ToString()%></td>
  <td class=xl30 style='border-top:none;border-left:none'><%= dt_ooo_list.Rows[2][3].ToString()%></td>
  <td colspan=4 class=xl40 style='border-left:none'><%= dt_ooo_list.Rows[2][4].ToString()%></td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 28 &&  dt_ooo_list.Rows.Count  < 3)
		{			
	 %>
	<tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[28][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[28][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[28][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[28][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[28][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[28][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[28][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num></td>
  <td class=xl27 style='border-top:none;border-left:none'></td>
  <td class=xl27 style='border-top:none;border-left:none'></td>
  <td class=xl30 style='border-top:none;border-left:none'></td>
  <td colspan=4 class=xl40 style='border-left:none'></td>
  <td></td>
 </tr>
<%}%> 

<%
	if(dt_revenue_daily.Rows.Count > 29&&  dt_ooo_list.Rows.Count > 3)
	{			
     %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'><b><%= dt_revenue_daily.Rows[29][1].ToString()%></b></td>
  <td class=xl24 style='border-top:none;border-left:none'><b><%= dt_revenue_daily.Rows[29][2].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[29][6].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[29][3].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[29][7].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[29][4].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[29][8].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[29][5].ToString()%></b></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num><%= dt_ooo_list.Rows[3][0].ToString()%></td>
  <td class=xl27 style='border-top:none;border-left:none'><%= dt_ooo_list.Rows[3][1].ToString()%></td>
  <td class=xl27 style='border-top:none;border-left:none'><%= dt_ooo_list.Rows[3][2].ToString()%></td>
  <td class=xl30 style='border-top:none;border-left:none'><%= dt_ooo_list.Rows[3][3].ToString()%></td>
  <td colspan=4 class=xl40 style='border-left:none'><%= dt_ooo_list.Rows[3][4].ToString()%></td>
  <td></td>
 </tr>
 <%
		}
		else if(dt_revenue_daily.Rows.Count > 29 &&  dt_ooo_list.Rows.Count  < 4)
		{			
	 %>
	<tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[29][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[29][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[29][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[29][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[29][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[29][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[29][5].ToString()%></td>
  <td></td>
  <td class=xl27 style='border-top:none' x:num></td>
  <td class=xl27 style='border-top:none;border-left:none'></td>
  <td class=xl27 style='border-top:none;border-left:none'></td>
  <td class=xl30 style='border-top:none;border-left:none'></td>
  <td colspan=4 class=xl40 style='border-left:none'></td>
  <td></td>
 </tr>
<%}%> 

 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[30][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[30][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[30][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[30][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[30][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[30][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[30][5].ToString()%></td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'><b><%= dt_revenue_daily.Rows[31][1].ToString()%></b></td>
  <td class=xl24 style='border-top:none;border-left:none'><b><%= dt_revenue_daily.Rows[31][2].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[31][6].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[31][3].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[31][7].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[31][4].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[31][8].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[31][5].ToString()%></b></td>
  <td></td>
  <td colspan=8 class=xl34></td>
  <td></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'><%= dt_revenue_daily.Rows[32][1].ToString()%></td>
  <td class=xl24 style='border-top:none;border-left:none'><%= dt_revenue_daily.Rows[32][2].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[32][6].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[32][3].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[32][7].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[32][4].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><%= dt_revenue_daily.Rows[32][8].ToString()%></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><%= dt_revenue_daily.Rows[32][5].ToString()%></td>
  <td></td>
  <td colspan=8 class=xl32 style='border-left:none'></td>
  <td></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;border-top:none'><b><%= dt_revenue_daily.Rows[33][1].ToString()%></b></td>
  <td class=xl24 style='border-top:none;border-left:none'><b><%= dt_revenue_daily.Rows[33][2].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[33][6].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[33][3].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[33][7].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[33][4].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none' x:num><b><%= dt_revenue_daily.Rows[33][8].ToString()%></b></td>
  <td class=xl25 align=right style='border-top:none;border-left:none'
  x:num><b><%= dt_revenue_daily.Rows[33][5].ToString()%></b></td>
  <td></td>
  <td colspan=8 class=xl34></td>
  <td></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=35 style='width:26pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=15 style='width:11pt'></td>
  <td width=32 style='width:24pt'></td>
  <td width=65 style='width:49pt'></td>
  <td width=66 style='width:50pt'></td>
  <td width=59 style='width:44pt'></td>
  <td width=62 style='width:47pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=32 style='width:24pt'></td>
  <td width=458 style='width:344pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
