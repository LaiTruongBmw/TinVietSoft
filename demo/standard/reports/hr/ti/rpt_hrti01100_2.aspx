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
    string p_user, p_tco_org_pk, p_wg, p_nation_type, p_input, p_absence_type;
    string p_from_date, p_to_date, p_from_date_text, p_to_date_text, p_absence_type_text, p_days, p_print_type, p_emp_type, p_value;
     
  
    p_tco_org_pk       = Request["p_tco_org_pk"].ToString();
    p_wg      = Request["p_wg"].ToString();
    p_nation_type       = Request["p_nation_type"].ToString();
    p_input = Request["p_search_temp"].ToString();
    p_print_type        = Request["p_print_type"].ToString();
    p_absence_type      = Request["p_absence_type"].ToString();
    p_from_date         = Request["p_from_date"].ToString();
    p_to_date           = Request["p_to_date"].ToString();
    p_from_date_text    = Request["p_from_date_text"].ToString();
    p_to_date_text      = Request["p_to_date_text"].ToString();
    p_user              = Request["p_user"].ToString();
    p_absence_type_text = Request["p_absence_type_text"].ToString();
    p_days              = Request["p_days"].ToString();
    p_emp_type = Request["p_emp_type"].ToString();
    p_value = Request["p_value"].ToString();
   
   

    string SQL;
    SQL = "  SELECT   to_char(sysdate,'dd/mm/yyyy') ,MAX (e.org_nm), MAX (tw.workgroup_nm), a.emp_id, ";
    SQL = SQL + "               MAX (a.full_name), absence.code_nm, ";
    SQL = SQL + "               TO_CHAR (TO_DATE ('" +  p_from_date + "', 'yyyymmdd'), 'dd/mm/yyyy'), ";
    SQL = SQL + "               TO_CHAR (TO_DATE ('" + p_to_date + "', 'yyyymmdd'), 'dd/mm/yyyy'), ";
    SQL = SQL + "                COUNT (*) ";
    SQL = SQL + "        FROM thr_employee a, ";
    SQL = SQL + "               thr_absence b,tco_org e, ";
    SQL = SQL + "               (SELECT code, code_nm, num_1, num_2, num_3 ";
    SQL = SQL + "                  FROM vhr_hr_code ";
    SQL = SQL + "                 WHERE ID = 'HR0003') absence, thr_work_group tw" ;                     	
    SQL = SQL + "     WHERE a.del_if = 0 and e.del_if=0 and a.tco_org_pk=e.pk and tw.del_if=0 and tw.pk=a.thr_wg_pk ";
    SQL = SQL + "           AND b.del_if = 0 ";
    SQL = SQL + "           AND b.absence_type = absence.code ";
    SQL = SQL + "           AND b.thr_emp_pk = a.pk ";
    SQL = SQL + "               AND DECODE ('" + p_wg + "', 'ALL', 'ALL', tw.pk ) = ";
    SQL = SQL + "                                                                    '" + p_wg  + "'";
    SQL = SQL + "               AND DECODE ('" + p_absence_type + "', 'ALL', 'ALL', b.absence_type) = ";
    SQL = SQL + "                                                                    '" + p_absence_type  + "'";
    SQL = SQL + "               AND DECODE ('" + p_nation_type + "', 'ALL', 'ALL' , a.nation) = ";
    SQL = SQL + "                                                                     '" + p_nation_type + "' ";
    SQL = SQL + "               AND DECODE ('" + p_emp_type + "', 'ALL', 'ALL' , a.employee_type) = '" + p_emp_type + "'";
    SQL = SQL + "               and ( ('" + p_print_type + "'='1' and   nvl(absence.num_1,0) >0)    "; 
    SQL = SQL + "                     or ";
    SQL = SQL + "                      ('" + p_print_type + "'='2' and   nvl(absence.num_1,0) =0) ";
    SQL = SQL + "                     or ";
    SQL = SQL + "                      ('" + p_print_type + "'='3' and   nvl(absence.num_2,0) >0)  ";
    SQL = SQL + "                     or ";
    SQL = SQL + "                      ('" + p_print_type + "'='4' and   nvl(absence.num_2,0) =0)  ";
    SQL = SQL + "                     or ";
    SQL = SQL + "                      ('" + p_print_type + "'='5' and   nvl(absence.num_3,0) =1)  ";
    SQL = SQL + "                     or ";
    SQL = SQL + "                      ('" + p_print_type + "'='6' and   nvl(absence.num_3,0) =0) ";
    SQL = SQL + "                     or ";
    SQL = SQL + "                      ('" + p_print_type + "'='ALL')   ";
    SQL = SQL + "                   ) ";
    SQL = SQL + "              AND ('" + p_input + "' IS NULL  " +
                "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
                "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
                "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) ";
    SQL = SQL + "               AND b.absence_dt BETWEEN '" + p_from_date + "' AND '" + p_to_date + "' ";
     SQL = SQL + "      AND (    A.TCO_ORG_PK IN ( ";
        SQL = SQL + "                       SELECT     G.PK ";
        SQL = SQL + "                             FROM TCO_ORG G ";
        SQL = SQL + "                            WHERE G.DEL_IF = 0           ";                           
        SQL = SQL + "                       START WITH G.PK = ";
        SQL = SQL + "                                     DECODE ('"+p_tco_org_pk+"', ";
        SQL = SQL + "                                             'ALL', 0, ";
        SQL = SQL + "                                             '"+p_tco_org_pk+"' ";
        SQL = SQL + "                                            ) ";
        SQL = SQL + "                       CONNECT BY PRIOR G.PK = G.P_PK) ";
        SQL = SQL + "                 OR '"+p_tco_org_pk+"' = 'ALL') ";
    SQL = SQL + "      GROUP BY emp_id, b.thr_emp_pk, absence.code_nm, absence.code ";
    SQL = SQL + "        HAVING (COUNT (*) " + p_value + "  '" + p_days + "' OR '" + p_days + "' IS NULL) ";
    SQL = SQL + "      ORDER BY a.emp_id, absence.code_nm ";


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
<link rel=File-List href="rpt_absence_summary_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_absence_summary_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_absence_summary_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>ty-ml</o:Author>
  <o:LastAuthor>ty-ml</o:LastAuthor>
  <o:LastPrinted>2008-06-02T08:48:40Z</o:LastPrinted>
  <o:Created>2008-05-23T07:19:16Z</o:Created>
  <o:LastSaved>2008-07-16T08:55:49Z</o:LastSaved>
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
	mso-footer-margin:.14in;}
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
	vertical-align:middle;}
.xl27
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
.xl28
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
.xl29
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
.xl30
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
.xl31
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
.xl32
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
.xl33
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl34
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;}
.xl35
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
.xl36
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
.xl37
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
.xl38
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
.xl39
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl40
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;}
.xl41
	{mso-style-parent:style0;
	color:#3366FF;
	font-size:16.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl42
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl43
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
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
      <x:Scale>79</x:Scale>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>6</x:SplitHorizontal>
     <x:TopRowBottomPane>6</x:TopRowBottomPane>
     <x:SplitVertical>5</x:SplitVertical>
     <x:LeftColumnRightPane>6</x:LeftColumnRightPane>
     <x:ActivePane>0</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>1</x:Number>
       <x:ActiveCol>5</x:ActiveCol>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>0</x:Number>
       <x:ActiveRow>7</x:ActiveRow>
       <x:ActiveCol>8</x:ActiveCol>
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
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1050 style='border-collapse:
 collapse;table-layout:fixed;width:789pt'>
 <col class=xl24 width=47 style='mso-width-source:userset;mso-width-alt:1718;
 width:35pt'>
 <col class=xl24 width=118 style='mso-width-source:userset;mso-width-alt:4315;
 width:89pt'>
 <col class=xl24 width=114 style='mso-width-source:userset;mso-width-alt:4169;
 width:86pt'>
 <col class=xl24 width=82 style='mso-width-source:userset;mso-width-alt:2998;
 width:62pt'>
 <col class=xl24 width=166 style='mso-width-source:userset;mso-width-alt:6070;
 width:125pt'>
 <col class=xl24 width=104 style='mso-width-source:userset;mso-width-alt:
 3803;width:78pt'>
 <col class=xl24 width=104 style='display:none;mso-width-source:userset;mso-width-alt:
 3803;width:78pt'>
 <col class=xl24 width=104 style='display:none;mso-width-source:userset;mso-width-alt:
 3803;width:78pt'>
 <col class=xl24 width=124 style='mso-width-source:userset;mso-width-alt:4534;
 width:93pt'>
 <col class=xl24 width=87 style='mso-width-source:userset;mso-width-alt:3181;
 width:65pt'>
 <tr height=38 style='mso-height-source:userset;height:28.5pt'>
  <td colspan=9 height=38 class=xl41 width=963 style='height:28.5pt;width:724pt'>SUMMARY
  OF EMPLOYEE'S ABSENCE</td>
  <td class=xl41 width=87 style='width:65pt'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl24 style='height:15.75pt'></td>
  <td class=xl40 x:str="From Date ">From Date<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl34 x:num><%=p_from_date_text %></td>
  <td class=xl33>To Date</td>
  <td class=xl34 x:num><%=p_to_date_text %></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl33>Reporter</td>
  <td class=xl39><%=p_user %></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl24 style='height:15.75pt'></td>
  <td class=xl40 x:str><% if (p_absence_type!="ALL") 
                            Response.Write(" Print Type"); %><span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl39><% if (p_absence_type!="ALL") 
                            Response.Write (p_absence_type_text); %></td>
  <td colspan=5 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl33>Report Date</td>
  <td class=xl34 x:num><%= dt_total.Rows[0][0].ToString() %></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl24 style='height:15.75pt'></td>
  <td class=xl33></td>
  <td class=xl34></td>
  <td colspan=7 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl25 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl31 style='height:19.5pt'>No</td>
  <td class=xl31 style='border-left:none'>Department</td>
  <td class=xl31 style='border-left:none'>Group</td>
  <td class=xl31 style='border-left:none'>Emp ID</td>
  <td class=xl31 style='border-left:none'>Full Name</td>
  <td class=xl31 style='border-left:none'>Absence Type</td>
  <td class=xl31 style='border-left:none'>From Date</td>
  <td class=xl31 style='border-left:none'>To Date</td>
  <td class=xl31 style='border-left:none'>Description</td>
  <td class=xl31 style='border-left:none'>Day(s)</td>
 </tr>
 <tr class=xl25 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl32 style='height:19.5pt;border-top:none'>STT</td>
  <td class=xl32 style='border-top:none;border-left:none'>B&#7897; ph&#7853;n</td>
  <td class=xl32 style='border-top:none;border-left:none'>Nhóm</td>
  <td class=xl32 style='border-top:none;border-left:none'>Mã NV</td>
  <td class=xl32 style='border-top:none;border-left:none'>H&#7885; và tên</td>
  <td class=xl32 style='border-top:none;border-left:none'>Lo&#7841;i ngh&#7881;</td>
  <td class=xl32 style='border-top:none;border-left:none'>T&#7915; ngày</td>
  <td class=xl32 style='border-top:none;border-left:none'>&#272;&#7871;n ngày</td>
  <td class=xl32 style='border-top:none;border-left:none'>Chú thích</td>
  <td class=xl32 style='border-top:none;border-left:none'>S&#7889; ngày</td>
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
 <tr class=xl26 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl27 style='height:19.5pt;border-top:none<%=s_format%>' x:num><%=i+1 %></td>
  <td class=xl28 style='border-top:none;border-left:none<%=s_format%>'><% = dt_total.Rows[i][1].ToString()%></td>
  <td class=xl28 style='border-top:none;border-left:none<%=s_format%>'><% = dt_total.Rows[i][2].ToString()%></td>
  <td class=xl27 style='border-top:none;border-left:none<%=s_format%>'><% = dt_total.Rows[i][3].ToString()%></td>
  <td class=xl28 style='border-top:none;border-left:none<%=s_format%>'><% = dt_total.Rows[i][4].ToString()%></td>
  <td class=xl42 style='border-top:none;border-left:none<%=s_format%>'><% = dt_total.Rows[i][5].ToString()%></td>
  <td class=xl29 style='border-top:none;border-left:none<%=s_format%>' x:num><% = dt_total.Rows[i][6].ToString()%></td>
  <td class=xl29 style='border-top:none;border-left:none<%=s_format%>' x:num><% = dt_total.Rows[i][7].ToString()%></td>
  <td class=xl30 style='border-top:none;border-left:none<%=s_format%>' x:num><span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl27 style='border-top:none;border-left:none<%=s_format%>' x:num><% = dt_total.Rows[i][8].ToString()%></td>
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
  <td width=166 style='width:125pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=124 style='width:93pt'></td>
  <td width=87 style='width:65pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
