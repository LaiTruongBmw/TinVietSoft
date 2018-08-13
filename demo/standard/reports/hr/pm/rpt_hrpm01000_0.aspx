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
    string p_org, p_wg, p_input, p_from, p_to, p_status;
    p_org = Request.QueryString["p_org"].ToString();
    p_wg = Request.QueryString["p_wg"].ToString();
    p_input = Request.QueryString["p_value"].ToString();
    p_from = Request.QueryString["p_from"].ToString();
    p_to = Request.QueryString["p_to"].ToString();
    p_status = Request.QueryString["p_status"].ToString();
    string SQL
	= "select  a.PK,c.workgroup_nm " + 
        "   ,a.emp_id " +
        "   ,a.full_name " +
        "   ,to_char(to_date(a.join_dt,'yyyymmdd'),'dd/mm/yyyy') " +
        " ,to_char(to_date('" + p_from + "','yyyymmdd'),'dd-mm-yyyy') " +
        " ,to_char(to_date('" + p_to + "','yyyymmdd'),'dd-mm-yyyy')" +
        "   from thr_employee a, thr_work_group c, tco_org d " +
        "   where a.del_if=0 and c.del_if=0 and d.del_if=0 " +
        "   and a.thr_wg_pk=c.pk " +
        "   and a.tco_org_pk=d.pk " +
        "   AND (a.tco_org_pk IN ( " +
        "                              SELECT     g.pk " +
        "                                    FROM tco_org g " +
        "                                   WHERE g.del_if = 0 " +
        "                              START WITH g.pk = " +
        "                                            DECODE ('" + p_org + "', " +
        "                                                    'ALL', 0, " +
        "                                                    '" + p_org + "' " +
        "                                                   ) " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '" + p_org + "' = 'ALL') " +
		"   and decode('" + p_wg + "','ALL','ALL',a.thr_wg_pk )='" + p_wg + "' " +
        "	and decode('" + p_status + "','ALL','ALL',a.status)='" + p_status + "'" +
        "              AND ('" + p_input + "' IS NULL  " +
        "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
        "   and a.pk in (select tc.EMP_PK from thr_children tc " +
        "                where tc.del_if = 0 " +
        "                    and ( '" + p_from + "' between tc.ST_DATE and tc.ED_DATE or '" + p_to + "' between tc.ST_DATE and tc.ED_DATE or '" + p_from + "' is null or '" + p_to + "' is null) " +
        "                group by tc.EMP_PK) " +
        "   order by d.org_nm,c.workgroup_nm,a.emp_id  " ;

    //Response.Write(SQL);
    //Response.End();
    DataTable dt_emp = CtlLib.TableReadOpen(SQL);
    if (dt_emp.Rows.Count == 0)        
    {
        Response.Write("There is no data to show");
        Response.End();
    }    
 %>


<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_baby_allowance_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_baby_allowance_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_baby_allowance_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Hee</o:Author>
  <o:LastAuthor>Hee</o:LastAuthor>
  <o:LastPrinted>2008-11-05T03:53:06Z</o:LastPrinted>
  <o:Created>2008-11-05T03:41:52Z</o:Created>
  <o:LastSaved>2008-11-05T07:40:11Z</o:LastSaved>
  <o:Company>Hee Nguyen</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .34in 1.0in .46in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-page-orientation:landscape;}
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
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;}
.xl27
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:.5pt solid #00CCFF;
	border-bottom:.5pt solid #00CCFF;
	border-left:2.0pt double windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:.5pt solid #00CCFF;
	border-bottom:.5pt solid #00CCFF;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:2.0pt double windowtext;
	border-right:2.0pt double windowtext;
	border-bottom:.5pt solid #00CCFF;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt dashed #00CCFF;
	border-bottom:.5pt dashed #00CCFF;
	border-left:none;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt dashed #00CCFF;
	border-bottom:.5pt dashed #00CCFF;
	border-left:none;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:2.0pt double windowtext;
	border-bottom:.5pt dashed #00CCFF;
	border-left:none;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:2.0pt double windowtext;}
.xl34
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl35
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:2.0pt double windowtext;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl36
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt dashed #00CCFF;
	border-bottom:.5pt dashed #00CCFF;
	border-left:2.0pt double windowtext;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid #00CCFF;
	border-right:.5pt dashed #00CCFF;
	border-bottom:none;
	border-left:2.0pt double windowtext;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid #00CCFF;
	border-right:.5pt dashed #00CCFF;
	border-bottom:none;
	border-left:.5pt dashed #00CCFF;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt dashed #00CCFF;
	border-bottom:.5pt dashed #00CCFF;
	border-left:.5pt dashed #00CCFF;
	white-space:normal;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>3</x:SplitHorizontal>
     <x:TopRowBottomPane>3</x:TopRowBottomPane>
     <x:ActivePane>2</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
       <x:ActiveRow>8</x:ActiveRow>
       <x:ActiveCol>4</x:ActiveCol>
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
  <x:WindowHeight>8445</x:WindowHeight>
  <x:WindowWidth>15195</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>45</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$1:$3</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=921 style='border-collapse:
 collapse;table-layout:fixed;width:692pt'>
 <col class=xl24 width=41 style='mso-width-source:userset;mso-width-alt:1499;
 width:31pt'>
 <col class=xl24 width=126 style='mso-width-source:userset;mso-width-alt:4608;
 width:95pt'>
 <col class=xl24 width=91 style='mso-width-source:userset;mso-width-alt:3328;
 width:68pt'>
 <col class=xl24 width=169 style='mso-width-source:userset;mso-width-alt:6180;
 width:127pt'>
 <col class=xl24 width=138 style='mso-width-source:userset;mso-width-alt:5046;
 width:104pt'>
 <col class=xl24 width=72 style='mso-width-source:userset;mso-width-alt:2633;
 width:54pt'>
 <col class=xl24 width=76 span=2 style='mso-width-source:userset;mso-width-alt:
 2779;width:57pt'>
 <col class=xl24 width=132 style='mso-width-source:userset;mso-width-alt:4827;
 width:99pt'>
 <tr height=30 style='height:22.5pt'>
  <td height=30 class=xl24 width=41 style='height:22.5pt;width:31pt'></td>
  <td class=xl24 width=126 style='width:95pt'></td>
  <td class=xl24 width=91 style='width:68pt'></td>
  <td class=xl25 colspan=2 width=307 style='mso-ignore:colspan;width:231pt'>Baby
  allowance report</td>
  <td class=xl24 width=72 style='width:54pt'></td>
  <td class=xl24 width=76 style='width:57pt'></td>
  <td class=xl24 width=76 style='width:57pt'></td>
  <td class=xl24 width=132 style='width:99pt'></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 colspan=3 class=xl24 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl26>From: <%=dt_emp.Rows[0][5].ToString() %></td>
  <td class=xl26>To: <%=dt_emp.Rows[0][6].ToString() %></td>
  <td colspan=4 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=38 style='mso-height-source:userset;height:28.5pt'>
  <td height=38 class=xl27 width=41 style='height:28.5pt;width:31pt'>No</td>
  <td class=xl28 width=126 style='width:95pt'>Group</td>
  <td class=xl28 width=91 style='width:68pt'>Emp ID</td>
  <td class=xl28 width=169 style='width:127pt'>Name</td>
  <td class=xl28 width=138 style='width:104pt'>Children's name</td>
  <td class=xl28 width=72 style='width:54pt'>Date of birth</td>
  <td class=xl28 width=76 style='width:57pt'>Start date</td>
  <td class=xl28 width=76 style='width:57pt'>End date</td>
  <td class=xl29 width=132 style='width:99pt'>Remark</td>
 </tr>
 <%
     for (int i = 0; i < dt_emp.Rows.Count; i++)
     {
         string sql_detail = "select c.EMP_PK, c.CHILD_NAME, to_char(to_date(c.ST_DATE,'yyyymmdd') " +
         "    ,'dd-mm-yyyy'), to_char(to_date(c.ED_DATE,'yyyymmdd'),'dd-mm-yyyy'), c.REMARK , to_char(to_date(c.birth_date,'yyyymmdd'),'dd-mm-yyyy') " +
        "   from thr_children c " +
        "   where c.DEL_IF = 0 " +
        "   and c.EMP_PK = " + Double.Parse(dt_emp.Rows[i][0].ToString()) +
        "   order by c.ST_DATE ";
         DataTable dt_detail = CtlLib.TableReadOpen(sql_detail);        
  %>
 <tr height=32 style='userset;height:24.0pt'>
  <td rowspan="<%=dt_detail.Rows.Count %>" height=64 class=xl37 width=41 style='border-bottom:.5pt dashed #00CCFF;
  height:24.0pt;border-top:none;width:31pt' x:num><%=i + 1%></td>
  <td rowspan="<%=dt_detail.Rows.Count %>"  class=xl38 width=126 style='border-bottom:.5pt dashed #00CCFF;
  border-top:none;width:95pt'><%=dt_emp.Rows[i][1].ToString() %> </td>
  <td rowspan="<%=dt_detail.Rows.Count %>"  class=xl38 width=91 style='border-bottom:.5pt dashed #00CCFF;
  border-top:none;width:68pt'><%=dt_emp.Rows[i][2].ToString() %> </td>
  <td rowspan="<%=dt_detail.Rows.Count %>"  class=xl38 width=169 style='border-bottom:.5pt dashed #00CCFF;
  border-top:none;width:127pt;text-align:left'><%=dt_emp.Rows[i][3].ToString() %> </td>
  <td class=xl30 width=138 style='width:104pt'><%=dt_detail.Rows[0][1].ToString() %></td>
  <td class=xl31 width=72 style='width:54pt'><%=dt_detail.Rows[0][5].ToString() %></td>
  <td class=xl31 width=76 style='width:57pt'><%=dt_detail.Rows[0][2].ToString() %></td>
  <td class=xl31 width=76 style='width:57pt'><%=dt_detail.Rows[0][3].ToString() %></td>
  <td class=xl32 width=132 style='width:99pt'><%=dt_detail.Rows[0][4].ToString() %></td>
 </tr>
 <%     for (int j = 1; j < dt_detail.Rows.Count; j++)
        {
             %>
 <tr height=32 style='userset;height:24.0pt'>
  <td height=32 class=xl30 width=138 style='height:24.0pt;width:104pt'><%=dt_detail.Rows[j][1].ToString() %></td>
  <td class=xl31 width=72 style='width:54pt'><%=dt_detail.Rows[j][5].ToString() %></td>
  <td class=xl31 width=76 style='width:57pt'><%=dt_detail.Rows[j][2].ToString() %></td>
  <td class=xl31 width=76 style='width:57pt'><%=dt_detail.Rows[j][3].ToString() %></td>
  <td class=xl32 width=132 style='width:99pt'><%=dt_detail.Rows[j][4].ToString() %></td>
 </tr>
 <%
        }
     } 
 %>
 <tr height=3 style='mso-height-source:userset;height:2.25pt'>
  <td height=3 class=xl33 style='height:2.25pt'>&nbsp;</td>
  <td class=xl34>&nbsp;</td>
  <td class=xl34>&nbsp;</td>
  <td class=xl34>&nbsp;</td>
  <td class=xl34>&nbsp;</td>
  <td class=xl34>&nbsp;</td>
  <td class=xl34>&nbsp;</td>
  <td class=xl34>&nbsp;</td>
  <td class=xl35>&nbsp;</td>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 colspan=9 class=xl24 style='height:13.5pt;mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=41 style='width:31pt'></td>
  <td width=126 style='width:95pt'></td>
  <td width=91 style='width:68pt'></td>
  <td width=169 style='width:127pt'></td>
  <td width=138 style='width:104pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=76 style='width:57pt'></td>
  <td width=76 style='width:57pt'></td>
  <td width=132 style='width:99pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
