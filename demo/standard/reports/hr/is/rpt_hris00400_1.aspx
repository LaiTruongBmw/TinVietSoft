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
    string emp_pk;
    
    emp_pk       = Request["emp_pk"].ToString();
    string SQL = " select  " 
        + "a.FULL_NAME  "//0
        + ",decode(nvl(a.sex,0),'M',substr(a.BIRTH_DT,1,4),' ') as FeMale " //1
        + ",decode(nvl(a.sex,0),'F',substr(a.BIRTH_DT,1,4),' ') as FeMale " //2
        + ",a.PERSON_ID  as personid " //3
        + ",(select v.code_fnm from vhr_hr_code v where v.id='HR0014' and v.code=a.PLACE_PER_ID) as noicap " //4
        + ",(select v.code_fnm from vhr_hr_code v where v.id='HR0008' and v.code=a.POS_TYPE) as pos_type " //5
        + "from thr_employee a,thr_work_group b,tco_org c,thr_labour_contract e "
        + "where a.del_if=0 and b.del_if=0 and c.del_if=0 and a.thr_wg_pk=b.pk and a.tco_org_pk=c.pk and e.del_if=0 and e.thr_employee_pk =a.pk and a.contract_times=e.contract_times "
       + "and a.pk in (" + emp_pk + ") " ;
        
//Response.Write(SQL);
//Response.End();
    DataTable dt_total = CtlLib.TableReadOpen(SQL);
    int irow;
    irow = dt_total.Rows.Count;
    if (irow == 0)
    {
        Response.Write("There is no data");
        Response.End();
    }
    //getting employeer
    SQL
    = "select code_nm " +
        "from vhr_hr_code " +
        "where id='HR0049' order by code  ";
    DataTable dt_name = CtlLib.TableReadOpen(SQL);
    int irow_name;
    irow_name = dt_name.Rows.Count;
   
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=UTF-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="Copy%20of%20MAU_02_SO_files/filelist.xml">
<link rel=Edit-Time-Data href="Copy%20of%20MAU_02_SO_files/editdata.mso">
<link rel=OLE-Object-Data href="Copy%20of%20MAU_02_SO_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Windows xp sp2 Full</o:Author>
  <o:LastAuthor>nhut_k</o:LastAuthor>
  <o:LastPrinted>2010-06-03T06:22:39Z</o:LastPrinted>
  <o:Created>2007-11-12T00:52:30Z</o:Created>
  <o:LastSaved>2010-06-03T06:23:34Z</o:LastSaved>
  <o:Company>164A</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.68in .35in .79in .44in;
	mso-header-margin:.44in;
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
	font-size:16.0pt;}
.xl25
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	white-space:normal;}
.xl26
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:top;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl32
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:justify;}
.xl33
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl41
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl42
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	white-space:normal;}
.xl43
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dashed windowtext;
	border-left:1.0pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl44
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dashed windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl45
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:top;
	border-top:.5pt dashed windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl46
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:top;
	border-top:.5pt dashed windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl47
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:top;
	border-top:.5pt dashed windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl48
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dashed windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl49
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt dashed windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet2</x:Name>
    <x:WorksheetOptions>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:Scale>89</x:Scale>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:TopRowVisible>6</x:TopRowVisible>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>47</x:ActiveRow>
       <x:ActiveCol>1</x:ActiveCol>
      </x:Pane>
     </x:Panes>
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
  <x:WindowHeight>8775</x:WindowHeight>
  <x:WindowWidth>15360</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>1560</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet2!$8:$14</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="3073"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="2"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1040 style='border-collapse:
 collapse;table-layout:fixed;width:781pt'>
 <col width=42 style='mso-width-source:userset;mso-width-alt:1536;width:32pt'>
 <col width=191 style='mso-width-source:userset;mso-width-alt:6985;width:143pt'>
 <col width=64 span=2 style='width:48pt'>
 <col width=95 style='mso-width-source:userset;mso-width-alt:3474;width:71pt'>
 <col width=102 style='mso-width-source:userset;mso-width-alt:3730;width:77pt'>
 <col width=131 style='mso-width-source:userset;mso-width-alt:4790;width:98pt'>
 <col width=64 span=2 style='width:48pt'>
 <col width=113 style='mso-width-source:userset;mso-width-alt:4132;width:85pt'>
 <col width=110 style='mso-width-source:userset;mso-width-alt:4022;width:83pt'>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td colspan=2 height=23 class=xl25 width=233 style='height:17.25pt;
  width:175pt'>&#272;&#417;n v&#7883; <b><%=dt_name.Rows[0][0].ToString() %></b></td>
  <td colspan=7 class=xl42 width=584 style='width:438pt'
  x:str="C&#7896;NG HOÀ XÃ H&#7896;I CH&#7910; NGH&#296;A VI&#7878;T NAM ">C&#7896;NG
  HOÀ XÃ H&#7896;I CH&#7910; NGH&#296;A VI&#7878;T NAM<span
  style='mso-spacerun:yes'>&nbsp;</span></td>
  <td colspan=2 class=xl27 width=223 style='width:168pt'>M&#7850;U S&#7888;
  02/SBH</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=2 height=21 class=xl25 width=233 style='height:15.75pt;
  width:175pt'>&#272;&#7883;a ch&#7881;:<%=dt_name.Rows[2][0].ToString() %></td>
  <td colspan=7 class=xl27 width=584 style='width:438pt'>&#272;&#7897;c
  l&#7853;p - T&#7921; do - H&#7841;nh phúc</td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=2 height=21 class=xl25 width=233 style='height:15.75pt;
  width:175pt'>&#272;i&#7879;n tho&#7841;i s&#7889;:<b><%=dt_name.Rows[11][0].ToString() %></b></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
  <td colspan=3 height=21 width=328 style='mso-ignore:colspan-rowspan;
  height:15.75pt;width:246pt'><!--[if gte vml 1]><v:line id="_x0000_s2050"
   style='position:absolute;z-index:1' from="38.25pt,3pt" to="173.25pt,3pt"
   o:allowincell="f" strokecolor="blue" strokeweight="1pt">
   <v:stroke startarrowwidth="narrow" startarrowlength="short" endarrowwidth="narrow"
    endarrowlength="short"/>
  </v:line><![endif]--><![if !vml]><span style='mso-ignore:vglayout'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td width=50 height=3></td>
   </tr>
   <tr>
    <td></td>
    <td><img width=182 height=2 src="Copy%20of%20MAU_02_SO_files/image002.gif"
    v:shapes="_x0000_s2050"></td>
    <td width=96></td>
   </tr>
   <tr>
    <td height=16></td>
   </tr>
  </table>
  </span><![endif]><!--[if !mso & vml]><span style='width:246.0pt;height:15.75pt'></span><![endif]--></td>
  <td colspan=4 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=2 height=21 class=xl25 width=233 style='height:15.75pt;
  width:175pt'>Mã s&#7889;<b><%=dt_name.Rows[1][0].ToString() %></b></td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=11 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr class=xl24 height=27 style='height:20.25pt'>
  <td colspan=11 height=27 class=xl29 width=1040 style='height:20.25pt;
  width:781pt' x:str="DANH SÁCH LAO &#272;&#7896;NG &#272;&#7872; NGH&#7882; C&#7844;P S&#7892; BHXH ">DANH
  SÁCH LAO &#272;&#7896;NG &#272;&#7872; NGH&#7882; C&#7844;P S&#7892;
  BHXH<span style='mso-spacerun:yes'>&nbsp;</span></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl30 style='height:15.0pt'></td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td rowspan=5 height=89 class=xl36 width=42 style='height:66.75pt;width:32pt'>STT</td>
  <td rowspan=5 class=xl37 width=191 style='width:143pt'>H&#7885; và tên</td>
  <td colspan=2 rowspan=3 class=xl37 width=128 style='width:96pt'>N&#259;m sinh</td>
  <td colspan=2 rowspan=3 class=xl37 width=197 style='width:148pt'><span
  style='mso-spacerun:yes'>  </span>CM th&#432;</td>
  <td rowspan=5 class=xl37 width=131 style='width:98pt'>Ch&#7913;c danh,
  ngh&#7873; nghi&#7879;p c&#7845;p b&#7853;c</td>
  <td colspan=2 rowspan=3 class=xl37 width=128 style='width:96pt'>Duy&#7879;t
  th&#7901;i gian có &#273;óng BHXH</td>
  <td rowspan=5 class=xl37 width=113 style='width:85pt'>S&#7889; s&#7893; BHXH</td>
  <td rowspan=5 class=xl38 width=110 style='width:83pt'>Ghi chú</td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td rowspan=2 height=35 class=xl40 width=64 style='height:26.25pt;border-top:
  none;width:48pt'>Nam</td>
  <td rowspan=2 class=xl40 width=64 style='border-top:none;width:48pt'>N&#7919;</td>
  <td rowspan=2 class=xl40 width=95 style='border-top:none;width:71pt'>S&#7889;</td>
  <td rowspan=2 class=xl40 width=102 style='border-top:none;width:77pt'>N&#417;i
  c&#7845;p</td>
  <td rowspan=2 class=xl40 width=64 style='border-top:none;width:48pt'>N&#259;m</td>
  <td rowspan=2 class=xl40 width=64 style='border-top:none;width:48pt'>Tháng</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td rowspan=2 height=34 class=xl33 width=42 style='height:25.5pt;border-top:
  none;width:32pt'>1</td>
  <td rowspan=2 class=xl34 width=191 style='border-top:none;width:143pt'>2</td>
  <td rowspan=2 class=xl34 width=64 style='border-top:none;width:48pt'
  x:str="3 ">3<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td rowspan=2 class=xl34 width=64 style='border-top:none;width:48pt'>4</td>
  <td rowspan=2 class=xl34 width=95 style='border-top:none;width:71pt'
  x:str="5   ">5<span style='mso-spacerun:yes'> &nbsp;&nbsp;</span></td>
  <td rowspan=2 class=xl34 width=102 style='border-top:none;width:77pt'>6</td>
  <td rowspan=2 class=xl34 width=131 style='border-top:none;width:98pt'>7</td>
  <td rowspan=2 class=xl34 width=64 style='border-top:none;width:48pt'>8</td>
  <td rowspan=2 class=xl34 width=64 style='border-top:none;width:48pt'>9</td>
  <td rowspan=2 class=xl34 width=113 style='border-top:none;width:85pt'>10</td>
  <td rowspan=2 class=xl35 width=110 style='border-top:none;width:83pt'>11</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
 </tr>
<%for(int i=0;i< dt_total.Rows.Count;i++) {%>
 <tr height=25 style='mso-height-source:userset;height:14.75pt'>
  <td class=xl43   style="height:28pt;border-top:none;text-align:center;vertical-align:middle;"><%=i+1 %></td>
  <td class=xl44   style="text-align:center;vertical-align:middle;border-top:none;border-left:none; height: 28pt;"><%=dt_total.Rows[i][0].ToString() %></td>
  <td class=xl48 style="text-align:center;vertical-align:middle;border-top:none;border-left:none; height: 28pt;"><%=dt_total.Rows[i][1].ToString() %></td>
  <td class=xl48 style="text-align:center;vertical-align:middle;border-top:none;border-left:none; height: 28pt;"><%=dt_total.Rows[i][2].ToString() %></td>
  <td class=xl48 style="text-align:center;vertical-align:middle;border-top:none;border-left:none; height: 28pt;"><%=dt_total.Rows[i][3].ToString() %></td>
  <td class=xl48 style="text-align:center;vertical-align:middle;border-top:none;border-left:none; height: 28pt;"><%=dt_total.Rows[i][4].ToString() %></td>
  <td class=xl48 style="text-align:center;vertical-align:middle;border-top:none;border-left:none; height: 28pt;"><%=dt_total.Rows[i][5].ToString() %></td>
  <td class=xl48 style="border-top:none;border-left:none; height: 28pt;">&nbsp;</td>
  <td class=xl48 style="border-top:none;border-left:none; height: 28pt;">&nbsp;</td>
  <td class=xl48 style="border-top:none;border-left:none; height: 28pt;">&nbsp;</td>
  <td class=xl49 style="border-top:none;border-left:none; height: 28pt;">&nbsp;</td>
 </tr>
 <%} %>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td class=xl45 style="height:18pt;border-top:none">&nbsp;</td>
  <td class=xl46 style="border-top:none;border-left:none; height: 18pt;">&nbsp;</td>
  <td class=xl46 style="border-top:none;border-left:none; height: 18pt;">&nbsp;</td>
  <td class=xl46 style="border-top:none;border-left:none; height: 18pt;">&nbsp;</td>
  <td class=xl46 style="border-top:none;border-left:none; height: 18pt;">&nbsp;</td>
  <td class=xl46 style="border-top:none;border-left:none; height: 18pt;">&nbsp;</td>
  <td class=xl46 style="border-top:none;border-left:none; height: 18pt;">&nbsp;</td>
  <td class=xl46 style="border-top:none;border-left:none; height: 18pt;">&nbsp;</td>
  <td class=xl46 style="border-top:none;border-left:none; height: 18pt;">&nbsp;</td>
  <td class=xl46 style="border-top:none;border-left:none; height: 18pt;">&nbsp;</td>
  <td class=xl47 style="border-top:none;border-left:none; height: 18pt;">&nbsp;</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=11 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=4 height=21 class=xl31 style='height:15.75pt'>BHXH tỉnh <b><%=dt_name.Rows[10][0].ToString() %></b></td>
  <td colspan=7 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=4 height=21 class=xl31 style='height:15.75pt'>+ Duy&#7879;t
  c&#7845;p &#273;&#7907;t này.... s&#7893;</td>
  <td colspan=7 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=4 height=21 class=xl31 style='height:15.75pt'>+ S&#7889; s&#7893;
  t&#7915;........ &#272;&#7871;n.........</td>
  <td colspan=7 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl32 style='height:15.75pt'></td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=3 height=21 class=xl26 width=297 style='height:15.75pt;
  width:223pt'><%=dt_name.Rows[10][0].ToString() %>, Ngày...... Tháng...... N&#259;m….....</td>
  <td colspan=4 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl26 width=351 style='width:264pt'
  x:str><%=dt_name.Rows[10][0].ToString() %>, Ngày <%= DateTime.Today.Day %> Tháng <%= DateTime.Today.Month %>
  N&#259;m <%= DateTime.Today.Year %><span style='mso-spacerun:yes'>&nbsp;</span></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=3 height=21 class=xl26 width=297 style='height:15.75pt;
  width:223pt'>Giám &#273;&#7889;c BHXH</td>
  <td colspan=4 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl26 width=351 style='width:264pt'
  x:str="Th&#7911; tr&#432;&#7903;ng &#273;&#417;n v&#7883;   ">Th&#7911;
  tr&#432;&#7903;ng &#273;&#417;n v&#7883;<span
  style='mso-spacerun:yes'> &nbsp;&nbsp;</span></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=3 height=21 class=xl26 width=297 style='height:15.75pt;
  width:223pt'>(Ký tên, &#273;óng d&#7845;u)</td>
  <td colspan=4 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl26 width=351 style='width:264pt'><span
  style='mso-spacerun:yes'> &nbsp; </span>(Ký tên, &#273;óng d&#7845;u)</td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=3 height=21 class=xl26 width=297 style='height:15.75pt;
  width:223pt'></td>
  <td colspan=4 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl26 width=351 style='width:264pt'><span
  style='mso-spacerun:yes'> &nbsp;&nbsp;</span></td>
 </tr>
 
 <tr height=21 style='height:15.75pt'>
  <td colspan=3 height=21 class=xl26 width=297 style='height:15.75pt;
  width:223pt'></td>
  <td colspan=4 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl26 width=351 style='width:264pt'><span
  style='mso-spacerun:yes'> &nbsp;&nbsp;</span></td>
 </tr>
 
 <tr height=21 style='height:15.75pt'>
  <td colspan=3 height=21 class=xl26 width=297 style='height:15.75pt;
  width:223pt'></td>
  <td colspan=4 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl26 width=351 style='width:264pt'><span
  style='mso-spacerun:yes'> &nbsp;&nbsp;</span><%=dt_name.Rows[6][0].ToString() %></td>
 </tr>
 
 
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=42 style='width:32pt'></td>
  <td width=191 style='width:143pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=95 style='width:71pt'></td>
  <td width=102 style='width:77pt'></td>
  <td width=131 style='width:98pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=113 style='width:85pt'></td>
  <td width=110 style='width:83pt'></td>
 </tr>
 <![endif]></table>

</body>

</html>
