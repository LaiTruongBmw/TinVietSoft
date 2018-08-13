<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<% 
    Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
    string p_tco_org_pk, p_nation, p_emp_search, p_select_date, p_from_date, p_to_date, p_status, p_salary_yn, p_position;
        string p_user, p_sal_security;
        string p_data, p_lang;

        p_user = Request["p_user"].ToString();
        p_tco_org_pk = Request["p_tco_org_pk"].ToString();
        p_nation = Request["p_nation"].ToString();
        p_emp_search = Request["p_emp_search"].ToString();
        p_select_date = Request["p_select_date"].ToString();
        p_from_date = Request["p_from_date"].ToString();
        p_to_date = Request["p_to_date"].ToString();
        p_salary_yn = Request["p_salary_yn"].ToString();
        p_position = Request["p_position"].ToString();
        p_status = Request["p_status"].ToString();
        p_sal_security = Request["p_sal_security"].ToString();
        p_data = Request["p_data"].ToString();
        p_lang = Request["p_lang"].ToString();
    
    
    string SQL;
    SQL = " select to_char(sysdate,'dd/mm/yyyy') ,c.org_nm,b.workgroup_nm,a.emp_id,a.old_id,a.full_name,a.photo_pk,a.ID_NUM ";
    SQL = SQL + ",to_char(to_date(join_dt,'yyyymmdd'),'dd/mm/yyyy') ";
    SQL = SQL + ",a.PRO_SAL,a.BASIC_SAL ";
    SQL = SQL + ",a.ALLOW_AMT1,a.ALLOW_AMT2,a.ALLOW_AMT3,a.ALLOW_AMT4,a.ALLOW_AMT5,a.ALLOW_AMT6,a.ALLOW_AMT7,a.ALLOW_AMT8 ";
    SQL = SQL + ",decode(length(birth_dt),4,birth_dt,to_char(to_date(BIRTH_DT,'yyyymmdd'),'dd/mm/yyyy')) ";
    SQL = SQL + ",(select code_nm from vhr_hr_code where id='HR0021' and code=a.PLACE_BIRTH) ";
    SQL = SQL + ",(select code_nm from vhr_hr_code where id='HR0010' and code=a.JOB_TYPE) ";
    SQL = SQL + ",(select code_nm from vhr_hr_code where id='HR0008' and code=a.POS_TYPE) ";
    SQL = SQL + ",(select m.KIND_NAME from thr_employee_kind  m where a.employee_kind_pk=m.pk and m.del_if=0)";
    SQL = SQL + ",(select m.PL_CD from tac_abpl m  where m.del_if=0 and m.pk=a.project_pk ) ";
    SQL = SQL + "from thr_employee a,thr_work_group b,tco_org c ";
    SQL = SQL + "where a.del_if=0 and b.del_if=0 and c.del_if=0 ";
    SQL = SQL + "and a.thr_wg_pk=b.pk  ";
    SQL = SQL + "and a.tco_org_pk=c.pk ";
    SQL = SQL + "and decode('" + p_nation + "','ALL','ALL',a.NATION )='" + p_nation + "'";
	SQL = SQL + "     and ('" + p_emp_search + "' is null  " +
	"                 or  (upper(a.emp_id) like  '%' || upper('" + p_emp_search + "')|| '%') " +
	"                 or  (upper(a.old_id ) like  '%' || upper('" + p_emp_search + "')|| '%') " +
	"                 or  (upper(a.full_name) like  '%' || upper('" + p_emp_search + "')|| '%')) " +
	"     and (('" + p_from_date + "' is null and '" + p_to_date + "' is null) " +
	"            or ('" + p_select_date + "' = 1 and (decode(length(a.birth_dt),4,a.birth_dt || '0101',a.birth_dt) between '" + p_from_date + "' and '" + p_to_date + "'))  " +
	"            or ('" + p_select_date + "' = 2 and a.join_dt between '" + p_from_date + "' and '" + p_to_date + "') " +
	"            or ('" + p_select_date + "' = 3 and a.left_dt between '" + p_from_date + "' and '" + p_to_date + "') " +
	"         ) " +
	"     and decode('" + p_salary_yn + "','ALL','ALL',a.salary_yn )='" + p_salary_yn + "' " +
	"     and decode('" + p_position + "','ALL','ALL',a.pos_type )='" + p_position + "' " +
	"     and decode('" + p_status + "','ALL','ALL',a.status)='" + p_status + "' " +
	"      and (   a.tco_org_pk in ( " +
	"                              select     g.pk " +
	"                                    from tco_org g " +
	"                                   where g.del_if = 0 " +
	"                              start with g.pk = " +
	"                                            decode ('" + p_tco_org_pk + "', " +
	"                                                    'ALL', 0, " +
	"                                                    '" + p_tco_org_pk + "' " +
	"                                                   ) " +
	"                              connect by prior g.pk = g.p_pk) " +
	"                        or '" + p_tco_org_pk + "' = 'ALL') " +
	"order by nvl(c.seq,99999), c.org_nm, emp_id ";
   // Response.Write(SQL);
   // Response.End();
    DataTable dt_total = CtlLib.TableReadOpen(SQL);
    int irow;
    irow = dt_total.Rows.Count;
    if (irow == 0)
    {
        Response.Write("There is no data");
        Response.End();
    }
    
    string SQL_Allow
	= "   SELECT MAX (code1), MAX (code2), MAX (code3), MAX (code4), MAX (code5), " + 
        "             MAX (code6), MAX (code7), MAX (code8), MAX (c1), MAX (c2), " +
        "             MAX (c3), MAX (c4), MAX (c5), MAX (c6), MAX (c7), MAX (c8), " +
        "           MAX (codef1), MAX (codef2), MAX (codef3), MAX (codef4), MAX (codef5), " + 
        "             MAX (codef6), MAX (codef7), MAX (codef8) " +
        "        FROM (SELECT DECODE (code, 'A1', a.code_nm, '') AS code1, " +
        "                     DECODE (code, 'A2', a.code_nm, '') AS code2, " +
        "                     DECODE (code, 'A3', a.code_nm, '') AS code3, " +
        "                     DECODE (code, 'A4', a.code_nm, '') AS code4, " +
        "                     DECODE (code, 'A5', a.code_nm, '') AS code5, " +
        "                     DECODE (code, 'A6', a.code_nm, '') AS code6, " +
        "                     DECODE (code, 'A7', a.code_nm, '') AS code7, " +
        "                     DECODE (code, 'A8', a.code_nm, '') AS code8, " +
        "                     DECODE (code, 'A1', a.num_2, '') AS c1, " +
        "                     DECODE (code, 'A2', a.num_2, '') AS c2, " +
        "                     DECODE (code, 'A3', a.num_2, '') AS c3, " +
        "                     DECODE (code, 'A4', a.num_2, '') AS c4, " +
        "                     DECODE (code, 'A5', a.num_2, '') AS c5, " +
        "                     DECODE (code, 'A6', a.num_2, '') AS c6, " +
        "                     DECODE (code, 'A7', a.num_2, '') AS c7, " +
        "                     DECODE (code, 'A8', a.num_2, '') AS c8, " +
        "                     DECODE (code, 'A1', a.code_fnm, '') AS codef1, " +
        "                     DECODE (code, 'A2', a.code_fnm, '') AS codef2, " +
        "                     DECODE (code, 'A3', a.code_fnm, '') AS codef3, " +
        "                     DECODE (code, 'A4', a.code_fnm, '') AS codef4, " +
        "                     DECODE (code, 'A5', a.code_fnm, '') AS codef5, " +
        "                     DECODE (code, 'A6', a.code_fnm, '') AS codef6, " +
        "                     DECODE (code, 'A7', a.code_fnm, '') AS codef7, " +
        "                     DECODE (code, 'A8', a.code_fnm, '') AS codef8 " +
        "                FROM vhr_hr_code a " +
        "               WHERE a.ID = 'HR0019'  ) allow_amt " ;
       
     
    DataTable dt_Allow = CtlLib.TableReadOpen(SQL_Allow);
    int irow_Allow;
    irow_Allow = dt_Allow.Rows.Count;
    if (irow_Allow == 0)
    {
        Response.Write("There is no data of allowance");
        Response.End();
    }
   
 %>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_employee_list_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_employee_list_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_employee_list_files/oledata.mso">
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
  <o:LastAuthor>ty-ml</o:LastAuthor>
  <o:LastPrinted>2008-05-23T08:14:08Z</o:LastPrinted>
  <o:Created>2008-05-23T07:19:16Z</o:Created>
  <o:LastSaved>2008-07-08T08:09:59Z</o:LastSaved>
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
	margin:.41in .11in .26in .15in;
	mso-header-margin:.24in;
	mso-footer-margin:.14in;
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
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl26
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl29
	{mso-style-parent:style0;
	font-size:12.0pt;
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
.xl30
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl31
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl32
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
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
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl34
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl35
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;}
.xl36
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl37
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl38
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl39
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl40
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl41
	{mso-style-parent:style0;
	color:#3366FF;
	font-size:16.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
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
      <x:PaperSizeIndex>5</x:PaperSizeIndex>
      <x:Scale>55</x:Scale>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>6</x:SplitHorizontal>
     <x:TopRowBottomPane>6</x:TopRowBottomPane>
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
       <x:ActiveRow>7</x:ActiveRow>
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
  <x:WindowHeight>7935</x:WindowHeight>
  <x:WindowWidth>11355</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>75</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$5:$6</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1027"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=2314 style='border-collapse:
 collapse;table-layout:fixed;width:1742pt'>
 <col class=xl24 width=47 style='mso-width-source:userset;mso-width-alt:1718;
 width:35pt'>
 <col class=xl24 width=118 style='mso-width-source:userset;mso-width-alt:4315;
 width:89pt'>
 <col class=xl24 width=114 style='mso-width-source:userset;mso-width-alt:4169;
 width:86pt'>
 <col class=xl24 width=82 style='mso-width-source:userset;mso-width-alt:2998;
 width:62pt'>
 <col class=xl24 width=82 style='mso-width-source:userset;mso-width-alt:2998;
 width:62pt'>
 <col class=xl24 width=172 style='mso-width-source:userset;mso-width-alt:6290;
 width:129pt'>
 <col class=xl24 width=62 style='mso-width-source:userset;mso-width-alt:2267;
 width:47pt'>
 <col class=xl24 width=90 span=2 style='mso-width-source:userset;mso-width-alt:
 3291;width:68pt'>
 <%if (p_sal_security=="Y")
 { %>
 <col class=xl24 width=124 style='mso-width-source:userset;mso-width-alt:4534;
 width:93pt'>
 <col class=xl24 width=119 style='mso-width-source:userset;mso-width-alt:4352;
 width:89pt'>
  <!--allow-->
 <col class=xl24 width=106 span=4 style='mso-width-source:userset;mso-width-alt:
 3876;width:80pt'>
 <col class=xl24 width=122 style='mso-width-source:userset;mso-width-alt:4461;
 width:92pt'>
 <col class=xl24 width=106 span=3 style='mso-width-source:userset;mso-width-alt:
 3876;width:80pt'>
 <!--end allow--> 
 <%} %>
 <col class=xl24 width=89 style='mso-width-source:userset;mso-width-alt:3254;
 width:67pt'>
 <col class=xl24 width=99 style='mso-width-source:userset;mso-width-alt:3620;
 width:74pt'>
 <col class=xl24 width=108 style='mso-width-source:userset;mso-width-alt:3949;
 width:81pt'>
 <col class=xl24 width=136 style='mso-width-source:userset;mso-width-alt:4973;
 width:102pt'>
 <tr height=38 style='mso-height-source:userset;height:28.5pt'>
  <td colspan=24 height=38 class=xl41 width=2314 style='height:28.5pt;
  width:1742pt'>LIST OF EMPLOYEES</td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl24 style='height:15.75pt'></td>
  <td class=xl35>Reporter</td>
  <td class=xl26 style='border-left:none'><%= p_user %></td>
  <td colspan=21 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl24 style='height:15.75pt'></td>
  <td class=xl36 style='border-top:none'>Report Date</td>
  <td class=xl27 style='border-top:none;border-left:none' x:num><%=dt_total.Rows[0][0].ToString()%></td>
  <td colspan=21 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl24 style='height:15.75pt'></td>
  <td class=xl36>&nbsp;</td>
  <td class=xl27 style='border-left:none'>&nbsp;</td>
  <td colspan=21 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl25 height=43 style='mso-height-source:userset;height:32.25pt'>
  <td height=43 class=xl33 style='height:32.25pt'>No</td>
  <td class=xl33 style='border-left:none'>Department</td>
  <td class=xl33 style='border-left:none'>Group</td>
  <td class=xl33 style='border-left:none'>Emp ID</td>
  <td class=xl33 style='border-left:none'>Old ID</td>
  <td class=xl33 style='border-left:none'>Full Name</td>
  <td class=xl33 style='border-left:none'>Photo</td>
  <td class=xl33 style='border-left:none'>ID Num</td>
  <td class=xl33 style='border-left:none'>Join Date</td>
  <td class=xl33 style='border-left:none'>Employee Kind</td>
  <td class=xl33 style='border-left:none'>Project</td>
  <%if (p_sal_security=="Y")
 { %>
  <td class=xl33 style='border-left:none'>Probation Salary</td>
  <td class=xl33 style='border-left:none'>Basic Salary</td>
  <%} %>
<%
    if (dt_Allow.Rows[0][8].ToString()=="1" && p_sal_security=="Y" ) //xet xem allowance type co hay khong?
    {
%>
  <td class=xl33 style='border-left:none'><% =dt_Allow.Rows[0][0].ToString()%></td>
   <%  } %>  
   <%
    if (dt_Allow.Rows[0][9].ToString()=="1" && p_sal_security=="Y") //xet xem allowance type co hay khong?
    {
%>
  <td class=xl33 style='border-left:none'><% =dt_Allow.Rows[0][1].ToString()%></td>  
  <%} %> 
  <%
    if (dt_Allow.Rows[0][10].ToString()=="1" && p_sal_security=="Y") //xet xem allowance type co hay khong?
    {
%>
  <td class=xl33 style='border-left:none'><% =dt_Allow.Rows[0][2].ToString()%></td> 
  <%} %> 
  <%
    if (dt_Allow.Rows[0][11].ToString()=="1" && p_sal_security=="Y") //xet xem allowance type co hay khong?
    {
%>
  <td class=xl33 style='border-left:none'><% =dt_Allow.Rows[0][3].ToString()%></td> 
  <%} %>
  <%
    if (dt_Allow.Rows[0][12].ToString()=="1" && p_sal_security=="Y") //xet xem allowance type co hay khong?
    {
%>
  <td class=xl33 style='border-left:none'><% =dt_Allow.Rows[0][4].ToString()%></td>  
  <%} %>
  <%
    if (dt_Allow.Rows[0][13].ToString()=="1" && p_sal_security=="Y") //xet xem allowance type co hay khong?
    {
%>
  <td class=xl33 style='border-left:none'><% =dt_Allow.Rows[0][5].ToString()%></td>  
  <%} %>
  <%
    if (dt_Allow.Rows[0][14].ToString()=="1" && p_sal_security=="Y") //xet xem allowance type co hay khong?
    {
%>
  <td class=xl33 style='border-left:none'><% =dt_Allow.Rows[0][6].ToString()%></td>  
  <%} %>
  <%
    if (dt_Allow.Rows[0][15].ToString()=="1" && p_sal_security=="Y") //xet xem allowance type co hay khong?
    {
%>
  <td class=xl33 style='border-left:none'><% =dt_Allow.Rows[0][7].ToString()%></td>  
  <%} %>
  <td class=xl33 style='border-left:none'>Birth Date</td>
  <td class=xl33 style='border-left:none'>Place Birth</td>
  <td class=xl33 style='border-left:none'>Job</td>
  <td class=xl33 style='border-left:none'>Position</td>
 </tr> 
 <tr class=xl25 height=43 style='mso-height-source:userset;height:32.25pt'>
  <td height=43 class=xl34 style='height:32.25pt;border-top:none'>STT</td>
  <td class=xl34 style='border-top:none;border-left:none'>B&#7897; ph&#7853;n</td>
  <td class=xl34 style='border-top:none;border-left:none'>Nhóm</td>
  <td class=xl34 style='border-top:none;border-left:none'>Mã NV</td>
  <td class=xl34 style='border-top:none;border-left:none'>Mã Cũ</td>
  <td class=xl34 style='border-top:none;border-left:none'>H&#7885; và tên</td>
  <td class=xl34 style='border-top:none;border-left:none'>Hình</td>
  <td class=xl34 style='border-top:none;border-left:none'>S&#7889; th&#7867;</td>
  <td class=xl34 style='border-top:none;border-left:none'>Ngày vào</td>
  <td class=xl34 style='border-top:none;border-left:none'>Loại nhân viên</td>
  <td class=xl34 style='border-top:none;border-left:none'>Dự án</td>
  
     <%if (p_sal_security=="Y")
 { %>
  <td class=xl34 style='border-top:none;border-left:none'>L&#432;&#417;ng
  th&#7917; vi&#7879;c</td>
  <td class=xl34 style='border-top:none;border-left:none'>L&#432;&#417;ng chính
  th&#7913;c</td> 
  <%} %>
  <%
    if (dt_Allow.Rows[0][8].ToString()=="1" && p_sal_security=="Y") //xet xem allowance type co hay khong?
    {
%>
  <td class=xl34 style='border-top:none;border-left:none'><% =dt_Allow.Rows[0][16].ToString()%></td>   
  <%} %>
  <%
    if (dt_Allow.Rows[0][9].ToString()=="1" && p_sal_security=="Y") //xet xem allowance type co hay khong?
    {
%>
  <td class=xl34 style='border-top:none;border-left:none'><% =dt_Allow.Rows[0][17].ToString()%></td>  
  <%} %>
  <%
    if (dt_Allow.Rows[0][10].ToString()=="1" && p_sal_security=="Y") //xet xem allowance type co hay khong?
    {
%>
  <td class=xl34 style='border-top:none;border-left:none'><% =dt_Allow.Rows[0][18].ToString()%></td>  
  <%} %>
  <%
    if (dt_Allow.Rows[0][11].ToString()=="1" && p_sal_security=="Y") //xet xem allowance type co hay khong?
    {
%>
  <td class=xl34 style='border-top:none;border-left:none'><% =dt_Allow.Rows[0][19].ToString()%></td>  
  <%} %>
  <%
    if (dt_Allow.Rows[0][12].ToString()=="1" && p_sal_security=="Y") //xet xem allowance type co hay khong?
    {
%>
  <td class=xl34 style='border-top:none;border-left:none'><% =dt_Allow.Rows[0][20].ToString()%></td>  
  <%} %>
  <%
    if (dt_Allow.Rows[0][13].ToString()=="1" && p_sal_security=="Y") //xet xem allowance type co hay khong?
    {
%>
  <td class=xl34 style='border-top:none;border-left:none'><% =dt_Allow.Rows[0][21].ToString()%></td> 
  <%} %>
  <%
    if (dt_Allow.Rows[0][14].ToString()=="1" && p_sal_security=="Y") //xet xem allowance type co hay khong?
    {
%>
  <td class=xl34 style='border-top:none;border-left:none'><% =dt_Allow.Rows[0][22].ToString()%></td> 
  <%} %>
  <%
    if (dt_Allow.Rows[0][15].ToString()=="1" && p_sal_security=="Y") //xet xem allowance type co hay khong?
    {
%>
  <td class=xl34 style='border-top:none;border-left:none'><% =dt_Allow.Rows[0][23].ToString()%></td>  
  <%} %>
  <td class=xl34 style='border-top:none;border-left:none'>Ngày sinh</td>
  <td class=xl34 style='border-top:none;border-left:none'>N&#417;i sinh</td>
  <td class=xl34 style='border-top:none;border-left:none'>Công vi&#7879;c</td>
  <td class=xl34 style='border-top:none;border-left:none'>Ch&#7913;c v&#7909;</td>
 </tr>
 <% 
     string s_format;
     for (int i = 0; i < irow; i++) 
    {
        if (i == irow - 1)
            s_format = ";border-bottom:.5pt solid windowtext";
        else
            s_format = ";";
    %> 
 <tr class=xl28 height=68 style='mso-height-source:userset;height:51.0pt'>
  <td height=68 class=xl29 style='height:51.0pt;border-top:none<%=s_format%>' x:num><%=i+1 %></td>
  <td class=xl30 style='border-top:none;border-left:none<%=s_format%>'><%= dt_total.Rows[i][1].ToString() %></td>
  <td class=xl30 style='border-top:none;border-left:none<%=s_format%>'><%= dt_total.Rows[i][2].ToString() %></td>
  <td class=xl29 style='border-top:none;border-left:none<%=s_format%>'><%= dt_total.Rows[i][3].ToString() %></td>
  <td class=xl30 style='border-top:none;border-left:none<%=s_format%>'><%= dt_total.Rows[i][4].ToString() %></td>
  <td class=xl30 style='border-top:none;border-left:none<%=s_format%>'><%= dt_total.Rows[i][5].ToString() %></td>
  <td height=68 class=xl29 width=62 style='height:51.0pt;border-top:none;
  border-left:none;width:47pt<%=s_format%>'><!--[if gte vml 1]><v:shapetype id="_x0000_t75"
   coordsize="21600,21600" o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe"
   filled="f" stroked="f">
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
  </v:shapetype><v:shape id="_x0000_s1025" type="#_x0000_t75" style='position:absolute;
   margin-left:1.5pt;margin-top:1.5pt;width:43.5pt;height:49.5pt;z-index:1'>
   <v:imagedata src="..\..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt_total.Rows[i][6].ToString()%>&table_name=<%=Session["APP_DBUSER"].ToString()%>.TC_FSBINARY" o:title="03"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td width=2 height=2></td>
   </tr>
   <tr>
    <td></td>
    <td><img width=58 height=66 src="..\..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt_total.Rows[i][6].ToString()%>&table_name=<%=Session["APP_DBUSER"].ToString()%>.TC_FSBINARY"
    v:shapes="_x0000_s1025"></td>
    <td width=2></td>
   </tr>
   <tr>
    <td height=0></td>
   </tr>
  </table>
  </span><![endif]><!--[if !mso & vml]><span style='width:46.5pt;height:51.0pt'></span><![endif]--></td>
  <td class=xl29 style='border-top:none;border-left:none<%=s_format%>' x:num><%=dt_total.Rows[i][7].ToString()%></td>
  <td class=xl31 style='border-top:none;border-left:none<%=s_format%>' x:num><%=dt_total.Rows[i][8].ToString()%></td>
  <td class=xl31 style='border-top:none;border-left:none<%=s_format%>' x:num><%=dt_total.Rows[i][23].ToString()%></td>
  <td class=xl31 style='border-top:none;border-left:none<%=s_format%>' x:num><%=dt_total.Rows[i][24].ToString()%></td>
  <%if (p_sal_security=="Y")
 { %>
  <td class=xl32 style='border-top:none;border-left:none<%=s_format%>' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_total.Rows[i][9].ToString()%></td>
  <td class=xl32 style='border-top:none;border-left:none<%=s_format%>' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_total.Rows[i][10].ToString()%></td>
  <%} %>
  <!--allow-->
  <%
        if (dt_Allow.Rows[0][8].ToString()=="1" && p_sal_security=="Y")
        {
    %>
  <td class=xl32 style='border-top:none;border-left:none<%=s_format%>' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_total.Rows[i][11].ToString()%></td>
  <%} %>
  <%
        if (dt_Allow.Rows[0][9].ToString()=="1" && p_sal_security=="Y")
        {
    %>
  <td class=xl32 style='border-top:none;border-left:none<%=s_format%>' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_total.Rows[i][12].ToString()%></td>
  <%} %>
  <%
        if (dt_Allow.Rows[0][10].ToString()=="1" && p_sal_security=="Y")
        {
    %>
  <td class=xl32 style='border-top:none;border-left:none<%=s_format%>' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_total.Rows[i][13].ToString()%> </td>
  <%} %>
  <%
        if (dt_Allow.Rows[0][11].ToString()=="1" && p_sal_security=="Y")
        {
    %>
  <td class=xl32 style='border-top:none;border-left:none<%=s_format%>' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_total.Rows[i][14].ToString()%></td>
  <%} %>
  <%
        if (dt_Allow.Rows[0][12].ToString()=="1" && p_sal_security=="Y")
        {
    %>
  <td class=xl32 style='border-top:none;border-left:none<%=s_format%>' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_total.Rows[i][15].ToString()%> </td>
  <%} %>
  <%
        if (dt_Allow.Rows[0][13].ToString()=="1" && p_sal_security=="Y")
        {
    %>
  <td class=xl32 style='border-top:none;border-left:none<%=s_format%>' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_total.Rows[i][16].ToString()%> </td>
  <%} %>
  <%
        if (dt_Allow.Rows[0][14].ToString()=="1" && p_sal_security=="Y")
        {
    %>
  <td class=xl32 style='border-top:none;border-left:none<%=s_format%>' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_total.Rows[i][17].ToString()%></td>
  <%} %>
  <%
        if (dt_Allow.Rows[0][15].ToString()=="1" && p_sal_security=="Y")
        {
    %>
  <td class=xl32 style='border-top:none;border-left:none<%=s_format%>' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_total.Rows[i][18].ToString()%></td>
  <%} %>
  <!--end allow-->
  <td class=xl31 style='border-top:none;border-left:none<%=s_format%>' x:str><%=dt_total.Rows[i][19].ToString()%></td>
  <td class=xl30 style='border-top:none;border-left:none<%=s_format%>'><%=dt_total.Rows[i][20].ToString()%></td>
  <td class=xl30 style='border-top:none;border-left:none<%=s_format%>'><%=dt_total.Rows[i][21].ToString()%></td>
  <td class=xl30 style='border-top:none;border-left:none<%=s_format%>'><%=dt_total.Rows[i][22].ToString()%></td>
 </tr>
 
 <%
    }
  %>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=47 style='width:35pt'></td>
  <td width=118 style='width:89pt'></td>
  <td width=114 style='width:86pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=172 style='width:129pt'></td>
  <td width=62 style='width:47pt'></td>
  <td width=90 style='width:68pt'></td>
  <td width=90 style='width:68pt'></td>
  <td width=124 style='width:93pt'></td>
  <td width=119 style='width:89pt'></td>
  <!--allow-->  
  <td width=106 style='width:80pt'></td> 
  <td width=106 style='width:80pt'></td>  
  <td width=106 style='width:80pt'></td>  
  <td width=106 style='width:80pt'></td>  
  <td width=122 style='width:92pt'></td>  
  <td width=106 style='width:80pt'></td>  
  <td width=106 style='width:80pt'></td> 
  <td width=106 style='width:80pt'></td>
  <!--end allow-->
  <td width=89 style='width:67pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=108 style='width:81pt'></td>
  <td width=136 style='width:102pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
