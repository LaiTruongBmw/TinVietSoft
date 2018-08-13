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
    string p_dept, p_group, p_status, p_type, p_pay_type, p_emp_id, p_work_mon, p_sal_period;


    p_dept = Request["l_dept"].ToString();
    p_group = Request["l_group"].ToString();
    p_status = Request["l_status"].ToString();
    p_type = Request["l_type"].ToString();
    p_pay_type = Request["l_pay_type"].ToString();
    p_emp_id = Request["l_emp_id"].ToString();
    p_work_mon = Request["l_work_mon"].ToString();
    p_sal_period = Request["l_sal_period"].ToString();
    string p_m_type = Request.QueryString["l_m_type"].ToString();

    if (p_type == "ALL")
        p_type = "=nvl(s.net_amt,0)";


    string SQL_Com
    = "select  a.PARTNER_LNAME,a.ADDR1,a.FAX_NO,a.TCO_BPPHOTO_PK,to_char(to_date('" + p_work_mon + "','yyyymm'),'MON-YYYY'),to_char(to_date('" + p_work_mon + "','yyyymm'),'MM-YYYY') " +
        " , a.TAX_CODE,a.PHONE_NO from tco_company a " +
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
    DataTable dt_Com = CtlLib.TableReadOpen(SQL_Com);
    if (dt_Com.Rows.Count == 0)
    {
        Response.Write("There is no data of company");
        Response.End();
    }
    
    string SQL_NN
      = "select A.EMP_ID C1,a.FULL_NAME C2, D.PIT_TAX_NO C3,round(NVL(A.INCOME_AMT_2,0)) C4 " + 
        ",round(NVL(A.INCOME_AMT_2,0)-NVL(A.HOUSE_FOR_PIT,0)) C5,0 C6,round(NVL(A.HOUSE_FOR_PIT,0)) C7,ROUND(NVL(A.DEDUCT_PIT,0)+NVL(A.HEALTH_AMT,0)+NVL(A.SOCIAL_AMT,0)+NVL(A.UNEMP_INS,0)) C8 " +
        ",1 C9,NVL(A.FAMILY_DEPEND,0) C10,ROUND(NVL(A.HEALTH_AMT,0)+NVL(A.SOCIAL_AMT,0)+NVL(A.UNEMP_INS,0)) C11 " +
        ",round(NVL(A.INCOME_BEFORE_TAX,0)) C12, ROUND(NVL(A.INCOME_TAX,0)+NVL(A.INCOME_TAX_NET,0)) C13,a.contract_yn c14 " +
        " from thr_month_salary a, tco_org b, thr_work_group c , thr_employee d " +
        " where a.del_if=0 and a.work_mon='" + p_work_mon + "' and d.DEL_IF = 0 " +
        " and a.THR_EMP_PK = d.PK and nvl(d.NATION,'01')<>'01'" +
        " and b.del_if=0 and c.del_if=0 and a.tco_dept_pk=b.pk and a.thr_group_pk=c.pk" +
        " and (a.tco_dept_pk in ( " +
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
        " and decode('" + p_group + "','ALL','ALL',a.thr_group_pk)='" + p_group + "'" +
        " and a.emp_id like '%" + p_emp_id + "%' " +
        " and decode('" + p_status + "','ALL','ALL',a.status)='" + p_status + "'" +
        " and decode('" + p_pay_type + "','ALL','ALL',a.pay_type)='" + p_pay_type + "'" +
        " and decode('" + p_m_type + "','ALL','ALL',a.MONEY_KIND)='" + p_m_type + "'" +
        " and decode('" + p_sal_period + "','ALL','ALL',a.sal_period)='" + p_sal_period + "'" +
        " and nvl(a.net_amt,0) " + p_type + " and nvl(a.INCOME_TAX,0)+nvl(a.INCOME_TAX_NET,0) > 0 " +
        " order by nvl(b.seq,999999),a.THR_GROUP_NM,a.emp_id";
   
                     
    
    string SQL_VN
     = "select A.EMP_ID C1,a.FULL_NAME C2, D.PIT_TAX_NO C3,round(NVL(A.INCOME_AMT_2,0)) C4 " + 
        ",round(NVL(A.INCOME_AMT_2,0)) C5,0 C6,0 C7,ROUND(NVL(A.DEDUCT_PIT,0)+NVL(A.HEALTH_AMT,0)+NVL(A.SOCIAL_AMT,0)+NVL(A.UNEMP_INS,0)) C8 " +
        ",1 C9,NVL(A.FAMILY_DEPEND,0) C10,ROUND(NVL(A.HEALTH_AMT,0)+NVL(A.SOCIAL_AMT,0)+NVL(A.UNEMP_INS,0)) C11 " +
        ",round(NVL(A.INCOME_BEFORE_TAX,0)) C12, ROUND(NVL(A.INCOME_TAX,0)+NVL(A.INCOME_TAX_NET,0)) C13,a.contract_yn c14 " +
        " from thr_month_salary a, tco_org b, thr_work_group c , thr_employee d " +
        " where a.del_if=0 and a.work_mon='" + p_work_mon + "' and d.DEL_IF = 0 " +
        " and a.THR_EMP_PK = d.PK and nvl(d.NATION,'01')='01'" +
        " and b.del_if=0 and c.del_if=0 and a.tco_dept_pk=b.pk and a.thr_group_pk=c.pk" +
        " and (a.tco_dept_pk in ( " +
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
        " and decode('" + p_group + "','ALL','ALL',a.thr_group_pk)='" + p_group + "'" +
        " and a.emp_id like '%" + p_emp_id + "%' " +
        " and decode('" + p_status + "','ALL','ALL',a.status)='" + p_status + "'" +
        " and decode('" + p_pay_type + "','ALL','ALL',a.pay_type)='" + p_pay_type + "'" +
        " and decode('" + p_m_type + "','ALL','ALL',a.MONEY_KIND)='" + p_m_type + "'" +
        " and decode('" + p_sal_period + "','ALL','ALL',a.sal_period)='" + p_sal_period + "'" +
        " and nvl(a.net_amt,0) " + p_type + " and nvl(a.INCOME_TAX,0)+nvl(a.INCOME_TAX_NET,0) > 0 " +
        " order by nvl(b.seq,999999),a.THR_GROUP_NM,a.emp_id";


    
        string SQL_NO_PIT
    = "select A.EMP_ID C1,a.FULL_NAME C2, D.PIT_TAX_NO C3,round(NVL(A.INCOME_AMT_2,0)) C4 " + 
        ",round(NVL(A.INCOME_AMT_2,0)) C5,0 C6,0 C7,ROUND(NVL(A.DEDUCT_PIT,0)+NVL(A.HEALTH_AMT,0)+NVL(A.SOCIAL_AMT,0)+NVL(A.UNEMP_INS,0)) C8 " +
        ",1 C9,NVL(A.FAMILY_DEPEND,0) C10,ROUND(NVL(A.HEALTH_AMT,0)+NVL(A.SOCIAL_AMT,0)+NVL(A.UNEMP_INS,0)) C11 " +
        ",round(NVL(A.INCOME_BEFORE_TAX,0)) C12, ROUND(NVL(A.INCOME_TAX,0)+NVL(A.INCOME_TAX_NET,0)) C13,a.contract_yn c14 " +
        " from thr_month_salary a, tco_org b, thr_work_group c , thr_employee d " +
        " where a.del_if=0 and a.work_mon='" + p_work_mon + "' and d.DEL_IF = 0 " +
        " and a.THR_EMP_PK = d.PK " +
        " and b.del_if=0 and c.del_if=0 and a.tco_dept_pk=b.pk and a.thr_group_pk=c.pk" +
        " and (a.tco_dept_pk in ( " +
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
        " and decode('" + p_group + "','ALL','ALL',a.thr_group_pk)='" + p_group + "'" +
        " and a.emp_id like '%" + p_emp_id + "%' " +
        " and decode('" + p_status + "','ALL','ALL',a.status)='" + p_status + "'" +
        " and decode('" + p_pay_type + "','ALL','ALL',a.pay_type)='" + p_pay_type + "'" +
        " and decode('" + p_m_type + "','ALL','ALL',a.MONEY_KIND)='" + p_m_type + "'" +
        " and decode('" + p_sal_period + "','ALL','ALL',a.sal_period)='" + p_sal_period + "'" +
        " and nvl(a.net_amt,0) " + p_type + " and nvl(a.INCOME_TAX,0)+nvl(a.INCOME_TAX_NET,0) = 0 " +
        " order by nvl(b.seq,999999),a.THR_GROUP_NM,a.emp_id";

        //Response.Write(SQL_NO_PIT);
        //Response.End(); 
      
    DataTable dt_VN = CtlLib.TableReadOpen(SQL_VN), dt_NN = CtlLib.TableReadOpen(SQL_NN), dt_NO_PIT = CtlLib.TableReadOpen(SQL_NO_PIT);
    
    //--------------------sign name information-----------------------
    /*string SQL_sign
	= "select  v.CODE_NM,v.CHAR_1 " + 
        "from vhr_hr_code v,tco_org c " +
        "where c.del_if=0 and decode('" + p_dept + "','ALL','ALL', c.pk ) ='" + p_dept + "'  " +
        " and nvl(v.tco_company_pk,c.tco_company_pk)=c.tco_company_pk and v.id='HR0048' and v.code in('03') order by v.seq ";

    Response.Write(SQL_sign);
   Response.End();
    
    
    DataTable dt_sign = CtlLib.TableReadOpen(SQL_sign);/**/
    //Response.Write(SQL_NO_PIT);
    //Response.End(); 
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="mau_thue_a12_files/filelist.xml">
<link rel=Edit-Time-Data href="mau_thue_a12_files/editdata.mso">
<link rel=OLE-Object-Data href="mau_thue_a12_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>truonghuynh</o:Author>
  <o:LastAuthor>Nguyen huu hung</o:LastAuthor>
  <o:LastPrinted>2012-02-16T06:41:50Z</o:LastPrinted>
  <o:Created>2012-02-16T06:39:07Z</o:Created>
  <o:LastSaved>2012-02-16T06:45:23Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.75in .7in .75in .7in;
	mso-header-margin:.3in;
	mso-footer-margin:.3in;
	mso-page-orientation:landscape;}	
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style43
	{mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	mso-style-name:Comma;
	mso-style-id:3;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal;
	mso-style-id:0;}
.style56
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
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal_Salary_SAMPLE;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
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
.xl66
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;}
.xl67
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl68
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl69
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl70
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl71
	{mso-style-parent:style0;
	color:windowtext;
	font-size:8.0pt;
	font-family:"\.VnArial", sans-serif;
	mso-font-charset:0;}
.xl72
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:left;
	vertical-align:middle;}
.xl73
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	vertical-align:middle;}
.xl74
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	vertical-align:middle;}
.xl75
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;}
.xl77
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl78
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl79
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;}
.xl80
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;}
.xl82
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl83
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:#CC99FF;
	mso-pattern:auto none;}
.xl84
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl85
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl86
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl87
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl88
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl89
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl91
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl92
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl96
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl97
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl98
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl99
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt hairline windowtext;}
.xl100
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt hairline windowtext;}
.xl101
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;}
.xl102
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#FFFF99;
	mso-pattern:auto none;}
.xl103
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border:.5pt hairline windowtext;}
.xl104
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:#CC99FF;
	mso-pattern:auto none;}
.xl105
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:#FF9900;
	mso-pattern:auto none;}
.xl106
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#FF9900;
	mso-pattern:auto none;}
.xl107
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:#FF9900;
	mso-pattern:auto none;}
.xl108
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:yellow;
	mso-pattern:auto none;}
.xl112
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:yellow;
	mso-pattern:auto none;}
.xl113
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:yellow;
	mso-pattern:auto none;}
.xl114
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl115
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl116
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl117
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl118
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl119
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl120
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:silver;
	mso-pattern:auto none;}
.xl121
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl122
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl123
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl125
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl126
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl127
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:right;
	vertical-align:middle;
	border:.5pt hairline windowtext;}
.xl129
	{mso-style-parent:style43;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl130
	{mso-style-parent:style43;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	color:red;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl132
	{mso-style-parent:style0;
	color:red;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl133
	{mso-style-parent:style0;
	color:red;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl134
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl135
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	vertical-align:middle;}
.xl136
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:justify;
	vertical-align:middle;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;}
.xl138
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl139
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;}
.xl140
	{mso-style-parent:style0;
	color:red;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	vertical-align:middle;}
.xl141
	{mso-style-parent:style0;
	color:red;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl142
	{mso-style-parent:style0;
	color:red;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl143
	{mso-style-parent:style0;
	color:red;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt hairline windowtext;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl144
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl145
	{mso-style-parent:style0;
	color:windowtext;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl146
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl147
	{mso-style-parent:style0;
	color:windowtext;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl149
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:normal;}
.xl150
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#FF9900;
	mso-pattern:auto none;}
.xl151
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#FF9900;
	mso-pattern:auto none;}
.xl152
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:#FF9900;
	mso-pattern:auto none;}
.xl153
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:yellow;
	mso-pattern:auto none;}
.xl154
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:yellow;
	mso-pattern:auto none;}
.xl155
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	background:yellow;
	mso-pattern:auto none;}
.xl156
	{mso-style-parent:style0;
	color:windowtext;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl157
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:left;}
.xl158
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:justify;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl159
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:justify;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl160
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:none;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl161
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt hairline windowtext;
	border-bottom:none;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl162
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl163
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl164
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl165
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt hairline windowtext;
	white-space:normal;}
.xl166
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	white-space:normal;}
.xl167
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:normal;}
.xl168
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:#CC99FF;
	mso-pattern:auto none;
	white-space:normal;}
.xl169
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt hairline windowtext;
	background:#CC99FF;
	mso-pattern:auto none;
	white-space:normal;}
.xl170
	{mso-style-parent:style0;
	color:windowtext;
	font-weight:700;
	font-size:12.0pt;
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
     <x:DefaultRowHeight>300</x:DefaultRowHeight>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>47</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:TopRowVisible>9</x:TopRowVisible>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>27</x:ActiveRow>
       <x:ActiveCol>5</x:ActiveCol>
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
     <x:DefaultRowHeight>300</x:DefaultRowHeight>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
   <x:ExcelWorksheet>
    <x:Name>Sheet3</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>300</x:DefaultRowHeight>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>7935</x:WindowHeight>
  <x:WindowWidth>19035</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>60</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1552 style='border-collapse:
 collapse;table-layout:fixed;width:1165pt'>
 <col width=64 span=2 style='width:48pt'>
 <col width=165 style='mso-width-source:userset;mso-width-alt:8034;width:124pt'>
 <col width=87 style='mso-width-source:userset;mso-width-alt:3181;width:65pt'>
 <col width=108 style='mso-width-source:userset;mso-width-alt:3949;width:81pt'>
 <col width=110 style='mso-width-source:userset;mso-width-alt:4022;width:83pt'>
 <col width=75 style='mso-width-source:userset;mso-width-alt:2742;width:56pt'>
 <col width=95 style='mso-width-source:userset;mso-width-alt:3474;width:71pt'>
 <col width=101 style='mso-width-source:userset;mso-width-alt:3693;width:76pt'>
 <col width=64 span=2 style='width:48pt'>
 <col width=94 style='mso-width-source:userset;mso-width-alt:3437;width:71pt'>
 <col width=91 style='mso-width-source:userset;mso-width-alt:3328;width:68pt'>
 <col width=114 style='mso-width-source:userset;mso-width-alt:4169;width:86pt'>
 <col width=114 style='mso-width-source:userset;mso-width-alt:4169;width:86pt'>
 <col width=64 span=4 style='width:48pt'>
 <tr class=xl67 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=14 height=24 class=xl170 width=1296 style='height:18.0pt;
  width:973pt'>BẢNG KÊ CHI TIẾT SỐ THUẾ THU NHẬP CỦA CÁ NHÂN CÓ THU NHẬP CAO</td>
  <td class=xl66 width=64 style='width:48pt'></td>
  <td class=xl67 width=64 style='width:48pt'></td>
  <td class=xl67 width=64 style='width:48pt'></td>
  <td class=xl67 width=64 style='width:48pt'></td>
 </tr>
 <tr class=xl67 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=14 height=24 class=xl170 width=1296 style='height:18.0pt;
  width:973pt'>Tháng <%=dt_Com.Rows[0][5].ToString() %></td>
  <td class=xl66 width=64 style='width:48pt'></td>
  <td class=xl67 width=64 style='width:48pt'></td>
  <td class=xl67 width=64 style='width:48pt'></td>
  <td class=xl67 width=64 style='width:48pt'></td>
 </tr>
 <tr class=xl67 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=14 height=24 class=xl156 width=1296 style='height:18.0pt;
  width:973pt'>Kèm theo t&#7901; khai tháng <%=dt_Com.Rows[0][5].ToString() %></td>
  <td class=xl66 width=64 style='width:48pt'></td>
  <td class=xl67 width=64 style='width:48pt'></td>
  <td class=xl67 width=64 style='width:48pt'></td>
  <td class=xl67 width=64 style='width:48pt'></td>
 </tr>
 <tr class=xl67 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=2 class=xl67 style='height:18.0pt;mso-ignore:colspan'></td>
  <td class=xl68>Tên c&#417; quan chi tr&#7843;:</td>
  <td class=xl69 colspan=6 style='mso-ignore:colspan'
  x:str><%=dt_Com.Rows[0][0].ToString() %><span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=5 class=xl68 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl67 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=2 class=xl67 style='height:18.0pt;mso-ignore:colspan'></td>
  <td class=xl68 x:str="Mã s&#7889; thu&#7871;: ">Mã s&#7889; thu&#7871;:<span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=2 class=xl157 x:num><%=dt_Com.Rows[0][6].ToString() %></td>
  <td colspan=9 class=xl68 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl67 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=2 class=xl67 style='height:18.0pt;mso-ignore:colspan'></td>
  <td class=xl70>&#272;&#7883;a ch&#7881;:</td>
  <td class=xl69 colspan=5 style='mso-ignore:colspan'><%=dt_Com.Rows[0][1].ToString() %></td>
  <td class=xl70></td>
  <td colspan=3 class=xl71 style='mso-ignore:colspan'></td>
  <td class=xl70></td>
  <td class=xl72></td>
  <td colspan=4 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl67 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=2 class=xl67 style='height:18.0pt;mso-ignore:colspan'></td>
  <td class=xl70>&#272;i&#7879;n tho&#7841;i:</td>
  <td class=xl69 colspan=2 style='mso-ignore:colspan'><%=dt_Com.Rows[0][7].ToString() %></td>
  <td colspan=9 class=xl70 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl67 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 colspan=3 class=xl67 style='height:15.0pt;mso-ignore:colspan'></td>
  <td class=xl73></td>
  <td colspan=8 class=xl74 style='mso-ignore:colspan'></td>
  <td class=xl68 colspan=2 style='mso-ignore:colspan'>&#272;&#417;n v&#7883;
  tính: VN&#272;</td>
  <td colspan=4 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl67 height=42 style='mso-height-source:userset;height:31.5pt'>
  <td rowspan=3 height=135 class=xl158 width=64 style='height:101.25pt;
  width:48pt'>STT</td>
  <td rowspan=3 class=xl160 width=64 style='border-bottom:.5pt hairline black;
  width:48pt'>code</td>
  <td rowspan=3 class=xl163 width=165 style='width:124pt'>Tên cá nhân</td>
  <td rowspan=3 class=xl164 width=87 style='width:65pt'>Mã s&#7889; thu&#7871;
  cá nhân</td>
  <td colspan=4 class=xl163 width=388 style='border-left:none;width:291pt'>Thu
  nh&#7853;p ch&#7883;u thu&#7871;</td>
  <td colspan=4 class=xl166 width=323 style='border-left:none;width:243pt'>Các
  kho&#7843;n gi&#7843;m tr&#7915;</td>
  <td rowspan=3 class=xl167 width=91 style='width:68pt'>Thu nh&#7853;p tính
  thu&#7871;</td>
  <td rowspan=3 class=xl168 width=114 style='width:86pt'>S&#7889; thu&#7871;
  ph&#7843;i n&#7897;p trong tháng</td>
  <td rowspan=4 class=xl168 width=114 style='width:86pt'>Hợp Đồng(Y/N)</td>
   <td colspan=4 class=xl67 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl67 height=34 style='mso-height-source:userset;height:25.5pt'>
  <td rowspan=2 height=93 class=xl148 width=108 style='height:69.75pt;
  border-top:none;width:81pt'>T&#7893;ng s&#7889;</td>
  <td colspan=3 class=xl149 width=280 style='border-left:none;width:210pt'>Chia
  ra</td>
  <td rowspan=2 class=xl148 width=101 style='border-top:none;width:76pt'>T&#7893;ng
  s&#7889;</td>
  <td colspan=3 class=xl75 width=222 style='border-left:none;width:167pt'>Chia
  ra</td>
  <td colspan=4 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl67 height=59 style='mso-height-source:userset;height:44.25pt'>
  <td height=59 class=xl76 style='height:44.25pt;border-top:none;border-left:
  none'>L&#432;&#417;ng</td>
  <td class=xl76 style='border-top:none;border-left:none'>Th&#432;&#7903;ng</td>
  <td class=xl75 width=95 style='border-top:none;border-left:none;width:71pt'>Các
  kho&#7843;n khác</td>
  <td class=xl75 width=64 style='border-top:none;border-left:none;width:48pt'>Gi&#7843;m
  tr&#7915; &#272;TNT</td>
  <td class=xl75 width=64 style='border-top:none;border-left:none;width:48pt'>Gi&#7843;m
  tr&#7915; gia c&#7843;nh</td>
  <td class=xl75 width=94 style='border-top:none;border-left:none;width:71pt'>BHXH,
  BHYT,…</td>
  <td colspan=4 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl84 height=41 style='mso-height-source:userset;height:30.75pt'>
  <td height=41 class=xl77 style='height:30.75pt;border-top:none'>(1)</td>
  <td class=xl78 style='border-top:none'>&nbsp;</td>
  <td class=xl79 style='border-top:none;border-left:none'>(2)</td>
  <td class=xl79 style='border-top:none;border-left:none'>(3)</td>
  <td class=xl80 width=108 style='border-top:none;border-left:none;width:81pt'>(4)
  =(5)+(6)+(7)</td>
  <td class=xl81 style='border-top:none;border-left:none'>(5)</td>
  <td class=xl81 style='border-top:none;border-left:none'>(6)</td>
  <td class=xl81 style='border-top:none;border-left:none'>(7)</td>
  <td class=xl80 width=101 style='border-top:none;border-left:none;width:76pt'>(8)
  = (9)+(10) +(11)</td>
  <td class=xl81 style='border-top:none;border-left:none'>(9)</td>
  <td class=xl81 style='border-top:none;border-left:none'>(10)</td>
  <td class=xl79 style='border-top:none;border-left:none'>(11)</td>
  <td class=xl82 style='border-top:none;border-left:none'>(12)=(4)-(8)</td>
  <td class=xl83 style='border-top:none;border-left:none'>(13)</td>
  <td colspan=3 class=xl84 style='mso-ignore:colspan'></td>
  <td class=xl67></td>
 </tr>
 <tr class=xl138 height=27 style='mso-height-source:userset;height:20.85pt'>
  <td height=27 class=xl85 style='height:20.85pt;border-top:none'>I</td>
  <td class=xl86 style='border-top:none'>&nbsp;</td>
  <td class=xl87 style='border-top:none;border-left:none'
  x:str="S&#7889; lao &#273;&#7897;ng thu&#7897;c di&#7879;n kh&#7845;u tr&#7915; thu&#7871; ">S&#7889;
  lao &#273;&#7897;ng thu&#7897;c di&#7879;n k<span style='display:none'>h&#7845;u
  tr&#7915; thu&#7871;<span style='mso-spacerun:yes'> </span></span></td>
  <td class=xl88 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl89 width=108 style='border-top:none;border-left:none;width:81pt'>&nbsp;</td>
  <td class=xl90 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl90 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl90 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl89 width=101 style='border-top:none;border-left:none;width:76pt'>&nbsp;</td>
  <td class=xl90 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl90 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl88 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl88 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl91 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl137></td>
   <td class=xl137></td>
  <td colspan=2 class=xl138 style='mso-ignore:colspan'></td>
  <td class=xl67></td>
 </tr>
 <tr class=xl67 height=27 style='mso-height-source:userset;height:20.85pt'>
  <td height=27 class=xl92 width=64 style='height:20.85pt;border-top:none;
  width:48pt'>A</td>
  <td class=xl93 width=64 style='border-top:none;width:48pt'>&nbsp;</td>
  <td class=xl94 width=165 style='border-top:none;border-left:none;width:124pt'>Ng&#432;&#7901;i
  NN</td>
  <td class=xl95 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl97 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl97 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=4 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
 <%
     double[] nn = new double[13]{0,0,0,0,0,0,0,0,0,0,0,0,0};     
     
     for (int i = 0; i < dt_NN.Rows.Count; i++)
     {
        for(int j=3;j<=12;j++)
            nn[j] += Double.Parse(dt_NN.Rows[i][j].ToString());
    
  %>
 <tr class=xl67 height=27 style='mso-height-source:userset;height:20.85pt'>
  <td height=27 class=xl98 style='height:20.85pt;border-top:none' x:num><%=i+1%></td>
  <td class=xl99 style='border-top:none;border-left:none' x:str><%=dt_NN.Rows[i][0].ToString() %></td>
  <td class=xl100 style='border-top:none;border-left:none'><%=dt_NN.Rows[i][1].ToString() %></td>
  <td class=xl101 style='border-top:none;border-left:none'><%=dt_NN.Rows[i][2].ToString() %></td>
  <td class=xl102 align=right style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][3].ToString() %></td>
  <td class=xl103 align=right style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][4].ToString() %></td>
  <td class=xl103 style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][5].ToString() %></td>
  <td class=xl103 align=right style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][6].ToString() %></td>
  <td class=xl102 align=right style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][7].ToString() %></td>
  <td class=xl103 align=right style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][8].ToString() %></td>
  <td class=xl103 align=right style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][9].ToString() %></td>
  <td class=xl103 align=right style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][10].ToString()%></td>
  <td class=xl102 align=right style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][11].ToString()%></td>
  <td class=xl104 align=right style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][12].ToString()%></td>
  <td class=xl104 align=right style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][13].ToString()%></td>
  <td class=xl66></td>
  <td colspan=3 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
 <%} %>
 <tr class=xl68 height=27 style='mso-height-source:userset;height:20.85pt'>
  <td colspan=3 height=27 class=xl150 style='height:20.85pt'>C&#7897;ng
  ng&#432;&#7901;i NN</td>
  <td class=xl105 style='border-left:none'>&nbsp;</td>
  <td class=xl106 align=right style='border-top:none;border-left:none'  x:num><%=nn[3] %></td>
  <td class=xl106 align=right style='border-top:none;border-left:none'  x:num><%=nn[4] %></td>
  <td class=xl106 align=right style='border-top:none;border-left:none' x:num><%=nn[5] %></td>
  <td class=xl106 align=right style='border-top:none;border-left:none' x:num><%=nn[6] %></td>
  <td class=xl106 align=right style='border-top:none;border-left:none' x:num><%=nn[7] %></td>
  <td class=xl106 align=right style='border-top:none;border-left:none' x:num><%=nn[8] %></td>
  <td class=xl106 align=right style='border-top:none;border-left:none' x:num><%=nn[9] %></td>
  <td class=xl106 align=right style='border-top:none;border-left:none' x:num><%=nn[10] %></td>
  <td class=xl106 align=right style='border-top:none;border-left:none' x:num><%=nn[11] %></td>
  <td class=xl107 align=right style='border-top:none;border-left:none' x:num><%=nn[12] %></td>
  <td class=xl107 align=right style='border-top:none;border-left:none' x:num>&nbsp;</td>
  <td class=xl139></td>
  <td colspan=2 class=xl68 style='mso-ignore:colspan'></td>
  <td class=xl67></td>
 </tr>
 <tr class=xl67 height=27 style='mso-height-source:userset;height:20.85pt'>
  <td height=27 class=xl92 width=64 style='height:20.85pt;border-top:none;
  width:48pt'>B</td>
  <td class=xl93 width=64 style='border-top:none;width:48pt'>&nbsp;</td>
  <td class=xl94 width=165 style='border-top:none;border-left:none;width:124pt'>Ng&#432;&#7901;i
  VN</td>
  <td class=xl95 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl97 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=4 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
  <%
     double[] vn = new double[13]{0,0,0,0,0,0,0,0,0,0,0,0,0};  
     
     for (int k = 0; k < dt_VN.Rows.Count; k++)
     {
         for(int l=3;l<=12;l++)
            vn[l] += Double.Parse(dt_VN.Rows[k][l].ToString());
     
  %>
 <tr class=xl67 height=27 style='mso-height-source:userset;height:20.85pt'>
  <td height=27 class=xl108 width=64 style='height:20.85pt;border-top:none;
  width:48pt' x:num><%=k+1%></td>
  <td class=xl109 width=64 style='border-top:none;width:48pt'><%=dt_VN.Rows[k][0].ToString() %></td>
  <td class=xl100 width=165 style='border-top:none;border-left:none;width:124pt'><%=dt_VN.Rows[k][1].ToString() %></td>
  <td class=xl101 style='border-top:none;border-left:none'><%=dt_VN.Rows[k][2].ToString() %></td>
  <td class=xl102 align=right style='border-top:none;border-left:none' x:num><%=dt_VN.Rows[k][3].ToString() %></td>
  <td class=xl103 align=right style='border-top:none;border-left:none' x:num><%=dt_VN.Rows[k][4].ToString() %></td>
  <td class=xl103 style='border-top:none;border-left:none' x:num><%=dt_VN.Rows[k][5].ToString() %></td>
  <td class=xl103 align=right style='border-top:none;border-left:none' x:num><%=dt_VN.Rows[k][6].ToString() %></td>
  <td class=xl102 align=right style='border-top:none;border-left:none' x:num><%=dt_VN.Rows[k][7].ToString() %></td>
  <td class=xl103 align=right style='border-top:none;border-left:none' x:num><%=dt_VN.Rows[k][8].ToString() %></td>
  <td class=xl103 align=right style='border-top:none;border-left:none' x:num><%=dt_VN.Rows[k][9].ToString() %></td>
  <td class=xl103 align=right style='border-top:none;border-left:none' x:num><%=dt_VN.Rows[k][10].ToString() %></td>
  <td class=xl102 align=right style='border-top:none;border-left:none' x:num><%=dt_VN.Rows[k][11].ToString() %></td>
  <td class=xl104 align=right style='border-top:none;border-left:none'  x:num><%=dt_VN.Rows[k][12].ToString() %></td>
  <td class=xl104 align=right style='border-top:none;border-left:none'  x:num><%=dt_VN.Rows[k][13].ToString() %></td>
  <td class=xl66></td>
  <td colspan=3 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
 <%} %>
 <tr class=xl68 height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=3 height=28 class=xl153 style='height:21.0pt'>C&#7897;ng
  ng&#432;&#7901;i VN</td>
  <td class=xl111 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl112 align=right style='border-top:none;border-left:none'  x:num><%=vn[3] %></td>
  <td class=xl112 align=right style='border-top:none;border-left:none'  x:num><%=vn[4] %></td>
  <td class=xl112 align=right style='border-top:none;border-left:none' x:num><%=vn[5] %></td>
  <td class=xl112 align=right style='border-top:none;border-left:none' x:num><%=vn[6] %></td>
  <td class=xl112 align=right style='border-top:none;border-left:none'  x:num><%=vn[7] %></td>
  <td class=xl112 align=right style='border-top:none;border-left:none' x:num><%=vn[8] %></td>
  <td class=xl112 align=right style='border-top:none;border-left:none' x:num><%=vn[9] %></td>
  <td class=xl112 align=right style='border-top:none;border-left:none'  x:num><%=vn[10] %></td>
  <td class=xl112 align=right style='border-top:none;border-left:none'  x:num><%=vn[11] %></td>
  <td class=xl113 align=right style='border-top:none;border-left:none'  x:num><%=vn[12] %></td>
  <td class=xl113 align=right style='border-top:none;border-left:none'  x:num>&nbsp;</td>
  <td class=xl139></td>
  <td colspan=3 class=xl68 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl68 height=28 style='mso-height-source:userset;height:21.0pt'>
  <td height=28 class=xl114 style='height:21.0pt;border-top:none'>&nbsp;</td>
  <td class=xl115 style='border-top:none'>&nbsp;</td>
  <td class=xl116 style='border-top:none;border-left:none'>C&#7897;ng I</td>
  <td class=xl88 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl117 align=right style='border-top:none;border-left:none'  x:num><%=vn[3]+nn[3] %></td>
  <td class=xl117 align=right style='border-top:none;border-left:none'  x:num><%=vn[4]+nn[4] %></td>
  <td class=xl117 align=right style='border-top:none;border-left:none' x:num><%=vn[5]+nn[5] %></td>
  <td class=xl117 align=right style='border-top:none;border-left:none' x:num><%=vn[6]+nn[6] %></td>
  <td class=xl117 align=right style='border-top:none;border-left:none'  x:num><%=vn[7]+nn[7] %></td>
  <td class=xl117 align=right style='border-top:none;border-left:none' x:num><%=vn[8]+nn[8] %></td>
  <td class=xl117 align=right style='border-top:none;border-left:none' x:num><%=vn[9]+nn[9] %></td>
  <td class=xl117 align=right style='border-top:none;border-left:none' x:num><%=vn[10]+nn[10] %></td>
  <td class=xl117 align=right style='border-top:none;border-left:none'  x:num><%=vn[11]+nn[11] %></td>
  <td class=xl118 align=right style='border-top:none;border-left:none'  x:num><%=vn[12]+nn[12] %></td>
  <td class=xl118 align=right style='border-top:none;border-left:none'  x:num>&nbsp;</td>
  <td class=xl139></td>
  <td colspan=3 class=xl68 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl138 height=27 style='mso-height-source:userset;height:20.85pt'>
  <td height=27 class=xl119 style='height:20.85pt;border-top:none'>II</td>
  <td class=xl120 style='border-top:none'>&nbsp;</td>
  <td class=xl121 style='border-top:none;border-left:none'
  x:str="S&#7889; lao &#273;&#7897;ng không thu&#7897;c di&#7879;n kh&#7845;u tr&#7915; thu&#7871; ">S&#7889;
  lao &#273;&#7897;ng không thu&#7897;c<span style='display:none'> di&#7879;n
  kh&#7845;u tr&#7915; thu&#7871;<span style='mso-spacerun:yes'> </span></span></td>
  <td class=xl122 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl123 width=108 style='border-top:none;border-left:none;width:81pt'>&nbsp;</td>
  <td class=xl123 width=110 style='border-top:none;border-left:none;width:83pt'>&nbsp;</td>
  <td class=xl124 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl124 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl125 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl124 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl124 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl125 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl125 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl126 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl137></td>
  <td colspan=2 class=xl138 style='mso-ignore:colspan'></td>
  <td class=xl67></td>
 </tr>
 <%
     double[] no = new double[13]{0,0,0,0,0,0,0,0,0,0,0,0,0};  
     
     for (int m = 0; m < dt_NO_PIT.Rows.Count; m++)
     {
         for(int h=3;h<=12;h++)
            no[h] += Double.Parse(dt_NO_PIT.Rows[m][h].ToString());
     
  %>
 <tr class=xl138 height=27 style='mso-height-source:userset;height:20.85pt'>
  <td height=27 class=xl108 width=64 style='height:20.85pt;border-top:none;
  width:48pt' x:num><%=m+1 %></td>
  <td class=xl109 width=64 style='border-top:none;width:48pt'><%=dt_NO_PIT.Rows[m][0].ToString() %></td>
  <td class=xl100 width=165 style='border-top:none;border-left:none;width:124pt'><%=dt_NO_PIT.Rows[m][1].ToString() %></td>
  <td class=xl101 style='border-top:none;border-left:none'><%=dt_NO_PIT.Rows[m][2].ToString() %></td>
  <td class=xl127 width=108 style='border-top:none;border-left:none;width:81pt'  x:num><%=dt_NO_PIT.Rows[m][3].ToString() %></td>
  <td class=xl127 width=110 style='border-top:none;border-left:none;width:83pt'  x:num><%=dt_NO_PIT.Rows[m][4].ToString() %></td>
  <td class=xl76 style='border-top:none;border-left:none'><%=dt_NO_PIT.Rows[m][5].ToString() %></td>
  <td class=xl128 style='border-top:none;border-left:none' x:num><%=dt_NO_PIT.Rows[m][6].ToString() %></td>
  <td class=xl102 align=right style='border-top:none;border-left:none' x:num><%=dt_NO_PIT.Rows[m][7].ToString() %></td>
  <td class=xl128 style='border-top:none;border-left:none' x:num><%=dt_NO_PIT.Rows[m][8].ToString() %></td>
  <td class=xl128 style='border-top:none;border-left:none' x:num><%=dt_NO_PIT.Rows[m][9].ToString() %></td>
  <td class=xl103 align=right style='border-top:none;border-left:none'  x:num><%=dt_NO_PIT.Rows[m][10].ToString() %></td>
  <td class=xl102 align=right style='border-top:none;border-left:none'  x:num><%=dt_NO_PIT.Rows[m][11].ToString() %></td>
  <td class=xl104 align=right style='border-top:none;border-left:none' x:num><%=dt_NO_PIT.Rows[m][12].ToString() %></td>
  <td class=xl104 align=right style='border-top:none;border-left:none' x:num><%=dt_NO_PIT.Rows[m][13].ToString() %></td>
  <td class=xl137></td>
  <td colspan=2 class=xl138 style='mso-ignore:colspan'></td>
  <td class=xl67></td>
 </tr>
 <%} %>
 <tr class=xl138 height=27 style='mso-height-source:userset;height:20.85pt'>
  <td height=27 class=xl85 style='height:20.85pt;border-top:none'>&nbsp;</td>
  <td class=xl88 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl87 style='border-top:none;border-left:none'>C&#7897;ng II</td>
  <td class=xl88 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl129 width=108 style='border-top:none;border-left:none;width:81pt'  x:num><%=no[3]%> </td>
  <td class=xl129 width=110 style='border-top:none;border-left:none;width:83pt'  x:num><%=no[4]%> </td>
  <td class=xl129 width=75 style='border-top:none;border-left:none;width:56pt'  x:num><%=no[5]%></td>
  <td class=xl129 width=95 style='border-top:none;border-left:none;width:71pt'  x:num><%=no[6]%></td>
  <td class=xl129 width=101 style='border-top:none;border-left:none;width:76pt' x:num><%=no[7]%> </td>
  <td class=xl129 width=64 style='border-top:none;border-left:none;width:48pt'  x:num><%=no[8]%></td>
  <td class=xl129 width=64 style='border-top:none;border-left:none;width:48pt' x:num><%=no[9]%></td>
  <td class=xl129 width=94 style='border-top:none;border-left:none;width:71pt' x:num><%=no[10]%></td>
  <td class=xl129 width=91 style='border-top:none;border-left:none;width:68pt' x:num><%=no[11]%></td>
  <td class=xl130 width=114 style='border-top:none;border-left:none;width:86pt' x:num><%=no[12]%></td>
  <td class=xl130 width=114 style='border-top:none;border-left:none;width:86pt' x:num>&nbsp;</td>
  <td class=xl137></td>
  <td colspan=2 class=xl138 style='mso-ignore:colspan'></td>
  <td class=xl67></td>
 </tr>
 <tr class=xl141 height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=3 height=30 class=xl142 width=293 style='height:22.5pt;
  width:220pt'>T&#7892;NG C&#7896;NG</td>
  <td class=xl131 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl132 align=right style='border-top:none;border-left:none'  x:num><%=vn[3]+nn[3]+no[3] %></td>
  <td class=xl132 align=right style='border-top:none;border-left:none'  x:num><%=vn[4]+nn[4]+no[4] %></td>
  <td class=xl132 align=right style='border-top:none;border-left:none' x:num><%=vn[5]+nn[5]+no[5] %></td>
  <td class=xl132 align=right style='border-top:none;border-left:none' x:num><%=vn[6]+nn[6]+no[6] %></td>
  <td class=xl132 align=right style='border-top:none;border-left:none'  x:num><%=vn[7]+nn[7]+no[7] %></td>
  <td class=xl132 align=right style='border-top:none;border-left:none' x:num><%=vn[8]+nn[8]+no[8] %></td>
  <td class=xl132 align=right style='border-top:none;border-left:none' x:num><%=vn[9]+nn[9]+no[9] %></td>
  <td class=xl132 align=right style='border-top:none;border-left:none'  x:num><%=vn[10]+nn[10]+no[10] %></td>
  <td class=xl132 align=right style='border-top:none;border-left:none'  x:num><%=vn[11]+nn[11]+no[11] %></td>
  <td class=xl133 align=right style='border-top:none;border-left:none'  x:num><%=vn[12]+nn[12]+no[12] %></td>
  <td class=xl133 align=right style='border-top:none;border-left:none'  x:num>&nbsp;</td>
  <td class=xl140></td>
  <td colspan=3 class=xl141 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl67 height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 colspan=3 class=xl67 style='height:12.75pt;mso-ignore:colspan'></td>
  <td class=xl73></td>
  <td colspan=10 class=xl74 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl67 style='mso-ignore:colspan'></td>
 </tr>
 
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=165 style='width:124pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=108 style='width:81pt'></td>
  <td width=110 style='width:83pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=95 style='width:71pt'></td>
  <td width=101 style='width:76pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=94 style='width:71pt'></td>
  <td width=91 style='width:68pt'></td>
  <td width=114 style='width:86pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
