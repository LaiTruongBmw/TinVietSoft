<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
    string emp_pk,p_sal_security;
    emp_pk = Request["emp_pk"].ToString();
    p_sal_security = Request["p_sal_security"].ToString();
    
    //-----------------information of company-----------------
    string SQL_Com
	= "select  a.TCO_BPPHOTO_PK,a.PARTNER_LNAME,a.ADDR1,a.PHONE_NO,A.FAX_no " + 
        "from tco_company a " +
        "where a.DEL_IF=0 and rownum=1 " +
        "and a.pk in ( select f.tco_company_pk from  " +
        "               tco_org  f " +
        "               where  f.pk IN ( " +
        "                              SELECT     g.tco_org_pk " +
        "                                    FROM thr_employee g " +
        "                                   WHERE g.del_if = 0 " +
        "     and g.pk in(" + emp_pk + ") ))" ; 
        

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
    //-----------------------information of employee--------------------------
    string SQL;
    SQL = " select ";
    SQL = SQL + "        PHOTO_PK,  ";
    SQL = SQL + "        EMP_ID, ";
    SQL = SQL + "        FULL_NAME,  ";
    SQL = SQL + "        b.org_NM, ";
    SQL = SQL + "        SEX.CODE_fNM,  ";
    SQL = SQL + "        TO_CHAR(TO_DATE(JOIN_DT,'YYYYMMDD'),'DD/MM/YYYY'),  ";
    SQL = SQL + "        TO_CHAR(TO_DATE(left_DT,'YYYYMMDD'),'DD/MM/YYYY'),  ";
    SQL = SQL + "        CONTRACT_NO,  ";
    SQL = SQL + "        TO_CHAR(TO_DATE(a.BEGIN_CONTRACT,'YYYYMMDD'),'DD/MM/YYYY'), ";
    SQL = SQL + "        contract_type.code_fnm,  ";
    SQL = SQL + "        decode(length(birth_dt),4,birth_dt,to_char(to_date(BIRTH_DT,'yyyymmdd'),'dd/mm/yyyy')),  ";
    SQL = SQL + "        PLACE_BIRTH.CODE_fNM,  ";
    SQL = SQL + "        NATION.code_fnm,  ";
    SQL = SQL + "        PERSON_ID,  ";
    SQL = SQL + "        TO_CHAR(TO_DATE(ISSUE_DT,'YYYYMMDD'),'DD/MM/YYYY'),  ";
    SQL = SQL + "        PLACE_PER_ID.CODE_fNM,  ";
    SQL = SQL + "        PERMANENT_ADDR,  ";
    SQL = SQL + "        PRESENT_ADDR,  ";
    SQL = SQL + "        TEL,  ";
    SQL = SQL + "        ETHNIC_TYPE.code_fnm,  ";
    SQL = SQL + "        DECODE(MARRIED_YN,'Y','Có gia đình','N','Độc thân'),  ";
    SQL = SQL + "        RELIG_TYPE.code_fnm,  ";
    SQL = SQL + "        social_no,  ";
    SQL = SQL + "        to_char(to_date(social_dt,'yyyymm'),'mm/yyyy'),  ";
    SQL = SQL + "        social_place.code_fnm,  ";
    SQL = SQL + "       edu_type.code, a.MONEY_KIND, a.pk   ";
    SQL = SQL + "     from thr_employee a,tco_org b,thr_work_group c, ";
    SQL = SQL + "     (select code as code from vhr_hr_code where id='HR0011') Edu_TYPE, ";
    SQL = SQL + "    (select code as code,code_fnm from vhr_hr_code where id='HR0007') SEX, ";
    SQL = SQL + "    (select code as code,code_fnm from vhr_hr_code where id='HR0009') NATION, ";
    SQL = SQL + "     (select code as code,code_fnm from vhr_hr_code where id='HR0021') PLACE_BIRTH, ";
    SQL = SQL + "    (select code as code,code_fnm from vhr_hr_code where id='HR0014') PLACE_PER_ID, ";
    SQL = SQL + "    (select code as code,code_fnm from vhr_hr_code where id='HR0015') ETHNIC_TYPE, ";
    SQL = SQL + "    (select code as code,code_fnm from vhr_hr_code where  id='HR0016') relig_type, ";
    SQL = SQL + "    (select code as code,code_fnm from vhr_hr_code where  id='HR0013') social_place, ";
    SQL = SQL + "    (select code as code,code_fnm from vhr_hr_code where  id='HR0001') contract_type";
    SQL = SQL + "     where a.del_if=0 and b.del_if=0 and c.del_if=0 ";
    SQL = SQL + "     and a.thr_wg_pk=c.pk ";
    SQL = SQL + "     and a.tco_org_pk=b.pk ";
    SQL = SQL + "     AND A.SEX=SEX.code(+) ";
    SQL = SQL + "     AND A.NATION=NATION.code(+) ";
    SQL = SQL + "     AND A.PLACE_BIRTH=PLACE_BIRTH.code(+) ";
    SQL = SQL + "     AND A.PLACE_PER_ID=PLACE_PER_ID.code(+) ";
    SQL = SQL + "     and a.ETHNIC_TYPE=ETHNIC_TYPE.code(+) ";
    SQL = SQL + "     and a.edu_TYPE=edu_TYPE.code(+) ";
    SQL = SQL + "     and a.social_place=social_place.code(+) ";
    SQL = SQL + "     and a.RELIG_TYPE=RELIG_TYPE.code(+) ";
    SQL = SQL + "     and a.contract_TYPE=contract_type.code(+) ";
    SQL = SQL + "     and a.pk in(" + emp_pk + ")"; 
// Response.Write(SQL);
 // Response.End();
    DataTable dt_total = CtlLib.TableReadOpen(SQL);
    int irow;
    irow = dt_total.Rows.Count;
    if (irow == 0)
        Response.Write("There is no data");
    
    
    
    
    string s_format;
 %>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_Emp_Record_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_Emp_Record_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_Emp_Record_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Administrator</o:Author>
  <o:LastAuthor>ty-ml</o:LastAuthor>
  <o:LastPrinted>2008-08-21T03:39:52Z</o:LastPrinted>
  <o:Created>2006-08-14T16:37:14Z</o:Created>
  <o:LastSaved>2008-08-21T07:39:01Z</o:LastSaved>
  <o:Company>GENUWIN</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.23in .26in .28in .25in;
	mso-header-margin:.17in;
	mso-footer-margin:.28in;}
.font7
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font10
	{color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font11
	{color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font18
	{color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font19
	{color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font20
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
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
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl27
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt dot-dash-slanted windowtext;
	border-left:none;}
.xl28
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt dot-dash-slanted windowtext;
	border-left:none;}
.xl29
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl30
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl31
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl32
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl33
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl34
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl35
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl37
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl39
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt dotted windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl41
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"dd\\-mmm";
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl42
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"0\;\[Red\]0";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl43
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl44
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl45
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl46
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl47
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl48
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl49
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl50
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl51
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0";
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl52
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl53
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl54
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl55
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl56
	{mso-style-parent:style0;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl57
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl58
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl59
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl60
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl61
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl62
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl63
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl64
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl65
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl66
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl67
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl68
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl69
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl70
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl71
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl72
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl73
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0";
	text-align:left;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl74
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0";
	text-align:left;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl75
	{mso-style-parent:style0;
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
	mso-pattern:auto none;}
.xl76
	{mso-style-parent:style0;
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
	mso-pattern:auto none;}
.xl77
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCC99;
	mso-pattern:auto none;}
.xl78
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl79
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:top;
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl80
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0";
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl81
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted black;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted black;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt dotted black;}
.xl91
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl92
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl93
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl94
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl95
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt dotted black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl96
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl97
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl98
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#FFCC00;
	mso-pattern:auto none;}
.xl99
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl100
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl101
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl102
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:1.0pt dot-dash-slanted windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
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
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>11</x:ActiveRow>
       <x:ActiveCol>7</x:ActiveCol>
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
  <x:WindowHeight>7995</x:WindowHeight>
  <x:WindowWidth>15360</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>2340</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049" style='mso-wrap-style:tight'
  fillcolor="none [9]">
  <v:fill color="none [9]"/>
 </o:shapedefaults></xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
  <o:regrouptable v:ext="edit">
   <o:entry new="1" old="0"/>
   <o:entry new="2" old="0"/>
  </o:regrouptable>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl25>

<table x:str border=0 cellpadding=0 cellspacing=0 width=724 style='border-collapse:
 collapse;table-layout:fixed;width:545pt'>
 <col class=xl25 width=158 style='mso-width-source:userset;mso-width-alt:5778;
 width:119pt'>
 <col class=xl25 width=112 style='mso-width-source:userset;mso-width-alt:4096;
 width:84pt'>
 <col class=xl25 width=118 style='mso-width-source:userset;mso-width-alt:4315;
 width:89pt'>
 <col class=xl25 width=110 style='mso-width-source:userset;mso-width-alt:4022;
 width:83pt'>
 <col class=xl25 width=120 style='mso-width-source:userset;mso-width-alt:4388;
 width:90pt'>
 <col class=xl25 width=106 style='mso-width-source:userset;mso-width-alt:3876;
 width:80pt'>
 <%
      for (int i = 0; i < irow; i++)
      { 
  %>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 width=158 style='height:18.75pt;width:119pt' align=left
  valign=top><!--[if gte vml 1]><v:shapetype id="_x0000_t75" coordsize="21600,21600"
   o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe" filled="f"
   stroked="f">
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
  </v:shapetype><v:shape id="_x0000_s1042" type="#_x0000_t75" alt="" style='position:absolute;
   margin-left:0;margin-top:0;width:47.25pt;height:31.5pt;z-index:1'>
   <v:imagedata src="..\..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt_Com.Rows[0][0].ToString()%>&table_name=tco_bpphoto"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:0px;margin-top:0px;width:63px;
  height:42px'><img width=63 height=42
   src="..\..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt_Com.Rows[0][0].ToString()%>&table_name=tco_bpphoto"
  v:shapes="_x0000_s1042"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=25 class=xl24 width=170 style='height:18.75pt;width:128pt'><span
    style='mso-spacerun:yes'>                       </span><%=dt_Com.Rows[0][1].ToString()%><font class="font7">.</font></td>
   </tr>
  </table>
  </span></td>
  <td class=xl25 width=112 style='width:84pt'></td>
  <td class=xl26 width=118 style='width:89pt'></td>
  <td colspan=3 class=xl25 width=336 style='width:253pt'></td>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl27 style='height:13.5pt'><span
  style='mso-spacerun:yes'>                       </span><%=dt_Com.Rows[0][2].ToString()%>, &#272;T :
  <%=dt_Com.Rows[0][3].ToString()%>, Fax : <%=dt_Com.Rows[0][4].ToString()%></span></td>
  <td class=xl25></td>
  <td class=xl27>&nbsp;</td>
  <td class=xl27>&nbsp;</td>
  <td class=xl28>&nbsp;</td>
  <td class=xl28>&nbsp;</td>
 </tr>
 <tr height=14 style='mso-height-source:userset;height:10.5pt'>
  <td height=14 class=xl25 style='height:10.5pt'></td>
  <td colspan=5 class=xl102>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 style='height:18.0pt' align=left valign=top><!--[if gte vml 1]><v:rect
   id="_x0000_s1059" style='position:absolute;margin-left:33.75pt;margin-top:.75pt;
   width:84.75pt;height:93.75pt;z-index:1' fillcolor="window [65]"
   strokecolor="windowText [64]" o:insetmode="auto"/><v:shape id="_x0000_s1050"
   type="#_x0000_t75" style='position:absolute;margin-left:36pt;margin-top:3.75pt;
   width:81pt;height:88.5pt;z-index:4'>
   <v:imagedata src="..\..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt_total.Rows[i][0].ToString()%>&table_name=<%=Session["APP_DBUSER"].ToString()%>.TC_FSBINARY"  o:title="Untitled-1"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:44px;margin-top:0px;width:115px;
  height:127px'><img width=115 height=127 src="..\..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt_total.Rows[i][0].ToString()%>&table_name=<%=Session["APP_DBUSER"].ToString()%>.TC_FSBINARY"
  v:shapes="_x0000_s1059 _x0000_s1050"></span><![endif]><span style='mso-ignore:
  vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=24 class=xl25 width=158 style='height:18.0pt;width:119pt'></td>
   </tr>
  </table>
  </span></td>
  
  <td colspan=2 class=xl99><span style='mso-spacerun:yes'>             
  </span>MSNV (<font class="font19">Emp. Code</font><font class="font11">):</font></td>
  <td colspan=2 class=xl101><%=dt_total.Rows[i][1].ToString()%></td>
  <td class=xl30></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl25 style='height:18.0pt'></td>
  <td colspan=2 class=xl99><span style='mso-spacerun:yes'>             
  </span>H&#7885; và tên ( <font class="font19">Full name </font><font
  class="font11">):</font></td>
  <td colspan=3 class=xl100 x:str><%=dt_total.Rows[i][2].ToString()%><span style='mso-spacerun:yes'> </span></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl25 style='height:18.0pt'></td>
  <td colspan=2 class=xl99><span style='mso-spacerun:yes'>             
  </span>B&#7897; ph&#7853;n (<font class="font19">Dept</font><font
  class="font11">):</font></td>
  <td colspan=2 class=xl100><%=dt_total.Rows[i][3].ToString()%></td>
  <td class=xl30></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl25 style='height:18.0pt'></td>
  <td colspan=2 class=xl99><span style='mso-spacerun:yes'>             
  </span>Gi&#7899;i tính (<font class="font19">Gender</font><font class="font11">):</font></td>
  <td colspan=2 class=xl100><%=dt_total.Rows[i][4].ToString()%></td>
  <td class=xl30></td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td height=32 class=xl25 style='height:24.0pt'></td>
  <td colspan=2 class=xl25></td>
  <td colspan=3 class=xl25></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td colspan=6 height=37 class=xl97 style='height:27.75pt'>H&#7890; S&#416;
  NHÂN VIÊN (Employee Record )</td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=6 height=29 class=xl98 style='height:21.75pt'>THÔNG TIN CÁ NHÂN
  (Personal information)</td>
 </tr>
 <tr class=xl29 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl31 style='height:30.0pt'>Ngày vào (<font class="font18">
  Join date</font><font class="font10">):</font></td>
  <td class=xl32><%=dt_total.Rows[i][5].ToString()%></td>
  <td colspan=2 class=xl92 style='border-right:.5pt dotted black;border-left:
  none'>Ngày nghỉ việc ( <font class="font18">Left date</font><font
  class="font10">):</font></td>
  <td class=xl33 x:str><%=dt_total.Rows[i][6].ToString()%></td>
  <% if (dt_total.Rows[i][26].ToString() == "01")
     { %>
  <td class=xl34>&nbsp;</td>
  <%    }
        else
        { %>
    <td class=xl34>&nbsp;</td>
     <%} %>
 </tr>
 <tr class=xl29 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl35 width=158 style='height:30.0pt;width:119pt'>H&#7907;p
  &#273;&#7891;ng lao &#273;&#7897;ng s&#7889; : <font class="font18">(Labor
  contract no.)</font><font class="font10"><span
  style='mso-spacerun:yes'> </span></font></td>
  <td class=xl36><%=dt_total.Rows[i][7].ToString()%></td>
  <td class=xl37 width=118 style='width:89pt'>Ngày h&#7907;p &#273;&#7891;ng: <font
  class="font18">(date of contract)</font></td>
  <td class=xl32><%=dt_total.Rows[i][8].ToString()%></td>
  <td class=xl37 width=120 style='width:90pt'>Lo&#7841;i h&#7907;p
  &#273;&#7891;ng: <font class="font18">(type of contract)</font></td>
  <td class=xl55 width=106 style='width:80pt'><%=dt_total.Rows[i][9].ToString()%></td>
 </tr>
 <tr class=xl29 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl39 width=158 style='height:30.0pt;width:119pt'>Ngày
  sinh:<span style='mso-spacerun:yes'>                  </span><font
  class="font18">(Date of birth)</font></td>
  <td class=xl38><%=dt_total.Rows[i][10].ToString()%></td>
  <td class=xl37 width=118 style='width:89pt'>N&#417;i sinh:<span
  style='mso-spacerun:yes'>        </span><font class="font18">(Place of birth)</font></td>
  <td class=xl38><%=dt_total.Rows[i][11].ToString()%></td>
  <td class=xl37 width=120 style='width:90pt'>Qu&#7889;c t&#7883;ch:<span
  style='mso-spacerun:yes'>   </span><font class="font18">(Nationality)</font></td>
  <td class=xl38><%=dt_total.Rows[i][12].ToString()%></td>
 </tr>
 <tr class=xl29 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl40 style='height:30.0pt'>CMND (<font class="font18">ID.Card</font><font
  class="font10">)</font></td>
  <td class=xl36><%=dt_total.Rows[i][13].ToString()%></td>
  <td class=xl37 width=118 style='width:89pt'>Ngày c&#7845;p:<span
  style='mso-spacerun:yes'>          </span><font class="font18">(Issued date)</font><font
  class="font10"><span style='mso-spacerun:yes'> </span></font></td>
  <td class=xl41><%=dt_total.Rows[i][14].ToString()%></td>
  <td class=xl37 width=120 style='width:90pt'>N&#417;i c&#7845;p:<span
  style='mso-spacerun:yes'>    </span><font class="font18">(Issued at)</font></td>
  <td class=xl38><%=dt_total.Rows[i][15].ToString()%></td>
 </tr>
 <tr class=xl29 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td colspan=2 height=40 class=xl94 style='border-right:.5pt dotted black;
  height:30.0pt'>&#272;&#7883;a ch&#7881; th&#432;&#7901;ng trú (<font
  class="font18">Permanent address</font><font class="font10">) :</font></td>
  <td colspan=4 class=xl90 style='border-right:.5pt solid black;border-left:
  none'><%=dt_total.Rows[i][16].ToString()%></td>
 </tr>
 <tr class=xl29 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td colspan=2 height=40 class=xl94 style='border-right:.5pt dotted black;
  height:30.0pt'>&#272;&#7883;a ch&#7881; t&#7841;m trú (<font class="font18">Temporary
  address</font><font class="font10">) :</font></td>
  <td colspan=4 class=xl90 style='border-right:.5pt solid black;border-left:
  none'><%=dt_total.Rows[i][17].ToString()%></td>
 </tr>
 <tr class=xl29 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl40 style='height:30.0pt'>&#272;i&#7879;n th&#7885;ai (<font
  class="font18">Tel. No.</font><font class="font10">) :<span
  style='mso-spacerun:yes'> </span></font></td>
  <td class=xl42><%=dt_total.Rows[i][18].ToString()%></td>
  <td colspan=2 class=xl81 width=228 style='border-right:.5pt dotted black;
  border-left:none;width:172pt'>Dân t&#7897;c:<span style='mso-spacerun:yes'>  
  </span>(<font class="font18">Ethnic</font><font class="font10">)</font></td>
  <td colspan=2 class=xl85 width=226 style='border-right:.5pt solid black;
  border-left:none;width:170pt'><%=dt_total.Rows[i][19].ToString()%></td>
 </tr>
 <tr class=xl29 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl39 width=158 style='height:30.0pt;width:119pt'>Tình
  tr&#7841;nh hôn nhân: <font class="font18">(Marital Status)</font></td>
  <td class=xl38><%=dt_total.Rows[i][20].ToString()%></td>
  <td colspan=2 class=xl88 width=228 style='border-right:.5pt dotted black;
  border-left:none;width:172pt'>Tôn giáo (<font class="font18">Religion</font><font
  class="font10">):</font></td>
  <td colspan=2 class=xl90 style='border-right:.5pt solid black;border-left:
  none'><%=dt_total.Rows[i][21].ToString()%></td>
 </tr>
 <tr class=xl29 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl39 width=158 style='height:30.0pt;width:119pt'>S&#7889;
  s&#7893; BHXH (I<font class="font18">nsurance Book No</font><font
  class="font10">.)</font></td>
  <td class=xl42><%=dt_total.Rows[i][22].ToString()%></td>
  <td colspan=2 class=xl81 width=228 style='border-right:.5pt dotted black;
  border-left:none;width:172pt'>B&#7855;t &#273;&#7847;u mua BHXH tháng (<font
  class="font18">Begin</font><font class="font10">):</font></td>
  <td colspan=2 class=xl83 width=226 style='border-right:.5pt solid black;
  border-left:none;width:170pt'><%=dt_total.Rows[i][23].ToString()%></td>
 </tr>
 <tr class=xl29 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td colspan=2 height=40 class=xl81 width=270 style='border-right:.5pt dotted black;
  height:30.0pt;width:203pt'>N&#417;i &#273;ang ký khám ch&#7919;a b&#7879;nh
  :<span style='mso-spacerun:yes'>            </span><font class="font18">(Social
  insurance book no.)</font></td>
  <td colspan=4 class=xl85 width=454 style='border-right:.5pt solid black;
  border-left:none;width:342pt'><%=dt_total.Rows[i][24].ToString()%></td>
 </tr>
 <%
      string s1, s2, s3, s4, s5, s6;
      s1 = "";
      s2 = "";
      s3 = "";
      s4 = "";
      s5 = "";
      s6 = "";

      if (dt_total.Rows[i][25].ToString() == "02")
          s1 = "X";
      else if (dt_total.Rows[i][25].ToString() == "03")
          s2 = "X";
      else if (dt_total.Rows[i][25].ToString() == "04")
          s3 = "X";
      else if (dt_total.Rows[i][25].ToString() == "05")
          s4 = "X";
      else if (dt_total.Rows[i][25].ToString() == "06")
          s5 = "X";
      else if (dt_total.Rows[i][25].ToString() == "07")
          s6 = "X";
        
     %>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td  height=23 width=724 style='border-right:.5pt solid black;
  height:17.25pt;width:545pt' align=left valign=top><!--[if gte vml 1]><v:rect
   id="_x0000_s1047" style='position:absolute;margin-left:96pt;margin-top:17.25pt;
   width:21pt;height:18.75pt;z-index:2;mso-wrap-style:tight' o:regroupid="2"
   fillcolor="window [65]" strokecolor="windowText [64]">
   <v:textbox style='mso-direction-alt:auto'>
    <div style='text-align:center'><font class="font20"><%=s2 %></font></div>
   </v:textbox>
   <x:ClientData ObjectType="Rect">
   </x:ClientData>
  </v:rect><v:rect id="_x0000_s1056" style='position:absolute;margin-left:352.5pt;
   margin-top:17.25pt;width:21pt;height:18.75pt;z-index:6;mso-wrap-style:tight'
   fillcolor="window [65]" strokecolor="windowText [64]">
   <v:textbox style='mso-direction-alt:auto'>
    <div style='text-align:center'><font class="font20"><%=s5 %></font></div>
   </v:textbox>
   <x:ClientData ObjectType="Rect">
   </x:ClientData>
  </v:rect><v:rect id="_x0000_s1058" style='position:absolute;margin-left:.75pt;
   margin-top:16.5pt;width:21pt;height:18.75pt;z-index:8;mso-wrap-style:tight'
   fillcolor="window [65]" strokecolor="windowText [64]">
   <v:textbox style='mso-direction-alt:auto'>
    <div style='text-align:center'><font class="font20"><%=s1 %></font></div>
   </v:textbox>
   <x:ClientData ObjectType="Rect">
   </x:ClientData>
  </v:rect><v:rect id="_x0000_s1057" style='position:absolute;margin-left:441.75pt;
   margin-top:17.25pt;width:21pt;height:18.75pt;z-index:7;mso-wrap-style:tight'
   fillcolor="window [65]" strokecolor="windowText [64]">
   <v:textbox style='mso-direction-alt:auto'>
    <div style='text-align:center'><font class="font20"><%=s6 %></font></div>
   </v:textbox>
   <x:ClientData ObjectType="Rect">
   </x:ClientData>
  </v:rect><v:rect id="_x0000_s1054" style='position:absolute;margin-left:180.75pt;
   margin-top:17.25pt;width:21pt;height:18.75pt;z-index:4;mso-wrap-style:tight'
   fillcolor="window [65]" strokecolor="windowText [64]">
   <v:textbox style='mso-direction-alt:auto'>
    <div style='text-align:center'><font class="font20"><%=s3%></font></div>
   </v:textbox>
   <x:ClientData ObjectType="Rect">
   </x:ClientData>
  </v:rect><![endif]--><![if !vml]><span style='mso-ignore:vglayout;position:
  absolute;z-index:2;margin-left:0px;margin-top:21px;width:618px;height:28px'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td width=0 height=0></td>
    <td width=30></td>
    <td width=97></td>
    <td width=30></td>
    <td width=83></td>
    <td width=30></td>
    <td width=199></td>
    <td width=30></td>
    <td width=89></td>
    <td width=30></td>
   </tr>
   <tr>
    <td height=1></td>
    
    <td rowspan=2 align=left valign=top><img width=30 height=27
    
     src=src="rpt_Emp_Record_files/image003.gif" alt="Text Box: X" v:shapes="_x0000_s1058"></td>
   </tr>
   <tr>
    <td height=26></td>
    <td></td>
    <td rowspan=2 align=left valign=top><img width=30 height=27
    src=src="rpt_Emp_Record_files/image003.gif" alt="Text Box: X" v:shapes="_x0000_s1047"></td>
    <td></td>
    <td rowspan=2 align=left valign=top><img width=30 height=27
    src=src="rpt_Emp_Record_files/image003.gif" alt="Text Box: X" v:shapes="_x0000_s1054"></td>
    <td></td>
    <td rowspan=2 align=left valign=top><img width=30 height=27
    src=src="rpt_Emp_Record_files/image003.gif" alt="Text Box: X" v:shapes="_x0000_s1056"></td>
    <td></td>
    <td rowspan=2 align=left valign=top><img width=30 height=27
    src=src="rpt_Emp_Record_files/image003.gif" alt="Text Box: X" v:shapes="_x0000_s1057"></td>
   </tr>
   <tr>
    <td height=1></td>
   </tr>
  </table>
  </span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td colspan=6 height=23 class=xl75 width=724 style='border-right:.5pt solid black;
    height:17.25pt;width:545pt'>TRÌNH &#272;&#7896; H&#7884;C V&#7844;N
    (Education record)</td>
   </tr>
  </table>
  </span></td>
 </tr>
 <tr class=xl29 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl61 style='height:18.75pt'><span
  style='mso-spacerun:yes'> </span>C&#7845;p II</td>
  <td class=xl29>C&#7845;p III</td>
  <td align=right valign=top><!--[if gte vml 1]><v:rect id="_x0000_s1055"
   style='position:absolute;margin-left:67.5pt;margin-top:.75pt;width:21pt;
   height:18.75pt;z-index:5;mso-wrap-style:tight' fillcolor="window [65]"
   strokecolor="windowText [64]">
   <v:textbox style='mso-direction-alt:auto'>
    <div style='text-align:center'><font class="font20"><%=s4 %></font></div>
   </v:textbox>
   <x:ClientData ObjectType="Rect">
   
   </x:ClientData>
  </v:rect><![endif]--><![if !vml]><span style='mso-ignore:vglayout;position:
  absolute;z-index:5;margin-left:89px;margin-top:0px;width:30px;height:27px'><img
  width=30 height=27 src=src="rpt_Emp_Record_files/image003.gif" alt="Text Box: X"
  v:shapes="_x0000_s1055"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=25 class=xl29 width=118 style='height:18.75pt;width:89pt'>Trung
    c&#7845;p</td>
   </tr>
  </table>
  </span></td>
  <td class=xl29>Cao &#273;&#7843;ng</td>
  <td class=xl29>&#272;&#7841;i h&#7885;c</td>
  <td class=xl43>Trên &#273;&#7841;i h&#7885;c</td>
 </tr>
 <tr class=xl29 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl62 style='height:18.75pt'>(Secondary)</td>
  <td class=xl44>(High school)</td>
  <td class=xl44>(Middle school)</td>
  <td class=xl44>(College)</td>
  <td class=xl44>(University)</td>
  <td class=xl45>(Master)</td>
 </tr>
 <%
          
     //--------------------------Experience-----------------------
     string SQL_EDU;
     SQL_EDU = " select a.E_name, a.start_dt,a.end_dt,a.major,a.result,a.remark ";
     SQL_EDU = SQL_EDU + " from thr_emp_edu a ";
     SQL_EDU = SQL_EDU + " where del_if=0 and a.THR_EMP_PK =" + dt_total.Rows[i][27].ToString();
     SQL_EDU = SQL_EDU + " order by nvl(a.start_dt,0) ";
          
     DataTable dt_total_edu = CtlLib.TableReadOpen(SQL_EDU);
     int irow_edu;
     irow_edu = dt_total_edu.Rows.Count;


     if (irow_edu > 0)
     {

         for (int edu = 0; edu < irow_edu; edu++)
         {
              
          %>
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl46 style='height:18.0pt'><%= dt_total_edu.Rows[edu][0].ToString()%></td>
  <td class=xl47><%= dt_total_edu.Rows[edu][1].ToString()%></td>
  <td class=xl47><%= dt_total_edu.Rows[edu][2].ToString()%></td>
  <td class=xl47><%= dt_total_edu.Rows[edu][3].ToString()%></td>
  <td class=xl47 x:str><%= dt_total_edu.Rows[edu][4].ToString()%></td>
  <td class=xl47><%= dt_total_edu.Rows[edu][5].ToString()%></td>
 </tr>
 <%}
    } %>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td colspan=6 height=27 class=xl75 style='border-right:.5pt solid black;
  height:20.25pt'>KINH NGHI&#7878;M (Experience)</td>
 </tr>
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl46 style='height:18.0pt'>Tên công<span
  style='mso-spacerun:yes'>  </span>ty</td>
  <td class=xl47>Th&#7901;i gian làm vi&#7879;c</td>
  <td class=xl47>Ch&#7913;c v&#7909;</td>
  <td class=xl47>Công vi&#7879;c chính</td>
  <td class=xl47 x:str="M&#7913;c l&#432;ong ">M&#7913;c l&#432;ong<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl47>Lý do ngh&#7881; vi&#7879;c</td>
 </tr>
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl56 style='height:18.0pt'>(The previous company's name)</td>
  <td class=xl49>(Working period)</td>
  <td class=xl49>(Position)</td>
  <td class=xl49>(Duties)</td>
  <td class=xl49>(Salary)</td>
  <td class=xl49>(Reasons)</td>
 </tr>
 <%
          
     //--------------------------Experience-----------------------
     string SQL_E;
     SQL_E = " select COM_NM, START_DT,POSITION, DUTIES, SALARY, REMARK ";
     SQL_E = SQL_E + " from thr_experience a ";
     SQL_E = SQL_E + " where del_if=0 and a.THR_EMPLOYEE_PK =" + dt_total.Rows[i][27].ToString() ;
     SQL_E = SQL_E + " order by a.start_dt ";
          
     DataTable dt_total_e = CtlLib.TableReadOpen(SQL_E);
     int irow_e;
     irow_e = dt_total_e.Rows.Count;
          
          
      if (irow_e > 0)
      {

          for (int j = 0; j < irow_e; j++)
          {
              if (j == irow_e - 1)
                  s_format = ";border-bottom:.5pt solid windowtext";
              else
                  s_format = ";";
              
          %>
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl50 style='height:18.0pt;border-top:none<%=s_format %>'><%= dt_total_e.Rows[j][0].ToString()%></td>
  <td class=xl50 style='border-top:none;border-left:none<%=s_format %>'><%= dt_total_e.Rows[j][1].ToString()%></td>
  <td class=xl50 style='border-top:none;border-left:none<%=s_format %>'><%= dt_total_e.Rows[j][2].ToString()%></td>
  <td class=xl50 style='border-top:none;border-left:none<%=s_format %>'><%= dt_total_e.Rows[j][3].ToString()%></td>
  <td class=xl51 align=right style='border-top:none;border-left:none<%=s_format %>'
  x:num><%= dt_total_e.Rows[j][4].ToString()%></td>
  <td class=xl51 style='border-top:none;border-left:none<%=s_format %>'><%= dt_total_e.Rows[j][5].ToString()%></td>
 </tr>
 <%
      }
  }
  else
  {
  %>
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl53 style='height:18.0pt;border-top:none'>&nbsp;</td>
  <td class=xl53 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl53 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl53 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl53 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl53 style='border-top:none;border-left:none'>&nbsp;</td>
 </tr>
 <%
      }
  %>
 
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=6 height=22 class=xl75 style='border-right:.5pt solid black;
  height:16.5pt'>GIA &#272;ÌNH (Family)</td>
 </tr>
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl46 style='height:18.0pt'>Tên</td>
  <td class=xl47>Quan h&#7879;</td>
  <td class=xl47>Ngày sinh</td>
  <td class=xl63 style='border-right:.5pt solid black;border-left:
  none'>Công việc</td>
  <td class=xl63 style='border-right:.5pt solid black;border-left:
  none'>Lương</td>
  <td class=xl63 style='border-right:.5pt solid black;border-left:
  none'>Ghi chú</td>
 </tr>
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl48 style='height:18.0pt'>(Name)</td>
  <td class=xl49>(Relationship)</td>
  <td class=xl49>(Birth Date)</td>
   <td class=xl65 style='border-right:.5pt solid black;border-left:
  none'>(Job)</td>
   <td class=xl65 style='border-right:.5pt solid black;border-left:
  none'>(Salary)</td>
  <td class=xl65 style='border-right:.5pt solid black;border-left:
  none'>(Remark)</td>
 </tr>
 <%
          
     //------------------------------Family --------------------------
     string SQL_F;
     SQL_F = " select  FULL_NAME , b.code_nm, decode(length(a.BIRTH_DT),8,to_char(to_date(a.Birth_dt,'yyyymmdd'),'dd/mm/yyyy'), a.birth_dt), a.job,a.salary,REMARK ";
     SQL_F = SQL_F + " from THR_FAMILY a,vhr_hr_code b ";
     SQL_F = SQL_F + " where del_if=0   ";
     SQL_F = SQL_F + " and a.relation = b.code ";
     SQL_F = SQL_F + " and b.id='HR0024' and thr_employee_pk =" + dt_total.Rows[i][27].ToString();
     SQL_F = SQL_F + " order by b.code ";
     DataTable dt_total_f = CtlLib.TableReadOpen(SQL_F);
     int irow_f;
     irow_f = dt_total_f.Rows.Count;
              
      if (irow_f > 0)
      {
          for (int j = 0; j < irow_f; j++)
          {
              if (j == irow_f - 1)
                  s_format = ";border-bottom:.5pt solid windowtext";
              else
                  s_format = ";";
     %>
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl50 style='height:18.0pt;border-top:none<%=s_format %>'><%= dt_total_f.Rows[j][0].ToString()%></td>
  <td class=xl50 style='border-top:none;border-left:none<%=s_format %>'><%= dt_total_f.Rows[j][1].ToString()%></td>
  <td class=xl54 style='border-top:none;border-left:none<%=s_format %>' x:str><%= dt_total_f.Rows[j][2].ToString()%></td>
  <td class=xl80 style='border-top:none;border-left:none<%=s_format %>'><%= dt_total_f.Rows[j][3].ToString()%></td>
  <td class=xl54 style='border-top:none;border-left:none;mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0"<%=s_format %>' x:num><%= dt_total_f.Rows[j][4].ToString()%></td>
  <td  class=xl80 style='border-left:none<%=s_format %>'><%= dt_total_f.Rows[j][5].ToString()%></td>
 </tr>
 <%
      }
  }
  else
  {
 %>
 
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl53 style='height:18.0pt;border-top:none'>&nbsp;</td>
  <td class=xl53 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl53 style='border-top:none;border-left:none'>&nbsp;</td>
  <td  class=xl74 style='border-left:none'>&nbsp;</td>
  <td  class=xl74 style='border-left:none'>&nbsp;</td>
  <td  class=xl74 style='border-left:none'>&nbsp;</td>
  
 </tr>
 <%
      }
     %>
  <%if (p_sal_security == "Y")
    { %>   
 <tr height=17 style='height:12.75pt'>
  <td colspan=6 height=17 class=xl75 style='border-right:.5pt solid black;
  height:12.75pt'>THĂNG CHỨC</td>
 </tr>    
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl48 style='height:18.0pt'>Ngày hiệu lực</td>
  <td class=xl49>Chức vụ củ</td>
  <td class=xl49>Chức vụ mới</td>
   <td class=xl65 style='border-right:.5pt solid black;border-left:none'>Lương/PC củ</td>
   <td class=xl65 style='border-right:.5pt solid black;border-left:none'>Lương/PC mới</td>
  <td class=xl65 style='border-right:.5pt solid black;border-left:none'>Ghi chú</td>
 </tr>
 <%
          
      //------------------------------thang chuc --------------------------

      string SQL_TC
     = "select to_char(to_date(s.work_mon,'yyyymm'),'mm/yyyy') as ngay_hluc " +
         ",s2.pos_nm as old_pos,s.pos_nm as new_pos " +
         ",nvl(s2.salary_level2,0)+nvl(S2.ALLOW_AMT1,0)+nvl(S2.ALLOW_AMT2,0)+nvl(S2.ALLOW_AMT3,0) " +
         "+nvl(S2.ALLOW_AMT4,0)+nvl(S2.ALLOW_AMT5,0)+nvl(S2.ALLOW_AMT6,0)+nvl(S2.ALLOW_AMT7,0)+nvl(S2.ALLOW_AMT8,0) luong_cu " +
         ",nvl(s.salary_level2,0)+nvl(s.ALLOW_AMT1,0)+nvl(s.ALLOW_AMT2,0)+nvl(s.ALLOW_AMT3,0) " +
         "+nvl(s.ALLOW_AMT4,0)+nvl(s.ALLOW_AMT5,0)+nvl(s.ALLOW_AMT6,0)+nvl(s.ALLOW_AMT7,0)+nvl(s.ALLOW_AMT8,0) luong_moi " +
         "    from thr_salary_manage s,thr_salary_manage s2,thr_employee e " +
         "    where s.del_if=0 and e.del_if=0 and s.thr_emp_pk=e.pk  " +
         "    and s2.del_if=0 and s.WORK_MON>=substr(e.JOIN_DT,1,6) " +
         "    and s2.thr_emp_pk=e.pk  " +
         "    and s2.work_mon=to_char(add_months(to_date(s.work_mon,'yyyymm'),-1),'yyyymm')  " +
         "    and nvl(s.pos_nm,' ')<>nvl(s2.pos_nm,' ') " +
         "    and s.thr_emp_pk='" + dt_total.Rows[i][27].ToString() + "'";



      DataTable dt_total_TC = CtlLib.TableReadOpen(SQL_TC);
      int irow_TC;
      irow_TC = dt_total_TC.Rows.Count;

      if (irow_TC > 0)
      {
          for (int TC = 0; TC < irow_TC; TC++)
          {
              if (TC == irow_TC - 1)
                  s_format = ";border-bottom:.5pt solid windowtext";
              else
                  s_format = ";";
     %>
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl50 style='height:18.0pt;border-top:none<%=s_format %>'><%= dt_total_TC.Rows[TC][0].ToString()%></td>
  <td class=xl50 style='border-top:none;border-left:none<%=s_format %>'><%= dt_total_TC.Rows[TC][1].ToString()%></td>
  <td class=xl54 style='border-top:none;border-left:none<%=s_format %>'><%= dt_total_TC.Rows[TC][2].ToString()%></td>
  <td class=xl80 style='border-top:none;border-left:none;mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0"<%=s_format %>' x:num><%= dt_total_TC.Rows[TC][3].ToString()%></td>
  <td class=xl54 style='border-top:none;border-left:none;mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0"<%=s_format %>' x:num><%= dt_total_TC.Rows[TC][4].ToString()%></td>
  <td  class=xl80 style='border-left:none<%=s_format %>'>&nbsp;</td>
 </tr>
 <%
      }
  }
  else
  {
 %>
 
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl53 style='height:18.0pt;border-top:none'>&nbsp;</td>
  <td class=xl53 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl53 style='border-top:none;border-left:none'>&nbsp;</td>
  <td  class=xl74 style='border-left:none'>&nbsp;</td>
  <td  class=xl74 style='border-left:none'>&nbsp;</td>
  <td  class=xl74 style='border-left:none'>&nbsp;</td>
  
 </tr>
 <%
      }
        
     %>
<tr height=17 style='height:12.75pt'>
  <td colspan=6 height=17 class=xl75 style='border-right:.5pt solid black;
  height:12.75pt'>ĐIỀU CHỈNH LƯƠNG</td>
 </tr>    
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl48 style='height:18.0pt'>Ngày hiệu lực</td>
  <td class=xl49>Mức lương củ</td>
  <td class=xl49>Mức lương mới</td>
   <td class=xl65 style='border-right:.5pt solid black;border-left:none'>Phụ cấp củ</td>
   <td class=xl65 style='border-right:.5pt solid black;border-left:none'>Phụ cấp mới</td>
  <td class=xl65 style='border-right:.5pt solid black;border-left:none'>Lý do</td>
 </tr>
 <%
          
      //------------------------------dieu chinh luong --------------------------

      string SQL_TL
     = "select to_char(to_date(s.work_mon,'yyyymm'),'mm/yyyy') as ngay_hluc " +
         ",nvl(s2.salary_level2,0) as old_SAL,nvl(s.salary_level2,0) as new_sal " +
         ",nvl(S2.ALLOW_AMT1,0)+nvl(S2.ALLOW_AMT2,0)+nvl(S2.ALLOW_AMT3,0) " +
         "+nvl(S2.ALLOW_AMT4,0)+nvl(S2.ALLOW_AMT5,0)+nvl(S2.ALLOW_AMT6,0)+nvl(S2.ALLOW_AMT7,0)+nvl(S2.ALLOW_AMT8,0) pc_cu " +
         ",nvl(s.ALLOW_AMT1,0)+nvl(s.ALLOW_AMT2,0)+nvl(s.ALLOW_AMT3,0) " +
         "+nvl(s.ALLOW_AMT4,0)+nvl(s.ALLOW_AMT5,0)+nvl(s.ALLOW_AMT6,0)+nvl(s.ALLOW_AMT7,0)+nvl(s.ALLOW_AMT8,0) pc_moi " +
         "    from thr_salary_manage s,thr_salary_manage s2,thr_employee e " +
         "    where s.del_if=0 and e.del_if=0 and s.thr_emp_pk=e.pk  " +
         "    and s2.del_if=0 and s.WORK_MON>=substr(e.JOIN_DT,1,6) " +
         "    and s2.thr_emp_pk=e.pk  " +
         "    and s2.work_mon=to_char(add_months(to_date(s.work_mon,'yyyymm'),-1),'yyyymm')  " +
         "    and nvl(s2.salary_level2,0)<>nvl(s.salary_level2,0) " +
         "    and s.thr_emp_pk='" + dt_total.Rows[i][27].ToString() + "'";



      DataTable dt_total_TL = CtlLib.TableReadOpen(SQL_TL);
      int irow_TL;
      irow_TL = dt_total_TL.Rows.Count;

      if (irow_TL > 0)
      {
          for (int TL = 0; TL < irow_TL; TL++)
          {
              if (TL == irow_TL - 1)
                  s_format = ";border-bottom:.5pt solid windowtext";
              else
                  s_format = ";";
     %>
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl50 style='height:18.0pt;border-top:none<%=s_format %>'><%= dt_total_TL.Rows[TL][0].ToString()%></td>
  <td class=xl50 style='border-top:none;border-left:none;mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0"<%=s_format %>' x:num><%= dt_total_TL.Rows[TL][1].ToString()%></td>
  <td class=xl54 style='border-top:none;border-left:none;mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0"<%=s_format %>' x:num><%= dt_total_TL.Rows[TL][2].ToString()%></td>
  <td class=xl80 style='border-top:none;border-left:none;mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0"<%=s_format %>' x:num><%= dt_total_TL.Rows[TL][3].ToString()%></td>
  <td class=xl54 style='border-top:none;border-left:none;mso-number-format:"\#\,\#\#0\;\[Red\]\#\,\#\#0"<%=s_format %>' x:num><%= dt_total_TL.Rows[TL][4].ToString()%></td>
  <td  class=xl80 style='border-left:none<%=s_format %>'>&nbsp;</td>
 </tr>
 <%
      }
  }
  else
  {
 %>
 
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl53 style='height:18.0pt;border-top:none'>&nbsp;</td>
  <td class=xl53 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl53 style='border-top:none;border-left:none'>&nbsp;</td>
  <td  class=xl74 style='border-left:none'>&nbsp;</td>
  <td  class=xl74 style='border-left:none'>&nbsp;</td>
  <td  class=xl74 style='border-left:none'>&nbsp;</td>
  
 </tr>
 <%
      }
  }//end p_sal_security      
     %>     
     
<tr height=17 style='height:12.75pt'>
  <td colspan=6 height=17 class=xl75 style='border-right:.5pt solid black;
  height:12.75pt'>THUYÊN CHUYỂN CÔNG TÁC</td>
 </tr>    
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl48 style='height:18.0pt'>Ngày hiệu lực</td>
  <td class=xl49>Bộ phận củ</td>
  <td class=xl49>Bộ phận mới</td>
   <td class=xl65 style='border-right:.5pt solid black;border-left:none'>Lý do</td>
   <td class=xl65 style='border-right:.5pt solid black;border-left:none'>Ghi chú</td>
  <td class=xl65 style='border-right:.5pt solid black;border-left:none'>&nbsp;</td>
 </tr>
 <%
          
     //------------------------------doi wgroup --------------------------

     string SQL_DCL
    = "select to_char(to_date(s.work_mon,'yyyymm'),'mm/yyyy') as ngay_hluc " +
        ",s2.dept_nm as old_dept,s.dept_nm as new_dept " +
        "    from thr_month_salary s,thr_month_salary s2,thr_employee e " +
        "    where s.del_if=0 and e.del_if=0 and s.thr_emp_pk=e.pk  " +
        "    and s2.del_if=0 and s.WORK_MON>=substr(e.JOIN_DT,1,6) " +
        "    and s2.thr_emp_pk=e.pk  " +
        "    and s2.work_mon=to_char(add_months(to_date(s.work_mon,'yyyymm'),-1),'yyyymm')  " +
        "    and nvl(s.dept_nm,' ')<>nvl(s2.dept_nm,' ') " +
        "    and s.thr_emp_pk='" + dt_total.Rows[i][27].ToString() + "'";


          
          
     DataTable dt_total_DCL = CtlLib.TableReadOpen(SQL_DCL);
     int irow_DCL;
     irow_DCL = dt_total_DCL.Rows.Count;
              
      if (irow_DCL > 0)
      {
          for (int DCL = 0; DCL < irow_DCL; DCL++)
          {
              if (DCL == irow_DCL - 1)
                  s_format = ";border-bottom:.5pt solid windowtext";
              else
                  s_format = ";";
     %>
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl50 style='height:18.0pt;border-top:none<%=s_format %>'><%= dt_total_DCL.Rows[DCL][0].ToString()%></td>
  <td class=xl50 style='border-top:none;border-left:none"<%=s_format %>'><%= dt_total_DCL.Rows[DCL][1].ToString()%></td>
  <td class=xl54 style='border-top:none;border-left:none"<%=s_format %>'><%= dt_total_DCL.Rows[DCL][2].ToString()%></td>
  <td class=xl80 style='border-left:none<%=s_format %>'>&nbsp;</td>
  <td class=xl54 style='border-left:none<%=s_format %>'>&nbsp;</td>
  <td  class=xl80 style='border-left:none<%=s_format %>'>&nbsp;</td>
 </tr>
 <%
      }
  }
  else
  {
 %>
 
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl53 style='height:18.0pt;border-top:none'>&nbsp;</td>
  <td class=xl53 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl53 style='border-top:none;border-left:none'>&nbsp;</td>
  <td  class=xl74 style='border-left:none'>&nbsp;</td>
  <td  class=xl74 style='border-left:none'>&nbsp;</td>
  <td  class=xl74 style='border-left:none'>&nbsp;</td>
  
 </tr>
 <%
      }
     %>     

 <tr height=17 style='height:12.75pt'>
  <td colspan=6 height=17 class=xl75 style='border-right:.5pt solid black;
  height:12.75pt'>KỶ LUẬT</td>
 </tr>    
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl48 style='height:18.0pt'>Nội dung</td>
  <td class=xl49>Ngày tháng</td>
  <td class=xl49>Hình thức kỷ luật</td>
   <td class=xl65 style='border-right:.5pt solid black;border-left:none'>Thời hạn(days)</td>
   <td class=xl65 style='border-right:.5pt solid black;border-left:none'>Từ ngày</td>
  <td class=xl65 style='border-right:.5pt solid black;border-left:none'>Đến ngày</td>
 </tr>
 <%
          
     //------------------------------ky luat --------------------------

     string SQL_KL
    = "SELECT A.REASON,to_char(to_date(A.DIS_DT,'yyyymmdd'),'dd/mm/yyyy') " +
        ",v.code_nm,A.VALID_PERIOD,to_char(to_date(A.start_dt,'yyyymmdd'),'dd/mm/yyyy'),to_char(to_date(A.end_dt,'yyyymmdd'),'dd/mm/yyyy') " +
        "FROM THR_DISCIPLINE A,VHR_HR_CODE V " +
        "WHERE A.DEL_IF=0 AND A.DIS_LEVEL=V.CODE " +
        "AND V.ID='HR0025'  "+
        "    and A.thr_emp_pk='" + dt_total.Rows[i][27].ToString() + "'" +
        "order by A.DIS_DT ";



          
          
     DataTable dt_total_KL = CtlLib.TableReadOpen(SQL_KL);
     int irow_KL;
     irow_KL = dt_total_KL.Rows.Count;
              
      if (irow_KL > 0)
      {
          for (int KL = 0; KL < irow_KL; KL++)
          {
              if (KL == irow_KL - 1)
                  s_format = ";border-bottom:.5pt solid windowtext";
              else
                  s_format = ";";
     %>
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl50 style='height:18.0pt;border-top:none<%=s_format %>'><%= dt_total_KL.Rows[KL][0].ToString()%></td>
  <td class=xl50 style='border-left:none<%=s_format %>'><%= dt_total_KL.Rows[KL][1].ToString()%></td>
  <td class=xl54 style='border-left:none<%=s_format %>'><%= dt_total_KL.Rows[KL][2].ToString()%></td>
  <td class=xl80 style='border-left:none<%=s_format %>'><%= dt_total_KL.Rows[KL][3].ToString()%></td>
  <td class=xl54 style='border-left:none<%=s_format %>'><%= dt_total_KL.Rows[KL][4].ToString()%></td>
  <td  class=xl80 style='border-left:none<%=s_format %>'><%= dt_total_KL.Rows[KL][5].ToString()%></td>
 </tr>
 <%
      }
  }
  else
  {
 %>
 
 <tr class=xl29 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl53 style='height:18.0pt;border-top:none'>&nbsp;</td>
  <td class=xl53 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl53 style='border-top:none;border-left:none'>&nbsp;</td>
  <td  class=xl74 style='border-left:none'>&nbsp;</td>
  <td  class=xl74 style='border-left:none'>&nbsp;</td>
  <td  class=xl74 style='border-left:none'>&nbsp;</td>
  
 </tr>
 <%
      }
     %> 
    
     
 <tr height=17 style='height:12.75pt'>
  <td colspan=6 height=17 class=xl75 style='border-right:.5pt solid black;
  height:12.75pt'>GHI CHÚ (Note)</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl46 style='height:15.0pt'>Ghi chú 1</td>
  <td class=xl46 style='border-left:none'>Ghi chú 2</td>
  <td class=xl46 style='border-left:none'>Ghi chú 3</td>
  <td class=xl46 style='border-left:none'>Ghi chú 4</td>
  <td colspan=2 class=xl63 style='border-right:.5pt solid black;border-left:
  none'>Ghi chú 5</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl48 style='height:15.0pt'>(Note 1)</td>
  <td class=xl48 style='border-left:none'>(Note 2)</td>
  <td class=xl48 style='border-left:none'>(Note 3)</td>
  <td class=xl48 style='border-left:none'>(Note 4)</td>
  <td colspan=2 class=xl65 style='border-right:.5pt solid black;border-left:
  none'>(Note 5)</td>
 </tr>
 <%
     //Note 
     string SQL_N;
     SQL_N = " select a.NOTE_1,a.note_2,a.note_3,a.note_4,a.note_5 ";
     SQL_N = SQL_N + " from thr_expand a ";
     SQL_N = SQL_N + " where del_if=0 and thr_employee_pk =" + dt_total.Rows[i][27].ToString();
     SQL_N = SQL_N + " order by a.thr_employee_pk,note_1 ";
     DataTable dt_total_n = CtlLib.TableReadOpen(SQL_N);
     int irow_n;
     irow_n = dt_total_n.Rows.Count;
     
              
      if (irow_n > 0)
      {

          for (int j = 0; j < irow_n; j++)
          {
              if (j == irow_n - 1)
                  s_format = ";border-bottom:.5pt solid windowtext";
              else
                  s_format = ";";
      %>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl57 style='height:15.0pt;border-top:none<%=s_format %>'><%= dt_total_n.Rows[j][0].ToString()%></td>
  <td class=xl57 style='border-top:none;border-left:none<%=s_format %>'><%= dt_total_n.Rows[j][1].ToString()%></td>
  <td class=xl58 style='border-top:none;border-left:none<%=s_format %>' x:num><%= dt_total_n.Rows[j][2].ToString()%></td>
  <td class=xl58 style='border-top:none;border-left:none<%=s_format %>'><%= dt_total_n.Rows[j][3].ToString()%></td>
  <td colspan=2 class=xl67 style='border-right:.5pt solid black;border-left:
  none<%=s_format %>'><%= dt_total_n.Rows[j][4].ToString()%></td>
 </tr>
 <%     }
    }
    else
    {
  %>
 <tr height=20 style='height:15.0pt'>
  <td colspan=7>&nbsp;</td>
 </tr>
 <%
      }
  %>
  <tr height=20 style='height:15.0pt'>
    <td colspan=7>&nbsp;</td>
 </tr>
  <%        
  }%><!-- end of main row-->
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=158 style='width:119pt'></td>
  <td width=112 style='width:84pt'></td>
  <td width=118 style='width:89pt'></td>
  <td width=110 style='width:83pt'></td>
  <td width=120 style='width:90pt'></td>
  <td width=106 style='width:80pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
