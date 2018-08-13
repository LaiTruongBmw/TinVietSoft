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
        ",0 as n9 " +
        ", round(sum(decode(S.MONEY_KIND,'01',nvl(S.INCOME_TAX,0),nvl(S.INCOME_TAX,0)*nvl(S.EXCHANGE_RATE,1) )),2) as n10 " +
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
    if (irow_name != 8)
    {
        Response.Write("There is enough information of HR code HR0131!");
        Response.End();
    }
    
 %>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_05b_bk_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_05b_bk_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_05b_bk_files/oledata.mso">
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
  <o:LastPrinted>2010-03-19T09:14:39Z</o:LastPrinted>
  <o:Created>2010-03-19T07:38:25Z</o:Created>
  <o:LastSaved>2010-03-24T03:28:51Z</o:LastSaved>
  <o:Version>11.6360</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.62in .2in .33in .87in;
	mso-header-margin:.2in;
	mso-footer-margin:.21in;
	mso-page-orientation:landscape;}
.font7
	{color:windowtext;
	font-size:13.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font8
	{color:windowtext;
	font-size:13.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font11
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font12
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
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;}
.xl28
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl30
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl31
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl32
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl33
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl36
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl38
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl39
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
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
	text-align:right;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl41
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
.xl42
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
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
      <x:Scale>94</x:Scale>
      <x:HorizontalResolution>200</x:HorizontalResolution>
      <x:VerticalResolution>200</x:VerticalResolution>
     </x:Print>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>11</x:ActiveRow>
       <x:ActiveCol>17</x:ActiveCol>
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
  <x:Formula>=Sheet1!$11:$12</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl29>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1122 style='border-collapse:
 collapse;table-layout:fixed;width:842pt'>
 <col class=xl29 width=44 style='mso-width-source:userset;mso-width-alt:1609;
 width:33pt'>
 <col class=xl29 width=174 style='mso-width-source:userset;mso-width-alt:6363;
 width:131pt'>
 <col class=xl29 width=40 span=14 style='mso-width-source:userset;mso-width-alt:
 1462;width:30pt'>
 <col class=xl29 width=84 style='mso-width-source:userset;mso-width-alt:3072;
 width:63pt'>
 <col class=xl29 width=168 style='mso-width-source:userset;mso-width-alt:6144;
 width:126pt'>
 <col class=xl29 width=92 style='mso-width-source:userset;mso-width-alt:3364;
 width:69pt'>
 <tr height=25 style='height:18.75pt'>
  <td height=25 class=xl29 width=44 style='height:18.75pt;width:33pt'></td>
  <td class=xl29 width=174 style='width:131pt'></td>
  <td class=xl29 width=40 style='width:30pt'></td>
  <td class=xl29 width=40 style='width:30pt'></td>
  <td class=xl29 width=40 style='width:30pt'></td>
  <td class=xl29 width=40 style='width:30pt'></td>
  <td class=xl29 width=40 style='width:30pt'></td>
  <td class=xl29 width=40 style='width:30pt'></td>
  <td class=xl24 width=40 style='width:30pt'
  x:str="B&#7842;NG KÊ THU NH&#7852;P CH&#7882;U THU&#7870; VÀ THU&#7870; THU NH&#7852;P CÁ NHÂN ">B&#7842;NG
  KÊ THU NH&#7852;P CH&#7882;U THU&#7870; VÀ THU&#7870; THU NH&#7852;P CÁ
  NHÂN<span style='mso-spacerun:yes'> </span></td>
  <td class=xl29 width=40 style='width:30pt'></td>
  <td class=xl29 width=40 style='width:30pt'></td>
  <td class=xl29 width=40 style='width:30pt'></td>
  <td class=xl29 width=40 style='width:30pt'></td>
  <td class=xl29 width=40 style='width:30pt'></td>
  <td class=xl29 width=40 style='width:30pt'></td>
  <td class=xl29 width=40 style='width:30pt'></td>
  <td class=xl29 width=84 style='width:63pt'></td>
  <td class=xl29 width=168 style='width:126pt'></td>
  <td class=xl29 width=92 style='width:69pt'></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 colspan=8 class=xl29 style='height:18.75pt;mso-ignore:colspan'></td>
  <td class=xl24
  x:str="&#272;Ã KH&#7844;U TR&#7914; &#272;&#7888;I V&#7898;I THU NH&#7852;P T&#7914; TI&#7872;N L&#431;&#416;NG, TI&#7872;N CÔNG C&#7910;A CÁ NHÂN C&#431; TRÚ ">&#272;Ã
  KH&#7844;U TR&#7914; &#272;&#7888;I V&#7898;I THU NH&#7852;P T&#7914;
  TI&#7872;N L&#431;&#416;NG, TI&#7872;N CÔNG C&#7910;A CÁ NHÂN C&#431;
  TRÚ<span style='mso-spacerun:yes'> </span></td>
  <td colspan=10 class=xl29 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 colspan=8 class=xl29 style='height:18.75pt;mso-ignore:colspan'></td>
  <td class=xl24>KHÔNG KÝ H&#7906;P &#272;&#7890;NG LAO &#272;&#7896;NG
  HO&#7862;C CÓ H&#7906;P &#272;&#7890;NG LAO &#272;&#7896;NG D&#431;&#7898;I 3
  THÁNG</td>
  <td colspan=10 class=xl29 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 colspan=8 class=xl29 style='height:18.75pt;mso-ignore:colspan'></td>
  <td class=xl25><span style='mso-spacerun:yes'> </span>(Kèm theo t&#7901; khai
  quy&#7871;t toán thu&#7871; thu nh&#7853;p cá nhân m&#7851;u s&#7889;
  05/KK-TNCN)</td>
  <td colspan=7 class=xl29 style='mso-ignore:colspan'></td>
  <td colspan=2 rowspan=3 height=86 class=xl29 width=252 style='mso-ignore:
  colspan-rowspan;height:64.5pt;width:189pt'><!--[if gte vml 1]><v:shapetype
   id="_x0000_t202" coordsize="21600,21600" o:spt="202" path="m,l,21600r21600,l21600,xe">
   <v:stroke joinstyle="miter"/>
   <v:path gradientshapeok="t" o:connecttype="rect"/>
  </v:shapetype><v:shape id="_x0000_s1026" type="#_x0000_t202" style='position:absolute;
   direction:LTR;text-align:left;margin-left:41.25pt;margin-top:9.75pt;width:143.25pt;
   height:50.25pt;z-index:1;mso-wrap-style:tight'>
   <v:textbox style='mso-next-textbox:#_x0000_s1026' inset="0,0,0,0"/>
   <x:ClientData ObjectType="Text">
    <x:TextHAlign>Center</x:TextHAlign>
    <x:TextVAlign>Center</x:TextVAlign>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td width=54 height=12></td>
   </tr>
   <tr>
    <td></td>
    <td width=190 height=69 align=center valign=middle bgcolor=white
    style='border:.75pt solid black;vertical-align:top;background:white'><![endif]>
    <div v:shape="_x0000_s1026" style='padding:.75pt .75pt .75pt .75pt;
    text-align:center;direction:ltr' class=shape><font class="font11">M&#7851;u
    s&#7889;: </font><font class="font12">05B/BK-TNCN</font><font class="font11"><br>
        (Ban hành kèm theo Thông t&#432; <br>
        s&#7889; 20/2010/TT-BTC ngày 05/02/2010 c&#7911;a B&#7897; Tài
    chính)<br>
        </font></div>
    <![if !vml]></td>
    <td width=5></td>
   </tr>
   <tr>
    <td height=5></td>
   </tr>
  </table>
  </span><![endif]><!--[if !mso & vml]><span style='width:189.0pt;height:64.5pt'></span><![endif]--></td>
  <td class=xl29></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 colspan=8 class=xl29 style='height:19.5pt;mso-ignore:colspan'></td>
  <td class=xl26>[01] <font class="font8">K&#7923; tính thu&#7871;: N&#259;m
 <%=p_year %></font></td>
  <td colspan=7 class=xl29 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 class=xl35 colspan=5 align=left style='height:26.25pt;
  mso-ignore:colspan'>[02] <font class="font8">Tên t&#7893; ch&#7913;c, cá nhân
  tr&#7843; thu nh&#7853;p</font><font class="font7">:</font><font class="font8">
  <%= dt_name.Rows[0][0].ToString() %></font></td>
  <td colspan=11 class=xl29 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
 </tr>
 <%    String pit_tax_no=dt_name.Rows[1][0].ToString();
  
   %>
 <tr height=38 style='mso-height-source:userset;height:28.5pt'>
  <td colspan=2 height=38 class=xl42 width=218 style='height:28.5pt;width:164pt'>[03]<font
  class="font8"> Mã s&#7889; thu&#7871;:</font></td>
  <td class=xl34 width=40 style='width:30pt'><%=pit_tax_no[0] %></td>
  <td class=xl34 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[1] %></td>
  <td class=xl34 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[2] %></td>
  <td class=xl34 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[3] %></td>
  <td class=xl34 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[4] %></td>
  <td class=xl34 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[5] %></td>
  <td class=xl34 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[6] %></td>
  <td class=xl34 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[7] %></td>
  <td class=xl34 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[8] %></td>
  <td class=xl34 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[9] %></td>
  <td class=xl36 width=40 style='width:30pt'>-</td>
  <td class=xl34 width=40 style='width:30pt'><% if (pit_tax_no.Length>=11) 
                                                    Response.Write(pit_tax_no[10]); %></td>
  <td class=xl34 width=40 style='border-left:none;width:30pt'><% if (pit_tax_no.Length>=12) 
                                                    Response.Write(pit_tax_no[11]); %></td>
  <td class=xl34 width=40 style='border-left:none;width:30pt'><% if (pit_tax_no.Length>=13) 
                                                    Response.Write(pit_tax_no[12]); %></td>
  <td class=xl28></td>
  <td colspan=2 class=xl29 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=19 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=19 class=xl29 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=26 style='height:19.5pt'>
  <td height=26 colspan=17 class=xl29 style='height:19.5pt;mso-ignore:colspan'></td>
  <td class=xl27>&#272;&#417;n v&#7883; tính: Vi&#7879;t Nam &#273;&#7891;ng</td>
  <td class=xl29></td>
 </tr>
 <tr height=56 style='mso-height-source:userset;height:42.0pt'>
  <td height=56 class=xl33 width=44 style='height:42.0pt;width:33pt'>Stt</td>
  <td class=xl33 width=174 style='border-left:none;width:131pt'>H&#7885; và tên</td>
  <td colspan=4 class=xl33 width=160 style='border-left:none;width:120pt'>Mã
  s&#7889; thu&#7871;</td>
  <td colspan=4 class=xl33 width=160 style='border-left:none;width:120pt'>S&#7889;
  CMND /<br>
    H&#7897; chi&#7871;u</td>
  <td colspan=4 class=xl33 width=160 style='border-left:none;width:120pt'>Thu
  nh&#7853;p ch&#7883;u <br>
    thu&#7871;</td>
  <td colspan=3 class=xl41 width=164 style='border-left:none;width:123pt'
  x:str="TNCT làm c&#259;n c&#7913; tính gi&#7843;m thu&#7871;"><span
  style='mso-spacerun:yes'> </span>TNCT làm c&#259;n c&#7913; tính gi&#7843;m
  thu&#7871;<span style='mso-spacerun:yes'> </span></td>
  <td class=xl33 width=168 style='border-left:none;width:126pt'>S&#7889;
  thu&#7871; TNCN &#273;ã kh&#7845;u tr&#7915;</td>
  <td class=xl29></td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl33 width=44 style='height:24.75pt;border-top:none;
  width:33pt'>[04]</td>
  <td class=xl33 width=174 style='border-top:none;border-left:none;width:131pt'>[05]</td>
  <td colspan=4 class=xl33 width=160 style='border-left:none;width:120pt'>[06]</td>
  <td colspan=4 class=xl33 width=160 style='border-left:none;width:120pt'>[07]</td>
  <td colspan=4 class=xl33 width=160 style='border-left:none;width:120pt'>[08]</td>
  <td colspan=3 class=xl33 width=164 style='border-left:none;width:123pt'>[9]</td>
  <td class=xl33 width=168 style='border-top:none;border-left:none;width:126pt'>[10]</td>
  <td class=xl29></td>
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
  <td height=33 class=xl37 style='height:24.75pt;border-top:none'><%=i+1 %></td>
  <td class=xl38 style='border-top:none;border-left:none'><%= dt_total.Rows[i][0].ToString() %></td>
  <td colspan=4 class=xl37 style='border-left:none'><%= dt_total.Rows[i][1].ToString() %></td>
  <td colspan=4 class=xl37 style='border-left:none'><%= dt_total.Rows[i][2].ToString() %></td>
  <td colspan=4 class=xl40 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= dt_total.Rows[i][3].ToString() %></td>
  <td colspan=3 class=xl40 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= dt_total.Rows[i][4].ToString() %></td>
  <td class=xl39 align=left style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= dt_total.Rows[i][5].ToString() %></td>
  <td class=xl29></td>
 </tr>
  <%} %>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=10 height=33 class=xl33 width=538 style='height:24.75pt;
  width:404pt'>T&#7893;ng</td>
  <td colspan=4 class=xl40 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Group_Total[0] %> </td>
  <td colspan=3 class=xl40 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Group_Total[1] %> </td>
  <td class=xl39 align=left style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Group_Total[2] %></td>
  <td class=xl29></td>
 </tr>
 <tr class=xl30 height=38 style='mso-height-source:userset;height:28.5pt'>
  <td height=38 class=xl30 colspan=14 align=left style='height:28.5pt;
  mso-ignore:colspan'>Tôi cam &#273;oan s&#7889; li&#7879;u khai trên là
  &#273;úng và ch&#7883;u trách nhi&#7879;m tr&#432;&#7899;c pháp lu&#7853;t
  v&#7873; nh&#7919;ng s&#7889; li&#7879;u &#273;ã khai./.</td>
  <td colspan=5 class=xl30 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl30 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 colspan=19 class=xl30 style='height:19.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl30 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 colspan=16 class=xl30 style='height:19.5pt;mso-ignore:colspan'></td>
  <td class=xl31><%= dt_name.Rows[6][0].ToString() %> , <%=DateTime.Today.Day.ToString() %> tháng <%=DateTime.Today.Month.ToString() %> n&#259;m <%=DateTime.Today.Year.ToString() %></td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl30 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 colspan=16 class=xl30 style='height:19.5pt;mso-ignore:colspan'></td>
  <td class=xl26>NG&#431;&#7900;I &#272;&#7840;I DI&#7878;N H&#7906;P PHÁP</td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl30 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 colspan=16 class=xl30 style='height:19.5pt;mso-ignore:colspan'></td>
  <td class=xl26>C&#7910;A T&#7892; CH&#7912;C, CÁ NHÂN TR&#7842; THU
  NH&#7852;P</td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl30 height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 colspan=16 class=xl30 style='height:26.25pt;mso-ignore:colspan'></td>
  <td class=xl32>Ký tên, &#273;óng d&#7845;u (ghi rõ h&#7885; tên và ch&#7913;c
  v&#7909;)</td>
  <td colspan=2 class=xl30 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl30 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 colspan=19 class=xl30 style='height:19.5pt;mso-ignore:colspan'></td>
 </tr>
  <tr class=xl30 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 colspan=19 class=xl30 style='height:19.5pt;mso-ignore:colspan'></td>
 </tr>
  <tr class=xl30 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 colspan=19 class=xl30 style='height:19.5pt;mso-ignore:colspan'></td>
 </tr>
  <tr class=xl30 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 colspan=19 class=xl30 style='height:19.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=16 class=xl31 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl26><%= dt_name.Rows[7][0].ToString() %></td>
  <td colspan=2 class=xl31 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=44 style='width:33pt'></td>
  <td width=174 style='width:131pt'></td>
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
  <td width=84 style='width:63pt'></td>
  <td width=168 style='width:126pt'></td>
  <td width=92 style='width:69pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
