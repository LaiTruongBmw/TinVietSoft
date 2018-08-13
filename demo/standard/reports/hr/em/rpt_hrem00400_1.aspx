<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser("hr");
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
    string p_user,p_date,p_date_text;
    p_user = Request["p_user"].ToString();
    p_date = Request["p_date"].ToString();
    p_date_text = Request["p_date_text"].ToString();
    string p_dept = Request.QueryString["p_dept"].ToString();
    string SQL
	= "select org_nm || '/' || org_lnm t1" + 
        ",nvl(a.ATTENDENCE_MALE,0) + nvl(a.ATTENDENCE_FEMALE,0) " +
        " from thr_employee_daily a,tco_org b " +
        " where a.del_if=0 and b.del_if=0 " +
        " and a.tco_dept_PK=b.pk " +
        "           AND (a.tco_dept_pk IN (SELECT g.pk " +
        "                              FROM tco_org g " +
        "                              WHERE g.del_if = 0 " +
        "       START WITH g.pk = DECODE ('" + p_dept + "','ALL', 0,'" + p_dept + "') " +
        "                            CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                 OR '" + p_dept + "' = 'ALL') " +
        "and a.DAILY_DATE='" + p_date + "' "  +
        " order by nvl(T1,0) ";
       

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
    
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_daily_meal_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_daily_meal_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_daily_meal_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>truong</o:Author>
  <o:LastAuthor>truong</o:LastAuthor>
  <o:LastPrinted>2011-09-16T08:11:49Z</o:LastPrinted>
  <o:Created>2011-09-16T08:11:44Z</o:Created>
  <o:LastSaved>2011-09-16T08:13:39Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.36in .18in .27in .22in;
	mso-header-margin:.25in;
	mso-footer-margin:.21in;}
.font9
	{color:windowtext;
	font-size:11.0pt;
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
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl27
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl28
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl29
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl30
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>báo cơm trưa</x:Name>
    <x:WorksheetOptions>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>86</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>20</x:ActiveRow>
       <x:ActiveCol>6</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>8445</x:WindowHeight>
  <x:WindowWidth>19035</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>90</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl25>

<table x:str border=0 cellpadding=0 cellspacing=0 width=891 style='border-collapse:
 collapse;table-layout:fixed;width:669pt'>
 <col class=xl25 width=57 style='mso-width-source:userset;mso-width-alt:2084;
 width:43pt'>
 <col class=xl25 width=465 style='mso-width-source:userset;mso-width-alt:17005;
 width:349pt'>
 <col class=xl25 width=49 style='mso-width-source:userset;mso-width-alt:1792;
 width:37pt'>
 <col class=xl25 width=64 span=5 style='width:48pt'>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl24 colspan=2 width=522 style='height:15.75pt;
  mso-ignore:colspan;width:392pt'>YES VIETNAM</td>
  <td class=xl25 width=49 style='width:37pt'></td>
  <td class=xl25 width=64 style='width:48pt'></td>
  <td class=xl25 width=64 style='width:48pt'></td>
  <td class=xl25 width=64 style='width:48pt'></td>
  <td class=xl25 width=64 style='width:48pt'></td>
  <td class=xl25 width=64 style='width:48pt'></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td colspan=7 height=25 class=xl26 style='height:18.75pt'>DAILY MEAL REPORT
  /<span style='mso-spacerun:yes'>  </span>PHIẾU BÁO CƠM</td>
  <td class=xl25></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=7 height=20 class=xl27 style='height:15.0pt'>DATE / NGÀY : <font
  class="font9"><%=p_date_text %></font></td>
  <td class=xl25></td>
 </tr>
 <%
    double dsum=0;
    
   for (int i=0;i<irow;i++)
   {
     dsum+= double.Parse(dt_total.Rows[i][1].ToString());
  %>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl27 style='height:15.0pt' x:num><%=i+1 %></td>
  <td class=xl28><% = dt_total.Rows[i][0].ToString()%></td>
  <td class=xl29 x:num><% = dt_total.Rows[i][1].ToString()%></td>
  <td class=xl30 colspan=5 style='mso-ignore:colspan'>…………………………………………...</td>
 </tr>
 <%} %>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl25 style='height:15.0pt'></td>
  <td class=xl25>TOTAL / TỔNG CỘNG:</td>
  <td class=xl29 x:num><%=dsum %></td>
  <td class=xl25></td>
  <td class=xl27>PERSON / NGƯỜI</td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl30 style='height:15.0pt'></td>
  <td class=xl30><span style='mso-spacerun:yes'>   </span>Prepared by</td>
  <td class=xl30></td>
  <td class=xl25></td>
  <td class=xl27>Personal Manager</td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=5 class=xl30 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=57 style='width:43pt'></td>
  <td width=465 style='width:349pt'></td>
  <td width=49 style='width:37pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
