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
    string p_dept, p_group, p_status, pos, p_input, dtyear, fromjoin, tojoin, lstmoney, contract;

    p_dept = Request["org"].ToString();
    p_group = Request["wg"].ToString();
    p_status = Request["status"].ToString();
    pos = Request["pos"].ToString();
    p_input = Request["txttmp"].ToString();
    dtyear = Request["dtyear"].ToString();
    fromjoin = Request["fromjoin"].ToString();
    tojoin = Request["tojoin"].ToString();
    lstmoney = Request["lstmoney"].ToString();
    contract = Request["contract"].ToString();
    

    string SQL_Com
    = "select  a.PARTNER_LNAME,a.ADDR1,a.PHONE_NO,a.TCO_BPPHOTO_PK,to_char(to_date('" + dtyear + "','yyyymm'),'MM-YYYY'),to_char(to_date('" + dtyear + "','yyyymm'),'MM-YYYY') " +
        "from tco_company a " +
        "where a.DEL_IF=0 " +
        "and a.pk in ( select tco_company_pk from  " +
        "               tco_org  f " +
        "               where  f.pk IN ( " +
        "                              SELECT     g.pk " +
        "                                    FROM tco_org g " +
        "                                   WHERE g.del_if = 0 " +
        "                              START WITH g.pk = " +
        "                                            DECODE ('" + p_dept + "', " +
        "                                                    'ALL', 0, " +
        "                                                    '" + p_dept + "' " +
        "                                                   ) " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '" + p_dept + "' = 'ALL') " +
        "and rownum=1 ";

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
    int pk = int.Parse(dt_Com.Rows[0][3].ToString());

    string SQL_Allow
    = "   SELECT MAX (code1), MAX (code2), MAX (code3), MAX (code4), MAX (code5), " +
        "             MAX (code6), MAX (code7), MAX (code8), MAX (code9), MAX (code10), MAX (code11), MAX (code12), MAX (c1), MAX (c2), " +
        "             MAX (c3), MAX (c4), MAX (c5), MAX (c6), MAX (c7), MAX (c8), MAX (c9), MAX (c10), MAX (c11), MAX (c12), " +
        "           MAX (codef1), MAX (codef2), MAX (codef3), MAX (codef4), MAX (codef5), " +
        "             MAX (codef6), MAX (codef7), MAX (codef8), MAX (codef9), MAX (codef10), MAX (codef11), MAX (codef12) " +
        "        FROM (SELECT DECODE (code, 'A1', a.code_nm, '') AS code1, " +
        "                     DECODE (code, 'A2', a.code_nm, '') AS code2, " +
        "                     DECODE (code, 'A3', a.code_nm, '') AS code3, " +
        "                     DECODE (code, 'A4', a.code_nm, '') AS code4, " +
        "                     DECODE (code, 'A5', a.code_nm, '') AS code5, " +
        "                     DECODE (code, 'A6', a.code_nm, '') AS code6, " +
        "                     DECODE (code, 'A7', a.code_nm, '') AS code7, " +
        "                     DECODE (code, 'A8', a.code_nm, '') AS code8, " +
		"                     DECODE (code, 'A9', a.code_nm, '') AS code9, " +
		"                     DECODE (code, 'A10', a.code_nm, '') AS code10, " +
		"                     DECODE (code, 'A11', a.code_nm, '') AS code11, " +
		"                     DECODE (code, 'A12', a.code_nm, '') AS code12, " +
        "                     DECODE (code, 'A1', a.num_2, '') AS c1, " +
        "                     DECODE (code, 'A2', a.num_2, '') AS c2, " +
        "                     DECODE (code, 'A3', a.num_2, '') AS c3, " +
        "                     DECODE (code, 'A4', a.num_2, '') AS c4, " +
        "                     DECODE (code, 'A5', a.num_2, '') AS c5, " +
        "                     DECODE (code, 'A6', a.num_2, '') AS c6, " +
        "                     DECODE (code, 'A7', a.num_2, '') AS c7, " +
        "                     DECODE (code, 'A8', a.num_2, '') AS c8, " +
		"                     DECODE (code, 'A9', a.num_2, '') AS c9, " +
		"                     DECODE (code, 'A10', a.num_2, '') AS c10, " +
		"                     DECODE (code, 'A11', a.num_2, '') AS c11, " +
		"                     DECODE (code, 'A12', a.num_2, '') AS c12, " +
        "                     DECODE (code, 'A1', a.code_fnm, '') AS codef1, " +
        "                     DECODE (code, 'A2', a.code_fnm, '') AS codef2, " +
        "                     DECODE (code, 'A3', a.code_fnm, '') AS codef3, " +
        "                     DECODE (code, 'A4', a.code_fnm, '') AS codef4, " +
        "                     DECODE (code, 'A5', a.code_fnm, '') AS codef5, " +
        "                     DECODE (code, 'A6', a.code_fnm, '') AS codef6, " +
        "                     DECODE (code, 'A7', a.code_fnm, '') AS codef7, " +
        "                     DECODE (code, 'A8', a.code_fnm, '') AS codef8, " +
		"                     DECODE (code, 'A9', a.code_fnm, '') AS codef9, " +
		"                     DECODE (code, 'A10', a.code_fnm, '') AS codef10, " +
		"                     DECODE (code, 'A11', a.code_fnm, '') AS codef11, " +
		"                     DECODE (code, 'A12', a.code_fnm, '') AS codef12 " +
        "                FROM vhr_hr_code a " +
        "               WHERE a.ID = 'HR0019'  ) allow_amt ";
    DataTable dt_Allow = CtlLib.TableReadOpen(SQL_Allow);
    int irow_Allow;
    irow_Allow = dt_Allow.Rows.Count;
    if (irow_Allow == 0)
    {
        Response.Write("There is no data of allowance");
        Response.End();
    }
    int col_span = 5;
    for (int j = 12; j <= 23; j++)
        if (dt_Allow.Rows[0][j].ToString() == "1")
            col_span++;

    string SQL
    = "SELECT   b.org_nm, c.workgroup_nm, a.emp_id, a.full_name " +
        "               ,TO_CHAR (TO_DATE (a.join_dt, 'yyyymmdd'), 'dd/mm/yyyy') " +
        "                ,nvl(a.pro_sal,0),d.code_nm,p.code_nm,nvl(a.LEVEL1_SAL,0),nvl(a.BASIC_SAL,0) " +
        "                ,TO_CHAR (TO_DATE (a.CONFIRM_DT, 'yyyymmdd'), 'dd/mm/yyyy') " +
        "                ,nvl(a.ALLOW_AMT1,0),nvl(a.ALLOW_AMT2,0),nvl(a.ALLOW_AMT3,0),nvl(a.ALLOW_AMT4,0) " +
        "                ,nvl(a.ALLOW_AMT5,0),nvl(a.ALLOW_AMT6,0),nvl(a.ALLOW_AMT7,0),nvl(a.ALLOW_AMT8,0) " +
        "                ,nvl(a.ALLOW_AMT9,0),nvl(a.ALLOW_AMT10,0),nvl(a.ALLOW_AMT11,0),nvl(a.ALLOW_AMT12,0) " +
        "                ,nvl(a.basic_sal,0) + nvl(a.allow_amt1,0) + nvl(a.allow_amt2,0) + nvl(a.allow_amt3,0) + nvl(a.allow_amt4,0)  " +
        "                   + nvl(a.allow_amt5,0) + nvl(a.allow_amt6,0) + nvl(a.allow_amt7,0) + nvl(a.allow_amt8,0)  " +
        "                   + nvl(a.allow_amt9,0) + nvl(a.allow_amt10,0) + nvl(a.allow_amt11,0) + nvl(a.allow_amt12,0) total_sal " +
        "                ,e.POS_NM,nvl(e.salary_level1,0),nvl(e.salary_level2,0) " +
        "                ,TO_CHAR (TO_DATE (e.CONFIRM_DT, 'yyyymmdd'), 'dd/mm/yyyy') " +
        "                ,nvl(e.ALLOW_AMT1,0),nvl(e.ALLOW_AMT2,0),nvl(e.ALLOW_AMT3,0),nvl(e.ALLOW_AMT4,0) " +
        "                ,nvl(e.ALLOW_AMT5,0),nvl(e.ALLOW_AMT6,0),nvl(e.ALLOW_AMT7,0),nvl(e.ALLOW_AMT8,0) " +
        "                ,nvl(e.ALLOW_AMT9,0),nvl(e.ALLOW_AMT10,0),nvl(e.ALLOW_AMT11,0),nvl(e.ALLOW_AMT12,0) " +
        "                ,nvl(e.SALARY_LEVEL2,0) + nvl(e.allow_amt1,0) + nvl(e.allow_amt2,0) + nvl(e.allow_amt3,0) + nvl(e.allow_amt4,0)  " +
        "                   + nvl(e.allow_amt5,0) + nvl(e.allow_amt6,0) + nvl(e.allow_amt7,0) + nvl(e.allow_amt8,0)  " +
        "                   + nvl(e.allow_amt9,0) + nvl(e.allow_amt10,0) + nvl(e.allow_amt11,0) + nvl(e.allow_amt12,0) total_sal_2 " +
        "          FROM thr_employee a,tco_org b,thr_work_group c, " +
        "               (SELECT code, code_nm FROM vhr_hr_code WHERE ID = 'HR0001') d, " +
        "                  (SELECT code, code_nm FROM vhr_hr_code WHERE ID = 'HR0008') p,thr_salary_manage e " +
        "         WHERE a.del_if = 0 " +
        "           AND b.del_if = 0 " +
        "           AND c.del_if = 0 " +
        "           AND e.del_if(+) = 0 " +
        "           AND a.thr_wg_pk = c.pk " +
        "           AND a.tco_org_pk = b.pk " +
        "           AND e.thr_emp_pk(+) = a.pk " +
        "           AND a.contract_type = d.code(+) " +
        "           and a.pos_type=p.code(+) " +
        "           and e.work_mon(+)='" + dtyear + "' " +
        "          AND DECODE ('" + p_group + "', 'ALL', '" + p_group + "', a.thr_wg_pk) = " +
        "                                                                '" + p_group + "' " +
        "           AND (   a.tco_org_pk IN ( " +
        "                              SELECT     g.pk " +
        "                                    FROM tco_org g " +
        "                                   WHERE g.del_if = 0 " +
        "                              START WITH g.pk = " +
        "                                            DECODE ('" + p_dept + "', " +
        "                                                    'ALL', 0, " +
        "                                                    '" + p_dept + "' " +
        "                                                   ) " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '" + p_dept + "' = 'ALL') " +
        "           AND DECODE ('" + pos + "', 'ALL', '" + pos + "', a.pos_type) = '" + pos + "' " +
        "           AND DECODE ('" + p_status + "', 'ALL', '" + p_status + "', a.status) = '" + p_status + "' " +
        "  AND DECODE ('" + contract + "','ALL','" + contract + "',a.contract_type) = '" + contract + "'" +
        "              AND ('" + p_input + "' IS NULL  " +
        "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
        "           AND (   '" + fromjoin + "' IS NULL " +
        "                OR '" + tojoin + "' IS NULL " +
        "                OR a.join_dt BETWEEN '" + fromjoin + "' AND '" + tojoin + "' " +
        "               ) " +
        "      AND DECODE('" + lstmoney + "','ALL','" + lstmoney + "',A.MONEY_KIND)='" + lstmoney + "'  " +
        "      ORDER BY NVL(B.SEQ,0),B.org_nm, C.workgroup_id, A.emp_id ";

    //Response.Write(SQL);
    //Response.End();
    
        DataTable dt_emp = CtlLib.TableReadOpen(SQL);
        int emp_row = 0;
        if (dt_emp.Rows.Count == 0)
        {
            Response.Write("There is no data to show");
            Response.End();
        }
        else
        {
            emp_row = dt_emp.Rows.Count;
        }
%>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_salary_summary_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_salary_summary_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_salary_summary_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Hee</o:Author>
  <o:LastAuthor>Hee</o:LastAuthor>
  <o:Created>2008-09-26T02:35:53Z</o:Created>
  <o:LastSaved>2008-09-30T03:38:05Z</o:LastSaved>
  <o:Company>Hee Nguyen</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .75in 1.0in .75in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;}
.font12
	{color:windowtext;
	font-size:12.0pt;
	font-weight:400;
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
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl26
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl28
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl29
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl30
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl31
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl32
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#FFCC99;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl33
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl34
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";}
.xl35
	{mso-style-parent:style0;
	mso-number-format:"\#\,\#\#0";}
.xl36
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl37
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-style:italic;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl38
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl39
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl40
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl41
	{mso-style-parent:style0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl42
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl43
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl44
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl45
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl46
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
	background:#FFCC99;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl47
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
	background:#FFCC99;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl48
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl49
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl50
	{mso-style-parent:style0;
	mso-number-format:"dd\\\/mm\\\/yyyy";
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
      <x:Scale>32</x:Scale>
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
       <x:ActiveRow>5</x:ActiveRow>
       <x:ActiveCol>23</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
    <x:PageBreaks>
     <x:RowBreaks>
      <x:RowBreak>
       <x:Row>5</x:Row>
      </x:RowBreak>
     </x:RowBreaks>
    </x:PageBreaks>
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
  <x:WindowHeight>9210</x:WindowHeight>
  <x:WindowWidth>15195</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>60</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$1:$6</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=2228 style='border-collapse:
 collapse;table-layout:fixed;width:1678pt'>
 <col class=xl24 width=65 style='mso-width-source:userset;mso-width-alt:2377;
 width:49pt'>
 <col width=122 style='mso-width-source:userset;mso-width-alt:4461;width:92pt'>
 <col width=128 style='mso-width-source:userset;mso-width-alt:4681;width:96pt'>
 <col width=72 style='mso-width-source:userset;mso-width-alt:2633;width:54pt'>
 <col width=181 style='mso-width-source:userset;mso-width-alt:6619;width:136pt'>
 <col width=76 style='mso-width-source:userset;mso-width-alt:2779;width:57pt'>
 <col width=89 style='mso-width-source:userset;mso-width-alt:3254;width:67pt'>
 <col width=84 style='mso-width-source:userset;mso-width-alt:3072;width:63pt'>
 <col width=83 style='mso-width-source:userset;mso-width-alt:3035;width:62pt'>
 <col width=82 style='mso-width-source:userset;mso-width-alt:2998;width:62pt'>
 <col width=88 style='mso-width-source:userset;mso-width-alt:3218;width:66pt'>
 <col width=82 span=8 style='mso-width-source:userset;mso-width-alt:2998;
 width:62pt'>
 <col width=86 style='mso-width-source:userset;mso-width-alt:3145;width:65pt'>
 <col width=81 style='mso-width-source:userset;mso-width-alt:2962;width:61pt'>
 <col width=83 style='mso-width-source:userset;mso-width-alt:3035;width:62pt'>
 <col width=88 style='mso-width-source:userset;mso-width-alt:3218;width:66pt'>
 <col width=82 span=8 style='mso-width-source:userset;mso-width-alt:2998;
 width:62pt'>
 <tr class=xl24 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 width=43 style='height:21.75pt;width:32pt' align=left
  valign=top></td>
  <td class=xl25 colspan=2 width=250 style='mso-ignore:colspan;width:188pt'><%=dt_Com.Rows[0][0].ToString() %></td>
  <td class=xl25 width=72 style='width:54pt'></td>
  <td class=xl27 width=181 style='width:136pt'></td>
  <td class=xl24 width=76 style='width:57pt'></td>
  <td class=xl24 width=89 style='width:67pt'></td>
  <td class=xl24 width=84 style='width:63pt'></td>
  <td class=xl24 width=83 style='width:62pt'></td>
  <td class=xl27 width=82 style='width:62pt'></td>
  <td class=xl27 width=88 style='width:66pt'>SALARY INFORMATION <%=dt_Com.Rows[0][5].ToString() %></td>

 </tr>
 <tr class=xl24 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl34 style='height:18.75pt'></td>
  <td class=xl25><%=dt_Com.Rows[0][1].ToString().ToUpper() %></td>
  <td class=xl25></td>
  <td class=xl24></td>
  <td class=xl28></td>
  <td colspan=5 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl28>THÔNG TIN LƯƠNG <%=dt_Com.Rows[0][5].ToString() %></td>
  <td colspan=15 class=xl29 style='mso-ignore:colspan'></td>
  <td colspan=6 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl24 height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 class=xl34 style='height:12.0pt'></td>
  <td class=xl25>Phone : <%=dt_Com.Rows[0][2].ToString() %></td>
  <td class=xl25></td>
  <td class=xl24></td>
  <td class=xl26></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td colspan=18 class=xl30 style='mso-ignore:colspan'></td>
  <td colspan=6 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl35 style='height:12.75pt'></td>
  <td colspan=30 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl31 height=39 style='mso-height-source:userset;height:29.25pt'>
  <td rowspan=2 height=102 class=xl45 width=43 style='height:76.5pt;width:32pt'>No.<br>
    <font class="font12">STT</font></td>
  <td rowspan=2 class=xl44 width=122 style='width:92pt'>DEPARTMENT<br>
    <font class="font12">Bộ phận</font></td>
  <td rowspan=2 class=xl44 width=128 style='width:96pt'>GROUP<br>
    <font class="font12">Nhóm</font></td>
  <td rowspan=2 class=xl44 width=72 style='width:54pt'>Emp ID<br>
    <font class="font12">Mã NV</font></td>
  <td rowspan=2 class=xl44 width=181 style='width:136pt'>Full Name<br>
    <font class="font12">Họ và Tên</font></td>
  <td rowspan=2 class=xl44 width=76 style='width:57pt'>Join Date<br>
    <font class="font12">Ngày vào</font></td>
  <td rowspan=2 class=xl42 width=89 style='border-bottom:.5pt solid black;
  width:67pt'>Contract<br>
    <font class="font12">Loại HĐ</font></td>
  <td colspan=<%=col_span %> class=xl46 width=993 style='border-right:.5pt solid black;
  border-left:none;width:749pt'>Current Salary and Allowance informations<br>
    <font class="font12">Mức lương và phụ cấp hiện tại</font></td>
  <td colspan=<%=col_span %> class=xl33 width=994 style='border-left:none;width:750pt'>Salary
  and Allowance information <%=dt_Com.Rows[0][5].ToString() %><br>
    <font class="font12">Mức lương và phụ cấptháng <%=dt_Com.Rows[0][5].ToString() %></font></td>
 </tr>
 <tr class=xl31 height=63 style='page-break-before:always;mso-height-source:
  userset;height:47.25pt'>
  <td height=63 class=xl32 width=84 style='height:47.25pt;border-top:none;
  border-left:none;width:63pt'>Position<span style='mso-spacerun:yes'> </span></td>
  <td class=xl32 width=83 style='border-top:none;border-left:none;width:62pt'>Sal
  Level 1</td>
  <td class=xl32 width=82 style='border-top:none;border-left:none;width:62pt'>Sal
  Level 2</td>
  <td class=xl32 width=88 style='border-top:none;border-left:none;width:66pt'>Confirm
  DT</td>
  <%    
	for(int j=0;j<12;j++)
	{
		if (dt_Allow.Rows[0][j+12].ToString() == "1")
        {//phu cap thu 1
  %>
  <td class=xl32 width=82 style='border-top:none;border-left:none;width:62pt'><%=dt_Allow.Rows[0][j].ToString() %></td>
  <%
        } 
	}	
	%>
	<td class=xl32 width=82 style='border-top:none;border-left:none;width:62pt'>Total Salary</td>
<!--		
	<%
        if(dt_Allow.Rows[0][9].ToString()=="1")
        {//phu cap thu 2
   %>
   
  <td class=xl32 width=82 style='border-top:none;border-left:none;width:62pt'><%=dt_Allow.Rows[0][1].ToString() %></td>
  <%
        }
        if(dt_Allow.Rows[0][10].ToString()=="1")
        {//phu cap thu 3
   %>
  <td class=xl32 width=82 style='border-top:none;border-left:none;width:62pt'><%=dt_Allow.Rows[0][2].ToString() %></td>
  <%
        }
        if(dt_Allow.Rows[0][11].ToString()=="1")
        {//phu cap thu 4
   %>
  <td class=xl32 width=82 style='border-top:none;border-left:none;width:62pt'><%=dt_Allow.Rows[0][3].ToString() %></td>
  <%
        }
        if(dt_Allow.Rows[0][12].ToString()=="1")
        {//phu cap thu 5
   %>
  <td class=xl32 width=82 style='border-top:none;border-left:none;width:62pt'><%=dt_Allow.Rows[0][4].ToString() %></td>
  <%
        }
        if(dt_Allow.Rows[0][13].ToString()=="1")
        {//phu cap thu 6
   %>
  <td class=xl32 width=82 style='border-top:none;border-left:none;width:62pt'><%=dt_Allow.Rows[0][5].ToString() %></td>
  <%
        }
        if(dt_Allow.Rows[0][14].ToString()=="1")
        {//phu cap thu 7
   %>
  <td class=xl32 width=82 style='border-top:none;border-left:none;width:62pt'><%=dt_Allow.Rows[0][6].ToString() %></td>
  <%
        }
        if(dt_Allow.Rows[0][15].ToString()=="1")
        {//phu cap thu 8
   %>
  <td class=xl32 width=82 style='border-top:none;border-left:none;width:62pt'><%=dt_Allow.Rows[0][7].ToString() %></td>
  <%
        }        
   %>
   -->
  <td class=xl33 width=86 style='border-top:none;border-left:none;width:65pt'>Position</td>
  <td class=xl33 width=81 style='border-top:none;border-left:none;width:61pt'>Sal
  Level 1</td>
  <td class=xl33 width=83 style='border-top:none;border-left:none;width:62pt'>Sal
  Level 2</td>
  <td class=xl33 width=88 style='border-top:none;border-left:none;width:66pt'>Confirm
  DT</td>
  <%    
	for(int j=0;j<12;j++)
	{
		if (dt_Allow.Rows[0][j+12].ToString() == "1")
        {//phu cap thu 1
  %>
  <td class=xl33 width=82 style='border-top:none;border-left:none;width:62pt'><%=dt_Allow.Rows[0][j].ToString() %></td>
  <%
        }
	} 
	%>
  <td class=xl33 width=82 style='border-top:none;border-left:none;width:62pt'>Total Salary</td>
<!--	
	<%
        if(dt_Allow.Rows[0][9].ToString()=="1")
        {//phu cap thu 2
   %>
  <td class=xl33 width=82 style='border-top:none;border-left:none;width:62pt'><%=dt_Allow.Rows[0][1].ToString() %></td>
  <%
        }
        if(dt_Allow.Rows[0][10].ToString()=="1")
        {//phu cap thu 3
   %>
  <td class=xl33 width=82 style='border-top:none;border-left:none;width:62pt'><%=dt_Allow.Rows[0][2].ToString() %></td>
  <%
        }
        if(dt_Allow.Rows[0][11].ToString()=="1")
        {//phu cap thu 4
   %>
  <td class=xl33 width=82 style='border-top:none;border-left:none;width:62pt'><%=dt_Allow.Rows[0][3].ToString() %></td>
  <%
        }
        if(dt_Allow.Rows[0][12].ToString()=="1")
        {//phu cap thu 5
   %>
  <td class=xl33 width=82 style='border-top:none;border-left:none;width:62pt'><%=dt_Allow.Rows[0][4].ToString() %></td>
  <%
        }
        if(dt_Allow.Rows[0][13].ToString()=="1")
        {//phu cap thu 6
   %>
  <td class=xl33 width=82 style='border-top:none;border-left:none;width:62pt'><%=dt_Allow.Rows[0][5].ToString() %></td>
  <%
        }
        if(dt_Allow.Rows[0][14].ToString()=="1")
        {//phu cap thu 7
   %>
  <td class=xl33 width=82 style='border-top:none;border-left:none;width:62pt'><%=dt_Allow.Rows[0][6].ToString() %></td>
  <%
        }
        if(dt_Allow.Rows[0][15].ToString()=="1")
        {//phu cap thu 8
   %>
  <td class=xl33 width=82 style='border-top:none;border-left:none;width:62pt'><%=dt_Allow.Rows[0][7].ToString() %></td>
  <%
        }
   %>
   -->
 </tr>
 <%
    int i = 0;
     double[] sum = new double[41] {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 };
     for (i = 0; i < emp_row; i++)
     {
         sum[8] += Double.Parse(dt_emp.Rows[i][8].ToString());
         sum[9] += Double.Parse(dt_emp.Rows[i][9].ToString());
         sum[11] += Double.Parse(dt_emp.Rows[i][11].ToString());
         sum[12] += Double.Parse(dt_emp.Rows[i][12].ToString());
         sum[13] += Double.Parse(dt_emp.Rows[i][13].ToString());
         sum[14] += Double.Parse(dt_emp.Rows[i][14].ToString());
         sum[15] += Double.Parse(dt_emp.Rows[i][15].ToString());
         sum[16] += Double.Parse(dt_emp.Rows[i][16].ToString());
         sum[17] += Double.Parse(dt_emp.Rows[i][17].ToString());
         sum[18] += Double.Parse(dt_emp.Rows[i][18].ToString());
		 sum[19] += Double.Parse(dt_emp.Rows[i][19].ToString());
         sum[20] += Double.Parse(dt_emp.Rows[i][20].ToString());
         sum[21] += Double.Parse(dt_emp.Rows[i][21].ToString());
		 sum[22] += Double.Parse(dt_emp.Rows[i][22].ToString());
		 sum[23] += Double.Parse(dt_emp.Rows[i][23].ToString());
         
         sum[25] += Double.Parse(dt_emp.Rows[i][25].ToString());
         sum[26] += Double.Parse(dt_emp.Rows[i][26].ToString());
         
         sum[28] += Double.Parse(dt_emp.Rows[i][28].ToString());
         sum[29] += Double.Parse(dt_emp.Rows[i][29].ToString());
         sum[30] += Double.Parse(dt_emp.Rows[i][30].ToString());
         sum[31] += Double.Parse(dt_emp.Rows[i][31].ToString());
		 sum[32] += Double.Parse(dt_emp.Rows[i][32].ToString());
		 sum[33] += Double.Parse(dt_emp.Rows[i][33].ToString());
		 sum[34] += Double.Parse(dt_emp.Rows[i][34].ToString());
		 sum[35] += Double.Parse(dt_emp.Rows[i][35].ToString());
		 sum[36] += Double.Parse(dt_emp.Rows[i][36].ToString());
		 sum[37] += Double.Parse(dt_emp.Rows[i][37].ToString());
		 sum[38] += Double.Parse(dt_emp.Rows[i][38].ToString());
		 sum[39] += Double.Parse(dt_emp.Rows[i][39].ToString());
		 sum[40] += Double.Parse(dt_emp.Rows[i][40].ToString());
 %>
 <tr class=xl36 height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl38 style='height:22.5pt;border-top:none' x:num><%=i+1 %></td>
  <td class=xl39 style='border-top:none;border-left:none'><%=dt_emp.Rows[i][0].ToString() %></td>
  <td class=xl39 style='border-top:none;border-left:none'><%=dt_emp.Rows[i][1].ToString() %></td>
  <td class=xl39 style='border-top:none;border-left:none'><%=dt_emp.Rows[i][2].ToString() %></td>
  <td class=xl39 style='border-top:none;border-left:none'><%=dt_emp.Rows[i][3].ToString() %></td>
  <td class=xl50 style='border-top:none;border-left:none'><%=dt_emp.Rows[i][4].ToString() %></td>
  <td class=xl40 style='border-top:none;border-left:none'><%=dt_emp.Rows[i][6].ToString() %></td>
  <td class=xl41 style='border-top:none;border-left:none'><%=dt_emp.Rows[i][7].ToString() %></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][8].ToString() %></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][9].ToString() %></td>
  <td class=xl50 style='border-top:none;border-left:none'><%=dt_emp.Rows[i][10].ToString() %></td>
   <%       
	for(int j=0;j<12;j++)
	{
		 if (dt_Allow.Rows[0][j+12].ToString() == "1")
		 {//phu cap thu 1
   %>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][11+j].ToString() %></td>
   <%
		}
	}
	%>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][23].ToString() %></td>
<!--	
	<%
     if (dt_Allow.Rows[0][9].ToString() == "1")
     {//phu cap thu 2
   %>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][12].ToString() %></td>
   <%
     }
     if (dt_Allow.Rows[0][10].ToString() == "1")
     {//phu cap thu 3
   %>   
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][13].ToString() %></td>
   <%
     }
     if (dt_Allow.Rows[0][11].ToString() == "1")
     {//phu cap thu 4
   %>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][14].ToString() %></td>
   <%
     }
     if (dt_Allow.Rows[0][12].ToString() == "1")
     {//phu cap thu 5
   %>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][15].ToString() %></td>
   <%
     }
     if (dt_Allow.Rows[0][13].ToString() == "1")
     {//phu cap thu 6
   %>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][16].ToString() %></td>
   <%
     }
     if (dt_Allow.Rows[0][14].ToString() == "1")
     {//phu cap thu 7
   %>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][17].ToString() %></td>
   <%
     }
     if (dt_Allow.Rows[0][15].ToString() == "1")
     {//phu cap thu 8
   %>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][18].ToString() %></td>
  <%
     }
  %>
  -->
  
  <td class=xl41 style='border-top:none;border-left:none'><%=dt_emp.Rows[i][24].ToString() %></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][25].ToString() %></td>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][26].ToString() %></td>
  <td class=xl50 style='border-top:none;border-left:none' ><%=dt_emp.Rows[i][27].ToString() %></td>
  <%
	for(int j=0;j<12;j++)
	{
		 if (dt_Allow.Rows[0][j+12].ToString() == "1")
		 {//phu cap thu 1
   %>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][28 + j].ToString() %></td>
  
  <%
		}
	}
	%>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][40].ToString() %></td>
<!--	
	<%
	
     if (dt_Allow.Rows[0][9].ToString() == "1")
     {//phu cap thu 2
   %>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][24].ToString() %></td>
  <%
     }
     if (dt_Allow.Rows[0][10].ToString() == "1")
     {//phu cap thu 3
   %>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][25].ToString() %></td>
  <%
     }
     if (dt_Allow.Rows[0][11].ToString() == "1")
     {//phu cap thu 4
   %>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][26].ToString() %></td>
  <%
     }
     if (dt_Allow.Rows[0][12].ToString() == "1")
     {//phu cap thu 5
   %>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][27].ToString() %></td>
  <%
     }
     if (dt_Allow.Rows[0][13].ToString() == "1")
     {//phu cap thu 6
   %>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][28].ToString() %></td>
  <%
     }
     if (dt_Allow.Rows[0][14].ToString() == "1")
     {//phu cap thu 7
   %>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][29].ToString() %></td>
  <%
     }
     if (dt_Allow.Rows[0][15].ToString() == "1")
     {//phu cap thu 8
   %>
  <td class=xl41 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][30].ToString() %></td>
  <%    }
       %>
	   -->
 </tr>
 <%
     }//  <~~~~dau ngoac cua vong for
 %>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=6 height=28 class=xl37 style='height:21.0pt'>Total <%=i %> Employee(s)</td>
  <td class=xl37 style='border-top:none;border-left:none'></td>
  <td class=xl49 style='border-top:none;border-left:none' x:num></td>  
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[8] %></td>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[9] %></td>
  <td class=xl49 style='border-top:none;border-left:none' x:num></td>
  <%
    for(int j=0;j<12;j++)
	{
        if(dt_Allow.Rows[0][12 + j].ToString()=="1")
        {//phu cap thu 1
  %>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[11 + j] %></td>
  <%
		}
	}
	%>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[23] %></td>	
<!--	
	<%
        if(dt_Allow.Rows[0][9].ToString()=="1")
        {//phu cap thu 2
  %>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[12] %></td>
  <%
      }
        if(dt_Allow.Rows[0][10].ToString()=="1")
        {//phu cap thu 3
  %>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[13] %></td>
  <%
      }
        if(dt_Allow.Rows[0][11].ToString()=="1")
        {//phu cap thu 4
  %>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[14] %></td>
  <%
      }
        if(dt_Allow.Rows[0][12].ToString()=="1")
        {//phu cap thu 5
  %>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[15] %></td>
  <%
      }
        if(dt_Allow.Rows[0][13].ToString()=="1")
        {//phu cap thu 6
  %>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[16] %></td>
  <%
      }
        if(dt_Allow.Rows[0][14].ToString()=="1")
        {//phu cap thu 7
  %>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[17] %></td>
  <%
      }
      if (dt_Allow.Rows[0][15].ToString() == "1")
      {//phu cap thu 8
  %>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[18] %></td>
  <%
      }
  %>
  -->
  <td class=xl49 style='border-top:none;border-left:none' x:num></td>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[25] %></td>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[26] %></td>
  <td class=xl49 style='border-top:none;border-left:none' x:num></td>
  <%
	for(int j=0;j<12;j++)
	{
        if(dt_Allow.Rows[0][12 + j].ToString()=="1")
        {//phu cap thu 1
  %>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[28 + j] %></td>
  <%
		}
	}
	%>
	<td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[40] %></td>
<!--	
	<%
        if(dt_Allow.Rows[0][9].ToString()=="1")
        {//phu cap thu 2
  %>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[24] %></td>
  <%
      }
        if(dt_Allow.Rows[0][10].ToString()=="1")
        {//phu cap thu 3
  %>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[25] %></td>
  <%
      }
        if(dt_Allow.Rows[0][11].ToString()=="1")
        {//phu cap thu 4
  %>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[26] %></td>
  <%
      }
        if(dt_Allow.Rows[0][12].ToString()=="1")
        {//phu cap thu 5
  %>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[27] %></td>
  <%
      }
        if(dt_Allow.Rows[0][13].ToString()=="1")
        {//phu cap thu 6
  %>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[28] %></td>
  <%
      }
        if(dt_Allow.Rows[0][14].ToString()=="1")
        {//phu cap thu 7
  %>
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[29] %></td>
  <%
      }
        if(dt_Allow.Rows[0][15].ToString()=="1")
        {//phu cap thu 8
  %>  
  <td class=xl49 style='border-top:none;border-left:none' x:num><%=sum[30] %></td>
  <%
        }
  %>
  -->
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=43 style='width:32pt'></td>
  <td width=122 style='width:92pt'></td>
  <td width=128 style='width:96pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=181 style='width:136pt'></td>
  <td width=76 style='width:57pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=84 style='width:63pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=88 style='width:66pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=81 style='width:61pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=88 style='width:66pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=82 style='width:62pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
