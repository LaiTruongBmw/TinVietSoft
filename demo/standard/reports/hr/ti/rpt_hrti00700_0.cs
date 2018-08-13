using NativeExcel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rpt_hrti00700_0 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CtlLib.SetUser("APP_DBUSER");


        string p_user, p_tco_org_pk, p_wg, p_work_shift, p_search_by, p_input;
        string p_from_date, p_to_date, p_from_date_text, p_to_date_text, p_date_type, p_nation, p_reg, p_data_type,p_confirm;


        p_tco_org_pk = Request["p_tco_org_pk"].ToString();
        p_wg = Request["p_wg"].ToString();
        p_date_type = Request["p_date_type"].ToString();
        p_input = Request["p_search_temp"].ToString();
        p_work_shift = Request["p_work_shift"].ToString();
        p_from_date = Request["p_from_date"].ToString();
        p_to_date = Request["p_to_date"].ToString();
        p_user = Request["p_user"].ToString();
        p_nation = Request["p_nation"].ToString();
        p_reg = Request["p_reg"].ToString();
        p_data_type = Request["p_data_type"].ToString();
        p_confirm = Request["p_confirm"].ToString();

        int p_tmp;

        string SQL_Com
        = "SELECT A.NUM_4 FROM VHR_HR_CODE A " +
            " WHERE A.ID='HR0006' AND A.CODE='11'";

        DataTable dt_Com = CtlLib.TableReadOpen(SQL_Com);
        int irow_com;
        irow_com = dt_Com.Rows.Count;
        if (irow_com == 0)
            p_tmp = 0;
        else
            p_tmp = int.Parse(dt_Com.Rows[0][0].ToString());

        string SQL="";

        #region statement query

        if (p_data_type == "5")
        {
            SQL="      SELECT c.ORG_NM C0,gp.WORKGROUP_NM C1,A.EMP_ID C2, A.FULL_NAME C3,TO_CHAR(TO_DATE(GW.WORK_DT,'YYYYMMDD'),'DD/MM/YYYY') C4 " +
            "      ,WS.SHIFT C5,WKD.TIME_IN C6,WKD.TIME_OUT C7,NULLIF(WKD.WORK_TIME,0) C8 " +
            "       ,NULLIF(WKD.OVT,0) C9,NULLIF(WKD.NT,0) C10,NULLIF(WKD.NT2,0) C11,NULLIF(WKD.NT3,0) C11_2,NULLIF(WKD.HT,0) C12 " +
            "       ,(SELECT V.CODE_fNM FROM VHR_HR_CODE V WHERE V.ID='HR0003' AND V.CODE=ABS.CODE) C13 " +
            "       , NULLIF(ABS.ABSENCE_TIME,0) c14 " +
            "       ,gw.note_att c15 " +
            "      FROM THR_EMPLOYEE A, TCO_ORG C,THR_WORK_GROUP GP,THR_WG_SCH_DETAIL GW,THR_WORK_SHIFT WS " +
            "             ,(SELECT D.THR_EMP_PK AS THR_EMP_PK,D.WORK_DT AS W_DATE,MAX( D.TIME_IN) AS TIME_IN, MAX(D.TIME_OUT) AS TIME_OUT, MAX(D.WORK_TIME) AS WORK_TIME " +
            "           ,MAX(D.PK) AS PK,MAX(D.THR_WS_PK) AS THR_WS_PK " +
            "           ,SUM(DECODE(H.OT_TYPE,'OT',NVL(H.OT_TIME,0),0)) AS OVT " +
            "           ,SUM(DECODE(H.OT_TYPE,'NT',NVL(H.OT_TIME,0),0)) AS NT " +
            "           ,SUM(DECODE(H.OT_TYPE,'NT2',NVL(H.OT_TIME,0),0)) AS NT2 " +
            "           ,SUM(DECODE(H.OT_TYPE,'NT3',NVL(H.OT_TIME,0),0)) AS NT3 " +
            "            ,SUM(DECODE(H.OT_TYPE,'HT',NVL(H.OT_TIME,0),0)) AS HT " +
            "             ,SUM(DECODE(H.OT_TYPE,'OT',H.PK,0)) AS OVT_PK " +
            "             ,SUM(DECODE(H.OT_TYPE,'NT',H.PK,0)) AS NT_PK " +
            "             ,SUM(DECODE(H.OT_TYPE,'NT2',H.PK,0)) AS NT2_PK " +
            "             ,SUM(DECODE(H.OT_TYPE,'HT',H.PK,0)) AS HT_PK " +
            "             ,MAX( D.DATE_IN) AS DATE_IN " +
            "             ,MAX( D.DATE_OUT) AS DATE_OUT " +
            "             ,MAX(DECODE(NVL(D.MOD_BYHAND_YN,'N'),'N',NVL(D.MOD_AUTO_YN,'N'),'Y')) AS BYHAND_YN " +
            "             ,MAX(DECODE(NVL(H.MOD_BYHAND_YN,'N'),'N',NVL(H.MOD_AUTO_YN,'N'),'Y')) AS BYHAND_YN2 " +
            "             ,D.NO_SCAN_FLAG AS NO_SCAN " +
            "                FROM THR_TIME_MACHINE D,THR_EXTRA_TIME H,THR_EMPLOYEE V " +
            "              WHERE D.DEL_IF = 0 AND V.DEL_IF=0  " +
            "              AND H.DEL_IF(+)=0 AND D.THR_EMP_PK=V.PK   " +
            "              AND D.THR_EMP_PK=H.THR_EMP_PK(+) " +
            "              AND D.WORK_DT=H.WORK_DT(+) " +
            "              AND D.WORK_DT BETWEEN '" + p_from_date + "' AND '" + p_to_date + "' " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(V.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(V.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(V.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            "               AND V.TCO_ORG_PK IN ( " +
            "                                  SELECT     G.PK " +
            "                                        FROM TCO_ORG G " +
            "                                       WHERE G.DEL_IF = 0 " +
            "                                  START WITH G.PK =(CASE WHEN '" + p_tco_org_pk + "'='ALL' THEN G.PK ELSE TO_NUMBER('" + p_tco_org_pk + "') END) " +
            "                                  CONNECT BY PRIOR G.PK = G.P_PK) " +
            "              GROUP BY  D.THR_EMP_PK, D.WORK_DT,D.NO_SCAN_FLAG) WKD " +
            "           ,(SELECT E.ABSENCE_DT AS ABS_DATE,E.THR_EMP_PK, E.ABSENCE_TYPE AS CODE, E.ABSENCE_TIME,E.PK " +
            "               FROM THR_ABSENCE E,THR_EMPLOYEE F " +
            "              WHERE E.DEL_IF = 0 AND F.DEL_IF=0  AND F.PK=E.THR_EMP_PK " +
            "                AND E.ABSENCE_DT  BETWEEN '" + p_from_date + "' AND '" + p_to_date + "' " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(F.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(F.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(F.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            "                AND F.TCO_ORG_PK IN ( " +
            "                                  SELECT     G.PK " +
            "                                        FROM TCO_ORG G " +
            "                                       WHERE G.DEL_IF = 0 " +
            "                                  START WITH G.PK =(CASE WHEN '" + p_tco_org_pk + "'='ALL' THEN G.PK ELSE TO_NUMBER('" + p_tco_org_pk + "') END) " +
            "                                  CONNECT BY PRIOR G.PK = G.P_PK) " +
            "            ) ABS " +
            "     WHERE A.DEL_IF = 0 AND C.DEL_IF=0 AND GP.DEL_IF=0 AND GW.DEL_IF=0 AND WS.DEL_IF=0  " +
            "       AND A.PK=GW.THR_EMP_PK AND GW.THR_WS_PK=WS.PK  " +
            "       AND NVL(A.OLD_JOIN_DT,A.JOIN_DT) <= '" + p_to_date + "' " +
            "       AND (A.LEFT_DT > TO_CHAR(TO_DATE(GW.WORK_DT,'YYYYMMDD')-'" + p_tmp + "','YYYYMMDD') OR A.LEFT_DT IS NULL) " +
            "       AND A.TCO_ORG_PK = C.PK AND A.THR_WG_PK=GP.PK " +
            "       AND GW.WORK_DT BETWEEN '" + p_from_date + "' AND '" + p_to_date + "' " +
            "       AND GW.THR_EMP_PK = WKD.THR_EMP_PK(+) " +
            "       AND GW.THR_EMP_PK = ABS.THR_EMP_PK(+) " +
            "       AND GW.WORK_DT=WKD.W_DATE(+) " +
            "       AND GW.WORK_DT=ABS.ABS_DATE(+) " +
              "     AND DECODE ('" + p_wg + "', 'ALL', '" + p_wg + "', GP.PK) = '" + p_wg + "'" +
            "   AND DECODE ('" + p_work_shift + "', 'ALL', '" + p_work_shift + "', WS.PK) = '" + p_work_shift + "'" +
            "   AND DECODE ('" + p_nation + "', 'ALL', '" + p_nation + "', a.nation) = '" + p_nation + "'" +
            "   AND ('" + p_reg + "'='ALL' OR A.PK IN(SELECT R.THR_EMP_PK " +
            "                                         FROM THR_REGULATION R  " +
            "                                         WHERE R.DEL_IF=0 AND R.THR_EMP_PK=A.PK " +
            "                                            AND GW.WORK_DT>=R.START_DT AND NVL(R.END_DT,GW.WORK_DT)>=GW.WORK_DT) " +
            "        ) " +
            "       AND C.PK IN ( " +
            "                                  SELECT     G.PK " +
            "                                        FROM TCO_ORG G " +
            "                                       WHERE G.DEL_IF = 0 " +
            "                                  START WITH G.PK =(CASE WHEN '" + p_tco_org_pk + "'='ALL' THEN G.PK ELSE TO_NUMBER('" + p_tco_org_pk + "') END) " +
            "                                  CONNECT BY PRIOR G.PK = G.P_PK) " +
            "       AND A.PK NOT IN(SELECT AB.THR_EMP_PK FROM THR_ABSENCE_REG AB WHERE AB.DEL_IF=0 " +
            "                    AND GW.WORK_DT BETWEEN AB.START_DT AND AB.END_DT AND AB.THR_EMP_PK=A.PK ) " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            " and decode('" + p_confirm + "','ALL','ALL',nvl(GW.APPROVE_YN,'N')) = '" + p_confirm + "'   " +
            "    ORDER BY C.ORG_NM,A.EMP_ID,GW.WORK_DT ";
        }
        else if (p_data_type == "1")
        {
            SQL = "      SELECT c.ORG_NM C0,gp.WORKGROUP_NM C1,A.EMP_ID C2, A.FULL_NAME C3,TO_CHAR(TO_DATE(GW.WORK_DT,'YYYYMMDD'),'DD/MM/YYYY') C4 " +
            "      ,WS.SHIFT C5,NULL C6,NULL C7,NULL C8 " +
            "       ,NULL C9,NULL C10,NULL C11,NULL C11_2,NULL C12 " +
            "       ,(SELECT V.CODE_fNM FROM VHR_HR_CODE V WHERE V.ID='HR0003' AND V.CODE=ABS.CODE) C13 " +
            "       , NULLIF(ABS.ABSENCE_TIME,0) " +
            "       ,gw.note_att c15 " +
            "      FROM THR_EMPLOYEE A, TCO_ORG C,THR_WORK_GROUP GP,THR_WG_SCH_DETAIL GW,THR_WORK_SHIFT WS " +
            "           ,(SELECT E.ABSENCE_DT AS ABS_DATE,E.THR_EMP_PK, E.ABSENCE_TYPE AS CODE, E.ABSENCE_TIME,E.PK " +
            "               FROM THR_ABSENCE E,THR_EMPLOYEE F " +
            "              WHERE E.DEL_IF = 0 AND F.DEL_IF=0  AND F.PK=E.THR_EMP_PK " +
            "                AND E.ABSENCE_DT  BETWEEN '" + p_from_date + "' AND '" + p_to_date + "' " +
           "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(F.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(F.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(F.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            "                AND F.TCO_ORG_PK IN ( " +
            "                                  SELECT     G.PK " +
            "                                        FROM TCO_ORG G " +
            "                                       WHERE G.DEL_IF = 0 " +
            "                                  START WITH G.PK =(CASE WHEN '" + p_tco_org_pk + "'='ALL' THEN G.PK ELSE TO_NUMBER('" + p_tco_org_pk + "') END) " +
            "                                  CONNECT BY PRIOR G.PK = G.P_PK) " +
            "            ) ABS " +
            "     WHERE A.DEL_IF = 0 AND C.DEL_IF=0 AND GP.DEL_IF=0 AND GW.DEL_IF=0 AND WS.DEL_IF=0  " +
            "       AND A.PK=GW.THR_EMP_PK AND GW.THR_WS_PK=WS.PK  " +
            "       AND NVL(A.OLD_JOIN_DT,A.JOIN_DT) <= '" + p_to_date + "' " +
            "       AND (A.LEFT_DT > TO_CHAR(TO_DATE(GW.WORK_DT,'YYYYMMDD')-'" + p_tmp + "','YYYYMMDD') OR A.LEFT_DT IS NULL) " +
            "       AND A.TCO_ORG_PK = C.PK AND A.THR_WG_PK=GP.PK " +
            "       AND GW.WORK_DT BETWEEN '" + p_from_date + "' AND '" + p_to_date + "' " +
            "       AND GW.THR_EMP_PK = ABS.THR_EMP_PK " +
            "       AND GW.WORK_DT=ABS.ABS_DATE " +
              "     AND DECODE ('" + p_wg + "', 'ALL', '" + p_wg + "', GP.PK) = '" + p_wg + "'" +
            "   AND DECODE ('" + p_work_shift + "', 'ALL', '" + p_work_shift + "', WS.PK) = '" + p_work_shift + "'" +
            "   AND DECODE ('" + p_nation + "', 'ALL', '" + p_nation + "', a.nation) = '" + p_nation + "'" +
            "   AND ('" + p_reg + "'='ALL' OR A.PK IN(SELECT R.THR_EMP_PK " +
            "                                         FROM THR_REGULATION R  " +
            "                                         WHERE R.DEL_IF=0 AND R.THR_EMP_PK=A.PK " +
            "                                            AND GW.WORK_DT>=R.START_DT AND NVL(R.END_DT,GW.WORK_DT)>=GW.WORK_DT) " +
            "        ) " +
            "       AND C.PK IN ( " +
            "                                  SELECT     G.PK " +
            "                                        FROM TCO_ORG G " +
            "                                       WHERE G.DEL_IF = 0 " +
            "                                  START WITH G.PK =(CASE WHEN '" + p_tco_org_pk + "'='ALL' THEN G.PK ELSE TO_NUMBER('" + p_tco_org_pk + "') END) " +
            "                                  CONNECT BY PRIOR G.PK = G.P_PK) " +
            "       AND A.PK NOT IN(SELECT AB.THR_EMP_PK FROM THR_ABSENCE_REG AB WHERE AB.DEL_IF=0 " +
            "                    AND GW.WORK_DT BETWEEN AB.START_DT AND AB.END_DT AND AB.THR_EMP_PK=A.PK ) " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            " and decode('" + p_confirm + "','ALL','ALL',nvl(GW.APPROVE_YN,'N')) = '" + p_confirm + "'   " +
            "    ORDER BY C.ORG_NM,A.EMP_ID,GW.WORK_DT ";
        }
        else if (p_data_type == "2")
        {
            SQL = "      SELECT c.ORG_NM C0,gp.WORKGROUP_NM C1,A.EMP_ID C2, A.FULL_NAME C3,TO_CHAR(TO_DATE(GW.WORK_DT,'YYYYMMDD'),'DD/MM/YYYY') C4 " +
            "      ,WS.SHIFT C5,WKD.TIME_IN C6,WKD.TIME_OUT C7,NULLIF(WKD.WORK_TIME,0) C8 " +
            "       ,NULLIF(WKD.OVT,0) C9,NULLIF(WKD.NT,0) C10,NULLIF(WKD.NT2,0) C11,NULLIF(WKD.NT3,0) C11_2,NULLIF(WKD.HT,0) C12 " +
            "       ,NULL C13 " +
            "       , NULL " +
            "       ,gw.note_att c15 " +
            "      FROM THR_EMPLOYEE A, TCO_ORG C,THR_WORK_GROUP GP,THR_WG_SCH_DETAIL GW,THR_WORK_SHIFT WS " +
            "             ,(SELECT D.THR_EMP_PK AS THR_EMP_PK,D.WORK_DT AS W_DATE,MAX( D.TIME_IN) AS TIME_IN, MAX(D.TIME_OUT) AS TIME_OUT, MAX(D.WORK_TIME) AS WORK_TIME " +
            "           ,MAX(D.PK) AS PK,MAX(D.THR_WS_PK) AS THR_WS_PK " +
            "           ,SUM(DECODE(H.OT_TYPE,'OT',NVL(H.OT_TIME,0),0)) AS OVT " +
            "           ,SUM(DECODE(H.OT_TYPE,'NT',NVL(H.OT_TIME,0),0)) AS NT " +
            "           ,SUM(DECODE(H.OT_TYPE,'NT2',NVL(H.OT_TIME,0),0)) AS NT2 " +
            "           ,SUM(DECODE(H.OT_TYPE,'NT3',NVL(H.OT_TIME,0),0)) AS NT3 " +
            "            ,SUM(DECODE(H.OT_TYPE,'HT',NVL(H.OT_TIME,0),0)) AS HT " +
            "             ,SUM(DECODE(H.OT_TYPE,'OT',H.PK,0)) AS OVT_PK " +
            "             ,SUM(DECODE(H.OT_TYPE,'NT',H.PK,0)) AS NT_PK " +
            "             ,SUM(DECODE(H.OT_TYPE,'NT2',H.PK,0)) AS NT2_PK " +
            "             ,SUM(DECODE(H.OT_TYPE,'HT',H.PK,0)) AS HT_PK " +
            "             ,MAX( D.DATE_IN) AS DATE_IN " +
            "             ,MAX( D.DATE_OUT) AS DATE_OUT " +
            "             ,MAX(DECODE(NVL(D.MOD_BYHAND_YN,'N'),'N',NVL(D.MOD_AUTO_YN,'N'),'Y')) AS BYHAND_YN " +
            "             ,MAX(DECODE(NVL(H.MOD_BYHAND_YN,'N'),'N',NVL(H.MOD_AUTO_YN,'N'),'Y')) AS BYHAND_YN2 " +
            "             ,D.NO_SCAN_FLAG AS NO_SCAN, max(h.OT_PLUS) as OT_PLUS " +
            "                FROM THR_TIME_MACHINE D,THR_EXTRA_TIME H,THR_EMPLOYEE V " +
            "              WHERE D.DEL_IF = 0 AND V.DEL_IF=0  " +
            "              AND H.DEL_IF(+)=0 AND D.THR_EMP_PK=V.PK   " +
            "              AND D.THR_EMP_PK=H.THR_EMP_PK(+) " +
            "              AND D.WORK_DT=H.WORK_DT(+) " +
            "              AND D.WORK_DT BETWEEN '" + p_from_date + "' AND '" + p_to_date + "' " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(V.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(V.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(V.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            "               AND V.TCO_ORG_PK IN ( " +
            "                                  SELECT     G.PK " +
            "                                        FROM TCO_ORG G " +
            "                                       WHERE G.DEL_IF = 0 " +
            "                                  START WITH G.PK =(CASE WHEN '" + p_tco_org_pk + "'='ALL' THEN G.PK ELSE TO_NUMBER('" + p_tco_org_pk + "') END) " +
            "                                  CONNECT BY PRIOR G.PK = G.P_PK) " +
            " AND D.TIME_IN IS NOT NULL AND D.TIME_OUT IS NOT NULL "+
            "              GROUP BY  D.THR_EMP_PK, D.WORK_DT,D.NO_SCAN_FLAG) WKD " +
            "     WHERE A.DEL_IF = 0 AND C.DEL_IF=0 AND GP.DEL_IF=0 AND GW.DEL_IF=0 AND WS.DEL_IF=0  " +
            "       AND A.PK=GW.THR_EMP_PK AND GW.THR_WS_PK=WS.PK  " +
            "       AND NVL(A.OLD_JOIN_DT,A.JOIN_DT) <= '" + p_to_date + "' " +
            "       AND (A.LEFT_DT > TO_CHAR(TO_DATE(GW.WORK_DT,'YYYYMMDD')-'" + p_tmp + "','YYYYMMDD') OR A.LEFT_DT IS NULL) " +
            "       AND A.TCO_ORG_PK = C.PK AND A.THR_WG_PK=GP.PK " +
            "       AND GW.WORK_DT BETWEEN '" + p_from_date + "' AND '" + p_to_date + "' " +
            "       AND GW.THR_EMP_PK = WKD.THR_EMP_PK " +
            "       AND GW.WORK_DT=WKD.W_DATE " +
              "     AND DECODE ('" + p_wg + "', 'ALL', '" + p_wg + "', GP.PK) = '" + p_wg + "'" +
            "   AND DECODE ('" + p_work_shift + "', 'ALL', '" + p_work_shift + "', WS.PK) = '" + p_work_shift + "'" +
            "   AND DECODE ('" + p_nation + "', 'ALL', '" + p_nation + "', a.nation) = '" + p_nation + "'" +
            "   AND ('" + p_reg + "'='ALL' OR A.PK IN(SELECT R.THR_EMP_PK " +
            "                                         FROM THR_REGULATION R  " +
            "                                         WHERE R.DEL_IF=0 AND R.THR_EMP_PK=A.PK " +
            "                                            AND GW.WORK_DT>=R.START_DT AND NVL(R.END_DT,GW.WORK_DT)>=GW.WORK_DT) " +
            "        ) " +
            "       AND C.PK IN ( " +
            "                                  SELECT     G.PK " +
            "                                        FROM TCO_ORG G " +
            "                                       WHERE G.DEL_IF = 0 " +
            "                                  START WITH G.PK =(CASE WHEN '" + p_tco_org_pk + "'='ALL' THEN G.PK ELSE TO_NUMBER('" + p_tco_org_pk + "') END) " +
            "                                  CONNECT BY PRIOR G.PK = G.P_PK) " +
            "       AND A.PK NOT IN(SELECT AB.THR_EMP_PK FROM THR_ABSENCE_REG AB WHERE AB.DEL_IF=0 " +
            "                    AND GW.WORK_DT BETWEEN AB.START_DT AND AB.END_DT AND AB.THR_EMP_PK=A.PK ) " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            " and decode('" + p_confirm + "','ALL','ALL',nvl(GW.APPROVE_YN,'N')) = '" + p_confirm + "'   " +
            "    ORDER BY C.ORG_NM,A.EMP_ID,GW.WORK_DT ";
        }
        else if (p_data_type == "3")
        {
            SQL = "      SELECT c.ORG_NM C0,gp.WORKGROUP_NM C1,A.EMP_ID C2, A.FULL_NAME C3,TO_CHAR(TO_DATE(GW.WORK_DT,'YYYYMMDD'),'DD/MM/YYYY') C4 " +
            "      ,WS.SHIFT C5,WKD.TIME_IN C6,WKD.TIME_OUT C7,NULLIF(WKD.WORK_TIME,0) C8 " +
            "       ,NULLIF(WKD.OVT,0) C9,NULLIF(WKD.NT,0) C10,NULLIF(WKD.NT2,0) C11,NULLIF(WKD.NT3,0) C11_2,NULLIF(WKD.HT,0) C12 " +
            "       ,NULL C13 " +
            "       ,NULL " +
            "       ,gw.note_att c15 " +
            "      FROM THR_EMPLOYEE A, TCO_ORG C,THR_WORK_GROUP GP,THR_WG_SCH_DETAIL GW,THR_WORK_SHIFT WS " +
            "             ,(SELECT D.THR_EMP_PK AS THR_EMP_PK,D.WORK_DT AS W_DATE,MAX( D.TIME_IN) AS TIME_IN, MAX(D.TIME_OUT) AS TIME_OUT, MAX(D.WORK_TIME) AS WORK_TIME " +
            "           ,MAX(D.PK) AS PK,MAX(D.THR_WS_PK) AS THR_WS_PK " +
            "           ,SUM(DECODE(H.OT_TYPE,'OT',NVL(H.OT_TIME,0),0)) AS OVT " +
            "           ,SUM(DECODE(H.OT_TYPE,'NT',NVL(H.OT_TIME,0),0)) AS NT " +
            "           ,SUM(DECODE(H.OT_TYPE,'NT2',NVL(H.OT_TIME,0),0)) AS NT2 " +
            "           ,SUM(DECODE(H.OT_TYPE,'NT2',NVL(H.OT_TIME,0),0)) AS NT3 " +
            "            ,SUM(DECODE(H.OT_TYPE,'HT',NVL(H.OT_TIME,0),0)) AS HT " +
            "             ,SUM(DECODE(H.OT_TYPE,'OT',H.PK,0)) AS OVT_PK " +
            "             ,SUM(DECODE(H.OT_TYPE,'NT',H.PK,0)) AS NT_PK " +
            "             ,SUM(DECODE(H.OT_TYPE,'NT2',H.PK,0)) AS NT2_PK " +
            "             ,SUM(DECODE(H.OT_TYPE,'HT',H.PK,0)) AS HT_PK " +
            "             ,MAX( D.DATE_IN) AS DATE_IN " +
            "             ,MAX( D.DATE_OUT) AS DATE_OUT " +
            "             ,MAX(DECODE(NVL(D.MOD_BYHAND_YN,'N'),'N',NVL(D.MOD_AUTO_YN,'N'),'Y')) AS BYHAND_YN " +
            "             ,MAX(DECODE(NVL(H.MOD_BYHAND_YN,'N'),'N',NVL(H.MOD_AUTO_YN,'N'),'Y')) AS BYHAND_YN2 " +
            "             ,D.NO_SCAN_FLAG AS NO_SCAN, max(h.OT_PLUS) as OT_PLUS " +
            "                FROM THR_TIME_MACHINE D,THR_EXTRA_TIME H,THR_EMPLOYEE V " +
            "              WHERE D.DEL_IF = 0 AND V.DEL_IF=0  " +
            "              AND H.DEL_IF(+)=0 AND D.THR_EMP_PK=V.PK   " +
            "              AND D.THR_EMP_PK=H.THR_EMP_PK(+) " +
            "              AND D.WORK_DT=H.WORK_DT(+) " +
            "              AND D.WORK_DT BETWEEN '" + p_from_date + "' AND '" + p_to_date + "' " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(V.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(V.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(V.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            "               AND V.TCO_ORG_PK IN ( " +
            "                                  SELECT     G.PK " +
            "                                        FROM TCO_ORG G " +
            "                                       WHERE G.DEL_IF = 0 " +
            "                                  START WITH G.PK =(CASE WHEN '" + p_tco_org_pk + "'='ALL' THEN G.PK ELSE TO_NUMBER('" + p_tco_org_pk + "') END) " +
            "                                  CONNECT BY PRIOR G.PK = G.P_PK) " +
            " AND ( (D.TIME_IN IS NULL AND D.TIME_OUT IS NOT NULL) " +
            "        OR (D.TIME_IN IS NOT NULL AND D.TIME_OUT IS NULL) " +
            "       ) " +
            "              GROUP BY  D.THR_EMP_PK, D.WORK_DT,D.NO_SCAN_FLAG) WKD " +
            "     WHERE A.DEL_IF = 0 AND C.DEL_IF=0 AND GP.DEL_IF=0 AND GW.DEL_IF=0 AND WS.DEL_IF=0  " +
            "       AND A.PK=GW.THR_EMP_PK AND GW.THR_WS_PK=WS.PK  " +
            "       AND NVL(A.OLD_JOIN_DT,A.JOIN_DT) <= '" + p_to_date + "' " +
            "       AND (A.LEFT_DT > TO_CHAR(TO_DATE(GW.WORK_DT,'YYYYMMDD')-'" + p_tmp + "','YYYYMMDD') OR A.LEFT_DT IS NULL) " +
            "       AND A.TCO_ORG_PK = C.PK AND A.THR_WG_PK=GP.PK " +
            "       AND GW.WORK_DT BETWEEN '" + p_from_date + "' AND '" + p_to_date + "' " +
            "       AND GW.THR_EMP_PK = WKD.THR_EMP_PK " +
            "       AND GW.WORK_DT=WKD.W_DATE " +
              "     AND DECODE ('" + p_wg + "', 'ALL', '" + p_wg + "', GP.PK) = '" + p_wg + "'" +
            "   AND DECODE ('" + p_work_shift + "', 'ALL', '" + p_work_shift + "', WS.PK) = '" + p_work_shift + "'" +
            "   AND DECODE ('" + p_nation + "', 'ALL', '" + p_nation + "', a.nation) = '" + p_nation + "'" +
            "   AND ('" + p_reg + "'='ALL' OR A.PK IN(SELECT R.THR_EMP_PK " +
            "                                         FROM THR_REGULATION R  " +
            "                                         WHERE R.DEL_IF=0 AND R.THR_EMP_PK=A.PK " +
            "                                            AND GW.WORK_DT>=R.START_DT AND NVL(R.END_DT,GW.WORK_DT)>=GW.WORK_DT) " +
            "        ) " +
            "       AND C.PK IN ( " +
            "                                  SELECT     G.PK " +
            "                                        FROM TCO_ORG G " +
            "                                       WHERE G.DEL_IF = 0 " +
            "                                  START WITH G.PK =(CASE WHEN '" + p_tco_org_pk + "'='ALL' THEN G.PK ELSE TO_NUMBER('" + p_tco_org_pk + "') END) " +
            "                                  CONNECT BY PRIOR G.PK = G.P_PK) " +
            "       AND A.PK NOT IN(SELECT AB.THR_EMP_PK FROM THR_ABSENCE_REG AB WHERE AB.DEL_IF=0 " +
            "                    AND GW.WORK_DT BETWEEN AB.START_DT AND AB.END_DT AND AB.THR_EMP_PK=A.PK ) " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            " and decode('" + p_confirm + "','ALL','ALL',nvl(GW.APPROVE_YN,'N')) = '" + p_confirm + "'   " +
            "    ORDER BY C.ORG_NM,A.EMP_ID,GW.WORK_DT ";
        }


        #endregion
        //Response.Write(SQL);
        //Response.End();
        DataTable dt_total = CtlLib.TableReadOpen(SQL);
        int irow, icol;
        irow = dt_total.Rows.Count;
        icol = dt_total.Columns.Count;
        if (irow == 0)
        {
            Response.Write("There is no data");
            Response.End();
        }


        string TemplateFile = "rpt_hrti00700_0.xls";
        string TempFile = "../../../../system/temp/rpt_hrti00700_0_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets["Sheet1"];
        //begin export data here
        int pos = 7;
        int i;
        double[] grant_total = new double[icol + 1];
        for (int k = 0; k < icol; k++)
        {
            grant_total[k] = 0;
        }

        //Insert new row
        for (i = 0; i < irow - 1; i++)
        {
            exSheet.Range[pos + i+ 1, 1].Rows.EntireRow.Insert();
        }

        //begin export data here
        exSheet.Cells["A2"].Value =string.Format("From date: {0} To Date: {1}", p_from_date.Substring(6, 2) + "/" + p_from_date.Substring(4, 2) + "/" + p_from_date.Substring(0, 4),p_to_date.Substring(6, 2) + "/" + p_to_date.Substring(4, 2) + "/" + p_to_date.Substring(0, 4));
        
        exSheet.Cells["P3"].Value = p_user;
        exSheet.Cells["P4"].Value = DateTime.Now.ToString("dd/MM/yyyy");

        for (i = 0; i < irow; i++)
        {
            exSheet.Cells[pos + i, 1].Value = i + 1;
            for (int j = 0; j < icol ; j++)
            {
               
				
				if(IsNumeric(dt_total.Rows[i][j].ToString()))
				{
					exSheet.Cells[pos + i, j + 2].Value = double.Parse(dt_total.Rows[i][j].ToString());
                    grant_total[j] += double.Parse(dt_total.Rows[i][j].ToString());
				}
				else 
					exSheet.Cells[pos + i, j + 2].Value = dt_total.Rows[i][j].ToString();
            }
        }

        for (int j = 0; j < icol ; j++)
        {
            if (j == 15 || (j >= 8 && j <= 13))
                exSheet.Cells[pos + irow, j + 2].Value = grant_total[j];
        }

        //end export data
        exBook.SaveAs(TempFile);
        //CtlLib.ExcelToPdf(TempFile);
        string pdfFilePath = TempFile.Replace(".xls", ".pdf");
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
	public static bool IsNumeric(string strNum)
    {
        try
        {
            double tmp = double.Parse(strNum);
            return true;
        }
        catch
        {
            return false;
        }
    }
}