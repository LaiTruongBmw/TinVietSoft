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
    string l_tco_org, p_month, l_work_group, p_input, p_include, p_nation;
     
    l_tco_org       = Request["l_tco_org"].ToString();
    l_work_group  = Request["l_work_group"].ToString();
    p_input = Request["l_temp"].ToString();
	p_include = Request["p_include"].ToString();
	p_nation = Request["p_nation"].ToString();
            
    p_month  = Request["l_rpt_month"].ToString();
  string  l_temp= Request["l_temp"].ToString();
string SQL
    = "select a.NATION " + 
        ",decode(a.EMPLOYEE_TYPE,'01','OFFICE','FACTORY') as c1 " +
        ",a.FULL_NAME as c2 " +
        ",decode(a.Nation, '01', nvl(ins.luong_cb,0),nvl(b.ins_salary,0))  as c3  " +
        "   ,ins.LUONG_BHXH*nvl(ins.social_rate,0)/100 as c4 " +
        "   ,ins.LUONG_BHYT*nvl(health_rate,0)/100 as c5 " +
        "   ,ins.LUONG_BHTN * nvl(unemp_rate,0)/100 as c6 " +
        "   ,ins.LUONG_BHXH*nvl(social_com_rate,0)/100 as c7 " +
        "   ,ins.LUONG_BHYT*nvl(ins.health_com_rate,0)/100 as c8 " +
        "   ,ins.LUONG_BHTN * nvl(unemp_com_rate,0)/100  as c9 " +
        "   ,nvl(ins.LUONG_BHXH,0)*(nvl(ins.social_rate,0)+nvl(ins.social_com_rate,0))/100 as c10 " +
        "   ,nvl(ins.LUONG_BHYT,0)*(nvl(ins.health_com_rate,0) +nvl(ins.health_rate,0) )/100 as c11 " +
        "   ,nvl(ins.LUONG_BHTN,0) * (nvl(unemp_rate,0)+nvl(unemp_com_rate,0))/100 as c12 " +
        "   ,nvl(ins.LUONG_BHXH,0)*(nvl(ins.social_rate,0)+nvl(ins.social_com_rate,0))/100   " +
        "   + nvl(ins.LUONG_BHYT,0)*(nvl(ins.health_com_rate,0) +nvl(ins.health_rate,0) )/100  " +
        "   + nvl(ins.LUONG_BHTN,0) * (nvl(unemp_rate,0)+nvl(unemp_com_rate,0))/100 as c13, a.emp_id  " +
        "   from  THR_EMPLOYEE A,thr_insurance_month ins,tco_org g1, thr_salary_manage b  " +
        "   where ins.DEL_IF =0 and  a.DEL_IF =0 and g1.del_if=0 and b.del_if(+)=0 " +
        "   and ins.THR_EMP_PK = b.THR_EMP_PK(+) and ins.WORK_MON = b.WORK_MON(+) " +
        "   and ins.WORK_MON = '"+p_month+"'  " +
        "   and ins.THR_EMP_PK = a.pk " +
        "   and a.tco_org_pk =g1.pk       " +
        "   and ((('" + p_include + "' ='2') and (nvl(xh_yn,'N')='Y' or nvl (tn_yn,'N')='Y' or nvl (yt_yn,'N')='Y' " +
        "         OR (NVL(XH_YN,'N')='N' AND NVL(YT_YN,'N')='N' AND NVL(TN_YN,'N')='N' AND NVL(HEALTH_RATE,0)>0) " +
        "       )) " +
        "       or " +
        "       (('" + p_include + "'='1') and (nvl(xh_yn,'N')='Y' or nvl (tn_yn,'N')='Y' or nvl (yt_yn,'N')='Y'))) " +
        "   and decode('" + p_nation + "', 'ALL','ALL', a.nation) = '" + p_nation + "' " +
        "   and decode('"+l_work_group+"','ALL','ALL',A.THR_WG_PK)='"+l_work_group+"' " +
        "   and  (  a.tco_org_pk IN (SELECT  g.pk " +
        "                             FROM tco_org g " +
        "                              START WITH g.pk =DECODE ('"+l_tco_org+"','ALL', 0,'"+l_tco_org+"') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+l_tco_org+"' = 'ALL') " +
        "              AND ('" + p_input + "' IS NULL  " +
        "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
        "   order by  a.EMPLOYEE_TYPE, a.NATION desc " ;

		
    DataTable dt_Emp = CtlLib.TableReadOpen(SQL);
	int irow_emp = dt_Emp.Rows.Count ;
	int icol_emp = dt_Emp.Columns.Count ;
    if(dt_Emp.Rows.Count==0)
    {
        Response.Write("There is no data to show");
        Response.End();
    }
    
    string SQL_Day
    = "select  to_char(to_date('" + p_month + "','YYYYMM'),'MON-YYYY')  " + 
        "from dual " ;
        
    DataTable dt_Day = CtlLib.TableReadOpen(SQL_Day);
    
    DateTime dt = new DateTime(int.Parse(p_month.Substring(0,4)),int.Parse(p_month.Substring(4,2)),1);
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_paid_social_ins_vhpc_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_paid_social_ins_vhpc_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_paid_social_ins_vhpc_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>admin</o:Author>
  <o:LastAuthor>welcome</o:LastAuthor>
  <o:LastPrinted>2011-04-13T02:25:49Z</o:LastPrinted>
  <o:Created>2007-09-12T06:11:29Z</o:Created>
  <o:LastSaved>2011-04-13T02:26:14Z</o:LastSaved>
  <o:Company>Hewlett-Packard Company</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:0in 0in .14in .14in;
	mso-header-margin:.15in;
	mso-footer-margin:.14in;
	mso-page-orientation:landscape;
	mso-horizontal-page-align:center;}
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style50
	{mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	mso-style-name:Comma;
	mso-style-id:3;}
.style52
	{mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	mso-style-name:"Comma 2";}
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
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal;
	mso-style-id:0;}
.style70
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:"Normal_Payment form";}
td
	{mso-style-parent:style0;
	padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:VNI-Times;
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
.xl91
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl92
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl93
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl94
	{mso-style-parent:style52;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";}
.xl95
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl96
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl97
	{mso-style-parent:style0;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:center;
	vertical-align:middle;}
.xl98
	{mso-style-parent:style0;
	font-weight:700;
	font-style:italic;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl99
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl100
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl101
	{mso-style-parent:style0;
	font-weight:700;
	font-style:italic;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl102
	{mso-style-parent:style0;
	font-style:italic;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl103
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";}
.xl104
	{mso-style-parent:style0;
	font-weight:700;
	font-style:italic;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl105
	{mso-style-parent:style52;
	font-style:italic;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\(\#\,\#\#0\0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";}
.xl106
	{mso-style-parent:style52;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\(\#\,\#\#0\0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";}
.xl107
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";}
.xl108
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";}
.xl109
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl110
	{mso-style-parent:style52;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\(\#\,\#\#0\0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl111
	{mso-style-parent:style52;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\(\#\,\#\#0\0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:left;
	background:white;
	mso-pattern:auto none;}
.xl112
	{mso-style-parent:style0;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:center;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl113
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl114
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl115
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\(\#\,\#\#0\0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl116
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl117
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl118
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl119
	{mso-style-parent:style0;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0_\)\;\[Red\]\\\(\#\,\#\#0\\\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:white;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl120
	{mso-style-parent:style52;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\(\#\,\#\#0\0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl121
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl122
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";}
.xl123
	{mso-style-parent:style52;
	font-style:italic;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\(\#\,\#\#0\0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;}
.xl124
	{mso-style-parent:style52;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\(\#\,\#\#0\0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;}
.xl125
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl126
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl127
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl128
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl129
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl130
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl131
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl132
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl133
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl134
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl135
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;}
.xl136
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl137
	{mso-style-parent:style52;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\(\#\,\#\#0\0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";}
.xl138
	{mso-style-parent:style52;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\(\#\,\#\#0\0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl139
	{mso-style-parent:style52;
	font-weight:700;
	font-style:italic;
	text-decoration:underline;
	text-underline-style:single-accounting;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\(\#\,\#\#0\0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;}
.xl140
	{mso-style-parent:style0;
	font-weight:700;
	font-style:italic;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl141
	{mso-style-parent:style52;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\(\#\,\#\#0\0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;}
.xl142
	{mso-style-parent:style70;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;}
.xl143
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl144
	{mso-style-parent:style0;
	color:black;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl145
	{mso-style-parent:style50;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";}
.xl146
	{mso-style-parent:style50;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";}
.xl147
	{mso-style-parent:style52;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"0_\)\;\\\(0\\\)";
	text-align:left;
	vertical-align:justify;}
.xl148
	{mso-style-parent:style0;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\(\#\,\#\#0\0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";}
.xl149
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	background:white;
	mso-pattern:auto none;}
.xl150
	{mso-style-parent:style52;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border:.5pt solid windowtext;}
.xl151
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl152
	{mso-style-parent:style0;
	font-size:15.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl153
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl154
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl155
	{mso-style-parent:style52;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\(\#\,\#\#0\0022\\\0022\0022\\\0022\0022\\\0022\0022\\\0022\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl156
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl157
	{mso-style-parent:style52;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl158
	{mso-style-parent:style52;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl159
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl160
	{mso-style-parent:style52;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl161
	{mso-style-parent:style52;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl162
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl163
	{mso-style-parent:style52;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl164
	{mso-style-parent:style52;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl165
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl166
	{mso-style-parent:style52;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl167
	{mso-style-parent:style52;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl168
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>paid social Insurance</x:Name>
    <x:WorksheetOptions>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>76</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>1</x:ActiveRow>
       <x:RangeSelection>$A$2:$O$2</x:RangeSelection>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>11640</x:WindowHeight>
  <x:WindowWidth>15480</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>135</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:SupBook>
  <x:Path>\\Mr. loc\sharing\tridung\tender\Beaute garment\Autocadfile\Project\Mekong Flour Mill\CD WRITE\Boq\MEKONG_FLOURMILL(3rd-submission-netcost).xls</x:Path>
  <x:SheetName>breakdown</x:SheetName>
  <x:SheetName>Sheet2</x:SheetName>
  <x:SheetName>Sheet3</x:SheetName>
  <x:SheetName>XL4Poppy</x:SheetName>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>0</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>1</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>2</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>3</x:SheetIndex>
  </x:Xct>
 </x:SupBook>
 <x:ExcelName>
  <x:Name>_Fill</x:Name>
  <x:Hidden/>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>ádf</x:Name>
  <x:Formula>='\\Mr. loc\sharing\tridung\tender\Beaute garment\Autocadfile\Project\Mekong Flour Mill\CD WRITE\Boq\[MEKONG_FLOURMILL(3rd-submission-netcost).xls]breakdown'!#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>grand_total</x:Name>
  <x:Formula>='\\Mr. loc\sharing\tridung\tender\Beaute garment\Autocadfile\Project\Mekong Flour Mill\CD WRITE\Boq\[MEKONG_FLOURMILL(3rd-submission-netcost).xls]breakdown'!#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NGHIEU4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NGKHANH</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NGLONG5</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NGLUU4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NGMINH4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NGNGHIEM4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NGPHU</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NGQUAN4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NGSON4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NGTHANH4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NGTRI</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NGTUAN4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NHIEU4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NKHANH</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NLONG5</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NLUU4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NMINH4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NNGHIEM4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NNHIEU4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NNKHANH</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NNLUU4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NNMINH4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NNNGHIEM4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NNPHU</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NNQUAN4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NNSON4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NNTHANH4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NNTRI</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NNTUAN4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NPHU</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NQUAN4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NSON4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NTHANH4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NTRI</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>NTUAN4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>PHIEU4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>PKHANH</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>PLONG4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>PLUU4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>PMINH4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>PNGHIEM4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>PPHU</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>PQUAN4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>='paid social Insurance'!$5:$6</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>PSON4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>PTHANH4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>PTRI</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>PTUAN4</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="3073"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="2"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl91>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1419 style='border-collapse:
 collapse;table-layout:fixed;width:1066pt'>
 <col class=xl100 width=26 style='mso-width-source:userset;mso-width-alt:950;
 width:20pt'>
 <col class=xl91 width=101 style='mso-width-source:userset;
 mso-width-alt:3693;width:76pt'>
 <col class=xl91 width=194 style='mso-width-source:userset;mso-width-alt:7094;
 width:146pt'>
 <col class=xl106 width=101 style='mso-width-source:userset;mso-width-alt:3693;
 width:76pt'>
 <col class=xl106 width=86 span=2 style='mso-width-source:userset;mso-width-alt:
 3145;width:65pt'>
 <col class=xl106 width=104 style='mso-width-source:userset;mso-width-alt:3803;
 width:78pt'>
 <col class=xl106 width=98 style='mso-width-source:userset;mso-width-alt:3584;
 width:74pt'>
 <col class=xl106 width=79 style='mso-width-source:userset;mso-width-alt:2889;
 width:59pt'>
 <col class=xl106 width=104 style='mso-width-source:userset;mso-width-alt:3803;
 width:78pt'>
 <col class=xl91 width=96 style='mso-width-source:userset;mso-width-alt:3510;
 width:72pt'>
 <col class=xl91 width=79 style='mso-width-source:userset;mso-width-alt:2889;
 width:59pt'>
 <col class=xl91 width=112 style='mso-width-source:userset;mso-width-alt:4096;
 width:84pt'>
 <col class=xl92 width=87 style='mso-width-source:userset;mso-width-alt:3181;
 width:65pt'>
 <col class=xl99 width=99 style='mso-width-source:userset;mso-width-alt:3620;
 width:74pt'>
 <col class=xl91 width=68 style='mso-width-source:userset;mso-width-alt:2486;
 width:51pt'>
 <tr height=17 style='height:12.75pt'>
  <td height=17 width=26 style='height:12.75pt;width:20pt' align=left
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
  </v:shapetype><v:shape id="Picture_x0020_1" o:spid="_x0000_s2050" type="#_x0000_t75"
   style='position:absolute;margin-left:0;margin-top:0;width:153.75pt;height:43.5pt;
   z-index:1;visibility:visible'>
   <v:imagedata src="rpt_paid_social_ins_vhpc_files/image001.png" o:title=""/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:0px;margin-top:0px;width:205px;
  height:58px'><img width=205 height=58
  src="rpt_paid_social_ins_vhpc_files/image002.jpg" v:shapes="Picture_x0020_1"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=17 class=xl123 width=26 style='height:12.75pt;width:20pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl123 width=0></td>
  <td class=xl123 width=194 style='width:146pt'></td>
  <td class=xl106 width=101 style='width:76pt'></td>
  <td class=xl124 width=86 style='width:65pt'></td>
  <td class=xl124 width=86 style='width:65pt'></td>
  <td class=xl124 width=104 style='width:78pt'></td>
  <td class=xl106 width=98 style='width:74pt'></td>
  <td class=xl106 width=79 style='width:59pt'></td>
  <td class=xl106 width=104 style='width:78pt'></td>
  <td class=xl91 width=96 style='width:72pt'></td>
  <td class=xl91 width=79 style='width:59pt'></td>
  <td class=xl91 width=112 style='width:84pt'></td>
  <td class=xl92 width=87 style='width:65pt'></td>
  <td class=xl99 width=99 style='width:74pt'></td>
  <td class=xl91 width=68 style='width:51pt'></td>
 </tr>
 <tr height=48 style='mso-height-source:userset;height:36.0pt'>
  <td colspan=15 height=48 class=xl152 style='height:36.0pt'>SOCIAL INSURANCE,
  HEALTH INSURANCE &amp; UNEMPLOYMENT INSURANCE IN <%= dt_Day.Rows[0][0].ToString() %></td>
  <td class=xl91></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=15 height=17 class=xl93 style='height:12.75pt'></td>
  <td class=xl91></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=4 class=xl93 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=9 class=xl91 style='mso-ignore:colspan'></td>
  <td class=xl92></td>
  <td class=xl99></td>
  <td class=xl91></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td rowspan=2 height=60 class=xl153 width=26 style='height:45.0pt;width:20pt'>No</td>
  <td rowspan=2 class=xl154 >Employee ID</td>
  <td rowspan=2 class=xl154>Full Name</td>
  <td rowspan=2 class=xl155 x:str="Insurance Salary"><span
  style='mso-spacerun:yes'> </span>Insurance Salary<span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=3 class=xl110 width=276 style='border-left:none;width:208pt'
  x:str="Paid by Employee"><span style='mso-spacerun:yes'> </span>Paid by
  Employee<span style='mso-spacerun:yes'> </span></td>
  <td colspan=3 class=xl110 width=281 style='border-left:none;width:211pt'
  x:str="Paid by Company"><span style='mso-spacerun:yes'> </span>Paid by
  Company<span style='mso-spacerun:yes'> </span></td>
  <td colspan=3 class=xl153 width=287 style='border-left:none;width:215pt'>Subtotal</td>
  <td rowspan=2 class=xl153 width=87 style='width:65pt'>Sub-total pay in Mar -
  2011</td>
  <td rowspan=2 class=xl156>Remarks</td>
  <td class=xl91></td>
 </tr>
 <tr class=xl96 height=37 style='mso-height-source:userset;height:27.75pt'>
  <td class=xl110 width=86 style='border-top:none;border-left:none;width:65pt'
  x:str><span style='mso-spacerun:yes'> </span>8%<br>
    Social Ins.<span style='mso-spacerun:yes'> </span></td>
  <td class=xl110 width=86 style='border-top:none;border-left:none;width:65pt'
  x:str><span
  style='mso-spacerun:yes'> </span>1.5%<br>
    Health Ins.<span style='mso-spacerun:yes'> </span></td>
  <td class=xl110 width=104 style='border-top:none;border-left:none;width:78pt'
  x:str="1%&#10;Unemployment"><span style='mso-spacerun:yes'> </span>1%<br>
    Unemployment<span style='mso-spacerun:yes'> </span></td>
  <td class=xl110 width=98 style='border-top:none;border-left:none;width:74pt'
  x:str><span style='mso-spacerun:yes'> </span>18%<br>
    Social Ins.<span style='mso-spacerun:yes'> </span></td>
  <td class=xl110 width=79 style='border-top:none;border-left:none;width:59pt'
  x:str><span style='mso-spacerun:yes'> </span>3%<br>
    Health Ins.<span style='mso-spacerun:yes'> </span></td>
  <td class=xl110 width=104 style='border-top:none;border-left:none;width:78pt'
  x:str="1%&#10;Unemployment"><span style='mso-spacerun:yes'> </span>1%<br>
    Unemployment<span style='mso-spacerun:yes'> </span></td>
  <td class=xl110 width=96 style='border-top:none;border-left:none;width:72pt'
  x:str><span style='mso-spacerun:yes'> </span>26%<br>
    Social Ins.<span style='mso-spacerun:yes'> </span></td>
  <td class=xl110 width=79 style='border-top:none;border-left:none;width:59pt'
  x:str="4.5%&#10;Health Ins."><span
  style='mso-spacerun:yes'> </span>4.5%<br>
    Health Ins.<span style='mso-spacerun:yes'> </span></td>
  <td class=xl110 width=112 style='border-top:none;border-left:none;width:84pt'
  x:str="2%&#10;Unemployment"><span style='mso-spacerun:yes'> </span>2%<br>
    Unemployment<span style='mso-spacerun:yes'> </span></td>
  <td class=xl96></td>
 </tr>
 <%
    int i = 0;
    int count = 1;
    Boolean flag = true;
    Boolean flag_total = false;
    string emp_type_old, emp_type_new;
    double[] total = new double[11];
    double[] gtotal = new double[11];
    for (int k = 0; k < 11; k++)
    {
        total[k] = 0;
        gtotal[k] = 0;
    }  
    for (i = 0; i < irow_emp; i++)
    {
        emp_type_old = dt_Emp.Rows[i][1].ToString();

        for (int j = 3; j < icol_emp-1; j++)
        { 
            total[j-3] += Double.Parse(dt_Emp.Rows[i][j].ToString());
            gtotal[j-3] += Double.Parse(dt_Emp.Rows[i][j].ToString());
        }
        if (flag)
        {
  %>
 <tr class=xl97 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl120 colspan=15 style='height:15.0pt;border-top:none' x:str><span
  style='mso-spacerun:yes'> </span><%= dt_Emp.Rows[i][1].ToString()%><span
  style='mso-spacerun:yes'> </span></td>
  
 </tr>
 <%	
		flag = false;
		}
 %>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl131 style='height:19.5pt;border-top:none' x:num><%= count %></td>
  <td class=xl132 style='border-left:none'><%= dt_Emp.Rows[i]["emp_id"].ToString()%></td>
  <td class=xl133 style='border-left:none'><%= dt_Emp.Rows[i][2].ToString()%></td>
  <td class=xl163 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%= dt_Emp.Rows[i][3].ToString()%> </td>
 <td class=xl163 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%= dt_Emp.Rows[i][4].ToString()%> </td>
  <td class=xl163 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%= dt_Emp.Rows[i][5].ToString()%> </td>
  <td class=xl164 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>            </span><%= dt_Emp.Rows[i][6].ToString()%> </td>
  <td class=xl164 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>        </span><%= dt_Emp.Rows[i][7].ToString()%> </td>
  <td class=xl163 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>      </span><%= dt_Emp.Rows[i][8].ToString()%> </td>
  <td class=xl164 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>            </span><%= dt_Emp.Rows[i][9].ToString()%> </td>
  <td class=xl165 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%= dt_Emp.Rows[i][10].ToString()%> </td>
  <td class=xl165 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>      </span><%= dt_Emp.Rows[i][11].ToString()%> </td>
  <td class=xl165 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>              </span><%= dt_Emp.Rows[i][12].ToString()%> </td>
  <td class=xl165 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>     </span><%= dt_Emp.Rows[i][13].ToString()%> </td>
  <td class=xl115 style='border-left:none'>&nbsp;</td>
  <td class=xl97></td>
 </tr>
 <%
     
    if (i < irow_emp - 1)
    {
        count = count + 1;
        emp_type_new = dt_Emp.Rows[i + 1][1].ToString();
        if (emp_type_new != emp_type_old)
        {
            flag = true;
            flag_total = true;
        }
    }
    else
    {
        flag = true;
        flag_total = true;
    }
    if (flag_total)
    {
  %>
 
 
 <tr class=xl91 height=8 style='mso-height-source:userset;height:6.0pt'>
  <td height=8 class=xl143 style='height:6.0pt'>&nbsp;</td>
  <td class=xl129 style='border-left:none'>&nbsp;</td>
  <td class=xl144 style='border-left:none'>&nbsp;</td>
  <td class=xl166 style='border-left:none'>&nbsp;</td>
  <td class=xl166 style='border-left:none'>&nbsp;</td>
  <td class=xl167 style='border-left:none'>&nbsp;</td>
  <td class=xl166 style='border-left:none'>&nbsp;</td>
  <td class=xl166 style='border-left:none'>&nbsp;</td>
  <td class=xl167 style='border-left:none'>&nbsp;</td>
  <td class=xl166 style='border-left:none'>&nbsp;</td>
  <td class=xl168 style='border-left:none'>&nbsp;</td>
  <td class=xl168 style='border-left:none'>&nbsp;</td>
  <td class=xl168 style='border-left:none'>&nbsp;</td>
  <td class=xl168 style='border-left:none'>&nbsp;</td>
  <td class=xl116 style='border-left:none'>&nbsp;</td>
  <td class=xl97></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl134 style='height:19.5pt'>&nbsp;</td>
  <td class=xl135 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl136 style='border-left:none'>TOTAL</td>
  <td class=xl150 style='border-left:none' x:num
  ><span style='mso-spacerun:yes'>       </span><%= total[0]%>
  </td>
  <td class=xl150 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%= total[1]%> </td>
  <td class=xl150 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%= total[2]%> </td>
  <td class=xl150 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>            </span><%= total[3]%> </td>
  <td class=xl150 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>        </span><%= total[4]%> </td>
  <td class=xl150 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>      </span><%= total[5]%> </td>
  <td class=xl150 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>            </span><%= total[6]%> </td>
  <td class=xl150 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%= total[7]%> </td>
  <td class=xl150 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>   </span><%= total[8]%> </td>
  <td class=xl150 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>              </span><%= total[9]%> </td>
  <td class=xl150 style='border-left:none' x:num><span
  style='mso-spacerun:yes'>     </span><%= total[10]%> </td>
  <td class=xl121 style='border-left:none'>&nbsp;</td>
  <td class=xl97></td>
 </tr>
 <%
     
     for (int k = 0; k < 11; k++)
         total[k] = 0;     
    flag_total = false;
	}
 }	// end for
 %>
 <tr class=xl92 height=27 style='mso-height-source:userset;height:20.25pt'>
  <td colspan=3 height=27 class=xl109 style='height:20.25pt'>SUB-TOTAL</td>
  <td class=xl150 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%= gtotal[0] %> </td>
  <td class=xl150 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%= gtotal[1] %> </td>
  <td class=xl150 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%= gtotal[2] %> </td>
  <td class=xl150 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>            </span><%= gtotal[3] %> </td>
  <td class=xl150 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>        </span><%= gtotal[4] %> </td>
  <td class=xl150 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>      </span><%= gtotal[5] %> </td>
  <td class=xl150 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>            </span><%= gtotal[6] %> </td>
  <td class=xl150 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>       </span><%= gtotal[7] %> </td>
  <td class=xl150 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>      </span><%= gtotal[8] %> </td>
  <td class=xl150 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>              </span><%= gtotal[9] %> </td>
  <td class=xl150 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'>     </span><%= gtotal[10] %> </td>
  <td class=xl114 style='border-left:none'>&nbsp;</td>
  <td class=xl92></td>
 </tr>
 <tr class=xl92 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=13 height=29 class=xl109 style='height:21.75pt'
  x:str="COMPANY KEEPS 2% SI FUNDING ">COMPANY KEEPS 2% SI FUNDING<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl151 style='border-top:none;border-left:none' x:num><span style='mso-spacerun:yes'>        </span><%= gtotal[9] %> </td>
  <td class=xl114 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl92></td>
 </tr>
 <tr class=xl92 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=13 height=24 class=xl109 style='height:18.0pt'>SUBMIT</td>
  <td class=xl151 style='border-top:none;border-left:none' x:num><span style='mso-spacerun:yes'>     </span><%= gtotal[10] - gtotal[9] %> </td>
  <td class=xl118 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl92></td>
 </tr>
 <tr class=xl92 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=13 class=xl93 style='height:18.0pt;mso-ignore:colspan'></td>
  <td class=xl149>&nbsp;</td>
  <td class=xl95></td>
  <td class=xl92></td>
 </tr>
 <tr class=xl92 height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 colspan=13 class=xl93 style='height:18.0pt;mso-ignore:colspan'></td>
  <td class=xl149>&nbsp;</td>
  <td class=xl95></td>
  <td class=xl92></td>
 </tr>
 
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl100 style='height:12.75pt'></td>
  <td class=xl91></td>
  <td class=xl91></td>
  <td colspan=2 class=xl147 style='mso-ignore:colspan'></td>
  <td colspan=6 class=xl106 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl91 style='mso-ignore:colspan'></td>
  <td class=xl92></td>
  <td class=xl99></td>
  <td class=xl91></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl100 style='height:12.75pt'></td>
  <td class=xl91></td>
  <td class=xl91></td>
  <td colspan=2 class=xl147 style='mso-ignore:colspan'></td>
  <td colspan=6 class=xl106 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl91 style='mso-ignore:colspan'></td>
  <td class=xl92></td>
  <td class=xl99></td>
  <td class=xl91></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl100 style='height:12.75pt'></td>
  <td class=xl91></td>
  <td class=xl91></td>
  <td colspan=2 class=xl147 style='mso-ignore:colspan'></td>
  <td colspan=6 class=xl106 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl91 style='mso-ignore:colspan'></td>
  <td class=xl92></td>
  <td class=xl99></td>
  <td class=xl91></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td height=8 class=xl100 style='height:6.0pt'></td>
  <td class=xl91></td>
  <td class=xl91></td>
  <td colspan=8 class=xl106 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl91 style='mso-ignore:colspan'></td>
  <td class=xl92></td>
  <td class=xl99></td>
  <td class=xl91></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td height=8 class=xl100 style='height:6.0pt'></td>
  <td class=xl91></td>
  <td class=xl91></td>
  <td colspan=8 class=xl106 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl91 style='mso-ignore:colspan'></td>
  <td class=xl92></td>
  <td class=xl99></td>
  <td class=xl91></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl100 style='height:12.75pt'></td>
  <td class=xl91></td>
  <td class=xl101>Prepared by:</td>
  <td class=xl91></td>
  <td colspan=2 class=xl140>Checked by:</td>
  <td class=xl91></td>
  <td class=xl101>Checked by:</td>
  <td class=xl91></td>
  <td class=xl106></td>
  <td class=xl142>Verified by</td>
  <td colspan=2 class=xl91 style='mso-ignore:colspan'></td>
  <td class=xl101 colspan=2 style='mso-ignore:colspan'>Aprroved by:</td>
  <td class=xl91></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl100 style='height:12.75pt'></td>
  <td class=xl91></td>
  <td class=xl102></td>
  <td class=xl91></td>
  <td colspan=2 class=xl100>HR Manager</td>
  <td class=xl91></td>
  <td class=xl91 colspan=2 style='mso-ignore:colspan'>Chief Accountant</td>
  <td class=xl106></td>
  <td class=xl105 colspan=2 style='mso-ignore:colspan' x:str="General Manager"><span
  style='mso-spacerun:yes'> </span>General Manager<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl91></td>
  <td class=xl104 colspan=2 style='mso-ignore:colspan'>General Director</td>
  <td class=xl91></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 class=xl100 style='height:13.5pt'></td>
  <td class=xl91></td>
  <td colspan=3 class=xl91 style='mso-ignore:colspan'></td>
  <td class=xl106></td>
  <td colspan=3 class=xl91 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl106 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl91 style='mso-ignore:colspan'></td>
  <td class=xl92></td>
  <td class=xl99></td>
  <td class=xl91></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 class=xl100 style='height:13.5pt'></td>
  <td class=xl91></td>
  <td colspan=3 class=xl91 style='mso-ignore:colspan'></td>
  <td class=xl106></td>
  <td colspan=3 class=xl91 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl106 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl91 style='mso-ignore:colspan'></td>
  <td class=xl92></td>
  <td class=xl99></td>
  <td class=xl91></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 class=xl100 style='height:13.5pt'></td>
  <td class=xl91></td>
  <td colspan=3 class=xl91 style='mso-ignore:colspan'></td>
  <td class=xl106></td>
  <td colspan=3 class=xl91 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl106 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl91 style='mso-ignore:colspan'></td>
  <td class=xl92></td>
  <td class=xl99></td>
  <td class=xl91></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 class=xl100 style='height:13.5pt'></td>
  <td class=xl91></td>
  <td colspan=3 class=xl91 style='mso-ignore:colspan'></td>
  <td class=xl106></td>
  <td colspan=3 class=xl91 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl106 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl91 style='mso-ignore:colspan'></td>
  <td class=xl92></td>
  <td class=xl99></td>
  <td class=xl91></td>
 </tr>
 <tr height=15 style='mso-height-source:userset;height:11.25pt'>
  <td height=15 class=xl100 style='height:11.25pt'></td>
  <td class=xl91></td>
  <td class=xl91></td>
  <td class=xl91></td>
  <td class=xl91 colspan=2 style='mso-ignore:colspan'><span
  style='mso-spacerun:yes'>     </span></td>
  <td class=xl91></td>
  <td class=xl91 colspan=2 style='mso-ignore:colspan'></td>
  <td class=xl106></td>
  <td class=xl106 colspan=2 style='mso-ignore:colspan' x:str><span
  style='mso-spacerun:yes'> </span><span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl91></td>
  <td class=xl91 colspan=2 style='mso-ignore:colspan'></td>
  <td class=xl91></td>
 </tr>
 <tr class=xl92 height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 colspan=3 class=xl93 style='height:13.5pt;mso-ignore:colspan'></td>
  <td colspan=7 class=xl94 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl92 style='mso-ignore:colspan'></td>
  <td class=xl95></td>
  <td class=xl92></td>
 </tr>
 <tr class=xl92 height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 colspan=3 class=xl93 style='height:13.5pt;mso-ignore:colspan'></td>
  <td colspan=7 class=xl94 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl92 style='mso-ignore:colspan'></td>
  <td class=xl95></td>
  <td class=xl92></td>
 </tr>
 <tr class=xl106 height=17 style='height:12.75pt'>
  <td height=17 class=xl100 style='height:12.75pt'></td>
  <td class=xl91></td>
  <td class=xl101></td>
  <td colspan=10 class=xl106 style='mso-ignore:colspan'></td>
  <td class=xl137></td>
  <td class=xl138></td>
  <td class=xl106></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl100 style='height:12.75pt'></td>
  <td class=xl91></td>
  <td class=xl91></td>
  <td colspan=7 class=xl106 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl91 style='mso-ignore:colspan'></td>
  <td class=xl92></td>
  <td class=xl99></td>
  <td class=xl91></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 colspan=4 class=xl91 style='height:14.25pt;mso-ignore:colspan'></td>
  <td class=xl139></td>
  <td colspan=2 class=xl106 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl140 style='mso-ignore:colspan'></td>
  <td colspan=6 class=xl91 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=4 class=xl91 style='height:12.75pt;mso-ignore:colspan'></td>
  <td class=xl124></td>
  <td colspan=2 class=xl106 style='mso-ignore:colspan'></td>
  <td class=xl124></td>
  <td colspan=2 class=xl137 style='mso-ignore:colspan'></td>
  <td colspan=6 class=xl91 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=4 class=xl91 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=3 class=xl106 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl137 style='mso-ignore:colspan'></td>
  <td colspan=6 class=xl91 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=4 class=xl91 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=3 class=xl106 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl137 style='mso-ignore:colspan'></td>
  <td colspan=6 class=xl91 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=4 class=xl91 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=3 class=xl106 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl137 style='mso-ignore:colspan'></td>
  <td colspan=6 class=xl91 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=4 class=xl91 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=3 class=xl106 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl137 style='mso-ignore:colspan'></td>
  <td colspan=6 class=xl91 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=2 class=xl91 style='height:12.75pt;mso-ignore:colspan'></td>
  <td colspan=2 class=xl92 style='mso-ignore:colspan'></td>
  <td class=xl141></td>
  <td colspan=2 class=xl137 style='mso-ignore:colspan'></td>
  <td class=xl141></td>
  <td colspan=2 class=xl137 style='mso-ignore:colspan'></td>
  <td class=xl92></td>
  <td colspan=5 class=xl91 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=26 style='width:20pt'></td>
  <td width=0></td>
  <td width=194 style='width:146pt'></td>
  <td width=101 style='width:76pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=98 style='width:74pt'></td>
  <td width=79 style='width:59pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=96 style='width:72pt'></td>
  <td width=79 style='width:59pt'></td>
  <td width=112 style='width:84pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=68 style='width:51pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
