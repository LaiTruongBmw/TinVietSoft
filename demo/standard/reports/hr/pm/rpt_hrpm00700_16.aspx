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
    string l_group = Request.QueryString["l_group"].ToString();
    string l_pay_type = Request.QueryString["l_pay_type"].ToString();
    string l_m_type = Request.QueryString["l_m_type"].ToString();
    string l_bn_times = Request.QueryString["l_bn_times"].ToString();
    string l_emp_id = Request.QueryString["l_emp_id"].ToString();
    string l_dept = Request.QueryString["l_dept"].ToString();
    string l_year = Request.QueryString["l_year"].ToString();
    
    string SQL
	= "select tg.workGROUP_NM, te.EMP_ID, te.FULL_NAME, (select v.CODE_NM from vhr_hr_code v  " + 
        "          where v.id='HR0008' and v.code=te.POS_TYPE), " +
        "         CASE " +
        "            WHEN tb.money_kind = '02' " +
        "               THEN ROUND (NVL (tb.bn_amt, 0) * NVL (tb.bn_ext_rate, 0),3) " +
        "            ELSE ROUND (tb.bn_amt, 0) " +
        "         END AS bonus_amt " +
        " from thr_bonus tb, thr_employee te, thr_work_group tg " +
        " where te.DEL_IF=0 " +
        "    and tb.DEL_IF=0 " +
        "    and tg.DEL_IF=0 " +
        "    and tb.THR_EMP_PK= te.pk " +
        "    and te.THR_wg_PK=tg.pk " +
        "    and tb.PAY_TYPE='01' " +
        "    and decode('" + l_group + "','ALL','" + l_group + "',te.THR_wG_PK)='" + l_group + "'  " +        
        "    and decode('" + l_m_type + "','ALL','" + l_m_type + "',tb.MONEY_KIND)='" + l_m_type + "'  " +
        "    and decode('" + l_bn_times + "','ALL','" + l_bn_times + "',tb.BN_TIMES)='" + l_bn_times + "'  " +
        "    and (te.EMP_ID like  '%'||'" + l_emp_id + "'||'%' or '" + l_emp_id + "' is null) " +
        "    and tb.BN_YEAR='" + l_year + "' " +
        "    and (te.TCO_org_PK in   (  " +
        "                              SELECT     g.pk  " +
        "                                    FROM tco_org g  " +
        "                                   WHERE g.del_if = 0  " +
        "                              START WITH g.pk =  " +
        "                                            DECODE ('" + l_dept + "',  " +
        "                                                    'ALL', 0,  " +
        "                                                    '" + l_dept + "'  " +
        "                                                   )  " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "            OR '" + l_dept + "' = 'ALL')  " +
        " order by 1,2 " ;
    //Response.Write(SQL);
    //Response.End();
    DataTable dt_emp = CtlLib.TableReadOpen(SQL);
    if (dt_emp.Rows.Count == 0)
    {
        Response.Write("There is no data to show");
        Response.End();
    }

    string SQL_Com
    = "select  a.PARTNER_LNAME,a.ADDR1,a.PHONE_NO,a.TCO_BPPHOTO_PK " +
        "from tco_company a " +
        "where a.DEL_IF=0 " +
        "and a.pk in ( select tco_company_pk from  " +
        "               tco_org  f " +
        "               where  f.pk IN ( " +
        "                              SELECT     g.pk " +
        "                                    FROM tco_org g " +
        "                                   WHERE g.del_if = 0 " +
        "                              START WITH g.pk = " +
        "                                            DECODE ('" + l_dept + "', " +
        "                                                    'ALL', 0, " +
        "                                                    '" + l_dept + "' " +
        "                                                   ) " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '" + l_dept + "' = 'ALL') " +
        "and rownum=1 ";

    //Response.Write(SQL_Com);
    //Response.End();
    DataTable dt_Com = CtlLib.TableReadOpen(SQL_Com);
    int irow_com;
    irow_com = dt_Com.Rows.Count;
    if (irow_com == 0)
    {
        Response.Write("There is no data of company");
        Response.End();
    }
    
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_bonus_payment_cash_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_bonus_payment_cash_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_bonus_payment_cash_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>ty-ml</o:Author>
  <o:LastAuthor>Hee Nguyen</o:LastAuthor>
  <o:LastPrinted>2008-12-29T08:51:24Z</o:LastPrinted>
  <o:Created>2008-09-06T07:03:32Z</o:Created>
  <o:LastSaved>2008-12-29T08:52:53Z</o:LastSaved>
  <o:Company>genuwin</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"Page &P of &N";
	margin:.44in .24in .41in .2in;
	mso-header-margin:.3in;
	mso-footer-margin:.19in;}
.font11
	{color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
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
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-weight:700;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl26
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl28
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl29
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl30
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl31
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl32
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl33
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl34
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl35
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl36
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl37
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl38
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl39
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl40
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl41
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl42
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl43
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl44
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
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
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>87</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>6</x:SplitHorizontal>
     <x:TopRowBottomPane>6</x:TopRowBottomPane>
     <x:ActivePane>2</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
       <x:ActiveRow>10</x:ActiveRow>
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
  <x:WindowHeight>12555</x:WindowHeight>
  <x:WindowWidth>19200</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>255</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$1:$6</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1026" u1:ext="edit"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1272 style='border-collapse:
 collapse;table-layout:fixed;width:956pt'>
 <col class=xl24 width=72 style='mso-width-source:userset;mso-width-alt:2633;
 width:54pt'>
 <col class=xl24 width=128 style='mso-width-source:userset;mso-width-alt:4681;
 width:96pt'>
 <col class=xl24 width=79 style='mso-width-source:userset;mso-width-alt:2889;
 width:59pt'>
 <col class=xl24 width=204 style='mso-width-source:userset;mso-width-alt:7460;
 width:153pt'>
 <col class=xl24 width=88 style='mso-width-source:userset;mso-width-alt:3218;
 width:66pt'>
 <col class=xl24 width=130 style='mso-width-source:userset;mso-width-alt:4754;
 width:98pt'>
 <col class=xl24 width=109 style='mso-width-source:userset;mso-width-alt:3986;
 width:82pt'>
 <col class=xl24 width=77 span=6 style='mso-width-source:userset;mso-width-alt:
 2816;width:58pt'>
 <col class=xl24 width=79 style='mso-width-source:userset;mso-width-alt:2889;
 width:59pt'>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 width=72 style='height:21.75pt;width:54pt' align=left
  valign=top><u3:shapetype id="_x0000_t75" coordsize="21600,21600" o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe" filled="f" stroked="f"><u3:stroke joinstyle="miter"/><u3:formulas><u3:f eqn="if lineDrawn pixelLineWidth 0"/><u3:f eqn="sum @0 1 0"/><u3:f eqn="sum 0 0 @1"/><u3:f eqn="prod @2 1 2"/><u3:f eqn="prod @3 21600 pixelWidth"/><u3:f eqn="prod @3 21600 pixelHeight"/><u3:f eqn="sum @0 0 1"/><u3:f eqn="prod @6 1 2"/><u3:f eqn="prod @7 21600 pixelWidth"/><u3:f eqn="sum @8 21600 0"/><u3:f eqn="prod @7 21600 pixelHeight"/><u3:f eqn="sum @10 21600 0"/></u3:formulas><u3:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/><o:lock u3:ext="edit" aspectratio="t"/></u3:shapetype><u3:shape id="_x0000_s1025" type="#_x0000_t75" alt="" style="position:absolute;&#13;&#10;   margin-left:0;margin-top:0;width:51.75pt;height:42pt;z-index:1"><u3:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=66&amp;table_name=tco_bpphoto"/><x:ClientData ObjectType="Pict"><x:SizeWithCells/><x:AutoPict/></x:ClientData></u3:shape><!--[if gte vml 1]><v:shapetype
   id="_x0000_t75" coordsize="21600,21600" o:spt="75" o:preferrelative="t"
   path="m@4@5l@4@11@9@11@9@5xe" filled="f" stroked="f">
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
  </v:shapetype><v:shape id="_x0000_s1025" type="#_x0000_t75" alt="" style='position:absolute;
   margin-left:0;margin-top:0;width:51.75pt;height:42pt;z-index:1'>
   <v:imagedata src="http://192.168.1.230/esys/system/binary/ViewFile.aspx?img_pk=66&amp;table_name=tco_bpphoto"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:0px;margin-top:0px;width:69px;
  height:56px'><img width=69 height=56
  src="..\..\..\system\binary\ViewFile.aspxViewFile.aspx?img_pk=<%=dt_Com.Rows[0][3].ToString() %>&amp;table_name=tco_bpphoto"
  u3:shapes="_x0000_s1025" v:shapes="_x0000_s1025"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=29 class=xl24 width=72 style='height:21.75pt;width:54pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl25 colspan=2 width=207 style='mso-ignore:colspan;width:155pt'><%=dt_Com.Rows[0][0].ToString() %></td>
  <td class=xl26 width=204 style='width:153pt'></td>
  <td class=xl24 width=88 style='width:66pt'></td>
  <td class=xl24 width=130 style='width:98pt'></td>
  <td class=xl24 width=109 style='width:82pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl24 style='height:18.75pt'></td>
  <td class=xl25><%=dt_Com.Rows[0][1].ToString() %></td>
  <td class=xl24></td>
  <td class=xl26></td>
  <td class=xl24></td>
  <td colspan=8 class=xl27 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 class=xl24 style='height:12.0pt'></td>
  <td class=xl25>Phone :<span style='mso-spacerun:yes'>  </span><%=dt_Com.Rows[0][2].ToString() %></td>
  <td class=xl24></td>
  <td class=xl26></td>
  <td colspan=9 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=57 style='mso-height-source:userset;height:42.75pt'>
  <td colspan=7 height=57 class=xl29 style='height:42.75pt'>SIGNING BONUS
  PAYROLL IN 2008</td>
  <td colspan=6 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl31 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td rowspan=2 height=50 class=xl30 width=72 style='border-bottom:.5pt solid black;
  height:37.5pt;width:54pt'>No.<br>
    <font class="font11">STT</font></td>
  <td rowspan=2 class=xl30 width=128 style='border-bottom:.5pt solid black;
  width:96pt'>GROUP<br>
    <font class="font11">Nhóm</font></td>
  <td rowspan=2 class=xl30 width=79 style='border-bottom:.5pt solid black;
  width:59pt'>Emp ID<br>
    <font class="font11">Mã NV</font></td>
  <td rowspan=2 class=xl30 width=204 style='border-bottom:.5pt solid black;
  width:153pt'>Full Name<br>
    <font class="font11">Họ và Tên</font></td>
  <td rowspan=2 class=xl30 width=88 style='border-bottom:.5pt solid black;
  width:66pt'>Position<br>
    <font class="font11">Chức vụ</font></td>
  <td rowspan=2 class=xl30 width=130 style='border-bottom:.5pt solid black;
  width:98pt'>Net Amount<br>
    <font class="font11">Thực lãnh</font></td>
  <td rowspan=2 class=xl30 width=109 style='border-bottom:.5pt solid black;
  width:82pt'>Sign<br>
    <font class="font11">Ký nhận</font></td>
  <td colspan=6 class=xl31 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl31 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 colspan=6 class=xl31 style='height:18.75pt;mso-ignore:colspan'></td>
 </tr>
 <%
     int sum_emp = 0;
     double sum_sal = 0;
     for (int i = 0; i < dt_emp.Rows.Count; i++)
     {
         sum_emp++;
         sum_sal += double.Parse(dt_emp.Rows[i][4].ToString());
  %>
 <tr class=xl37 height=34 style='mso-height-source:userset;height:25.5pt'>
  <td height=34 class=xl33 style='height:25.5pt' x:num><%=i+1 %></td>
  <td class=xl34><%=dt_emp.Rows[i][0].ToString() %></td>
  <td class=xl35><%=dt_emp.Rows[i][1].ToString() %></td>
  <td class=xl34 x:str><%=dt_emp.Rows[i][2].ToString() %></td>
  <td class=xl34><%=dt_emp.Rows[i][3].ToString() %></td>
  <td class=xl36 x:num><%=dt_emp.Rows[i][4].ToString() %></td>
  <td class=xl36>&nbsp;</td>
  <td colspan=6 class=xl37 style='mso-ignore:colspan'></td>
 </tr>
    <%
        if (i < dt_emp.Rows.Count - 1)
        {
            if (dt_emp.Rows[i][0].ToString() != dt_emp.Rows[i + 1][0].ToString())
            {    
     %>
 
 <tr class=xl44 height=34 style='mso-height-source:userset;height:25.5pt'>
  <td colspan=4 height=34 class=xl38 style='border-right:.5pt solid black;
  height:25.5pt'>Total <%=sum_emp%> Employee(s)</td>
  <td class=xl41>&nbsp;</td>
  <td class=xl42 x:num><%=sum_sal%></td>
  <td class=xl43>&nbsp;</td>
  <td colspan=6 class=xl44 style='mso-ignore:colspan'></td>
 </tr> 
        <%  
                sum_emp = 0;
                sum_sal = 0;
            }
        }
        else
        { 
            %>
 <tr class=xl44 height=34 style='mso-height-source:userset;height:25.5pt'>
  <td colspan=4 height=34 class=xl38 style='border-right:.5pt solid black;
  height:25.5pt'>Total <%=sum_emp%> Employee(s)</td>
  <td class=xl41>&nbsp;</td>
  <td class=xl42 x:num><%=sum_sal%></td>
  <td class=xl43>&nbsp;</td>
  <td colspan=6 class=xl44 style='mso-ignore:colspan'></td>
 </tr> 
            
            <%
        } 
         %>
 <%
     }//for
  %>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=72 style='width:54pt'></td>
  <td width=128 style='width:96pt'></td>
  <td width=79 style='width:59pt'></td>
  <td width=204 style='width:153pt'></td>
  <td width=88 style='width:66pt'></td>
  <td width=130 style='width:98pt'></td>
  <td width=109 style='width:82pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=77 style='width:58pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
