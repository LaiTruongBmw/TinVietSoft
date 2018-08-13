<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>

<% 	 CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
	Response.Charset = "utf-8";
	
 %>

<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<%
    string  l_tht_room_allocate_pk = Request.QueryString["tht_room_allocate_pk"];

    DataTable dt;
       
    dt = CtlLib.TableReadOpenCursor("ht_rpt_60250030_PA", l_tht_room_allocate_pk);
    
    string t_name = "" , t_gender = "" , t_dd = "" , t_mm = "" , t_yy = "" , t_nation = "", t_pass_no = "", t_from_dt = "", t_to_dt = "";
        
    if (dt.Rows.Count > 0)
    {
         t_name = dt.Rows[0]["t_name"].ToString();
         t_gender = dt.Rows[0]["gender"].ToString();
         t_dd = dt.Rows[0]["dd"].ToString();
         t_mm = dt.Rows[0]["mm"].ToString();
         t_yy = dt.Rows[0]["yy"].ToString();
         t_nation = dt.Rows[0]["nation"].ToString();
         t_pass_no = dt.Rows[0]["passport_no"].ToString();
         t_from_dt = dt.Rows[0]["from_dt"].ToString();
         t_to_dt = dt.Rows[0]["to_dt"].ToString();
    }
%>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_htrm00030_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_htrm00030_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_htrm00030_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>VINAGENUWIN</o:Author>
  <o:LastAuthor>VINAGENUWIN</o:LastAuthor>
  <o:LastPrinted>2010-12-14T09:57:56Z</o:LastPrinted>
  <o:Created>2010-12-14T09:24:38Z</o:Created>
  <o:LastSaved>2010-12-14T11:00:04Z</o:LastSaved>
  <o:Version>11.6360</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.49in .27in .55in .33in;
	mso-header-margin:.36in;
	mso-footer-margin:.32in;}
.font0
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial;
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font6
	{color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.font8
	{color:windowtext;
	font-size:12.0pt;
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
	vertical-align:middle;}
.xl25
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;}
.xl26
	{mso-style-parent:style0;
	text-align:left;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-size:15.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
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
      <x:ValidPrinterInfo/>
      <x:Scale>88</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>11</x:ActiveRow>
       <x:ActiveCol>12</x:ActiveCol>
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
  <x:WindowWidth>15195</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=812 style='border-collapse:
 collapse;table-layout:fixed;width:609pt'>
 <col width=64 span=9 style='width:48pt'>
 <col width=108 style='mso-width-source:userset;mso-width-alt:3949;width:81pt'>
 <col width=64 span=2 style='width:48pt'>
 <tr height=17 style='height:12.75pt'>
  <td height=17 width=64 style='height:12.75pt;width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=108 style='width:81pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=12 height=25 class=xl29 style='height:18.75pt'>Cộng Hòa Xã Hội Chủ Nghĩa Việt Nam</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=12 height=25 class=xl28 width=812 style='height:18.75pt;
  width:609pt'>CỤC QUẢN LÝ XUẤT NHẬP CẢNH - BỘ CÔNG AN</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=12 rowspan=4 height=100 class=xl27 style='height:75.0pt'>PHIẾU KHAI BÁO TẠM TRÚ</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=9 height=30 class=xl26 style='height:22.5pt'>1. HỌ TÊN : <font
  class="font6"><%=t_name%></font></td>
  <td class=xl24>2. GIỚI TÍNH :</td>
  <td colspan=2 class=xl25><%=t_gender%></td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=6 height=30 class=xl26 style='height:22.5pt'>3. NGÀY SINH<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=t_dd %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>THÁNG<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=t_mm%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>NĂM&nbsp;&nbsp;&nbsp;&nbsp;<%=t_yy%>&nbsp;&nbsp;</td>
  <td colspan=6 class=xl26>4. QUỐC TỊCH : <font class="font6"><%=t_nation %></font></td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=6 height=30 class=xl26 style='height:22.5pt'>5. NGH&#7872;
  NGHI&#7878;P :</td>
  <td colspan=6 class=xl26>6. S&#7888; H&#7896; CHI&#7870;U : <font
  class="font6"><%=t_pass_no%></font></td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=12 height=30 class=xl26 style='height:22.5pt'>7. THẺ THƯỜNG TRÚ / THẺ TẠM TRÚ SỐ :</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=12 height=30 class=xl26 style='height:22.5pt'>8. MỤC ĐÍCH NHẬP CẢNH :</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=12 height=30 class=xl26 style='height:22.5pt'>9. ĐƯỢC PHÉP TẠM TRÚ TẠI VIỆT NAM ĐẾN :</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=12 height=30 class=xl26 style='height:22.5pt'>10. NGHỈ TẠI KHÁCH SẠN<span style='mso-spacerun:yes'></span><font
  class="font8">&nbsp;&nbsp;Lotus Mũi né&nbsp;&nbsp;</font><font class="font6"> </font><font
  class="font0"><span style='mso-spacerun:yes'></span>BUỒNG SỐ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <span style='mso-spacerun:yes'></span>TỪ NGÀY&nbsp;&nbsp;&nbsp;&nbsp;<%=t_from_dt%>&nbsp;&nbsp;&nbsp;&nbsp;<span style='mso-spacerun:yes'>
  </span>ĐẾN NGÀY<span style='mso-spacerun:yes'>&nbsp;&nbsp;<%=t_to_dt%></span></font></td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=12 height=30 class=xl26 style='height:22.5pt'>Kp5,Pho Hui</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl24 colspan=9 style='height:22.5pt;mso-ignore:colspan'>11.
  TRẺ EM DƯỚI 14 TUỔI ĐI KÈM ( HỌ TÊN,
  GIỚI TÍNH, QUỐC TỊCH, SỐ HỘ CHIẾU )</td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=12 height=30 class=xl25 style='height:22.5pt'>..........................................................................................................................................................................................</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=12 height=30 class=xl25 style='height:22.5pt'>..........................................................................................................................................................................................</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=12 height=30 class=xl25 style='height:22.5pt'>..........................................................................................................................................................................................</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=12 height=30 class=xl25 style='height:22.5pt'>..........................................................................................................................................................................................</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=12 height=30 class=xl25 style='height:22.5pt'>..........................................................................................................................................................................................</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 colspan=7 class=xl24 style='height:18.75pt;mso-ignore:colspan'></td>
  <td colspan=5 class=xl25>NGÀY<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  </span>THÁNG<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>NĂM&nbsp;&nbsp;&nbsp;&nbsp;</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 colspan=9 class=xl24 style='height:18.75pt;mso-ignore:colspan'></td>
  <td class=xl25>KÝ TÊN</td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 colspan=12 class=xl24 style='height:18.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 colspan=12 class=xl24 style='height:18.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 colspan=12 class=xl24 style='height:18.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 colspan=12 class=xl24 style='height:18.75pt;mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=108 style='width:81pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
