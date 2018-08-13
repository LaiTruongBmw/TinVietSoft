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
    string emp_pk,user_pk;
    emp_pk = Request["emp_pk"].ToString();
    user_pk= Session["USER_PK"].ToString();
    //-----------------information of company-----------------
    string SQL_Com
	= "select  initcap(a.PARTNER_NAME),initcap(a.PARTNER_FNAME),a.ADDR1,a.PHONE_NO,A.FAX_no " + 
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
    SQL = SQL + "        FULL_NAME A0,  ";
    SQL = SQL + "        decode(length(birth_dt),4,birth_dt,to_char(to_date(BIRTH_DT,'yyyymmdd'),'dd/mm/yyyy')) A1,  ";
    SQL = SQL + "        PLACE_BIRTH.CODE_fNM A2,  ";
    SQL = SQL + "        PERSON_ID A3,  ";
    SQL = SQL + "        PLACE_PER_ID.CODE_fNM A4,  ";
    SQL = SQL + "        PERMANENT_ADDR A5,  ";
    SQL = SQL + "        POS_TYPE.CODE_NM A6,  ";
    SQL = SQL + "        TO_CHAR(TO_DATE(JOIN_DT,'YYYYMMDD'),'DD/MM/YYYY') A7,  ";
    SQL = SQL + "        contract_type.code_fnm A8,  ";
    SQL = SQL + "        nvl(a.BASIC_SAL,0) + nvl(a.allow_amt1,0) + nvl(a.allow_amt2,0) + nvl(a.allow_amt4,0) + nvl(a.allow_amt3,0) +  nvl(a.allow_amt5,0) + nvl(a.allow_amt6,0) ";
	SQL = SQL + "        + decode(a.employee_type,'01',0,(select NVL(A.TOTAL_AMOUNT,0)  FROM THR_ALLOWANCE_MASTER A  WHERE A.DEL_IF=0 AND A.KIND='01')) ";
    SQL = SQL + "       + decode(a.employee_type,'01',0,(select NVL(A.TOTAL_AMOUNT,0)  FROM THR_ALLOWANCE_MASTER A  WHERE A.DEL_IF=0 AND A.KIND='02')) a9, " ;
    SQL = SQL + "      NVL((SELECT NVL(G.SALARY_SECURITY,'N') FROM THR_SAL_SECURITY G WHERE G.DEL_IF=0 AND rownum=1 and G.USER_PK=" + user_pk + "),'N') AS A10 ";
    SQL = SQL + "     from thr_employee a,tco_org b,thr_work_group c, ";
    SQL = SQL + "     (select code as code,code_fnm from vhr_hr_code where id='HR0021') PLACE_BIRTH, ";
    SQL = SQL + "    (select code as code,code_fnm from vhr_hr_code where id='HR0014') PLACE_PER_ID, ";
    SQL = SQL + "    (select code as code,code_fnm from vhr_hr_code where  id='HR0001') contract_type,";
    SQL = SQL + "    (select code as code,code_nm from vhr_hr_code where  id='HR0008') pos_type";
    SQL = SQL + "     where a.del_if=0 and b.del_if=0 and c.del_if=0 ";
    SQL = SQL + "     and a.thr_wg_pk=c.pk ";
    SQL = SQL + "     and a.tco_org_pk=b.pk ";
    SQL = SQL + "     AND A.PLACE_BIRTH=PLACE_BIRTH.code(+) ";
    SQL = SQL + "     AND A.PLACE_PER_ID=PLACE_PER_ID.code(+) ";
    SQL = SQL + "     and a.contract_TYPE=contract_type.code(+) ";
    SQL = SQL + "     and a.pos_TYPE=pos_type.code(+) ";
    SQL = SQL + "     and a.pk in(" + emp_pk + ")"; 
// Response.Write(SQL);
 // Response.End();
    DataTable dt_total = CtlLib.TableReadOpen(SQL);
    int irow;
    irow = dt_total.Rows.Count;
    if (irow == 0)
        Response.Write("There is no data");
    
    SQL
    = "select code_nm,char_2,char_3  " +
        "from vhr_hr_code " +
        "where id='HR0048'  and lower(char_4) ='rpt_certification.aspx'" ;
    DataTable dt_name = CtlLib.TableReadOpen(SQL);
    int irow_name;
    irow_name = dt_name.Rows.Count;
	String sname="",spos_lname="",spos_fname="";
    if (irow_name >0)
    {
         sname= dt_name.Rows[0][0].ToString();
		 spos_lname= dt_name.Rows[0][1].ToString();
		 spos_fname= dt_name.Rows[0][2].ToString();
    }
    
    
    string s_format;
 %>


<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_certification_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_certification_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_certification_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>toai</o:Author>
  <o:LastAuthor>truong</o:LastAuthor>
  <o:LastPrinted>2011-06-16T06:39:38Z</o:LastPrinted>
  <o:Created>2011-03-01T03:15:10Z</o:Created>
  <o:LastSaved>2011-06-16T06:45:19Z</o:LastSaved>
  <o:Company>vina</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.75in .7in .75in .7in;
	mso-header-margin:.3in;
	mso-footer-margin:.3in;}
.font7
	{color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"Wingdings 2", serif;
	mso-font-charset:2;}
.font8
	{color:windowtext;
	font-size:12.0pt;
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
.style21
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
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:"Normal 2";}
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
.xl25
	{mso-style-parent:style21;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style21;
	color:white;
	font-size:6.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	background:white;
	mso-pattern:auto none;}
.xl27
	{mso-style-parent:style21;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	background:white;
	mso-pattern:auto none;}
.xl28
	{mso-style-parent:style21;
	color:windowtext;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	background:white;
	mso-pattern:auto none;}
.xl29
	{mso-style-parent:style21;
	color:windowtext;
	font-weight:700;
	font-style:italic;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	background:white;
	mso-pattern:auto none;}
.xl30
	{mso-style-parent:style21;
	color:windowtext;
	font-weight:700;
	font-style:italic;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	background:white;
	mso-pattern:auto none;}
.xl31
	{mso-style-parent:style21;
	color:windowtext;
	font-style:italic;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	background:white;
	mso-pattern:auto none;}
.xl32
	{mso-style-parent:style21;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	background:white;
	mso-pattern:auto none;}
.xl33
	{mso-style-parent:style21;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	background:white;
	mso-pattern:auto none;}
.xl34
	{mso-style-parent:style21;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:right;
	background:white;
	mso-pattern:auto none;}
.xl35
	{mso-style-parent:style21;
	color:windowtext;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	background:white;
	mso-pattern:auto none;}
.xl36
	{mso-style-parent:style21;
	color:windowtext;
	font-size:12.0pt;
	font-family:"Wingdings 2", serif;
	mso-font-charset:2;
	text-align:center;
	background:white;
	mso-pattern:auto none;}
.xl37
	{mso-style-parent:style21;
	color:windowtext;
	font-size:22.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	background:white;
	mso-pattern:auto none;}
.xl38
	{mso-style-parent:style21;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	background:white;
	mso-pattern:auto none;}
.xl39
	{mso-style-parent:style21;
	color:windowtext;
	font-weight:700;
	font-style:italic;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;
	background:white;
	mso-pattern:auto none;}
.xl40
	{mso-style-parent:style21;
	color:red;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	background:white;
	mso-pattern:auto none;}
.xl41
	{mso-style-parent:style21;
	color:windowtext;
	font-weight:700;
	font-style:italic;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	background:white;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Giấy xác nhận</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>300</x:DefaultRowHeight>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>17</x:ActiveRow>
       <x:ActiveCol>11</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
    <x:PageBreaks>
     <x:RowBreaks>
      <% 
        int ibreak=0;
        for (int k=0;k<irow;k++)
        {
            if (dt_total.Rows[k][10].ToString()=="Y") 
                ibreak+=42;
            else
                ibreak+=40;
            %>
            
            <x:RowBreak>
                <x:Row><%=ibreak %></x:Row>
            </x:RowBreak>
            <%    
                
        }  
      %>
      
     </x:RowBreaks>
    </x:PageBreaks>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>7680</x:WindowHeight>
  <x:WindowWidth>10395</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>90</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=602 style='border-collapse:
 collapse;table-layout:fixed;width:452pt'>
 <col width=64 span=2 style='width:48pt'>
 <col width=98 style='mso-width-source:userset;mso-width-alt:3584;width:74pt'>
 <col width=95 style='mso-width-source:userset;mso-width-alt:3474;width:71pt'>
 <col width=89 style='mso-width-source:userset;mso-width-alt:3254;width:67pt'>
 <col width=64 span=3 style='width:48pt'>
 <%
      for (int i = 0; i < irow; i++)
      { 
  %>
 
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl26 align=right width=64 style='height:15.0pt;
  width:48pt' x:num>1336</td>
  <td class=xl25 width=64 style='width:48pt'></td>
  <td class=xl25 width=98 style='width:74pt'></td>
  <td class=xl25 width=95 style='width:71pt'></td>
  <td class=xl25 width=89 style='width:67pt'></td>
  <td class=xl25 width=64 style='width:48pt'></td>
  <td class=xl25 width=64 style='width:48pt'></td>
  <td class=xl25 width=64 style='width:48pt'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl27 style='height:15.0pt'><%=dt_Com.Rows[0][0].ToString()%></td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl27>CỘNG HÒA X<span style='display:none'>Ã HỘI CHỦ NGHĨA VIỆT NAM</span></td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl27 style='height:15.0pt'><%=dt_Com.Rows[0][2].ToString()%></td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl35>Độc lập - Tự do - Hạnh phúc</td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl27 style='height:15.75pt'>Điện thoại:<span
  style='display:none'> <%=dt_Com.Rows[0][3].ToString()%></span></td>
  <td colspan=4 class=xl25 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl36>a<font class="font8">*</font><font class="font7">b</font></td>
  <td class=xl25></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=8 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=37 style='height:27.75pt'>
  <td colspan=8 height=37 class=xl37 style='height:27.75pt'>GIẤY XÁC NHẬN</td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td colspan=8 height=21 class=xl38 style='height:15.75pt'>CERTIFICATION</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=8 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=4 style='height:15.0pt;mso-ignore:colspan'><%=dt_Com.Rows[0][0].ToString()%> xác nhận</td>
  <td colspan=4 class=xl28 style='mso-ignore:colspan'>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=4 style='height:15.0pt;mso-ignore:colspan'>(<%=dt_Com.Rows[0][1].ToString()%> Certifies that:)</td>
  <td colspan=4 class=xl28 style='mso-ignore:colspan'>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=8 class=xl28 style='height:15.0pt;mso-ignore:colspan'>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=2 style='height:15.0pt;mso-ignore:colspan'>Anh/Chị
  (Mr./Ms.):</td>
  <td class=xl28>&nbsp;</td>
  <td class=xl30><%=dt_total.Rows[i][0].ToString()%></td>
  <td colspan=4 class=xl28 style='mso-ignore:colspan'>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=3 style='height:15.0pt;mso-ignore:colspan'>Ngày,
  tháng, năm sinh (Birthday):</td>
  <td class=xl39><%=dt_total.Rows[i][1].ToString()%></td>
  <td></td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=3 style='height:15.0pt;mso-ignore:colspan'>Nơi
  sinh (Place of birth):</td>
  <td class=xl30><%=dt_total.Rows[i][2].ToString()%></td>
  <td colspan=4 class=xl28 style='mso-ignore:colspan'>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=3 style='height:15.0pt;mso-ignore:colspan'>Số
  CMND (ID Card No.):</td>
  <td class=xl30><%=dt_total.Rows[i][3].ToString()%></td>
  <td class=xl30>&nbsp;</td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=3 style='height:15.0pt;mso-ignore:colspan'>Nơi
  cấp: (Issued on):</td>
  <td class=xl30><%=dt_total.Rows[i][4].ToString()%></td>
  <td colspan=4 class=xl28 style='mso-ignore:colspan'>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=4 style='height:15.0pt;mso-ignore:colspan'>Địa
  chỉ thường trú (Permanent address):</td>
  <td colspan=4 class=xl41><%=dt_total.Rows[i][5].ToString()%></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=3 style='height:15.0pt;mso-ignore:colspan'>Chức
  vụ (Position):</td>
  <td class=xl30><%=dt_total.Rows[i][6].ToString()%></td>
  <td class=xl30>&nbsp;</td>
  <td class=xl28>&nbsp;</td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=3 style='height:15.0pt;mso-ignore:colspan'>Ngày
  vào (Date of entrance):</td>
  <td class=xl39><%=dt_total.Rows[i][7].ToString()%></td>
  <td colspan=4 style='mso-ignore:colspan'></td>
 </tr>
 <% if (dt_total.Rows[i][10].ToString()=="Y") 
   {%>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=4 style='height:15.0pt;mso-ignore:colspan'>Thời
  gian hợp đồng (Contract time):</td>
  <td colspan=4 class=xl39><%=dt_total.Rows[i][8].ToString()%></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=3 style='height:15.0pt;mso-ignore:colspan'>Mức
  lương (Salary):</td>
  <td class=xl29 x:num style='mso-number-format:"_\(* \#\,\#\#0\_\)\;_\(* \\\(\#\,\#\#0\\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";'><%=dt_total.Rows[i][9].ToString()%></td>
  <td class=xl29>&nbsp;</td>
  <td class=xl28>&nbsp;</td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <%} %>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=6 style='height:15.0pt;mso-ignore:colspan'
 >Hiện
  đang làm việc tại công ty Hyosung Việt Nam (Is working at  <span
  style='display:none'><span style='mso-spacerun:yes'> </span></span></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=2 style='height:15.0pt;mso-ignore:colspan'><%=dt_Com.Rows[0][1].ToString()%>)</td>
  <td colspan=4 class=xl28 style='mso-ignore:colspan'>&nbsp;</td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=6 class=xl28 style='height:15.0pt;mso-ignore:colspan'>&nbsp;</td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 style='height:15.0pt'>Ngày <%= DateTime.Now.Day %></td>
  <td class=xl28>tháng <%= DateTime.Now.Month %></td>
  <td class=xl28>năm <%= DateTime.Now.Year %></td>
  <td class=xl31 colspan=3 style='mso-ignore:colspan'>( Date<span
  style='mso-spacerun:yes'>  </span><%= DateTime.Now.Day %> month<span style='mso-spacerun:yes'>  
  </span><%= DateTime.Now.Month %><span style='mso-spacerun:yes'>  </span>year<span
  style='mso-spacerun:yes'>  </span><%= DateTime.Now.Year %><span style='mso-spacerun:yes'> 
  </span>)</td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=5 style='height:15.0pt;mso-ignore:colspan'
  x:str="TM Ban Giám Đốc <%=dt_Com.Rows[0][0].ToString()%> ">TM Ban Giám Đốc <%=dt_Com.Rows[0][0].ToString()%><span style='mso-spacerun:yes'> </span></td>
  <td class=xl28>&nbsp;</td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=4 style='height:15.0pt;mso-ignore:colspan'>(On
  behalf of Management of <%=dt_Com.Rows[0][1].ToString()%>)</td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'>&nbsp;</td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=6 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=6 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=6 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 colspan=6 class=xl25 style='height:15.0pt;mso-ignore:colspan'></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl32 colspan=3 style='height:15.75pt;mso-ignore:colspan'><%=sname%></td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=2 style='height:15.0pt;mso-ignore:colspan'><%=spos_lname%></td>
  <td class=xl27>&nbsp;</td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl28 colspan=2 style='height:15.0pt;mso-ignore:colspan'>(<%=spos_fname%>)</td>
  <td class=xl27>&nbsp;</td>
  <td colspan=3 class=xl25 style='mso-ignore:colspan'></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl33 colspan=2 style='height:15.0pt;mso-ignore:colspan'>Ghi
  chú (Note):</td>
  <td colspan=6 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl34 style='height:15.0pt'>♣</td>
  <td class=xl27>Giấy xác n<span style='display:none'>hận này chỉ chứng thực
  Anh/Chị là nhân viên công ty.</span></td>
  <td colspan=6 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl25 style='height:15.0pt'></td>
  <td class=xl27>(This only <span style='display:none'>certifies that Mr./Ms...
  Is the company employee.)</span></td>
  <td colspan=6 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl34 style='height:15.0pt'>♣</td>
  <td class=xl27><%=dt_Com.Rows[0][0].ToString()%><span style='display:none'> không chịu
  bất kỳ những ràng buộc pháp lý giữa đương </span></td>
  <td colspan=6 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl25 style='height:15.0pt'></td>
  <td class=xl27>sự và các cá <span style='display:none'>nhân hoặc cơ quan khác
  nếu có.</span></td>
  <td colspan=6 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl25 style='height:15.0pt'></td>
  <td class=xl27>(<%=dt_Com.Rows[0][1].ToString()%> <span style='display:none'> is not responsible
  to any legal liability between Him/Her</span></td>
  <td colspan=6 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl25 style='height:15.0pt'></td>
  <td class=xl27>and other individuals <span style='display:none'>or organizations)</span></td>
  <td colspan=6 style='mso-ignore:colspan'></td>
 </tr>
  <%        
  }%><!-- end of main row-->
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=98 style='width:74pt'></td>
  <td width=95 style='width:71pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
