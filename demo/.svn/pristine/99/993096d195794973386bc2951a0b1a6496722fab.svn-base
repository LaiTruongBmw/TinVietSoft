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
    string p_company_pk = Request.QueryString["p_company_pk"];
    string p_tlg_mt_div_pk = Request.QueryString["p_tlg_mt_div_pk"];
    string p_date_type = Request.QueryString["p_date_type"];
    string p_from_date = Request.QueryString["p_from_date"];
    string p_to_date = Request.QueryString["p_to_date"];
    string p_item = Request.QueryString["p_item"];
    string p_bill_to = Request.QueryString["p_bill_to"];
    string p_so_uprice = Request.QueryString["p_so_uprice"];
    string p_order_type = Request.QueryString["p_order_type"];
    
    string SQL
    = "select g.cnt , I.SPEC01_NM, I.SPEC02_NM, I.SPEC03_NM, I.SPEC04_NM, I.SPEC05_NM " +
        "    , I.SPEC06_NM, I.SPEC07_NM, I.SPEC08_NM, I.SPEC09_NM, I.SPEC10_NM " +
        "  , GRP.GRP_CD ,  I.ITEM_NAME , D.ORD_QTY, I.UOM, 0, 0, null " +
        "from tlg_it_item i, tlg_sa_saleorder_m m, tlg_sa_saleorder_d d, tlg_it_itemgrp grp " +
        "    ,(select TLG_IT_ITEMGRP_PK,  count(*) cnt " +
        "    from tlg_it_grpspecgrp g " +
        "    where g.DEL_IF = 0 " +
        "    group by G.TLG_IT_ITEMGRP_PK " +
        "    ) g " +
        "where I.DEL_IF = 0 " +
        "and M.DEL_IF=0 " +
        "and D.DEL_IF = 0 " +
        "and I.PK = D.TLG_IT_ITEM_PK " +
        "and m.pk = D.TLG_SA_SALEORDER_M_PK " +
        "and g.TLG_IT_ITEMGRP_PK = I.TLG_IT_ITEMGRP_PK " +
        "and grp.del_if = 0 " +
        "and GRP.PK = I.TLG_IT_ITEMGRP_PK ";

    //Response.Write(SQL);
    //Response.End();
    DataTable dt_total = CtlLib.TableReadOpen(SQL);            
    if(dt_total.Rows.Count==0)
    {
        Response.Write("There is no data");
        Response.End();
    }
     %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_order_sheet_ens_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_order_sheet_ens_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_order_sheet_ens_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Vina</o:Author>
  <o:LastAuthor>Hee Nguyen</o:LastAuthor>
  <o:LastPrinted>2007-06-25T07:30:58Z</o:LastPrinted>
  <o:Created>2007-06-25T07:22:44Z</o:Created>
  <o:LastSaved>2014-09-09T04:10:32Z</o:LastSaved>
  <o:Company>Vina</o:Company>
  <o:Version>11.6568</o:Version>
 </o:DocumentProperties>
 <o:OfficeDocumentSettings>
  <o:DownloadComponents/>
  <o:LocationOfComponents HRef="file:///E:\"/>
 </o:OfficeDocumentSettings>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .25in .5in .25in;
	mso-header-margin:.5in;
	mso-footer-margin:.25in;}
.font8
	{color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.font9
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
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
	font-size:20.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl25
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl26
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl29
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl30
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl31
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl33
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl36
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl38
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl39
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl41
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
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
      <x:Scale>74</x:Scale>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>3</x:ActiveRow>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>9600</x:WindowHeight>
  <x:WindowWidth>11340</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>60</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1342 style='border-collapse:
 collapse;table-layout:fixed;width:1007pt'>
 <col width=35 style='mso-width-source:userset;mso-width-alt:1280;width:26pt'>
 <col width=112 style='mso-width-source:userset;mso-width-alt:4096;width:84pt'>
 <col width=80 style='mso-width-source:userset;mso-width-alt:2925;width:60pt'>
 <col width=113 style='mso-width-source:userset;mso-width-alt:4132;width:85pt'>
 <col width=190 style='mso-width-source:userset;mso-width-alt:6948;width:143pt'>
 <col width=64 style='width:48pt'>
 <col width=68 style='mso-width-source:userset;mso-width-alt:2486;width:51pt'>
 <col width=66 style='mso-width-source:userset;mso-width-alt:2413;width:50pt'>
 <col width=60 style='mso-width-source:userset;mso-width-alt:2194;width:45pt'>
 <col width=84 style='mso-width-source:userset;mso-width-alt:3072;width:63pt'>
 <col width=75 style='mso-width-source:userset;mso-width-alt:2742;width:56pt'>
 <col width=69 style='mso-width-source:userset;mso-width-alt:2523;width:52pt'>
 <col width=61 style='mso-width-source:userset;mso-width-alt:2230;width:46pt'>
 <col width=92 style='mso-width-source:userset;mso-width-alt:3364;width:69pt'>
 <col width=67 style='mso-width-source:userset;mso-width-alt:2450;width:50pt'>
 <col width=55 style='mso-width-source:userset;mso-width-alt:2011;width:41pt'>
 <col width=51 style='mso-width-source:userset;mso-width-alt:1865;width:38pt'>
 <tr class=xl24 height=42 style='mso-height-source:userset;height:32.1pt'>
  <td colspan=10 height=42 class=xl37 width=872 style='height:32.1pt;
  width:655pt'>ORDER SHEET CHECKING</td>
  <td class=xl24 width=75 style='width:56pt'></td>
  <td class=xl24 width=69 style='width:52pt'></td>
  <td class=xl24 width=61 style='width:46pt'></td>
  <td class=xl24 width=92 style='width:69pt'></td>
  <td class=xl24 width=67 style='width:50pt'></td>
  <td class=xl24 width=55 style='width:41pt'></td>
  <td class=xl24 width=51 style='width:38pt'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=6 class=xl25 style='height:12.0pt;mso-ignore:colspan'></td>
  <td colspan=4 class=xl38>Since<font class="font9"> </font><font class="font8">to</font><font
  class="font9"> </font><font class="font8">09/09/201409/09/2014</font></td>
  <td colspan=7 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl26 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl27 style='height:18.0pt'>STT</td>
  <td class=xl28>CUSTOMER</td>
  <td class=xl28>DATE</td>
  <td class=xl28>ORD NO</td>
  <td class=xl28>P/O NO</td>
  <td class=xl28>ETD</td>
  <td class=xl29>Ord QTY</td>
  <td class=xl29>Prod QTY</td>
  <td class=xl29>T/O QTY</td>
  <td class=xl29>Bal QTY</td>
  <td class=xl28>Ord AMT</td>
  <td class=xl28>Prod AMT</td>
  <td class=xl28>T/O AMT</td>
  <td class=xl28>Bal AMT</td>
  <td class=xl28>PATTERN</td>
  <td class=xl28>FABRIC</td>
  <td class=xl28>OTHER</td>
 </tr>
    <%
        int i;
        string[] _array = new string [dt_total.Columns.Count ];
        int j = 0;
        string _color = "", _size = "", _spec = "", _grp_code = "";
        int _cnt;
        for(i=0;i<dt_total.Rows.Count;i++)
        {                        
            for (j = 0; j < _array.Length; j++)
                _array[j] = dt_total.Rows[i][j].ToString();
            _cnt = int.Parse( _array[0] );
            _size = _array[_cnt - 1];
            _color = _array[_cnt];
            _grp_code = _array[11];
            for (int l = 1; l < _cnt - 2; l++)
                _spec = _spec + " " +  _array[l] ;
            
            %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl30 style='height:12.75pt'><%=i+1 %></td>
  <td class=xl31 width=112 style='width:84pt'><%= _grp_code%></td>
  <td class=xl32>20140909&nbsp;</td>
  <td class=xl32>ES 201409094549&nbsp;</td>
  <td class=xl31 width=190 style='width:143pt'>SAMPLE-FREE (MS.HUỆ)&nbsp;</td>
  <td class=xl32>20140909&nbsp;</td>
  <td class=xl33 width=68 style='width:51pt' x:num>40</td>
  <td class=xl33 width=66 style='width:50pt'>&nbsp;</td>
  <td class=xl33 width=60 style='width:45pt'>&nbsp;</td>
  <td class=xl33 width=84 style='width:63pt' x:num>40</td>
  <td class=xl34 width=75 style='width:56pt'>&nbsp;</td>
  <td class=xl34 width=69 style='width:52pt'>&nbsp;</td>
  <td class=xl34 width=61 style='width:46pt'>&nbsp;</td>
  <td class=xl34 width=92 style='width:69pt'>&nbsp;</td>
  <td class=xl32>&nbsp;</td>
  <td class=xl32>&nbsp;</td>
  <td class=xl32>&nbsp;</td>
 </tr>
 <%     } %>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  
 </tr>
 <![endif]>
</table>

</body>

</html>
