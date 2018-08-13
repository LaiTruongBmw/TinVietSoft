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
    
   
    //--------------------money code information-----------------------
    string SQL_Code
	= "select num_1,num_2 from vhr_hr_code " + 
        "where id='HR0045' " +
        "order by num_1 " ;
    //Response.Write(SQL_Code);
    //Response.End();
    DataTable dt_Code = CtlLib.TableReadOpen(SQL_Code);
    int irow_code;
    irow_code = dt_Code.Rows.Count;
    if (irow_code == 0)
    {
        Response.Write("There is no data of money code");
        Response.End();
    }
    //-----------------------ket loai tien--------------
    string sql_temp="";
    for (int i=1;i<=irow_code;i++)
    {
        sql_temp = sql_temp + ",HR_CLASSIFICATION_MONEY_DETAIL(round(SUB.BN_AMT,3)," + i.ToString() + ")";
    }
    //-------------------------main sql-------------------------------
   string SQL
	= "select sub.tco_org_nm ,  " +                                  //1
        "e.EMP_ID,  " +                                             //2
        "e.FULL_NAME,  " +                                          //3
        "round(NVL(SUB.BN_AMT,0),3)  "           ;              //54
   SQL = SQL + sql_temp  + 
        "from thr_employee e,thr_month_salary s, thr_bonus sub " +
        "where E.DEL_IF=0 " +
        "and S.DEL_IF=0 and sub.del_if=0 and round(nvl(SUB.BN_AMT,0),3)>0 " +
        "and ( e.STATUS='A' or (e.STATUS='R' and e.LEFT_DT>=sub.bn_year||'1231' )) " +
        "and E.PK not in (select R.THR_EMP_PK from thr_absence_reg r " +
        "                        where R.DEL_IF=0 " +
        "                       and sub.bn_to between R.START_DT and R.END_DT) " +
        "and S.THR_EMP_PK=e.pk " +
        "and S.WORK_MON=sub.bn_year||'12' " +
        "and E.PK=sub.thr_emp_pk "+
        "    and sub.BN_YEAR='" + l_year + "' " +
        "    and decode('" + l_group + "','ALL','" + l_group + "',e.THR_wg_PK)='" + l_group + "'  " +
        "    and decode('" + l_pay_type + "','ALL','" + l_pay_type + "',sub.PAY_TYPE)='" + l_pay_type + "'  " +
        "    and decode('" + l_m_type + "','ALL','" + l_m_type + "',sub.MONEY_KIND)='" + l_m_type + "'  " +
        "    and decode('" + l_bn_times + "','ALL','" + l_bn_times + "',sub.BN_TIMES)='" + l_bn_times + "'  " +
        "    and (e.EMP_ID like  '%'||'" + l_emp_id + "'||'%' or '" + l_emp_id + "' is null) " +
        "    and (e.TCO_org_PK in   (  " +
        "                              SELECT     g.pk  " +
        "                                    FROM tco_org g  " +
        "                                   WHERE g.del_if = 0  " +
        "                              START WITH g.pk =  " +
        "                                            DECODE ('" + l_dept + "',  " +
        "                                                    'ALL', 0,  " +
        "                                                    '" + l_dept + "'  " +
        "                                                   )  " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "            OR '" + l_dept + "' = 'ALL') order by 1 "  ;



//Response.Write(SQL);
//Response.End();
    DataTable dt_Emp = CtlLib.TableReadOpen(SQL);
    int irow_emp,icol_emp;
    irow_emp = dt_Emp.Rows.Count;
    icol_emp=dt_Emp.Columns.Count;
    if (irow_emp == 0)
    {
        Response.Write("There is no data of salary");
        Response.End();
    }
    //--------------------company information-----------------------
    string SQL_Com
    = "select  a.PARTNER_LNAME,a.ADDR1,a.PHONE_NO,a.TCO_BPPHOTO_PK, to_char(sysdate,'dd/mm/yyyy') " +
        "from tco_company a " +
        "where a.DEL_IF=0 " +
        "and a.pk in ( select tco_company_pk from  " +
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
        "and rownum=1 ";


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
<link rel=File-List href="rpt_classification_detail_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_classification_detail_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_classification_detail_files/oledata.mso">
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
  <o:LastPrinted>2008-09-29T01:54:37Z</o:LastPrinted>
  <o:Created>2008-09-06T07:03:32Z</o:Created>
  <o:LastSaved>2008-09-29T02:00:47Z</o:LastSaved>
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
	margin:.24in .24in .41in .2in;
	mso-header-margin:.18in;
	mso-footer-margin:.19in;
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
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl26
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl27
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl28
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl29
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl30
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl31
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl32
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl33
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl34
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl35
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl36
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl37
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl38
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl39
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
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl40
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl41
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl42
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl43
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl44
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl45
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl46
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
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
      <x:Scale>77</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>4</x:SplitHorizontal>
     <x:TopRowBottomPane>4</x:TopRowBottomPane>
     <x:SplitVertical>4</x:SplitVertical>
     <x:LeftColumnRightPane>4</x:LeftColumnRightPane>
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
      </x:Pane>
      <x:Pane>
       <x:Number>0</x:Number>
       <x:ActiveRow>6</x:ActiveRow>
       <x:ActiveCol>0</x:ActiveCol>
       <x:RangeSelection>$A$7:$D$7</x:RangeSelection>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
    <x:PageBreaks>
     <x:RowBreaks>
      <% 
        int irow=4;
        for (int i=0;i<irow_emp;i++)
        {
            irow++;
            if (i < irow_emp -1)                          
            {    if (!dt_Emp.Rows[i][0].ToString().Equals(dt_Emp.Rows[i + 1][0].ToString()))                            
                 {   irow++;
            %>                
            <x:RowBreak>
                <x:Row><%=irow %></x:Row>
            </x:RowBreak>
            <%    
                }   
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
  <x:WindowHeight>8715</x:WindowHeight>
  <x:WindowWidth>15360</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>255</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$4:$4</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="4097"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1790 style='border-collapse:
 collapse;table-layout:fixed;width:1343pt'>
 <col class=xl24 width=72 style='mso-width-source:userset;mso-width-alt:2633;
 width:54pt'>
 <col class=xl24 width=128 style='mso-width-source:userset;mso-width-alt:4681;
 width:96pt'>
 <col class=xl24 width=79 style='mso-width-source:userset;mso-width-alt:2889;
 width:59pt'>
 <col class=xl24 width=204 style='mso-width-source:userset;mso-width-alt:7460;
 width:153pt'>
 <col class=xl24 width=104 style='mso-width-source:userset;mso-width-alt:3803;
 width:78pt'>
  <%
    for (int i=0;i<irow_code;i++)  //chay tieu de cac cot loai tien 
    {
  %>
 <col class=xl24 width=67 style='mso-width-source:userset;mso-width-alt:2450;
 width:50pt'>
 <%} %>
 
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 width=72 style='height:21.75pt;width:54pt' align=left
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
  </v:shapetype><v:shape id="_x0000_s1025" type="#_x0000_t75" alt="" style='position:absolute;
   margin-left:0;margin-top:0;width:51.75pt;height:42pt;z-index:1'>
   <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt_Com.Rows[0][3].ToString()%>&table_name=tco_bpphoto"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:0px;margin-top:0px;width:69px;
  height:56px'><img width=69 height=56
  src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt_Com.Rows[0][3].ToString()%>&table_name=tco_bpphoto"
  v:shapes="_x0000_s1025"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=29 class=xl24 width=72 style='height:21.75pt;width:54pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl25 colspan=2 width=207 style='mso-ignore:colspan;width:155pt'><%=dt_Com.Rows[0][0].ToString()%></td>
  <td class=xl26 width=204 style='width:153pt'></td>
  <td class=xl24 width=104 style='width:78pt'></td>
  <td class=xl24 width=67 style='width:50pt'></td>
  <td class=xl28 width=71 style='width:53pt'>BONUS CLASSIFICATION OF MONEY IN
  <%=l_year%></td>
  <td class=xl24 width=63 style='width:47pt'></td>
  <td class=xl24 width=51 style='width:38pt'></td>
  <td class=xl24 width=51 style='width:38pt'></td>
  <td class=xl24 width=109 style='width:82pt'></td>
  <td class=xl24 width=109 style='width:82pt'></td>
  <td class=xl24 width=109 style='width:82pt'></td>
  <td class=xl24 width=109 style='width:82pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=79 style='width:59pt'></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl24 style='height:18.75pt'></td>
  <td class=xl25><%=dt_Com.Rows[0][1].ToString()%></td>
  <td class=xl24></td>
  <td class=xl26></td>
  <td class=xl24></td>
  <td class=xl27></td>
  <td class=xl29>PHÂN LO&#7840;I TI&#7872;N THƯỞNG NĂM <%=l_year%></td>
  <td class=xl24></td>
  <td colspan=11 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl24></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 class=xl24 style='height:15.75pt'></td>
  <td class=xl25>Phone :<span style='mso-spacerun:yes'>  </span><%=dt_Com.Rows[0][2].ToString()%></td>
  <td class=xl24></td>
  <td class=xl26></td>
  <td colspan=15 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl24></td>
 </tr>
 <tr class=xl31 height=34 style='mso-height-source:userset;height:25.5pt'>
  <td height=34 class=xl39 width=72 style='height:25.5pt;width:54pt'>No.</td>
  <td class=xl39 width=128 style='border-left:none;width:96pt'>GROUP</td>
  <td class=xl39 width=79 style='border-left:none;width:59pt'>Emp ID</td>
  <td class=xl39 width=204 style='border-left:none;width:153pt'>Full Name</td>
  <td class=xl39 width=104 style='border-left:none;width:78pt'>Net Amount</td>
 <%
    for (int i=0;i<irow_code;i++)  //chay tieu de cac cot loai tien 
    {
  %>
  <td class=xl43 width=67 style='border-left:none;width:50pt' x:num><%=dt_Code.Rows[i][1].ToString() %></td>
  <%} %>
 </tr>
 <%
    int irow_count=0;
    string cur_grp,next_grp;
    Boolean b_grp_total=false;
    double[] Group_Total=new double[irow_code+1];
    for(int j=0;j<irow_code+1;j++)
    {
        Group_Total[j]=0;
    }
    for (int i=0;i<irow_emp;i++)
    {
        irow_count++;
        cur_grp=dt_Emp.Rows[i][0].ToString() ;
        for(int j=0;j<irow_code+1;j++)
        {
            Group_Total[j]+=Double.Parse(dt_Emp.Rows[i][3+j].ToString());
        }
  %>
 <tr class=xl32 height=34 style='mso-height-source:userset;height:25.5pt'>
  <td height=34 class=xl33 style='height:25.5pt' x:num><%=irow_count %></td>
  <td class=xl34><%=dt_Emp.Rows[i][0].ToString() %></td>
  <td class=xl35><%=dt_Emp.Rows[i][1].ToString() %></td>
  <td class=xl34 x:str><%=dt_Emp.Rows[i][2].ToString() %></td>
  <td class=xl36 x:num><span style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][3].ToString() %></td>
  <% 
    for (int j=0;j<irow_code;j++) //chay cac cot loai tien 
    {
  %>
  <td class=xl35 x:num><%=dt_Emp.Rows[i][4+j].ToString() %></td>
 <% } %>
 </tr>
 
 <%
        if (i==irow_emp-1)
            b_grp_total=true;
        else
        {
            next_grp=dt_Emp.Rows[i+1][0].ToString();
            if (next_grp!=cur_grp)
                b_grp_total=true;
        }
        if (b_grp_total==true)
        {
  %>
  
 <tr class=xl37 height=34 style='page-break-before:always;mso-height-source:
  userset;height:25.5pt'>
  <td colspan=4 height=34 class=xl40 style='border-right:.5pt solid black;
  height:25.5pt'>Total <%=irow_count %> Employee(s)</td>
  <td class=xl38 x:num><span
  style='mso-spacerun:yes'> </span><%=Group_Total[0] %></td>
 <%
    for (int j=1;j<irow_code+1;j++)
    {
   %>
   <td class=xl46 x:num><%=Group_Total[j] %></td>
   <%} %>
 </tr>
 <%     
        irow_count=0;
        b_grp_total=false;
            for(int j=0;j<irow_code+1;j++)
            {
                Group_Total[j]=0;
            }
        }
    }
  %>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=72 style='width:54pt'></td>
  <td width=128 style='width:96pt'></td>
  <td width=79 style='width:59pt'></td>
  <td width=204 style='width:153pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=67 style='width:50pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=63 style='width:47pt'></td>
  <td width=51 style='width:38pt'></td>
  <td width=51 style='width:38pt'></td>
  <td width=109 style='width:82pt'></td>
  <td width=109 style='width:82pt'></td>
  <td width=109 style='width:82pt'></td>
  <td width=109 style='width:82pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=79 style='width:59pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
