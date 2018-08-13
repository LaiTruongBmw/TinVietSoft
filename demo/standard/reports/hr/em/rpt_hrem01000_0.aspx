<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/msword";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>

<html xmlns:w="urn:schemas-microsoft-com:office:word"
xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
xmlns="http://www.w3.org/TR/REC-html40">
<%
    string pk_list=Request.QueryString["pk_list"].ToString();
    int l1=30;
    
    
    
    
    string SQL
    = "select te.FULL_NAME a0 " +
        " ,decode(length(birth_dt),4,birth_dt,to_char(to_date(BIRTH_DT,'yyyymmdd'),'dd/mm/yyyy'))  a1  " +
        " ,to_char(to_date(te.left_dt,'yyyymmdd'),'dd/mm/yyyy') a2 " +        
        " , to_char(to_date(te.JOIN_DT ,'yyyymmdd'),'dd/mm/yyyy')  a3 " +
        "    ,(select v.CODE_FNM from vhr_hr_code v " +
        "      where v.id='HR0008' and te.POS_TYPE=v.CODE ) as a4 " +
        "    ,re.remark  a5" +
        "    , to_char(to_date(te.LEFT_DT,'yyyymmdd'),'dd-mm-yyyy') as a6 " +
		"    ,(select v.CODE_NM from vhr_hr_code v " +
        "      where v.id='HR0008' and te.POS_TYPE=v.CODE ) as a7 " +
        " from thr_employee te ,thr_employee_resign re " +
        " where te.DEL_IF=0 and re.del_if=0 and re.thr_emp_pk=te.pk " +
        " and re.PK in ("+  pk_list.Substring(0,pk_list.Length-1) +") ";
    //Response.Write(SQL);
    //Response.End();        
    DataTable dt_emp = CtlLib.TableReadOpen(SQL);
    if (dt_emp.Rows.Count == 0)
    {
        Response.Write("There is no data to show");
        Response.End();            
    }
    
    string SQL_Com
	= "select  a.PARTNER_LNAME,a.ADDR1,a.PHONE_NO,a.TCO_BPPHOTO_PK,to_char(sysdate,'MON-YYYY'),to_char(sysdate,'MM-YYYY') " + 
        "from tco_company a " +
        "where a.DEL_IF=0 " +
        "and a.pk in ( select f.tco_company_pk from  " +
        "               tco_org  f " +
        "               where  f.pk IN ( " +
        "                              SELECT     g.pk " +
        "                                    FROM tco_org g " +
        "                                   WHERE g.del_if = 0 " +
        "                              START WITH g.pk = " +
        "                                            DECODE ('ALL', " +
        "                                                    'ALL', 0, " +
        "                                                    'ALL' " +
        "                                                   ) " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR 'ALL' = 'ALL') " +
        "and rownum=1 " ;

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
    int l2 = dt_Com.Rows[0][1].ToString().Length;
    
 %>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 11">
<meta name=Originator content="Microsoft Word 11">
<link rel=File-List href="">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Technical Support</o:Author>
  <o:LastAuthor>Hee</o:LastAuthor>
  <o:Revision>4</o:Revision>
  <o:TotalTime>21</o:TotalTime>
  <o:LastPrinted>2008-09-24T15:04:00Z</o:LastPrinted>
  <o:Created>2008-11-26T02:22:00Z</o:Created>
  <o:LastSaved>2008-11-26T02:26:00Z</o:LastSaved>
  <o:Pages>1</o:Pages>
  <o:Words>284</o:Words>
  <o:Characters>1622</o:Characters>
  <o:Company>Cty Thien Long</o:Company>
  <o:Lines>13</o:Lines>
  <o:Paragraphs>3</o:Paragraphs>
  <o:CharactersWithSpaces>1903</o:CharactersWithSpaces>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Print</w:View>
  <w:DrawingGridHorizontalSpacing>12.05 pt</w:DrawingGridHorizontalSpacing>
  <w:DrawingGridVerticalSpacing>8.2 pt</w:DrawingGridVerticalSpacing>
  <w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>
  <w:DisplayVerticalDrawingGridEvery>0</w:DisplayVerticalDrawingGridEvery>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:Compatibility>
   <w:UsePrinterMetrics/>
   <w:WW6BorderRules/>
   <w:FootnoteLayoutLikeWW8/>
   <w:ShapeLayoutLikeWW8/>
   <w:AlignTablesRowByRow/>
   <w:ForgetLastTabAlignment/>
   <w:LayoutRawTableWidth/>
   <w:LayoutTableRowsApart/>
   <w:UseWord97LineBreakingRules/>
   <w:SelectEntireFieldWithStartOrEnd/>
   <w:UseWord2002TableStyleRules/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" LatentStyleCount="156">
 </w:LatentStyles>
</xml><![endif]--><!--[if !mso]><object
 classid="clsid:38481807-CA0E-42D2-BF39-B33AF135CC4D" id=ieooui></object>
<style>
st1\:*{behavior:url(#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;
	mso-font-charset:2;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:0 268435456 0 0 -2147483648 0;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:1627421319 -2147483648 8 0 66047 0;}
@font-face
	{font-family:VNI-Times;
	panose-1:0 0 0 0 0 0 0 0 0 0;
	mso-font-charset:0;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:3 0 0 0 1 0;}
@font-face
	{font-family:"CG Times";
	mso-font-alt:"Times New Roman";
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:7 0 0 0 147 0;}
@font-face
	{font-family:VNI-Helve;
	panose-1:0 0 0 0 0 0 0 0 0 0;
	mso-font-charset:0;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:3 0 0 0 1 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:VNI-Times;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	font-weight:bold;
	mso-bidi-font-weight:normal;}
h1
	{mso-style-next:Normal;
	margin:0in;
	margin-bottom:.0001pt;
	text-align:center;
	mso-pagination:widow-orphan;
	page-break-after:avoid;
	mso-outline-level:1;
	font-size:18.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:VNI-Helve;
	mso-font-kerning:0pt;
	mso-bidi-font-weight:normal;}
h2
	{mso-style-next:Normal;
	margin:0in;
	margin-bottom:.0001pt;
	text-align:center;
	mso-pagination:widow-orphan;
	page-break-after:avoid;
	mso-outline-level:2;
	font-size:14.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:VNI-Helve;
	mso-bidi-font-weight:normal;}
h3
	{mso-style-next:Normal;
	margin:0in;
	margin-bottom:.0001pt;
	text-align:center;
	mso-pagination:widow-orphan;
	page-break-after:avoid;
	mso-outline-level:3;
	font-size:16.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:VNI-Helve;
	mso-bidi-font-weight:normal;}
h4
	{mso-style-next:Normal;
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	page-break-after:avoid;
	mso-outline-level:4;
	font-size:12.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:VNI-Helve;
	mso-bidi-font-weight:normal;}
h5
	{mso-style-next:Normal;
	margin:0in;
	margin-bottom:.0001pt;
	text-align:center;
	mso-pagination:widow-orphan;
	page-break-after:avoid;
	mso-outline-level:5;
	font-size:13.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:VNI-Helve;
	mso-bidi-font-weight:normal;}
h6
	{mso-style-next:Normal;
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	page-break-after:avoid;
	mso-outline-level:6;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:VNI-Helve;
	mso-bidi-font-weight:normal;}
p.MsoHeading7, li.MsoHeading7, div.MsoHeading7
	{mso-style-next:Normal;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:45.0pt;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	page-break-after:avoid;
	mso-outline-level:7;
	font-size:12.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:VNI-Times;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	font-weight:bold;
	mso-bidi-font-weight:normal;
	text-decoration:underline;
	text-underline:single;}
p.MsoHeading8, li.MsoHeading8, div.MsoHeading8
	{mso-style-next:Normal;
	margin:0in;
	margin-bottom:.0001pt;
	text-align:center;
	mso-pagination:widow-orphan;
	page-break-after:avoid;
	mso-outline-level:8;
	tab-stops:353.25pt;
	font-size:12.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:VNI-Times;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	font-weight:bold;
	mso-bidi-font-weight:normal;}
p.MsoHeading9, li.MsoHeading9, div.MsoHeading9
	{mso-style-next:Normal;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	text-align:justify;
	mso-pagination:widow-orphan;
	page-break-after:avoid;
	mso-outline-level:9;
	tab-stops:49.5pt;
	font-size:10.0pt;
	font-family:VNI-Helve;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	font-style:italic;}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	tab-stops:center 3.0in right 6.0in;
	font-size:12.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:VNI-Times;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	font-weight:bold;
	mso-bidi-font-weight:normal;}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	tab-stops:center 3.0in right 6.0in;
	font-size:12.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:VNI-Times;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	font-weight:bold;
	mso-bidi-font-weight:normal;}
p.MsoBodyTextIndent, li.MsoBodyTextIndent, div.MsoBodyTextIndent
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:49.5pt;
	margin-bottom:.0001pt;
	text-align:justify;
	text-indent:-13.5pt;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:VNI-Helve;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoBodyTextIndent2, li.MsoBodyTextIndent2, div.MsoBodyTextIndent2
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:40.5pt;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:VNI-Helve;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoBodyTextIndent3, li.MsoBodyTextIndent3, div.MsoBodyTextIndent3
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:40.5pt;
	margin-bottom:.0001pt;
	text-align:justify;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:VNI-Helve;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-noshow:yes;
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:8.0pt;
	font-family:Tahoma;
	mso-fareast-font-family:"Times New Roman";
	font-weight:bold;
	mso-bidi-font-weight:normal;}
 /* Page Definitions */
@page Section1
	{size:595.45pt 841.7pt;
	margin:81.9pt 43.1pt 40.95pt 57.55pt;
	mso-header-margin:.5in;
	mso-footer-margin:34.0pt;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
 /* List Definitions */
 @list l0
	{mso-list-id:119880138;
	mso-list-type:hybrid;
	mso-list-template-ids:-1863650948 67698693 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:85.5pt;
	mso-level-number-position:left;
	margin-left:85.5pt;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1
	{mso-list-id:281309455;
	mso-list-type:simple;
	mso-list-template-ids:523379532;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	margin-left:.45in;
	text-indent:-.2in;
	font-family:Symbol;
	color:windowtext;}
@list l2
	{mso-list-id:521868368;
	mso-list-type:simple;
	mso-list-template-ids:523379532;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	margin-left:.45in;
	text-indent:-.2in;
	font-family:Symbol;
	color:windowtext;}
@list l3
	{mso-list-id:1209295926;
	mso-list-type:simple;
	mso-list-template-ids:523379532;}
@list l3:level1
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	margin-left:.45in;
	text-indent:-.2in;
	font-family:Symbol;
	color:windowtext;}
@list l4
	{mso-list-id:1643345201;
	mso-list-type:simple;
	mso-list-template-ids:67698699;}
@list l4:level1
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:.25in;
	mso-level-number-position:left;
	margin-left:.25in;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"CG Times";
	mso-ansi-language:#0400;
	mso-fareast-language:#0400;
	mso-bidi-language:#0400;}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2050">
  <o:colormenu v:ext="edit" fillcolor="none" strokecolor="none"/>
 </o:shapedefaults></xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=EN-US style='tab-interval:.5in'>

<div class=Section1>
<%
    for(int i=0;i<dt_emp.Rows.Count;i++)
    {        
 %>
<h4><o:p>&nbsp;</o:p></h4>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
 style='margin-left:5.4pt;border-collapse:collapse;mso-yfti-tbllook:1184;
 mso-padding-alt:0in 5.4pt 0in 5.4pt'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>
  <td width=346 valign=top style='width:259.85pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='page-break-after:avoid;mso-outline-level:1'><span
  class=grame><span style='font-family:Tahoma'><%=dt_Com.Rows[0][0].ToString() %><o:p></o:p></span></span></p>
  <p class=MsoNormal style='page-break-after:avoid;mso-outline-level:1'><span
  class=grame><span style='font-size:10.0pt;font-family:Tahoma;font-weight:
  normal'><%=dt_Com.Rows[0][1].ToString()%></span></span></p>
  <p class=MsoNormal style='page-break-after:avoid;mso-outline-level:1'><span
  class=SpellE><span style='font-size:10.0pt;font-family:Tahoma;font-weight:
  normal'>Số</span></span><span style='font-size:10.0pt;font-family:Tahoma;
  font-weight:normal'>: <span class=SpellE><%=dt_emp.Rows[i][4].ToString() %></span> <span class=SpellE></span>/
  QĐTV<o:p></o:p></span></p>
  <p class=MsoNormal style='page-break-after:avoid;mso-outline-level:1'><i
  style='mso-bidi-font-style:normal'><span style='font-size:8.0pt;font-family:
  Tahoma;font-weight:normal'>No.<span
  style='mso-spacerun:yes'>                                                                                                         
  </span><span style='mso-spacerun:yes'>                             </span></span></i><span
  style='font-size:18.0pt;font-family:Tahoma;mso-bidi-font-weight:bold'><o:p></o:p></span></p>
  </td>
  <td width=296 valign=top style='width:222.15pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='text-align:center;page-break-after:
  avoid;mso-outline-level:1'><span style='font-size:10.0pt;font-family:Tahoma;
  mso-bidi-font-weight:bold'>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<o:p></o:p></span></p>
  <p class=MsoNormal align=center style='text-align:center;page-break-after:
  avoid;mso-outline-level:1'><span class=SpellE><span style='font-size:10.0pt;
  font-family:Tahoma;font-weight:normal'>Độc</span></span><span
  style='font-size:10.0pt;font-family:Tahoma;font-weight:normal'> <span
  class=SpellE>Lập</span> - <span class=SpellE>Tự</span> Do - <span
  class=SpellE>Hạnh</span> <span class=SpellE>Phúc</span><o:p></o:p></span></p>
  <p class=MsoNormal align=center style='text-align:center;page-break-after:
  avoid;mso-outline-level:1'><i><span style='font-size:10.0pt;font-family:Tahoma'>SOCIALIST
  REPUBLIC OF VIETNAM<o:p></o:p></span></i></p>
  <p class=MsoNormal align=center style='text-align:center;page-break-after:
  avoid;mso-outline-level:1'><i><span style='font-size:10.0pt;font-family:Tahoma;
  font-weight:normal'>Independence – Freedom – Happiness<o:p></o:p></span></i></p>
  <p class=MsoNormal align=center style='text-align:center;page-break-after:
  avoid;mso-outline-level:1'><span style='font-size:8.0pt;font-family:Tahoma;
  font-weight:normal'>-------o0o------<o:p></o:p></span></p>
  <p class=MsoNormal align=right style='text-align:right;page-break-after:avoid;
  mso-outline-level:1'><span style='font-size:10.0pt;font-family:Tahoma;
  font-weight:normal'>.......</span><span lang=VI style='font-size:10.0pt;
  font-family:Tahoma;mso-ansi-language:VI;font-weight:normal'>....</span><span
  style='font-size:10.0pt;font-family:Tahoma;font-weight:normal'>, <span
  class=SpellE>ngày</span> <%=dt_emp.Rows[i][2].ToString().Substring(0,2).ToString()%> <span class=SpellE>tháng</span> <%=dt_emp.Rows[i][2].ToString().Substring(3, 2).ToString()%> <span
  class=SpellE>năm</span> <%=dt_emp.Rows[i][2].ToString().Substring(6, 4).ToString()%>.<o:p></o:p></span></p>
  <p class=MsoNormal align=right style='text-align:right;page-break-after:avoid;
  mso-outline-level:1'><i style='mso-bidi-font-style:normal'><span
  style='font-size:10.0pt;font-family:Tahoma;font-weight:normal'>Date:
  <%=dt_emp.Rows[i][2].ToString()%><o:p></o:p></span></i></p>
  </td>
 </tr>
</table>

<p class=MsoNormal align=center style='text-align:center;page-break-after:avoid;
mso-outline-level:1'><span style='font-size:16.0pt;font-family:Tahoma;
mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=center style='text-align:center;page-break-after:avoid;
mso-outline-level:1'><span style='font-size:18.0pt;font-family:Tahoma;
mso-bidi-font-weight:bold'><span style='mso-spacerun:yes'> </span></span><span
style='font-size:16.0pt;font-family:Tahoma;mso-bidi-font-weight:bold'>QUYẾT
ĐỊNH<o:p></o:p></span></p>

<p class=MsoNormal align=center style='text-align:center;page-break-after:avoid;
mso-outline-level:5'><i><span style='mso-bidi-font-size:12.0pt;font-family:
Tahoma;color:blue;mso-bidi-font-weight:bold'>(V/V:<span
style='mso-spacerun:yes'>  </span>THÔI VIỆC)<o:p></o:p></span></i></p>

<p class=MsoNormal align=center style='text-align:center;page-break-after:avoid;
mso-outline-level:1'><span style='font-size:16.0pt;font-family:Tahoma;
mso-bidi-font-weight:bold'>DECISION <o:p></o:p></span></p>

<p class=MsoNormal align=center style='text-align:center'><i><span
style='mso-bidi-font-size:12.0pt;font-family:Tahoma;mso-bidi-font-weight:bold'>(REF:
RESIGNING)<o:p></o:p></span></i></p>

<p class=MsoNormal align=center style='text-align:center;page-break-after:avoid;
mso-outline-level:2'><span style='font-size:14.0pt;font-family:Tahoma;
mso-bidi-font-weight:bold'><%=dt_Com.Rows[0][0].ToString() %><o:p></o:p></span></p>

<p class=MsoNormal align=center style='text-align:center'><span
style='font-size:14.0pt;font-family:Tahoma;mso-bidi-font-weight:bold'><o:p></o:p></span></p>

<p class=MsoNormal align=center style='text-align:center'><span
style='font-size:6.0pt;font-family:Tahoma;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-left:.45in;text-align:justify;text-indent:
.05in;mso-list:l2 level1 lfo2;tab-stops:list 31.5pt left 49.5pt'><![if !supportLists]><span
style='font-size:10.5pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol;font-weight:normal;mso-bidi-font-style:italic'><span
style='mso-list:Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:10.5pt;font-family:Tahoma;
font-weight:normal'>Căn cứ chức năng và quyền hạn của Tổng<span
style='mso-spacerun:yes'>  </span>Giám Đốc;<i><o:p></o:p></i></span></p>

<p class=MsoNormal style='margin-left:.5in;text-align:justify;page-break-after:
avoid;mso-outline-level:9;tab-stops:49.5pt'><i><span style='font-size:10.5pt;
font-family:Tahoma;font-weight:normal'><span style='mso-spacerun:yes'>   
</span>Based on functions and authorities of General Director;<o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:.45in;text-align:justify;text-indent:
.05in;mso-list:l2 level1 lfo2;tab-stops:list 31.5pt left 49.5pt'><![if !supportLists]><span
style='font-size:10.5pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol;font-weight:normal'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
style='font-size:10.5pt;font-family:Tahoma;font-weight:normal'>Theo đề nghị của
anh/ chị </span><b><span style='font-size:11.0pt;font-family:Tahoma;font-weight:
normal'><%=dt_emp.Rows[i][0].ToString() %></span></b><span style='font-size:10.5pt;font-family:
Tahoma;font-weight:normal'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:49.5pt;text-align:justify;tab-stops:49.5pt'><i><span
style='font-size:10.5pt;font-family:Tahoma;font-weight:normal'>According to the
request from Mr./ Ms. </span></i><i><span style='font-size:11.0pt;font-family:
Tahoma;font-weight:normal'><%=dt_emp.Rows[i][0].ToString() %></span></i><span
style='font-size:10.5pt;font-family:Tahoma;font-weight:normal'>.</span><i><span
style='font-size:10.0pt;font-family:Tahoma;font-weight:normal'><o:p></o:p></span></i></p>

<p class=MsoNormal><span style='font-size:10.0pt;font-family:Tahoma;mso-bidi-font-weight:
bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=center style='text-align:center;page-break-after:avoid;
mso-outline-level:3'><span style='font-size:14.0pt;font-family:Tahoma;
mso-bidi-font-weight:bold'>TỔNG GIÁM ĐỐC</span><span style='font-size:14.0pt;
font-family:Tahoma;font-weight:normal'> </span><span style='font-size:14.0pt;
font-family:Tahoma;mso-bidi-font-weight:bold'>QUYẾT ĐỊNH<o:p></o:p></span></p>

<p class=MsoNormal align=center style='text-align:center;page-break-after:avoid;
mso-outline-level:3'><i><span style='font-size:14.0pt;font-family:Tahoma;
mso-bidi-font-weight:bold'>GENERAL DIRECTOR DECIDES <o:p></o:p></span></i></p>

<p class=MsoNormal><u><span style='font-size:10.0pt;font-family:Tahoma;
font-weight:normal'><o:p><span style='text-decoration:none'>&nbsp;</span></o:p></span></u></p>

<p class=MsoNormal style='text-align:justify'><span style='mso-bidi-font-size:
12.0pt;font-family:Tahoma;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-left:60.25pt;text-align:justify;text-indent:
-48.2pt'><u><span style='font-size:11.0pt;font-family:Tahoma;font-weight:normal'>Điều
1:</span></u><span style='font-size:11.0pt;font-family:Tahoma;font-weight:normal'>
Nay chấp thuận cho anh/ chị <b><%=dt_emp.Rows[i][0].ToString() %></b>
 giữ chức vụ <b><%=dt_emp.Rows[i][4].ToString() %></b> được nghỉ việc kể từ ngày <b><%=dt_emp.Rows[i][2].ToString() %></b>.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:60.25pt;text-align:justify;text-indent:
-48.2pt'><i><u><span style='font-size:11.0pt;font-family:Tahoma;font-weight:
normal'>Article 1:</span></u></i><i><span style='font-size:11.0pt;font-family:
Tahoma;font-weight:normal'> Approve for Mr./ Ms. </span></i><i><span
style='font-size:11.0pt;font-family:Tahoma;font-weight:normal'><%=dt_emp.Rows[i][0].ToString() %></span></i><i><span style='font-size:11.0pt;font-family:Tahoma;font-weight:
normal'> who is <%=dt_emp.Rows[i]["a7"].ToString() %> to resign as his/ her<span
style='mso-spacerun:yes'>  </span>requirement since </span></i><i><span
style='font-size:11.0pt;font-family:Tahoma;font-weight:normal'><%=dt_emp.Rows[i][2].ToString() %></span></i><i><span style='font-size:11.0pt;font-family:Tahoma;font-weight:
normal'>.<o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;text-indent:21.3pt'><i><span
style='font-size:11.0pt;font-family:Tahoma;font-weight:normal'><o:p>&nbsp;</o:p></span></i></p>

<p class=MsoNormal style='margin-left:60.25pt;text-align:justify;text-indent:
-48.2pt'><u><span style='font-size:11.0pt;font-family:Tahoma;font-weight:normal'>Điều
2:</span></u><span style='font-size:11.0pt;font-family:Tahoma;font-weight:normal'>
Anh/ chị <b><%=dt_emp.Rows[i][0].ToString() %></b> chịu trách nhiệm bàn giao công việc theo sự
chỉ đạo của Tổng Giám Đốc.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:60.25pt;text-align:justify;text-indent:
-48.2pt'><i><u><span style='font-size:11.0pt;font-family:Tahoma;font-weight:
normal'>Article 2:</span></u></i><i><span style='font-size:11.0pt;font-family:
Tahoma;font-weight:normal'> Mr./ Ms. </span></i><i><span style='font-size:11.0pt;
font-family:Tahoma;font-weight:normal'><%=dt_emp.Rows[i][0].ToString() %></span></i><i><span
style='font-size:11.0pt;font-family:Tahoma;color:blue;font-weight:normal'> </span></i><i><span
style='font-size:11.0pt;font-family:Tahoma;font-weight:normal'>hands over his
job to assigned staff under General Director’s instruction.<o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;text-indent:21.3pt'><i><span
style='font-size:11.0pt;font-family:Tahoma;font-weight:normal'><o:p>&nbsp;</o:p></span></i></p>

<p class=MsoNormal style='margin-left:60.25pt;text-align:justify;text-indent:
-48.2pt'><u><span style='font-size:11.0pt;font-family:Tahoma;font-weight:normal'>Điều
3:</span></u><span style='font-size:11.0pt;font-family:Tahoma;font-weight:normal'>
Anh/ chị <b><%=dt_emp.Rows[i][0].ToString() %></b>, Trưởng các bộ phận và nhân viên liên quan
chịu trách nhiệm thi hành Quyết định này kể từ ngày ký.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:6.0pt;
margin-left:60.25pt;text-align:justify;text-indent:-48.2pt'><i><u><span
style='font-size:11.0pt;font-family:Tahoma;font-weight:normal'>Article 3:</span></u></i><i><span
style='font-size:11.0pt;font-family:Tahoma;font-weight:normal'> Head of
departments concerning, Mr./ Ms. </span></i><i><span style='font-size:11.0pt;
font-family:Tahoma;font-weight:normal'><%=dt_emp.Rows[i][0].ToString() %></span></i><i><span
style='font-size:11.0pt;font-family:Tahoma;font-weight:normal'> and relevant
staffs have responsibility to follow this decision from the signed date.<span
style='mso-spacerun:yes'>  </span><o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify'><span style='mso-bidi-font-size:
12.0pt;font-family:Tahoma;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='mso-bidi-font-size:
12.0pt;font-family:Tahoma;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
 style='margin-left:17.45pt;border-collapse:collapse;mso-yfti-tbllook:1184;
 mso-padding-alt:0in 5.4pt 0in 5.4pt'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>
  <td width=336 valign=top style='width:252.2pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal><span class=SpellE><i><u><span lang=FR style='font-size:
  8.0pt;font-family:Tahoma;mso-ansi-language:FR;mso-bidi-font-weight:bold'>Nơi</span></u></i></span><i><u><span
  lang=FR style='font-size:8.0pt;font-family:Tahoma;mso-ansi-language:FR;
  mso-bidi-font-weight:bold'> <span class=SpellE>nhận</span>/ Distribution</span></u></i></p>
  <p class=MsoNormal style='text-indent:9.0pt'><i><span style='font-size:8.0pt;
  font-family:Tahoma;font-weight:normal'>- <span class=SpellE>Như</span> <span
  class=SpellE>điều</span> 3/ As Article 3 </span></i></p>
  <p class=MsoNormal style='text-indent:9.0pt'><i><span style='font-size:8.0pt;
  font-family:Tahoma;font-weight:normal'>- <span class=SpellE>Niêm</span> <span
  class=SpellE>yết</span>/ Notice Board </span></i></p>
  <p class=MsoNormal><span class=SpellE><i><u><span style='font-size:8.0pt;
  font-family:Tahoma;mso-bidi-font-weight:bold'>Lưu</span></u></i></span><i><u><span
  style='font-size:8.0pt;font-family:Tahoma;mso-bidi-font-weight:bold'>/
  Filling</span></u></i><i><span style='font-size:8.0pt;font-family:Tahoma;
  font-weight:normal'>: BP HC- NS/ HRA Dept. </span></i></p>
  <p class=MsoNormal style='margin-bottom:6.0pt'><o:p>&nbsp;</o:p></p>
  </td>
  <td width=290 valign=top style='width:217.75pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-bottom:6.0pt;text-align:center'><span
  lang=FR style='mso-bidi-font-size:12.0pt;font-family:Tahoma;mso-ansi-language:
  FR;mso-bidi-font-weight:bold'>KÝ TÊN/ <i>SIGNATURE<o:p></o:p></i></span></p>
  <p class=MsoNormal align=center style='margin-bottom:6.0pt;text-align:center'><i><span
  lang=FR style='mso-bidi-font-size:12.0pt;font-family:Tahoma;mso-ansi-language:
  FR;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></i></p>
  <p class=MsoNormal align=center style='margin-bottom:6.0pt;text-align:center'><i><span
  lang=FR style='mso-bidi-font-size:12.0pt;font-family:Tahoma;mso-ansi-language:
  FR;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></i></p>
  <p class=MsoNormal align=center style='margin-bottom:6.0pt;text-align:center'><i><span
  lang=FR style='mso-bidi-font-size:12.0pt;font-family:Tahoma;mso-ansi-language:
  FR;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></i></p>
  <p class=MsoNormal align=center style='margin-bottom:6.0pt;text-align:center'><i><span
  lang=FR style='mso-bidi-font-size:12.0pt;font-family:Tahoma;mso-ansi-language:
  FR;mso-bidi-font-weight:bold'><%=dt_emp.Rows[i][5].ToString() %></span></i></p>
  </td>
 </tr>
</table>


<%
    }//end for
 %>
</div>

</body>

</html>
