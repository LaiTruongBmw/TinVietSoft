<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%   CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8";
    Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
    string l_fr  = Request.QueryString["p_fr"];
	string l_to  = Request.QueryString["p_to"];
	string l_loc = Request.QueryString["p_loc"];
	string l_pay = Request.QueryString["p_pay"];
    string l_parameter  = "'" + l_fr + "','" + l_to + "','";
		   l_parameter += (l_loc == "0")?"":l_loc;
		   l_parameter += "','";
		   l_parameter += (l_pay == "0")?"":l_pay;
		   l_parameter += "'";
	
    DataTable dtMaster;
    dtMaster = CtlLib.TableReadOpenCursor("ht_rpt_60300010_revenue",l_parameter);
    if (dtMaster.Rows.Count == 0)
    {
        Response.Write("There is no data");
        Response.End();
    }
	
	int l_guest = 0, l_food = 0, l_beverage = 0, l_other = 0, l_svc = 0, l_vat = 0, l_discount = 0, l_total = 0, l_adj = 0, l_cash = 0, l_credit = 0, l_fo = 0, l_debit = 0, l_office = 0, l_enter = 0, l_tran = 0, l_ftotal = 0;
	string 	SQL3	 = "select to_char(sysdate,'dd-Mon-yyyy hh24:mi') print_date ";
			SQL3	+=	",to_char(to_date('"+l_fr+"','yyyyMMdd'),'dd-Mon-yyyy') || ' ~ ' || to_char(to_date('"+l_to+"','yyyyMMdd'),'dd-Mon-yyyy') from_to ";
			SQL3	+=	",(SELECT NAME FROM (SELECT CODE, NAME FROM tco_commcode WHERE PARENT_CODE = 'POINT' and del_if = 0 UNION SELECT '0','ALL' FROM DUAL) X WHERE CODE = '"+l_loc+"') location ";
			SQL3	+=	", DECODE('"+l_pay+"','Y','CASH','N','SEND FO','R','DEBIT','C','CREDIT CARD','ALL') pay ";
			SQL3	+=	"from dual";
    DataTable dt_sysdate = CtlLib.TableReadOpen(SQL3);
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="htrt00090_Revenue_files/filelist.xml">
<link rel=Edit-Time-Data href="htrt00090_Revenue_files/editdata.mso">
<link rel=OLE-Object-Data href="htrt00090_Revenue_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>SVDEMO</o:Author>
  <o:LastAuthor>SVDEMO</o:LastAuthor>
  <o:LastPrinted>2012-03-10T03:29:05Z</o:LastPrinted>
  <o:Created>2012-03-10T02:22:30Z</o:Created>
  <o:LastSaved>2012-03-11T03:10:28Z</o:LastSaved>
  <o:Company>Vina</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.75in .37in .75in .27in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
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
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl26
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";}
.xl27
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;}
.xl28
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl29
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";}
.xl30
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;}
.xl31
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl32
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;}
.xl33
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";}
.xl34
	{mso-style-parent:style0;
	color:#333333;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl35
	{mso-style-parent:style0;
	color:#333333;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:silver;
	mso-pattern:auto none;}
.xl36
	{mso-style-parent:style0;
	color:#333333;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	color:#333333;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:silver;
	mso-pattern:auto none;}
.xl38
	{mso-style-parent:style0;
	color:#333333;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl39
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl40
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl41
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;}
.xl42
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl43
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl44
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Arial Narrow", sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl45
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl46
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
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
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:DoNotDisplayZeros/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>7</x:SplitHorizontal>
     <x:TopRowBottomPane>7</x:TopRowBottomPane>
     <x:SplitVertical>4</x:SplitVertical>
     <x:LeftColumnRightPane>4</x:LeftColumnRightPane>
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
      </x:Pane>
      <x:Pane>
       <x:Number>0</x:Number>
       <x:ActiveRow>14</x:ActiveRow>
       <x:ActiveCol>5</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
     <x:EnableSelection>NoSelection</x:EnableSelection>
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
  <x:WindowHeight>9855</x:WindowHeight>
  <x:WindowWidth>15180</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>45</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$1:$7</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1792 style='border-collapse:
 collapse;table-layout:fixed;width:1350pt'>
 <col class=xl25 width=35 style='mso-width-source:userset;mso-width-alt:1280;
 width:26pt'>
 <col class=xl25 width=79 span=2 style='mso-width-source:userset;mso-width-alt:
 2889;width:59pt'>
 <col class=xl24 width=34 style='mso-width-source:userset;mso-width-alt:1243;
 width:26pt'>
 <col class=xl24 width=78 style='mso-width-source:userset;mso-width-alt:2852;
 width:59pt'>
 <col class=xl24 width=76 span=2 style='mso-width-source:userset;mso-width-alt:
 2779;width:57pt'>
 <col class=xl24 width=78 style='mso-width-source:userset;mso-width-alt:2852;
 width:59pt'>
 <col class=xl24 width=77 style='mso-width-source:userset;mso-width-alt:2816;
 width:58pt'>
 <col class=xl24 width=76 style='mso-width-source:userset;mso-width-alt:2779;
 width:57pt'>
 <col class=xl24 width=86 span=3 style='mso-width-source:userset;mso-width-alt:
 3145;width:65pt'>
 <col class=xl24 width=85 style='mso-width-source:userset;mso-width-alt:3108;
 width:64pt'>
 <col class=xl24 width=86 span=6 style='mso-width-source:userset;mso-width-alt:
 3145;width:65pt'>
 <col class=xl24 width=245 style='mso-width-source:userset;mso-width-alt:8960;
 width:184pt'>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 width=35 style='height:12.75pt;width:26pt' align=left
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
   margin-left:6.75pt;margin-top:4.5pt;width:75pt;height:63.75pt;z-index:1'>
   <v:imagedata src="htrt00090_Revenue_files/image001.jpg" o:title="lotusmuine"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:9px;margin-top:6px;width:100px;
  height:85px'><img width=100 height=85
  src="htrt00090_Revenue_files/image002.jpg" v:shapes="_x0000_s1025"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=17 class=xl25 width=35 style='height:12.75pt;width:26pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl25 width=79 style='width:59pt'></td>
  <td class=xl25 width=79 style='width:59pt'></td>
  <td colspan=18 rowspan=2 class=xl44 width=1599 style='width:1206pt'>F&amp;B
  Revenue Report</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 colspan=3 class=xl25 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=3 class=xl25 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=18 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 colspan=3 class=xl25 style='height:16.5pt;mso-ignore:colspan'></td>
  <td colspan=4 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl30 x:str="From : ">From :<span style='mso-spacerun:yes'> </span></td>
  <td class=xl24 colspan=3 style='mso-ignore:colspan'><%=dt_sysdate.Rows[0][1]%></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl30 x:str="Print Date : ">Print Date :<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl26><%=dt_sysdate.Rows[0][0]%></td>
  <td colspan=2 class=xl26 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 colspan=3 class=xl25 style='height:16.5pt;mso-ignore:colspan'></td>
  <td colspan=4 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl30 x:str="Location : ">Location :<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl24 colspan=3 style='mso-ignore:colspan'><%=dt_sysdate.Rows[0][2]%></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl30 x:str="Payment Method : ">Payment Method :<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl24><%=dt_sysdate.Rows[0][3]%></td>
  <td colspan=6 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=10 style='mso-height-source:userset;height:7.5pt'>
  <td height=10 colspan=3 class=xl25 style='height:7.5pt;mso-ignore:colspan'></td>
  <td colspan=18 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl34 style='height:21.0pt'>No#</td>
  <td class=xl35>Invoice No</td>
  <td class=xl35>Invoice Date</td>
  <td class=xl37>Guest</td>
  <td class=xl35>Food</td>
  <td class=xl35>Beverage</td>
  <td class=xl35>Other</td>
  <td class=xl35>SVC</td>
  <td class=xl35>VAT</td>
  <td class=xl35>Discount</td>
  <td class=xl35>Total</td>
  <td class=xl35>Adjust</td>
  <td class=xl35>Cash</td>
  <td class=xl36 width=85 style='width:64pt'>Credit <br>
    Card</td>
  <td class=xl36 width=86 style='width:65pt'>Front <br>
    Office</td>
  <td class=xl36 width=86 style='width:65pt'>Debit</td>
  <td class=xl36 width=86 style='width:65pt'>Office<br>
    Check</td>
  <td class=xl36 width=86 style='width:65pt'>Enter<br>
    tainment</td>
  <td class=xl36 width=86 style='width:65pt'>Transfer</td>
  <td class=xl36 width=86 style='width:65pt'>Total<br>
    Bill</td>
  <td class=xl38>Guest Name</td>
 </tr>
 <%for (int x = 0; x < dtMaster.Rows.Count; x++){
	l_guest 	+= int.Parse(dtMaster.Rows[x][3].ToString());
	l_food  	+= int.Parse(dtMaster.Rows[x][4].ToString());
	l_beverage	+= int.Parse(dtMaster.Rows[x][5].ToString());
	l_other		+= int.Parse(dtMaster.Rows[x][6].ToString());
	l_svc		+= int.Parse(dtMaster.Rows[x][7].ToString());
	l_vat		+= int.Parse(dtMaster.Rows[x][8].ToString());
	l_discount	+= int.Parse(dtMaster.Rows[x][9].ToString());
	l_total		+= int.Parse(dtMaster.Rows[x][10].ToString());
	l_adj		+= int.Parse(dtMaster.Rows[x][11].ToString());
	l_cash		+= int.Parse(dtMaster.Rows[x][14].ToString());
	l_credit	+= int.Parse(dtMaster.Rows[x][15].ToString());
	l_fo		+= int.Parse(dtMaster.Rows[x][16].ToString());
	l_debit		+= int.Parse(dtMaster.Rows[x][18].ToString());
	l_office	+= int.Parse(dtMaster.Rows[x][19].ToString());
	l_enter		+= int.Parse(dtMaster.Rows[x][20].ToString());
	l_tran		+= int.Parse(dtMaster.Rows[x][21].ToString());
	l_ftotal	+= int.Parse(dtMaster.Rows[x][22].ToString());
 %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl31 style='height:12.75pt' x:num><%=dtMaster.Rows[x][0]%></td>
  <td class=xl32><%=dtMaster.Rows[x][1]%></td>
  <td class=xl32><%=dtMaster.Rows[x][2]%></td>
  <td class=xl42 align=right x:num><%=dtMaster.Rows[x][3]%></td>
  <td class=xl33 align=right x:num><%=dtMaster.Rows[x][4]%></td>
  <td class=xl33 align=right x:num><%=dtMaster.Rows[x][5]%></td>
  <td class=xl33 align=right x:num><%=dtMaster.Rows[x][6]%></td>
  <td class=xl33 align=right x:num><%=dtMaster.Rows[x][7]%></td>
  <td class=xl33 align=right x:num><%=dtMaster.Rows[x][8]%></td>
  <td class=xl33 align=right x:num><%=dtMaster.Rows[x][9]%></td>
  <td class=xl33 align=right x:num><%=dtMaster.Rows[x][10]%></td>
  <td class=xl33 align=right x:num><%=dtMaster.Rows[x][11]%></td>
  <td class=xl33 align=right x:num><%=dtMaster.Rows[x][14]%></td>
  <td class=xl33 align=right x:num><%=dtMaster.Rows[x][15]%></td>
  <td class=xl33 align=right x:num><%=dtMaster.Rows[x][16]%></td>
  <td class=xl33 align=right x:num><%=dtMaster.Rows[x][18]%></td>
  <td class=xl33 align=right x:num><%=dtMaster.Rows[x][19]%></td>
  <td class=xl33 align=right x:num><%=dtMaster.Rows[x][20]%></td>
  <td class=xl33 align=right x:num><%=dtMaster.Rows[x][21]%></td>
  <td class=xl33 align=right x:num><%=dtMaster.Rows[x][22]%></td>
  <td class=xl39><%=dtMaster.Rows[x][23]%></td>
 </tr>
 <%}%>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td colspan=3 height=19 class=xl45 style='height:14.25pt'>Total</td>
  <td class=xl43 align=right x:num><%=l_guest %></td>
  <td class=xl40 align=right x:num><%=l_food %></td>
  <td class=xl40 align=right x:num><%=l_beverage %></td>
  <td class=xl40 align=right x:num><%=l_other %></td>
  <td class=xl40 align=right x:num><%=l_svc %></td>
  <td class=xl40 align=right x:num><%=l_vat %></td>
  <td class=xl40 align=right x:num><%=l_discount %></td>
  <td class=xl40 align=right x:num><%=l_total %></td>
  <td class=xl40 align=right x:num><%=l_adj %></td>
  <td class=xl40 align=right x:num><%=l_cash %></td>
  <td class=xl40 align=right x:num><%=l_credit %></td>
  <td class=xl40 align=right x:num><%=l_fo %></td>
  <td class=xl40 align=right x:num><%=l_debit %></td>
  <td class=xl40 align=right x:num><%=l_office %></td>
  <td class=xl40 align=right x:num><%=l_enter %></td>
  <td class=xl40 align=right x:num><%=l_tran %></td>
  <td class=xl40 align=right x:num><%=l_ftotal %></td>
  <td class=xl41>&nbsp;</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl25 style='height:12.75pt'></td>
  <td colspan=2 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=17 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=35 style='width:26pt'></td>
  <td width=79 style='width:59pt'></td>
  <td width=79 style='width:59pt'></td>
  <td width=34 style='width:26pt'></td>
  <td width=78 style='width:59pt'></td>
  <td width=76 style='width:57pt'></td>
  <td width=76 style='width:57pt'></td>
  <td width=78 style='width:59pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=76 style='width:57pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=85 style='width:64pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=245 style='width:184pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
