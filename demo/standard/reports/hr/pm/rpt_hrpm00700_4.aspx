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

    
    string p_dept, p_group, p_status, p_type, p_pay_type, p_emp_id, p_work_mon, p_sal_period,p_emp_type;


    p_dept = Request["l_dept"].ToString();
    p_group = Request["l_group"].ToString();
    p_status = Request["l_status"].ToString();
    p_type = Request["l_type"].ToString();
    p_pay_type = Request["l_pay_type"].ToString();
    p_emp_id = Request["l_emp_id"].ToString();
    p_work_mon = Request["l_work_mon"].ToString();
    p_sal_period = Request["l_sal_period"].ToString();
    string p_m_type = Request.QueryString["l_m_type"].ToString();
	p_emp_type = Request["l_Emp_Type"].ToString();

    if (p_type == "ALL")
        p_type = "=nvl(a.net_amt,0)";


    string SQL_Com
    = "select  a.PARTNER_LNAME,a.ADDR1,a.FAX_NO,a.TCO_BPPHOTO_PK,to_char(to_date('" + p_work_mon + "','yyyymm'),'MON-YYYY'),to_char(to_date('" + p_work_mon + "','yyyymm'),'MM-YYYY') " +
        " , a.TAX_CODE from tco_company a " +
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

    string SQL_VN
    = "select a.FULL_NAME, D.PIT_TAX_NO, case when a.MONEY_KIND='02' then round(NVL(A.INCOME_BEFORE_TAX,NVL(A.INCOME_AMT,0)),10)* NVL (a.exchange_rate, 0) else round(NVL(A.INCOME_BEFORE_TAX,NVL(A.INCOME_AMT,0)),3) end , case when a.MONEY_KIND='02' then round(nvl(NVL(A.INCOME_BEFORE_TAX,NVL(A.INCOME_AMT,0)),0)-nvl(a.INC_AMT,0),10) * NVL (a.exchange_rate, 0) else round(NVL(A.INCOME_BEFORE_TAX,NVL(A.INCOME_AMT,0))-nvl(a.INC_AMT,0),3) end" +
        "    , case when a.MONEY_KIND='02' then round(nvl(a.INC_AMT,0),10) * NVL (a.exchange_rate, 0) else round(a.INC_AMT,3) end, NULL,case when a.MONEY_KIND='02' then round((nvl(a.INCOME_TAX,0)+nvl(a.INCOME_TAX_NET,0))* NVL (a.exchange_rate, 0),10) else  round(NVL(a.INCOME_TAX,0)+NVL(a.INCOME_TAX_NET,0),3) end,nvl(a.family_depend,0)" +
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
		" and decode('" + p_emp_type + "','ALL','ALL',A.EMPLOYEE_TYPE)='" + p_emp_type + "'" +
        " and nvl(a.net_amt,0) " + p_type + " and nvl(a.INCOME_TAX,0)+nvl(a.INCOME_TAX_NET,0) > 0 " +
        " order by nvl(b.seq,0),a.THR_GROUP_NM,a.emp_id";                
    //Response.Write(SQL_VN);
    //Response.End();
    string SQL_NN
    = "select a.FULL_NAME, NULL, case when a.MONEY_KIND='02' then round(NVL(A.INCOME_BEFORE_TAX,NVL(A.INCOME_AMT,0)),10)* NVL (a.exchange_rate, 0) else round(NVL(A.INCOME_BEFORE_TAX,NVL(A.INCOME_AMT,0)),3) end , case when a.MONEY_KIND='02' then round(nvl(NVL(A.INCOME_BEFORE_TAX,NVL(A.INCOME_AMT,0)),0)-nvl(a.INC_AMT,0),10) * NVL (a.exchange_rate, 0) else round(NVL(A.INCOME_BEFORE_TAX,NVL(A.INCOME_AMT,0))-nvl(a.INC_AMT,0),3) end" +
        "    , case when a.MONEY_KIND='02' then round(nvl(a.INC_AMT,0),10) * NVL (a.exchange_rate, 0) else round(a.INC_AMT,3) end, NULL,case when a.MONEY_KIND='02' then round((nvl(a.INCOME_TAX,0)+nvl(a.INCOME_TAX_NET,0))* NVL (a.exchange_rate, 0),10) else  round(NVL(a.INCOME_TAX,0)+NVL(a.INCOME_TAX_NET,0),3) end,nvl(a.family_depend,0)" +
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
		" and decode('" + p_emp_type + "','ALL','ALL',A.EMPLOYEE_TYPE)='" + p_emp_type + "'" +
        " and nvl(a.net_amt,0) " + p_type + " and nvl(a.INCOME_TAX,0)+nvl(a.INCOME_TAX_NET,0) > 0 " +
        " order by nvl(b.seq,0),a.THR_GROUP_NM,a.emp_id";
    DataTable dt_VN = CtlLib.TableReadOpen(SQL_VN), dt_NN = CtlLib.TableReadOpen(SQL_NN);
    
 %>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_income_tax_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_income_tax_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_income_tax_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Hee</o:Author>
  <o:LastAuthor>Hee</o:LastAuthor>
  <o:LastPrinted>2008-11-03T06:23:57Z</o:LastPrinted>
  <o:Created>2008-11-03T05:57:37Z</o:Created>
  <o:LastSaved>2008-11-03T06:25:28Z</o:LastSaved>
  <o:Company>Hee Nguyen</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.62in .4in .59in .62in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
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
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl26
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl27
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl28
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl30
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl32
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl35
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl36
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl37
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl38
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl39
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl41
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>330</x:DefaultRowHeight>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>75</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>9</x:SplitHorizontal>
     <x:TopRowBottomPane>9</x:TopRowBottomPane>
     <x:ActivePane>2</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
       <x:ActiveRow>2</x:ActiveRow>
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
  <x:WindowHeight>8445</x:WindowHeight>
  <x:WindowWidth>11355</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>45</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1352 style='border-collapse:
 collapse;table-layout:fixed;width:1015pt'>
 <col class=xl24 width=39 style='mso-width-source:userset;mso-width-alt:1426;
 width:29pt'>
 <col class=xl24 width=169 style='mso-width-source:userset;mso-width-alt:7180;
 width:127pt'>
 <col class=xl24 width=110 style='mso-width-source:userset;mso-width-alt:4022;
 width:83pt'>
 <col class=xl24 width=111 style='mso-width-source:userset;mso-width-alt:4059;
 width:83pt'>
 <col class=xl24 width=101 style='mso-width-source:userset;mso-width-alt:3693;
 width:76pt'>
 <col class=xl24 width=98 style='mso-width-source:userset;mso-width-alt:3584;
 width:74pt'>
 <col class=xl24 width=87 style='mso-width-source:userset;mso-width-alt:3181;
 width:65pt'>
 <col class=xl24 width=91 style='mso-width-source:userset;mso-width-alt:3328;
 width:68pt'>
 <col class=xl24 width=98 style='mso-width-source:userset;mso-width-alt:3584;
 width:74pt'>
 <col class=xl24 width=64 span=7 style='width:48pt'>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td colspan=9 height=31 class=xl26 width=904 style='height:23.25pt;
  width:679pt'>BẢNG KÊ CHI TIẾT SỐ THUẾ THU NHẬP CỦA CÁ NHÂN NGƯỜI LAO ĐỘNG</td>
  <td class=xl27 width=64 style='width:48pt'></td>
  <td class=xl27 width=64 style='width:48pt'></td>
  <td class=xl27 width=64 style='width:48pt'></td>
  <td class=xl27 width=64 style='width:48pt'></td>
  <td class=xl27 width=64 style='width:48pt'></td>
  <td class=xl27 width=64 style='width:48pt'></td>
  <td class=xl27 width=64 style='width:48pt'></td>
 </tr>
 <tr height=26 style='height:19.5pt'>
  <td height=26 colspan=3 class=xl24 style='height:19.5pt;mso-ignore:colspan'></td>
  <td colspan=3 class=xl26>THÁNG: <%=dt_Com.Rows[0][5].ToString() %> </td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl27 style='mso-ignore:colspan'></td>
  <td colspan=5 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 colspan=3 style='height:12.75pt;mso-ignore:colspan'>[01] Mã số thuế cơ quan
  chi trả thu nhập: <b><%=dt_Com.Rows[0][6].ToString() %></b><span style='mso-spacerun:yes'> </span></td>
  <td colspan=13 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 colspan=2 style='height:12.75pt;mso-ignore:colspan'>[02] Tên cơ quan chi trả thu
  nhập: <b><%=dt_Com.Rows[0][0].ToString() %></b><span style='mso-spacerun:yes'> </span></td>
  <td colspan=14 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=16 class=xl24 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td rowspan=3 height=68 class=xl40 width=39 style='height:51.0pt;width:29pt'>STT</td>
  <td rowspan=3 class=xl40 width=169 style='width:127pt'>Họ và tên cá nhân</td>
  <td rowspan=3 class=xl40 width=110 style='width:83pt'>Mã số thuế cá nhân</td>
  <td colspan=4 class=xl40 width=397 style='border-left:none;width:298pt'>Thu
  nhập chịu thuế</td>
  <td rowspan=3 class=xl40 width=91 style='width:68pt'>Số người phụ thuộc</td>
  <td rowspan=3 class=xl40 width=91 style='width:68pt'>Thuế phải nộp</td>
  <td rowspan=3 class=xl40 width=98 style='width:74pt'>Ghi chú</td>
  <td colspan=7 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td rowspan=2 height=36 class=xl40 width=111 style='height:27.0pt;border-top:
  none;width:83pt'>Tổng số</td>
  <td colspan=3 class=xl40 width=286 style='border-left:none;width:215pt'>Trong
  đó</td>
  <td colspan=7 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 class=xl40 width=101 style='height:14.25pt;border-top:none;
  border-left:none;width:76pt'>Lương</td>
  <td class=xl40 width=98 style='border-top:none;border-left:none;width:74pt'>Thưởng</td>
  <td class=xl40 width=87 style='border-top:none;border-left:none;width:65pt'>Khác</td>
  <td colspan=7 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 class=xl30 width=39 style='height:15.75pt;border-top:none;
  width:29pt'>(1)</td>
  <td class=xl30 width=169 style='border-top:none;border-left:none;width:127pt'>(2)</td>
  <td class=xl30 width=110 style='border-top:none;border-left:none;width:83pt'>(3)</td>
  <td class=xl30 width=111 style='border-top:none;border-left:none;width:83pt'>(4)</td>
  <td class=xl30 width=101 style='border-top:none;border-left:none;width:76pt'>(5)</td>
  <td class=xl30 width=98 style='border-top:none;border-left:none;width:74pt'>(6)</td>
  <td class=xl30 width=87 style='border-top:none;border-left:none;width:65pt'>(7)</td>
  <td class=xl30 width=87 style='border-top:none;border-left:none;width:65pt'>(8)</td>
  <td class=xl30 width=91 style='border-top:none;border-left:none;width:68pt'>(9)</td>
  <td class=xl30 width=98 style='border-top:none;border-left:none;width:74pt'>(10)</td>
  <td colspan=7 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <%
     double[] vn = new double[5]{0,0,0,0,0};     
     double[] nn = new double[5] { 0, 0, 0, 0 ,0};
     for (int i = 0; i < dt_VN.Rows.Count; i++)
     {
         vn[0] += Double.Parse(dt_VN.Rows[i][2].ToString());
         vn[1] += Double.Parse(dt_VN.Rows[i][3].ToString());
         vn[2] += Double.Parse(dt_VN.Rows[i][4].ToString());
         vn[3] += Double.Parse(dt_VN.Rows[i][6].ToString());
         vn[4] += Double.Parse(dt_VN.Rows[i][7].ToString());
     }
     for (int j = 0; j < dt_NN.Rows.Count; j++)
     {
         nn[0] += Double.Parse(dt_NN.Rows[j][2].ToString());
         nn[1] += Double.Parse(dt_NN.Rows[j][3].ToString());
         nn[2] += Double.Parse(dt_NN.Rows[j][4].ToString());
         nn[3] += Double.Parse(dt_NN.Rows[j][6].ToString());
         nn[4] += Double.Parse(dt_NN.Rows[j][7].ToString());
     }
  %>
 <tr height=39 style='mso-height-source:userset;height:29.25pt'>
  <td height=39 class=xl31 style='height:29.25pt;border-top:none'>A</td>
  <td class=xl32 width=169 style='border-top:none;border-left:none;width:127pt'>Thu
  nhập thường xuyên người Việt Nam</td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl35 style='border-top:none;border-left:none' x:num><%=vn[0] %></td>
  <td class=xl35 style='border-top:none;border-left:none' x:num><%=vn[1] %></td>
  <td class=xl35 style='border-top:none;border-left:none'><%=vn[2] %></td>
  <td class=xl35 style='border-top:none;border-left:none'>&nbsp;</td>
   <td class=xl35 style='border-top:none;border-left:none' x:num><%=vn[4] %></td>
  <td class=xl35 style='border-top:none;border-left:none' x:num><%=vn[3] %></td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=7 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <%
     for (int i = 0; i < dt_VN.Rows.Count; i++)
     {
  %>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td height=27 class=xl29 style='height:20.25pt' x:num><%=i+1 %></td>
  <td class=xl33 width=169 style='border-top:none;border-left:none;width:127pt'><%=dt_VN.Rows[i][0].ToString() %></td>
  <td class=xl29 style='border-top:none;border-left:none'><%=dt_VN.Rows[i][1].ToString() %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_VN.Rows[i][2].ToString() %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_VN.Rows[i][3].ToString() %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_VN.Rows[i][4].ToString() %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_VN.Rows[i][5].ToString() %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_VN.Rows[i][7].ToString() %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_VN.Rows[i][6].ToString() %></td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=7 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <%
     } %>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td height=27 class=xl28 style='height:20.25pt'>&nbsp;</td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=7 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=34 style='height:25.5pt'>
  <td height=34 class=xl31 style='height:25.5pt;border-top:none'>B</td>
  <td class=xl32 width=169 style='border-top:none;border-left:none;width:127pt'>Thu
  nhập thường xuyên người nước ngoài</td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl35 style='border-top:none;border-left:none' x:num><%=nn[0] %></td>
  <td class=xl35 style='border-top:none;border-left:none' x:num><%=nn[1] %></td>
  <td class=xl35 style='border-top:none;border-left:none'><%=nn[2] %></td>
  <td class=xl35 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl35 style='border-top:none;border-left:none'><%=nn[4] %></td>
  <td class=xl35 style='border-top:none;border-left:none' x:num><%=nn[3] %></td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=7 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <%
     for (int i = 0; i < dt_NN.Rows.Count; i++)
     {
  %>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td height=27 class=xl29 style='height:20.25pt' x:num><%=i+1 %></td>
  <td class=xl33 width=169 style='border-top:none;border-left:none;width:127pt'><%=dt_NN.Rows[i][0].ToString()%></td>
  <td class=xl29 style='border-top:none;border-left:none' x:num>&nbsp;</td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][2].ToString()%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][3].ToString()%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][4].ToString()%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][5].ToString()%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][7].ToString()%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_NN.Rows[i][6].ToString()%></td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=7 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <%
     } %>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td height=27 class=xl29 style='height:20.25pt'>&nbsp;</td>
  <td class=xl33 width=169 style='border-top:none;border-left:none;width:127pt'>&nbsp;</td>
  <td class=xl29 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl34 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl34 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl34 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl34 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl34 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=7 class=xl24 style='mso-ignore:colspan'></td>
  
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=3 height=24 class=xl36 style='border-right:.5pt solid black;
  height:18.0pt'>Tổng cộng (A+B):</td>
  <td class=xl39 width=111 style='border-top:none;border-left:none;width:83pt'
  x:num><%=vn[0]+nn[0] %></td>
  <td class=xl39 width=101 style='border-top:none;border-left:none;width:76pt'
  x:num><%=vn[1]+nn[1] %></td>
  <td class=xl39 width=98 style='border-top:none;border-left:none;width:74pt'><%=vn[2]+nn[2] %></td>
  <td class=xl39 width=87 style='border-top:none;border-left:none;width:65pt'>&nbsp;</td>
   <td class=xl39 width=98 style='border-top:none;border-left:none;width:74pt'><%=vn[4]+nn[4] %></td>
  <td class=xl39 width=91 style='border-top:none;border-left:none;width:68pt'
  x:num><%=vn[3]+nn[3] %></td>
  <td class=xl28 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=7 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=16 class=xl24 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 colspan=7 style='height:12.75pt;mso-ignore:colspan'>Công
  ty cam đoan số liệu kê khai trên là đúng và hoàn toàn chịu trách nhiệm trước
  pháp luật về số liệu đã kê khai.</td>
  <td colspan=9 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=16 class=xl24 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 colspan=16 class=xl24 style='height:12.75pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt;mso-ignore:colspan'></td>
  <td class=xl25> <font size=4 > Prepared by</font></td>
  <td class=xl24></td>
  <td class=xl25><font size=4 >Checked by</font></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl25><font size=4 >Approved by</font></td>
  <td colspan=7 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
 </tr>
 <![endif]>
</table>

</body>

</html>
