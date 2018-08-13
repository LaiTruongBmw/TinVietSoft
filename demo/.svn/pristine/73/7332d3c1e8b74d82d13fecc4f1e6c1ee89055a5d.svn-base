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
    string p_wg,p_work_mon;
    
   
    p_wg = Request["p_wg"].ToString();
    p_work_mon = Request["p_month"].ToString();
   
    //-----------------information of company-----------------
    string SQL_Com
	= "select  a.PARTNER_LNAME,a.ADDR1,a.PHONE_NO,a.TCO_BPPHOTO_PK,to_char(to_date('" + p_work_mon + "','yyyymm'),'MON-YYYY') " + 
        "from tco_company a " +
        "where a.DEL_IF=0 " +
        "and rownum=1 " ;

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

    string SQL
    = "SELECT C.WORKGROUP_NM AS WORKGROUP_NM " +
        "      ,DECODE(WS.D1,0,NULL,WS.D1),DECODE(WS.D2,0,NULL,WS.D2),DECODE(WS.D3,0,NULL,WS.D3) " +
        "      ,DECODE(WS.D4,0,NULL,WS.D4),DECODE(WS.D5,0,NULL,WS.D5),DECODE(WS.D6,0,NULL,WS.D6) " +
        "      ,DECODE(WS.D7,0,NULL,WS.D7),DECODE(WS.D8,0,NULL,WS.D8),DECODE(WS.D9,0,NULL,WS.D9) " +
        "      ,DECODE(WS.D10,0,NULL,WS.D10),DECODE(WS.D11,0,NULL,WS.D11),DECODE(WS.D12,0,NULL,WS.D12) " +
        "      ,DECODE(WS.D13,0,NULL,WS.D13),DECODE(WS.D14,0,NULL,WS.D14),DECODE(WS.D15,0,NULL,WS.D15) " +
        "      ,DECODE(WS.D16,0,NULL,WS.D16),DECODE(WS.D17,0,NULL,WS.D17),DECODE(WS.D18,0,NULL,WS.D18) " +
        "      ,DECODE(WS.D19,0,NULL,WS.D19),DECODE(WS.D20,0,NULL,WS.D20),DECODE(WS.D21,0,NULL,WS.D21) " +
        "      ,DECODE(WS.D22,0,NULL,WS.D22),DECODE(WS.D23,0,NULL,WS.D23),DECODE(WS.D24,0,NULL,WS.D24) " +
        "      ,DECODE(WS.D25,0,NULL,WS.D25),DECODE(WS.D26,0,NULL,WS.D26),DECODE(WS.D27,0,NULL,WS.D27) " +
        "      ,DECODE(WS.D28,0,NULL,WS.D28),DECODE(WS.D29,0,NULL,WS.D29),DECODE(WS.D30,0,NULL,WS.D30) " +
        "      ,DECODE(WS.D31,0,NULL,WS.D31) " +
        " FROM THR_WORK_GROUP C " +
        "  ,(SELECT A.THR_WG_PK AS grp_pk " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'01',B.SHIFT, 0), 0)) D1 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'02',B.SHIFT, 0), 0)) D2 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'03',B.SHIFT, 0), 0)) D3 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'04',B.SHIFT, 0), 0)) D4 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'05',B.SHIFT, 0), 0)) D5 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'06',B.SHIFT, 0), 0)) D6 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'07',B.SHIFT, 0), 0)) D7 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'08',B.SHIFT, 0), 0)) D8 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'09',B.SHIFT, 0), 0)) D9 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'10',B.SHIFT, 0), 0)) D10 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'11',B.SHIFT, 0), 0)) D11 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'12',B.SHIFT, 0), 0)) D12 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'13',B.SHIFT, 0), 0)) D13 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'14',B.SHIFT, 0), 0)) D14 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'15',B.SHIFT, 0), 0)) D15 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'16',B.SHIFT, 0), 0)) D16 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'17',B.SHIFT, 0), 0)) D17 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'18',B.SHIFT, 0), 0)) D18 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'19',B.SHIFT, 0), 0)) D19 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'20',B.SHIFT, 0), 0)) D20 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'21',B.SHIFT, 0), 0)) D21 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'22',B.SHIFT, 0), 0)) D22 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'23',B.SHIFT, 0), 0)) D23 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'24',B.SHIFT, 0), 0)) D24 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'25',B.SHIFT, 0), 0)) D25 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'26',B.SHIFT, 0), 0)) D26 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'27',B.SHIFT, 0), 0)) D27 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'28',B.SHIFT, 0), 0)) D28 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'29',B.SHIFT, 0), 0)) D29 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'30',B.SHIFT, 0), 0)) D30 " +
        "  ,SUM(NVL(DECODE(SUBSTR(A.WORK_DT,-2),'31',B.SHIFT, 0), 0)) D31 " +
        "    FROM THR_WG_SCH_MASTER a,THR_WORK_SHIFT b " +
        "    WHERE a.DEL_IF=0 AND b.del_if=0 AND a.WORK_DT BETWEEN '" + p_work_mon + "'||'01' AND '" + p_work_mon + "'||'31' " +
        "        AND A.THR_WS_PK=b.pk " +
        "        GROUP BY  A.THR_WG_PK) ws " +
        "WHERE c.del_if=0 AND ws.grp_pk(+)=c.pk " +
        "AND DECODE('" + p_wg + "','ALL','ALL',C.PK)='" + p_wg + "' order by c.workgroup_nm ";

    //-----------------working time-----------------
   
    //Response.Write(SQL);
    //Response.End();   
    DataTable dt_Emp = CtlLib.TableReadOpen(SQL);
    int irow_emp;
    irow_emp = dt_Emp.Rows.Count;
    if (irow_emp == 0)
    {
        Response.Write("There is no data of working time");
        Response.End();
    }
    int iDate_Num;
    
    //-----------------calendar-----------------
    string SQL_Cal
	= "select substr(a.car_date,-2),a.hol_type " + 
        "from tco_abcalendar a  " +
        "where a.del_if=0 and substr(a.car_date,1,6) = '" + p_work_mon + "'  order by car_date ";
    DataTable dt_Cal = CtlLib.TableReadOpen(SQL_Cal);
    iDate_Num = dt_Cal.Rows.Count;
    if (iDate_Num == 0)
    {
        Response.Write("There is no data of calendar");
        Response.End();
    }
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_working_summary_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_working_summary_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_working_summary_files/oledata.mso">
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
  <o:LastPrinted>2008-08-12T04:30:21Z</o:LastPrinted>
  <o:Created>2008-08-12T02:55:49Z</o:Created>
  <o:LastSaved>2008-08-19T08:49:03Z</o:LastSaved>
  <o:Company>genuwin</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.22in .2in .38in .2in;
	mso-header-margin:.24in;
	mso-footer-margin:.18in;
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
	font-size:12.0pt;
	text-align:center;
	vertical-align:middle;}
.xl25
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
	background:#99CCFF;
	mso-pattern:auto none;}
.xl26
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl27
	{mso-style-parent:style0;
	font-size:12.0pt;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	vertical-align:middle;}
.xl29
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl30
	{mso-style-parent:style0;
	color:navy;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl31
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl32
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
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl33
	{mso-style-parent:style0;
	color:navy;
	font-size:30.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl34
	{mso-style-parent:style0;
	color:navy;
	font-size:16.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;}
.xl35
	{mso-style-parent:style0;
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
.xl36
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#FF99CC;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl37
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl38
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl39
	{mso-style-parent:style0;
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
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FF99CC;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl41
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl42
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl43
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl44
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl45
	{mso-style-parent:style0;
	font-size:12.0pt;
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
	background:#99CCFF;
	mso-pattern:auto none;}
.xl46
	{mso-style-parent:style0;
	font-size:12.0pt;
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
	background:#99CCFF;
	mso-pattern:auto none;}
.xl47
	{mso-style-parent:style0;
	color:navy;
	font-size:16.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"mmm\\-yyyy";
	text-align:left;
	vertical-align:middle;
	white-space:normal;}
.xl48
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl49
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl50
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl51
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl52
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl53
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid windowtext;
	border-bottom:none;
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
      <x:Scale>43</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>5</x:SplitHorizontal>
     <x:TopRowBottomPane>5</x:TopRowBottomPane>
     <x:SplitVertical>2</x:SplitVertical>
     <x:LeftColumnRightPane>2</x:LeftColumnRightPane>
     <x:ActivePane>0</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>6</x:ActiveRow>
       <x:ActiveCol>6</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
    <x:PageBreaks>
     <x:RowBreaks>
     <%
        int icur_row;
        icur_row=5;
        string next_group,cur_group;
        for (int i=0;i<irow_emp-1;i++)
        {
            icur_row+=2;
            cur_group=dt_Emp.Rows[i][0].ToString();
            next_group=dt_Emp.Rows[i+1][0].ToString();
            if (next_group != cur_group)
            {
      %>
      <x:RowBreak>
       <x:Row><%=icur_row %></x:Row>
      </x:RowBreak>
      <%
            }
        }
       %>
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
  <x:WindowHeight>7935</x:WindowHeight>
  <x:WindowWidth>11355</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>105</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$1:$5</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=2320 style='border-collapse:
 collapse;table-layout:fixed;width:1757pt'>
 <col width=42 style='mso-width-source:userset;mso-width-alt:1536;width:32pt'>
 <col width=102 style='mso-width-source:userset;mso-width-alt:7730;width:77pt'>
 
 <col width=50 span="<%=iDate_Num%>" style='mso-width-source:userset;mso-width-alt:1828;
 width:38pt'>

 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 width=42 style='height:24.75pt;width:32pt' align=left
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
  </v:shapetype><v:shape id="_x0000_s1025" type="#_x0000_t75" style='position:absolute;
   margin-left:0;margin-top:6.75pt;width:93pt;height:62.25pt;z-index:1'>
   <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt_Com.Rows[0][3].ToString()%>&table_name=tco_bpphoto" o:title="vinagenuwin"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:0px;margin-top:9px;width:124px;
  height:83px'><img width=124 height=83
  src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt_Com.Rows[0][3].ToString()%>&table_name=tco_bpphoto" v:shapes="_x0000_s1025"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=33 width=42 style='height:24.75pt;width:32pt'></td>
   </tr>
  </table>
  </span></td>
  <td width=102 style='width:77pt'></td>
  <td class=xl31 colspan=2 width=223 style='mso-ignore:colspan;width:167pt'><% = dt_Com.Rows[0][0].ToString()%></td>
  <td width=66 style='width:50pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td class=xl30 width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td class=xl30 width=50 style='width:38pt'></td>
  <td class=xl30 width=50 style='width:38pt'></td>
  <td class=xl30 width=50 style='width:38pt'></td>
  <td class=xl30 width=50 style='width:38pt'></td>
  <td class=xl30 width=50 style='width:38pt'></td>
  <td class=xl30 width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=56 style='width:42pt'></td>
  <td width=56 style='width:42pt'></td>
  <td width=56 style='width:42pt'></td>
  <td width=56 style='width:42pt'></td>
  <td width=74 style='width:56pt'></td>
 </tr>
 <tr height=42 style='mso-height-source:userset;height:31.5pt'>
  <td height=42 colspan=2 style='height:31.5pt;mso-ignore:colspan'></td>
  <td class=xl31 colspan=2 style='mso-ignore:colspan'><% = dt_Com.Rows[0][1].ToString()%></td>
  <td colspan=6 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl30 style='mso-ignore:colspan'></td>
  <td></td>
  <td colspan=4 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl33>MONTHLY SCHEDULE</td>
  <td colspan=22 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 colspan=2 style='height:24.75pt;mso-ignore:colspan'></td>
  <td class=xl31 colspan=2 style='mso-ignore:colspan'>Phone :<span
  style='mso-spacerun:yes'>  </span><% = dt_Com.Rows[0][2].ToString()%></td>
  <td colspan=14 style='mso-ignore:colspan'></td>
  <td class=xl34>Month:</td>
  <td colspan=2 class=xl47 width=100 style='width:76pt' x:num><%=dt_Com.Rows[0][4].ToString()%></td>
  <td colspan=21 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl24 height=18 style='mso-height-source:userset;height:13.0pt'>
  <td height=36 class=xl25 style='height:13.0pt;font-style:italic;'>No.</td>
  <td class=xl25 style='border-left:none;font-style:italic;'>WGroup</td>
   <%
    for (int j = 0; j < iDate_Num; j++) 
    {
   %>
  <td rowspan=2 class=xl45 style='border-bottom:.5pt solid black;font-style:italic;' x:num><%= dt_Cal.Rows[j][0].ToString() %></td>
  <%
    }
   %>
  
 </tr>
 <tr class=xl24 height=36 style='mso-height-source:userset;height:27.0pt'>
  <td height=36 class=xl25 style='height:27.0pt;font-style:italic;'>STT</td>
  <td class=xl25 style='border-left:none;font-style:italic;'>Nhóm</td>
  
 </tr>
  <% 
   
    for (int i = 0; i < irow_emp; i++) 
    {
    %> 
 <tr class=xl27 height=42 style='mso-height-source:userset;height:15.5pt'>
  <td  height=84 class=xl43 style='border-bottom:.5pt solid black;
  height:30.0pt' x:num><%=i+1 %></td>
  <td  class=xl48 width=102 style='border-bottom:.5pt solid black; 
  width:77pt'><%= dt_Emp.Rows[i][0].ToString() %></td>
 
  <%
    for (int j = 0; j < iDate_Num; j++) 
    {
        string sformat;
        if (dt_Cal.Rows[j][1].ToString()=="HOL")
            sformat=";background:#FF99CC;mso-pattern:auto none;";
        else if (dt_Cal.Rows[j][1].ToString()=="SUN")
            sformat=";background:#CCFFFF;mso-pattern:auto none;";
        else
        
            sformat="";
   %>
  <td class=xl37 style='border-top:none<%=sformat %>' x:num ><%= dt_Emp.Rows[i][j+1].ToString() %></td>
  <%
    }//end of "for" of WT 
   %>
  
 </tr>
 
 <%
    } //end of "for" of employee 
  %>
 
 
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=42 style='width:32pt'></td>
  <td width=102 style='width:77pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=159 style='width:119pt'></td>
  <td width=66 style='width:50pt'></td>
  <td width=39 style='width:29pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=50 style='width:38pt'></td>
  <td width=56 style='width:42pt'></td>
  <td width=56 style='width:42pt'></td>
  <td width=56 style='width:42pt'></td>
  <td width=56 style='width:42pt'></td>
  <td width=74 style='width:56pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
