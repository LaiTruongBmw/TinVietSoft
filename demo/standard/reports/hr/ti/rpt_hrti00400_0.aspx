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
    string p_org, p_wg, p_from, p_to, p_txtID, p_txtOpt;
    p_org = Request.QueryString["p_org"];
    p_from = Request.QueryString["p_from"];
    p_wg = Request.QueryString["p_wg"];
    p_txtOpt = Request.QueryString["p_txtOpt"];
    p_to = Request.QueryString["p_to"];
    p_txtID = Request.QueryString["p_txtID"];
    string SQL="";
    if (p_txtOpt.ToString() == "1")
        SQL =
     "select c.WORKGROUP_NM, a.emp_id,a.full_name,to_char(to_date(work_dt,'yyyymmdd'),'dd/mm/yyyy') " +
        "            ,d.REMARK,to_char(to_date(join_dt,'yyyymmdd'),'dd/mm/yyyy'), decode(b.approve_yn, 'Y', 'YES', 'NO') " +
        "            from thr_employee a, THR_WG_SCH_DETAIL b, thr_work_group c, thr_work_shift d " +
        "            where a.del_if=0 and b.del_if=0  " +
        "            and c.DEL_IF=0 and d.DEL_IF=0 " +
        "            and d.PK = b.THR_WS_PK " +
        "            and a.thr_wg_PK=c.PK " +
        "            and a.pk=b.THR_EMP_PK             " +
        "            and (a.status='A' or a.left_dt > b.work_dt) " +
        "            and b.work_dt >= a.JOIN_DT " +
        "            and b.WORK_DT between '" + p_from + "' and '" + p_to + "' " +
        "            and upper(a.EMP_ID) like '%' || upper('" + p_txtID + "') || '%' " +
        "           AND (   a.tco_org_pk IN ( " +
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
        "          and  decode('" + p_wg + "','ALL','ALL', c.pk )='" + p_wg + "' " +
        "          order by emp_id,work_dt ";
    else
        SQL
        = "select  b.WORKGROUP_NM,a.emp_id,a.full_name,to_char(to_date('" + p_from + "','yyyymmdd'),'dd/mm/yyyy') as work_dt " +
            "            ,null as THR_WS_PK,to_char(to_date(join_dt,'yyyymmdd'),'dd/mm/yyyy'),a.pk,null as thr_ws_detail_pk, 'No' " +
            "            from thr_employee a, thr_work_group b " +
            "            where a.del_if=0  " +
            "            and b.DEL_IF=0 " +
            "            and a.thr_wg_PK=b.PK " +
            "            and (a.status='A' or a.left_dt > '" + p_from + "') " +
            "            and a.JOIN_DT<='" + p_from + "' " +
            "             and upper(a.EMP_ID) like '%' || upper('" + p_txtID + "') || '%' " +
            "           AND (   a.tco_org_pk IN ( " +
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
            "           and  decode('" + p_wg + "','ALL','ALL',a.thr_wg_pk)='" + p_wg + "' " +
            "           minus " +
            "           select c.WORKGROUP_NM,a.emp_id,a.full_name,to_char(to_date(b.work_dt,'yyyymmdd'),'dd/mm/yyyy') as work_dt " +
            "            ,null as THR_WS_PK,to_char(to_date(join_dt,'yyyymmdd'),'dd/mm/yyyy'),a.pk,null as thr_ws_detail_pk " +
            "            from thr_employee a,THR_WG_SCH_DETAIL b, thr_work_group c " +
            "            where a.del_if=0 and b.del_if=0  " +
            "            and c.DEL_IF=0 " +
            "            and a.thr_wg_PK=c.PK " +
            "            and a.pk=b.thr_emp_pk " +
            "            and b.work_dt = '" + p_from + "' " +
            "            and (a.status='A' or a.left_dt > b.work_dt) " +
            "            and b.work_dt >= a.JOIN_DT " +
            "            and upper(a.EMP_ID) like '%' || upper('" + p_txtID + "') || '%' " +
            "           AND (   a.tco_org_pk IN ( " +
            "                              SELECT  g.pk " +
            "                                    FROM tco_org g " +
            "                                   WHERE g.del_if = 0 " +
            "                              START WITH g.pk = " +
            "                                            DECODE ('" + p_org + "', " +
            "                                                    'ALL', 0, " +
            "                                                    '" + p_org + "' " +
            "                                                   ) " +
            "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
            "                        OR '" + p_org + "' = 'ALL') " +
            "           and  decode('" + p_wg + "','ALL','ALL',a.thr_wg_pk)='" + p_wg + "' " +
            "           order by emp_id,work_dt ";

    //Response.Write(SQL);
    //Response.End();
    DataTable dt_emp = CtlLib.TableReadOpen(SQL);    
    if (dt_emp.Rows.Count == 0)
    {
        Response.Write("There is no data to display");
        Response.End();
    }
    int emp_row = dt_emp.Rows.Count;

    p_from = p_from.Insert(6, "-").Insert(4, "-");
    p_to = p_to.Insert(6, "-").Insert(4, "-");


    //Response.Write(d.ToString("dd-MM-yyyy"));

    //Response.End();//"dd\\\/mm\\\/yyyy"
    
%>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_schedule_detail_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_schedule_detail_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_schedule_detail_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Hee</o:Author>
  <o:LastAuthor>Hee</o:LastAuthor>
  <o:LastPrinted>2008-10-02T03:18:11Z</o:LastPrinted>
  <o:Created>2008-10-02T03:07:02Z</o:Created>
  <o:LastSaved>2008-10-02T03:27:26Z</o:LastSaved>
  <o:Company>Hee Nguyen</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.79in .48in 1.0in .5in;
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
	mso-number-format:"Short Date";
	text-align:left;
	vertical-align:middle;}
.xl27
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
	background:#99CCFF;
	mso-pattern:auto none;}
.xl28
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
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl29
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl30
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl31
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
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
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>4</x:SplitHorizontal>
     <x:TopRowBottomPane>4</x:TopRowBottomPane>
     <x:SplitVertical>5</x:SplitVertical>
     <x:LeftColumnRightPane>5</x:LeftColumnRightPane>
     <x:ActivePane>0</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>1</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>0</x:Number>
       <x:ActiveRow>0</x:ActiveRow>
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
  <x:WindowHeight>8700</x:WindowHeight>
  <x:WindowWidth>11355</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$1:$4</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=910 style='border-collapse:
 collapse;table-layout:fixed;width:682pt'>
 <col class=xl24 width=41 style='mso-width-source:userset;mso-width-alt:1499;
 width:31pt'>
 <col class=xl24 width=111 style='mso-width-source:userset;mso-width-alt:4059;
 width:83pt'>
 <col class=xl24 width=68 style='mso-width-source:userset;mso-width-alt:2486;
 width:51pt'>
 <col class=xl24 width=192 style='mso-width-source:userset;mso-width-alt:7021;
 width:144pt'>
 <col class=xl24 width=84 style='mso-width-source:userset;mso-width-alt:3072;
 width:63pt'>
 <col class=xl24 width=339 style='mso-width-source:userset;mso-width-alt:12397;
 width:254pt'>
 <col class=xl24 width=75 style='mso-width-source:userset;mso-width-alt:2742;
 width:56pt'>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl24 width=41 style='height:30.0pt;width:31pt'></td>
  <td class=xl24 width=111 style='width:83pt'></td>
  <td class=xl24 width=68 style='width:51pt'></td>
  <td class=xl34 colspan=3 width=615 style='mso-ignore:colspan;width:461pt'>SCHEDULE
  DETAIL REPORT</td>
  <td class=xl24 width=75 style='width:56pt'></td>
 </tr>
    
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 colspan=3 class=xl24 style='height:19.5pt;mso-ignore:colspan'></td>
  <td class=xl26 x:num><%="From:" + DateTime.Parse(p_from).ToString("dd-MM-yyyy") %></td>
  <td class=xl26 x:num><%="To:"+ DateTime.Parse(p_to).ToString("dd-MM-yyyy")%></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl27 style='height:22.5pt'>No.</td>
  <td class=xl28>Work Group</td>
  <td class=xl28>Emp ID</td>
  <td class=xl28>Full Name</td>
  <td class=xl28>Work DT</td>
  <td class=xl28>Work Shift</td>
  <td class=xl28>Join DT</td>
  <td class=xl28>Approve Y/N</td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl29 style='height:21.0pt'>Stt</td>
  <td class=xl30>Bộ phận</td>
  <td class=xl30>Mã số</td>
  <td class=xl30>Họ và tên</td>
  <td class=xl30>Ngày công</td>
  <td class=xl30>Ca làm việc</td>
  <td class=xl30>Ngày vào</td>
  <td class=xl30>Được duyệt</td>
 </tr>
 <%
     int i = 0;
     for (i = 0; i < emp_row; i++)
     {
 %>
  <tr height=27 style='mso-height-source:userset;height:26pt'>
  <td height=34 class=xl31 width=41 style='height:25.5pt;width:31pt' x:num><%=i+1 %></td>
  <td class=xl32 width=111 style='width:83pt'><%=dt_emp.Rows[i][0].ToString() %></td>
  <td class=xl32 width=68 style='width:51pt'><%=dt_emp.Rows[i][1].ToString() %></td>
  <td class=xl32 width=192 style='width:144pt'><%=dt_emp.Rows[i][2].ToString() %></td>
  <td class=xl33 width=84 style='width:63pt'><%=dt_emp.Rows[i][3].ToString() %></td>
  <td class=xl32 width=339 style='width:254pt'><%=dt_emp.Rows[i][4].ToString() %></td>
  <td class=xl33 width=75 style='width:56pt'><%=dt_emp.Rows[i][5].ToString() %></td>
  <td class=xl33 width=75 style='width:56pt'><%=dt_emp.Rows[i][6].ToString() %></td>
 </tr>
 <%
     }
  %>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=41 style='width:31pt'></td>
  <td width=111 style='width:83pt'></td>
  <td width=68 style='width:51pt'></td>
  <td width=192 style='width:144pt'></td>
  <td width=84 style='width:63pt'></td>
  <td width=339 style='width:254pt'></td>
  <td width=75 style='width:56pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
