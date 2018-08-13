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
    DateTime p_month_dt=new DateTime(int.Parse(p_date.Substring(0,4).ToString()),int.Parse(p_date.Substring(4,2).ToString()),int.Parse(p_date.Substring(6,2).ToString())) ;
    
	string SQL
	= "select c.org_nm c0 " + 
        ",sum(case when a.date_in|| a.time_in <='" + p_date + "' || '11:00' then 1 else 0 end) as c1 " +
        ",sum(case when a.date_in||a.time_in <='" + p_date + "'|| '11:00' then 1 else 0 end)  " +
        "+ sum(case when a.date_in||a.time_in >='" + p_date + "' || '11:01' then 1 else 0 end)  " +
        "- sum(case when a.date_in||a.time_out <='" + p_date + "' || '12:30' then 1 else 0 end) as c2 " +
        ",sum(case when a.date_in|| a.time_in <='" + p_date + "' || '11:00' then 1 else 0 end)*4 " +
        "+(sum(case when a.date_in||a.time_in <='" + p_date + "' || '11:00' then 1 else 0 end)  " +
        "+ sum(case when a.date_in||a.time_in >='" + p_date + "' || '11:01' then 1 else 0 end)  " +
        "- sum(case when a.date_out||a.time_out <='" + p_date + "' || '12:30' then 1 else 0 end))*4 as c3 " +
        ",sum(case when a.date_out||a.time_out between '" + p_date + "' || '17:01' and '" + p_date + "' || '18:14' then 1 else 0 end) c4 " +
        ",sum(case when a.date_out||a.time_out between '" + p_date + "' || '18:15' and '" + p_date + "' || '20:14' then 1 else 0 end) c5 " +
        ",sum(case when a.date_out||a.time_out between '" + p_date + "' || '20:15' and '" + p_date + "' || '21:14' then 1 else 0 end) c7 " +
        ",sum(case when a.date_out||a.time_out between '" + p_date + "' || '21:15' and '" + p_date + "' || '22:14' then 1 else 0 end) c8 " +
        ",sum(case when a.date_out||a.time_out between '" + p_date + "' || '22:15' and to_char(to_date('" + p_date + "','yyyymmdd')+1,'yyyymmdd') || '00:14' then 1 else 0 end) c9 " +
        ",sum(case when a.date_out||a.time_out between to_char(to_date('" + p_date + "','yyyymmdd')+1,'yyyymmdd') || '00:15' and to_char(to_date('" + p_date + "','yyyymmdd')+1,'yyyymmdd') || '06:00' then 1 else 0 end) c10 " +
        ",sum(case when a.date_out||a.time_out between '" + p_date + "' || '17:01' and '" + p_date + "' || '18:14' then 1 else 0 end)*1.5*1.5 " +
        "+sum(case when a.date_out||a.time_out between '" + p_date + "' || '18:15' and '" + p_date + "' || '20:14' then 1 else 0 end)*1.5*2.5 " +
        "+sum(case when a.date_out||a.time_out between '" + p_date + "' || '20:15' and '" + p_date + "' || '21:14' then 1 else 0 end)*1.5*0.5 " +
        "+sum(case when a.date_out||a.time_out between '" + p_date + "' || '21:15' and '" + p_date + "' || '22:14' then 1 else 0 end)*1.95*1 " +
        "+sum(case when a.date_out||a.time_out between '" + p_date + "' || '22:15' and to_char(to_date('" + p_date + "','yyyymmdd')+1,'yyyymmdd') || '00:14' then 1 else 0 end)*1.95*2 " +
        "+sum(case when a.date_out||a.time_out between to_char(to_date('" + p_date + "','yyyymmdd')+1,'yyyymmdd') || '00:15' and to_char(to_date('" + p_date + "','yyyymmdd')+1,'yyyymmdd') || '06:00' then 1 else 0 end)*1.95*5 c11 " +
        "from thr_time_machine a,thr_employee b,tco_org c " +
        "where a.del_if=0 and b.del_if=0 and c.del_if=0 " +
        "and a.thr_emp_pk=b.pk " +
        "and b.tco_org_pk=c.pk and a.work_dt ='" + p_date + "' " +
        "           AND (c.pk IN (SELECT g.pk " +
        "                              FROM tco_org g " +
        "                              WHERE g.del_if = 0 " +
        "       START WITH g.pk = DECODE ('" + p_dept + "','ALL', 0,'" + p_dept + "') " +
        "                            CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                 OR '" + p_dept + "' = 'ALL') " +
        "group by c.pk,c.org_nm,c.seq ORDER BY C.SEQ " ;

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
<link rel=File-List href="rpt_daily_overtime_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_daily_overtime_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_daily_overtime_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>truong</o:Author>
  <o:LastAuthor>truong</o:LastAuthor>
  <o:LastPrinted>2011-09-17T03:01:41Z</o:LastPrinted>
  <o:Created>2011-09-17T03:00:30Z</o:Created>
  <o:LastSaved>2011-09-17T03:34:59Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.42in .17in 1.0in .3in;
	mso-header-margin:.28in;
	mso-footer-margin:.5in;}
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
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;}
.xl25
	{mso-style-parent:style0;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;}
.xl26
	{mso-style-parent:style0;
	text-decoration:underline;
	text-underline-style:single;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border:.5pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl30
	{mso-style-parent:style0;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl31
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl33
	{mso-style-parent:style0;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;}
.xl34
	{mso-style-parent:style0;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl35
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;}
.xl36
	{mso-style-parent:style0;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl37
	{mso-style-parent:style0;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl38
	{mso-style-parent:style0;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl39
	{mso-style-parent:style0;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl41
	{mso-style-parent:style0;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl42
	{mso-style-parent:style0;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl43
	{mso-style-parent:style0;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl44
	{mso-style-parent:style0;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl45
	{mso-style-parent:style0;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl46
	{mso-style-parent:style0;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"Short Time";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl47
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl48
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl49
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl50
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl51
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl52
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl53
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl54
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;
	white-space:normal;}
.xl55
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl56
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;
	border:.5pt solid windowtext;}
.xl57
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl58
	{mso-style-parent:style0;
	text-align:center;
	border:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl59
	{mso-style-parent:style0;
	text-align:center;
	border:.5pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl60
	{mso-style-parent:style0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl61
	{mso-style-parent:style0;
	text-align:center;
	border:1.0pt solid windowtext;
	background:yellow;
	mso-pattern:auto none;}
.xl62
	{mso-style-parent:style0;
	color:white;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl63
	{mso-style-parent:style0;
	color:white;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl64
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;}
.xl65
	{mso-style-parent:style0;
	text-align:center;}
.xl66
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;}
.xl67
	{mso-style-parent:style0;
	font-weight:700;
	text-align:left;}
.xl68
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;}
.xl69
	{mso-style-parent:style0;
	font-weight:700;}
.xl70
	{mso-style-parent:style0;
	text-align:center;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl71
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl72
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:1.0pt solid windowtext;
	background:yellow;
	mso-pattern:auto none;}
.xl73
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;}
.xl74
	{mso-style-parent:style0;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.xl75
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>báo cáo tăng ca</x:Name>
    <x:WorksheetOptions>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>94</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:DoNotDisplayZeros/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>7</x:ActiveRow>
       <x:ActiveCol>10</x:ActiveCol>
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

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=817 style='border-collapse:
 collapse;table-layout:fixed;width:615pt'>
 <col width=132 style='mso-width-source:userset;mso-width-alt:4827;width:99pt'>
 <col width=49 style='mso-width-source:userset;mso-width-alt:1792;width:37pt'>
 <col width=49 style='mso-width-source:userset;mso-width-alt:1792;width:37pt'>
 <col width=78 style='mso-width-source:userset;mso-width-alt:2852;width:59pt'>
 <col width=49 span=6 style='mso-width-source:userset;mso-width-alt:1792;
 width:37pt'>
 <col width=85 style='mso-width-source:userset;mso-width-alt:3108;width:64pt'>
 <col width=64 style='width:48pt'>
 <col width=84 style='mso-width-source:userset;mso-width-alt:3072;width:63pt'>
 <tr height=21 style='height:15.75pt'>
  <td colspan=2 height=21 class=xl24 width=181 style='height:15.75pt;
  width:136pt'>YES VINA CO.,LTD</td>
  <td class=xl25 width=115 style='width:86pt'></td>
  <td colspan=2 rowspan=4 class=xl26 width=127 style='width:96pt'>REPORTED BY</td>
  <td colspan=2 rowspan=4 class=xl28 width=98 style='border-bottom:.5pt solid black;
  width:74pt'>CHECKED BY</td>
  <td colspan=2 rowspan=4 class=xl28 width=98 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:74pt'>FAC.MANAGER</td>
  <td colspan=2 rowspan=4 class=xl28 width=134 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:101pt'>OFF.MANAGER</td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <tr height=28 style='height:21.0pt'>
  <td colspan=3 height=28 class=xl31 width=296 style='height:21.0pt;width:222pt'>WORKING
  HOUR<br>
    <span style='mso-spacerun:yes'> </span>DAILY REPORT</td>
  <td></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=3 height=22 class=xl35 style='height:16.5pt'>ON <%=p_month_dt.ToString("dd/MMM/yyyy").ToUpper().ToString() %></td>
  <td></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=2 height=21 class=xl25 style='height:15.75pt' x:str="UPDATE ">UPDATE<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl25></td>
  <td></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td rowspan=2 height=63 class=xl39 width=132 style='height:47.25pt;
  width:99pt' x:str="SECTION ">SECTION<span style='mso-spacerun:yes'> </span></td>
  <td colspan=2 class=xl40 width=164 style='border-right:.5pt solid black;
  border-left:none;width:123pt'>BASIC W.TIME</td>
  <td rowspan=2 class=xl42 width=78 style='border-bottom:.5pt solid black;
  border-top:none;width:59pt'>BASIC W.Hour(H)</td>
  <td colspan=6 class=xl43 width=294 style='border-right:.5pt solid black;
  width:222pt'>TIME</td>
  <td rowspan=2 class=xl42 width=85 style='border-bottom:.5pt solid black;width:64pt'>OVERTIME<br>
    Hour(H)</td>
  <td></td>
 </tr>
 
 <tr height=42 style='height:31.5pt'>
  <td height=42 class=xl44 width=49 style='height:31.5pt;border-left:none;
  width:37pt' x:str="'07:30 -11:30">07:30 -11:30</td>
  <td class=xl44 width=115 style='border-left:none;width:86pt'
  x:str="'12:30 - 16:30">12:30 - 16:30</td>
  <td class=xl46 width=49 style='border-top:none;border-left:none;width:37pt'
  x:num="0.75">18:00</td>
  <td class=xl46 width=49 style='border-top:none;border-left:none;width:37pt'
  x:num="0.85416666666666663">20:30</td>
  <td class=xl46 width=49 style='border-top:none;border-left:none;width:37pt'
  x:num="0.875">21:00</td>
  <td class=xl46 width=49 style='border-top:none;border-left:none;width:37pt'
  x:num="0.91666666666666663">22:00</td>
  <td class=xl46 width=49 style='border-top:none;border-left:none;width:37pt'
  x:str="'24 :00">24 :00</td>
  <td class=xl46 width=49 style='border-top:none;border-left:none;width:37pt'
  x:str="'06:00">06:00</td>
  <td></td>
 </tr>
 <%
    double[] Group_Total={0,0,0,0,0,0,0,0,0,0};
    
   for (int i=0;i<irow;i++)
   {
        
  %>
 <tr height=17 style='height:12.75pt'>
     <td height=17 class=xl47 style='height:12.75pt'><%=dt_total.Rows[i][0].ToString() %></td>
    <%
        for(int j=0;j<10;j++)
        {
            Group_Total[j]+= double.Parse(dt_total.Rows[i][j+1].ToString());
     %>
  <td height=17 class=xl47 style='height:12.75pt' x:num><%=dt_total.Rows[i][j+1].ToString() %></td>
    <%} %>
 </tr>
<%} %>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl57 style='height:13.5pt'>GRAND TOTAL :</td>
  <%
        for(int j=0;j<10;j++)
        {
     %>
  <td class="<% if (j==9) 
                    Response.Write("xl58");
                else
                        Response.Write("xl59");
                %>" x:num><%=Group_Total[j] %></td>
    <%} %>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=2 class=xl62 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=10 class=xl63 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl64 style='height:13.5pt'>REMARK</td>
  <td></td>
  <td colspan=10 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl66 style='height:13.5pt'>BASIC W.HOUR</td>
  <td class=xl67 colspan=2 style='mso-ignore:colspan' x:str="'7'30 - 16&quot;30">7'30
  - 16&quot;30</td>
  <td class=xl65></td>
  <td class=xl61 x:num><%=Group_Total[0]*4 + Group_Total[1]*4 %></td>
  <td colspan=2 class=xl65 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl65></td>
  <td colspan=3 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td rowspan=6 height=103 class=xl68 style='height:77.25pt' x:str="OVERTIME ">OVERTIME<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl69 colspan=2 style='mso-ignore:colspan'>16:30 - 18:00<span
  style='mso-spacerun:yes'>  </span>* 150%</td>
  <td class=xl65></td>
  <td class=xl70 x:num><%=Group_Total[3]*1.5*1.5%></td>
  <td colspan=7 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl69 colspan=2 style='height:12.75pt;mso-ignore:colspan'>18:00
  - 20:30<span style='mso-spacerun:yes'>  </span>* 150%</td>
  <td class=xl65></td>
  <td class=xl70 x:num ><%=Group_Total[4]*1.5*2.5%></td>
  <td colspan=7 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl69 colspan=2 style='height:12.75pt;mso-ignore:colspan'><span
  style='mso-spacerun:yes'> </span>20:30 - 21:00 * 150%</td>
  <td class=xl65></td>
  <td class=xl70 x:num ><%=Group_Total[5]*1.5*0.5%></td>
  <td colspan=7 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl69 colspan=2 style='height:12.75pt;mso-ignore:colspan'><span
  style='mso-spacerun:yes'> </span>21:00 - 22:00 * 195%</td>
  <td class=xl65></td>
  <td class=xl70 x:num ><%=Group_Total[6]*1.95*1%></td>
  <td colspan=7 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl69 colspan=2 style='height:12.75pt;mso-ignore:colspan'><span
  style='mso-spacerun:yes'> </span>22:00 - 24:00 * 195%</td>
  <td class=xl65></td>
  <td class=xl70 x:num><%=Group_Total[7]*1.95*2%></td>
  <td colspan=7 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl69 colspan=2 style='height:13.5pt;mso-ignore:colspan'><span
  style='mso-spacerun:yes'> </span>24:00 - 5:00<span
  style='mso-spacerun:yes'>   </span>* 195%</td>
  <td class=xl65></td>
  <td class=xl70 x:num><%=Group_Total[8]*1.95*5%></td>
  <td colspan=7 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 style='height:13.5pt'></td>
  <td colspan=3 class=xl71></td>
  <td class=xl72 x:num x:fmla><%=Group_Total[9]%></td>
  <td colspan=7 class=xl65 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl73 style='height:15.75pt'></td>
  <td colspan=7 class=xl74 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl75 style='mso-ignore:colspan'></td>
  <td></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl73 style='height:15.75pt'></td>
  <td colspan=7 class=xl74 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl75 style='mso-ignore:colspan'></td>
  <td></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl73 style='height:15.75pt'></td>
  <td colspan=7 class=xl74 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl75 style='mso-ignore:colspan'></td>
  <td></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl73 style='height:15.75pt'></td>
  <td colspan=7 class=xl74 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl75 style='mso-ignore:colspan'></td>
  <td></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl73 style='height:15.75pt'></td>
  <td colspan=7 class=xl74 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl75 style='mso-ignore:colspan'></td>
  <td></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl73 style='height:15.75pt'></td>
  <td colspan=7 class=xl74 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl75 style='mso-ignore:colspan'></td>
  <td></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl73 style='height:15.75pt'></td>
  <td colspan=7 class=xl74 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl75 style='mso-ignore:colspan'></td>
  <td></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl73 style='height:15.75pt'></td>
  <td colspan=7 class=xl74 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl75 style='mso-ignore:colspan'></td>
  <td></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl73 style='height:15.75pt'></td>
  <td colspan=7 class=xl74 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl75 style='mso-ignore:colspan'></td>
  <td></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl73 style='height:15.75pt'></td>
  <td colspan=7 class=xl74 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl75 style='mso-ignore:colspan'></td>
  <td></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=8 class=xl74 style='height:15.75pt;mso-ignore:colspan'></td>
  <td colspan=3 class=xl75 style='mso-ignore:colspan'></td>
  <td></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=11 class=xl75 style='height:15.75pt;mso-ignore:colspan'></td>
  <td></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=132 style='width:99pt'></td>
  <td width=49 style='width:37pt'></td>
  <td width=115 style='width:86pt'></td>
  <td width=78 style='width:59pt'></td>
  <td width=49 style='width:37pt'></td>
  <td width=49 style='width:37pt'></td>
  <td width=49 style='width:37pt'></td>
  <td width=49 style='width:37pt'></td>
  <td width=49 style='width:37pt'></td>
  <td width=49 style='width:37pt'></td>
  <td width=85 style='width:64pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
