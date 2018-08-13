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
    
    string p_times, p_rpt_month, p_old_year, p_cur_year, p_select, p_company_pk, p_nation;
     
    p_times       = Request["l_times"].ToString();
    p_rpt_month  = Request["l_rpt_month"].ToString();
	p_cur_year=p_rpt_month.Substring(0,4);
    p_old_year=(int.Parse(p_rpt_month.Substring(0,4))-1).ToString();
    p_select     = Request["l_select"].ToString();
    p_nation = Request["l_nation"].ToString();
    //p_company_pk = Request["company_pk"].ToString();
    
    /*nhung loai duoc the hien tren 02 a */
    string SQL_1 = " select code  from vhr_hr_code where id='HR0041' and num_2 = '2' ";
    DataTable dt_type = CtlLib.TableReadOpen(SQL_1);
    int row_type;
    row_type = dt_type.Rows.Count;
    string ins_type = "01";
    if (row_type == 0)
    {
        ins_type = "01";
    }
    else
    {
        ins_type = "";
        for (int i = 0; i < row_type; i++)
        {
            ins_type = ins_type + dt_type.Rows[i][0].ToString() + ",";

        }
        ins_type = ins_type.ToString().Substring(0, ins_type.ToString().Length - 1);
    }
 string SQL
     = "select " +
        "decode( ins_type.num_2, 1, 'Tăng', 'Giảm') " +
        ",ins_type.char_3  as c1 " +
        ",nvl(ins_type.code_fnm, ins_type.Char_3) as c2 " +
        ",a.FULL_NAME as c3  " +
        ",a.SO_BHXH as c4  " +
        ",a.LUONG_CU as c5  " +
        ",'' as c6  " +
        ",'' as c7  " +
        ",'' as c8  " +
        ",'' as c9  " +
        ",a.LUONG_MOI as c10  " +
        ",'' as c11  " +
        ",'' as c12  " +
        ",'' as c13  " +
        ",'' as c14  " +
        ",nvl(a.CL_TANG_XH,0) as c15  " +
        ",nvl(a.CL_GIAM_XH,0) as c16  " +
        ",nvl(a.CL_TANG_YT,0) as c17  " +
        ",nvl(a.CL_GIAM_YT,0) as c18  " +
        ",to_char(to_date(a.TU_THANG,'yyyymm'),'mm/yyyy') as c19  " +
        ",to_char(to_date(a.DEN_THANG,'yyyymm'),'mm/yyyy') as c20  " +
        ",a.TY_LE/100 as c21  " +
        ",'HÐ s? ' || A.MA_HOP_DONG || '(' ||  TO_CHAR(TO_DATE(A.NGAY_KY_HD,'YYYYMMDD'),'DD/MM/YYYY') || ')' as c22  " +
        ",a.SO_THANG as c23  " +
        ",a.DC_TANG_XH as c24  " +
        ",a.DC_GIAM_XH as c25  " +
        ",a.DC_TANG_YT as c26  " +
        ",a.DC_GIAM_YT as c27  " +
        ",a.ghi_chu as c28  " +
        ",a.EMP_ID as c29  " +
        ",decode(nvl(a.TN_YN,'N'),'Y','X','') as c30  " +
        ",nvl(a.CL_TANG_TN,0) as c31  " +
        ",nvl(a.CL_GIAM_TN,0) as c32  " +
        ",a.DC_TANG_TN as c33  " +
        ",a.DC_GIAM_TN as c34  " +
        ",(SELECT D.NUM_1 FROM THR_CODE_MASTER M,THR_CODE_DETAIL D WHERE M.DEL_IF=0 AND D.DEL_IF=0 AND D.THR_CODE_MASTER_PK=M.PK and id='HR0043' and char_1='" + p_old_year + "') c35 " +
        ",(select num_1 from vhr_hr_code where id='HR0043' and char_1='" + p_cur_year + "' ) c36 " +
        ",(select char_4 from vhr_hr_code where id='HR0043' and char_1='" + p_cur_year + "' ) c37 " +
        ",DECODE(LENGTH(A.BIRTH_DT),4,A.BIRTH_DT,TO_CHAR(TO_DATE(A.BIRTH_DT,'YYYYMMDD'),'DD/MM/YYYY')) AS NGAYSINH38    " +
        ",decode(nvl(a.TRA_THE_YN,'N'),'Y','X','')  as TRATHE39 " +
        ",decode(A.SEX,'F','X','')  as SEX40 " +
        ",(select V.CODE_FNM from vhr_hr_code v where v.id='HR0008' and v.code= A.CHUC_DANH ) as CHUCVU41 " +
        ",decode(nvl(a.coso_bhxh,'N'),'Y','X','') as COSOBHXH42 " +
        "from THR_INSURANCE_MANAGE a, thr_employee e, " +
        "(select code,num_1,num_2,CHAr_3,code_fnm from vhr_hr_code where id='HR0041') ins_type " +
        "where a.del_if=0 and e.del_if=0 and a.thr_emp_pk = e.pk and a.LOAI_BH=ins_type.code " +
        "and a.THANG_BC='" + p_rpt_month + "' " +
        "and a.LAN_BAO='" + p_times + "' " +
        "and ((a.status_rpt = -1 and '" + p_select + "' = 'Y') or '" + p_select + "' = 'N' ) " +  //lay report dc select
        "and decode('"+ p_nation +"', 'ALL', 'ALL', e.nation) ='"+ p_nation +  "' " +
        "order by ins_type.num_2,ins_type.char_3,ins_type.code_fnm,ins_type.num_1,a.emp_id,a.LUONG_MOI  ";


//Response.Write(SQL);
//Response.End();
    DataTable dt_Emp = CtlLib.TableReadOpen(SQL);
    int irow_emp,icol_emp;
    irow_emp = dt_Emp.Rows.Count;
    icol_emp=dt_Emp.Columns.Count;
    
    if (irow_emp == 0)
    {
        Response.Write("There is no data");
        Response.End();
    }
    
    //getting information of labels 
    SQL
    = "select code_fnm,to_char(sysdate,'dd/mm/yyyy')  " +
        "from vhr_hr_code a " +
        "where a.id='HR0049'  " +
        //"and (nvl(a.TCO_COMPANY_PK," + p_company_pk + ") = " + p_company_pk + " or '" + p_company_pk + "' = 'ALL')  " +
        "order by a.code ";
    DataTable dt_name = CtlLib.TableReadOpen(SQL);
    int irow_name;
    irow_name = dt_name.Rows.Count;
    if (irow_name <7)
    {
        Response.Write("You have to input enough information of HR0049 code");
        Response.End();
    }
    //summary  of insurance
    SQL
	= "select  " +
        "sum(case when (select nvl(v.num_3,-1) from vhr_hr_code v where v.id='HR0041' and V.CODE = A.LOAI_BH)= 1 then 1 else 0 end ) as c1t1  " +
        ",sum(case when (select nvl(v.num_3,-1) from vhr_hr_code v where v.id='HR0041' and V.CODE = A.LOAI_BH)= 0 then 1 else 0 end ) as c1g2 " +
        ",sum(nvl(a.CL_TANG_XH,0)) as c2txh3 " +
        ",sum(nvl(a.CL_GIAM_XH,0)) as c2gxh4 " +
        ",sum(nvl(a.CL_TANG_YT,0)) as c2tyt5 " +
        ",sum(nvl(a.CL_GIAM_YT,0)) as c2gyt6 " +
        ",sum(nvl(a.CL_TANG_XH,0))*max(nvl(social_rate,0) + nvl(social_com_rate,0))/100  as c3txh7 " +
        ",sum(nvl(a.CL_GIAM_XH,0))*max(nvl(social_rate,0) + nvl(social_com_rate,0))/100 as c3gxh8 " +
        ",sum(nvl(a.CL_TANG_YT,0))*max(nvl(health_rate,0) + nvl(health_com_rate,0))/100  as c3tyt9 " +
        ",sum(nvl(a.CL_GIAM_YT,0))*max(nvl(health_rate,0) + nvl(health_com_rate,0))/100 as c3gyt10 " +
        ",sum(nvl(a.dc_tang_xh,0)) as c4txh11 " +
        ",sum(nvl(a.dc_giam_xh,0)) as c4gxh12 " +
        ",sum(nvl(a.dc_tang_yt,0)) as c4tyt13 " +
        ",sum(nvl(a.dc_giam_yt,0)) as c4gyt14 " +
        ",sum(nvl(a.CL_TANG_TN,0)) as c2ttn15 " +
        ",sum(nvl(a.CL_GIAM_TN,0)) as c2gtn16" +
        ",sum(nvl(a.CL_TANG_TN,0))*max(nvl(unemp_rate,0) + nvl(unemp_com_rate,0))/100  as c3ttn17 " +
        ",sum(nvl(a.CL_GIAM_TN,0))*max(nvl(unemp_rate,0) + nvl(unemp_com_rate,0))/100 as c3gtn18 " +
        ",sum(nvl(a.dc_tang_tn,0)) as c4ttn19 " +
        ",sum(nvl(a.dc_giam_tn,0)) as c4gtn20 " +
        "from thr_insurance_manage a, thr_employee e " +
        "where a.del_if=0 and e.del_if=0 and a.thr_emp_pk = e.pk  " +
        "and a.THANG_BC='" + p_rpt_month + "' " +
        "and ((a.status_rpt = -1 and '" + p_select + "' = 'Y') or '" + p_select + "' = 'N' ) " +  //lay report dc select
        "and decode('" + p_nation + "', 'ALL', 'ALL', e.nation) ='" + p_nation + "' " +
        "and a.LAN_BAO='" + p_times + "' and a.loai_bh not in(" + ins_type + ") ";
        
    DataTable dt_sum = CtlLib.TableReadOpen(SQL);
    int irow_sum;
    irow_sum = dt_sum.Rows.Count;
    if (irow_sum ==0)
    {
        Response.Write("There is no data");
        Response.End();
    }
    SQL
   = "select " +
       "sum(case when nvl(t.XH_YN,'N')='Y' then 1 else 0 end ) " +
       ",sum(case when nvl(t.YT_YN,'N')='Y' then 1 else 0 end ) " +
       ",sum(case when nvl(t.TN_YN,'N')='Y' then 1 else 0 end )  " +
       ",sum(case when nvl(t.XH_YN,'N')<>'Y' then 0 else nvl(LUONG_BHXH,0) end ) " +
       ",sum(case when nvl(t.YT_YN,'N')<>'Y' then 0 else nvl(LUONG_BHYT,0) end ) " +
       ",sum(case when nvl(t.TN_YN,'N')<>'Y' then 0 else nvl(LUONG_BHTN,0) end ) " +
       ",sum(case when nvl(t.XH_YN,'N')<>'Y' then 0 else round(nvl(LUONG_BHXH,0)* (nvl(t.SOCIAL_RATE,0 )+nvl(t.SOCIAL_COM_RATE,0 ) )/100 ,0)end ) " +
       ",sum(case when nvl(t.YT_YN,'N')<>'Y' then 0 else round(nvl(LUONG_BHYT,0)* (nvl(t.HEALTH_COM_RATE,0 )+nvl(t.HEALTH_RATE,0 )  )/100,0)end ) " +
       ",sum(case when nvl(t.TN_YN,'N')<>'Y' then 0 else round(nvl(LUONG_BHTN,0)* (nvl(t.UNEMP_COM_RATE,0 )+nvl(t.UNEMP_RATE,0 ) )/100 ,0)end)		" +
       "from thr_insurance_month t, thr_employee e " +
       "where t.del_if=0 and e.del_if=0 and t.thr_emp_pk = e.pk " +
       "and t.WORK_MON=to_char(add_months(to_date('" + p_rpt_month + "','yyyymm'),-1),'yyyymm') " +
       "and decode('" + p_nation + "', 'ALL', 'ALL', e.nation) ='" + p_nation + "' ";
    
DataTable dt_month = CtlLib.TableReadOpen(SQL);
	if (dt_month.Rows[0][1].ToString()=="")
    {
			 SQL
	= "select " + 
        " 0,0,0 ,0,0,0 ,0,0,0 from dual " ;
        dt_month = CtlLib.TableReadOpen(SQL);
    }
    //    Response.Write(SQL);
    int irow_total;
    irow_total = dt_sum.Rows.Count;
    if (irow_total ==0)
    {
        Response.Write("There is no data");
        Response.End();
    }
    %>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_D02_TS_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_D02_TS_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_D02_TS_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>huyenvt</o:Author>
  <o:LastAuthor>welcome</o:LastAuthor>
  <o:LastPrinted>2012-01-12T09:23:36Z</o:LastPrinted>
  <o:Created>2011-12-21T02:44:46Z</o:Created>
  <o:LastSaved>2012-01-12T09:24:20Z</o:LastSaved>
  <o:Company>hss</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.75in .2in .75in .2in;
	mso-header-margin:.31in;
	mso-footer-margin:.31in;
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
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:"Normal_Ms_Nga2\.4";}
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
	{mso-style-parent:style56;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	white-space:normal;}
.xl67
	{mso-style-parent:style56;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	white-space:normal;}
.xl68
	{mso-style-parent:style56;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	white-space:normal;}
.xl69
	{mso-style-parent:style56;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	white-space:normal;}
.xl70
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl71
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl72
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl73
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl74
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl75
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl76
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl77
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl78
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl79
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl80
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl81
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.0";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl82
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl83
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl84
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl85
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl86
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl87
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl88
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl89
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl90
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl91
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl92
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl93
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl94
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl95
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl96
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl97
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	white-space:normal;}
.xl98
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	white-space:normal;}
.xl99
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	white-space:normal;}
.xl100
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	white-space:normal;}
.xl101
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl102
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	white-space:normal;}
.xl103
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	white-space:normal;}
.xl104
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	white-space:normal;}
.xl105
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	white-space:normal;}
.xl106
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	white-space:normal;}
.xl107
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";}
.xl108
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	white-space:normal;}
.xl109
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl110
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl111
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl112
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl113
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl114
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl115
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl116
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;}
.xl117
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	mso-number-format:"\@";}
.xl119
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl120
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt dotted windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl121
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	white-space:normal;}
.xl122
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	white-space:normal;}
.xl123
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	white-space:normal;}
.xl124
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	white-space:normal;}
.xl125
	{mso-style-parent:style56;
	color:windowtext;
	font-size:8.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	white-space:normal;}
.xl126
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl127
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl128
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl129
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl130
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl131
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl132
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl133
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.000";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl134
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl135
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl136
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl137
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl138
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl139
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	white-space:normal;}
.xl140
	{mso-style-parent:style56;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	white-space:nowrap;}
.xl141
	{mso-style-parent:style56;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	white-space:normal;}
.xl142
	{mso-style-parent:style56;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	white-space:normal;}
.xl143
	{mso-style-parent:style56;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;}
.xl144
	{mso-style-parent:style56;
	font-size:10.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
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
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>78</x:Scale>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:LeftColumnVisible>3</x:LeftColumnVisible>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>21</x:ActiveRow>
       <x:ActiveCol>14</x:ActiveCol>
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
  <x:WindowHeight>11280</x:WindowHeight>
  <x:WindowWidth>15480</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>105</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1318 style='border-collapse:
 collapse;table-layout:fixed;width:989pt'>
 <col width=64 style='width:48pt'>
 <col class=xl118 width=0 style='display:none;mso-width-source:userset;
 mso-width-alt:0'>
 <col width=153 style='mso-width-source:userset;mso-width-alt:5595;width:115pt'>
 <col width=67 style='mso-width-source:userset;mso-width-alt:2450;width:50pt'>
 <col width=64 span=3 style='width:48pt'>
 <col width=69 style='mso-width-source:userset;mso-width-alt:2523;width:52pt'>
 <col width=64 span=3 style='width:48pt'>
 <col width=69 style='mso-width-source:userset;mso-width-alt:2523;width:52pt'>
 <col width=64 span=8 style='width:48pt'>
 <tr height=20 style='height:15.0pt'>
  <td  height=20 class=xl140 width=217 style='height:15.0pt;
  width:163pt'>Tên &#273;&#417;n v&#7883;: <%=dt_name.Rows[0][0].ToString() %></td>
  <td class=xl69></td>
  <td class=xl66></td>
  <td class=xl66 width=67 style='width:50pt'></td>

  <td class=xl66 width=64 style='width:48pt'></td>
  <td class=xl67 width=64 style='width:48pt'></td>
  <td class=xl67 width=64 style='width:48pt'></td>
  <td class=xl68 width=69 style='width:52pt'></td>
  <td class=xl66 width=64 style='width:48pt'></td>
  <td class=xl66 width=64 style='width:48pt'></td>
  <td class=xl66 width=64 style='width:48pt'></td>
  <td class=xl68 width=69 style='width:52pt'></td>
  <td class=xl66 width=64 style='width:48pt'></td>
  <td class=xl66 width=64 style='width:48pt'></td>
  <td class=xl66 width=64 style='width:48pt'></td>
  <td class=xl69 width=64 style='width:48pt'></td>
  <td class=xl69 width=64 style='width:48pt'></td>
  <td class=xl66 width=64 style='width:48pt'></td>
  <td class=xl66 width=64 style='width:48pt'></td>
  <td class=xl66 width=64 style='width:48pt'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=3 height=21 class=xl140 width=217 style='height:15.75pt;
  width:163pt'>Mã &#273;&#417;n v&#7883;: <%=dt_name.Rows[1][0].ToString() %></td>
  <td colspan=17 class=xl141 width=1101 style='width:826pt'>DANH SÁCH LAO
  &#272;&#7896;NG THAM GIA BHXH, BHYT</td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=3 height=20 class=xl140 width=217 style='height:15.0pt;
  width:163pt'>&#272;i&#7879;n tho&#7841;i liên h&#7879;: <%=dt_name.Rows[12][0].ToString() %></td>
  <td></td>
  <td colspan=4 class=xl142 style='mso-ignore:colspan'></td>
  <td colspan=7 class=xl121 width=453 style='width:340pt'>S&#7889;:…… tháng <%=p_rpt_month.Substring(4,2) %>
  n&#259;m <%=p_rpt_month.Substring(0,4) %></td>
  <td class=xl142></td>
  <td colspan=4 class=xl121 width=256 style='width:192pt'>M&#7851;u D02-TS</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl66 style='height:15.0pt'></td>
  <td class=xl69></td>
  <td class=xl66></td>
  <td colspan=13 class=xl108 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl139 width=256 style='width:192pt'>(Ban hành kèm theo
  Q&#272; s&#7889;: 1111/Q&#272;-BHXH</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl66 style='height:15.0pt'></td>
  <td class=xl69></td>
  <td colspan=2 class=xl67 width=220 style='width:165pt'></td>
  <td colspan=2 class=xl67 width=128 style='width:96pt'></td>
  <td class=xl67></td>
  <td class=xl68></td>
  <td colspan=3 class=xl66 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td colspan=3 class=xl66 style='mso-ignore:colspan'></td>
  <td class=xl69></td>
  <td colspan=4 class=xl143 width=256 style='width:192pt'><span
  style='mso-spacerun:yes'> </span>Ngày 25/10/2011 c&#7911;a BHXH Vi&#7879;t
  Nam)</td>
 </tr>
 <tr height=14 style='mso-height-source:userset;height:10.5pt'>
  <td height=14 class=xl66 style='height:10.5pt'></td>
  <td class=xl69></td>
  <td colspan=5 class=xl67 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td colspan=3 class=xl66 style='mso-ignore:colspan'></td>
  <td class=xl68></td>
  <td colspan=3 class=xl66 style='mso-ignore:colspan'></td>
  <td class=xl69></td>
  <td colspan=3 class=xl143 style='mso-ignore:colspan'></td>
  <td class=xl144 width=64 style='width:48pt'>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td rowspan=3 height=74 class=xl70 width=64 style='height:55.5pt;width:48pt'>STT</td>
  <td rowspan=3 class=xl134 width=0 style='border-bottom:.5pt solid black'>Mã
  S&#7889; NV</td>
  <td rowspan=3 class=xl70 width=153 style='width:115pt'>H&#7885; và tên</td>
  <td rowspan=3 class=xl70 width=67 style='width:50pt'>Mã s&#7889;</td>
  <td rowspan=3 class=xl70 width=64 style='width:48pt'>Ngày sinh</td>
  <td rowspan=3 class=xl70 width=64 style='width:48pt'>N&#7919;</td>
  <td rowspan=3 class=xl137 width=64 style='border-bottom:.5pt solid black;
  width:48pt'>C&#7845;p b&#7853;c, ch&#7913;c v&#7909;, ch&#7913;c danh
  ngh&#7873;, &#273;i&#7873;u ki&#7879;n, n&#417;i làm vi&#7879;c</td>
  <td colspan=4 class=xl126 width=261 style='border-right:.5pt solid black;
  border-left:none;width:196pt'>M&#7913;c &#273;óng c&#361;</td>
  <td colspan=4 class=xl126 width=261 style='border-right:.5pt solid black;
  border-left:none;width:196pt'>M&#7913;c &#273;óng m&#7899;i</td>
  <td rowspan=3 class=xl129 width=64 style='border-bottom:.5pt solid black;
  width:48pt'>T&#7915; tháng, n&#259;m</td>
  <td rowspan=3 class=xl134 width=64 style='border-bottom:.5pt solid black;
  width:48pt'>&#272;&#7871;n tháng,n&#259;m</td>
  <td rowspan=3 class=xl137 width=64 style='border-bottom:.5pt solid black;
  width:48pt'>Không tr&#7843; th&#7867;</td>
  <td rowspan=3 class=xl137 width=64 style='border-bottom:.5pt solid black;
  width:48pt'>&#272;ã có s&#7893; BHXH</td>
  <td rowspan=3 class=xl70 width=64 style='border-top:none;width:48pt'>Ghi chú</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td rowspan=2 height=54 class=xl132 width=69 style='border-bottom:.5pt solid black;
  height:40.5pt;border-top:none;width:52pt'>Ti&#7873;n l&#432;&#417;ng</td>
  <td colspan=3 class=xl70 width=192 style='border-left:none;width:144pt'>Ph&#7909;
  c&#7845;p</td>
  <td rowspan=2 class=xl132 width=69 style='border-bottom:.5pt solid black;
  border-top:none;width:52pt'>Ti&#7873;n l&#432;&#417;ng</td>
  <td colspan=3 class=xl126 width=192 style='border-right:.5pt solid black;
  border-left:none;width:144pt'>Ph&#7909; c&#7845;p</td>
 </tr>
 <tr height=34 style='height:25.5pt'>
  <td height=34 class=xl70 width=64 style='height:25.5pt;border-top:none;
  border-left:none;width:48pt'>CV</td>
  <td class=xl70 width=64 style='border-top:none;border-left:none;width:48pt'>TN
  VK (%)</td>
  <td class=xl70 width=64 style='border-top:none;border-left:none;width:48pt'>TN
  ngh&#7873; (%)</td>
  <td class=xl70 width=64 style='border-top:none;border-left:none;width:48pt'>CV</td>
  <td class=xl70 width=64 style='border-top:none;border-left:none;width:48pt'>TN
  VK (%)</td>
  <td class=xl70 width=64 style='border-top:none;border-left:none;width:48pt'>TN
  ngh&#7873; (%)</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl71 width=64 style='height:15.0pt;border-top:none;
  width:48pt' x:num>1</td>
  <td class=xl111 width=0 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl71 width=153 style='border-top:none;border-left:none;width:115pt'
  x:num>2</td>
  <td class=xl71 width=67 style='border-top:none;border-left:none;width:50pt'
  x:num>3</td>
  <td class=xl71 width=64 style='border-top:none;border-left:none;width:48pt'
  x:num>4</td>
  <td class=xl71 width=64 style='border-top:none;border-left:none;width:48pt'
  x:num>5</td>
  <td class=xl71 width=64 style='border-top:none;border-left:none;width:48pt'
  x:num>6</td>
  <td class=xl71 width=69 style='border-top:none;border-left:none;width:52pt'
  x:num>7</td>
  <td class=xl71 width=64 style='border-top:none;border-left:none;width:48pt'
  x:num>8</td>
  <td class=xl71 width=64 style='border-top:none;border-left:none;width:48pt'
  x:num>9</td>
  <td class=xl71 width=64 style='border-top:none;border-left:none;width:48pt'
  x:num>10</td>
  <td class=xl71 width=69 style='border-top:none;border-left:none;width:52pt'
  x:num>11</td>
  <td class=xl71 width=64 style='border-top:none;border-left:none;width:48pt'
  x:num>12</td>
  <td class=xl71 width=64 style='border-top:none;border-left:none;width:48pt'
  x:num>13</td>
  <td class=xl71 width=64 style='border-top:none;border-left:none;width:48pt'
  x:num>14</td>
  <td class=xl71 width=64 style='border-top:none;border-left:none;width:48pt'
  x:num>15</td>
  <td class=xl71 width=64 style='border-top:none;border-left:none;width:48pt'
  x:num>16</td>
  <td class=xl71 width=64 style='border-top:none;border-left:none;width:48pt'
  x:num>17</td>
  <td class=xl71 width=64 style='border-top:none;border-left:none;width:48pt'
  x:num>18</td>
  <td class=xl71 width=64 style='border-top:none;border-left:none;width:48pt'
  x:num>19</td>
 </tr>
 <% 
    string next_type,cur_type,old_type,cur_kind,old_kind, cur_group, old_group;
    Boolean bchange=false;
     Boolean gchange=false;
     Boolean hchange = false;
    Boolean btotal=false;
    double dLuongCu = 0, dLuongMoi = 0;
        
    string[] atype=new string[] {"I","II","III","IV","V","VI","VII","VIII","IX","X","XI"};
    string[] btype=new string[] {"1","2","3","4","5","6","7","8","9","10","11"};
    string[] ctype = new string[] { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k" };
    int irow_type=0;
    int j=0;
    int k=0;
    int g = 0;
    int count = 1;
    for (int i = 0; i < irow_emp; i++)
    {
        irow_type += 1;
        cur_type = dt_Emp.Rows[i][0].ToString();
        cur_kind = dt_Emp.Rows[i][1].ToString();
        cur_group = dt_Emp.Rows[i][2].ToString();

        if (dt_Emp.Rows[i][5].ToString() != "")
        {
            dLuongCu += double.Parse(dt_Emp.Rows[i][5].ToString());
        }
        if (dt_Emp.Rows[i][10].ToString() != "")
        {
            dLuongMoi += double.Parse(dt_Emp.Rows[i][10].ToString());
        }
        //end sum 
        if (i == 0)
        {
            bchange = true;
            gchange = true;
        }
        else
        {
            old_type = dt_Emp.Rows[i - 1][0].ToString();
            old_kind = dt_Emp.Rows[i - 1][1].ToString();
            old_group = dt_Emp.Rows[i - 1][2].ToString();
            if (cur_type != old_type)
            {
                bchange = true;
                k = 0;
                j++;
            }
            if (cur_kind != old_kind)
            {
                gchange = true;
                g = 0;
                count = 1;
            }
            if (cur_group != old_group && cur_kind != cur_group)
            {
                hchange = true;
                count = 1;
                //g =0;
            }
        }
        if (bchange == true)
        {
            irow_type = 1;
            //doi loai bao cao tang giam
  %>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl72 width=64 style='height:15.0pt;width:48pt'><%=atype[j]%></td>
  <td class=xl75 width=0 style='border-left:none'>&nbsp;</td>
  <td class=xl73 width=153 style='border-left:none;width:115pt'><%=cur_type%></td>
  <td class=xl72 width=67 style='border-left:none;width:50pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=69 style='border-left:none;width:52pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=69 style='border-left:none;width:52pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl75 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl75 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
 </tr>
  <%     bchange = false;

        }//ket thuc doi group

        if (gchange)
        {
 %>

 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl76 width=64 style='height:15.0pt;width:48pt'><%=atype[j]%>.<%= btype[k]%></td>
  <td class=xl112 width=0 style='border-left:none'>&nbsp;</td>
  <td class=xl77 width=153 style='border-left:none;width:115pt'><%= cur_kind %></td>
  <td class=xl72 width=67 style='border-left:none;width:50pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=69 style='border-left:none;width:52pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl75 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl75 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
 </tr>
 <%
        gchange = false;
        k++;
      }
     if (hchange == true)
     {
        %>

 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl76 width=64 style='height:15.0pt;width:48pt'><%=ctype[g]%></td>
  <td class=xl112 width=0 style='border-left:none'>&nbsp;</td>
  <td class=xl77 width=153 style='border-left:none;width:115pt'><%= cur_group%></td>
  <td class=xl72 width=67 style='border-left:none;width:50pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=69 style='border-left:none;width:52pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl75 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl75 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl72 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
 </tr>

 <%    
     hchange = false;
     g++;
     }
            
             %>

 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl78 width=64 style='height:15.0pt;width:48pt' x:num><%=count %></td>
  <td class=xl113 width=0 style='border-left:none'><%=dt_Emp.Rows[i][29].ToString() %></td>
  <td class=xl119 width=153 style='border-left:none;width:115pt'><%=dt_Emp.Rows[i][3].ToString() %></td>
  <td class=xl79 align=right width=67 style='border-left:none;width:50pt'
  x:str><%=dt_Emp.Rows[i][4].ToString() %></td>
  <td class=xl80 align=right width=64 style='border-left:none;width:48pt'
  x:str><%=dt_Emp.Rows[i][38].ToString() %></td>
  <td class=xl78 width=64 style='border-left:none;width:48pt'><%=dt_Emp.Rows[i][40].ToString() %></td>
  <td class=xl78 width=64 style='border-left:none;width:48pt'><%=dt_Emp.Rows[i][41].ToString() %></td>
  <td class=xl74 width=69 style='border-left:none;width:52pt' x:num><%=dt_Emp.Rows[i][5].ToString() %></td>
  <td class=xl81 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl82 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl82 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl74 width=69 style='border-left:none;width:52pt' x:num><%=dt_Emp.Rows[i][10].ToString() %></td>
  <td class=xl81 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl82 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl82 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl83 width=64 style='border-left:none;width:48pt'><%=dt_Emp.Rows[i][19].ToString() %></td>
  <td class=xl83 width=64 style='border-left:none;width:48pt'><%=dt_Emp.Rows[i][20].ToString() %></td>
  <td class=xl84 width=64 style='border-left:none;width:48pt'><%=dt_Emp.Rows[i][39].ToString() %></td>
  <td class=xl84 width=64 style='border-left:none;width:48pt'><%=dt_Emp.Rows[i][42].ToString() %></td>
  <td class=xl79 width=64 style='border-left:none;width:48pt'><%=dt_Emp.Rows[i][28].ToString() %></td>
 </tr>
 <%
     if (i == irow_emp - 1)
         btotal = true;
     else
     {
         next_type = dt_Emp.Rows[i + 1][0].ToString();
         if (cur_type != next_type)
             btotal = true;
     }
        if (btotal == true)
        {   
         %>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl85 width=64 style='height:15.0pt;width:48pt'>&nbsp;</td>
  <td class=xl114 width=0 style='border-left:none'>&nbsp;</td>
  <td class=xl120 width=153 style='border-left:none;width:115pt'>C&#7897;ng
  <%= cur_type %></td>
  <td class=xl86 width=67 style='border-left:none;width:50pt'>&nbsp;</td>
  <td class=xl87 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl85 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl85 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl74 width=69 style='border-left:none;width:52pt' x:num><%=dLuongCu %></td>
  <td class=xl89 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl89 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl89 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl74 width=69 style='border-left:none;width:52pt' x:num><%=dLuongMoi %></td>
  <td class=xl89 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl89 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl89 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl90 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl90 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl91 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl91 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
  <td class=xl86 width=64 style='border-left:none;width:48pt'>&nbsp;</td>
 </tr>
 <%
      btotal = false;
      dLuongCu = 0;
      dLuongMoi = 0;
        }
      
      count++;
    }// ket thuc for
     
  %>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl92 width=64 style='height:15.0pt;width:48pt'>&nbsp;</td>
  <td class=xl115 width=0>&nbsp;</td>
  <td class=xl93 width=153 style='width:115pt'>&nbsp;</td>
  <td class=xl93 width=67 style='width:50pt'>&nbsp;</td>
  <td class=xl93 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl92 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl92 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl94 width=69 style='width:52pt'>&nbsp;</td>
  <td class=xl95 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl95 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl95 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl94 width=69 style='width:52pt'>&nbsp;</td>
  <td class=xl95 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl95 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl95 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl96 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl96 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl95 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl95 width=64 style='width:48pt'>&nbsp;</td>
  <td class=xl93 width=64 style='width:48pt'>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td colspan=4 height=20 class=xl125 width=284 style='height:15.0pt;
  width:213pt'>Ph&#7847;n CQBHXH ghi:</td>
  <td class=xl97></td>
  <td colspan=2 class=xl98 style='mso-ignore:colspan'></td>
  <td class=xl99></td>
  <td colspan=3 class=xl100 style='mso-ignore:colspan'></td>
  <td class=xl101 width=69 style='width:52pt'>&nbsp;</td>
  <td colspan=3 class=xl125 width=192 style='width:144pt'>Ph&#7847;n
  &#272;&#417;n v&#7883; ghi:</td>
  <td colspan=2 class=xl102 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl100 style='mso-ignore:colspan'></td>
  <td class=xl97></td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 class=xl98 style='height:26.25pt'></td>
  <td class=xl116></td>
  <td colspan=2 class=xl123 width=220 style='width:165pt'>T&#7893;ng s&#7889;
  t&#7901; khai:</td>
  <td class=xl103 width=64 style='width:48pt'>…………</td>
  <td colspan=2 class=xl104 style='mso-ignore:colspan'></td>
  <td class=xl105></td>
  <td colspan=3 class=xl106 style='mso-ignore:colspan'></td>
  <td class=xl101 width=69 style='width:52pt'>&nbsp;</td>
  <td colspan=3 class=xl100 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl102 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl122 width=192 style='width:144pt'>…….., ngày <%=dt_name.Rows[0][1].ToString().Substring(0,2) %> tháng
  <%=dt_name.Rows[0][1].ToString().Substring(3,2) %> n&#259;m <%=dt_name.Rows[0][1].ToString().Substring(6,4) %></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl98 style='height:15.0pt'></td>
  <td class=xl116></td>
  <td colspan=2 class=xl123 width=220 style='width:165pt'>T&#7893;ng s&#7889;
  S&#7893; BHXH &#273;&#7873; ngh&#7883; c&#7845;p:</td>
  <td class=xl103 width=64 style='width:48pt'>…………</td>
  <td colspan=2 class=xl104 style='mso-ignore:colspan'></td>
  <td class=xl105></td>
  <td colspan=3 class=xl106 style='mso-ignore:colspan'></td>
  <td class=xl101 width=69 style='width:52pt'>&nbsp;</td>
  <td class=xl100></td>
  <td colspan=3 class=xl121 width=192 style='width:144pt'>Ng&#432;&#7901;i
  l&#7853;p bi&#7875;u</td>
  <td class=xl102></td>
  <td colspan=3 class=xl121 width=192 style='width:144pt'>Th&#7911;
  tr&#432;&#7903;ng &#273;&#417;n v&#7883;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl98 style='height:15.0pt'></td>
  <td class=xl116></td>
  <td colspan=2 class=xl124 width=220 style='width:165pt'>T&#7893;ng s&#7889;
  th&#7867; BHYT &#273;&#7873; ngh&#7883; c&#7845;p:</td>
  <td class=xl103 width=64 style='width:48pt'>…………</td>
  <td colspan=2 class=xl124 width=128 style='width:96pt'>Th&#7901;i h&#7841;n
  t&#7915;:…………</td>
  <td class=xl107>&#273;&#7871;n………</td>
  <td colspan=3 class=xl106 style='mso-ignore:colspan'></td>
  <td class=xl101 width=69 style='width:52pt'>&nbsp;</td>
  <td colspan=3 class=xl100 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl102 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl100 style='mso-ignore:colspan'></td>
  <td class=xl97></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl108 style='height:15.0pt'></td>
  <td class=xl117></td>
  <td colspan=2 class=xl121 width=220 style='width:165pt'>Cán b&#7897; thu</td>
  <td colspan=3 class=xl108 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl121 width=197 style='width:148pt'>Cán b&#7897;
  s&#7893;, th&#7867;</td>
  <td class=xl108></td>
  <td class=xl109 width=69 style='width:52pt'>&nbsp;</td>
  <td colspan=3 class=xl66 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl69 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl108 style='height:15.0pt'></td>
  <td class=xl117></td>
  <td colspan=2 class=xl121 width=220 style='width:165pt'></td>
  <td colspan=3 class=xl108 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl121 width=197 style='width:148pt'></td>
  <td class=xl108></td>
  <td class=xl109 width=69 style='width:52pt'>&nbsp;</td>
  <td colspan=3 class=xl66 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl69 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl66 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl98 style='height:15.0pt'></td>
  <td class=xl116></td>
  <td colspan=2 class=xl123 width=220 style='width:165pt'></td>
  <td class=xl103 width=64 style='width:48pt'></td>
  <td colspan=2 class=xl104 style='mso-ignore:colspan'></td>
  <td class=xl105></td>
  <td colspan=3 class=xl106 style='mso-ignore:colspan'></td>
  <td class=xl101 width=69 style='width:52pt'>&nbsp;</td>
  <td class=xl100></td>
  <td colspan=3 class=xl121 width=192 style='width:144pt'><%= dt_name.Rows[5][0].ToString() %></td>
  <td class=xl102></td>
  <td colspan=3 class=xl121 width=192 style='width:144pt'><%= dt_name.Rows[14][0].ToString() %></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=64 style='width:48pt'></td>
  <td width=0></td>
  <td width=153 style='width:115pt'></td>
  <td width=67 style='width:50pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=69 style='width:52pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=69 style='width:52pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
