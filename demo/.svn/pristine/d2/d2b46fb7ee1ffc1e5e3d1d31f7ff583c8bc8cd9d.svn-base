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
    = "select round(sum(decode(S.MONEY_KIND,'01', nvl(s.income_amt_2,0), nvl(s.income_amt_2,0)*nvl(S.EXCHANGE_RATE,1) )),2) as n8 " + 
        ",null as n9 " +
        ",round(sum(decode(S.MONEY_KIND,'01',nvl(S.INCOME_TAX,0),nvl(S.INCOME_TAX,0)*nvl(S.EXCHANGE_RATE,1) )),2) as n10 " +
        ",null as n11 " +
        ",null as n12 " +
        ",null as n13 " +
        ",null as n14 " +
        ", null as n15 " +
        ", null as n16 " +
        "from thr_employee a,thr_month_salary s " +
        "where a.del_if=0 and s.del_if=0 " +
        "and a.pk=s.thr_emp_pk and s.work_mon between '" + p_month_from + "' and '" + p_month_to + "' " ;

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
<link rel=File-List href="rpt_05_KK_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_05_KK_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_05_KK_files/oledata.mso">
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
  <o:LastPrinted>2010-03-23T08:24:56Z</o:LastPrinted>
  <o:Created>2010-03-19T09:18:08Z</o:Created>
  <o:LastSaved>2010-03-23T09:27:00Z</o:LastSaved>
  <o:Version>11.6360</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.63in .24in .26in .66in;
	mso-header-margin:.26in;
	mso-footer-margin:.26in;}
.font9
	{color:windowtext;
	font-size:13.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font10
	{color:windowtext;
	font-size:13.0pt;
	font-weight:700;
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
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl25
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl26
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl27
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl28
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl29
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl30
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl32
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl33
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl34
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl35
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl36
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl37
	{mso-style-parent:style0;
	vertical-align:middle;}
.xl38
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;}
.xl39
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;}
.xl40
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl41
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl42
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl43
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:normal;}
.xl44
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;}
.xl45
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt hairline windowtext;}
.xl46
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet3</x:Name>
    <x:WorksheetOptions>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>96</x:Scale>
      <x:HorizontalResolution>200</x:HorizontalResolution>
      <x:VerticalResolution>200</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:TopRowVisible>6</x:TopRowVisible>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>33</x:ActiveRow>
       <x:ActiveCol>15</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>9210</x:WindowHeight>
  <x:WindowWidth>15195</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>105</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl32>

<table x:str border=0 cellpadding=0 cellspacing=0 width=664 style='border-collapse:
 collapse;table-layout:fixed;width:498pt'>
 <col class=xl32 width=10 style='mso-width-source:userset;mso-width-alt:365;
 width:8pt'>
 <col class=xl32 width=25 style='mso-width-source:userset;mso-width-alt:914;
 width:19pt'>
 <col class=xl32 width=47 style='mso-width-source:userset;mso-width-alt:1718;
 width:35pt'>
 <col class=xl32 width=25 style='mso-width-source:userset;mso-width-alt:914;
 width:19pt'>
 <col class=xl32 width=57 style='mso-width-source:userset;mso-width-alt:2084;
 width:43pt'>
 <col class=xl32 width=35 span=8 style='mso-width-source:userset;mso-width-alt:
 1280;width:26pt'>
 <col class=xl32 width=38 style='mso-width-source:userset;mso-width-alt:1389;
 width:29pt'>
 <col class=xl32 width=40 style='mso-width-source:userset;mso-width-alt:1462;
 width:30pt'>
 <col class=xl32 width=34 style='mso-width-source:userset;mso-width-alt:1243;
 width:26pt'>
 <col class=xl32 width=36 span=3 style='mso-width-source:userset;mso-width-alt:
 1316;width:27pt'>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl32 width=10 style='height:15.75pt;width:8pt'></td>
  <td class=xl32 width=25 style='width:19pt'></td>
  <td class=xl32 width=47 style='width:35pt'></td>
  <td class=xl32 width=25 style='width:19pt'></td>
  <td class=xl32 width=57 style='width:43pt'></td>
  <td class=xl32 width=35 style='width:26pt'></td>
  <td class=xl32 width=35 style='width:26pt'></td>
  <td class=xl32 width=35 style='width:26pt'></td>
  <td class=xl32 width=35 style='width:26pt'></td>
  <td class=xl24 width=35 style='width:26pt'>C&#7896;NG HOÀ XÃ H&#7896;I
  CH&#7910; NGH&#296;A VI&#7878;T NAM</td>
  <td class=xl32 width=35 style='width:26pt'></td>
  <td class=xl32 width=35 style='width:26pt'></td>
  <td class=xl32 width=35 style='width:26pt'></td>
  <td class=xl32 width=38 style='width:29pt'></td>
  <td width=40 style='width:30pt' align=left valign=top><!--[if gte vml 1]><v:shapetype
   id="_x0000_t202" coordsize="21600,21600" o:spt="202" path="m,l,21600r21600,l21600,xe">
   <v:stroke joinstyle="miter"/>
   <v:path gradientshapeok="t" o:connecttype="rect"/>
  </v:shapetype><v:shape id="_x0000_s1026" type="#_x0000_t202" style='position:absolute;
   margin-left:14.25pt;margin-top:2.25pt;width:119.25pt;height:48.75pt;
   z-index:2;mso-wrap-style:tight'>
   <v:textbox style='mso-next-textbox:#_x0000_s1026' inset="0,0,0,0"/>
   <x:ClientData ObjectType="Text">
    <x:TextHAlign>Center</x:TextHAlign>
    <x:TextVAlign>Center</x:TextVAlign>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:2;margin-left:18px;margin-top:2px;width:161px;
  height:67px'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td width=158 height=67 align=center valign=middle bgcolor=white
    style='border:.75pt solid black;vertical-align:top;background:white'><![endif]>
    <div v:shape="_x0000_s1026" style='padding:.75pt .75pt .75pt .75pt;
    text-align:center' class=shape><font class="font12"><span
    style='mso-spacerun:yes'>  </span>M&#7851;u s&#7889;: 05/KK-TNCN <br>
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
    <td height=21 class=xl32 width=40 style='height:15.75pt;width:30pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl32 width=34 style='width:26pt'></td>
  <td class=xl32 width=36 style='width:27pt'></td>
  <td class=xl32 width=36 style='width:27pt'></td>
  <td class=xl32 width=36 style='width:27pt'></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 colspan=9 class=xl32 style='height:18.75pt;mso-ignore:colspan'></td>
  <td class=xl25>&#272;&#7897;c l&#7853;p - T&#7921; do - H&#7841;nh phúc</td>
  <td colspan=9 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 class=xl26 style='height:18.75pt'></td>
  <td colspan=6 class=xl32 style='mso-ignore:colspan'></td>
  <td colspan=6 height=25 class=xl32 width=210 style='mso-ignore:colspan-rowspan;
  height:18.75pt;width:156pt'><!--[if gte vml 1]><v:line id="_x0000_s1025"
   style='position:absolute;z-index:1' from="4.5pt,6pt" to="135pt,6pt"/><![endif]--><![if !vml]><span
  style='mso-ignore:vglayout'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td width=5 height=7></td>
   </tr>
   <tr>
    <td></td>
    <td><img width=176 height=2 src="rpt_05_KK_files/image001.gif" v:shapes="_x0000_s1025"></td>
    <td width=29></td>
   </tr>
   <tr>
    <td height=16></td>
   </tr>
  </table>
  </span><![endif]><!--[if !mso & vml]><span style='width:157.5pt;height:18.75pt'></span><![endif]--></td>
  <td colspan=6 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 
 <tr height=25 style='height:18.75pt'>
  <td height=25 colspan=9 class=xl32 style='height:18.75pt;mso-ignore:colspan'></td>
  <td class=xl25 x:str="   T&#7900; KHAI QUY&#7870;T TOÁN THU&#7870; THU NH&#7852;P CÁ NHÂN "><span
  style='mso-spacerun:yes'>   </span>T&#7900; KHAI QUY&#7870;T TOÁN THU&#7870;
  THU NH&#7852;P CÁ NHÂN<span style='mso-spacerun:yes'> </span></td>
  <td colspan=9 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=9 class=xl32 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl27 x:str="(Dành cho t&#7893; ch&#7913;c, cá nhân tr&#7843; thu nh&#7853;p ch&#7883;u thu&#7871; ">(Dành
  cho t&#7893; ch&#7913;c, cá nhân tr&#7843; thu nh&#7853;p ch&#7883;u
  thu&#7871;<span style='mso-spacerun:yes'> </span></td>
  <td colspan=9 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=9 class=xl32 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl27>t&#7915; ti&#7873;n l&#432;&#417;ng, ti&#7873;n công cho cá
  nhân)</td>
  <td colspan=9 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 colspan=9 class=xl32 style='height:18.75pt;mso-ignore:colspan'></td>
  <td class=xl26><span style='mso-spacerun:yes'>        </span><font
  class="font9">Chính th&#7913;c:<span style='mso-spacerun:yes'>  </span>[<span
  style='mso-spacerun:yes'>    </span>]<span style='mso-spacerun:yes'>     
  </span>B&#7893; sung: [<span style='mso-spacerun:yes'>    </span>]<span
  style='mso-spacerun:yes'>    </span>L&#7847;n: [<span
  style='mso-spacerun:yes'>    </span>]</font></td>
  <td colspan=9 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=9 class=xl32 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl29>[01] <font class="font9">K&#7923; tính thu&#7871;: N&#259;m
  <%=p_year %></font></td>
  <td colspan=9 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl32 style='height:21.75pt'></td>
  <td class=xl28 colspan=9 style='mso-ignore:colspan'>[02] <font class="font9">Tên
  t&#7893; ch&#7913;c, cá nhân tr&#7843; thu nh&#7853;p:<%= dt_name.Rows[0][0].ToString() %></font></td>
  <td colspan=9 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl32 style='height:21.75pt'></td>
  <td class=xl31 colspan=4 style='mso-ignore:colspan'>[03]<font class="font9">
  Mã s&#7889; thu&#7871;:</font></td>
  <%    String pit_tax_no=dt_name.Rows[1][0].ToString();
  
   %>
  <td class=xl43 width=35 style='width:26pt'><%=pit_tax_no[0] %></td>
  <td class=xl43 width=35 style='border-left:none;width:26pt'><%=pit_tax_no[1] %></td>
  <td class=xl43 width=35 style='border-left:none;width:26pt'><%=pit_tax_no[2] %></td>
  <td class=xl43 width=35 style='border-left:none;width:26pt'><%=pit_tax_no[3] %></td>
  <td class=xl43 width=35 style='border-left:none;width:26pt'><%=pit_tax_no[4] %></td>
  <td class=xl43 width=35 style='border-left:none;width:26pt'><%=pit_tax_no[5] %></td>
  <td class=xl43 width=35 style='border-left:none;width:26pt'><%=pit_tax_no[6] %></td>
  <td class=xl43 width=35 style='border-left:none;width:26pt'><%=pit_tax_no[7] %></td>
  <td class=xl43 width=38 style='border-left:none;width:29pt'><%=pit_tax_no[8] %></td>
  <td class=xl43 width=40 style='border-left:none;width:30pt'><%=pit_tax_no[9] %></td>
  <td class=xl30 width=34 style='width:26pt'>-</td>
  <td class=xl43 width=36 style='width:27pt'><% if (pit_tax_no.Length>=11) 
                                                    Response.Write(pit_tax_no[10]); %></td>
  <td class=xl43 width=36 style='border-left:none;width:27pt'><% if (pit_tax_no.Length>=12) 
                                                    Response.Write(pit_tax_no[11]); %></td>
  <td class=xl43 width=36 style='border-left:none;width:27pt'><% if (pit_tax_no.Length>=13) 
                                                    Response.Write(pit_tax_no[12]); %></td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl32 style='height:21.75pt'></td>
  <td class=xl31 colspan=4 style='mso-ignore:colspan'>[04]<font class="font9">
  &#272;&#7883;a ch&#7881;: <%= dt_name.Rows[2][0].ToString() %></font></td>
  <td colspan=14 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl32 style='height:21.75pt'></td>
  <td class=xl31 colspan=10 style='mso-ignore:colspan'>[05]<font class="font9">
  &#272;i&#7879;n tho&#7841;i: <%= dt_name.Rows[3][0].ToString() %> </font><font class="font10">[06] </font><font
  class="font9">Fax: <%= dt_name.Rows[4][0].ToString() %><span style='mso-spacerun:yes'>  </span></font><font
  class="font10">[07]</font><font class="font9"> Email: <%= dt_name.Rows[5][0].ToString() %></font></td>
  <td colspan=8 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl32 style='height:21.75pt'></td>
  <td class=xl40 colspan=18 style='mso-ignore:colspan'
  x:str="A. THU NH&#7852;P CH&#7882;U THU&#7870; (TNCT) T&#7914; TI&#7872;N L&#431;&#416;NG, TI&#7872;N CÔNG TR&#7842; ">A.
  THU NH&#7852;P CH&#7882;U THU&#7870; (TNCT) T&#7914; TI&#7872;N
  L&#431;&#416;NG, TI&#7872;N CÔNG TR&#7842;<span
  style='mso-spacerun:yes'> </span></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl32 style='height:21.0pt'></td>
  <td class=xl41 colspan=7 style='mso-ignore:colspan'>CHO CÁ NHÂN C&#431; TRÚ:</td>
  <td colspan=11 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 colspan=2 class=xl32 style='height:21.75pt;mso-ignore:colspan'></td>
  <td class=xl31 colspan=10 style='mso-ignore:colspan'
  x:str="I. &#272;&#7889;i v&#7899;i cá nhân c&#432; trú có h&#7907;p &#273;&#7891;ng lao &#273;&#7897;ng: ">I.
  &#272;&#7889;i v&#7899;i cá nhân c&#432; trú có h&#7907;p &#273;&#7891;ng lao
  &#273;&#7897;ng:<span style='mso-spacerun:yes'> </span></td>
  <td colspan=7 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl33 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=2 height=29 class=xl38 style='height:21.75pt'>Stt</td>
  <td colspan=13 class=xl38 style='border-left:none'>Ch&#7881; tiêu</td>
  <td colspan=4 class=xl38 style='border-left:none'>S&#7889; ti&#7873;n
  (vn&#273;)</td>
 </tr>
 <tr class=xl33 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=2 height=29 class=xl44 style='height:21.75pt' x:num>1</td>
  <td colspan=12 class=xl45 style='border-left:none'>T&#7893;ng TNCT tr&#7843;
  cho cá nhân</td>
  <td class=xl38 style='border-top:none;border-left:none'>[08]</td>
  <td colspan=4 class=xl46 style='border-left:none' x:num><%= dt_total.Rows[0][0].ToString() %></td>
 </tr>
 <tr class=xl33 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=2 height=29 class=xl44 style='height:21.75pt' x:num>2</td>
  <td colspan=12 class=xl45 style='border-left:none'>T&#7893;ng TNCT tr&#7843;
  cho cá nhân thu&#7897;c di&#7879;n ph&#7843;i kh&#7845;u tr&#7915; thu&#7871;</td>
  <td class=xl38 style='border-top:none;border-left:none'>[09]</td>
  <td colspan=4 class=xl46 style='border-left:none' x:num><%= dt_total.Rows[0][1].ToString() %></td>
 </tr>
 <tr class=xl33 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=2 height=29 class=xl44 style='height:21.75pt' x:num>3</td>
  <td colspan=12 class=xl45 style='border-left:none'>T&#7893;ng s&#7889;
  thu&#7871; TNCN &#273;ã kh&#7845;u tr&#7915;</td>
  <td class=xl38 style='border-top:none;border-left:none'>[10]</td>
  <td colspan=4 class=xl46 style='border-left:none' x:num><%= dt_total.Rows[0][2].ToString() %></td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 colspan=19 class=xl32 style='height:21.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 colspan=2 class=xl32 style='height:21.75pt;mso-ignore:colspan'></td>
  <td class=xl31 colspan=11 style='mso-ignore:colspan'
  x:str="II. &#272;&#7889;i v&#7899;i cá nhân c&#432; trú không có h&#7907;p &#273;&#7891;ng lao &#273;&#7897;ng: ">II.
  &#272;&#7889;i v&#7899;i cá nhân c&#432; trú không có h&#7907;p
  &#273;&#7891;ng lao &#273;&#7897;ng:<span style='mso-spacerun:yes'> </span></td>
  <td colspan=6 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=2 height=29 class=xl38 style='height:21.75pt'>Stt</td>
  <td colspan=13 class=xl38 style='border-left:none'>Ch&#7881; tiêu</td>
  <td colspan=4 class=xl38 style='border-left:none'>S&#7889; ti&#7873;n
  (vn&#273;)</td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=2 height=29 class=xl44 style='height:21.75pt' x:num>1</td>
  <td colspan=12 class=xl45 style='border-left:none'>T&#7893;ng TNCT tr&#7843;
  cho cá nhân</td>
  <td class=xl38 style='border-top:none;border-left:none'>[11]</td>
  <td colspan=4 class=xl46 style='border-left:none' x:num><%= dt_total.Rows[0][3].ToString() %></td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=2 height=29 class=xl44 style='height:21.75pt' x:num>2</td>
  <td colspan=12 class=xl45 style='border-left:none'>T&#7893;ng TNCT tr&#7843;
  cho cá nhân thu&#7897;c di&#7879;n ph&#7843;i kh&#7845;u tr&#7915; thu&#7871;</td>
  <td class=xl38 style='border-top:none;border-left:none'>[12]</td>
  <td colspan=4 class=xl44 style='border-left:none'><%= dt_total.Rows[0][4].ToString() %></td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=2 height=29 class=xl44 style='height:21.75pt' x:num>3</td>
  <td colspan=12 class=xl45 style='border-left:none'>T&#7893;ng s&#7889;
  thu&#7871; TNCN &#273;ã kh&#7845;u tr&#7915;</td>
  <td class=xl38 style='border-top:none;border-left:none'>[13]</td>
  <td colspan=4 class=xl46 style='border-left:none' x:num><%= dt_total.Rows[0][5].ToString() %></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=19 class=xl32 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl33 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl33 style='height:21.75pt'></td>
  <td class=xl42 colspan=18 style='mso-ignore:colspan'>B. THU NH&#7852;P
  CH&#7882;U THU&#7870; T&#7914; TI&#7872;N L&#431;&#416;NG, TI&#7872;N CÔNG
  TR&#7842; CHO CÁ</td>
 </tr>
 <tr class=xl33 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl33 style='height:21.75pt'></td>
  <td class=xl42 colspan=7 style='mso-ignore:colspan'><span
  style='mso-spacerun:yes'> </span>NHÂN KHÔNG C&#431; TRÚ:</td>
  <td colspan=11 class=xl33 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl33 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=2 height=29 class=xl38 style='height:21.75pt'>Stt</td>
  <td colspan=12 class=xl38 style='border-left:none'>Ch&#7881; tiêu</td>
  <td class=xl38 style='border-left:none'>&#272;VT</td>
  <td colspan=4 class=xl38 style='border-left:none'>S&#7889;
  l&#432;&#7907;ng/S&#7889; ti&#7873;n</td>
 </tr>
 <tr class=xl33 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=2 height=29 class=xl44 style='height:21.75pt' x:num>1</td>
  <td colspan=11 class=xl45 style='border-left:none'>T&#7893;ng s&#7889; cá
  nhân nh&#7853;n TNCT</td>
  <td class=xl38 style='border-top:none;border-left:none'>[14]</td>
  <td class=xl39 style='border-top:none;border-left:none'>Ng&#432;&#7901;i</td>
  <td colspan=4 class=xl46 style='border-left:none' x:num><%= dt_total.Rows[0][6].ToString() %></td>
 </tr>
 <tr class=xl33 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=2 height=29 class=xl44 style='height:21.75pt' x:num>2</td>
  <td colspan=11 class=xl45 style='border-left:none'>T&#7893;ng TNCT tr&#7843;
  cho cá nhân</td>
  <td class=xl38 style='border-top:none;border-left:none'>[15]</td>
  <td class=xl39 style='border-top:none;border-left:none'>VN&#272;</td>
  <td colspan=4 class=xl44 style='border-left:none'><%= dt_total.Rows[0][7].ToString() %></td>
 </tr>
 <tr class=xl33 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=2 height=29 class=xl44 style='height:21.75pt' x:num>3</td>
  <td colspan=11 class=xl45 style='border-left:none'>T&#7893;ng s&#7889;
  thu&#7871; TNCN &#273;ã kh&#7845;u tr&#7915;</td>
  <td class=xl38 style='border-top:none;border-left:none'>[16]</td>
  <td class=xl39 style='border-top:none;border-left:none'>VN&#272;</td>
  <td colspan=4 class=xl46 style='border-left:none' x:num><%= dt_total.Rows[0][8].ToString() %></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=19 class=xl32 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=3 class=xl32 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl34 colspan=15 style='mso-ignore:colspan'>Tôi cam &#273;oan
  s&#7889; li&#7879;u khai trên là &#273;úng và ch&#7883;u trách nhi&#7879;m
  tr&#432;&#7899;c pháp lu&#7853;t v&#7873;</td>
  <td class=xl32></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=2 class=xl32 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl34 colspan=5 style='mso-ignore:colspan'><span
  style='mso-spacerun:yes'> </span>nh&#7919;ng s&#7889; li&#7879;u &#273;ã
  khai./.</td>
  <td colspan=12 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=13 class=xl32 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl27><%= dt_name.Rows[6][0].ToString() %> , ngày <%=DateTime.Today.Day.ToString() %> tháng <%=DateTime.Today.Month.ToString() %> n&#259;m <%=DateTime.Today.Year.ToString() %></td>
  <td colspan=5 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=13 class=xl32 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl29>NG&#431;&#7900;I &#272;&#7840;I DI&#7878;N H&#7906;P PHÁP</td>
  <td colspan=5 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=13 class=xl32 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl29>C&#7910;A T&#7892; CH&#7912;C, CÁ NHÂN TR&#7842; THU
  NH&#7852;P</td>
  <td colspan=5 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=13 class=xl32 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl35>Ký tên, &#273;óng d&#7845;u (ghi rõ h&#7885; tên và ch&#7913;c
  v&#7909;)</td>
  <td colspan=5 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=19 class=xl32 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=19 class=xl32 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=19 class=xl32 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
<tr height=22 style='height:16.5pt'>
  <td height=22 colspan=13 class=xl32 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl35><b><%= dt_name.Rows[7][0].ToString() %></b></td>
  <td colspan=5 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=10 style='width:8pt'></td>
  <td width=25 style='width:19pt'></td>
  <td width=47 style='width:35pt'></td>
  <td width=25 style='width:19pt'></td>
  <td width=57 style='width:43pt'></td>
  <td width=35 style='width:26pt'></td>
  <td width=35 style='width:26pt'></td>
  <td width=35 style='width:26pt'></td>
  <td width=35 style='width:26pt'></td>
  <td width=35 style='width:26pt'></td>
  <td width=35 style='width:26pt'></td>
  <td width=35 style='width:26pt'></td>
  <td width=35 style='width:26pt'></td>
  <td width=38 style='width:29pt'></td>
  <td width=40 style='width:30pt'></td>
  <td width=34 style='width:26pt'></td>
  <td width=36 style='width:27pt'></td>
  <td width=36 style='width:27pt'></td>
  <td width=36 style='width:27pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
