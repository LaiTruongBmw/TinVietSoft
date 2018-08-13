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
    string p_from, p_to, p_wg, p_org;
    
    p_from = Request.QueryString["p_from"];
    p_wg = Request.QueryString["p_wg"];
    p_to = Request.QueryString["p_to"];          
    string SQL;
	SQL = "select A.WORKGROUP_NM,to_char(to_date(B.WORK_DT,'yyyymmdd'),'dd/mm/yyyy') as w_date " ;
        SQL = SQL + "    ,c.remark, count(d.thr_emp_pk) " ;
        SQL = SQL + "    FROM THR_WORK_GROUP A, THR_WG_SCH_MASTER B, thr_work_shift c,THR_WG_SCH_DETAIL d " ;
        SQL = SQL + "    where a.del_if=0 and b.del_if=0 and c.del_if=0 and c.pk=b.THR_WS_PK " ;
        SQL = SQL + "     	and d.del_if=0 and d.THR_WG_MASTER_PK=b.pk AND A.PK=B.THR_WG_PK " ;
        SQL = SQL + "       and d.work_dt=b.work_dt   AND B.WORK_DT between '"+p_from+"' and '"+p_to+"' " ;
        SQL = SQL + "    and decode('"+p_wg+"','ALL','ALL',a.PK)='"+p_wg+"'" ;
		SQL = SQL + "    group by A.WORKGROUP_NM,to_char(to_date(B.WORK_DT,'yyyymmdd'),'dd/mm/yyyy'),c.remark " ;
    //    SQL = SQL + "    ORDER BY B.WORK_DT " ;

    //Response.Write(SQL);
    //Response.End();
    DataTable dt_emp = CtlLib.TableReadOpen(SQL);
    if (dt_emp.Rows.Count == 0)
    {
        Response.Write("There is no data to display");
        Response.End();
    }
    int emp_row = dt_emp.Rows.Count;
    //Response.Write(emp_row);
    //Response.End();
    //Chuyển ngày vào theo định dạng dd-mm-yyyy
    
    p_from = p_from.Insert(6, "-").Insert(4, "-");
    p_to = p_to.Insert(6, "-").Insert(4, "-");
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_work_schedule_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_work_schedule_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_work_schedule_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Hee</o:Author>
  <o:LastAuthor>Hee</o:LastAuthor>
  <o:LastPrinted>2008-10-02T02:11:41Z</o:LastPrinted>
  <o:Created>2008-10-02T01:47:02Z</o:Created>
  <o:LastSaved>2008-10-02T02:11:51Z</o:LastSaved>
  <o:Company>Hee Nguyen</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .61in 1.0in .6in;
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
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl26
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	font-size:11.0pt;
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
.xl29
	{mso-style-parent:style0;
	font-size:11.0pt;
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
	mso-pattern:auto none;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	font-size:11.0pt;
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
.xl31
	{mso-style-parent:style0;
	font-size:11.0pt;
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
	mso-pattern:auto none;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl33
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl34
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl36
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
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
     <x:ActivePane>2</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>1</x:ActiveRow>
       <x:ActiveCol>2</x:ActiveCol>
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

<table x:str border=0 cellpadding=0 cellspacing=0 width=830 style='border-collapse:
 collapse;table-layout:fixed;width:625pt'>
 <col class=xl24 width=42 style='mso-width-source:userset;mso-width-alt:1536;
 width:32pt'>
 <col class=xl24 width=141 style='mso-width-source:userset;mso-width-alt:5156;
 width:106pt'>
 
 
 <col class=xl24 width=126 style='mso-width-source:userset;mso-width-alt:4608;
 width:95pt'>
  <col class=xl24 width=350 style='mso-width-source:userset;mso-width-alt:12800;
 width:263pt'>
 <col class=xl24 width=85 style='mso-width-source:userset;mso-width-alt:3108;
 width:64pt'>
 

 <col class=xl24 width=86 style='mso-width-source:userset;mso-width-alt:3145;
 width:65pt'>
 <tr height=42 style='mso-height-source:userset;height:31.5pt'>
  <td height=42 class=xl24 width=42 style='height:31.5pt;width:32pt'></td>
  <td class=xl24 width=137 style='width:103pt'></td>
  <td class=xl36 colspan=3 width=382 style='mso-ignore:colspan;width:287pt'>WORK
  SCHEDULE REPORT</td>
  <td class=xl24 width=86 style='width:65pt'></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 colspan=2 class=xl24 style='height:21.0pt;mso-ignore:colspan'></td>
  <td class=xl32>From: <%=DateTime.Parse(p_from).ToString("dd-MM-yyyy")%></td>
  <td class=xl32 colspan=2 style='mso-ignore:colspan'>To: <%=DateTime.Parse(p_to).ToString("dd-MM-yyyy")%></td>
  <td class=xl24></td>
 </tr>
 <tr height=42 style='mso-height-source:userset;height:31.5pt'>
  <td height=42 class=xl28 style='height:31.5pt'>No.</td>
  <td class=xl28 style='border-left:none'>Work Group</td>
  <td class=xl28 style='border-left:none'>Work DT</td>
  <td class=xl28 style='border-left:none'>Work Shift</td>
  <td class=xl29 width=86 style='border-left:none;width:65pt'>Total Emp(s)</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl30 style='height:18.75pt'>Stt</td>
  <td class=xl30 style='border-left:none'>Bộ phận</td>
  <td class=xl30 style='border-left:none'>Ngày</td>
  <td class=xl30 style='border-left:none'>Ca làm việc</td>
  <td class=xl31 width=86 style='border-left:none;width:65pt'>Nhân viên</td>
 </tr>
 <%
     int i = 0;
     double sum = 0;
     for (i = 0; i < emp_row; i++)
     {
 %>
 <tr height=27 style='mso-height-source:userset;height:26pt'>
  <td height=27 class=xl25 width=42 style='height:20.25pt;border-top:none;
  width:32pt' x:num><%=i+1 %></td>
  <td class=xl26 width=137 style='border-top:none;border-left:none;width:103pt'><%=dt_emp.Rows[i][0].ToString() %></td>
  <td class=xl26 width=126 style='border-top:none;border-left:none;width:95pt;text-align:center'><%=dt_emp.Rows[i][1].ToString() %></td>
  <td class=xl27 width=80 style='border-top:none;border-left:none;width:60pt'><%=dt_emp.Rows[i][2].ToString() %></td>
  <td class=xl26 width=176 style='border-top:none;border-left:none;width:132pt;text-align:center' x:num><%=dt_emp.Rows[i][3].ToString() %></td>
  
 </tr>
 <%
     //sum += Double.Parse(dt_emp.Rows[i][4].ToString());            
     }
 %>
 
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=42 style='width:32pt'></td>
  <td width=137 style='width:103pt'></td>
  <td width=126 style='width:95pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=176 style='width:132pt'></td>
  <td width=86 style='width:65pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
