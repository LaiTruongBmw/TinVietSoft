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


string p_tco_org_pk = Request["p_tco_org"].ToString();
string p_status = Request["p_status"].ToString();
string p_year = Request["p_year"].ToString();
string p_thr_wg_pk = Request["p_thr_wg_pk"].ToString();
string p_detail_regulation_type = Request["p_detail_regulation_type"].ToString();
string p_input = Request["p_search_temp"].ToString();
    
string SQL
    = "Select d.org_nm AS ORG_NM " + 
        "        ,g.WORKGROUP_NM as team " +
        "        ,b.EMP_ID " +
        "        ,b.FULL_NAME " +
        "        ,to_char(to_date(b.join_dt,'yyyymmdd'),'dd/mm/yyyy') " +
        "        ,(select code_nm from vhr_hr_code where id='HR0055' and code='"+p_detail_regulation_type+"' ) " +
        "        ,b.social_no " +
        "        ,v.progressive_day " +
        "        ,v.days_01 " +
        "        ,v.days_02 " +
        "        ,v.days_03 " +
        "        ,v.days_04 " +
        "        ,v.days_05 " +
        "        ,v.days_06 " +
        "        ,v.days_07 " +
        "        ,v.days_08 " +
        "        ,v.days_09 " +
        "        ,v.days_10 " +
        "        ,v.days_11 " +
        "        ,v.days_12 " +
        "        from thr_employee b,tco_org d,thr_work_group g, " +
        "            (select a.thr_emp_pk " +
        "            ,sum(days) as progressive_day " +
        "            ,sum(decode(a.ins_month,'"+p_year+"' || '01' ,nvl(days,0),0)) as days_01 " +
        "            ,sum(decode(a.ins_month,'"+p_year+"' || '02' ,nvl(days,0),0)) as days_02 " +
        "            ,sum(decode(a.ins_month,'"+p_year+"' || '03' ,nvl(days,0),0)) as days_03 " +
        "            ,sum(decode(a.ins_month,'"+p_year+"' || '04' ,nvl(days,0),0)) as days_04 " +
        "            ,sum(decode(a.ins_month,'"+p_year+"' || '05' ,nvl(days,0),0)) as days_05 " +
        "            ,sum(decode(a.ins_month,'"+p_year+"' || '06' ,nvl(days,0),0)) as days_06 " +
        "            ,sum(decode(a.ins_month,'"+p_year+"' || '07' ,nvl(days,0),0)) as days_07 " +
        "            ,sum(decode(a.ins_month,'"+p_year+"' || '08' ,nvl(days,0),0)) as days_08 " +
        "            ,sum(decode(a.ins_month,'"+p_year+"' || '09' ,nvl(days,0),0)) as days_09 " +
        "            ,sum(decode(a.ins_month,'"+p_year+"' || '10' ,nvl(days,0),0)) as days_10 " +
        "            ,sum(decode(a.ins_month,'"+p_year+"' || '11' ,nvl(days,0),0)) as days_11 " +
        "            ,sum(decode(a.ins_month,'"+p_year+"' || '12' ,nvl(days,0),0)) as days_12 " +
        "            from " +
        "            VHR_REGULATION a " +
        "            where a.detail_ins_reg_type ='"+p_detail_regulation_type+"' " +
        "            and a.ins_month like '"+p_year+"' || '%' " +
        "            group by a.thr_emp_pk,a.condition,a.condition_note) v " +
        "        where b.del_if=0 and  d.del_if=0 " +
        "        and b.pk=v.thr_emp_pk(+) " +
        "         and b.tco_org_pk=d.pk " +
        "        and g.DEL_IF=0 " +
        "        and g.PK= b.thr_wg_pk " +
        "        and b.PK in(select s.thr_emp_pk from VHR_REGULATION s  " +
        "                                where s.detail_ins_reg_type ='"+p_detail_regulation_type+"' " +
        "                                and s.ins_month like '"+p_year+"' || '%' " +
        "                                and s.thr_emp_pk=b.pk " +
        "                                         group by s.thr_emp_pk ) " +
        "              AND ('" + p_input + "' IS NULL  " +
        "                     OR  (UPPER(B.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(B.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(B.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
        "         AND DECODE ('"+p_thr_wg_pk+"', 'ALL', '"+p_thr_wg_pk+"', b.thr_wg_pk) ='"+p_thr_wg_pk+"' " +
        "        AND (b.TCO_ORG_pk IN ( " +
        "                              SELECT     g.pk " +
        "                                    FROM TCO_ORG g " +
        "                                   WHERE g.del_if = 0 " +
        "                              START WITH g.pk = " +
        "                                            DECODE ('"+p_tco_org_pk+"', " +
        "                                                    'ALL', 0, " +
        "                                                    '"+p_tco_org_pk+"' " +
        "                                                   ) " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+p_tco_org_pk+"' = 'ALL') " +
        "        and b.join_dt <= '"+p_year+"'   || '1231' " +
        "        and (b.left_dt is null or b.left_dt > '"+p_year+"' || '0101' ) " +
        "        and DECODE ('"+p_status+"', 'ALL', '"+p_status+"', b.status) = '"+p_status+"' " +
        "        ORDER BY ORG_NM ,team, b.emp_id, b.full_name,b.social_no,b.join_dt " ;

//Response.Write(SQL);
//Response.End();  
    DataTable dt_emp = CtlLib.TableReadOpen(SQL);
    int emp_row = dt_emp.Rows.Count;
    if(dt_emp.Rows.Count==0)
    {
        Response.Write("There is no data to show");
        Response.End();
    }
    string date_now = DateTime.Now.Day.ToString() + "/" + DateTime.Now.Month.ToString() + "/" + DateTime.Now.Year.ToString();
%>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_regulation_progress_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_regulation_progress_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_regulation_progress_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>ty-ml</o:Author>
  <o:LastAuthor>welcome</o:LastAuthor>
  <o:LastPrinted>2011-12-22T06:33:39Z</o:LastPrinted>
  <o:Created>2008-05-26T08:09:14Z</o:Created>
  <o:LastSaved>2011-12-22T06:37:37Z</o:LastSaved>
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
	margin:.16in .3in .51in .37in;
	mso-header-margin:.16in;
	mso-footer-margin:.28in;
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
	font-family:Arial, sans-serif;
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
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl66
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl67
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl68
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;}
.xl69
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl70
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;}
.xl71
	{mso-style-parent:style0;
	color:blue;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl72
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl73
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl74
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl75
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl76
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl77
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl78
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl79
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl80
	{mso-style-parent:style0;
	color:blue;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl81
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl82
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl83
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl84
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl85
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl86
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl87
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl88
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl89
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl90
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl91
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl92
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl93
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl94
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl95
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
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
      <x:Scale>71</x:Scale>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:LeftColumnVisible>2</x:LeftColumnVisible>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>3</x:ActiveRow>
       <x:ActiveCol>6</x:ActiveCol>
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
  <x:WindowHeight>7935</x:WindowHeight>
  <x:WindowWidth>15195</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>75</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$6:$6</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl65>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1415 style='border-collapse:
 collapse;table-layout:fixed;width:1069pt'>
 <col class=xl77 width=48 style='mso-width-source:userset;mso-width-alt:1755;
 width:36pt'>
 <col class=xl65 width=169 style='mso-width-source:userset;mso-width-alt:6180;
 width:127pt'>
 <col class=xl65 width=98 style='mso-width-source:userset;mso-width-alt:3584;
 width:74pt'>
 <col class=xl65 width=81 style='mso-width-source:userset;mso-width-alt:2962;
 width:61pt'>
 <col class=xl65 width=173 style='mso-width-source:userset;mso-width-alt:6326;
 width:130pt'>
 <col class=xl65 width=75 style='mso-width-source:userset;mso-width-alt:2742;
 width:56pt'>
 <col class=xl65 width=190 style='mso-width-source:userset;mso-width-alt:6948;
 width:143pt'>
 <col class=xl65 width=89 style='mso-width-source:userset;mso-width-alt:3254;
 width:67pt'>
 <col class=xl77 width=84 style='mso-width-source:userset;mso-width-alt:3072;
 width:63pt'>
 <col class=xl77 width=34 span=12 style='mso-width-source:userset;mso-width-alt:
 1243;width:26pt'>
 <tr height=34 style='height:25.5pt'>
  <td colspan=21 height=34 class=xl91 width=1415 style='height:25.5pt;
  width:1069pt'>REGULATION PROGRESSIVE</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=21 height=25 class=xl92 style='height:18.75pt'>YEAR: <%= p_year %></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl78 style='height:15.75pt'></td>
  <td class=xl66></td>
  <td class=xl67></td>
  <td colspan=5 class=xl65 style='mso-ignore:colspan'></td>
  <td colspan=13 class=xl77 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl78 style='height:15.75pt'></td>
  <td class=xl66>Report Date</td>
  <td class=xl68 x:str><%= date_now %></td>
  <td colspan=5 class=xl65 style='mso-ignore:colspan'></td>
  <td colspan=13 class=xl77 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl79 style='height:15.75pt'></td>
  <td class=xl69></td>
  <td class=xl70></td>
  <td class=xl69></td>
  <td class=xl70></td>
  <td colspan=2 class=xl69 style='mso-ignore:colspan'></td>
  <td class=xl71></td>
  <td colspan=13 class=xl80 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td height=32 class=xl72 style='height:24.0pt'>No</td>
  <td class=xl72 style='border-left:none'>Department</td>
  <td class=xl73>Group</td>
  <td class=xl73>Emp ID</td>
  <td class=xl73>Full Name</td>
  <td class=xl73>Join Date</td>
  <td class=xl73>Regulation Kind</td>
  <td class=xl73>Social No</td>
  <td class=xl73>Progressive</td>
  <td colspan=12 class=xl87 style='border-right:.5pt solid black;border-left:
  none'>Month/ Tháng</td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td height=32 class=xl74 style='height:24.0pt'>STT</td>
  <td class=xl74 style='border-left:none'>B&#7897; Ph&#7853;n</td>
  <td class=xl75>Nhóm</td>
  <td class=xl75>Mã NV</td>
  <td class=xl75>H&#7885; và Tên NV</td>
  <td class=xl75>Ngày Vào</td>
  <td class=xl75>Lo&#7841;i Ch&#7871; &#272;&#7897;</td>
  <td class=xl75>S&#7889; S&#7893; BHXH</td>
  <td class=xl75>L&#361;y K&#7871;</td>
  <td class=xl81>01</td>
  <td class=xl81>02</td>
  <td class=xl81>03</td>
  <td class=xl81>04</td>
  <td class=xl81>05</td>
  <td class=xl81>06</td>
  <td class=xl81>07</td>
  <td class=xl81>08</td>
  <td class=xl81>09</td>
  <td class=xl81>10</td>
  <td class=xl81>11</td>
  <td class=xl81>12</td>
 </tr>
 <%
     int count=0;
     double[] total = new double[15];
     for (int j = 0; j < 15; j++)
         total[j] = 0;
     
     for(int i=0; i<emp_row; i++)
     {
         count++;
         for (int j = 7; j < dt_emp.Columns.Count; j++)
             total[j - 7] += double.Parse(dt_emp.Rows[i][j].ToString());
      %>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
  <td height=36 class=xl82 style='height:27.0pt;border-top:none' x:num><%= count %></td>
  <td class=xl83 style='border-top:none;border-left:none'><%=dt_emp.Rows[i][0].ToString() %></td>
  <td class=xl84 style='border-top:none'><%=dt_emp.Rows[i][1].ToString() %></td>
  <td class=xl85 style='border-top:none' x:num><%=dt_emp.Rows[i][2].ToString() %></td>
  <td class=xl84 style='border-top:none'><%=dt_emp.Rows[i][3].ToString() %></td>
  <td class=xl86 style='border-top:none'><%=dt_emp.Rows[i][4].ToString() %></td>
  <td class=xl86 style='border-top:none'><%=dt_emp.Rows[i][5].ToString() %></td>
  <td class=xl85 style='border-top:none' x:str><%=dt_emp.Rows[i][6].ToString() %></td>
  <td class=xl93 width=84 style='border-top:none;width:63pt' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_emp.Rows[i][7].ToString() %> </td>
  <td class=xl93 width=34 style='border-top:none;width:26pt' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_emp.Rows[i][8].ToString() %> </td>
  <td class=xl94 style='border-top:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_emp.Rows[i][9].ToString() %> </td>
  <td class=xl95 width=34 style='border-top:none;width:26pt' x:num><span
  style='mso-spacerun:yes'>     </span><%=dt_emp.Rows[i][10].ToString() %> </td>
  <td class=xl93 width=34 style='border-top:none;width:26pt' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_emp.Rows[i][11].ToString() %> </td>
  <td class=xl94 style='border-top:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_emp.Rows[i][12].ToString() %> </td>
  <td class=xl95 width=34 style='border-top:none;width:26pt' x:num><span
  style='mso-spacerun:yes'>     </span><%=dt_emp.Rows[i][13].ToString() %> </td>
  <td class=xl93 width=34 style='border-top:none;width:26pt' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_emp.Rows[i][14].ToString() %> </td>
  <td class=xl94 style='border-top:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_emp.Rows[i][15].ToString() %> </td>
  <td class=xl95 width=34 style='border-top:none;width:26pt' x:num><span
  style='mso-spacerun:yes'>     </span><%=dt_emp.Rows[i][16].ToString() %> </td>
  <td class=xl93 width=34 style='border-top:none;width:26pt' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_emp.Rows[i][17].ToString() %> </td>
  <td class=xl94 style='border-top:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_emp.Rows[i][18].ToString() %> </td>
  <td class=xl95 width=34 style='border-top:none;width:26pt' x:num><span
  style='mso-spacerun:yes'>     </span><%=dt_emp.Rows[i][19].ToString() %> </td>
 </tr
 <%} %>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td colspan=8 height=31 class=xl89 style='height:23.25pt'>TOTAL <%=count %> EMPLOYEES</td>
  <td class=xl96 x:num><span style='mso-spacerun:yes'> </span><%= total[0] %> </td>
  <td class=xl96 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= total[1] %> </td>
  <td class=xl96 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= total[2] %> </td>
  <td class=xl96 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= total[3] %> </td>
  <td class=xl96 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= total[4] %> </td>
  <td class=xl96 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= total[5] %> </td>
  <td class=xl96 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= total[6] %> </td>
  <td class=xl96 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= total[7] %> </td>
  <td class=xl96 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= total[8] %> </td>
  <td class=xl96 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= total[9] %> </td>
  <td class=xl96 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= total[10] %> </td>
  <td class=xl96 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= total[11] %> </td>
  <td class=xl96 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%= total[12] %> </td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt'></td>
  <td colspan=3 class=xl65 style='mso-ignore:colspan'></td>
  <td class=xl76></td>
  <td colspan=3 class=xl65 style='mso-ignore:colspan'></td>
  <td colspan=13 class=xl77 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=48 style='width:36pt'></td>
  <td width=169 style='width:127pt'></td>
  <td width=98 style='width:74pt'></td>
  <td width=81 style='width:61pt'></td>
  <td width=173 style='width:130pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=190 style='width:143pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=84 style='width:63pt'></td>
  <td width=34 style='width:26pt'></td>
  <td width=34 style='width:26pt'></td>
  <td width=34 style='width:26pt'></td>
  <td width=34 style='width:26pt'></td>
  <td width=34 style='width:26pt'></td>
  <td width=34 style='width:26pt'></td>
  <td width=34 style='width:26pt'></td>
  <td width=34 style='width:26pt'></td>
  <td width=34 style='width:26pt'></td>
  <td width=34 style='width:26pt'></td>
  <td width=34 style='width:26pt'></td>
  <td width=34 style='width:26pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
