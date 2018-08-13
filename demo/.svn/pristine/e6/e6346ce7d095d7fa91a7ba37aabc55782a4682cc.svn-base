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

    
    string p_dept, p_group, p_status, p_type, p_bank_type, p_emp_id, p_work_mon, p_m_type,p_sal_period,p_emp_type;


    p_dept = Request["l_dept"].ToString();
    p_group = Request["l_group"].ToString();
    p_status = Request["l_status"].ToString();
    p_type = Request["l_type"].ToString();
    p_bank_type = Request["l_pay_type"].ToString();
    p_emp_id = Request["l_emp_id"].ToString();
    p_work_mon = Request["l_work_mon"].ToString();
    p_m_type = Request.QueryString["l_m_type"].ToString();
    p_sal_period = Request["l_sal_period"].ToString();
	p_emp_type = Request["l_Emp_Type"].ToString();

    if (p_type == "ALL")
        p_type = "=nvl(a.net_vnd,0)";

    string SQL;
    SQL = " SELECT TO_CHAR(SYSDATE,'DD-MM-YYYY') AS DATE_0 ";
    SQL = SQL + "    , B.FULL_FNAME AS NAME_1 ";
    SQL = SQL + "    , a.ACCOUNT AS ACCOUNT_2 ";
    SQL = SQL + "    , a.BANK_NM AS BANK_NM ";
    SQL = SQL + "    , ROUND(a.net_vnd,3) AS NET_3 ";
    SQL = SQL + " FROM thr_month_salary a,THR_EMPLOYEE B "+
    "where a.del_if=0 AND B.DEL_IF=0 AND A.THR_EMP_PK=B.PK and a.work_mon='" + p_work_mon + "' and A.pay_type='02' " +
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
        " and (a.bank_type in(select H.CODE from vhr_hr_code h where h.id='HR0020' AND H.NUM_1='" + p_bank_type + "')" +
        "      OR '" + p_bank_type + "'='ALL') " +
        " and decode('" + p_m_type + "','ALL','ALL',a.money_kind)='" + p_m_type + "'" +
        " and decode('" + p_sal_period + "','ALL','ALL',a.sal_period)='" + p_sal_period + "'" +
		" and decode('" + p_emp_type + "','ALL','ALL',A.EMPLOYEE_TYPE)='" + p_emp_type + "'" +
        " and nvl(a.net_vnd,0) " + p_type  + 
        "order by a.dept_nm,a.thr_group_nm,a.emp_id";
    
    

    DataTable dt_Emp = CtlLib.TableReadOpen(SQL);
    int irow_emp, icol_emp;
    irow_emp = dt_Emp.Rows.Count;
    icol_emp = dt_Emp.Columns.Count;
    if (irow_emp == 0)
    {
        Response.Write("There is no data of salary");
        Response.End();
    }
 /*   else
    {
        Response.Write("Co du lieu");
        Response.End();
    }
    /**/
    //Tinh tong cac dong 
    SQL = "";
    SQL = " SELECT TO_CHAR (TO_DATE ('" + p_work_mon + "', 'yyyymm'), 'mm-yyyy') AS thang_0, ";
    SQL = SQL + "       TO_CHAR (SYSDATE, 'DD-MM-YYYY') AS ngay_1, ";
    SQL = SQL + "       SUM (ROUND (a.net_vnd, 0)) AS sum_net_3 ";
    SQL = SQL + "  FROM thr_month_salary a "+
    "where a.del_if=0 and a.work_mon='" + p_work_mon + "' and pay_type='02' " +
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
        " and decode('" + p_bank_type + "','ALL','ALL',a.bank_type)='" + p_bank_type + "'" +
        " and decode('" + p_m_type + "','ALL','ALL',a.money_kind)='" + p_m_type + "'" +
        " and decode('" + p_sal_period + "','ALL','ALL',a.sal_period)='" + p_sal_period + "'" +
		" and decode('" + p_emp_type + "','ALL','ALL',A.EMPLOYEE_TYPE)='" + p_emp_type + "'" +
        " and nvl(a.net_vnd,0) " + p_type +
        "order by a.dept_nm,a.thr_group_nm,a.emp_id";
    DataTable dt_sum = CtlLib.TableReadOpen(SQL);
    
    //Lay ten va dia chi cong ty 
    
    string SQL_Com
    = "select  a.PARTNER_LNAME,a.ADDR1,a.PHONE_NO,a.TCO_BPPHOTO_PK,to_char(to_date('" + p_work_mon + "','yyyymm'),'MON-YYYY'),to_char(to_date('" + p_work_mon + "','yyyymm'),'MM-YYYY') " +
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
  <o:Author>ty-ml</o:Author>
  <o:LastAuthor>Hee</o:LastAuthor>
  <o:LastPrinted>2008-09-22T07:47:56Z</o:LastPrinted>
  <o:Created>2008-09-22T07:28:42Z</o:Created>
  <o:LastSaved>2008-09-23T08:02:59Z</o:LastSaved>
  <o:Company>genuwin</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"Page &P of &N";
	margin:.4in .23in .35in .24in;
	mso-header-margin:.22in;
	mso-footer-margin:.17in;}
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
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl27
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl30
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl31
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;}
.xl32
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;}
.xl33
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl34
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl35
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl36
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl37
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl38
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl39
	{mso-style-parent:style0;
	font-size:15.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>330</x:DefaultRowHeight>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>7</x:SplitHorizontal>
     <x:TopRowBottomPane>7</x:TopRowBottomPane>
     <x:ActivePane>2</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
       <x:ActiveRow>6</x:ActiveRow>
       <x:ActiveCol>1</x:ActiveCol>
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
  <x:Formula>=Sheet1!$1:$7</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=704 style='border-collapse:
 collapse;table-layout:fixed;width:528pt'>
 <col class=xl24 width=112 style='mso-width-source:userset;mso-width-alt:4096;
 width:84pt'>
 <col class=xl24 width=279 style='mso-width-source:userset;mso-width-alt:6203;
 width:209pt; display:none'>
 <col class=xl24 width=279 style='mso-width-source:userset;mso-width-alt:9203;
 width:209pt'>
 <col class=xl24 width=173 style='mso-width-source:userset;mso-width-alt:8203;
 width:130pt'>
 <col class=xl24 width=173 style='mso-width-source:userset;mso-width-alt:12026;
 width:130pt'>
 <col class=xl24 width=140 style='mso-width-source:userset;mso-width-alt:4120;
 width:105pt'>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl24 colspan=3 width=391 style='height:16.5pt;mso-ignore:
  colspan;width:293pt'><%=dt_Com.Rows[0][0].ToString() %></td>
  <td class=xl24 width=173 style='width:130pt'></td>
  <td class=xl24 width=140 style='width:105pt'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl24 colspan=3 style='height:16.5pt;mso-ignore:colspan'><%=dt_Com.Rows[0][1].ToString() %></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=4 class=xl24 style='height:16.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=26 style='height:19.5pt'>
  <td colspan=5 height=26 class=xl39 style='height:19.5pt'>DANH SÁCH TRẢ LƯƠNG NHÂN VIÊN BẰNG THẺ ATM</td>
 </tr>
 <tr height=26 style='height:19.5pt'>
  <td colspan=5 height=26 class=xl39 style='height:19.5pt'>THÁNG <%=dt_sum.Rows[0][0].ToString() %></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=3 class=xl24 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl31 >Ngày:</td>
  <td class=xl32 > <%=dt_sum.Rows[0][1].ToString() %> </td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl33 style='height:22.5pt'>SỐ THỨ TỰ</td>
  <td height=30 class=xl33 style='height:22.5pt'>TÀI KHOẢN ĐI</td>
  <td class=xl33 style='border-left:none'>HỌ VÀ TÊN</td>
  <td class=xl33 style='border-left:none'>SỐ TÀI KHOẢN</td>
  <td class=xl33 style='border-left:none'>NGÂN HÀNG</td>
  <td class=xl33 style='border-left:none'>SỐ TIỀN</td>
 </tr>
 <%
     int i = 0;
     for (i = 0; i < irow_emp; i++)
     {                   
  %>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl35 style='height:22.5pt;border-top:none' x:num><%=i+1%></td>
  <td class=xl36 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl36 style='border-top:none;border-left:none'><%=dt_Emp.Rows[i][1].ToString() %></td>
  <td class=xl37 style='border-top:none;border-left:none'><%=dt_Emp.Rows[i][2].ToString() %></td>
  <td class=xl37 style='border-top:none;border-left:none'><%=dt_Emp.Rows[i][3].ToString() %></td>
  <td class=xl38 style='border-top:none;border-left:none' x:num ><%=dt_Emp.Rows[i][4].ToString() %></td>
 </tr>
 <%
     }
  %>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl33 style='height:22.5pt'>TỔNG CỘNG</td>
  <td class=xl33 style='border-left:none'>&nbsp;</td>
  <td class=xl33 style='border-left:none'>&nbsp;</td>
  <td class=xl33 style='border-left:none'>&nbsp;</td>
  <td class=xl33 style='border-left:none'>&nbsp;</td>
  <td class=xl34 style='border-left:none' x:num><b><%=dt_sum.Rows[0][2].ToString() %></b></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=4 class=xl24 style='height:16.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl24 colspan=6 style='height:16.5pt;mso-ignore:colspan'>Cam
  kết: Công ty xin chịu hoàn toàn trách nhiệm về các thông tin trên đã cung cấp cho ngân hàng</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=4 class=xl24 style='height:16.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=3 class=xl24 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl29>TỔNG GIÁM ĐỐC</td>
  <td class=xl24></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=4 class=xl24 style='height:16.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=4 class=xl24 style='height:16.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=4 class=xl24 style='height:16.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=4 class=xl24 style='height:16.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=4 class=xl24 style='height:16.5pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 colspan=3 class=xl24 style='height:18.75pt;mso-ignore:colspan'></td>
  <td class=xl30>CHO SUNG JUN</td>
  <td class=xl24></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=112 style='width:84pt'></td>
  <td width=279 style='width:209pt'></td>
  <td width=173 style='width:130pt'></td>
  <td width=140 style='width:105pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
