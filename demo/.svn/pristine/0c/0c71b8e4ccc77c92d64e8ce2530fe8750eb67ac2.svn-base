using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using NativeExcel;
using System.Text.RegularExpressions;

public partial class reports_ch_ae_rpt_employee_detail_list_pcss : System.Web.UI.Page
{
     int pic = 1000;
    protected void Page_Load(object sender, EventArgs e)
    {

        ESysLib.SetUser(Session["APP_DBUSER"].ToString());

        string TemplateFile = "rpt_employee_detail_list_pcss.xls";
        string TempFile = "../../../system/temp/rpt_employee_detail_list_pcss_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        string p_thr_group_pk, p_nation, p_search_by, p_search_temp, p_from_joindate, p_to_joindate;
        string p_salary_yn, p_position, p_pay_type, p_contract_kind, p_from_contract, p_to_contract;
        string p_sex, p_insurance_yn, p_status, p_from_leftdate, p_to_leftdate, p_from_birthdate;
        string p_ot_yn, p_to_birthdate, p_tco_dept_pk, p_sal_security, p_union;
        string p_user;
        string p_job, p_education, p_lstEmpKind, p_lstProject, p_wg, p_birth_month;
        string p_data, p_lang;

        p_user = Request["p_user"].ToString();
        p_select_date = Request["p1"].ToString();
        p_nation = Request["p2"].ToString();
        p_search_by = Request["p3"].ToString();
        p_search_temp = Request["p4"].ToString();
        p_from_joindate = Request["p5"].ToString();
        p_to_joindate = Request["p6"].ToString();
        p_salary_yn = Request["p7"].ToString();
        p_position = Request["p8"].ToString();
        p_pay_type = Request["p9"].ToString();
        p_contract_kind = Request["p10"].ToString();
        p_from_contract = Request["p11"].ToString();
        p_to_contract = Request["p12"].ToString();
        p_sex = Request["p13"].ToString();
        p_insurance_yn = Request["p14"].ToString();
        p_status = Request["p15"].ToString();
        p_from_leftdate = Request["p16"].ToString();
        p_to_leftdate = Request["p17"].ToString();
        p_from_birthdate = Request["p18"].ToString();
        p_ot_yn = Request["p19"].ToString();
        p_to_birthdate = Request["p20"].ToString();
        p_tco_dept_pk = Request["p21"].ToString();
        p_sal_security = Request["p22"].ToString();

        p_job = Request["p23"].ToString();
        p_education = Request["p24"].ToString();
        p_union = Request["p25"].ToString();
        p_birth_month = Request["p26"].ToString();
        p_data = Request["p27"].ToString();
        p_lang = Request["p28"].ToString();

        /*        string[] field_E = {  ""                                                                                          //0
                                    ,"c.ORG_NM"                                                                                 //1
                                    ,"d.WORKGROUP_NM"                                                                           //2
                                    ,"A.EMP_ID"                                                                                 //3
                                    ,"A.OLD_ID"                                                                                 //4
                                    ,"A.FULL_NAME"                                                                              //5
                                    ,"A.ID_NUM"                                                                                 //6
                                    ,"TO_CHAR(TO_DATE(A.JOIN_DT,'YYYYMMDD'),'DD/MM/YYYY')"                                  //7
                                    ,"DECODE(LENGTH(BIRTH_DT),4,BIRTH_DT,TO_CHAR(TO_DATE(BIRTH_DT,'YYYYMMDD'),'DD/MM/YYYY'))"   //8
                                    ,"sf_get_hr_common_code(a.PLACE_BIRTH,'HR0021',a.tco_company_pk)"                         //9
                                    ,"TEL"                                                                                      //10
                                    ,"PERMANENT_ADDR"                                                                           //11
                                    ,"PRESENT_ADDR"                                                                             //12
                                    ,"sf_get_hr_common_code(a.SEX,'HR0007',a.tco_company_pk)"                                 //13
                                    ,"PERSON_ID"                                                                                //14
                                    ,"TO_CHAR(TO_DATE(ISSUE_DT,'YYYYMMDD'),'DD/MM/YYYY')"                                   //15
                                    ,"sf_get_hr_common_code(a.PLACE_PER_ID,'HR0014',a.tco_company_pk)"                        //16
                                    ,"decode(MARRIED_YN,'Y','Married','Single')"
                                    ,"sf_get_hr_common_code(a.Nation,'HR0009',a.tco_company_pk)"
                                    ,"sf_get_hr_common_code(a.ETHNIC_TYPE,'HR0015',a.tco_company_pk)"
                                    ,"sf_get_hr_common_code(a.RELIG_TYPE,'HR0016',a.tco_company_pk)"
                                    ,"sf_get_hr_common_code(a.EDU_TYPE,'HR0011',a.tco_company_pk)"
                                    ,"sf_get_hr_common_code(a.JOB_TYPE,'HR0010',a.tco_company_pk)"
                                    ,"sf_get_hr_common_code(a.POS_TYPE,'HR0008',a.tco_company_pk)"
                                    ,"sf_get_hr_common_code(a.PROB_TYPE,'HR0002',a.tco_company_pk)"
                                    ,"to_char(to_date(a.BEGIN_PROBATION ,'yyyymmdd'),'dd/mm/yyyy')"
                                    ,"to_char(to_date(a.END_PROBATION ,'yyyymmdd'),'dd/mm/yyyy')"
                                    ,"sf_get_hr_common_code(a.CONTRACT_TYPE,'HR0001',a.tco_company_pk)"
                                    ,"a.contract_no"
                                    ,"to_char(to_date(a.BEGIN_Contract ,'yyyymmdd'),'dd/mm/yyyy')"
                                    ,"to_char(to_date(a.END_contract ,'yyyymmdd'),'dd/mm/yyyy')"
                                    ,"decode(a.SOCIAL_YN,'Y','Yes','No')"
                                    ,"a.social_no"
                                    ,"sf_get_hr_common_code(a.SOCIAL_PLACE,'HR0013',a.tco_company_pk)"
                                    ,"to_char(to_date(a.SOCIAL_DT,'yyyymm'),'mm/yyyy')"
                                    ,"decode(a.Health_YN,'Y','Yes','No')"
                                    ,"a.health_no"
                                    ,"sf_get_hr_common_code(a.health_PLACE,'HR0012',a.tco_company_pk)"
                                    ,"to_char(to_date(a.health_DT,'yyyymm'),'mm/yyyy')"
                                    ,"decode(a.Unemp_YN,'Y','Yes','No')"
                                    ,"to_char(to_date(a.unemp_DT,'yyyymm'),'mm/yyyy')"
                                    ,"sf_get_hr_common_code(a.EMPLOYEE_TYPE,'HR0017',a.tco_company_pk)"
                                    ,"decode(a.OT_YN,'Y','Yes','No')"
                                    ,"decode(a.Salary_YN,'Y','Yes','No')"
                                    ,"nvl(a.pro_SAL,0)"
                                    ,"a.BASIC_SAL"
                                    ,"ALLOW_AMT1"
                                    ,"ALLOW_AMT2"
                                    ,"ALLOW_AMT3"
                                    ,"ALLOW_AMT4"
                                    ,"ALLOW_AMT5"
                                    ,"ALLOW_AMT6"
                                    ,"ALLOW_AMT7"
                                    ,"ALLOW_AMT8"
                                    ,"sf_get_hr_common_code(a.pay_type,'HR0023',a.tco_company_pk)"
                                    ,"sf_get_hr_common_code(a.BANK_TYPE,'HR0020',a.tco_company_pk)"
                                    ,"sf_get_hr_common_code(a.BANK_BRANCH,'HR0014',a.tco_company_pk)"
                                    ,"a.account"
                                    ,"sf_get_hr_common_code(a.status,'HR0022',a.tco_company_pk)"
                                    ,"to_char(to_date(left_dt,'yyyymmdd'),'dd/mm/yyyy')"
                                    ,"sf_get_hr_common_code(a.RESIGN_TYPE,'HR0004',a.tco_company_pk)"
                                    ,"sf_get_hr_common_code(a.COST_GROUP,'HR0092',a.tco_company_pk)"
                                    ,"sf_get_hr_common_code(a.COST_KIND,'HR0093',a.tco_company_pk)"
                                    ,"pl.pl_nm"
                                    ,"a.PASS_PORT_NO"
                                    ,"to_char(to_date(a.pass_port_dt,'yyyymmdd'),'dd/mm/yyyy')"
                                    ,"a.remark"
                                    ,"decode(a.union_YN,'Y','Yes','No')"
                                    ,"a.pit_tax_no"
                                    ,"decode(A.ID_BYHAND_YN,'Y','Yes','No')"
                                    ,"decode(A.HOUSE_YN,'Y','Yes','No')"
                                    ,"decode(A.MEAL_YN,'Y','Yes','No')"
                                    ,"c.pk"
                                    ,"sf_get_hr_common_code(a.sal_period,'HR0030',a.tco_company_pk)"
                                    ,"decode(a.reg_ins_yn,'Y','Yes','No')"
                                    ,"n_country2"
                                    ,"sf_get_hr_common_code(A.MAJOR,'HR0148',a.tco_company_pk)"
                                    ,"i.com_nm"
                                    ,"i.duties"
                                    ,"i.period"
                                    ,"substr(to_char(sysdate,'yyyy'),1,4) - substr(A.BIRTH_DT,1,4)"
                                    ,"nvl(A.BASIC_SAL,0) + nvl(A.ALLOW_AMT1,0) + nvl(A.ALLOW_AMT2,0) + nvl(A.ALLOW_AMT3,0) + nvl(A.ALLOW_AMT4,0) + nvl(A.ALLOW_AMT5,0) + nvl(A.ALLOW_AMT6,0) + nvl(A.ALLOW_AMT7,0) + nvl(A.ALLOW_AMT8,0)"
                                    ,""
                                    ,""
                                    ,""
                                 };

                string[] field_V = {  ""                                                                                          //0
                                    ,"c.ORG_FNM"                                                                                 //1
                                    ,"d.WORKGROUP_FNM"                                                                           //2
                                    ,"A.EMP_ID"                                                                                 //3
                                    ,"A.OLD_ID"                                                                                 //4
                                    ,"A.FULL_NAME"                                                                              //5
                                    ,"A.ID_NUM"                                                                                 //6
                                    ,"TO_CHAR(TO_DATE(A.JOIN_DT,'YYYYMMDD'),'DD/MM/YYYY')"                                  //7
                                    ,"DECODE(LENGTH(BIRTH_DT),4,BIRTH_DT,TO_CHAR(TO_DATE(BIRTH_DT,'YYYYMMDD'),'DD/MM/YYYY'))"   //8
                                    ,"sf_get_hr_common_code_fn(a.PLACE_BIRTH,'HR0021',a.tco_company_pk)"                         //9
                                    ,"TEL"                                                                                      //10
                                    ,"PERMANENT_ADDR"                                                                           //11
                                    ,"PRESENT_ADDR"                                                                             //12
                                    ,"sf_get_hr_common_code_fn(a.SEX,'HR0007',a.tco_company_pk)"                                 //13
                                    ,"PERSON_ID"                                                                                //14
                                    ,"TO_CHAR(TO_DATE(ISSUE_DT,'YYYYMMDD'),'DD/MM/YYYY')"                                   //15
                                    ,"sf_get_hr_common_code_fn(a.PLACE_PER_ID,'HR0014',a.tco_company_pk)"                        //16
                                    ,"decode(MARRIED_YN,'Y','Đã kết hôn','Độc thân')"                                       //17
                                    ,"sf_get_hr_common_code_fn(a.Nation,'HR0009',a.tco_company_pk)"                         //18
                                    ,"sf_get_hr_common_code_fn(a.ETHNIC_TYPE,'HR0015',a.tco_company_pk)"                    //19
                                    ,"sf_get_hr_common_code_fn(a.RELIG_TYPE,'HR0016',a.tco_company_pk)"                     //20
                                    ,"sf_get_hr_common_code_fn(a.EDU_TYPE,'HR0011',a.tco_company_pk)"                       //21
                                    ,"sf_get_hr_common_code_fn(a.JOB_TYPE,'HR0010',a.tco_company_pk)"                       //22
                                    ,"sf_get_hr_common_code_fn(a.POS_TYPE,'HR0008',a.tco_company_pk)"                       //23
                                    ,"sf_get_hr_common_code_fn(a.PROB_TYPE,'HR0002',a.tco_company_pk)"                      //24
                                    ,"a.contract_no"
                                    ,"to_char(to_date(a.BEGIN_PROBATION ,'yyyymmdd'),'dd/mm/yyyy')"                         //25
                                    ,"to_char(to_date(a.END_PROBATION ,'yyyymmdd'),'dd/mm/yyyy')"                           //26
                                    ,"sf_get_hr_common_code_fn(a.CONTRACT_TYPE,'HR0001',a.tco_company_pk)"                  //27
                                    ,"a.contract_no"                                                                        //28
                                    ,"to_char(to_date(a.BEGIN_Contract ,'yyyymmdd'),'dd/mm/yyyy')"                          //29
                                    ,"to_char(to_date(a.END_contract ,'yyyymmdd'),'dd/mm/yyyy')"                            //30
                                    ,"decode(a.SOCIAL_YN,'Y','Có','Không')"                                                 //31
                                    ,"a.social_no"                                                                          //32
                                    ,"sf_get_hr_common_code_fn(a.SOCIAL_PLACE,'HR0013',a.tco_company_pk)"                   //33
                                    ,"to_char(to_date(a.SOCIAL_DT,'yyyymm'),'mm/yyyy')"                                     //34
                                    ,"decode(a.Health_YN,'Y','Có','Không')"                                                 //35
                                    ,"a.health_no"                                                                          //36
                                    ,"sf_get_hr_common_code_fn(a.health_PLACE,'HR0012',a.tco_company_pk)"                   //37
                                    ,"to_char(to_date(a.health_DT,'yyyymm'),'mm/yyyy')"                                     //38
                                    ,"decode(a.Unemp_YN,'Y','Có','Không')"                                                  //39
                                    ,"to_char(to_date(a.unemp_DT,'yyyymm'),'mm/yyyy')"                                      //40
                                    ,"sf_get_hr_common_code_fn(a.EMPLOYEE_TYPE,'HR0017',a.tco_company_pk)"                  //41
                                    ,"decode(a.OT_YN,'Y','Có','Không')"                                                     //42
                                    ,"decode(a.Salary_YN,'Y','Có','Không')"                                                 //43
                                    ,"nvl(a.pro_SAL,0)"                                                                     //44
                                    ,"a.BASIC_SAL"                                                                          //45
                                    ,"ALLOW_AMT1"                                                                           //46
                                    ,"ALLOW_AMT2"                                                                           //47
                                    ,"ALLOW_AMT3"                                                                           //48
                                    ,"ALLOW_AMT4"                                                                           //49
                                    ,"ALLOW_AMT5"                                                                           //50
                                    ,"ALLOW_AMT6"                                                                           //51
                                    ,"ALLOW_AMT7"                                                                           //52
                                    ,"ALLOW_AMT8"                                                                           //53
                                    ,"sf_get_hr_common_code_fn(a.pay_type,'HR0023',a.tco_company_pk)"
                                    ,"sf_get_hr_common_code_fn(a.BANK_TYPE,'HR0020',a.tco_company_pk)"
                                    ,"sf_get_hr_common_code_fn(a.BANK_BRANCH,'HR0014',a.tco_company_pk)"
                                    ,"a.account"
                                    ,"sf_get_hr_common_code_fn(a.status,'HR0022',a.tco_company_pk)"
                                    ,"to_char(to_date(left_dt,'yyyymmdd'),'dd/mm/yyyy')"
                                    ,"sf_get_hr_common_code_fn(a.RESIGN_TYPE,'HR0004',a.tco_company_pk)"
                                    ,"sf_get_hr_common_code_fn(a.COST_GROUP,'HR0092',a.tco_company_pk)"
                                    ,"sf_get_hr_common_code_fn(a.COST_KIND,'HR0093',a.tco_company_pk)"
                                    ,"pl.pl_nm"
                                    ,"a.PASS_PORT_NO"
                                    ,"to_char(to_date(a.pass_port_dt,'yyyymmdd'),'dd/mm/yyyy')"
                                    ,"a.remark"
                                    ,"decode(a.union_YN,'Y','Có','Không')"
                                    ,"a.pit_tax_no"
                                    ,"decode(A.ID_BYHAND_YN,'Y','Có','Không')"
                                    ,"decode(A.HOUSE_YN,'Y','Có','Không')"
                                    ,"decode(A.MEAL_YN,'Y','Có','Không')"
                                    ,"c.pk"
                                    ,"sf_get_hr_common_code_fn(a.sal_period,'HR0030',a.tco_company_pk)"
                                    ,"decode(a.reg_ins_yn,'Y','Có','Không')"
                                    ,"n_country2"
                                    ,"sf_get_hr_common_code_fn(A.MAJOR,'HR0148',a.tco_company_pk)"
                                    ,"i.com_nm"
                                    ,"i.duties"
                                    ,"i.period"
                                    ,"substr(to_char(sysdate,'yyyy'),1,4) - substr(A.BIRTH_DT,1,4)"
                                    ,"nvl(A.BASIC_SAL,0) + nvl(A.ALLOW_AMT1,0) + nvl(A.ALLOW_AMT2,0) + nvl(A.ALLOW_AMT3,0) + nvl(A.ALLOW_AMT4,0) + nvl(A.ALLOW_AMT5,0) + nvl(A.ALLOW_AMT6,0) + nvl(A.ALLOW_AMT7,0) + nvl(A.ALLOW_AMT8,0)"
                                    ,""
                                    ,""
                                    ,""
                                 };     */
        string SQL
        = "select E.COLUMN_NUM,E.TITLE_NM,E.TITLE_FIELD,E.TITLE_FNM,E.TITLE_FIELD_FNM " +
            "from thr_title_emp e " +
            "where del_if = 0 ";

        DataTable dt_data = ESysLib.TableReadOpen(SQL);

        DataTable dt_allow = ESysLib.TableReadOpenCursor("hr_rpt_allowance_salary");

        int i, j, k, l;
        //int pic;
        
        int[] pos_allow = new int[8];
        string[] allow_nm = new string[8];
        string[] allow_fnm = new string[8];
        string[] p = p_data.Split('|');
        //Response.Write(p_field);
        string s_field="";
        string s_name = "";

        

            //Response.Write(p[k].ToString() + " -- " + k.ToString() +" /n ");
        for ( l = 0; l < p.Length; l++)
        {
            for (k = 0; k < dt_data.Rows.Count; k++)
            {
 /*               if (int.Parse(p[l].ToString()) == allow && allow < 54)
                {
                    pos_allow[k] = l + 2;  //ghi nhan lai vi tri column cua Allowance

                    
                }
                */
                if (p[l].ToString() == dt_data.Rows[k][0].ToString())
                {
                    //Response.Write(p[l].ToString());
                    if (p_lang == "ENG")
                    {
                        s_field = s_field + dt_data.Rows[k][2].ToString() + ",";

                        if (int.Parse(p[l].ToString()) == 46)
                            s_name = s_name + dt_allow.Rows[0][0].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 47)
                            s_name = s_name + dt_allow.Rows[0][1].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 48)
                            s_name = s_name + dt_allow.Rows[0][2].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 49)
                            s_name = s_name + dt_allow.Rows[0][3].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 50)
                            s_name = s_name + dt_allow.Rows[0][4].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 51)
                            s_name = s_name + dt_allow.Rows[0][5].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 52)
                            s_name = s_name + dt_allow.Rows[0][6].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 53)
                            s_name = s_name + dt_allow.Rows[0][7].ToString() + "|";
                        else
                            s_name = s_name + dt_data.Rows[k][1].ToString() + "|";

                        if (dt_data.Rows[k][0].ToString() == "86")  //picture
                            pic = l;    //lay vi tri cua hinh
                    }
                    else
                    {
                        s_field = s_field + dt_data.Rows[k][4].ToString() + ",";

                        if (int.Parse(p[l].ToString()) == 46)
                            s_name = s_name + dt_allow.Rows[0][16].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 47)
                            s_name = s_name + dt_allow.Rows[0][17].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 48)
                            s_name = s_name + dt_allow.Rows[0][18].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 49)
                            s_name = s_name + dt_allow.Rows[0][19].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 50)
                            s_name = s_name + dt_allow.Rows[0][20].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 51)
                            s_name = s_name + dt_allow.Rows[0][21].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 52)
                            s_name = s_name + dt_allow.Rows[0][22].ToString() + "|";
                        else if (int.Parse(p[l].ToString()) == 53)
                            s_name = s_name + dt_allow.Rows[0][23].ToString() + "|";
                        else
                            s_name = s_name + dt_data.Rows[k][3].ToString() + "|";

                        if (dt_data.Rows[k][0].ToString() == "86")  //picture
                            pic = l;    //lay vi tri cua hinh
                    }
                }

            }
        }
        //Response.Write(pic);
        //Response.Write(s_name);
        //Response.End();
        s_field = s_field.Substring(0, s_field.Length - 1);
        SQL = " select  " + s_field ;
        SQL = SQL + " from thr_employee a, tco_org c,thr_work_group d,THR_F_PASSPORT p,THR_F_LABOUR_LICENCE l,THR_F_VISA f, thr_f_residence g, TAC_ABPL pl, thr_family fa, thr_family fa1,  ";
		SQL = SQL + "(SELECT edu1.thr_emp_pk,edu1.E_NAME, edu1.Major, edu1.graduate_year " + 
        "             FROM thr_emp_edu edu1,(SELECT edu2.THR_EMP_PK ,MAX (graduate_year) AS graduate_year from thr_emp_edu edu2 where edu2.del_if = 0 group by edu2.THR_EMP_PK ) edu_mas         " +
        "             where edu1.del_if = 0 and edu_mas.THR_EMP_PK = edu1.THR_EMP_PK and  edu_mas.graduate_year = edu1.graduate_year  " +
        "             )edu   " ;		
/*      SQL = SQL + "(SELECT e.pk as pk,D.PL_NM||' - '||B.PLC_NM as pl_nm ";
        SQL = SQL + "                       FROM TAC_ABPL D, TAC_ABPLCENTER E, TAC_ABCENTER B ";
        SQL = SQL + "                        WHERE D.DEL_IF    = 0 ";
        SQL = SQL + "                          AND E.DEL_IF    = 0 ";
        SQL = SQL + "                          AND E.TAC_ABPL_PK = D.PK ";
        SQL = SQL + "                          AND E.TAC_ABCENTER_PK = B.PK) pl ";	*/
        SQL = SQL + "         ,(select G.THR_EMPLOYEE_PK emp_pk,G.COM_NM com_nm, G.DUTIES duties,g.start_dt ,g.end_dt,HR_F_GET_PERIOD_PCSS(g.THR_EMPLOYEE_PK) period ";
        SQL = SQL + "            from thr_experience g, ";
        SQL = SQL + "            (select F.THR_EMPLOYEE_PK emp_pk, max(f.END_DT) end_dt ";
        SQL = SQL + "            from thr_experience f ";
        SQL = SQL + "            where f.del_if = 0  ";
        SQL = SQL + "            group by F.THR_EMPLOYEE_PK) h ";
        SQL = SQL + "            where G.DEL_IF = 0 and G.THR_EMPLOYEE_PK = h.emp_pk ";
        SQL = SQL + "            and G.END_DT = h.end_dt) i         ";
        SQL = SQL + "where a.del_if=0   and c.del_if=0 and d.del_if=0 and fa.del_if(+) = 0 and fa1.del_if(+) = 0 ";
		SQL = SQL + "and edu.thr_emp_pk(+) =a.pk  ";
        SQL = SQL + "and a.tco_org_pk=c.pk and a.thr_wg_pk=d.pk and pl.pk(+)=a.TAC_ABPL_PK and A.PK = i.emp_pk(+) and fa.thr_employee_pk(+) = a.pk and fa1.thr_employee_pk(+) = a.pk and nvl(fa.tutor(+),'N') = 'Y' AND NVL(fa1.family_other(+),'N') = 'Y' ";
        SQL = SQL + "AND A.THR_F_PASSPORT_PK = p.pk(+) AND A.THR_F_LABOUR_LICENCE_PK = l.pk(+) AND A.THR_F_VISA_PK = f.pk(+) AND A.THR_F_RESIDENCE_PK = g.pk(+)  ";
        SQL = SQL + "and decode('" + p_nation + "','ALL','ALL',a.NATION )='" + p_nation + "'";
        SQL = SQL + "and (('" + p_search_by + "'='1' and upper(a.FULL_NAME) like  '%' || upper('" + p_search_temp + "') || '%') ";
        SQL = SQL + "         or ('" + p_search_by + "'='2' and upper(a.emp_id) like  '%' || upper('" + p_search_temp + "') || '%') ";
        SQL = SQL + "         or ('" + p_search_by + "'='3' and upper(a.id_num) like  '%' || upper('" + p_search_temp + "') || '%') ";
        SQL = SQL + "         or ('" + p_search_by + "'='4' and upper(a.PERSON_ID ) like  '%' || upper('" + p_search_temp + "') || '%') ";
        SQL = SQL + "         or ('" + p_search_by + "'='5' and upper(a.OLD_ID ) like  '%' || upper('" + p_search_temp + "') || '%')) ";
        SQL = SQL + "and (('" + p_from_joindate + "' is null and '" + p_to_joindate + "' is null)  ";
        SQL = SQL + "         or (a.JOIN_DT between '" + p_from_joindate + "' and '" + p_to_joindate + "') ) ";
        SQL = SQL + "and decode('" + p_salary_yn + "','ALL','ALL',a.SALARY_YN )='" + p_salary_yn + "'";
        SQL = SQL + "and decode('" + p_position + "','ALL','ALL',a.POS_TYPE )='" + p_position + "'";
        SQL = SQL + "and decode('" + p_pay_type + "','ALL','ALL',a.PAY_TYPE )='" + p_pay_type + "'";
        SQL = SQL + "and decode('" + p_contract_kind + "','ALL','ALL',a.CONTRACT_TYPE )='" + p_contract_kind + "'";
        SQL = SQL + "and (('" + p_from_contract + "' is null and '" + p_to_contract + "' is null)  ";
        SQL = SQL + "    or (a.BEGIN_CONTRACT between '" + p_from_contract + "' and '" + p_to_contract + "') ) ";
        SQL = SQL + "and decode('" + p_sex + "','ALL','ALL',a.SEX )='" + p_sex + "' ";
        SQL = SQL + "and decode('" + p_insurance_yn + "','ALL','ALL',a.SOCIAL_YN )='" + p_insurance_yn + "'";
        SQL = SQL + "and decode('" + p_status + "','ALL','ALL',a.status)='" + p_status + "'";
        SQL = SQL + "and (('" + p_from_leftdate + "' is null and '" + p_to_leftdate + "' is null)  ";
        SQL = SQL + "    or (a.LEFT_DT between '" + p_from_leftdate + "' and '" + p_to_leftdate + "') ) ";
        SQL = SQL + " and (('" + p_from_birthdate + "' is null and '" + p_to_birthdate + "' is null)  ";
        SQL = SQL + "    or (decode(length(a.BIRTH_DT),4,a.birth_dt || '0101',a.birth_dt) between '" + p_from_birthdate + "' and '" + p_to_birthdate + "') ) ";
        SQL = SQL + "and decode('" + p_ot_yn + "','ALL','ALL',a.ot_yn)='" + p_ot_yn + "'";
        SQL = SQL + "and decode('" + p_thr_group_pk + "','ALL','ALL',d.pk)='" + p_thr_group_pk + "'";
        SQL = SQL + "and decode('" + p_union + "','ALL','ALL',a.union_yn)='" + p_union + "'";
        SQL = SQL + "AND (   a.tco_org_pk IN ( ";
        SQL = SQL + "                         SELECT     g.pk ";
        SQL = SQL + "                               FROM tco_org g ";
        SQL = SQL + "                              WHERE g.del_if = 0 ";
        SQL = SQL + "                         START WITH g.pk = ";
        SQL = SQL + "                                       DECODE ('" + p_tco_dept_pk + "', ";
        SQL = SQL + "                                               'ALL', 0, ";
        SQL = SQL + "                                               '" + p_tco_dept_pk + "'";
        SQL = SQL + "                                              ) ";
        SQL = SQL + "                         CONNECT BY PRIOR g.pk = g.p_pk) ";
        SQL = SQL + "                   OR '" + p_tco_dept_pk + "' = 'ALL') ";
        SQL = SQL + "and decode('" + p_job + "','ALL','ALL',A.JOB_TYPE)='" + p_job + "'";
        SQL = SQL + "and decode('" + p_education + "','ALL','ALL',A.EDU_TYPE)='" + p_education + "'";
        SQL = SQL + "and ('" + p_birth_month + "'= 'ALL' or (LENGTH(A.BIRTH_DT)=8 and substr(A.BIRTH_DT,5,2)= '" + p_birth_month + "')) ";
        SQL = SQL + "ORDER BY NVL (c.seq, 99999), " +
        "         (    SELECT MAX (T.org_nm) " +
        "                FROM tco_org t " +
        "               WHERE t.del_if = 0 AND T.ORG_TYPE IN ('03') " +
        "          START WITH t.pk = A.TCO_ORG_PK " +
        "          CONNECT BY PRIOR t.p_pk = t.pk), " +
        "         (    SELECT MAX (T.org_nm) " +
        "                FROM tco_org t " +
        "               WHERE t.del_if = 0 AND T.ORG_TYPE IN ('06') " +
        "          START WITH t.pk = A.TCO_ORG_PK " +
        "          CONNECT BY PRIOR t.p_pk = t.pk), " +
        "         (SELECT V.NUM_1 " +
        "            FROM VHR_HR_CODE V " +
        "           WHERE V.ID = 'HR0008' AND V.CODE = A.POS_TYPE), " +
        "         a.join_dt, " +
        "         a.EMP_ID ";
        
        
		//Response.Write(SQL);
        //Response.End();
		
        DataTable dt_emp = ESysLib.TableReadOpen(SQL);

      

        

        SQL
        = "select to_char(sysdate,'dd/mm/yyyy') from dual ";
        DataTable dt_sysdt = ESysLib.TableReadOpen(SQL);

        
        string[] s = s_name.Split('|');
        //Insert column
        for (i = 3; i < s.Length - 1; i++)
        {
            exSheet.Range[1, 5, 1, 5].Columns.EntireColumn.Insert();
        }

        for (i = 0; i < s.Length - 1; i++)
        {
            exSheet.Cells[5, 2 + i].Value = s[i];
        }
        //Header
        exSheet.Range[1, 1, 1, s.Length].Merge();
        if (p_lang == "ENG")
        {
            exSheet.Cells[1, 1].Value = "LIST OF EMPLOYEES";
            exSheet.Cells[2, 2].Value = "Reporter";
            exSheet.Cells[3, 2].Value = "Report Date";
        }
        else
        {
            exSheet.Cells[1, 1].Value = "DANH SÁCH THÔNG TIN NHÂN VIÊN";
            exSheet.Cells[2, 2].Value = "Người báo cáo";
            exSheet.Cells[3, 2].Value = "Ngày báo cáo";
        }

        exSheet.Cells[2, 3].Value = Session["User_ID"].ToString();
        exSheet.Cells[3, 3].Value = dt_sysdt.Rows[0][0].ToString();
                
        //Insert Row
        for (i = 0; i < dt_emp.Rows.Count - 1; i++)
        {
            if (pic != 1000)
                exSheet.Range[6, 1].Rows.RowHeight = 70;

            exSheet.Range[7, 1, 7, 1].Rows.EntireRow.Insert();
            //exSheet.Range[4, 1, 5,11].Copy(exSheet.Range[6,1,7,11], XlPasteType.xlPasteAll);
        }

        for (i = 0; i < dt_emp.Rows.Count; i++)
        {
            exSheet.Cells[6 + i, 1].Value = i + 1;
            for(j= 2; j <= s.Length ; j++)
            {
                //if (IsNumber(dt_emp.Rows[i][j - 2].ToString()) == false || int.Parse(p[j-2].ToString()) <= 14 )
                if (j - 2 == pic && pic != 1000)
                {
                    exSheet.Cells[6 + i, j].Select();
                    if (dt_emp.Rows[i][j - 2].ToString() != "")
                    {
                        byte[] MyData = new byte[0];
                        MyData = (byte[])dt_emp.Rows[i][j - 2];
                        MemoryStream stream = new MemoryStream(MyData);

                        Bitmap b = new Bitmap(stream);

                        exSheet.Shapes.AddPicture(ResizeImage(b, 105, 93));
                    }
                }
                
                exSheet.Cells[6 + i, j].Value = dt_emp.Rows[i][j - 2].ToString();
                //else
                //{
                //    exSheet.Cells[6 + i, j].NumberFormat = "_(* #,##0_);_(* (#,##0);_(* " + "-" + "_);_(@_)";
                //    exSheet.Cells[6 + i, j].Value = Double.Parse(dt_emp.Rows[i][j - 2].ToString());
                //}
            }
        }
        
        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }

        //Xoa column theo security
        int tmp=0,tmp1 = 0;
        if (p_sal_security == "N")
        {
            for (i = 0; i < s.Length - 1; i++)
                if (int.Parse(p[i].ToString()) >= 44 && int.Parse(p[i].ToString()) <= 53)
                {
                    tmp++;
                    if (tmp1 == 0)
                        tmp1 = i;       
                }
            tmp1 = tmp1 + 2;        //trong report bat dau bang colunm thu 2
            for(i=0;i<tmp;i++)
                exSheet.Range[1, tmp1].Columns.EntireColumn.Delete();

        }

        exSheet.Cells.Columns.Autofit();
        

        exBook.SaveAs(TempFile);
        //ESysLib.ExcelToPdf(TempFile);
        //string pdfFilePath = TempFile.Replace(".xls", ".pdf");

        //write out to client broswer
        System.IO.FileInfo file = new System.IO.FileInfo(TempFile);
        //System.IO.FileInfo file = new System.IO.FileInfo(pdfFilePath);
        Response.Clear();
        Response.Charset = "UTF-8";
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        //Add header, give a default file name for "File Download/Store as"
        Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode(file.Name));
        //Add header, set file size to enable browser display download progress
        Response.AddHeader("Content-Length", file.Length.ToString());
        //Set the return string is unavailable reading for client, and must be downloaded
        Response.ContentType = "application/ms-exSheet";
        //Response.ContentType = "application/pdf";
        //Send file string to client 
        Response.WriteFile(TempFile);
        //Response.WriteFile(pdfFilePath);
        //Stop execute  
        Response.End();
    }

    public bool IsNumber(string pText)
    {
        Regex regex = new Regex(@"^[-+]?[0-9]*.?[0-9]+$");
        return regex.IsMatch(pText);
    }

    public Bitmap ResizeImage(Bitmap d, int w, int h)
    {
        Bitmap q = new Bitmap(w, h);
        float f, g;
        f = (float)w / (float)d.Width;
        g = (float)h / (float)d.Height;
        for (int i = 0; i < w; i++)
        {
            for (int j = 0; j < h; j++)
            {
                Color c;
                c = d.GetPixel((int)(i / f), (int)(j / g));
                q.SetPixel(i, j, c);
            }
        }
        return q;
    } 
}