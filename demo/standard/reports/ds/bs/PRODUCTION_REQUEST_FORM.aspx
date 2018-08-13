<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
  <%
  string so_pk ;
  string SQL ;
  int i;      
      so_pk = "" +Request["sopk"];   
	
	SQL = " SELECT a.order_dt, " ;
    SQL += "       sf_get_buspartner_name (a.bill_to_pk) cust_name, b.SO_ITEM_NO, ";
    SQL += "       a.order_type, sf_get_dsbs00013_2 ('1', b.tco_item_pk) item_name, ";
    SQL += "       b.st_ord_qty, b.item_unit, b.ord_qty, sf_get_dsbs00010_1('RP1', b.TCO_ITEM_PK ) || sf_get_dsbs00010_1('PRINT', b.TCO_ITEM_PK ) || sf_get_dsbs00010_1('EMBO', b.TCO_ITEM_PK ) || sf_get_dsbs00010_1('RP2', b.TCO_ITEM_PK ) || sf_get_dsbs00010_1('PERFORATION', b.TCO_ITEM_PK ) pattern,";
    SQL += "       sale.sf_get_dsbs00010_1( 'PROD COLOR' ,b.tco_item_pk) surface_color, ";
    SQL += "       sale.sf_get_dsbs00010_1('BACK COLOR', b.tco_item_pk) back_color, COMM.sf_get_codename( 'SAAB0160', b.att07) brand, ";
    SQL += "       b.att08 model, b.att09 style_number, b.att06 customer_sample, b.att03 note, a.sale_rep issuer, ";
    SQL += "       b.item_etd, comm.sf_get_partnerloc_nm (a.deli_loc_pk) deli_loc, ";
    SQL += "       COMM.sf_get_codename ('COAB0080',a.dest_nation) dest_nation, ";
    SQL += "       b.att02 po_detail_num, b.unit_price, b.amount, b.CUST_ITEM_NM item_code_cust, comm.sf_get_codename('SAAB0030', b.DELI_ITEM_METHOD) deli_method ";
	SQL += "  FROM sale.tsa_saleorder a, " ;
	SQL += "       sale.tsa_saleorderd b " ;
	SQL += " WHERE a.del_if = 0 " ;
	SQL += "   AND b.del_if = 0 " ;
	SQL += "   AND a.close_yn = 'N' " ;
	SQL += "   AND b.close_yn = 'N' " ;	
	SQL += "   AND a.pk = b.tsa_saleorder_pk " ;
	SQL += "   AND a.pk = " + so_pk  ;
    SQL += "   order by  b.SO_ITEM_NO "  ;
  DataTable dt = CtlLib.TableReadOpen(SQL);
	
	
    
	
  %>
    
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <meta name="ProgId" content="Excel.Sheet">
        <meta name="Generator" content="Microsoft Excel 11">
          <link rel="File-List" href="PRODUCTION_REQUEST_FORM_files/filelist.xml">
            <link rel="Edit-Time-Data" href="PRODUCTION_REQUEST_FORM_files/editdata.mso">
              <link rel="OLE-Object-Data" href="PRODUCTION_REQUEST_FORM_files/oledata.mso">
                <!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>hacmiu</o:Author>
  <o:LastAuthor>hacmiu</o:LastAuthor>
  <o:LastPrinted>2008-05-17T04:12:30Z</o:LastPrinted>
  <o:Created>2008-05-17T03:31:46Z</o:Created>
  <o:LastSaved>2008-05-17T04:13:59Z</o:LastSaved>
  <o:Company>Vinagenuwin</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
                <style>
                  <!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.4in 0in 1.0in 0in;
	mso-header-margin:.36in;
	mso-footer-margin:.5in;
	mso-page-orientation:landscape;
	mso-horizontal-page-align:center;}
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
	font-size:8.0pt;}
.xl25
	{mso-style-parent:style0;
	font-size:7.0pt;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	font-size:7.0pt;
	text-align:center;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl29
	{mso-style-parent:style0;
	text-align:center;}
.xl30
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;}
.xl31
	{mso-style-parent:style0;
	font-size:7.0pt;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl32
	{mso-style-parent:style0;
	font-size:7.0pt;
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl33
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl34
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl35
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;
	border:.5pt solid windowtext;}
.xl36
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl37
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:yellow;
	mso-pattern:auto none;}
.xl38
	{mso-style-parent:style0;
	font-size:7.0pt;
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:yellow;
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
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>85</x:Scale>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>15</x:ActiveRow>
       <x:ActiveCol>6</x:ActiveCol>
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
  <x:WindowHeight>10365</x:WindowHeight>
  <x:WindowWidth>13260</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>60</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
              </head>

  <body link="blue" vlink="purple">

    <table x:str="" border="0" cellpadding="0" cellspacing="0" width="1201" style='border-collapse:
 collapse;table-layout:fixed;width:900pt'>
      <col class='xl29' width='52' style='mso-width-source:userset;mso-width-alt:1901;
 width:39pt'>
        <col width='55' style='mso-width-source:userset;mso-width-alt:2011;width:41pt'>
          <col width='68' style='mso-width-source:userset;mso-width-alt:2486;width:51pt'>
            <col width='27' style='mso-width-source:userset;mso-width-alt:987;width:20pt'>
              <col width='83' style='mso-width-source:userset;mso-width-alt:3035;width:62pt'>
                <col width='35' style='mso-width-source:userset;mso-width-alt:1280;width:26pt'>
                  <col width='28' style='mso-width-source:userset;mso-width-alt:1024;width:21pt'>
                    <col width='31' style='mso-width-source:userset;mso-width-alt:1133;width:23pt'>
                      <col width='64' style='width:48pt'>
                        <col width='91' style='mso-width-source:userset;mso-width-alt:3328;width:68pt'>
                          <col width='46' style='mso-width-source:userset;mso-width-alt:1682;width:35pt'>
                            <col width='67' style='mso-width-source:userset;mso-width-alt:2450;width:50pt'>
                              <col width='80' style='mso-width-source:userset;mso-width-alt:2925;width:60pt'>
                                <col width='35' style='mso-width-source:userset;mso-width-alt:1280;width:26pt'>
                                  <col width='25' style='mso-width-source:userset;mso-width-alt:914;width:19pt'>
                                    <col width='64' style='width:48pt'>
                                      <col width='36' style='mso-width-source:userset;mso-width-alt:1316;width:27pt'>
                                        <col width='37' style='mso-width-source:userset;mso-width-alt:1353;width:28pt'>
                                          <col width='64' style='width:48pt'>
                                            <col width='54' style='mso-width-source:userset;mso-width-alt:1974;width:41pt'>
                                              <col width='64' style='width:48pt'>
                                                <col width='47' style='mso-width-source:userset;mso-width-alt:1718;width:35pt'>
                                                  <col width='48' style='mso-width-source:userset;mso-width-alt:1755;width:36pt'>
                                                    <tr height='11' style='mso-height-source:userset;height:8.25pt'>
                                                      <td height='11' class='xl29' width='52' style='height:8.25pt;width:39pt'></td>
                                                      <td width='55' style='width:41pt'></td>
                                                      <td width='68' style='width:51pt'></td>
                                                      <td width='27' style='width:20pt'></td>
                                                      <td width='83' style='width:62pt'></td>
                                                      <td width='35' style='width:26pt'></td>
                                                      <td width='28' style='width:21pt'></td>
                                                      <td width='31' style='width:23pt'></td>
                                                      <td width='64' style='width:48pt'></td>
                                                      <td width='91' style='width:68pt'></td>
                                                      <td width='46' style='width:35pt'></td>
                                                      <td width='67' style='width:50pt'></td>
                                                      <td width='80' style='width:60pt'></td>
                                                      <td width='35' style='width:26pt'></td>
                                                      <td width='25' style='width:19pt'></td>
                                                      <td width='64' style='width:48pt'></td>
                                                      <td width='36' style='width:27pt'></td>
                                                      <td width='37' style='width:28pt'></td>
                                                      <td width='64' style='width:48pt'></td>
                                                      <td width='54' style='width:41pt'></td>
                                                      <td width='64' style='width:48pt'></td>
                                                      <td width='47' style='width:35pt'></td>
                                                      <td width='48' style='width:36pt'></td>
                                                    </tr>
                                                    <tr height='24' style='height:18.0pt'>
                                                      <td colspan='23' height='24' class='xl36' style='height:18.0pt'>
                                                        PRODUCTION REQUEST
                                                        FORM
                                                      </td>
                                                    </tr>
                                                    <tr height='10' style='mso-height-source:userset;height:7.5pt'>
                                                      <td height='10' class='xl29' style='height:7.5pt'></td>
                                                      <td colspan='22' style='mso-ignore:colspan'></td>
                                                    </tr>
                                                    <tr class='xl24' height='18' style='mso-height-source:userset;height:13.5pt'>
                                                      <td height='18' class='xl30' style='height:13.5pt'></td>
                                                      <td colspan='14' class='xl24' style='mso-ignore:colspan'></td>
                                                      <td colspan='2' class='xl35'>&nbsp;</td>
                                                      <td colspan='2' class='xl35' style='border-left:none'>Arrived</td>
                                                      <td colspan='2' class='xl35' style='border-left:none'>Checked</td>
                                                      <td colspan='2' class='xl35' style='border-left:none'>Approved</td>
                                                    </tr>
                                                    <tr class='xl24' height='34' style='mso-height-source:userset;height:25.5pt'>
                                                      <td height='34' class='xl30' style='height:25.5pt'></td>
                                                      <td colspan='14' class='xl24' style='mso-ignore:colspan'></td>
                                                      <td colspan='2' class='xl33' style='border-right:.5pt solid black'>Signature</td>
                                                      <td colspan='2' class='xl35' style='border-left:none'>&nbsp;</td>
                                                      <td colspan='2' class='xl35' style='border-left:none'>&nbsp;</td>
                                                      <td colspan='2' class='xl35' style='border-left:none'>&nbsp;</td>
                                                    </tr>
                                                    <tr class='xl24' height='15' style='height:11.25pt'>
                                                      <td height='15' class='xl30' style='height:11.25pt'></td>
                                                      <td colspan='22' class='xl24' style='mso-ignore:colspan'></td>
                                                    </tr>
                                                    <tr class='xl28' height='30' style='mso-height-source:userset;height:22.5pt'>
                                                      <td height='30' class='xl27' style='height:22.5pt'>Order Date</td>
                                                      <td class='xl31' style='border-left:none'>Order Cust.</td>
                                                      <td class='xl27' style='border-left:none'>Production No</td>
                                                      <td class='xl27' style='border-left:none'>Type</td>
                                                      <td class='xl27' style='border-left:none'>Item Cust Name</td>
                                                      <td class='xl31' style='border-left:none'>Item Name</td>
                                                      <td class='xl31' style='border-left:none'>Qty</td>
                                                      <td class='xl27' style='border-left:none'>Unit</td>
                                                      <td class='xl27' style='border-left:none'>LM</td>
                                                      <td class='xl31' style='border-left:none'>Pattern</td>
                                                      <td class='xl31' style='border-left:none'>S/C</td>
                                                      <td class='xl31' style='border-left:none'>D/W B/C</td>
                                                      <td class='xl27' style='border-left:none'>Brand</td>
                                                      <td class='xl27' style='border-left:none'>Model</td>
                                                      <td class='xl27' style='border-left:none'>Stage</td>
                                                      <td class='xl27' style='border-left:none'>C/S</td>
                                                      <td class='xl27' style='border-left:none'>Deli Method</td>
                                                      <td class='xl31' style='border-left:none'>Note</td>
                                                      <td class='xl27' style='border-left:none'>Issuer</td>
                                                      <td class='xl27' style='border-left:none'>ETD</td>
                                                      <td class='xl27' style='border-left:none'>Delivery Cust.</td>
                                                      <td class='xl27' style='border-left:none'>Destination</td>
                                                      <td class='xl31' style='border-left:none'>Detail Po No</td>
                                                      <td class='xl27' style='border-left:none'>Unit Price</td>
                                                      <td class='xl27' style='border-left:none'>Amount</td>
                                                    </tr>
<%	    
    if (dt.Rows.Count > 0)
    {
        for (i = 0; i < dt.Rows.Count; i++)
        {
	%> 													 				
                                                    <tr class='xl26' height='20' style='mso-height-source:userset;height:15.0pt'>
                                                      <td height='20' class='xl25' style='height:15.0pt;border-top:none'><%=dt.Rows[i][0].ToString()%></td>
                                                      <td class='xl37' style='border-top:none;border-left:none'><%=dt.Rows[i][1].ToString()%>)</td>
                                                      <td class='xl25' style='border-top:none;border-left:none'><%=dt.Rows[i][2].ToString()%></td>
                                                      <td class='xl25' style='border-top:none;border-left:none'><%=dt.Rows[i][3].ToString()%></td>
                                                      <td class='xl31' style='border-top:none;border-left:none'><%=dt.Rows[i][23].ToString()%></td>
                                                      <td class='xl37' style='border-top:none;border-left:none'><%=dt.Rows[i][4].ToString()%></td>
                                                      <td class='xl38' style='border-top:none;border-left:none'><%=dt.Rows[i][7].ToString()%></td>
                                                      <td class='xl25' style='border-top:none;border-left:none'><%=dt.Rows[i][6].ToString()%></td>
                                                      <td class='xl32' style='border-top:none;border-left:none'><%=dt.Rows[i][5].ToString()%></td>
                                                      <td class='xl37' style='border-top:none;border-left:none'><%=dt.Rows[i][8].ToString()%></td>
                                                      <td class='xl37' style='border-top:none;border-left:none'><%=dt.Rows[i][9].ToString()%></td>
                                                      <td class='xl37' style='border-top:none;border-left:none'><%=dt.Rows[i][10].ToString()%></td>
                                                      <td class='xl31' style='border-top:none;border-left:none'><%=dt.Rows[i][11].ToString()%></td>
                                                      <td class='xl31' style='border-top:none;border-left:none'><%=dt.Rows[i][12].ToString()%></td>
                                                      <td class='xl25' style='border-top:none;border-left:none'><%=dt.Rows[i][13].ToString()%></td>
                                                      <td class='xl25' style='border-top:none;border-left:none'><%=dt.Rows[i][14].ToString()%></td>
                                                      <td class='xl31' style='border-top:none;border-left:none'><%=dt.Rows[i][24].ToString()%></td>
                                                      <td class='xl37' style='border-top:none;border-left:none'><%=dt.Rows[i][15].ToString()%></td>
                                                      <td class='xl25' style='border-top:none;border-left:none'><%=dt.Rows[i][16].ToString()%></td>
                                                      <td class='xl25' style='border-top:none;border-left:none'><%=dt.Rows[i][17].ToString()%></td>
                                                      <td class='xl31' style='border-top:none;border-left:none'><%=dt.Rows[i][18].ToString()%></td>
                                                      <td class='xl31' style='border-top:none;border-left:none'><%=dt.Rows[i][19].ToString()%></td>
                                                      <td class='xl37' style='border-top:none;border-left:none'><%=dt.Rows[i][20].ToString()%></td>
                                                      <td class='xl32' style='border-top:none;border-left:none'><%=dt.Rows[i][21].ToString()%></td>
                                                      <td class='xl32' style='border-top:none;border-left:none'><%=dt.Rows[i][22].ToString()%></td>
                                                    </tr>
<%
    }
}                        
%>                                                    
                                                    <tr class='xl24' height='15' style='height:11.25pt'>
                                                      <td height='15' class='xl30' style='height:11.25pt'></td>
                                                      <td colspan='22' class='xl24' style='mso-ignore:colspan'></td>
                                                    </tr>
                                                    <tr class='xl24' height='15' style='height:11.25pt'>
                                                      <td height='15' class='xl30' style='height:11.25pt'></td>
                                                      <td colspan='22' class='xl24' style='mso-ignore:colspan'></td>
                                                    </tr>
                                                    <![if supportMisalignedColumns]>
                                                    <tr height='0' style='display:none'>
                                                      <td width='52' style='width:39pt'></td>
                                                      <td width='55' style='width:41pt'></td>
                                                      <td width='68' style='width:51pt'></td>
                                                      <td width='27' style='width:20pt'></td>
                                                      <td width='83' style='width:62pt'></td>
                                                      <td width='35' style='width:26pt'></td>
                                                      <td width='28' style='width:21pt'></td>
                                                      <td width='31' style='width:23pt'></td>
                                                      <td width='64' style='width:48pt'></td>
                                                      <td width='91' style='width:68pt'></td>
                                                      <td width='46' style='width:35pt'></td>
                                                      <td width='67' style='width:50pt'></td>
                                                      <td width='80' style='width:60pt'></td>
                                                      <td width='35' style='width:26pt'></td>
                                                      <td width='25' style='width:19pt'></td>
                                                      <td width='64' style='width:48pt'></td>
                                                      <td width='36' style='width:27pt'></td>
                                                      <td width='37' style='width:28pt'></td>
                                                      <td width='64' style='width:48pt'></td>
                                                      <td width='54' style='width:41pt'></td>
                                                      <td width='64' style='width:48pt'></td>
                                                      <td width='47' style='width:35pt'></td>
                                                      <td width='48' style='width:36pt'></td>
                                                    </tr>
                                                    <![endif]>
                                                  </table>

  </body>
</html>
