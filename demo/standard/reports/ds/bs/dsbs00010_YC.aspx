<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html 
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<% 
    string poPK = "";
    poPK = "" + Request["sopk"];
    string SQL
    = " SELECT a.SLIP_NO,a.PO_NO,TO_CHAR (TO_DATE (order_dt, 'YYYYMMDD'), 'Mon. dd, YYYY'), to_char(sysdate,'Mon. dd, YYYY'), " +
        "       b.partner_name, b.ADDR1,b.PHONE_NO,b.FAX_NO,a.att03 ,TO_CHAR(TO_DATE (a.PO_date, 'YYYYMMDD'), 'Mon. dd, YYYY')," +
        "       TO_CHAR (TO_DATE (a.etd , 'YYYYMMDD'), 'Mon. dd, YYYY') prod_dt, TO_CHAR (TO_DATE (a.eta , 'YYYYMMDD'), 'Mon. dd, YYYY') finihed_dt " +
        "      ,initcap(d.FULL_NAME),c.PARTNER_NAME" +
        "  FROM sale.tsa_saleorder a,  " +
        "       comm.tco_buspartner b, " +
        "       comm.tco_buspartner c, hr.thr_employee d " +
        "  where a.DEL_IF = 0 and  a.EMP_PK = d.PK(+) and d.DEL_IF(+) =0" +
        "  and b.DEL_IF =0 " +
        "  and c.DEL_IF = 0 " +
        "  and a.BILL_TO_PK = b.PK " +
        "  and a.DELI_TO_PK = c.PK " +
        "  and a.PK = " + poPK ;
    DataTable dt = CtlLib.TableReadOpen(SQL);

   /* string SQL1
    = "select item.GRP_CD||'-'||item.spec_id , sale.sf_get_dsbs00013_2 (3, sa.tco_item_pk) corona, " +
        "sale.sf_get_dsbs00013_2 (4, sa.tco_item_pk) thick, " +
        " sale.sf_get_dsbs00013_2 (5, sa.tco_item_pk) width, " +
        " sale.sf_get_dsbs00013_2 (6, sa.tco_item_pk) leng, " +
        "sa.LOT_QTY, WEIGHT_QTY " +
        "from sale.tsa_saleorderd sa, " +
        "( SELECT c.PK,MAX (b.spec_id) spec_id,g.GRP_CD " +
        "      FROM comm.tco_itemspec a, " +
        "          comm.tco_spec b, " +
        "          comm.tco_item c, " +
        "          tco_itemgrp d, " +
        "          comm.tco_grpspecgrp e, " +
        "          comm.tco_specgrp f, " +
        "          comm.tco_itemgrp g " +
        "    WHERE a.del_if = 0 " +
        "      AND b.del_if = 0 " +
        "      AND c.del_if = 0 " +
        "      AND d.del_if = 0 " +
        "      AND e.del_if = 0 " +
        "      AND f.del_if = 0 " +
        "      and g.del_if =0 " +
        "      AND a.tco_item_pk = c.pk " +
        "      AND a.tco_spec_pk = b.pk " +
        "      AND c.tco_itemgrp_pk = d.pk " +
        "      AND d.pk = e.tco_itemgrp_pk " +
        "      AND c.tco_itemgrp_pk = e.tco_itemgrp_pk " +
        "      AND e.seq = '2' " +
        "      AND e.tco_specgrp_pk = f.pk " +
        "      AND b.tco_specgrp_pk = f.pk " +
        "      and e.TCO_ITEMGRP_PK = g.pk " +
        "      group by  c.PK,g.GRP_CD) item " +
        " where sa.DEL_IF =0 " +
        "and item.pk = sa.TCO_ITEM_PK " +
        "and sa.close_yn = 'N' " +
        "and sa.TSA_SALEORDER_PK = " + poPK ;*/


    string SQL1
    = "select c.ITEM_NAME , sale.sf_get_dsbs00013_2 (3, sa.tco_item_pk) corona,  " +
        "sale.sf_get_dsbs00013_2 (4, sa.tco_item_pk) thick,  " +
        " sale.sf_get_dsbs00013_2 (5, sa.tco_item_pk) width,  " +
        " sale.sf_get_dsbs00013_2 (6, sa.tco_item_pk) leng,  " +
        "sa.LOT_QTY, WEIGHT_QTY  " +
        "from sale.tsa_saleorderd sa, comm.tco_item a , comm.tco_stitem c " +
        "where sa.DEL_IF =0  " +
        "and a.DEL_IF =0 " +
        "and c.DEL_IF =0 " +
        "and sa.TCO_ITEM_PK = a.pk " +
        "and a.TCO_STITEM_PK = c.PK  " +
        "and sa.close_yn = 'N'  " +
        "and sa.TSA_SALEORDER_PK =  " + poPK;

    
    
    DataTable dt1 = CtlLib.TableReadOpen(SQL1);

%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="dsbs00010_YC_files/filelist.xml">
<link rel=Edit-Time-Data href="dsbs00010_YC_files/editdata.mso">
<link rel=OLE-Object-Data href="dsbs00010_YC_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>User</o:Author>
  <o:LastAuthor>tuyen</o:LastAuthor>
  <o:LastPrinted>2009-04-11T09:46:34Z</o:LastPrinted>
  <o:Created>2009-03-24T05:02:09Z</o:Created>
  <o:LastSaved>2009-04-11T09:48:33Z</o:LastSaved>
  <o:Company>HOME</o:Company>
  <o:Version>11.6360</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.56in .5in .54in .5in;
	mso-header-margin:.28in;
	mso-footer-margin:.34in;}
.font9
	{color:windowtext;
	font-size:12.0pt;
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
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl30
	{mso-style-parent:style0;
	mso-font-charset:0;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl33
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl34
	{mso-style-parent:style0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl35
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
.xl36
	{mso-style-parent:style0;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl39
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl40
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>No.20</x:Name>
    <x:WorksheetOptions>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>97</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:TopRowVisible>3</x:TopRowVisible>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>43</x:ActiveRow>
       <x:ActiveCol>5</x:ActiveCol>
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
  <x:WindowHeight>8700</x:WindowHeight>
  <x:WindowWidth>11355</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="11265"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="5"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=677 style='border-collapse:
 collapse;table-layout:fixed;width:508pt'>
<col width=41 style='mso-width-source:userset;mso-width-alt:1499;width:31pt'>
 <col width=178 style='mso-width-source:userset;mso-width-alt:6509;width:134pt'>
 <col width=210 style='mso-width-source:userset;mso-width-alt:7680;width:158pt'>
 <col width=72 style='mso-width-source:userset;mso-width-alt:2633;width:54pt'>
 <col width=126 style='mso-width-source:userset;mso-width-alt:4608;width:95pt'>
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
  </v:shapetype><v:shape id="_x0000_s5121" type="#_x0000_t75" style='position:absolute;
   margin-left:0;margin-top:0;width:285.75pt;height:29.25pt;z-index:1'>
   <v:imagedata src="dsbs00010_YC_files/image001.emz" o:title=""/>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:0px;margin-top:0px;width:381px;
  height:39px'><img width=381 height=39 src="dsbs00010_YC_files/image002.gif"
  v:shapes="_x0000_s5121"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
    <% if (dt.Rows.Count > 0)
       {
    %>
    
   <tr>
    <td height=17 width=41 style='height:12.75pt;width:31pt'></td>
   </tr>
  </table>
  </span></td>
  <td width=155 style='width:116pt'></td>
  <td width=128 style='width:96pt'></td>
  <td width=155 style='width:116pt'></td>
  <td class=xl24 colspan=2 width=198 style='mso-ignore:colspan;width:149pt'>PRODUCTION
  REQUEST</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=4 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=2 style='mso-ignore:colspan'>No. : <%=dt.Rows[0][0].ToString()%></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=4 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=2 style='mso-ignore:colspan'>Date : <%=dt.Rows[0][2].ToString()%></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=4 style='height:12.75pt;mso-ignore:colspan'></td>
  <td>Page : 1/1</td>
  <td></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=2 style='height:12.75pt;mso-ignore:colspan'>Purchase
  Order no. : <%=dt.Rows[0][1].ToString()%></td>
  <td colspan=2 style='mso-ignore:colspan'>Dated <%=dt.Rows[0][9].ToString()%></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=2 style='height:12.75pt;mso-ignore:colspan'>Customer
  name : <%=dt.Rows[0][4].ToString()%></td>
  <td colspan=4 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 style='height:12.75pt' x:str="Add : ">Add :</td>
  <td colspan=2 style='mso-ignore:colspan'><%=dt.Rows[0][5].ToString()%></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=3 style='height:12.75pt;mso-ignore:colspan'>Tel : <%=dt.Rows[0][6].ToString()%> Fax : <%=dt.Rows[0][7].ToString()%></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=2 style='height:12.75pt;mso-ignore:colspan'>Delivery to
  : <%=dt.Rows[0][8].ToString()%></td>
  <td colspan=4 style='mso-ignore:colspan'></td>
 </tr>
 <%
       }
   
 %>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl38 style='height:15.75pt'>No.</td>
  <td class=xl25 style='border-left:none'>Type of Product</td>
  <td class=xl25 style='border-left:none'>Specification</td>
  <td colspan=2 class=xl39 style='border-right:.5pt solid black;border-left:
  none'>Quantity/ S&#7889; l&#432;&#7907;ng</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl26 style='height:12.75pt'>STT</td>
  <td class=xl27 style='border-left:none'>Lo&#7841;i h&#224;ng</td>
  <td class=xl27 style='border-left:none'>Quy c&#225;ch</td>
  <td class=xl28 style='border-left:none'>Roll</td>
  <td class=xl28 style='border-left:none'>Kg</td>
 </tr>
 <%
     if (dt1.Rows.Count > 0)
     {
         double sumRoll = 0, sumQty = 0;
         for (int i = 0; i < dt1.Rows.Count; i++)
         {
             string spec = dt1.Rows[i][2].ToString() + "mic-" + dt1.Rows[i][3].ToString() + "mm-" + dt1.Rows[i][4].ToString()+"m";
             sumRoll = sumRoll + double.Parse(dt1.Rows[i][5].ToString());
             sumQty = sumQty + double.Parse(dt1.Rows[i][6].ToString());
           %>
                  <tr height=37 style='height:27.75pt'>
                  <td height=37 class=xl29  style='height:27.75pt' x:num><%=i+1%></td>
                  <td class=xl30 width=155 style='height:27.75pt;border-top:none;border-left:none;width:116pt'><%=dt1.Rows[i][0].ToString()%></td>
                  <td class=xl31 width=155 style='height:27.75pt;border-top:none;border-left:none;width:116pt'><%=spec%></td>
                  <td class=xl32 style='height:27.75pt;border-top:none;border-left:none' x:num><%=dt1.Rows[i][5].ToString()%></td>
                  <td class=xl33 style='height:27.75pt;border-top:none;border-left:none' x:num=""><%=dt1.Rows[i][6].ToString()%></td>
                 </tr>
           <%          
             
         }
 %>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl34 width=41 style='height:27.75pt;border-top:none;
  width:31pt'>&nbsp;</td>
  <td class=xl35 width=155 style='border-top:none;width:116pt'
  >Total/ T&#7893;ng c&#7897;ng :</td>
  <td class=xl36 width=155 style='border-top:none;border-left:none;width:116pt'>&nbsp;</td>
  <td class=xl37 width=72 style='border-top:none;border-left:none;width:54pt'
  x:num="" ><%=sumRoll %></td>
  <td class=xl37 width=126 style='border-top:none;border-left:none;width:95pt'
  x:num="" ><%=sumQty %></td>
 </tr>
 <%
   
     }
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
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=5 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=3 style='height:12.75pt;mso-ignore:colspan'>Quality/
  ch&#7845;t l&#432;&#7907;ng : The same as sample tested by customer</td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=3 style='height:12.75pt;mso-ignore:colspan'>Starting
  time for production/ Th&#7901;i gian b&#7855;t &#273;&#7847;u s&#7843;n xu&#7845;t : <%=dt.Rows[0][10].ToString()%></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=3 style='height:12.75pt;mso-ignore:colspan'>Finishing
  time/ Th&#7901;i gian ho&#224;n th&#224;nh : <%=dt.Rows[0][11].ToString()%></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=4 style='height:12.75pt;mso-ignore:colspan'>Production
  Dep. is kindly requested to complete the production on time.</td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=3 style='height:12.75pt;mso-ignore:colspan'>&#272;&#7873; ngh&#7883; ph&#242;ng s&#7843;n xu&#7845;t ho&#224;n th&#224;nh &#273;&#250;ng th&#7901;i h&#7841;n
  .</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=6 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=2 style='height:12.75pt;mso-ignore:colspan'>Prepared by</td>
  <td>Marketing Manager</td>
  <td></td>
  <td colspan=2 style='mso-ignore:colspan'>Factory Manager</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=2 style='height:12.75pt;mso-ignore:colspan'>Ng&#432;&#7901;i l&#7853;p</td>
  <td>Gi&#225;m &#273;&#7889;c Marketing</td>
  <td></td>
  <td colspan=2 style='mso-ignore:colspan'>Gi&#225;m &#273;&#7889;c s&#7843;n xu&#7845;t</td>
 </tr>
 <tr height=68 style='height:51.0pt;mso-xlrowspan:4'>
  <td height=68 colspan=6 style='height:51.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=2 style='height:12.75pt;mso-ignore:colspan'><%=dt.Rows[0][12].ToString()%></td>
  <%
        string maket_mana =""; 
        if (dt2.Rows.Count > 0)
         {
             maket_mana = dt2.Rows[0][0].ToString();
         }
   %>
  <td><%=maket_mana %></td>
  <td></td>
  <%
        string fac_mana =""; 
        if (dt3.Rows.Count > 0)
         {
             fac_mana = dt3.Rows[0][0].ToString();
         }
  %>
  <td colspan=2 style='mso-ignore:colspan'><%=fac_mana %></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=41 style='width:31pt'></td>
  <td width=155 style='width:116pt'></td>
  <td width=128 style='width:96pt'></td>
  <td width=155 style='width:116pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=126 style='width:95pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
