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

    
    string p_dept, p_group, p_status, p_type, p_pay_type, p_emp_id, p_work_mon,p_sal_period,p_emp_type;

    p_dept = Request["l_dept"].ToString();
    p_group = Request["l_group"].ToString();
    p_status = Request["l_status"].ToString();
    p_type = Request["l_type"].ToString();
    //p_pay_type = Request["l_pay_type"].ToString();
    p_emp_id = Request["l_emp_id"].ToString();
    p_work_mon = Request["l_work_mon"].ToString();
    string p_m_type = Request.QueryString["l_m_type"].ToString();
    p_sal_period = Request["l_sal_period"].ToString();
	p_emp_type = Request["l_Emp_Type"].ToString();
    //" and decode('" + p_m_type + "','ALL','ALL',a.MONEY_KIND)='" + p_m_type + "'" +
    
    if (p_type == "ALL")
        p_type = "=nvl(a.net_amt,0)";
    
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
    
    int pk = int.Parse(dt_Com.Rows[0][3].ToString());
    
    // danh sach nhan vien lanh tien cash
    string SQL
    = "select null as null_0, a.dept_nm as group_1, a.EMP_ID as emp_id_2, " +
        "      a.FULL_NAME as name_3, to_char(to_date(a.JOIN_DT,'yyyymmdd'),'dd-mm-yyyy') as join_dt_4 " +
        "      , a.POS_NM as pos_5,  decode('" +  p_m_type + "','01',round(nvl(a.NET_amt,0),0),round(nvl(a.NET_amt,0),0)) as net_6 " +
        "from thr_month_salary a " +
          "where a.del_if=0 and a.work_mon='" + p_work_mon + "' and nvl(pay_type,'01')='01'" +
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
        " and decode('" + p_m_type + "','ALL','ALL',a.MONEY_KIND)='" + p_m_type + "'" +    
        " and nvl(a.net_amt,0) " + p_type +
        " and decode('" + p_sal_period + "','ALL','ALL',a.sal_period)='" + p_sal_period + "'" +
		" and decode('" + p_emp_type + "','ALL','ALL',A.EMPLOYEE_TYPE)='" + p_emp_type + "'" +
        " order by 2 ";
    //Response.Write(SQL);
    //Response.End();
    DataTable dt_Emp =  CtlLib.TableReadOpen(SQL);    
    int emp_row = 0;
    if (dt_Emp.Rows.Count != 0)
        emp_row=dt_Emp.Rows.Count;
    else
    {
        Response.Write("There is no data to print");
        Response.End();
    }
    //Response.Write(emp_row+"");
    //Response.End();   
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_cash_payment_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_cash_payment_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_cash_payment_files/oledata.mso">
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
  <o:LastAuthor>Hee</o:LastAuthor>
  <o:LastPrinted>2008-09-22T02:33:00Z</o:LastPrinted>
  <o:Created>2008-09-06T07:03:32Z</o:Created>
  <o:LastSaved>2008-09-23T09:28:35Z</o:LastSaved>
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
	margin:.44in .24in .41in .2in;
	mso-header-margin:.3in;
	mso-footer-margin:.19in;}
.font12
	{color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:"Times New Roman", serif;
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
	mso-number-format:"dd\\\/mm\\\/yyyy";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl37
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
.xl38
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl39
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl40
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
.xl41
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
.xl42
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl43
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
.xl44
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
.xl45
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
.xl46
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top::none;
	border-right::none;
	border-bottom::none;
	border-left:none;}	
.xl47
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top::none;
	border-right::none;
	border-bottom::none;
	border-left:none;}
.xl48
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}		
.xl49
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
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
      <x:Scale>80</x:Scale>
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
       <x:ActiveCol>3</x:ActiveCol>
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
  <x:Formula>=Sheet1!$1:$7</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="4097"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table border=0 cellpadding=0 cellspacing=0 width=1401 style='border-collapse:
 collapse;table-layout:fixed;width:1052pt'>
 <col class=xl65 width=72 style='mso-width-source:userset;mso-width-alt:2633;
 width:54pt'>
 <col class=xl65 width=128 style='mso-width-source:userset;mso-width-alt:4681;
 width:96pt'>
 <col class=xl65 width=79 style='mso-width-source:userset;mso-width-alt:2889;
 width:59pt'>
 <col class=xl65 width=204 style='mso-width-source:userset;mso-width-alt:7460;
 width:153pt'>
 <col class=xl65 width=73 style='mso-width-source:userset;mso-width-alt:2669;
 width:55pt'>
 <col class=xl65 width=139 style='mso-width-source:userset;mso-width-alt:5083;
 width:104pt'>
 <col class=xl65 width=135 style='mso-width-source:userset;mso-width-alt:4937;
 width:101pt'>
 <col class=xl65 width=109 style='mso-width-source:userset;mso-width-alt:3986;
 width:82pt'>
 <col class=xl65 width=77 span=6 style='mso-width-source:userset;mso-width-alt:
 2816;width:58pt'>
 <col class=xl65 width=79 style='mso-width-source:userset;mso-width-alt:2889;
 width:59pt'>
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
   <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=pk%>&amp;table_name=tco_bpphoto"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:0px;margin-top:0px;width:69px;
  height:56px'><img width=69 height=56
  src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=pk%>&table_name=tco_bpphoto"
  v:shapes="_x0000_s1025"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=29 class=xl24 width=72 style='height:21.75pt;width:54pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl25 colspan=2 width=207 style='mso-ignore:colspan;width:155pt'><%=dt_Com.Rows[0][0].ToString() %></td>
  <td class=xl26 width=204 style='width:153pt'></td>
  <td class=xl28 width=73 style='width:55pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=135 style='width:101pt'></td>
  <td class=xl24 width=109 style='width:82pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=77 style='width:58pt'></td>
  <td class=xl24 width=79 style='width:59pt'></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl24 style='height:18.75pt'></td>
  <td class=xl25><%=dt_Com.Rows[0][1].ToString() %></td>
  <td class=xl24></td>
  <td class=xl26></td>
  <td class=xl29></td>
  <td class=xl24></td>
  <td colspan=8 class=xl27 style='mso-ignore:colspan'></td>
  <td class=xl24></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 class=xl24 style='height:12.0pt'></td>
  <td class=xl25>Phone :<span style='mso-spacerun:yes'>  </span><%=dt_Com.Rows[0][2].ToString() %></td>
  <td class=xl24></td>
  <td class=xl26></td>
  <td class=xl24></td>
  <td colspan=9 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl24></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=8 height=25 class=xl46 style='height:18.75pt'>SIGNNING PAYROLL IN <%=dt_Com.Rows[0][4].ToString().ToUpper() %></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=8 height=25 class=xl47 style='height:18.75pt'>BẢNG LƯƠNG KÝ NHẬN THÁNG <%=dt_Com.Rows[0][5].ToString().ToUpper() %></td>
 </tr>
 <tr class=xl31 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td rowspan=2 height=50 class=xl41 width=72 style='border-bottom:.5pt solid black;
  height:37.5pt;width:54pt'>No.<br>
    <font class="font12">STT</font></td>
  <td rowspan=2 class=xl41 width=128 style='border-bottom:.5pt solid black;
  width:96pt'>GROUP<br>
    <font class="font12">Nhóm</font></td>
  <td rowspan=2 class=xl41 width=79 style='border-bottom:.5pt solid black;
  width:59pt'>Emp ID<br>
    <font class="font12">Mã NV</font></td>
  <td rowspan=2 class=xl41 width=204 style='border-bottom:.5pt solid black;
  width:153pt'>Full Name<br>
    <font class="font12">Họ và Tên</font></td>
  <td rowspan=2 class=xl41 width=73 style='border-bottom:.5pt solid black;
  width:55pt'>Join Date<br>
    <font class="font12">Ngày vào</font></td>
  <td rowspan=2 class=xl41 width=77 style='border-bottom:.5pt solid black;
  width:58pt'>Position<br>
    <font class="font12">Chức vụ</font></td>
  <td rowspan=2 class=xl41 width=135 style='border-bottom:.5pt solid black;
  width:101pt'>Net Amount<br>
    <font class="font12">Thực lãnh</font></td>
  <td rowspan=2 class=xl41 width=109 style='border-bottom:.5pt solid black;
  width:82pt'>Sign<br>
    <font class="font12">Ký nhận</font></td>
  <td colspan=7 class=xl31 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl31 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 colspan=7 class=xl31 style='height:18.75pt;mso-ignore:colspan'></td>
 </tr>
 <%
     int stt = 1;
     double sum_net = 0;
     string class_1,class_2;
    for(int i=0; i<emp_row;i++)
    {
        if (p_m_type=="01")
        {
            class_1="xl37";
            class_2="xl40";
        }
        else
        {
           class_1="xl47";
            class_2="xl48";
        }
        sum_net += Double.Parse(dt_Emp.Rows[i][6].ToString()); 
                   
  %>
         <tr class=xl32 height=34 style='mso-height-source:userset;height:25.5pt'>
          <td height=34 class=xl33 style='height:25.5pt' x:num><%=stt++%></td>
          <td class=xl34><%=dt_Emp.Rows[i][1].ToString()%></td>
          <td class=xl35><%=dt_Emp.Rows[i][2].ToString()%></td>
          <td class=xl34 x:str><%=dt_Emp.Rows[i][3].ToString()%><span
          style='mso-spacerun:yes'> </span></td>
          <td class=xl36 ><%=dt_Emp.Rows[i][4].ToString()%></td>
          <td class=xl34><%=dt_Emp.Rows[i][5].ToString()%></td>
          <td class=xl34 style='mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";' x:num><%=dt_Emp.Rows[i][6].ToString()%> </td>
          <td class=xl37></td>
          <td colspan=7 class=xl32 style='mso-ignore:colspan'></td>
         </tr>        

 <% }   
  %>
<tr class=xl38 height=34 style='page-break-before:always;mso-height-source:
              userset;height:25.5pt'>
              <td colspan=4 height=34 class=xl43 style='border-right:.5pt solid black;
              height:25.5pt'>Total <%=emp_row %> Employee(s)</td>
              <td class=xl39>&nbsp;</td>
              <td class=xl39>&nbsp;</td>
              <td class=xl39 style='mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";' x:num><b><%=sum_net %></b></td>
              <td class=xl39>&nbsp;</td>
              <td colspan=7 class=xl38 style='mso-ignore:colspan'></td>
          </tr> 
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=72 style='width:54pt'></td>
  <td width=128 style='width:96pt'></td>
  <td width=79 style='width:59pt'></td>
  <td width=204 style='width:153pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=77 style='width:58pt'></td>
  <td width=135 style='width:101pt'></td>
  <td width=109 style='width:82pt'></td>
  <td width=77 style='width:58pt'></td>
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
