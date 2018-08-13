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
    string l_group = Request.QueryString["l_group"].ToString();
    string l_pay_type = Request.QueryString["l_pay_type"].ToString();
    string l_m_type = Request.QueryString["l_m_type"].ToString();
    string l_bn_times = Request.QueryString["l_bn_times"].ToString();
    string l_emp_id = Request.QueryString["l_emp_id"].ToString();
    string l_dept = Request.QueryString["l_dept"].ToString();
    string l_year = Request.QueryString["l_year"].ToString();
    
    string SQL
    = "select te.ACCOUNT, te.FULL_NAME, case when tb.MONEY_KIND='01' then 'VND' " + 
        "            else 'USD' end, " +
        "            case when tb.MONEY_KIND='02' then round(nvl(tb.BN_AMT,0)*nvl(tb.BN_EXT_RATE,0),3)  " +
        "                else round(tb.BN_AMT,0) end as bonus_amt " +
        "           ,(select code_nm from vhr_hr_code where id='HR0020' and code=te.bank_type) "+
        "from thr_bonus tb, thr_employee te " +
        "where te.DEL_IF=0 " +
        "    and tb.DEL_IF=0 " +
        "    and tb.THR_EMP_PK = te.pk AND  tb.pay_type='02' " +//pay type = 02 : chuyen khoan ngan hang
        "    and decode('" + l_group + "','ALL','" + l_group + "',te.THR_WG_PK)='" + l_group + "'  " +
        "    and (te.bank_type in(select H.CODE from vhr_hr_code h where h.id='HR0020' AND H.NUM_1='" + l_pay_type + "')" +
        "      OR '" + l_pay_type + "'='ALL') " +
        "    and decode('" + l_m_type + "','ALL','" + l_m_type + "',tb.MONEY_KIND)='" + l_m_type + "'  " +
        "    and decode('" + l_bn_times + "','ALL','" + l_bn_times + "',tb.BN_TIMES)='" + l_bn_times + "'  " +
        "    and (te.EMP_ID like  '%'||'" + l_emp_id + "'||'%' or '" + l_emp_id + "' is null) " +
        "    and tb.BN_YEAR='" + l_year + "' " +
        "    and (te.TCO_org_PK in   (  " +
        "                              SELECT     g.pk  " +
        "                                    FROM tco_org g  " +
        "                                   WHERE g.del_if = 0  " +
        "                              START WITH g.pk =  " +
        "                                            DECODE ('" + l_dept + "',  " +
        "                                                    'ALL', 0,  " +
        "                                                    '" + l_dept + "'  " +
        "                                                   )  " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "            OR '" + l_dept + "' = 'ALL')  " +
        "order by te.FULL_NAME " ;
    //Response.Write(SQL);
    //Response.End();
    DataTable dt_emp = CtlLib.TableReadOpen(SQL);
    if(dt_emp.Rows.Count==0)
    {
        Response.Write("There is no data to show");
        Response.End();
    }

    string SQL_Com
    = "select  a.PARTNER_LNAME,a.ADDR1,a.PHONE_NO,a.TCO_BPPHOTO_PK,a.DESCRIPTION " +
        " from tco_company a " +
        " where a.DEL_IF=0 " +
        " and a.pk in ( select tco_company_pk from  " +
        "               tco_org  f " +
        "               where  f.pk IN ( " +
        "                              SELECT     g.pk " +
        "                                    FROM tco_org g " +
        "                                   WHERE g.del_if = 0 " +
        "                              START WITH g.pk = " +
        "                                            DECODE ('" + l_dept + "', " +
        "                                                    'ALL', 0, " +
        "                                                    '" + l_dept + "' " +
        "                                                   ) " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '" + l_dept + "' = 'ALL') " +
        " and rownum=1 ";

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
<link rel=File-List href="rpt_bonus_payment_bank_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_bonus_payment_bank_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_bonus_payment_bank_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Hee</o:Author>
  <o:LastAuthor>Hee Nguyen</o:LastAuthor>
  <o:LastPrinted>2008-11-25T06:22:10Z</o:LastPrinted>
  <o:Created>2008-11-25T06:21:23Z</o:Created>
  <o:LastSaved>2008-12-29T07:54:46Z</o:LastSaved>
  <o:Company>Hee Nguyen</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .21in 1.0in .24in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-page-orientation:landscape;}
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style16
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
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-size:15.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl26
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl28
	{mso-style-parent:style16;
	font-size:11.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl31
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl32
	{mso-style-parent:style0;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl33
	{mso-style-parent:style0;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl34
	{mso-style-parent:style16;
	font-style:italic;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl35
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl36
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl37
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl38
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl39
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl41
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl42
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";}
.xl43
	{mso-style-parent:style16;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";}
.xl44
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl45
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl46
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	white-space:normal;}
.xl47
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl48
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl49
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl50
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;}
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
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>1</x:ActiveRow>
       <x:RangeSelection>$A$2:$D$2</x:RangeSelection>
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
  <x:WindowHeight>12555</x:WindowHeight>
  <x:WindowWidth>19200</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>255</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=946 style='border-collapse:
 collapse;table-layout:fixed;width:710pt'>
 <col class=xl24 width=44 style='mso-width-source:userset;mso-width-alt:1609;
 width:33pt'>
 <col class=xl24 width=147 style='mso-width-source:userset;mso-width-alt:5376;
 width:110pt'>
 <col class=xl24 width=188 style='mso-width-source:userset;mso-width-alt:6875;
 width:141pt'>
 <col class=xl24 width=188 style='mso-width-source:userset;mso-width-alt:6875;
 width:141pt'>
 <col class=xl24 width=187 style='mso-width-source:userset;mso-width-alt:6838;
 width:140pt'>
 <col class=xl24 width=134 style='mso-width-source:userset;mso-width-alt:4900;
 width:101pt'>
 <col class=xl24 width=149 style='mso-width-source:userset;mso-width-alt:5449;
 width:112pt'>
 <col class=xl24 width=97 style='mso-width-source:userset;mso-width-alt:3547;
 width:73pt'>
 <tr height=22 style='height:16.5pt'>
  <td colspan=4 height=22 class=xl50 width=566 style='height:16.5pt;width:424pt'><%=dt_Com.Rows[0][0].ToString() %></td>
  <td class=xl24 width=134 style='width:101pt'></td>
  <td class=xl24 width=149 style='width:112pt'></td>
  <td class=xl24 width=97 style='width:73pt'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=4 height=22 class=xl50 style='height:16.5pt'><%=dt_Com.Rows[0][1].ToString() %></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl24 style='height:24.75pt'></td>
  <td colspan=7 class=xl46 width=902 style='width:677pt'>BONUS PAYMENT BY BANK</td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 class=xl25 style='height:18.75pt'>&nbsp;</td>
  <td class=xl25>&nbsp;</td>
  <td class=xl25>&nbsp;</td>
  <td class=xl25>&nbsp;</td>
  <td class=xl25>&nbsp;</td>
  <td class=xl25>&nbsp;</td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=45 style='mso-height-source:userset;height:33.75pt'>
  <td height=45 class=xl26 width=44 style='height:33.75pt;width:33pt'>No.</td>
  <td class=xl27 width=147 style='width:110pt'>Withdrawal from account No.</td>
  <td class=xl27 width=188 style='width:141pt'>Deposit- to - account No.</td>
  <td class=xl27 width=187 style='width:140pt'>Bank's name</td>
  <td class=xl27 width=187 style='width:140pt'>Account holder's name</td>
  <td class=xl27 width=187 style='width:101pt'>Currency</td>
  <td class=xl28 width=149 style='width:112pt' x:str="Amount"><span
  style='mso-spacerun:yes'> </span>Amount<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl29 width=97 style='width:73pt'>Comment</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td height=26 class=xl31 style='height:20.1pt'>STT</td>
  <td class=xl33>Số TK công ty</td>
  <td class=xl33>Số TK người hưởng</td>
  <td class=xl33>Tên ngân hàng</td>
  <td class=xl33>Tên người hưởng</td>
  <td class=xl33>Loại tiền</td>
  <td class=xl34 x:str="Số tiền"><span style='mso-spacerun:yes'> </span>Số
  tiền<span style='mso-spacerun:yes'> </span></td>
  <td class=xl33>Nội dung</td>
 </tr>
 <%
     double sum = 0;
     for (int i = 0; i < dt_emp.Rows.Count; i++)
     {
         sum += double.Parse(dt_emp.Rows[i][3].ToString());
  %>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl35 style='height:22.5pt' x:num><%=i+1 %></td>
  <td class=xl36><%=dt_Com.Rows[0][4].ToString() %></td>
  <td class=xl37><%=dt_emp.Rows[i][0].ToString() %></td>
  <td class=xl37><%=dt_emp.Rows[i][4].ToString() %></td>
  <td class=xl37><%=dt_emp.Rows[i][1].ToString() %></td>
  <td class=xl36><%=dt_emp.Rows[i][2].ToString() %></td>
  <td class=xl38 x:num><%=dt_emp.Rows[i][3].ToString() %></td>
  <td class=xl39 width=97 style='width:73pt'></td>
 </tr>
 <%
     } %>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=5 height=30 class=xl47 style='border-right:.5pt solid black;
  height:22.5pt'>Total</td>
  <td class=xl41>&nbsp;</td>
  <td class=xl40 x:num><%=sum %></td>
  <td class=xl41>&nbsp;</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=5 class=xl24 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl42></td>
  <td class=xl24></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl30 style='height:16.5pt'></td>
  <td class=xl32>Date:<span style='mso-spacerun:yes'>   </span><%=DateTime.Now.ToString("dd-mm-yyyy") %></td>
  <td colspan=3 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl43></td>
  <td class=xl30></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl30 style='height:16.5pt'></td>
  <td class=xl44>Prepared by</td>
  <td class=xl44>Checked by</td>
  <td class=xl44>Checked by</td>
  <td class=xl44>Checked by</td>
  <td class=xl44><span style='mso-spacerun:yes'>         </span>Approval by</td>
  <td class=xl30></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl30 style='height:16.5pt'></td>
  <td class=xl44></td>
  <td class=xl44>HRA Manager</td>
  <td class=xl44>Chief Accountant</td>
  <td class=xl44>Director/ CFO</td>
  <td class=xl44><span style='mso-spacerun:yes'>         </span>General
  Director</td>
  <td class=xl30></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl30 style='height:16.5pt'></td>
  <td class=xl44></td>
  <td class=xl24></td>
  <td colspan=3 class=xl44 style='mso-ignore:colspan'></td>
  <td class=xl30></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl30 style='height:16.5pt'></td>
  <td colspan=5 class=xl44 style='mso-ignore:colspan'></td>
  <td class=xl30></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl30 style='height:16.5pt'></td>
  <td colspan=5 class=xl44 style='mso-ignore:colspan'></td>
  <td class=xl30></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl30 style='height:16.5pt'></td>
  <td colspan=5 class=xl44 style='mso-ignore:colspan'></td>
  <td class=xl30></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl30 style='height:16.5pt'></td>
  <td colspan=5 class=xl44 style='mso-ignore:colspan'></td>
  <td class=xl30></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl30 style='height:16.5pt'></td>
  <td colspan=5 class=xl45 style='mso-ignore:colspan'></td>
  <td class=xl30></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl30 style='height:16.5pt'></td>
  <td colspan=5 class=xl45 style='mso-ignore:colspan'></td>
  <td class=xl30></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=44 style='width:33pt'></td>
  <td width=147 style='width:110pt'></td>
  <td width=188 style='width:141pt'></td>
  <td width=187 style='width:140pt'></td>
  <td width=134 style='width:101pt'></td>
  <td width=149 style='width:112pt'></td>
  <td width=97 style='width:73pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
