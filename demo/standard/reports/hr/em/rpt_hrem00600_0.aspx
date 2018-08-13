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
    String emp_pk;
    emp_pk = Request["emp_pk"].ToString();
    string SQL
    = "SELECT null,(SELECT code_nm " +
        "          FROM vhr_hr_code " +
        "         WHERE ID = 'HR0008' AND code = e.pos_type) AS position1, " +
        "       e.emp_id AS emp_id2, e.full_name AS full_nm3,c.ORG_lNM AS dept_nm4, e.photo_pk as photo_pk5 " +
        "       ,decode(length(e.birth_dt), 8, to_char(to_date(e.birth_dt,'yyyymmdd'),'dd/mm/yyyy'), e.birth_dt) as birthdate6 " +
        "       ,to_char(to_date(e.join_dt,'yyyymmdd'),'dd/mm/yyyy') as joindt7 " +
        "  FROM thr_employee e,TCO_ORG c" +
        " WHERE e.del_if = 0 AND c.del_if=0 and c.pk=e.tco_ORG_pk " +
        " and e.pk in (" + emp_pk + ")  " +
        " order by  e.emp_id  ";

    
    DataTable dt_total = CtlLib.TableReadOpen(SQL);
    int irow;
    irow = dt_total.Rows.Count;
    if (irow == 0)
        Response.Write("There is no data");
  
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_timecard_winners_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_timecard_winners_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_timecard_winners_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Smart</o:Author>
  <o:LastAuthor>welcome</o:LastAuthor>
  <o:LastPrinted>2011-11-26T03:55:26Z</o:LastPrinted>
  <o:Created>2011-11-22T11:24:56Z</o:Created>
  <o:LastSaved>2011-11-26T03:58:44Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\,";
	mso-displayed-thousand-separator:"\.";}
@page
	{margin:.56in .24in .28in .26in;
	mso-header-margin:.43in;
	mso-footer-margin:.3in;}
.font9
	{color:black;
	font-size:10.0pt;
	font-weight:700;
	font-style:italic;
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
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal;
	mso-style-id:0;}
td
	{mso-style-parent:style0;
	padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
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
.xl65
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:justify;
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:2.0pt double windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl68
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:justify;
	border-top:none;
	border-right:2.0pt double windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:justify;
	border-top:.5pt hairline windowtext;
	border-right:2.0pt double windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:justify;
	border-top:none;
	border-right:2.0pt double windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:2.0pt double windowtext;}
.xl72
	{mso-style-parent:style0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:2.0pt double windowtext;}
.xl73
	{mso-style-parent:style0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:2.0pt double windowtext;}
.xl74
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:2.0pt double windowtext;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:2.0pt double windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:2.0pt double windowtext;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:2.0pt double windowtext;
	border-right:2.0pt double windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:2.0pt double windowtext;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:2.0pt double windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:none;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:2.0pt double windowtext;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:2.0pt double windowtext;
	border-right:2.0pt double windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>178</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>300</x:DefaultRowHeight>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>14</x:ActiveRow>
       <x:ActiveCol>2</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
    <x:PageBreaks>
     <x:RowBreaks>
      <% 
        int krow=0;
        for (int k=0;k<irow;)
        {
			k=k+6;
            krow+=44;
            %>
            
            <x:RowBreak>
                <x:Row><%=krow %></x:Row>
            </x:RowBreak>
            <%    
               
                
        }  
      %>
      
     </x:RowBreaks>
    </x:PageBreaks>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>8070</x:WindowHeight>
  <x:WindowWidth>15135</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>105</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>dsnv</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=669 style='border-collapse:
 collapse;table-layout:fixed;width:502pt'>
   <% int i = 0;
    int j=0;
    while (i < irow)
    {     
        j=i+1;
 %>
 <col width=13 style='mso-width-source:userset;mso-width-alt:475;width:10pt'>
 <col width=102 style='mso-width-source:userset;mso-width-alt:3730;width:77pt'>
 <col width=83 style='mso-width-source:userset;mso-width-alt:3035;width:62pt'>
 <col width=131 style='mso-width-source:userset;mso-width-alt:4790;width:98pt'>
 <col width=15 style='mso-width-source:userset;mso-width-alt:548;width:11pt'>
     
 <col width=102 style='mso-width-source:userset;mso-width-alt:3730;width:77pt'>
 <col width=83 style='mso-width-source:userset;mso-width-alt:3035;width:62pt'>
 <col width=140 style='mso-width-source:userset;mso-width-alt:5120;width:105pt'>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td height=12 width=13 style='height:9.0pt;width:10pt'></td>
  <td width=102 style='width:77pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=131 style='width:98pt'></td>
  <td width=15 style='width:11pt'></td>
   <%
        //Hình 2
        
        if (j < irow)
        {
   %>
  <td width=102 style='width:77pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=140 style='width:105pt'></td>
 </tr>
  <%     } %>
 <tr height=15 style='mso-height-source:userset;height:11.25pt'>
  <td height=15 style='height:11.25pt'></td>
  <td colspan=3 rowspan=2 height=28 width=316 style='border-right:2.0pt double black;
  border-bottom:2.0pt double black;height:21.0pt;width:237pt' align=left
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
  </v:shapetype><v:shape id="Picture_x0020_1" o:spid="_x0000_s1025" type="#_x0000_t75"
   style='position:absolute;margin-left:7.5pt;margin-top:6pt;width:31.5pt;
   height:13.5pt;z-index:1;visibility:visible'>
   <v:imagedata src="rpt_timecard_winners_files/image001.png" o:title=""/>
  </v:shape><v:shape id="Picture_x0020_22" o:spid="_x0000_s1026" type="#_x0000_t75"
   style='position:absolute;margin-left:51pt;margin-top:6pt;width:174pt;
   height:9.75pt;z-index:2;visibility:visible'>
   <v:imagedata src="rpt_timecard_winners_files/image002.png" o:title=""/>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:10px;margin-top:8px;width:290px;
  height:18px'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td width=0 height=0></td>
    <td width=42></td>
    <td width=16></td>
    <td width=232></td>
   </tr>
   <tr>
    <td height=13></td>
    <td rowspan=2 align=left valign=top><img width=42 height=18
    src="rpt_timecard_winners_files/image003.jpg" v:shapes="Picture_x0020_1"></td>
    <td></td>
    <td align=left valign=top><img width=232 height=13
    src="rpt_timecard_winners_files/image004.jpg" v:shapes="Picture_x0020_22"></td>
   </tr>
   <tr>
    <td height=5></td>
   </tr>
  </table>
  </span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=3 rowspan=2 height=28 class=xl77 width=316 style='border-right:
    2.0pt double black;border-bottom:2.0pt double black;height:21.0pt;
    width:237pt' x:str="  "><span style='mso-spacerun:yes'>  </span></td>
   </tr>
  </table>
  </span></td>
  <td></td>
   <%
        //Hình 2
        
        if (j < irow)
        {
   %>
  <td colspan=3 rowspan=2 height=28 width=325 style='border-right:2.0pt double black;
  border-bottom:2.0pt double black;height:21.0pt;width:244pt' align=left
  valign=top><!--[if gte vml 1]><v:shape id="_x0000_s1027" type="#_x0000_t75"
   style='position:absolute;margin-left:7.5pt;margin-top:4.5pt;width:33pt;
   height:14.25pt;z-index:3;visibility:visible'>
   <v:imagedata src="rpt_timecard_winners_files/image001.png" o:title=""/>
  </v:shape><v:shape id="_x0000_s1028" type="#_x0000_t75" style='position:absolute;
   margin-left:51pt;margin-top:6.75pt;width:173.25pt;height:9.75pt;z-index:4;
   visibility:visible'>
   <v:imagedata src="rpt_timecard_winners_files/image002.png" o:title=""/>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:3;margin-left:10px;margin-top:6px;width:289px;
  height:19px'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td width=0 height=0></td>
    <td width=44></td>
    <td width=14></td>
    <td width=231></td>
   </tr>
   <tr>
    <td height=3></td>
    <td rowspan=3 align=left valign=top><img width=44 height=19
    src="rpt_timecard_winners_files/image005.jpg" v:shapes="_x0000_s1027"></td>
   </tr>
   <tr>
    <td height=13></td>
    <td></td>
    <td align=left valign=top><img width=231 height=13
    src="rpt_timecard_winners_files/image006.jpg" v:shapes="_x0000_s1028"></td>
   </tr>
   <tr>
    <td height=3></td>
   </tr>
  </table>
  </span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=3 rowspan=2 height=28 class=xl77 width=325 style='border-right:
    2.0pt double black;border-bottom:2.0pt double black;height:21.0pt;
    width:244pt' x:str="  "><span style='mso-spacerun:yes'>  </span></td>
   </tr>
  </table>
  </span></td>
 </tr>
 <%} %>
 <tr height=13 style='mso-height-source:userset;height:9.75pt'>
  <td height=13 style='height:9.75pt'></td>
  <td></td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 style='height:22.5pt'></td>
  <td colspan=3 class=xl83 width=316 style='border-right:2.0pt double black;
  width:237pt'>TH&#7866; NHÂN VIÊN</td>
  <td></td>
   <%
        //Hình 2

           if (j < irow)
           {
   %>
  <td colspan=3 class=xl83 width=325 style='border-right:2.0pt double black;
  width:244pt'>TH&#7866; NHÂN VIÊN</td>
 </tr>
  <%} %>
 <tr height=34 style='mso-height-source:userset;height:25.5pt'>
  <td height=34 style='height:25.5pt'></td>
  <td rowspan=5 height=126 width=102 style='height:94.5pt;width:77pt'
  align=left valign=top><!--[if gte vml 1]><v:shape id="_x0000_s1041" type="#_x0000_t75"
   style='position:absolute;margin-left:3pt;margin-top:6pt;width:70.5pt;
   height:78.75pt;z-index:11;visibility:visible'>
   <v:imagedata src="..\..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt_total.Rows[i][5].ToString()%>&table_name=<%=Session["APP_DBUSER"].ToString()%>.TC_FSBINARY"" o:title="No Image"/>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:11;margin-left:4px;margin-top:8px;width:94px;
  height:105px'><img width=94 height=105
  src="..\..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt_total.Rows[i][5].ToString()%>&table_name=<%=Session["APP_DBUSER"].ToString()%>.TC_FSBINARY"" alt="No Image" v:shapes="_x0000_s1041"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td rowspan=5 height=126 class=xl71 width=102 style='height:94.5pt;
    width:77pt'>&nbsp;</td>
   </tr>
  </table>
  </span></td>
  <td class=xl65 width=83 style='width:62pt'
  x:str="H&#7885; và Tên:                        ">H&#7885; và Tên:<span
  style='mso-spacerun:yes'>                        </span></td>
  <td class=xl68 width=131 style='width:98pt'><%=dt_total.Rows[i][3].ToString()%></td>
  <td></td>
      <%
        //Hình 2
        
        if (j < irow)
        {
   %>
  <td rowspan=5 height=126 width=102 style='height:94.5pt;width:77pt'
  align=left valign=top><!--[if gte vml 1]><v:shape id="_x0000_s1042" type="#_x0000_t75"
   style='position:absolute;margin-left:3.75pt;margin-top:6.75pt;width:71.25pt;
   height:78.75pt;z-index:12;visibility:visible'>
   <v:imagedata src="..\..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt_total.Rows[j][5].ToString()%>&table_name=<%=Session["APP_DBUSER"].ToString()%>.TC_FSBINARY"" o:title="No Image"/>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:12;margin-left:5px;margin-top:9px;width:95px;
  height:105px'><img width=95 height=105
  src="..\..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt_total.Rows[j][5].ToString()%>&table_name=<%=Session["APP_DBUSER"].ToString()%>.TC_FSBINARY"" alt="No Image" v:shapes="_x0000_s1042"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td rowspan=5 height=126 class=xl71 width=102 style='height:94.5pt;
    width:77pt'>&nbsp;</td>
   </tr>
  </table>
  </span></td>
  <td class=xl65 width=83 style='width:62pt'
  x:str="H&#7885; và Tên:                        ">H&#7885; và Tên:<span
  style='mso-spacerun:yes'>                        </span></td>
  <td class=xl68 width=140 style='width:105pt'><%=dt_total.Rows[j][3].ToString()%></td>
 </tr>
 <%} %>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td height=23 style='height:17.25pt'></td>
  <td class=xl66 width=83 style='border-top:none;width:62pt'>Ch&#7913;c
  v&#7909; :</td>
  <td class=xl69 width=131 style='border-top:none;width:98pt'><%=dt_total.Rows[i][1].ToString()%></td>
  <td></td>
      <%
        //Hình 2
        
        if (j < irow)
        {
   %>
  <td class=xl66 width=83 style='border-top:none;width:62pt'>Ch&#7913;c
  v&#7909; :</td>
  <td class=xl69 width=140 style='border-top:none;width:105pt'><%=dt_total.Rows[j][1].ToString()%></td>
 </tr>
 <%} %>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td height=23 style='height:17.25pt'></td>
  <td class=xl66 width=83 style='border-top:none;width:62pt'>N&#259;m Sinh</td>
  <td class=xl70 width=131 style='width:98pt'><%=dt_total.Rows[i][6].ToString()%></td>
  <td></td>
      <%
        //Hình 2
        
        if (j < irow)
        {
   %>
  <td class=xl66 width=83 style='border-top:none;width:62pt'>N&#259;m Sinh</td>
  <td class=xl70 width=140 style='width:105pt'><%=dt_total.Rows[j][6].ToString()%></td>
 </tr>
 <%} %>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td height=23 style='height:17.25pt'></td>
  <td class=xl66 width=83 style='border-top:none;width:62pt'>MNV:</td>
  <td class=xl67 style='border-top:none'><%=dt_total.Rows[i][2].ToString()%></td>
  <td></td>
      <%
        //Hình 2
        
        if (j < irow)
        {
   %>
  <td class=xl66 width=83 style='border-top:none;width:62pt'>MNV:</td>
  <td class=xl67 style='border-top:none'><%=dt_total.Rows[j][2].ToString()%></td>
 </tr>
 <%} %>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td height=23 style='height:17.25pt'></td>
  <td class=xl66 width=83 style='border-top:none;width:62pt'>Ngày vào :</td>
  <td class=xl70 width=131 style='width:98pt'><%=dt_total.Rows[i][7].ToString()%></td>
  <td></td>
      <%
        //Hình 2
        
        if (j < irow)
        {
   %>
  <td class=xl66 width=83 style='border-top:none;width:62pt'>Ngày vào :</td>
  <td class=xl70 width=140 style='width:105pt'><%=dt_total.Rows[j][7].ToString()%></td>
 </tr>
 <%} %>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 style='height:18.75pt'></td>
  <td colspan=3 class=xl74 width=316 style='border-right:2.0pt double black;
  width:237pt'>(Vui lòng gi&#7919; th&#7867; c&#7849;n th&#7853;n. Xin chân
  thành c&#7843;m <font class="font9">&#417;n!)</font></td>
  <td></td>
      <%
        //Hình 2

          if (j < irow)
          {
   %>
  <td colspan=3 class=xl74 width=325 style='border-right:2.0pt double black;
  width:244pt'>(Vui lòng gi&#7919; th&#7867; c&#7849;n th&#7853;n. Xin chân
  thành c&#7843;m <font class="font9">&#417;n!)</font></td>
 </tr>
 
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 colspan=8 style='height:16.5pt;mso-ignore:colspan'></td>
 </tr>
 <%}
          %>
 
 
  <%
           //end if
    i=i+2;
    }       //end while
  %>
  
  
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=13 style='width:10pt'></td>
  <td width=102 style='width:77pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=131 style='width:98pt'></td>
  <td width=15 style='width:11pt'></td>
  <td width=102 style='width:77pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=140 style='width:105pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
