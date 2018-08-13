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
    
    string p_year,p_month_from,p_month_to;
     
  
    p_year       = Request["p_year"].ToString();
    p_month_from      = Request["p_month_from"].ToString();
    p_month_to      = Request["p_month_to"].ToString();
    
    string SQL
	= "select A.FULL_NAME as n5 " + 
        ",A.PIT_TAX_NO as n6  " +
        ",A.PERSON_ID as n7 " +
        ",round(sum(decode(S.MONEY_KIND,'01', nvl(s.income_amt_2,0), nvl(s.income_amt_2,0)*nvl(S.EXCHANGE_RATE,1) )),2) as n8 " +
        ",round(max(nvl(s.FAMILY_DEPEND,0)),2) as n9 " +
        ",round(sum(nvl(s.FAMILY_DEPEND,0)),2) as n10 " +
        ",0 as n11 " +
        ",round(sum(nvl(S.HEALTH_AMT,0)+nvl(S.SOCIAL_AMT,0)+nvl(S.UNEMP_INS,0)),2) as n12 " +
        ", 0 as n13 " +
        ",round(sum(decode(S.MONEY_KIND,'01',nvl(S.INCOME_TAX,0),nvl(S.INCOME_TAX,0)*nvl(S.EXCHANGE_RATE,1) )),2) as n14 " +
        ", 0 as n15 " +
        ", 0 as n16 " +
        ", 0 as n17 " +
        "from thr_employee a,thr_month_salary s " +
        "where a.del_if=0 and s.del_if=0 " +
        "and a.pk=s.thr_emp_pk and s.work_mon between '" + p_month_from + "' and '" + p_month_to + "' " +
        "group by A.FULL_NAME,A.PIT_TAX_NO,A.PERSON_ID " ;

        

//Response.Write(SQL);
//Response.End();
    DataTable dt_total = CtlLib.TableReadOpen(SQL);
    int irow_emp,icol_emp;
    irow_emp = dt_total.Rows.Count;
    icol_emp=dt_total.Columns.Count;
    if (irow_emp == 0)
    {
        Response.Write("There is no data of salary this month");
        Response.End();
    }
    SQL
    = "select code_nm  " +
        "from vhr_hr_code " +
        "where id='HR0131'  ";
    DataTable dt_name = CtlLib.TableReadOpen(SQL);
    int irow_name;
    irow_name = dt_name.Rows.Count;
    /*if (irow_name != 8)
    {
        Response.Write("There is enough information of HR code HR0131!");
        Response.End();
    }*/
    
 %>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_05a_bk_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_05a_bk_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_05a_bk_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>huynhtruong</o:Author>
  <o:LastAuthor>huynhtruong</o:LastAuthor>
  <o:LastPrinted>2010-03-24T02:57:06Z</o:LastPrinted>
  <o:Created>2010-03-19T07:38:25Z</o:Created>
  <o:LastSaved>2010-03-24T02:57:32Z</o:LastSaved>
  <o:Version>11.6360</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.57in .2in .33in .2in;
	mso-header-margin:.2in;
	mso-footer-margin:.21in;
	mso-page-orientation:landscape;}
.font8
	{color:windowtext;
	font-size:13.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font9
	{color:windowtext;
	font-size:13.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font12
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font13
	{color:windowtext;
	font-size:9.0pt;
	font-weight:700;
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
.style18
	{mso-number-format:"_\(\0022$\0022* \#\,\#\#0\.00_\)\;_\(\0022$\0022* \\\(\#\,\#\#0\.00\\\)\;_\(\0022$\0022* \0022-\0022??_\)\;_\(\@_\)";
	mso-style-name:Currency;
	mso-style-id:4;}
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
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl25
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl26
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl27
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl28
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;}
.xl29
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl32
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl33
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl34
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl35
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl37
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl40
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl41
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl42
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border:.5pt hairline windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl43
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl44
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl45
	{mso-style-parent:style0;
	border:.5pt hairline windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl46
	{mso-style-parent:style18;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(\0022$\0022* \#\,\#\#0\.00_\)\;_\(\0022$\0022* \\\(\#\,\#\#0\.00\\\)\;_\(\0022$\0022* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
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
      <x:Scale>83</x:Scale>
      <x:HorizontalResolution>200</x:HorizontalResolution>
      <x:VerticalResolution>200</x:VerticalResolution>
     </x:Print>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>14</x:ActiveRow>
       <x:ActiveCol>2</x:ActiveCol>
       <x:RangeSelection>$C$15:$D$15</x:RangeSelection>
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
  <x:WindowWidth>15195</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>105</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$10:$13</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl31>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1186 style='border-collapse:
 collapse;table-layout:fixed;width:890pt'>
 <col class=xl31 width=45 style='mso-width-source:userset;mso-width-alt:1645;
 width:34pt'>
 <col class=xl31 width=139 style='mso-width-source:userset;mso-width-alt:5083;
 width:104pt'>
 <col class=xl31 width=39 style='mso-width-source:userset;mso-width-alt:1426;
 width:29pt'>
 <col class=xl31 width=40 span=15 style='mso-width-source:userset;mso-width-alt:
 1462;width:30pt'>
 <col class=xl31 width=89 style='mso-width-source:userset;mso-width-alt:3254;
 width:67pt'>
 <col class=xl31 width=93 style='mso-width-source:userset;mso-width-alt:3401;
 width:70pt'>
 <col class=xl31 width=92 style='mso-width-source:userset;mso-width-alt:3364;
 width:69pt'>
 <col class=xl31 width=89 style='mso-width-source:userset;mso-width-alt:3254;
 width:67pt'>
 <tr height=25 style='height:18.75pt'>
  <td height=25 class=xl31 width=45 style='height:18.75pt;width:34pt'></td>
  <td class=xl31 width=139 style='width:104pt'></td>
  <td class=xl31 width=39 style='width:29pt'></td>
  <td class=xl31 width=40 style='width:30pt'></td>
  <td class=xl31 width=40 style='width:30pt'></td>
  <td class=xl31 width=40 style='width:30pt'></td>
  <td class=xl31 width=40 style='width:30pt'></td>
  <td class=xl31 width=40 style='width:30pt'></td>
  <td class=xl31 width=40 style='width:30pt'></td>
  <td class=xl31 width=40 style='width:30pt'></td>
  <td class=xl31 width=40 style='width:30pt'></td>
  <td class=xl31 width=40 style='width:30pt'></td>
  <td class=xl24 width=40 style='width:30pt'
  x:str="B&#7842;NG KÊ THU NH&#7852;P CH&#7882;U THU&#7870; VÀ THU&#7870; THU NH&#7852;P CÁ NHÂN ">B&#7842;NG
  KÊ THU NH&#7852;P CH&#7882;U THU&#7870; VÀ THU&#7870; THU NH&#7852;P CÁ
  NHÂN<span style='mso-spacerun:yes'> </span></td>
  <td class=xl31 width=40 style='width:30pt'></td>
  <td class=xl31 width=40 style='width:30pt'></td>
  <td class=xl31 width=40 style='width:30pt'></td>
  <td class=xl31 width=40 style='width:30pt'></td>
  <td class=xl31 width=40 style='width:30pt'></td>
  <td class=xl31 width=89 style='width:67pt'></td>
  <td width=93 style='width:70pt' align=left valign=top><!--[if gte vml 1]><v:shapetype
   id="_x0000_t202" coordsize="21600,21600" o:spt="202" path="m,l,21600r21600,l21600,xe">
   <v:stroke joinstyle="miter"/>
   <v:path gradientshapeok="t" o:connecttype="rect"/>
  </v:shapetype><v:shape id="_x0000_s1025" type="#_x0000_t202" style='position:absolute;
   margin-left:19.5pt;margin-top:12pt;width:156.75pt;height:49.5pt;z-index:1;
   mso-wrap-style:tight'>
   <v:textbox style='mso-next-textbox:#_x0000_s1025' inset="0,0,0,0"/>
   <x:ClientData ObjectType="Text">
    <x:TextHAlign>Center</x:TextHAlign>
    <x:TextVAlign>Center</x:TextVAlign>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:25px;margin-top:15px;width:211px;
  height:68px'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td width=208 height=68 align=center valign=middle bgcolor=white
    style='border:.75pt solid black;vertical-align:top;background:white'><![endif]>
    <div v:shape="_x0000_s1025" style='padding:.75pt .75pt .75pt .75pt;
    text-align:center' class=shape><font class="font12">M&#7851;u s&#7889;: </font><font
    class="font13">05A/BK-TNCN</font><font class="font12"><br>
        (Ban hành kèm theo Thông t&#432; <br>
        s&#7889; 20/2010/TT-BTC ngày 05/02/2010 c&#7911;a B&#7897; Tài
    chính)<br>
        </font></div>
    <![if !vml]></td>
   </tr>
  </table>
  </span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=25 class=xl31 width=93 style='height:18.75pt;width:70pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl31 width=92 style='width:69pt'></td>
  <td class=xl31 width=89 style='width:67pt'></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 colspan=12 class=xl31 style='height:18.75pt;mso-ignore:colspan'></td>
  <td class=xl24 x:str="&#272;Ã KH&#7844;U TR&#7914; &#272;&#7888;I V&#7898;I THU NH&#7852;P T&#7914; TI&#7872;N L&#431;&#416;NG, ">&#272;Ã
  KH&#7844;U TR&#7914; &#272;&#7888;I V&#7898;I THU NH&#7852;P T&#7914;
  TI&#7872;N L&#431;&#416;NG,<span style='mso-spacerun:yes'> </span></td>
  <td colspan=9 class=xl31 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 colspan=12 class=xl31 style='height:18.75pt;mso-ignore:colspan'></td>
  <td class=xl24 x:str="TI&#7872;N CÔNG C&#7910;A CÁ NHÂN C&#431; TRÚ CÓ KÝ H&#7906;P &#272;&#7890;NG LAO &#272;&#7896;NG ">TI&#7872;N
  CÔNG C&#7910;A CÁ NHÂN C&#431; TRÚ CÓ KÝ H&#7906;P &#272;&#7890;NG LAO
  &#272;&#7896;NG<span style='mso-spacerun:yes'> </span></td>
  <td colspan=9 class=xl31 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 colspan=12 class=xl31 style='height:18.75pt;mso-ignore:colspan'></td>
  <td class=xl25><span style='mso-spacerun:yes'> </span>(Kèm theo t&#7901; khai
  quy&#7871;t toán thu&#7871; thu nh&#7853;p cá nhân m&#7851;u s&#7889;
  05/KK-TNCN)</td>
  <td colspan=9 class=xl31 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=12 class=xl31 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl26>[01] <font class="font9">K&#7923; tính thu&#7871;: N&#259;m
  <%=p_year %></font></td>
  <td colspan=9 class=xl31 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 class=xl31 style='height:26.25pt'></td>
  <td class=xl36 colspan=6 style='mso-ignore:colspan'>[02] <font class="font9">Tên
  t&#7893; ch&#7913;c, cá nhân tr&#7843; thu nh&#7853;p</font><font
  class="font8">:</font><font class="font9"> <%= dt_name.Rows[0][0].ToString() %></font></td>
  <td colspan=15 class=xl31 style='mso-ignore:colspan'></td>
 </tr>
 <%    String pit_tax_no=dt_name.Rows[1][0].ToString();
  
   %>
 <tr height=38 style='mso-height-source:userset;height:28.5pt'>
  <td height=38 class=xl31 style='height:28.5pt'></td>
  <td class=xl29 width=139 style='width:104pt'>[03]<font class="font9"> Mã
  s&#7889; thu&#7871;:</font></td>
  <td colspan=2 class=xl31 style='mso-ignore:colspan'></td>
  <td class=xl37 width=40 style='width:30pt'><%=pit_tax_no[0] %></td>
  <td class=xl37 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[1] %></td>
  <td class=xl37 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[2] %></td>
  <td class=xl37 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[3] %></td>
  <td class=xl37 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[4] %></td>
  <td class=xl37 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[5] %></td>
  <td class=xl37 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[6] %></td>
  <td class=xl37 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[7] %></td>
  <td class=xl37 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[8] %></td>
  <td class=xl37 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[9] %></td>
  <td class=xl35 width=40 style='width:30pt'>-</td>
  <td class=xl37 width=40 style='width:30pt'><% if (pit_tax_no.Length>=11) 
                                                    Response.Write(pit_tax_no[10]); %></td>
  <td class=xl37 width=40 style='border-left:none;width:30pt'><% if (pit_tax_no.Length>=12) 
                                                    Response.Write(pit_tax_no[11]); %></td>
  <td class=xl37 width=40 style='border-left:none;width:30pt'><% if (pit_tax_no.Length>=13) 
                                                    Response.Write(pit_tax_no[12]); %></td>
  <td class=xl30></td>
  <td colspan=3 class=xl31 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 class=xl27 style='height:18.75pt'></td>
  <td colspan=21 class=xl31 style='mso-ignore:colspan'></td>
 </tr>

 <tr height=26 style='height:19.5pt'>
  <td height=26 colspan=21 class=xl31 style='height:19.5pt;mso-ignore:colspan'></td>
  <td class=xl28>&#272;&#417;n v&#7883; tính: Vi&#7879;t Nam &#273;&#7891;ng</td>
 </tr>
 <tr height=43 style='mso-height-source:userset;height:32.25pt'>
  <td rowspan=3 height=172 class=xl38 width=45 style='height:129.0pt;
  width:34pt'>Stt</td>
  <td rowspan=3 class=xl38 width=139 style='width:104pt'>H&#7885; và tên</td>
  <td colspan=2 rowspan=3 class=xl38 width=79 style='width:59pt'>Mã s&#7889;
  thu&#7871;</td>
  <td colspan=2 rowspan=3 class=xl38 width=80 style='width:60pt'>S&#7889; CMND
  /H&#7897; chi&#7871;u</td>
  <td colspan=2 rowspan=3 class=xl38 width=80 style='width:60pt'>Thu nh&#7853;p
  ch&#7883;u thu&#7871;</td>
  <td colspan=8 class=xl38 width=320 style='border-left:none;width:240pt'>Các
  kho&#7843;n gi&#7843;m tr&#7915;</td>
  <td colspan=2 rowspan=3 class=xl46 width=80 style='width:60pt'
  x:str="TNCT làm c&#259;n c&#7913; tính gi&#7843;m&#10; thu&#7871;"><span
  style='mso-spacerun:yes'> </span>TNCT làm c&#259;n c&#7913; tính
  gi&#7843;m<br>
    <span style='mso-spacerun:yes'> </span>thu&#7871;<span
  style='mso-spacerun:yes'> </span></td>
  <td rowspan=3 class=xl38 width=89 style='width:67pt'>S&#7889; thu&#7871;
  TNCN<br>
    <span style='mso-spacerun:yes'> </span>&#273;ã kh&#7845;u tr&#7915;</td>
  <td colspan=3 rowspan=2 class=xl38 width=274 style='width:206pt'>Chi
  ti&#7871;t k&#7871;t qu&#7843; quy&#7871;t toán thay cho cá nhân n&#7897;p
  thu&#7871;</td>
 </tr>
 <tr height=44 style='mso-height-source:userset;height:33.0pt'>
  <td colspan=4 height=44 class=xl38 width=160 style='height:33.0pt;border-left:
  none;width:120pt'>Ng&#432;&#7901;i ph&#7909; thu&#7897;c</td>
  <td colspan=2 rowspan=2 class=xl38 width=80 style='width:60pt'><span
  style='mso-spacerun:yes'> </span>T&#7915; thi&#7879;n, nhân &#273;&#7841;o,
  khuy&#7871;n h&#7885;c</td>
  <td colspan=2 rowspan=2 class=xl38 width=80 style='width:60pt'>B&#7843;o
  hi&#7875;m b&#7855;t bu&#7897;c</td>
 </tr>
 <tr height=85 style='mso-height-source:userset;height:63.75pt'>
  <td colspan=2 height=85 class=xl38 width=80 style='height:63.75pt;border-left:
  none;width:60pt'>S&#7889; NPT</td>
  <td colspan=2 class=xl38 width=80 style='border-left:none;width:60pt'>T&#7893;ng
  s&#7889; tháng gi&#7843;m tr&#7915;</td>
  <td class=xl38 width=93 style='border-top:none;border-left:none;width:70pt'>T&#7893;ng
  s&#7889; thu&#7871;<br>
    <span style='mso-spacerun:yes'> </span>ph&#7843;i n&#7897;p</td>
  <td class=xl38 width=92 style='border-top:none;border-left:none;width:69pt'>S&#7889;
  thu&#7871; &#273;ã n&#7897;p th&#7915;a</td>
  <td class=xl38 width=89 style='border-top:none;border-left:none;width:67pt'
  x:str="S&#7889; thu&#7871; còn ph&#7843;i kh&#7845;u tr&#7915; thêm ">S&#7889;
  thu&#7871; còn ph&#7843;i kh&#7845;u tr&#7915; thêm<span
  style='mso-spacerun:yes'> </span></td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl38 width=45 style='height:24.75pt;border-top:none;
  width:34pt'>[04]</td>
  <td class=xl38 width=139 style='border-top:none;border-left:none;width:104pt'>[05]</td>
  <td colspan=2 class=xl38 width=79 style='border-left:none;width:59pt'>[06]</td>
  <td colspan=2 class=xl38 width=80 style='border-left:none;width:60pt'>[07]</td>
  <td colspan=2 class=xl38 width=80 style='border-left:none;width:60pt'>[08]</td>
  <td colspan=2 class=xl38 width=80 style='border-left:none;width:60pt'>[09]</td>
  <td colspan=2 class=xl38 width=80 style='border-left:none;width:60pt'>[10]</td>
  <td colspan=2 class=xl38 width=80 style='border-left:none;width:60pt'>[11]</td>
  <td colspan=2 class=xl38 width=80 style='border-left:none;width:60pt'>[12]</td>
  <td colspan=2 class=xl38 width=80 style='border-left:none;width:60pt'>[13]</td>
  <td class=xl38 width=89 style='border-top:none;border-left:none;width:67pt'>[14]</td>
  <td class=xl38 width=93 style='border-top:none;border-left:none;width:70pt'>[15]</td>
  <td class=xl38 width=92 style='border-top:none;border-left:none;width:69pt'>[16]</td>
  <td class=xl38 width=89 style='border-top:none;border-left:none;width:67pt'>[17]</td>
 </tr>
 <%
    double[] Group_Total=new double[icol_emp];
    for (int j=0;j<icol_emp;j++)
        Group_Total[j]=0;
    for (int i=0;i<irow_emp;i++)
    {
        for (int j=0;j<icol_emp-3;j++)
            Group_Total[j]+=Double.Parse(dt_total.Rows[i][j+3].ToString());
  %>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl37 width=45 style='height:24.75pt;border-top:none;
  width:34pt'><%=i+1 %></td>
  <td class=xl39 style='border-top:none;border-left:none'><%= dt_total.Rows[i][0].ToString() %></td>
  <td colspan=2 class=xl44 style='border-left:none'><%= dt_total.Rows[i][1].ToString() %></td>
  <td colspan=2 class=xl44 style='border-left:none'><%= dt_total.Rows[i][2].ToString() %></td>
  <td colspan=2 class=xl41 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= dt_total.Rows[i][3].ToString() %></td>
  <td colspan=2 class=xl43 style='border-left:none' x:num><%= dt_total.Rows[i][4].ToString() %></td>
  <td colspan=2 class=xl43 style='border-left:none' x:num><%= dt_total.Rows[i][5].ToString() %></td>
  <td colspan=2 class=xl41 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= dt_total.Rows[i][6].ToString() %> </td>
  <td colspan=2 class=xl41 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= dt_total.Rows[i][7].ToString() %></td>
  <td colspan=2 class=xl41 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= dt_total.Rows[i][8].ToString() %></td>
  <td class=xl40 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= dt_total.Rows[i][9].ToString() %></td>
  <td class=xl40 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= dt_total.Rows[i][10].ToString() %></td>
  <td class=xl40 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= dt_total.Rows[i][11].ToString() %></td>
  <td class=xl40 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= dt_total.Rows[i][12].ToString() %></td>
 </tr>
 <%} %>
 
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=6 height=33 class=xl38 width=343 style='height:24.75pt;
  width:257pt'>T&#7893;ng</td>
  <td colspan=2 class=xl41 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Group_Total[0] %></td>
  <td colspan=2 class=xl43 style='border-left:none' x:num><%=Group_Total[1] %></td>
  <td colspan=2 class=xl43 style='border-left:none' x:num><%=Group_Total[2] %></td>
  <td colspan=2 class=xl41 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Group_Total[3] %></td>
  <td colspan=2 class=xl41 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Group_Total[4] %></td>
  <td colspan=2 class=xl41 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Group_Total[5] %></td>
  <td class=xl40 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Group_Total[6] %></td>
  <td class=xl40 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Group_Total[7] %></td>
  <td class=xl40 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Group_Total[8] %> </td>
  <td class=xl40 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Group_Total[9] %> </td>
 </tr>
 <tr class=xl32 height=38 style='mso-height-source:userset;height:28.5pt'>
  <td height=38 class=xl32 colspan=15 style='height:28.5pt;mso-ignore:colspan'>Tôi
  cam &#273;oan s&#7889; li&#7879;u khai trên là &#273;úng và ch&#7883;u trách
  nhi&#7879;m tr&#432;&#7899;c pháp lu&#7853;t v&#7873; nh&#7919;ng s&#7889;
  li&#7879;u &#273;ã khai./.</td>
  <td colspan=7 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl32 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 colspan=22 class=xl32 style='height:19.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl32 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 colspan=19 class=xl32 style='height:19.5pt;mso-ignore:colspan'></td>
  <td class=xl33><%= dt_name.Rows[6][0].ToString() %> , <%=DateTime.Today.Day.ToString() %> tháng <%=DateTime.Today.Month.ToString() %> n&#259;m <%=DateTime.Today.Year.ToString() %></td>
  <td colspan=2 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl32 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 colspan=19 class=xl32 style='height:19.5pt;mso-ignore:colspan'></td>
  <td class=xl26>NG&#431;&#7900;I &#272;&#7840;I DI&#7878;N H&#7906;P PHÁP</td>
  <td colspan=2 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl32 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 colspan=19 class=xl32 style='height:19.5pt;mso-ignore:colspan'></td>
  <td class=xl26>C&#7910;A T&#7892; CH&#7912;C, CÁ NHÂN TR&#7842; THU
  NH&#7852;P</td>
  <td colspan=2 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl32 height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 colspan=19 class=xl32 style='height:26.25pt;mso-ignore:colspan'></td>
  <td class=xl34>Ký tên, &#273;óng d&#7845;u (ghi rõ h&#7885; tên và ch&#7913;c
  v&#7909;)</td>
  <td colspan=2 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl32 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 colspan=22 class=xl32 style='height:19.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=22 class=xl31 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=22 class=xl31 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=22 class=xl31 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=19 class=xl31 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl26><%= dt_name.Rows[7][0].ToString() %></td>
  <td colspan=2 class=xl31 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=45 style='width:34pt'></td>
  <td width=139 style='width:104pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=93 style='width:70pt'></td>
  <td width=92 style='width:69pt'></td>
  <td width=89 style='width:67pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
