<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>

<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
     string poPK = "";
    poPK = "" + Request["req_pk"];
    string SQL
	= "SELECT a.req_no, TO_CHAR (TO_DATE (a.doc_date, 'YYYYMMDD'), 'Mon. dd, YYYY'), " + 
        "       '*W' || a.req_no || '*', a.po_no, " +
        "       TO_CHAR (TO_DATE (a.po_date, 'YYYYMMDD'), 'Mon. dd, YYYY'), " +
        "       b.partner_name, NVL (a.addr, b.addr1), NVL (a.phone_no, b.phone_no), " +
        "       NVL (a.fax_no, b.fax_no), a.receiver, a.struck_no, c.loc_nm, " +
        "       TO_CHAR (TO_DATE (a.takeout_date, 'YYYYMMDD'), 'Mon. dd, YYYY') , initcap(d.FULL_NAME), a.delivery_to " +
        "  FROM sale.tsa_sotakeoutreq a, comm.tco_buspartner b, comm.tco_partnerloc c , hr.thr_employee d " +
        " WHERE a.del_if = 0 " +
        "   AND b.del_if = 0 " +
        "   AND a.tco_buspartner_pk = b.pk " +
        "   AND c.del_if = 0 " +
        "   AND a.tco_partnerloc_pk = c.pk " +
        "   AND d.del_if = 0  and a.REQ_EMP_PK = d.pk " +
        "  and a.PK =  " +poPK ;
    DataTable dt = CtlLib.TableReadOpen(SQL);
   
  
   
    string SQL1
	= "select b.ITEM_NAME, " + 
        "sale.sf_get_dsbs00013_2 (4, a.tco_item_pk) thick, " +
        "sale.sf_get_dsbs00013_2 (5, a.tco_item_pk) width, " +
        "sale.sf_get_dsbs00013_2 (6, a.tco_item_pk) leng, " +
        "att09 roll, a.REQ_QTY " +
        "from sale.tsa_sotakeoutreqd a ,comm.tco_stitem  b, comm.tco_item c " +
        "where a.DEL_IF =0 and b.DEL_IF =0 and c.DEL_IF=0 " +
        "and a.TCO_ITEM_PK = c.PK " +
        "and c.TCO_STITEM_PK = b.PK " +
        "and a.TSA_SOTAKEOUTREQ_PK =  " +poPK ;
      DataTable dt1 = CtlLib.TableReadOpen(SQL1);

%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="dscd00020_YC_files/filelist.xml">
<link rel=Edit-Time-Data href="dscd00020_YC_files/editdata.mso">
<link rel=OLE-Object-Data href="dscd00020_YC_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>tuyen</o:LastAuthor>
  <o:LastPrinted>2009-04-13T11:34:44Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2009-04-13T11:35:21Z</o:LastSaved>
  <o:Version>11.6360</o:Version>
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
.font10
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
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
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl30
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl31
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl32
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl33
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl34
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl37
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl38
	{mso-style-parent:style0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl41
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl42
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl43
	{mso-style-parent:style0;}
.xl44
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.xl45
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-family:"Code39\(2\:3\)", sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
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
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>8</x:ActiveRow>
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
    
     <x:PageBreaks>
     <x:RowBreaks>
     <% 
        int dem=0;
        for(int y = 0; y < dt1.Rows.Count; y++)
        {
            dem = dem +1;
            if(dem % 17==0)
            {
                dem = dem + 12;
             %>	 
	            <x:RowBreak>
                 <x:Row> <%=dem%> </x:Row>
                </x:RowBreak>
	        <% 
            }
        }
     %>
    </x:RowBreaks>
    </x:PageBreaks>
    
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
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1026"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=650 style='border-collapse:
 collapse;table-layout:fixed;width:489pt'>
<col width=41 style='mso-width-source:userset;mso-width-alt:1499;width:31pt'>
 <col width=173 style='mso-width-source:userset;mso-width-alt:6326;width:130pt'>
 <col width=191 style='mso-width-source:userset;mso-width-alt:6985;width:143pt'>
 <col width=99 style='mso-width-source:userset;mso-width-alt:3620;width:74pt'>
 <col width=119 style='mso-width-source:userset;mso-width-alt:4352;width:89pt'>
 <col width=78 style='mso-width-source:userset;mso-width-alt:2852;width:59pt'>
 <% if (dt1.Rows.Count > 0)
    {
        double sumRoll = 0, sumQty = 0;
        int count = 0;
        for (int i = 0; i < dt1.Rows.Count; i++)
        {
            sumRoll = sumRoll + double.Parse(dt1.Rows[i][4].ToString());
            sumQty = sumQty + double.Parse(dt1.Rows[i][5].ToString());
            if (i == 0 || count % 17 == 0)
            {
            
 %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 width=41 style='height:12.75pt;width:31pt' align=left
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
   margin-left:0;margin-top:0;width:143.25pt;height:24pt;z-index:1'>
   <v:imagedata src="dscd00020_YC_files/image001.emz" o:title=""/>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:0px;margin-top:0px;width:191px;
  height:32px'><img width=191 height=32 src="dscd00020_YC_files/image002.gif"
  v:shapes="_x0000_s1025"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=17 width=41 style='height:12.75pt;width:31pt'></td>
   </tr>
  </table>
  </span></td>
  <td width=146 style='width:110pt'></td>
  <td width=151 style='width:113pt'></td>
  <td class=xl24 colspan=3 width=312 style='mso-ignore:colspan;width:235pt'>OUT OF WAREHOUSE REQUEST</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=3 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=2 style='mso-ignore:colspan'>No. : <%=dt.Rows[0][0].ToString()%></td>
  <td></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=3 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=2 style='mso-ignore:colspan'>Date : <%=dt.Rows[0][1].ToString()%></td>
  <td></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=2 style='height:12.75pt;mso-ignore:colspan'>Purchase
  Order no.: <%=dt.Rows[0][3].ToString()%></td>
  <td>Dated : <%=dt.Rows[0][4].ToString()%></td>
  <td colspan=2 style='mso-ignore:colspan'>Page : <%=(count / 17) + 1%>/<%=((dt1.Rows.Count + 1) / 17) + 1%></td>
  <td></td>
 </tr>
 <tr  style='height:14.5pt'>
  <td  colspan=2 style='height:12.75pt;mso-ignore:colspan'>Customer  name : <%=dt.Rows[0][5].ToString()%></td>
  <td style='height:14.5pt'></td>
  <td colspan="2" rowspan="2" class="xl45" style='height:14.5pt'> <%=dt.Rows[0][2].ToString()%> </td>
 </tr>
 <tr style='height:14.5pt'>
  <td  style='height:14.5pt' >Add :</td>
  <td   style='height:14.5pt'><%=dt.Rows[0][6].ToString()%></td>
  <td   style='height:14.5pt'></td>
  <td  style='height:14.5pt'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=3 style='height:12.75pt;mso-ignore:colspan'>Tel : <%=dt.Rows[0][7].ToString()%>  Fax :<%=dt.Rows[0][8].ToString()%></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=2 style='height:12.75pt;mso-ignore:colspan'>Delivery to
  : <%=dt.Rows[0][14].ToString()%></td>
  <td colspan=4 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21  colspan=3 style='height:15.75pt;mso-ignore:colspan'
  >Ng&#432;&#7901;i nh&#7853;n/Receiver :<%=dt.Rows[0][9].ToString()%></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=6  style='height:15.75pt'>S&#7889; xe/Struck No: <%=dt.Rows[0][10].ToString()%></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl26 style='height:15.75pt'
  x:str="  No.                                   "><span
  style='mso-spacerun:yes'>  </span>No.<span style='mso-spacerun:yes'>  </span><span
  style='display:none'><span
  style='mso-spacerun:yes'>                                 </span></span></td>
  <td class=xl27 style='border-left:none'>Type of Product</td>
  <td class=xl27 style='border-left:none'>Specification</td>
  <td colspan=2 class=xl28 style='border-right:.5pt solid black;border-left:
  none'>Qunatity/ S&#7889; l&#432;&#7907;ng</td>
  <td></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl30 style='height:12.75pt'>STT</td>
  <td class=xl31 style='border-left:none'>Lo&#7841;i h&#224;ng</td>
  <td class=xl31 style='border-left:none'>Quy c&#225;ch</td>
  <td class=xl32 style='border-left:none'>Roll</td>
  <td class=xl32 style='border-left:none'>Kg</td>
  <td></td>
 </tr>
 <% 
    
     }
 %>
 <tr height=39 style='mso-height-source:userset;height:29.25pt'>
  <td height=39 class=xl33 style='height:29.25pt' x:num><%=i + 1%></td>
  <td class=xl34 width=146 style='border-top:none;border-left:none;width:110pt'><%=dt1.Rows[i][0].ToString()%></td>
  <td class=xl35 width=151 style='border-top:none;border-left:none;width:113pt'><%=dt1.Rows[i][1].ToString() + "mic-" + dt1.Rows[i][2].ToString() + "mm-" + dt1.Rows[i][3].ToString() + "m"%></td>
  <td class=xl36 style='border-top:none;border-left:none' x:num ><%=dt1.Rows[i][4].ToString()%></td>
  <td class=xl37 style='border-top:none;border-left:none' x:num ><%=dt1.Rows[i][5].ToString()%></td>
  <td></td>
 </tr>
 <%  
     count = count + 1;
 } //for

 string SQL2
 = "select  initcap(code_nm) " +
     "                   from sale.lg_code a, sale.lg_code_group b " +
     "                  where a.lg_code_group_pk = b.pk and a.use_if = 'Y' and a.del_if = 0 " +
     "                        and b.del_if = 0 and a.CODE='MKT1' and b.GROUP_ID='LGCM0010' ";

 DataTable dt2 = CtlLib.TableReadOpen(SQL2);

 string SQL3
= "select  initcap(code_nm) " +
    "                   from sale.lg_code a, sale.lg_code_group b " +
    "                  where a.lg_code_group_pk = b.pk and a.use_if = 'Y' and a.del_if = 0 " +
    "                        and b.del_if = 0 and a.CODE='FAC1' and b.GROUP_ID='LGCM0010' ";

 DataTable dt3 = CtlLib.TableReadOpen(SQL3);
              
 %>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl38 width=41 style='height:21.75pt;border-top:none;
  width:31pt'>&nbsp;</td>
  <td class=xl39 width=146 style='border-top:none;width:110pt'
  >Total/ T&#7893;ng c&#7897;ng :</td>
  <td class=xl40 width=151 style='border-top:none;border-left:none;width:113pt'>&nbsp;</td>
  <td class=xl41 width=109 style='border-top:none;border-left:none;width:82pt'
  x:num ><%=sumRoll%></td>
  <td class=xl41 width=125 style='border-top:none;border-left:none;width:94pt'
  x:num ><%=sumQty%></td>
  <td></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=6 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl42 colspan=2 style='height:15.0pt;mso-ignore:colspan'>Th&#7901;i gian giao h&#224;ng : <%=dt.Rows[0][12].ToString()%></td>
  <td class=xl43></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl42 colspan=3 style='height:12.75pt;mso-ignore:colspan'>Delivery
  time:<%=dt.Rows[0][12].ToString()%></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl42 colspan=3 style='height:12.75pt;mso-ignore:colspan'>&#272;&#7883;a &#273;i&#7875;m giao h&#224;ng : Nh&#224; m&#225;y YCC VINA</td>
  <td class=xl42></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl42 colspan=3 style='height:12.75pt;mso-ignore:colspan'>Delivery
  place :YCC VINA FACTORY</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21  style='height:15.75pt'></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
    <td height=19 class=xl44 colspan=2 style='height:14.25pt;mso-ignore:colspan'>Ng&#432;&#7901;i l&#7853;p</td>
  <td class=xl43>Gi&#225;m &#273;&#7889;c Marketing</td>
  <td class=xl44 ></td>
  <td class=xl44>Gi&#225;m &#273;&#7889;c nh&#224; m&#225;y</td>
  <td></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl44 colspan=2 style='height:14.25pt;mso-ignore:colspan'>Prepared
  by</td>
  <td class=xl43>Marketing Manager</td>
  <td class=xl44 ></td>
  <td class=xl44>Factory Manager</td>
  <td></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl44 colspan=3 style='height:14.25pt;mso-ignore:colspan'><font class="font10"></font></td>
  <td colspan=2 class=xl43 style='mso-ignore:colspan'></td>
  <td></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl42 style='height:12.75pt'></td>
  <td colspan=4 class=xl43 style='mso-ignore:colspan'></td>
  <td></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl42 style='height:12.75pt'></td>
  <td colspan=4 class=xl43 style='mso-ignore:colspan'></td>
  <td></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
      <td height=19 class=xl44 colspan=2 style='height:14.25pt;mso-ignore:colspan'><%=dt.Rows[0][13].ToString()%></td>
      <%
        string maket_mana =""; 
        if (dt2.Rows.Count > 0)
         {
             maket_mana = dt2.Rows[0][0].ToString();
         }
       %>
      <td class=xl43><%=maket_mana%></td>
      <td class=xl44 ></td>
       <%
        string fac_mana =""; 
        if (dt3.Rows.Count > 0)
         {
             fac_mana = dt3.Rows[0][0].ToString();
         }
       %>
      <td class=xl44><%=fac_mana %></td>
      <td></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21  style='height:15.75pt'></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21  style='height:15.75pt'></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <%
    }
 %>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=41 style='width:31pt'></td>
  <td width=146 style='width:110pt'></td>
  <td width=151 style='width:113pt'></td>
  <td width=109 style='width:82pt'></td>
  <td width=125 style='width:94pt'></td>
  <td width=78 style='width:59pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
