<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%
    CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
	string l_dt_frm="",l_dt_departure="",l_parameter="",l_guest_name="",l_total_room="";
	l_dt_frm =Request["p_dt_frm"];
	l_dt_departure =Request["p_dt_departure"];
	l_guest_name =Request["p_guest_name"];
	l_total_room =Request["p_count_RM"];
	l_parameter = "'" + l_dt_frm + "','" + l_dt_departure + "','"+l_guest_name+"'";
    DataTable dt = CtlLib.TableReadOpenCursor("ht_rpt_60300010_arrival", l_parameter);
    if (dt.Rows.Count == 0)
    {
        Response.Write("There is no data");
        Response.End();
    }
	string l_print_date="";
    string SQL3 = "select to_char(sysdate,'dd-mm-yyyy hh24:mi') print_date from dual";
    DataTable dt_sysdate = CtlLib.TableReadOpen(SQL3);
    if (dt_sysdate.Rows.Count > 0)
    {
        l_print_date = dt_sysdate.Rows[0][0].ToString();
    }
    String l_arrival_depart="";
	l_arrival_depart = "   " + l_dt_frm.Substring(6, 2) + "/" + l_dt_frm.Substring(4, 2) + "/" + l_dt_frm.Substring(0, 4) + "  ~  " + l_dt_departure.Substring(6, 2) + "/" + l_dt_departure.Substring(4, 2) + "/" + l_dt_departure.Substring(0, 4);
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="htfo00010_files/filelist.xml">
<link rel=Edit-Time-Data href="htfo00010_files/editdata.mso">
<link rel=OLE-Object-Data href="htfo00010_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Mr.Quyen</o:Author>
  <o:LastAuthor>Mr.Quyen</o:LastAuthor>
  <o:LastPrinted>2011-07-27T02:37:37Z</o:LastPrinted>
  <o:Created>2011-07-27T02:14:51Z</o:Created>
  <o:LastSaved>2011-07-27T05:40:06Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.43in .22in .27in .27in;
	mso-header-margin:.45in;
	mso-footer-margin:.26in;
	mso-page-orientation:landscape;}
.font6
	{color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;}
.font7
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;}
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style55
	{color:blue;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-style-name:Hyperlink;
	mso-style-id:8;}
a:link
	{color:blue;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial;
	mso-generic-font-family:auto;
	mso-font-charset:0;}
a:visited
	{color:purple;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial;
	mso-generic-font-family:auto;
	mso-font-charset:0;}
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
.xl65
	{mso-style-parent:style0;
	text-align:center;}
.xl66
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl67
	{mso-style-parent:style0;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl68
	{mso-style-parent:style0;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl69
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;}
.xl70
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl71
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;}
.xl72
	{mso-style-parent:style0;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl73
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl74
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;
	mso-pattern:auto none;}
.xl75
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;
	background:#33CCCC;
	mso-pattern:auto none;}
.xl76
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;
	background:#33CCCC;
	mso-pattern:auto none;}
.xl77
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;
	background:#33CCCC;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl78
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl79
	{mso-style-parent:style0;
	color:red;
	font-size:12.0pt;
	text-align:center;
	vertical-align:middle;}
.xl80
	{mso-style-parent:style55;
	font-size:7.0pt;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;
	mso-pattern:auto none;}
.xl81
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;
	mso-pattern:auto none;}
.xl82
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;
	mso-pattern:auto none;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Arrivallist</x:Name>
    <x:WorksheetOptions>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:Scale>76</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>3</x:SplitHorizontal>
     <x:TopRowBottomPane>6</x:TopRowBottomPane>
     <x:SplitVertical>1</x:SplitVertical>
     <x:LeftColumnRightPane>1</x:LeftColumnRightPane>
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
       <x:ActiveRow>3</x:ActiveRow>
      </x:Pane>
      <x:Pane>
       <x:Number>0</x:Number>
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
  <x:WindowHeight>9210</x:WindowHeight>
  <x:WindowWidth>17115</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>60</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1028"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1252 style='border-collapse:
 collapse;table-layout:fixed;width:940pt'>
 <col width=145 style='mso-width-source:userset;mso-width-alt:5302;width:109pt'>
 <col width=71 style='mso-width-source:userset;mso-width-alt:2596;width:53pt'>
 <col width=92 style='mso-width-source:userset;mso-width-alt:3364;width:69pt'>
 <col width=99 style='mso-width-source:userset;mso-width-alt:3620;width:74pt'>
 <col width=55 span=2 style='mso-width-source:userset;mso-width-alt:2011;
 width:41pt'>
 <col width=36 style='mso-width-source:userset;mso-width-alt:1316;width:27pt'>
 <col width=30 style='mso-width-source:userset;mso-width-alt:1097;width:23pt'>
 <col width=104 style='mso-width-source:userset;mso-width-alt:1803;width:78pt'>
 <col width=40 style='mso-width-source:userset;mso-width-alt:1462;width:30pt'>
 <col width=76 style='mso-width-source:userset;mso-width-alt:2779;width:57pt'>
 <col width=64 style='width:48pt'>
 <col width=132 style='mso-width-source:userset;mso-width-alt:4827;width:99pt'>
 <col width=32 style='mso-width-source:userset;mso-width-alt:1170;width:24pt'>
 <col width=29 style='mso-width-source:userset;mso-width-alt:1060;width:22pt'>
 <col width=65 style='mso-width-source:userset;mso-width-alt:2377;width:49pt'>
 <col width=93 style='mso-width-source:userset;mso-width-alt:5401;width:70pt'>
 <col width=34 style='mso-width-source:userset;mso-width-alt:1243;width:26pt'>
 <tr height=102 style='mso-height-source:userset;height:76.5pt'>
  <td height=102 width=145 style='height:76.5pt;width:109pt' align=left
  valign=top><!--[if gte vml 1]><v:shapetype id="_x0000_t75" coordsize="21600,21600"
   o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe" filled="f"
   stroked="f">
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
  </v:shapetype><v:shape id="_x0000_s1025" type="#_x0000_t75" style='position:absolute;
   margin-left:3pt;margin-top:3pt;width:102.75pt;height:50.25pt;z-index:1'>
   <v:imagedata src="htfo00010_files/image001.jpg" o:title="AMCO"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:4px;margin-top:4px;width:137px;
  height:67px'><img width=137 height=67 src="htfo00010_files/image001.jpg"
  v:shapes="_x0000_s1025"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=102 width=145 style='height:76.5pt;width:109pt'></td>
   </tr>
  </table>
  </span></td>
  <td colspan=15 class=xl79 width=980 style='width:735pt'
  x:str=" ARRIVING  GUEST  LIST "><span
  style='mso-spacerun:yes'> </span>ARRIVING<span style='mso-spacerun:yes'> 
  </span>GUEST<span style='mso-spacerun:yes'>  </span>LIST<span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=2 height=102 width=127 style='height:76.5pt;width:96pt'
  align=left valign=top><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:2;margin-left:2px;margin-top:4px;width:123px;
  height:96px'><img width=123 height=96 src="htfo00010_files/image003.jpg"
  v:shapes="_x0000_s1027"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=2 height=102 class=xl65 width=127 style='height:76.5pt;
    width:96pt'></td>
   </tr>
  </table>
  </span></td>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td colspan=3 height=18 class=xl66 style='height:13.5pt'>Date:<font
  class="font7"> <%=l_arrival_depart%></font></td>
  <td class=xl70></td>
  <td class=xl68></td>
  <td class=xl71>Total:</td>
  <td colspan=2 class=xl72><%=dt.Rows[dt.Rows.Count-1]["last_name"].ToString()%> Room(s)</td>
  <td colspan=2 class=xl70 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl68 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl69>Print Date :</td>
  <td colspan=2 class=xl78><%=l_print_date%></td>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl75 style='height:13.5pt'>Comapany/ Agent</td>
  <td class=xl76 style='border-left:none'>MKT.Segment</td>
  <td class=xl76 style='border-left:none'>Last Name</td>
  <td class=xl76 style='border-left:none'>First Name</td>
  <td class=xl76 style='border-left:none'>Arrival</td>
  <td class=xl76 style='border-left:none'>Departure</td>
  <td class=xl76 style='border-left:none'>Nite</td>
  <td class=xl76 style='border-left:none'>Rate</td>
  <td class=xl76 style='border-left:none'>RM Type</td>
  <td class=xl76 style='border-left:none'>Room#</td>
  <td class=xl76 style='border-left:none'>Contact</td>
  <td class=xl77 style='border-left:none' x:str="Tele ">Tele<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl76 style='border-left:none'>email</td>
  <td class=xl76 style='border-left:none'>Adult</td>
  <td class=xl76 style='border-left:none'>Child</td>
  <td class=xl76 style='border-left:none'>RSVS</td>
  <td class=xl76 style='border-top:none;border-left:none'>Request</td>
  <td class=xl76 style='border-top:none;border-left:none'>VIP</td>
 </tr>
 <%
	string l_color="";
     for (int i = 0; i < dt.Rows.Count; i++)
     {
		if(dt.Rows[i]["customer_type"].ToString()=="Sub total" || dt.Rows[i]["customer_type"].ToString()=="Total")
		{
			l_color="background:silver";
		}
		else
		{
			l_color="";
		}
		  %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none;<%=l_color%>'><%=dt.Rows[i]["company_name"]%></td>
  <td class=xl74 style='border-top:none;border-left:none;<%=l_color%>'><%=dt.Rows[i]["customer_type"]%></td>
  <td class=xl74 style='border-top:none;border-left:none;<%=l_color%>'><%=dt.Rows[i]["last_name"]%></td>
  <td class=xl74 style='border-top:none;border-left:none;<%=l_color%>'><%=dt.Rows[i]["first_name"]%></td>
  <td class=xl74 style='border-top:none;border-left:none;<%=l_color%>'><%=dt.Rows[i]["from_date"]%></td>
  <td class=xl74 style='border-top:none;border-left:none;<%=l_color%>'><%=dt.Rows[i]["date_to"]%></td>
  <td class=xl74 align=right style='border-top:none;border-left:none;<%=l_color%>' x:num><%=dt.Rows[i]["total_day"]%></td>
  <td class=xl74 align=right style='border-top:none;border-left:none;<%=l_color%>' x:num><%=dt.Rows[i]["room_rate"]%></td>
  <td class=xl74 style='border-top:none;border-left:none;<%=l_color%>'><%=dt.Rows[i]["room_type"]%></td>
  <td class=xl81 style='border-top:none;border-left:none;<%=l_color%>'><%=dt.Rows[i]["room_no"]%></td>
  <td class=xl74 style='border-top:none;border-left:none;<%=l_color%>'><%=dt.Rows[i]["contact_person"]%></td>
  <td class=xl74 style='border-top:none;border-left:none;<%=l_color%>'><%=dt.Rows[i]["phone"]%></td>
  <td class=xl80 style='border-top:none;border-left:none;<%=l_color%>'><%=dt.Rows[i]["email"]%></td>
  <td class=xl82 align=right style='border-top:none;border-left:none;<%=l_color%>' x:num><%=dt.Rows[i]["total_adult"]%></td>
  <td class=xl82 align=right style='border-top:none;border-left:none;<%=l_color%>' x:num><%=dt.Rows[i]["total_child"]%></td>
  <td class=xl74 style='border-top:none;border-left:none;<%=l_color%>'><%=dt.Rows[i]["slip_no"]%></td>
  <td class=xl74 style='border-top:none;border-left:none;<%=l_color%>'><%=dt.Rows[i]["description"]%></td>
  <td class=xl74 style='border-top:none;border-left:none;<%=l_color%>'><%=dt.Rows[i]["vip_type"]%></td>
 </tr>
 <%}%>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=145 style='width:109pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=92 style='width:69pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=36 style='width:27pt'></td>
  <td width=30 style='width:23pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=76 style='width:57pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=132 style='width:99pt'></td>
  <td width=32 style='width:24pt'></td>
  <td width=29 style='width:22pt'></td>
  <td width=65 style='width:49pt'></td>
  <td width=93 style='width:70pt'></td>
  <td width=34 style='width:26pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
