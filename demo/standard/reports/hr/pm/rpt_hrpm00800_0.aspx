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
    
    string p_tco_org_pk,p_wg,p_work_mon,p_kind,p_search,p_input,p_amount,p_imp_seq;
  
    p_tco_org_pk       = Request["l_tco_org_pk"].ToString();
    p_wg      = Request["l_wg"].ToString();
    p_work_mon      = Request["l_work_mon"].ToString();
    p_kind       = Request["l_kind"].ToString();
    p_input   = Request["l_input"].ToString();
    p_amount = Request["l_amount"].ToString();
    p_imp_seq = Request["l_imp_seq"].ToString();
    
    string SQL
    = "SELECT A.FROM_DT FROM THR_CLOSE A " +
        "        WHERE A.DEL_IF=0 AND A.MONTH_CLOSE='" + p_work_mon + "' " +    // AND NVL(A.CLOSE_YN,0)='N' " +
        "        AND A.ID='01' ";

    DataTable dt_date = CtlLib.TableReadOpen(SQL);   
    
    if (p_imp_seq == "")
    {
        SQL = "     select N.org_nm,g.workgroup_nm,b.emp_id,b.FULL_NAME,M.NAME " +
            "        ,round(A.AMOUNT,2),NVL(A.MOD_BY_HAND,'N'),a.remark " +
            "    from thr_month_allow a,thr_employee b,THR_ALLOWANCE_MASTER M,tco_org N, thr_work_group g " +
            "    where a.del_if=0 and b.del_if=0  and b.pk=a.thr_emp_pk AND M.DEL_IF=0 and N.del_if=0 and g.del_if=0" +
            "    and a.WORK_MON='" + p_work_mon + "'AND A.ALLOWANCE_KIND=M.KIND and b.thr_wg_pk=g.pk " +
            "	 and b.tco_org_pk= n.pk  and nvl(a.amount,0)<>0 " +
             "	 ANd (b.left_dt is null or b.left_dt >='" + dt_date.Rows[0][0].ToString() + "') " +
            "    and DECODE('" + p_kind + "','ALL','" + p_kind + "',a.ALLOWANCE_KIND)='" + p_kind + "'" +
            "    and DECODE('" + p_wg + "','ALL','" + p_wg + "',b.thr_wg_pk)='" + p_wg + "'" +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(B.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(B.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(B.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            "          AND (   n.pk IN ( " +
            "                              SELECT     g.pk " +
            "                                    FROM tco_org g " +
            "                                   WHERE g.del_if = 0 " +
            "                              START WITH g.pk = " +
            "                                            DECODE ('" + p_tco_org_pk + "', " +
            "                                                    'ALL', 0, " +
            "                                                    '" + p_tco_org_pk + "'" +
            "                                                   ) " +
            "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
            "                        OR '" + p_tco_org_pk + "' = 'ALL')  " +
            "   ORDER BY A.WORK_MON,n.org_nm,B.EMP_ID,A.ALLOWANCE_KIND                      ";
    }
    else
    {
        SQL = "     select N.org_nm,g.workgroup_nm,b.emp_id,b.FULL_NAME,M.NAME " +
        "        ,round(A.AMOUNT,2),NVL(A.MOD_BY_HAND,'N'),a.remark " +
        "    from thr_month_allow a,thr_employee b,THR_ALLOWANCE_MASTER M,tco_org N, thr_work_group g " +
        "    where a.del_if=0 and b.del_if=0  and b.pk=a.thr_emp_pk AND M.DEL_IF=0 and N.del_if=0 and g.del_if=0" +
        "    and a.WORK_MON='" + p_work_mon + "'AND A.ALLOWANCE_KIND=M.KIND and b.thr_wg_pk=g.pk " +
        "	 and b.tco_org_pk= n.pk  and nvl(a.amount,0)<>0 and a.imp_seq='" + p_imp_seq + "' " +
        "	 ANd (b.left_dt is null or b.left_dt >='" + dt_date.Rows[0][0].ToString() + "') " +
        "    and DECODE('" + p_kind + "','ALL','" + p_kind + "',a.ALLOWANCE_KIND)='" + p_kind + "'" +
        "    and DECODE('" + p_wg + "','ALL','" + p_wg + "',b.thr_wg_pk)='" + p_wg + "'" +
        "              AND ('" + p_input + "' IS NULL  " +
        "                     OR  (UPPER(B.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(B.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(B.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
        "          AND (   n.pk IN ( " +
        "                              SELECT     g.pk " +
        "                                    FROM tco_org g " +
        "                                   WHERE g.del_if = 0 " +
        "                              START WITH g.pk = " +
        "                                            DECODE ('" + p_tco_org_pk + "', " +
        "                                                    'ALL', 0, " +
        "                                                    '" + p_tco_org_pk + "'" +
        "                                                   ) " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '" + p_tco_org_pk + "' = 'ALL')  " +
        "   ORDER BY A.WORK_MON,n.org_nm,B.EMP_ID,A.ALLOWANCE_KIND                      ";
    }  



//Response.Write(SQL);
//Response.End();
    DataTable dt_Emp = CtlLib.TableReadOpen(SQL);
    int irow_emp,icol_emp;
    irow_emp = dt_Emp.Rows.Count;
    icol_emp=dt_Emp.Columns.Count;
    if (irow_emp == 0)
    {
        Response.Write("There is no data of unfixed allowance");
        Response.End();
    }
    //--------------------company information-----------------------
    string SQL_Com
	= "select  a.PARTNER_LNAME,a.ADDR1 || ' - ' || a.PHONE_NO,a.TCO_BPPHOTO_PK,to_char(to_date('" + p_work_mon + "','yyyymm'),'MON-YYYY'),to_char(to_date('" + p_work_mon + "','yyyymm'),'MM-YYYY') " + 
        "from tco_company a " +
        "where a.DEL_IF=0 " +
        "and a.pk in ( select tco_company_pk from  " +
        "               tco_org  f " +
        "               where  f.pk IN ( " +
        "                              SELECT     g.pk " +
        "                                    FROM tco_org g " +
        "                                   WHERE g.del_if = 0 " +        
        "                              START WITH g.pk = " +
        "                                            DECODE ('" + p_tco_org_pk + "', " +
        "                                                    'ALL', 0, " +
        "                                                    '" + p_tco_org_pk + "' " +
        "                                                   ) " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '" + p_tco_org_pk + "' = 'ALL') " +
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
    
    
 %>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_unfixed_allowance_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_unfixed_allowance_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_unfixed_allowance_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>EINSVINA</o:Author>
  <o:LastAuthor>ty-ml</o:LastAuthor>
  <o:LastPrinted>2008-10-02T03:59:32Z</o:LastPrinted>
  <o:Created>2006-12-21T09:46:33Z</o:Created>
  <o:LastSaved>2008-10-02T04:00:31Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"Page &P of &N";
	margin:.27in .2in .4in .2in;
	mso-header-margin:.18in;
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
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl26
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.xl29
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;}
.xl30
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;}
.xl31
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl32
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl33
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl34
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl35
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl36
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl37
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl38
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl39
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl40
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl41
	{mso-style-parent:style0;
	color:#3366FF;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl42
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl43
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl44
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:#CCCCFF none;
	white-space:normal;}
.xl45
	{mso-style-parent:style0;
	font-size:13.0pt;
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
	mso-pattern:#CCCCFF none;
	white-space:normal;}
.xl46
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl47
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl48
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:#CCCCFF none;
	white-space:normal;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>59</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>3</x:SplitHorizontal>
     <x:TopRowBottomPane>3</x:TopRowBottomPane>
     <x:SplitVertical>6</x:SplitVertical>
     <x:LeftColumnRightPane>6</x:LeftColumnRightPane>
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
       <x:ActiveRow>4</x:ActiveRow>
      </x:Pane>
      <x:Pane>
       <x:Number>0</x:Number>
       <x:ActiveRow>0</x:ActiveRow>
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
  <x:WindowHeight>5475</x:WindowHeight>
  <x:WindowWidth>10770</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>255</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$3:$3</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1733 style='border-collapse:
 collapse;table-layout:fixed;width:1302pt'>
 <col class=xl24 width=75 style='mso-width-source:userset;mso-width-alt:2742;
 width:56pt'>
 <col class=xl24 width=97 style='mso-width-source:userset;mso-width-alt:5547;
 width:73pt'>
 <col class=xl24 width=130 style='mso-width-source:userset;mso-width-alt:4754;
 width:98pt'>
 <col class=xl24 width=80 style='mso-width-source:userset;mso-width-alt:2925;
 width:60pt'>
 <col class=xl24 width=201 style='mso-width-source:userset;mso-width-alt:7350;
 width:151pt'>
 <col class=xl24 width=93 span=2 style='mso-width-source:userset;mso-width-alt:
 5401;width:70pt'>
 <col class=xl24 width=79 style='mso-width-source:userset;mso-width-alt:3889;
 width:59pt'>
 <col class=xl24 width=83 style='mso-width-source:userset;mso-width-alt:10035;
 width:62pt'>
 <col class=xl24 width=70 style='mso-width-source:userset;mso-width-alt:12560;
 width:53pt'>
 <col class=xl24 width=87 style='mso-width-source:userset;mso-width-alt:3181;
 width:65pt'>
 <col class=xl24 width=86 style='mso-width-source:userset;mso-width-alt:3145;
 width:65pt'>
 <col class=xl24 width=91 style='mso-width-source:userset;mso-width-alt:3328;
 width:68pt'>
 <col class=xl24 width=84 style='mso-width-source:userset;mso-width-alt:3072;
 width:63pt'>
 <col class=xl24 width=96 style='mso-width-source:userset;mso-width-alt:3510;
 width:72pt'>
 <col class=xl24 width=87 style='mso-width-source:userset;mso-width-alt:3181;
 width:65pt'>
 <col class=xl24 width=54 style='mso-width-source:userset;mso-width-alt:1974;
 width:41pt'>
 <col class=xl24 width=81 style='mso-width-source:userset;mso-width-alt:2962;
 width:61pt'>
 <col class=xl24 width=66 style='mso-width-source:userset;mso-width-alt:2413;
 width:50pt'>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 width=75 style='height:24.75pt;width:56pt' align=left
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
   margin-left:1.5pt;margin-top:5.25pt;width:53.25pt;height:43.5pt;z-index:1'>
   <v:imagedata src="rpt_unfixed_allowance_files/image001.png" o:title="vinagenuwin"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:2px;margin-top:7px;width:71px;
  height:58px'><img width=71 height=58
  src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt_Com.Rows[0][2].ToString()%>&table_name=tco_bpphoto" v:shapes="_x0000_s1025"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=33 class=xl24 width=75 style='height:24.75pt;width:56pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl43 colspan=2 width=227 style='mso-ignore:colspan;width:171pt'><%=dt_Com.Rows[0][0].ToString()%></td>
  <td class=xl41 width=80 style='width:60pt'></td>
  <td class=xl41 width=80 style='width:60pt'></td>
  <td class=xl42 width=83 style='width:62pt'>UNFIXED ALLOWANCE IN <%=dt_Com.Rows[0][3].ToString()%></td>
  <td class=xl41 width=70 style='width:53pt'></td>
  <td class=xl24 width=87 style='width:65pt'></td>
  <td class=xl24 width=86 style='width:65pt'></td>
  <td class=xl24 width=91 style='width:68pt'></td>
  <td class=xl24 width=84 style='width:63pt'></td>
  <td class=xl24 width=96 style='width:72pt'></td>
  <td class=xl24 width=87 style='width:65pt'></td>
  <td class=xl24 width=54 style='width:41pt'></td>
  <td class=xl24 width=81 style='width:61pt'></td>
  <td class=xl24 width=66 style='width:50pt'></td>
 </tr>
 <tr class=xl28 height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 class=xl27 style='height:26.25pt'></td>
  <td class=xl43 colspan=3 style='mso-ignore:colspan'><%=dt_Com.Rows[0][1].ToString()%></td>
  <td class=xl29></td>
  <td class=xl47>TRỢ CẤP KHÔNG CỐ ĐỊNH THÁNG <%=dt_Com.Rows[0][4].ToString()%></td>
  <td class=xl30></td>
  <td colspan=9 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl25 height=45 style='mso-height-source:userset;height:33.75pt'>
  <td height=45 class=xl45 width=75 style='height:33.75pt;width:56pt'>No.</td>
  <td class=xl45 width=97 style='border-left:none;width:73pt'>Organization</td>
  <td class=xl45 width=130 style='border-left:none;width:98pt'>Work Group</td>
  <td class=xl45 width=80 style='border-left:none;width:60pt'>Emp ID</td>
  <td class=xl45 width=201 style='border-left:none;width:151pt'>Full Name</td>
  <td class=xl45 width=93 style='border-left:none;width:70pt'>Allowance Name</td>
  <td class=xl44 width=81 style='width:61pt'>Amount</td>
  <td class=xl48 width=66 style='width:50pt'>Fix By Hand</td>
  <td class=xl48 width=66 style='width:50pt'>Remark</td>
 </tr>
 <%
    int i;
    string sformat;
    double tt = 0; 
    for (i=0;i<irow_emp;i++)
    {
        tt += double.Parse(dt_Emp.Rows[i][5].ToString());
        if (i==irow_emp-1)
            sformat="border-bottom:.5pt solid windowtext;";
        else
            sformat = "border-bottom:.5pt hairline windowtext;";
        
  %>
 <tr class=xl26 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl35 style='<%=sformat %>height:30.0pt' x:num><%=i+1 %></td>
  <td class=xl32 style='<%=sformat %>'  ><%=dt_Emp.Rows[i][0].ToString()%></td>
  <td class=xl32 style='<%=sformat %>' ><%=dt_Emp.Rows[i][1].ToString()%></td>
  <td class=xl33 style='<%=sformat %>' ><%=dt_Emp.Rows[i][2].ToString()%></td>
  <td class=xl34 style='<%=sformat %>' ><%=dt_Emp.Rows[i][3].ToString()%></td>
  <td class=xl35 style='<%=sformat %>' ><%=dt_Emp.Rows[i][4].ToString()%></td>
  <td class=xl31 style='<%=sformat %>border-left:none' x:num><%=dt_Emp.Rows[i][5].ToString()%></td>
  <td class=xl31 style='<%=sformat %>border-left:none' ><%=dt_Emp.Rows[i][6].ToString()%></td>
  <td class=xl31 style='<%=sformat %>border-left:none' ><%=dt_Emp.Rows[i][7].ToString()%></td>
 </tr>
 <%} %>
 <tr class=xl26 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td colspan=6 height=40 class=xl35 style='border-bottom:.5pt solid windowtext;height:30.0pt' >ToTal</td>
  <td class=xl31 style='border-bottom:.5pt solid windowtext;border-left:none' x:num><%=tt%></td>
  <td class=xl31 style='border-bottom:.5pt solid windowtext;border-left:none' >&nbsp;</td>
  <td class=xl31 style='border-bottom:.5pt solid windowtext;border-left:none' >&nbsp;</td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=75 style='width:56pt'></td>
  <td width=97 style='width:73pt'></td>
  <td width=130 style='width:98pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=201 style='width:151pt'></td>
  <td width=93 style='width:70pt'></td>
  <td width=93 style='width:70pt'></td>
  <td width=79 style='width:59pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=70 style='width:53pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=91 style='width:68pt'></td>
  <td width=84 style='width:63pt'></td>
  <td width=96 style='width:72pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=54 style='width:41pt'></td>
  <td width=81 style='width:61pt'></td>
  <td width=66 style='width:50pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
