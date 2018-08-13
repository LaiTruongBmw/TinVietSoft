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
	string l_month="",l_parameter="",month="",l_crt_by;
	l_month =Request["p_month"];
	l_crt_by =Request["p_crt_by"];
	l_parameter = "'" + l_month + "','" + l_crt_by + "'";
    DataTable dt = CtlLib.TableReadOpenCursor("rpt_60280060", l_parameter);
    if (dt.Rows.Count == 0)
    {
        Response.Write("There is no data");
        Response.End();
    }
	string l_print_date="";
    string SQL3 = "select to_char(sysdate,'dd-Mon-yyyy hh24:mi') print_date from dual";
    DataTable dt_sysdate = CtlLib.TableReadOpen(SQL3);
    if (dt_sysdate.Rows.Count > 0)
    {
        l_print_date = dt_sysdate.Rows[0][0].ToString();
    }
    month=l_month.Substring(4,2)+"/"+l_month.Substring(0,4);
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_htfo00390_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_htfo00390_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_htfo00390_files/oledata.mso">
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
  <o:LastPrinted>2011-06-10T04:45:49Z</o:LastPrinted>
  <o:Created>2011-06-10T04:09:30Z</o:Created>
  <o:LastSaved>2011-06-10T04:46:08Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"&CPage &P";
	margin:.41in .12in .06in .19in;
	mso-header-margin:.43in;
	mso-footer-margin:.06in;
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
	color:blue;
	font-family:"Courier New", monospace;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	border:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#33CCCC;
	mso-pattern:auto none;}
.xl30
	{mso-style-parent:style0;
	text-align:center;}
.xl31
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl32
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl33
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl34
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl35
	{mso-style-parent:style0;
	color:red;
	font-size:20.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl36
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;}
.xl37
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;}
.xl38
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl39
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
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
      <x:Scale>66</x:Scale>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>3</x:SplitHorizontal>
     <x:TopRowBottomPane>3</x:TopRowBottomPane>
     <x:SplitVertical>11</x:SplitVertical>
     <x:LeftColumnRightPane>17</x:LeftColumnRightPane>
     <x:ActivePane>0</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>1</x:Number>
       <x:ActiveCol>11</x:ActiveCol>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>0</x:Number>
       <x:ActiveRow>2</x:ActiveRow>
       <x:ActiveCol>24</x:ActiveCol>
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
  <x:WindowHeight>9210</x:WindowHeight>
  <x:WindowWidth>17115</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>60</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$1:$3</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1027"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1943 style='border-collapse:
 collapse;table-layout:fixed;width:1463pt'>
 <col width=65 style='mso-width-source:userset;mso-width-alt:2377;width:49pt'>
 <col width=70 style='mso-width-source:userset;mso-width-alt:2560;width:53pt'>
 <col width=89 style='mso-width-source:userset;mso-width-alt:3254;width:67pt'>
 <col width=74 style='mso-width-source:userset;mso-width-alt:2706;width:56pt'>
 <col width=72 style='mso-width-source:userset;mso-width-alt:2633;width:54pt'>
 <col width=66 style='mso-width-source:userset;mso-width-alt:2413;width:50pt'>
 <col width=65 style='mso-width-source:userset;mso-width-alt:2377;width:49pt'>
 <col width=81 style='mso-width-source:userset;mso-width-alt:2962;width:61pt'>
 <col width=66 style='mso-width-source:userset;mso-width-alt:2413;width:50pt'>
 <col width=58 style='mso-width-source:userset;mso-width-alt:2121;width:44pt'>
 <col width=69 style='mso-width-source:userset;mso-width-alt:2523;width:52pt'>
 <col width=81 style='mso-width-source:userset;mso-width-alt:2962;width:61pt'>
 <col width=66 style='mso-width-source:userset;mso-width-alt:2413;width:50pt'>
 <col width=62 style='mso-width-source:userset;mso-width-alt:2267;width:47pt'>
 <col width=75 style='mso-width-source:userset;mso-width-alt:2742;width:56pt'>
 <col width=77 style='mso-width-source:userset;mso-width-alt:2816;width:58pt'>
 <col width=78 style='mso-width-source:userset;mso-width-alt:2852;width:59pt'>
 <col width=64 style='mso-width-source:userset;mso-width-alt:2340;width:48pt'>
 <col width=59 style='mso-width-source:userset;mso-width-alt:2157;width:44pt'>
 <col width=73 style='mso-width-source:userset;mso-width-alt:2669;width:55pt'>
 <col width=65 style='mso-width-source:userset;mso-width-alt:2377;width:49pt'>
 <col width=84 style='mso-width-source:userset;mso-width-alt:3072;width:63pt'>
 <col width=64 span=6 style='width:48pt'>
 <tr height=92 style='mso-height-source:userset;height:69.0pt'>
  <td colspan=3 height=92 width=224 style='height:69.0pt;width:169pt'
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
  </v:shapetype><v:shape id="_x0000_s1025" type="#_x0000_t75" style='position:absolute;
   margin-left:2.25pt;margin-top:3pt;width:135.75pt;height:57.75pt;z-index:1'>
   <v:imagedata src="rpt_htfo00390_files/image001.jpg" o:title="AMCO"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:3px;margin-top:4px;width:181px;
  height:77px'><img width=181 height=77 src="rpt_htfo00390_files/image002.jpg"
  v:shapes="_x0000_s1025"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=3 height=92 class=xl30 width=224 style='height:69.0pt;
    width:169pt'></td>
   </tr>
  </table>
  </span></td>
  <td colspan=17 class=xl35 width=1186 style='width:894pt'>INVOICE<span
  style='mso-spacerun:yes'>  </span>LIST</td>
  <td colspan=2 height=92 width=149 style='height:69.0pt;width:112pt'
  align=left valign=top><!--[if gte vml 1]><v:shape id="_x0000_s1026" type="#_x0000_t75"
   style='position:absolute;margin-left:2.25pt;margin-top:2.25pt;width:108pt;
   height:65.25pt;z-index:2'>
   <v:imagedata src="rpt_htfo00390_files/image003.png" o:title="Songgia"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:2;margin-left:3px;margin-top:3px;width:144px;
  height:87px'><img width=144 height=87 src="rpt_htfo00390_files/image004.jpg"
  v:shapes="_x0000_s1026"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=2 height=92 class=xl30 width=149 style='height:69.0pt;
    width:112pt'></td>
   </tr>
  </table>
  </span></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl37 style='height:16.5pt'>Month:</td>
  <td class=xl36><%=month%></td>
  <td colspan=6 style='mso-ignore:colspan'></td>
  <td colspan=1 style='mso-ignore:colspan'><b>Total:</b></td>
  <td colspan=3 style='mso-ignore:colspan'><%=dt.Rows.Count%>&nbsp;&nbsp;&nbsp;Row(s).</td>
  <td colspan=6 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl39>Print Date:</td>
  <td colspan=2 class=xl38><%=l_print_date%></td>
  <td colspan=6 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl29 style='height:18.75pt'>
  <div style='text-indent:-.5em'>Invoice#</div>
  </td>
  <td class=xl29 style='border-left:none'>Invoice Date</td>
  <td class=xl29 style='border-left:none'>Create By</td>
  <td class=xl29 style='border-left:none'>Room Fee</td>
  <td class=xl29 style='border-left:none'>Laundry Fee</td>
  <td class=xl29 style='border-left:none'>FnB Fee</td>
  <td class=xl29 style='border-left:none'>Green Fee</td>
  <td class=xl29 style='border-left:none'>Facility Fee</td>
  <td class=xl29 style='border-left:none'>Caddie Fee</td>
  <td class=xl29 style='border-left:none'>Cart Fee</td>
  <td class=xl29 style='border-left:none'>Proshop Fee</td>
  <td class=xl29 style='border-left:none'>Drv Range Fee</td>
  <td class=xl29 style='border-left:none'>Rental Fee</td>
  <td class=xl29 style='border-left:none'>Tennis Fee</td>
  <td class=xl29 style='border-left:none'>Teaching Fee</td>
  <td class=xl29 style='border-left:none'>Member Fee</td>
  <td class=xl29 style='border-left:none'>Telephone Fee</td>
  <td class=xl29 style='border-left:none'>Other Fee</td>
  <td class=xl29 style='border-top:none;border-left:none'>Services</td>
  <td class=xl29 style='border-top:none;border-left:none'>SCT</td>
  <td class=xl29 style='border-top:none;border-left:none'>VAT</td>
  <td class=xl29 style='border-top:none;border-left:none'>Total</td>
  <td colspan=6 style='mso-ignore:colspan'></td>
 </tr>
 <%
	decimal room_fee=0,laundry_fee=0,fnd_fee=0,green_fee=0,facility_fee=0,caddie_fee=0,cart_fee=0,proshop_fee=0,
		drv_range_fee=0,rental_fee=0,tennis_fee=0,teaching_fee=0,member_fee=0,telephone_fee=0,other_fee=0,svc=0,sct=0,vat=0,total=0 ;
     for (int i = 0; i < dt.Rows.Count; i++)
     {
         if(dt.Rows[i][3].ToString() != "")
		 {
            room_fee += decimal.Parse(dt.Rows[i][3].ToString()) ;
         } 
		 if(dt.Rows[i][4].ToString() != "")
         {
            laundry_fee += decimal.Parse(dt.Rows[i][4].ToString()) ;
         } 
		 if(dt.Rows[i][5].ToString() != "")
         {
            fnd_fee += decimal.Parse(dt.Rows[i][5].ToString()) ;
         } 
		 if(dt.Rows[i][6].ToString() != "")
         {
            green_fee += decimal.Parse(dt.Rows[i][6].ToString()) ;
         } 
		 if(dt.Rows[i][7].ToString() != "")
         {
            facility_fee += decimal.Parse(dt.Rows[i][7].ToString()) ;
         } 
		 if(dt.Rows[i][8].ToString() != "")
         {
            caddie_fee += decimal.Parse(dt.Rows[i][8].ToString()) ;
         } 
		 if(dt.Rows[i][9].ToString() != "")
         {
            cart_fee += decimal.Parse(dt.Rows[i][9].ToString()) ;
         } 
		 if(dt.Rows[i][10].ToString() != "")
         {
            proshop_fee += decimal.Parse(dt.Rows[i][10].ToString()) ;
         } 
		
		 if(dt.Rows[i][11].ToString() != "")
         {
            drv_range_fee += decimal.Parse(dt.Rows[i][11].ToString()) ;
         } 
		 if(dt.Rows[i][12].ToString() != "")
         {
            rental_fee += decimal.Parse(dt.Rows[i][12].ToString()) ;
         } 
		 if(dt.Rows[i][13].ToString() != "")
         {
            tennis_fee += decimal.Parse(dt.Rows[i][13].ToString()) ;
         } 
		 if(dt.Rows[i][14].ToString() != "")
         {
            teaching_fee += decimal.Parse(dt.Rows[i][14].ToString()) ;
         } 
		 if(dt.Rows[i][15].ToString() != "")
         {
            member_fee += decimal.Parse(dt.Rows[i][15].ToString()) ;
         } 
		 if(dt.Rows[i][16].ToString() != "")
         {
            telephone_fee += decimal.Parse(dt.Rows[i][16].ToString()) ;
         } 
		 if(dt.Rows[i][17].ToString() != "")
         {
            other_fee += decimal.Parse(dt.Rows[i][17].ToString()) ;
         } 
		 if(dt.Rows[i][18].ToString() != "")
         {
            svc += decimal.Parse(dt.Rows[i][18].ToString()) ;
         } 
		 if(dt.Rows[i][19].ToString() != "")
         {
            sct += decimal.Parse(dt.Rows[i][19].ToString()) ;
         } 
		 if(dt.Rows[i][20].ToString() != "")
         {
            vat += decimal.Parse(dt.Rows[i][20].ToString()) ;
         } 
		 if(dt.Rows[i][21].ToString() != "")
         {
            total += decimal.Parse(dt.Rows[i][21].ToString()) ;
         } 
		 
          %>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl26 style='height:12.75pt;border-top:none' x:str><%=dt.Rows[i][0]%></td>
  <td class=xl26 style='border-top:none;border-left:none' x:str><%=dt.Rows[i][1]%></td>
  <td class=xl27 style='border-top:none;border-left:none'><%=dt.Rows[i][2]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][3]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][4]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][5]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][6]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][7]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][8]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][9]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][10]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][11]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][12]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][13]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][14]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][15]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][16]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][17]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][18]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][19]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][20]%></td>
  <td class=xl28 align=right style='border-top:none;border-left:none'
  x:num><%=dt.Rows[i][21]%></td>
  <td colspan=6 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <%}%>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=3 height=25 class=xl31 style='border-right:.5pt solid black;
  height:18.75pt'>Total:</td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=room_fee%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=laundry_fee%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=fnd_fee%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=green_fee%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=facility_fee%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=caddie_fee%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=cart_fee%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=proshop_fee%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=drv_range_fee%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=rental_fee%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=tennis_fee%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=teaching_fee%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=member_fee%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=telephone_fee%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=other_fee%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=svc%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=sct%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=vat%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=total%></td>
  <td colspan=6 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=85 style='height:63.75pt;mso-xlrowspan:5'>
  <td height=85 colspan=28 style='height:63.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=5 style='height:12.75pt;mso-ignore:colspan'></td>
  <td class=xl25></td>
  <td colspan=22 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=65 style='width:49pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=74 style='width:56pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=66 style='width:50pt'></td>
  <td width=65 style='width:49pt'></td>
  <td width=81 style='width:61pt'></td>
  <td width=66 style='width:50pt'></td>
  <td width=58 style='width:44pt'></td>
  <td width=69 style='width:52pt'></td>
  <td width=81 style='width:61pt'></td>
  <td width=66 style='width:50pt'></td>
  <td width=62 style='width:47pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=78 style='width:59pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=59 style='width:44pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=65 style='width:49pt'></td>
  <td width=84 style='width:63pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
