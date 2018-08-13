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
   
    
	string p_tco_org_pk   = Request["p_org_pk"].ToString();  
    string p_search_emp    = Request["p_emp_search"].ToString();
    string p_contract_type     = Request["p_contract_type"].ToString();
    string p_from_date_sign    = Request["p_from_dt"].ToString();
    string p_to_date_sign      = Request["p_to_dt"].ToString();
    string p_status            = Request["p_status"].ToString();
	string p_language          = Request["p_language"].ToString();
	
    string SQL = "select d.org_nm,c.workgroup_nm " + 
        "   ,a.emp_id " +
        "   ,a.full_name " +
        "   ,to_char(to_date(a.join_dt,'yyyymmdd'),'dd/mm/yyyy')  " +
        "   ,(select decode('" + p_language + "', 'ENG', code_nm, code_fnm) from vhr_hr_code where id='HR0001' and code=b.contract_type) " +
        "   ,b.contract_no " +
        "   ,b.contract_times      " +
        "   ,decode(b.contract_type,'01',TO_CHAR (TO_DATE (b.BEGIN_PROBATION, 'yyyymmdd'), 'dd/mm/yyyy'),TO_CHAR (TO_DATE (b.begin_contract, 'yyyymmdd'), 'dd/mm/yyyy')) begin_contract " +
        "   ,decode(b.contract_type,'01', TO_CHAR (TO_DATE (b.end_probation, 'yyyymmdd'), 'dd/mm/yyyy'),TO_CHAR (TO_DATE (b.end_contract, 'yyyymmdd'), 'dd/mm/yyyy')) end_contract " +
        "   ,decode(nvl(b.begin_contract,0),0,b.PRO_SAL,b.BASIC_SAL)     " +
		"   ,NVL(B.NEXT_CONTRACT,(select decode('" + p_language + "', 'ENG', code_nm, code_fnm) from vhr_hr_code h  " +
        "            where h.id='HR0001' and h.num_2=  " +
        "            (select nvl(num_2,0)+1 from vhr_hr_code g where g.id='HR0001' and g.code=b.contract_type))) a11 " +
        "   ,to_char(to_date(b.end_contract,'yyyymmdd') - nvl(g.num_3,-1),'dd/mm/yyyy')  a12" +
        "   ,(select TO_CHAR(ADD_MONTHS (to_date(b.end_contract,'yyyymmdd') - nvl(g.num_3,-1),nvl(t.num_1,0))+ nvl(t.num_3,0),'dd/mm/yyyy') from vhr_hr_code t where t.id='HR0001' and t.code=NVL(B.NEXT_CONTRACT,ct_next.code)) a13 " +
        "   from thr_employee a, thr_labour_contract b, thr_work_group c, tco_org d, vhr_hr_code g, vhr_hr_code ct_next " +
        "   where a.del_if=0 and b.del_if=0 and c.del_if=0 and d.del_if=0 " +
        "   and a.contracT_times=b.contract_times  and g.code=b.contract_type  " +
		"	and ct_next.id(+)='HR0001' and (nvl(g.num_2,0)+1)=ct_next.num_2(+) " +
        "   and a.pk=b.THR_EMPLOYEE_PK " +
        "   and a.thr_wg_pk=c.pk " +
        "   and a.tco_org_pk=d.pk " +
        "    AND (   a.tco_org_pk IN ( " +
        "                              SELECT     g.pk " +
        "                                    FROM tco_org g " +
        "                                   WHERE g.del_if = 0 " +
        "                              START WITH g.pk = " +
        "                                            DECODE ('"+ p_tco_org_pk +"', " +
        "                                                    'ALL', 0, " +
        "                                                    '"+ p_tco_org_pk +"' " +
        "                                                   ) " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org_pk +"' = 'ALL') " +
        "   and decode('"+ p_contract_type +"','ALL','ALL',a.CONTRACT_TYPE )='"+ p_contract_type +"' " +
        "    AND ('"+ p_search_emp +"' IS NULL  " +
        "                 OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('"+ p_search_emp +"')|| '%') " +
        "                 OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('"+ p_search_emp +"')|| '%') " +
        "                 OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('"+ p_search_emp +"')|| '%')) " +
        "   and (case " +
        "            when B.CONTRACT_TYPE = '01' then to_char(to_date(b.end_probation,'yyyymmdd') + 1,'yyyymmdd') " +
        "            else to_char(to_date(b.end_contract,'yyyymmdd') + 1,'yyyymmdd') " +
        "        end)       between '"+ p_from_date_sign +"' and '"+ p_to_date_sign +"' " +
        "   AND DECODE('"+ p_status +"','ALL','ALL',A.STATUS)='"+ p_status +"' " +
        "   order by d.org_nm,c.workgroup_nm,a.emp_id  " ;
    
        //Response.Write(SQL);
        //Response.End();
     
        DataTable dt_total = CtlLib.TableReadOpen(SQL);
        int irow;
        irow = dt_total.Rows.Count;

        
        if (irow == 0)
        Response.Write("There is no data");
    
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_lb_signning%20_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_lb_signning%20_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_lb_signning%20_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>EINSVINA</o:Author>
  <o:LastAuthor>Thu Hien</o:LastAuthor>
  <o:LastPrinted>2008-09-23T06:16:10Z</o:LastPrinted>
  <o:Created>2006-12-21T09:46:33Z</o:Created>
  <o:LastSaved>2008-09-24T03:30:58Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"Page &P of &N";
	margin:.28in .23in .33in .24in;
	mso-header-margin:.27in;
	mso-footer-margin:.17in;}
.font13
	{color:windowtext;
	font-size:15.0pt;
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
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl29
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl30
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl31
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl32
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl33
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl34
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:none;
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
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl36
	{mso-style-parent:style16;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl37
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl38
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl39
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl40
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl41
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl42
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl43
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl44
	{mso-style-parent:style16;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl45
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl46
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl47
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl48
	{mso-style-parent:style0;
	color:#3366FF;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl49
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl50
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
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
      <x:Scale>52</x:Scale>
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
      </x:Pane>
      <x:Pane>
       <x:Number>0</x:Number>
       <x:ActiveRow>12</x:ActiveRow>
       <x:ActiveCol>4</x:ActiveCol>
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
  <x:Formula>=Sheet1!$1:$3</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>
<table x:str border=0 cellpadding=0 cellspacing=0 width=1381 style='border-collapse:
 collapse;table-layout:fixed;width:1038pt'>
 <col class=xl24 width=38 style='mso-width-source:userset;mso-width-alt:1389;
 width:29pt'>
 <col class=xl24 width=110 style='mso-width-source:userset;mso-width-alt:4022;
 width:83pt'>
 <col class=xl24 width=116 style='mso-width-source:userset;mso-width-alt:4242;
 width:87pt'>
 <col class=xl24 width=67 style='mso-width-source:userset;mso-width-alt:2450;
 width:50pt'>
 <col class=xl24 width=194 style='mso-width-source:userset;mso-width-alt:7094;
 width:146pt'>
 <col class=xl24 width=82 style='mso-width-source:userset;mso-width-alt:2998;
 width:62pt'>
 <col class=xl24 width=100 style='mso-width-source:userset;mso-width-alt:3657;
 width:75pt'>
 <col class=xl24 width=103 style='mso-width-source:userset;mso-width-alt:3766;
 width:77pt'>
 <col class=xl24 width=52 style='mso-width-source:userset;mso-width-alt:1901;
 width:39pt'>
 <col class=xl24 width=116 style='mso-width-source:userset;mso-width-alt:4242;
 width:87pt'>
 <col class=xl24 width=109 style='mso-width-source:userset;mso-width-alt:3986;
 width:82pt'>
 <col class=xl24 width=116 style='mso-width-source:userset;mso-width-alt:4242;
 width:87pt'>
 <col class=xl24 width=109 style='mso-width-source:userset;mso-width-alt:3986;
 width:82pt'>
 <col class=xl24 width=109 style='mso-width-source:userset;mso-width-alt:3986;
 width:82pt'>
 <col class=xl24 width=84 style='mso-width-source:userset;mso-width-alt:3072;
 width:63pt'>
 <col class=xl24 width=102 style='mso-width-source:userset;mso-width-alt:3730;
 width:77pt'>
 <col class=xl24 width=108 style='mso-width-source:userset;mso-width-alt:3949;
 width:81pt'>
 <tr height=61 style='mso-height-source:userset;height:45.75pt'>
  <td colspan=15 height=61 class=xl47 width=1171 style='height:45.75pt;
  width:880pt'>PREPARATION OF SIGNNING LABOUR CONTRACT<br>
    <font class="font13">XÉT DUY&#7878;T KÝ H&#7906;P &#272;&#7890;NG</font></td>
  <td colspan=2 class=xl49 width=210 style='width:158pt'><span
  style='mso-spacerun:yes'> </span><br>
    <font class="font13"></font></td>
 </tr>
 <tr class=xl25 height=44 style='mso-height-source:userset;height:33.0pt'>
  <td height=44 class=xl26 width=38 style='height:33.0pt;width:29pt'>No.</td>
  <td class=xl27 width=110 style='width:83pt'>Department</td>
  <td class=xl27 width=116 style='width:87pt'>Group</td>
  <td class=xl27 width=67 style='width:50pt'>Emp ID</td>
  <td class=xl27 width=194 style='width:146pt'>Full Name</td>
  <td class=xl27 width=82 style='width:62pt'>Join date</td>
  <td class=xl27 width=100 style='width:75pt'>Contract kind</td>
  <td class=xl27 width=103 style='width:77pt'>Contract Number</td>
  <td class=xl27 width=52 style='width:39pt'>Times</td>
  <td class=xl27 width=116 style='width:87pt'>Start Current Contract</td>
  <td class=xl27 width=109 style='width:82pt'>End Current Contract</td>
  <td class=xl27 width=100 style='width:75pt'>Next Contract</td>
  <td class=xl27 width=100 style='width:75pt'>Start Contract</td>
  <td class=xl27 width=100 style='width:75pt'>End Contract</td>
  <td class=xl27 width=84 style='width:63pt'>Current Salary</td>
  <td class=xl27 width=102 style='width:77pt'>Signning Salary</td>
  <td class=xl27 width=108 style='width:81pt'>Sign</td>
 </tr>
 <tr class=xl25 height=44 style='mso-height-source:userset;height:33.0pt'>
  <td height=44 class=xl45 width=38 style='height:33.0pt;width:29pt'>Stt</td>
  <td class=xl46 width=110 style='width:83pt'>B&#7897; ph&#7853;n</td>
  <td class=xl46 width=116 style='width:87pt'>Nhóm</td>
  <td class=xl46 width=67 style='width:50pt'>Mã s&#7889;</td>
  <td class=xl46 width=194 style='width:146pt'>H&#7885; tên</td>
  <td class=xl46 width=82 style='width:62pt'>Ngày vào</td>
  <td class=xl46 width=100 style='width:75pt'>Lo&#7841;i h&#7907;p
  &#273;&#7891;ng</td>
  <td class=xl46 width=103 style='width:77pt'>S&#7889; h&#7907;p
  &#273;&#7891;ng</td>
  <td class=xl46 width=52 style='width:39pt'>L&#7847;n th&#7913;</td>
  <td class=xl46 width=116 style='width:87pt'>Ngày B&#7855;t &#273;&#7847;u
  H&#272; hi&#7879;n t&#7841;i</td>
  <td class=xl46 width=109 style='width:82pt'>Ngày k&#7871;t thúc H&#272;
  hi&#7879;n t&#7841;i</td>
  <td class=xl46 width=109 style='width:82pt'>Hợp đồng mới</td>
  <td class=xl46 width=109 style='width:82pt'>Ngày bắt đầu</td>
  <td class=xl46 width=109 style='width:82pt'>Ngày kết thúc</td>
  <td class=xl46 width=84 style='width:63pt'>L&#432;&#417;ng hi&#7879;n
  t&#7841;i</td>
  <td class=xl46 width=102 style='width:77pt'>L&#432;&#417;ng duy&#7879;t</td>
  <td class=xl46 width=108 style='width:81pt'>Ký tên</td>
 </tr>
 <%
 for (int i = 0; i < irow; i++) 
    {
  %>  
 <tr class=xl28 height=38 style='mso-height-source:userset;height:28.5pt'>
  <td height=38 class=xl29 style='height:28.5pt' x:num><%=i+1 %></td>
  <td class=xl30><% = dt_total.Rows[i][0].ToString()%></td>
  <td class=xl30><% = dt_total.Rows[i][1].ToString()%></td>
  <td class=xl31><% = dt_total.Rows[i][2].ToString()%></td>
  <td class=xl32><% = dt_total.Rows[i][3].ToString()%></td>
  <td class=xl33><% = dt_total.Rows[i][4].ToString()%></td>
  <td class=xl33><% = dt_total.Rows[i][5].ToString()%></td>
  <td class=xl34><% = dt_total.Rows[i][6].ToString()%></td>
  <td class=xl35 x:num><% = dt_total.Rows[i][7].ToString()%></td>
  <td class=xl33><% = dt_total.Rows[i][8].ToString()%></td>
  <td class=xl33><% = dt_total.Rows[i][9].ToString()%></td>
  <td class=xl34><% = dt_total.Rows[i][11].ToString()%></td>
  <td class=xl33><% = dt_total.Rows[i][12].ToString()%></td>
  <td class=xl33><% = dt_total.Rows[i][13].ToString()%></td>
  <td class=xl36 x:num><% = dt_total.Rows[i][10].ToString()%></td>
  <td class=xl36 x:str><span style='mso-spacerun:yes'>       </span></td>
  <td class=xl36>&nbsp;</td>
 </tr>
 <%
    }
  %>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=38 style='width:29pt'></td>
  <td width=110 style='width:83pt'></td>
  <td width=116 style='width:87pt'></td>
  <td width=67 style='width:50pt'></td>
  <td width=194 style='width:146pt'></td>
  <td width=82 style='width:62pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=103 style='width:77pt'></td>
  <td width=52 style='width:39pt'></td>
  <td width=116 style='width:87pt'></td>
  <td width=109 style='width:82pt'></td>
  <td width=84 style='width:63pt'></td>
  <td width=102 style='width:77pt'></td>
  <td width=108 style='width:81pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
