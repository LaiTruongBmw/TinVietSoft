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
    string poPK = "";
    poPK = "" + Request["sopk"];
   string SQL
    = "select a.SLIP_NO,a.DOC_DATE,c.ITEM_NAME,c.ITEM_CODE,'KG',sum(b.TAKEOUT_QTY),sum(b.UNIT_PRICE),sum(b.AMOUNT),to_char(sysdate,'yyyymmdd') " + 
        "from sale.TSA_SOTAKEOUT a, sale.tsa_sotakeoutd b, comm.tco_item c  " +
        "where a.DEL_IF =0 " +
        "and b.TSA_SOTAKEOUT_PK = a.PK " +
        "and c.DEL_IF =0  " +
        "and b.TAKEOUT_ITEM_PK = c.pk " +
        "and a.pk = "+poPK  +
        " group by a.SLIP_NO,a.DOC_DATE,c.ITEM_NAME,c.ITEM_CODE " ;

    DataTable dt = CtlLib.TableReadOpen(SQL);
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="dscd00030_YC_files/filelist.xml">
<link rel=Edit-Time-Data href="dscd00030_YC_files/editdata.mso">
<link rel=OLE-Object-Data href="dscd00030_YC_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>tuyen</o:LastAuthor>
  <o:LastPrinted>2009-04-20T11:44:38Z</o:LastPrinted>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2009-04-20T11:44:51Z</o:LastSaved>
  <o:Version>11.6360</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.75in .5in .75in .5in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-horizontal-page-align:center;}
.font6
	{color:windowtext;
	font-size:11.0pt;
	font-weight:700;
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
	font-size:11.0pt;}
.xl25
	{mso-style-parent:style0;
	font-size:11.0pt;
	text-align:center;}
.xl26
	{mso-style-parent:style0;
	font-size:11.0pt;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	font-size:11.0pt;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	font-size:11.0pt;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	font-size:11.0pt;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl30
	{mso-style-parent:style0;
	font-size:11.0pt;
	mso-number-format:Standard;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl31
	{mso-style-parent:style0;
	font-size:11.0pt;
	mso-number-format:Standard;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl32
	{mso-style-parent:style0;
	font-size:11.0pt;
	border:.5pt solid windowtext;}
.xl33
	{mso-style-parent:style0;
	font-size:11.0pt;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl34
	{mso-style-parent:style0;
	font-size:11.0pt;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl35
	{mso-style-parent:style0;
	font-size:11.0pt;
	mso-number-format:Standard;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl36
	{mso-style-parent:style0;
	font-size:11.0pt;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl37
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl38
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl40
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl41
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl42
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl43
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl44
	{mso-style-parent:style0;
	font-size:11.0pt;
	mso-number-format:Standard;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl45
	{mso-style-parent:style0;
	font-size:11.0pt;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl46
	{mso-style-parent:style0;
	font-size:11.0pt;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl47
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl48
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
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
      <x:Scale>77</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>12</x:ActiveRow>
       <x:ActiveCol>3</x:ActiveCol>
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
  <x:WindowHeight>8790</x:WindowHeight>
  <x:WindowWidth>15360</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>1545</x:WindowTopY>
  <x:AcceptLabelsInFormulas/>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=917 style='border-collapse:
 collapse;table-layout:fixed;width:689pt'>
 <col width=43 style='mso-width-source:userset;mso-width-alt:1572;width:32pt'>
 <col width=241 style='mso-width-source:userset;mso-width-alt:8813;width:181pt'>
 <col width=124 style='mso-width-source:userset;mso-width-alt:4534;width:93pt'>
 <col width=53 style='mso-width-source:userset;mso-width-alt:1938;width:40pt'>
 <col width=77 span=2 style='mso-width-source:userset;mso-width-alt:2816;
 width:58pt'>
 <col width=73 style='mso-width-source:userset;mso-width-alt:2669;width:55pt'>
 <col width=94 style='mso-width-source:userset;mso-width-alt:3437;width:71pt'>
 <col width=71 style='mso-width-source:userset;mso-width-alt:2596;width:53pt'>
 <col width=64 style='width:48pt'>
  <% if (dt.Rows.Count > 0)
       {
    %>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl24 colspan=3 width=408 style='height:17.1pt;mso-ignore:
  colspan;width:306pt'>Đơn vị:<font class="font6">Công ty Cổ Phần Nhựa Youl
  Chon Vina</font></td>
  <td class=xl24 width=53 style='width:40pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=73 style='width:55pt'></td>
  <td class=xl24 colspan=2 width=165 style='mso-ignore:colspan;width:124pt'>Mẫu
  số:03XNK-3LL</td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl24 colspan=3 style='height:17.1pt;mso-ignore:colspan'>Địa
  chỉ:<font class="font6">Lô K-3-CN, KCN Mỹ Phước 2, Bến Cát, Bình Dương.</font></td>
  <td colspan=4 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl24 colspan=2 style='mso-ignore:colspan'>Số:<%=dt.Rows[0][0].ToString()%></td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl24 colspan=2 style='height:17.1pt;mso-ignore:colspan'>Điện
  thoại:<font class="font6">0650-3556 017</font></td>
  <td colspan=7 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl24 colspan=2 style='height:17.1pt;mso-ignore:colspan'>Mã
  số thuế:<font class="font6">3700810887</font></td>
  <td colspan=7 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 colspan=9 style='height:17.1pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl48 height=29 style='mso-height-source:userset;height:21.95pt'>
  <td colspan=9 height=29 class=xl47 style='height:21.95pt'>PHIẾU XUẤT KHO</td>
  <td class=xl48></td>
 </tr>
 <tr class=xl48 height=29 style='mso-height-source:userset;height:21.95pt'>
  <td colspan=9 height=29 class=xl47 style='height:21.95pt'>KIÊM VẬN CHUYỂN NỘI
  BỘ</td>
  <td class=xl48></td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td colspan=9 height=22 class=xl25 style='height:17.1pt'>Ngày <%=dt.Rows[0][1].ToString().Substring(6,2)%> tháng <%=dt.Rows[0][1].ToString().Substring(4,2)%> năm
  <%=dt.Rows[0][1].ToString().Substring(0,4)%></td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 colspan=10 class=xl24 style='height:17.1pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl24 colspan=10 style='height:17.1pt;mso-ignore:colspan'>Căn
  cứ lệnh điều động
  số:…….…..……………..…ngày.....…..tháng…..…....năm….…..………của………………….….…………</td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl24 colspan=10 style='height:17.1pt;mso-ignore:colspan'>…….…………………………………...……….về
  việc……………………………………………………………………………….…………</td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl24 colspan=10 style='height:17.1pt;mso-ignore:colspan'>Họ
  tên người vận chuyển:…………………………...……………..…………..…..Hợp đồng
  số……………..……….……………………</td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl24 colspan=10 style='height:17.1pt;mso-ignore:colspan'>Phương
  tiện vận chuyển:………………………………………………………………………………………………………..……….………</td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl24 colspan=3 style='height:17.1pt;mso-ignore:colspan'>Xuất
  tại kho: Công ty Cổ Phần Nhựa Youl Chon Vina</td>
  <td colspan=7 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl24 colspan=10 style='height:17.1pt;mso-ignore:colspan'>Nhập
  tại kho:………………………………………….……………..……………………………………………………………………………</td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 colspan=10 class=xl24 style='height:17.1pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl24 height=17 style='mso-height-source:userset;height:12.75pt'>
  <td rowspan=2 height=47 class=xl37 style='border-bottom:.5pt solid black;
  height:35.25pt'>Số TT</td>
  <td rowspan=2 class=xl38 width=241 style='border-bottom:.5pt solid black;
  width:181pt'>Tên nhãn hiệu, quy cách, phẩm chất vật tư (sản phẩm, hàng hoá)</td>
  <td rowspan=2 class=xl37 style='border-bottom:.5pt solid black'>Mã số</td>
  <td rowspan=2 class=xl37 style='border-bottom:.5pt solid black'>Đơn vị</td>
  <td colspan=2 class=xl39 style='border-right:.5pt solid black;border-left:
  none'>Số lượng</td>
  <td rowspan=2 class=xl37 style='border-bottom:.5pt solid black'>Đơn giá</td>
  <td rowspan=2 class=xl37 style='border-bottom:.5pt solid black'>Thành tiền</td>
  <td rowspan=2 class=xl37 style='border-bottom:.5pt solid black'>Ghi chú</td>
  <td class=xl24></td>
 </tr>
 <tr class=xl24 height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl43 style='height:22.5pt'>Thực xuất</td>
  <td class=xl43>Thực nhập</td>
  <td class=xl24></td>
 </tr>
 <%
    double sum_qty = 0, sum_amount = 0;    
    for (int i = 0; i < dt.Rows.Count; i++)
    {
    sum_qty = sum_qty + double.Parse(dt.Rows[i][5].ToString());
    if(dt.Rows[i][7].ToString() != "")
    {
        sum_amount = sum_amount + double.Parse(dt.Rows[i][7].ToString());
    }
 %>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl26 style='height:17.1pt;border-top:none' x:num><%=i+1 %></td>
  <td class=xl46 ><%=dt.Rows[i][2].ToString()%></td>
  <td class=xl46 ><%=dt.Rows[i][3].ToString()%></td>
  <td class=xl28 ><%=dt.Rows[i][4].ToString()%></td>
  <td class=xl29 align=right 
  x:num><%=dt.Rows[i][5].ToString()%></td>
  <td class=xl27 >&nbsp;</td>
  <td class=xl30 ><%=dt.Rows[i][6].ToString()%></td>
  <td class=xl31 ><%=dt.Rows[i][7].ToString()%></td>
  <td class=xl27 >&nbsp;</td>
 </tr>
  <%
    }
 %>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl32 style='height:17.1pt'>&nbsp;</td>
  <td class=xl33>Cộng:</td>
  <td class=xl34>&nbsp;</td>
  <td class=xl34>&nbsp;</td>
  <td class=xl45 align=right x:num><%=sum_qty%></td>
  <td class=xl34>&nbsp;</td>
  <td class=xl35>&nbsp;</td>
  <td class=xl44 align=right x:num><%=sum_amount%></td>
  <td class=xl34>&nbsp;</td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 colspan=10 class=xl24 style='height:17.1pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl24 colspan=2 style='height:17.1pt;mso-ignore:colspan'>Xuất,ngày <%=dt.Rows[0][8].ToString().Substring(6,2)%> tháng <%=dt.Rows[0][8].ToString().Substring(4,2)%>
  năm <%=dt.Rows[0][8].ToString().Substring(0,4)%></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl24 colspan=4 style='mso-ignore:colspan'>Nhập, ngày……..tháng……năm
  200….</td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl36 style='height:17.1pt'>&nbsp;</td>
  <td class=xl36>&nbsp;</td>
  <td class=xl36>&nbsp;</td>
  <td class=xl36>&nbsp;</td>
  <td class=xl36>&nbsp;</td>
  <td class=xl36>&nbsp;</td>
  <td class=xl36>&nbsp;</td>
  <td class=xl36>&nbsp;</td>
  <td class=xl36>&nbsp;</td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 colspan=10 class=xl24 style='height:17.1pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl24 colspan=2 style='height:17.1pt;mso-ignore:colspan'>Người
  nhập phiếu</td>
  <td class=xl24>Thủ kho xuất</td>
  <td class=xl24></td>
  <td class=xl24 colspan=2 style='mso-ignore:colspan'>Người nhận chuyển</td>
  <td class=xl24></td>
  <td class=xl24>Thủ kho nhập</td>
  <td  class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl24 height=22 style='mso-height-source:userset;height:17.1pt'>
  <td height=22 class=xl24 colspan=2 style='height:17.1pt;mso-ignore:colspan'>(Ký,
  họ tên)</td>
  <td class=xl24>(Ký, họ tên)</td>
  <td class=xl24></td>
  <td class=xl24 colspan=2 style='mso-ignore:colspan'>(Ký, họ tên)</td>
  <td class=xl24></td>
  <td class=xl24>(Ký, họ tên)</td>
  <td  class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <%} %>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=43 style='width:32pt'></td>
  <td width=241 style='width:181pt'></td>
  <td width=124 style='width:93pt'></td>
  <td width=53 style='width:40pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=94 style='width:71pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
