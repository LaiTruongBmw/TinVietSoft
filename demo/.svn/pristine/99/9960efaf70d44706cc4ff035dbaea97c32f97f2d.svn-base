<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/msword";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html 
xmlns:w="urn:schemas-microsoft-com:office:word"
xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
xmlns="http://www.w3.org/TR/REC-html40">

<%
    
    
    string emp_pk, rpt_type, p_company_pk;

    emp_pk = Request["emp_pk"].ToString();
    rpt_type = "ALL";// Request["rpt_type"].ToString();
    p_company_pk = Request["company_pk"].ToString();

    if (p_company_pk == "")
        p_company_pk = "ALL";

    string SQL_AMT
    = "SELECT NVL(A.NUM_1,0) " +
        "    FROM VHR_HR_CODE A " +
        "    WHERE A.ID='HR0043' AND A.CHAR_1= TO_CHAR(SYSDATE, 'YYYY') " +
        " and (nvl(to_char(TCO_COMPANY_PK),'" + p_company_pk + "') = '" + p_company_pk + "' or '" + p_company_pk + "' = 'ALL')  ";

    DataTable dt_amt = CtlLib.TableReadOpen(SQL_AMT);
    int social_amt = int.Parse(dt_amt.Rows[0][0].ToString());
    
    
    string  SQL
    = "select E.SOCIAL_NO social_no " +
        "        ,upper(E.FULL_NAME) full_name " +
        "        ,decode(length(E.BIRTH_DT),4,null,6,null,to_char(to_date(E.BIRTH_DT,'yyyymmdd'),'dd')) birth_dd " +
        "        ,decode(length(E.BIRTH_DT),4,null,6,to_char(to_date(E.BIRTH_DT,'yyyymm'),'mm'),to_char(to_date(E.BIRTH_DT,'yyyymmdd'),'mm')) birth_mm " +
        "        ,decode(length(E.BIRTH_DT),4,to_char(to_date(E.BIRTH_DT,'yyyy'),'yyyy'),6,to_char(to_date(E.BIRTH_DT,'yyyymm'),'yyyy'),to_char(to_date(E.BIRTH_DT,'yyyymmdd'),'yyyy')) birth_yy " +
        "        ,E.SEX sex " +        
        "        ,(select code_nm from vhr_hr_code v where id='HR0015' and v.code=E.ETHNIC_TYPE ) ethnic_type " +
        "        ,(select code_fnm from vhr_hr_code v where id='HR0009' and v.code=E.NATION ) nation " +
        "        ,(select code_nm from vhr_hr_code where id='HR0205' and code=E.BIRTH_ADDR_WARD) birth_addr_ward " +
		"        ,(select code_nm from vhr_hr_code where id='HR0204' and code=E.BIRTH_ADDR_DISTRICT) birth_addr_district " +
		"        ,(select code_nm from vhr_hr_code where id='HR0203' and code=E.BIRTH_ADDR_CITY) birth_addr_city " +
		"        ,(select nvl( " +
        "        MAX(case when F.RELATION='01' then F.FULL_NAME else null end) " +
        "        ,MAX(case when F.RELATION='02' then F.FULL_NAME else null end) " +
        "        ) father_mother " +
        "        from thr_family f where f.del_if=0 and F.THR_EMPLOYEE_PK=e.pk " +
        "        group by F.THR_EMPLOYEE_PK ) father_mother " +
        "        ,DECODE(E.NATION, '01',  E.PERSON_ID, E.PASS_PORT_NO) person_id " +
        "        ,to_char(to_date(DECODE(E.NATION, '01',E.ISSUE_DT,E.PASS_PORT_DT ),'yyyymmdd'),'dd') issue_dd " +
        "        ,to_char(to_date(DECODE(E.NATION, '01',E.ISSUE_DT,E.PASS_PORT_DT ),'yyyymmdd'),'mm') issue_mm " +
        "        ,to_char(to_date(DECODE(E.NATION, '01',E.ISSUE_DT,E.PASS_PORT_DT ),'yyyymmdd'),'yyyy') issue_yy " +
        "        ,(select code_nm from vhr_hr_code v where id='HR0014' and v.code=E.PLACE_PER_ID ) place_per_id  " +              
        "        ,E.PER_ADDR_NO per_addr_no " +
		"        ,(select code_nm from vhr_hr_code where id='HR0205' and code=E.PER_ADDR_WARD) per_addr_ward " +
		"        ,(select code_nm from vhr_hr_code where id='HR0204' and code=E.PER_ADDR_DISTRICT) per_addr_district " +
		"        ,(select code_nm from vhr_hr_code where id='HR0203' and code=E.PER_ADDR_CITY) per_addr_city " +
        "        ,E.CUR_ADDR_NO cur_addr_no " +
		"        ,(select code_nm from vhr_hr_code where id='HR0205' and code=E.CUR_ADDR_WARD) cur_addr_ward " +
		"        ,(select code_nm from vhr_hr_code where id='HR0204' and code=E.CUR_ADDR_DISTRICT) cur_addr_district " +
		"        ,(select code_nm from vhr_hr_code where id='HR0203' and code=E.CUR_ADDR_CITY) cur_addr_city " +
        "        ,E.TEL tel " +
        "        ,E.EMAIL email " +
        "        ,(select code_nm from vhr_hr_code v where id='HR0012' and v.code=E.HEALTH_PLACE  ) health_place " +                               
        "        , (select A.CONTRACT_NO from thr_labour_contract a where A.DEL_IF=0 and A.THR_EMPLOYEE_PK=E.PK and A.CONTRACT_TIMES=2) contract_no " +
        "        , (select to_char(to_date(a.BEGIN_CONTRACT,'yyyymmdd'),'dd/mm/yyyy') from thr_labour_contract a "+
        "               where A.DEL_IF=0 and A.THR_EMPLOYEE_PK=E.PK and A.CONTRACT_TIMES=2) begin_contract  " +        
        "        , (select char_2 from vhr_hr_code v, thr_labour_contract a where id='HR0001' "+ 
        "               and v.code=a.contract_type and a.contract_times=2 and a.del_if=0 and a.thr_employee_pk=e.pk ) contract_kind " +                
        "        , (select C.PARTNER_LNAME  " +
        "            from tco_company c, tco_org g  " +
        "            where C.DEL_IF=0  " +
        "                and g.PK=E.TCO_ORG_PK " +
        "                and G.DEL_IF=0 " +
        "                and G.TCO_COMPANY_PK = c.pk  ) ten_cq_dv " +
		"        , (select (C.ADDR1)  " +
        "            from tco_company c, tco_org g  " +
        "            where C.DEL_IF=0  " +
        "                and g.PK=E.TCO_ORG_PK " +
        "                and G.DEL_IF=0 " +
        "                and G.TCO_COMPANY_PK = c.pk  ) com_addr " +
        "        , (select code_knm from vhr_hr_code v where id='HR0008' and v.code=E.POS_TYPE ) pos_type  " +
        "        ,(		" +
		"		       select C.BASIC_SAL		" +
		"		       from thr_labour_contract c		" +
		"		       where C.DEL_IF = 0		" +
		"		       and C.THR_EMPLOYEE_PK = E.PK 		" +
		"		       and C.CONTRACT_TIMES = (select min(CC.CONTRACT_TIMES)	" +
		"								from thr_labour_contract cc		" +
		"								where CC.DEL_IF = 0		" +
		"								and CC.CONTRACT_TYPE<>'01'		" +
		"								and CC.THR_EMPLOYEE_PK=C.THR_EMPLOYEE_PK) 		" +
		"		   ) salary		" +
		"        ,(case when substr(BEGIN_CONTRACT,-2) > '15' then to_char(add_months(to_date(e.BEGIN_CONTRACT,'yyyymmdd'),1),'mm/yyyy')  " +
        "           else  to_char(to_date(e.BEGIN_CONTRACT,'yyyymmdd'),'mm/yyyy') end) from_mon " +
        "        ,(case when substr(BEGIN_CONTRACT,-2) > '15' then to_char(add_months(to_date(e.BEGIN_CONTRACT,'yyyymmdd'),1),'mm/yyyy')  " +
        "           else  to_char(to_date(e.BEGIN_CONTRACT,'yyyymmdd'),'mm/yyyy') end) to_mon    " +
		"        ,(select code_fnm from vhr_hr_code v where id='HR0010' and v.code=E.JOB_TYPE ) job_type " +
        "from thr_employee e " +
        "where e.del_if=0 and e.pk in (" + emp_pk + ") ";

    //Response.Write(SQL);
    //Response.End();
    DataTable dt_total = CtlLib.TableReadOpen(SQL);
    int num_row;
    num_row = dt_total.Rows.Count;
    if (num_row == 0)
    {
        Response.Write("There is no data");
        Response.End();
    }
        
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 12">
<meta name=Originator content="Microsoft Word 12">
<link rel=File-List href="rpt_TK1_TS_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_TK1_TS_files/editdata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]-->
<title>TK1-TS</title>
<o:SmartTagType namespaceuri="urn:schemas-microsoft-com:office:smarttags"
 name="country-region"/>
<o:SmartTagType namespaceuri="urn:schemas-microsoft-com:office:smarttags"
 name="place"/>
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Le Nguyen Bong</o:Author>
  <o:LastAuthor>BKC</o:LastAuthor>
  <o:Revision>2</o:Revision>
  <o:TotalTime>71</o:TotalTime>
  <o:LastPrinted>2014-11-05T03:35:00Z</o:LastPrinted>
  <o:Created>2014-11-11T15:59:00Z</o:Created>
  <o:LastSaved>2014-11-11T15:59:00Z</o:LastSaved>
  <o:Pages>6</o:Pages>
  <o:Words>405</o:Words>
  <o:Characters>2312</o:Characters>
  <o:Company>BHXH Viet Nam</o:Company>
  <o:Lines>19</o:Lines>
  <o:Paragraphs>5</o:Paragraphs>
  <o:CharactersWithSpaces>2712</o:CharactersWithSpaces>
  <o:Version>12.00</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<link rel=dataStoreItem href="rpt_TK1_TS_files/item0001.xml"
target="rpt_TK1_TS_files/props0002.xml">
<link rel=themeData href="rpt_TK1_TS_files/themedata.thmx">
<link rel=colorSchemeMapping href="rpt_TK1_TS_files/colorschememapping.xml">
<!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:TrackMoves>false</w:TrackMoves>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:DrawingGridHorizontalSpacing>6.5 pt</w:DrawingGridHorizontalSpacing>
  <w:DisplayHorizontalDrawingGridEvery>2</w:DisplayHorizontalDrawingGridEvery>
  <w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:DontUseIndentAsNumberingTabStop/>
   <w:FELineBreak11/>
   <w:WW11IndentRules/>
   <w:DontAutofitConstrainedTables/>
   <w:AutofitLikeWW11/>
   <w:HangulWidthLikeWW11/>
   <w:UseNormalStyleForList/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" LatentStyleCount="267">
  <w:LsdException Locked="false" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" Priority="99" SemiHidden="true"
   Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="99" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if !mso]><object
 classid="clsid:38481807-CA0E-42D2-BF39-B33AF135CC4D" id=ieooui></object>
<style>
st1\:*{behavior:url(#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:-536870145 1107305727 0 0 415 0;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-520081665 -1073717157 41 0 66047 0;}
@font-face
	{font-family:"\.VnTimeH";
	mso-font-alt:"Courier New";
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:1 0 0 0 19 0;}
@font-face
	{font-family:"\.VnTime";
	panose-1:2 11 114 0 0 0 0 0 0 0;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:3 0 0 0 1 0;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-1593833729 1073750107 16 0 415 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	mso-fareast-font-family:"Times New Roman";
	mso-ansi-language:EN-US;
	mso-fareast-language:EN-US;}
h1
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-next:Normal;
	margin:0in;
	margin-bottom:.0001pt;
	text-align:center;
	line-height:18.0pt;
	mso-line-height-rule:exactly;
	mso-pagination:widow-orphan;
	page-break-after:avoid;
	mso-outline-level:1;
	font-size:16.0pt;
	font-family:".VnTimeH","sans-serif";
	mso-font-kerning:0pt;
	mso-ansi-language:EN-US;
	mso-fareast-language:EN-US;
	font-weight:bold;
	mso-bidi-font-weight:normal;}
h2
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-next:Normal;
	margin-top:6.0pt;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:0in;
	margin-bottom:.0001pt;
	text-align:right;
	text-indent:.5in;
	line-height:21.0pt;
	mso-pagination:widow-orphan;
	page-break-after:avoid;
	mso-outline-level:2;
	font-size:11.0pt;
	font-family:"Times New Roman","serif";
	mso-ansi-language:EN-US;
	mso-fareast-language:EN-US;
	font-weight:bold;}
h4
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-next:Normal;
	margin:0in;
	margin-bottom:.0001pt;
	text-align:justify;
	text-indent:.5in;
	line-height:150%;
	mso-pagination:widow-orphan;
	page-break-after:avoid;
	mso-outline-level:4;
	font-size:14.0pt;
	mso-bidi-font-size:12.0pt;
	font-family:".VnTime","sans-serif";
	mso-ansi-language:EN-US;
	mso-fareast-language:EN-US;
	font-weight:bold;}
h5
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-next:Normal;
	margin:0in;
	margin-bottom:.0001pt;
	text-align:center;
	mso-pagination:widow-orphan;
	page-break-after:avoid;
	mso-outline-level:5;
	font-size:12.0pt;
	font-family:".VnTimeH","sans-serif";
	mso-ansi-language:EN-US;
	mso-fareast-language:EN-US;
	font-weight:bold;}
h6
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-next:Normal;
	margin-top:12.0pt;
	margin-right:0in;
	margin-bottom:3.0pt;
	margin-left:0in;
	mso-pagination:widow-orphan;
	mso-outline-level:6;
	font-size:11.0pt;
	font-family:"Times New Roman","serif";
	mso-ansi-language:EN-US;
	mso-fareast-language:EN-US;
	font-weight:bold;}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{mso-style-unhide:no;
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	tab-stops:center 3.0in right 6.0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	mso-fareast-font-family:"Times New Roman";
	mso-ansi-language:EN-US;
	mso-fareast-language:EN-US;}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{mso-style-unhide:no;
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	tab-stops:center 207.65pt right 415.3pt;
	font-size:14.0pt;
	mso-bidi-font-size:12.0pt;
	font-family:"Times New Roman","serif";
	mso-fareast-font-family:"Times New Roman";
	mso-ansi-language:VI;
	mso-fareast-language:VI;}
span.MsoPageNumber
	{mso-style-unhide:no;
	mso-style-parent:"";
	font-family:"Times New Roman","serif";
	mso-bidi-font-family:"Times New Roman";}
p.MsoBodyTextIndent, li.MsoBodyTextIndent, div.MsoBodyTextIndent
	{mso-style-unhide:no;
	mso-style-link:"Body Text Indent Char";
	margin-top:6.0pt;
	margin-right:0in;
	margin-bottom:4.0pt;
	margin-left:0in;
	text-align:justify;
	text-indent:.5in;
	line-height:18.0pt;
	mso-pagination:widow-orphan;
	font-size:14.0pt;
	font-family:".VnTime","sans-serif";
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"\.VnTime";
	mso-ansi-language:EN-US;
	mso-fareast-language:EN-US;}
p.MsoDocumentMap, li.MsoDocumentMap, div.MsoDocumentMap
	{mso-style-noshow:yes;
	mso-style-unhide:no;
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	background:navy;
	font-size:10.0pt;
	font-family:"Tahoma","sans-serif";
	mso-fareast-font-family:"Times New Roman";
	mso-ansi-language:EN-US;
	mso-fareast-language:EN-US;}
p
	{mso-style-noshow:yes;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	mso-fareast-font-family:"Times New Roman";
	mso-ansi-language:EN-GB;
	mso-fareast-language:EN-GB;}
span.BodyTextIndentChar
	{mso-style-name:"Body Text Indent Char";
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-parent:"";
	mso-style-link:"Body Text Indent";
	mso-ansi-font-size:14.0pt;
	mso-bidi-font-size:14.0pt;
	font-family:".VnTime","sans-serif";
	mso-ascii-font-family:"\.VnTime";
	mso-hansi-font-family:"\.VnTime";
	mso-bidi-font-family:"\.VnTime";
	mso-ansi-language:EN-US;
	mso-fareast-language:EN-US;
	mso-bidi-language:AR-SA;}
p.Char, li.Char, div.Char
	{mso-style-name:" Char";
	mso-style-unhide:no;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:8.0pt;
	margin-left:0in;
	line-height:12.0pt;
	mso-line-height-rule:exactly;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Verdana","sans-serif";
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	mso-ansi-language:EN-US;
	mso-fareast-language:EN-US;}
 /* Page Definitions */
 @page
	{mso-footnote-separator:url("rpt_TK1_TS_files/header.htm") fs;
	mso-footnote-continuation-separator:url("rpt_TK1_TS_files/header.htm") fcs;
	mso-endnote-separator:url("rpt_TK1_TS_files/header.htm") es;
	mso-endnote-continuation-separator:url("rpt_TK1_TS_files/header.htm") ecs;}
@page WordSection1
	{size:595.3pt 841.9pt;
	margin:.4in 33.85pt 36.7pt 48.25pt;
	mso-header-margin:35.3pt;
	mso-footer-margin:35.3pt;
	mso-page-numbers:1;
	mso-title-page:yes;
	mso-even-footer:url("rpt_TK1_TS_files/header.htm") ef1;
	mso-footer:url("rpt_TK1_TS_files/header.htm") f1;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
@page WordSection2
	{size:841.9pt 595.3pt;
	mso-page-orientation:landscape;
	margin:34.0pt 36.85pt 48.2pt 51.05pt;
	mso-header-margin:35.45pt;
	mso-footer-margin:35.45pt;
	mso-page-numbers:1;
	mso-title-page:yes;
	mso-even-footer:url("rpt_TK1_TS_files/header.htm") ef1;
	mso-footer:url("rpt_TK1_TS_files/header.htm") f1;
	mso-paper-source:0;}
div.WordSection2
	{page:WordSection2;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-unhide:no;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman","serif";}
table.MsoTableGrid
	{mso-style-name:"Table Grid";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-unhide:no;
	border:solid windowtext 1.0pt;
	mso-border-alt:solid windowtext .5pt;
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-border-insideh:.5pt solid windowtext;
	mso-border-insidev:.5pt solid windowtext;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman","serif";}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2050"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
  <o:rules v:ext="edit">
   <o:r id="V:Rule19" type="connector" idref="#_x0000_s1240"/>
   <o:r id="V:Rule20" type="connector" idref="#_x0000_s1241"/>
   <o:r id="V:Rule50" type="connector" idref="#_x0000_s1271"/>
   <o:r id="V:Rule51" type="connector" idref="#_x0000_s1272"/>
  </o:rules>
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=EN-US style='tab-interval:.5in'>
<p class=MsoNormal align=center style='text-align:center'><span
      style='font-size:14.0pt'>&nbsp;<o:p></o:p></span></p>
<%  int _j=0;
    for (_j = 0; _j < num_row; _j++)
    { %>

<%if (rpt_type != "3") //in two part or info or phu luc 1
  { %>
<div class=WordSection1>
<%  if (rpt_type != "2") //in two part or info
     {
 %>
<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 align=left
 width=678 style='width:508.5pt;border-collapse:collapse;mso-yfti-tbllook:1184;
 mso-table-lspace:9.0pt;margin-left:6.75pt;mso-table-rspace:9.0pt;margin-right:
 6.75pt;mso-table-anchor-vertical:paragraph;mso-table-anchor-horizontal:margin;
 mso-table-left:-12.65pt;mso-table-top:2.4pt;mso-padding-alt:0in 5.4pt 0in 5.4pt'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:35.5pt'>
  <td width=265 valign=top style='width:198.9pt;padding:0in 5.4pt 0in 5.4pt;
  height:35.5pt'>
  <p class=MsoNormal align=center style='text-align:center;mso-element:frame;
  mso-element-frame-hspace:9.0pt;mso-element-wrap:around;mso-element-anchor-vertical:
  paragraph;mso-element-anchor-horizontal:margin;mso-element-left:-12.6pt;
  mso-element-top:2.4pt;mso-height-rule:exactly'><b><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI'><o:p>&nbsp;</o:p></span></b></p>
  </td>
  <td width=413 valign=top style='width:4.3in;padding:0in 5.4pt 0in 5.4pt;
  height:35.5pt'>
  <p class=MsoNormal style='mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:-12.6pt;mso-element-top:2.4pt;mso-height-rule:exactly'><!--[if gte vml 1]><v:shapetype
   id="_x0000_t202" coordsize="21600,21600" o:spt="202" path="m,l,21600r21600,l21600,xe">
   <v:stroke joinstyle="miter"/>
   <v:path gradientshapeok="t" o:connecttype="rect"/>
  </v:shapetype><v:shape id="_x0000_s1225" type="#_x0000_t202" style='position:absolute;
   margin-left:126.45pt;margin-top:5.2pt;width:171.3pt;height:36pt;z-index:-5;
   mso-position-horizontal-relative:text;mso-position-vertical-relative:text'
   filled="f" stroked="f">
   <v:textbox style='mso-next-textbox:#_x0000_s1225' inset=".3mm,.3mm,.3mm,.3mm"/>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:-5;margin-left:169px;margin-top:7px;width:233px;
  height:52px'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td width=233 height=52 style='vertical-align:top'><![endif]><![if !mso]><span
    style='position:absolute;mso-ignore:vglayout;z-index:-5'>
    <table cellpadding=0 cellspacing=0 width="100%">
     <tr>
      <td><![endif]>
      <div v:shape="_x0000_s1225" style='padding:.8503pt .8503pt .8503pt .8503pt'
      class=shape>
      <p class=MsoNormal align=center style='text-align:center'><b><span
      style='font-size:9.0pt'>M&#7851;u s&#7889;: TK1-TS<o:p></o:p></span></b></p>
      <p class=MsoNormal align=center style='text-align:center'><i><span
      style='font-size:9.0pt'>(Ban hành kèm theo Q&#272; s&#7889;:1018/Q&#272;-BHXH<o:p></o:p></span></i></p>
      <p class=MsoNormal align=center style='text-align:center'><i><span
      style='font-size:9.0pt'><span style='mso-spacerun:yes'> </span>ngày
      10/10/2014 c&#7911;a BHXH Vi&#7879;t <st1:place w:st="on"><st1:country-region
       w:st="on">Nam</st1:country-region></st1:place>)<o:p></o:p></span></i></p>
      </div>
      <![if !mso]></td>
     </tr>
    </table>
    </span><![endif]><![if !mso & !vml]>&nbsp;<![endif]><![if !vml]></td>
   </tr>
  </table>
  </span><![endif]><b><span lang=PT-BR style='mso-ansi-language:PT-BR;
  mso-fareast-language:VI'><o:p></o:p></span></b></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:1;height:17.5pt'>
  <td width=265 valign=top style='width:198.9pt;padding:0in 5.4pt 0in 5.4pt;
  height:17.5pt'>
  <p class=MsoNormal align=center style='text-align:center;mso-element:frame;
  mso-element-frame-hspace:9.0pt;mso-element-wrap:around;mso-element-anchor-vertical:
  paragraph;mso-element-anchor-horizontal:margin;mso-element-left:-12.6pt;
  mso-element-top:2.4pt;mso-height-rule:exactly'><b><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI'>B&#7842;<u>O
  HI&#7874;M XÃ H&#7896;I VI&#7878;T N</u>AM</span></b></p>
  </td>
  <td width=413 valign=top style='width:4.3in;padding:0in 5.4pt 0in 5.4pt;
  height:17.5pt'>
  <p class=MsoNormal style='mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:-12.6pt;mso-element-top:2.4pt;mso-height-rule:exactly'><b><span
  lang=PT-BR style='mso-ansi-language:PT-BR;mso-fareast-language:VI'><span
  style='mso-spacerun:yes'>      </span>C&#7896;NG HOÀ XÃ H&#7896;I CH&#7910;
  NGH&#296;A VI&#7878;T NAM</span></b></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:2;mso-yfti-lastrow:yes;height:18.85pt'>
  <td width=265 valign=top style='width:198.9pt;padding:0in 5.4pt 0in 5.4pt;
  height:18.85pt'>
  <p class=MsoNormal align=center style='text-align:center;mso-element:frame;
  mso-element-frame-hspace:9.0pt;mso-element-wrap:around;mso-element-anchor-vertical:
  paragraph;mso-element-anchor-horizontal:margin;mso-element-left:-12.6pt;
  mso-element-top:2.4pt;mso-height-rule:exactly'><b><span lang=PT-BR
  style='font-size:11.0pt;mso-bidi-font-size:10.0pt;mso-ansi-language:PT-BR;
  mso-fareast-language:VI'><o:p>&nbsp;</o:p></span></b></p>
  </td>
  <td width=413 valign=top style='width:4.3in;padding:0in 5.4pt 0in 5.4pt;
  height:18.85pt'>
  <p class=MsoNormal style='mso-element:frame;mso-element-frame-hspace:9.0pt;
  mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  margin;mso-element-left:-12.6pt;mso-element-top:2.4pt;mso-height-rule:exactly'><b><span
  lang=PT-BR style='font-size:14.0pt;mso-bidi-font-size:11.0pt;mso-ansi-language:
  PT-BR;mso-fareast-language:VI'><span style='mso-spacerun:yes'>        </span><span
  style='mso-spacerun:yes'>      </span><span style='mso-spacerun:yes'> </span><u>&#272;&#7897;c
  l&#7853;p - T&#7921; do - H&#7841;nh phúc</u></span></b><b><u><span
  lang=PT-BR style='font-size:11.0pt;mso-bidi-font-size:10.0pt;mso-ansi-language:
  PT-BR;mso-fareast-language:VI'><o:p></o:p></span></u></b></p>
  </td>
 </tr>
</table>

<p class=MsoNormal style='mso-outline-level:1'><b><span style='font-size:15.0pt;
mso-bidi-font-size:14.0pt;mso-fareast-language:VI'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='mso-outline-level:1'><b><span style='font-size:15.0pt;
mso-bidi-font-size:14.0pt;mso-fareast-language:VI'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center;mso-outline-level:
1'><b><span lang=VI style='font-size:15.0pt;mso-bidi-font-size:14.0pt;
mso-ansi-language:VI;mso-fareast-language:VI'>T&#7900; KHAI THAM GIA <o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='margin-bottom:12.0pt;text-align:center;
mso-outline-level:1'><b><span lang=VI style='mso-ansi-language:VI;mso-fareast-language:
VI'>B&#7842;O HI&#7874;M XÃ H&#7896;I, B&#7842;O HI&#7874;M Y T&#7870;<o:p></o:p></span></b></p>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
 style='margin-left:95.4pt;border-collapse:collapse;mso-yfti-tbllook:1184;
 mso-padding-alt:0in 5.4pt 0in 5.4pt'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes;
  height:25.6pt'>
  <td width=132 style='width:99.0pt;padding:0in 5.4pt 0in 5.4pt;height:25.6pt'>
  <p class=MsoNormal><b><span lang=DE style='font-size:14.0pt;mso-bidi-font-size:
  12.0pt;mso-ansi-language:DE;mso-fareast-language:VI'>S&#7889; &#273;&#7883;nh
  danh:</span></b></p>
  </td>
  <td width=378 style='width:283.5pt;padding:0in 5.4pt 0in 5.4pt;height:25.6pt'>
  <table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 width=304
   style='width:228.35pt;border-collapse:collapse;border:none;mso-border-alt:
   solid black .5pt;mso-yfti-tbllook:1184;mso-padding-alt:0in 5.4pt 0in 5.4pt;
   mso-border-insideh:.5pt solid black;mso-border-insidev:.5pt solid black'>
   <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes;
    height:20.5pt'>
    <% int len = dt_total.Rows[_j]["social_no"].ToString().Length;
       for (int k = 0; k < len; k++)
       {%>
    <td width=28 style='width:21.35pt;border:solid black 1.0pt;mso-border-alt:
    solid black .5pt;padding:0in 5.4pt 0in 5.4pt;height:20.5pt'>
    <p class=MsoNormal align=center style='text-align:center'><span
    style='font-size:14.0pt'><%=dt_total.Rows[_j]["social_no"].ToString().Substring(k,1) %><o:p></o:p></span></p>
    </td>
    <%} %>
       <%if (len < 12)
         {
             for (int l = len; l < 12; l++)
             { %>
             <td width=28 style='width:21.35pt;border:solid black 1.0pt;mso-border-alt:
            solid black .5pt;padding:0in 5.4pt 0in 5.4pt;height:20.5pt'>
            <p class=MsoNormal align=center style='text-align:center'><span
            style='font-size:14.0pt'>&nbsp;<o:p></o:p></span></p>
            </td>
              <% }
         } %>
    
   </tr>
  </table>
  <p class=MsoNormal align=center style='text-align:center'><o:p></o:p></p>
  </td>
 </tr>
</table>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='margin-top:6.0pt;margin-right:0in;margin-bottom:6.0pt;
margin-left:0in;text-align:justify;mso-outline-level:1'><b><span lang=DE
style='font-size:13.0pt;mso-ansi-language:DE;mso-fareast-language:VI'>A. THÔNG
TIN C&#7910;A NG&#431;&#7900;I THAM GIA:</span></b><b><span lang=DE
style='font-size:13.0pt;font-family:"Arial","sans-serif";mso-ansi-language:
DE;mso-fareast-language:VI'><o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify;line-height:150%;tab-stops:202.5pt'><span
style='font-size:14.0pt;mso-bidi-font-size:12.0pt;line-height:150%;mso-fareast-language:
VI'>[01]. H&#7885; và tên </span><span
style='font-size:11.0pt;mso-bidi-font-size:12.0pt;line-height:150%;mso-fareast-language:
VI'>(vi&#7871;t ch&#7919; in hoa) </span><span style='font-size:14.0pt;
mso-bidi-font-size:12.0pt;line-height:150%;mso-fareast-language:VI'>: <span
style='mso-spacerun:yes'>    </span><b>    <%=dt_total.Rows[_j]["full_name"].ToString()%></b><o:p></o:p></span></p>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=528
 style='width:396.25pt;border-collapse:collapse;mso-yfti-tbllook:1184;
 mso-padding-alt:0in 0in 0in 0in'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes;
  height:13.9pt'>
  <td width=216 valign=top style='width:162.25pt;padding:0in 0in 0in 0in;
  height:13.9pt'>
  <p class=MsoNormal><span style='font-size:14.0pt;mso-bidi-font-size:12.0pt;
  mso-fareast-language:VI'>[02]. Ngày tháng n&#259;m sinh:</span></p>
  </td>
  <td width=312 valign=top style='width:3.25in;padding:0in 0in 0in 0in;
  height:13.9pt'>
  <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 align=left
   width=198 style='width:148.25pt;border-collapse:collapse;mso-table-overlap:
   never;mso-yfti-tbllook:1184;mso-table-lspace:9.0pt;margin-left:6.75pt;
   mso-table-rspace:9.0pt;margin-right:6.75pt;mso-table-anchor-vertical:paragraph;
   mso-table-anchor-horizontal:margin;mso-table-left:left;mso-table-top:-.1pt;
   mso-padding-alt:.7pt .7pt .7pt .7pt'>
   <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes;
    height:21.45pt'>
    <td width=42 style='width:31.25pt;padding:.7pt .7pt .7pt .7pt;height:21.45pt'>
    <table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
     align=left style='border-collapse:collapse;border:none;mso-border-alt:
     solid black .5pt;mso-table-overlap:never;mso-yfti-tbllook:1184;mso-table-lspace:
     9.0pt;margin-left:6.75pt;mso-table-rspace:9.0pt;margin-right:6.75pt;
     mso-table-anchor-vertical:paragraph;mso-table-anchor-horizontal:margin;
     mso-table-left:left;mso-table-top:-.45pt;mso-padding-alt:.7pt .7pt .7pt .7pt;
     mso-border-insideh:.5pt solid black;mso-border-insidev:.5pt solid black'>
     <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>
     <% for (int k = 0; k < 2; k++)
         {%>
      <td width=19 valign=top style='width:.2in;border:solid black 1.0pt;
      mso-border-alt:solid black .5pt;padding:.7pt .7pt .7pt .7pt'>
      <%if (dt_total.Rows[_j]["birth_dd"].ToString() != "")
        {%>
      <p class=MsoNormal align=center style='text-align:center'><span
      style='font-size:14.0pt'><%=dt_total.Rows[_j]["birth_dd"].ToString().Substring(k, 1)%><o:p></o:p></span></p>
      <% }
        else
        { %>
        <p class=MsoNormal align=center style='text-align:center'><span
      style='font-size:14.0pt'>&nbsp;<o:p></o:p></span></p>
        <%} %>
      </td>
      <%} %>      
     </tr>
    </table>
    <p class=MsoNormal align=center style='text-align:center'><o:p></o:p></p>
    </td>
    <td width=12 valign=bottom style='width:9.0pt;padding:.7pt .7pt .7pt .7pt;
    height:21.45pt'>
    <p class=MsoNormal align=center style='text-align:center'><!--[if gte vml 1]><v:shapetype
     id="_x0000_t32" coordsize="21600,21600" o:spt="32" o:oned="t" path="m,l21600,21600e"
     filled="f">
     <v:path arrowok="t" fillok="f" o:connecttype="none"/>
     <o:lock v:ext="edit" shapetype="t"/>
    </v:shapetype><v:shape id="_x0000_s1272" type="#_x0000_t32" style='position:absolute;
     left:0;text-align:left;margin-left:-.7pt;margin-top:9.8pt;width:8.25pt;
     height:0;z-index:5;mso-position-horizontal-relative:text;
     mso-position-vertical-relative:text' o:connectortype="straight"
     strokeweight="1.5pt"/><![endif]--><![if !vml]><span style='mso-ignore:
    vglayout;position:absolute;z-index:5;left:0px;margin-left:-2px;margin-top:
    12px;width:14px;height:3px'><img width=14 height=3
    src="rpt_TK1_TS_files/image001.gif" v:shapes="_x0000_s1272"></span><![endif]></p>
    </td>
    <td width=48 style='width:36.25pt;padding:.7pt .7pt .7pt .7pt;height:21.45pt'>
    <table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
     align=left width=42 style='width:31.5pt;border-collapse:collapse;
     border:none;mso-border-alt:solid black .5pt;mso-table-overlap:never;
     mso-yfti-tbllook:1184;mso-table-lspace:9.0pt;margin-left:6.75pt;
     mso-table-rspace:9.0pt;margin-right:6.75pt;mso-table-anchor-vertical:paragraph;
     mso-table-anchor-horizontal:margin;mso-table-left:left;mso-table-top:-1.3pt;
     mso-padding-alt:.7pt .7pt .7pt .7pt;mso-border-insideh:.5pt solid black;
     mso-border-insidev:.5pt solid black'>
     <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>
     <% for (int k = 0; k < 2; k++)
         {%>
      <td width=22 valign=top style='width:16.6pt;border:solid black 1.0pt;
      mso-border-alt:solid black .5pt;padding:.7pt .7pt .7pt .7pt'>
      <%if (dt_total.Rows[_j]["birth_mm"].ToString() != "")
        {%>
      <p class=MsoNormal align=center style='text-align:center'><span
      style='font-size:14.0pt'><%=dt_total.Rows[_j]["birth_mm"].ToString().Substring(k, 1)%><o:p></o:p></span></p>
      <% }
        else
        { %>
        <p class=MsoNormal align=center style='text-align:center'><span
      style='font-size:14.0pt'>&nbsp;<o:p></o:p></span></p>
        <%} %>
      </td>
      <%} %>
      
     </tr>
    </table>
    <p class=MsoNormal align=center style='text-align:center'><o:p></o:p></p>
    </td>
    <td width=18 valign=bottom style='width:13.25pt;padding:.7pt .7pt .7pt .7pt;
    height:21.45pt'>
    <p class=MsoNormal align=center style='text-align:center'><!--[if gte vml 1]><v:shape
     id="_x0000_s1271" type="#_x0000_t32" style='position:absolute;left:0;
     text-align:left;margin-left:.05pt;margin-top:10.55pt;width:8.25pt;
     height:0;z-index:4;mso-position-horizontal-relative:text;
     mso-position-vertical-relative:text' o:connectortype="straight"
     strokeweight="1.5pt"/><![endif]--><![if !vml]><span style='mso-ignore:
    vglayout;position:absolute;z-index:4;left:0px;margin-left:-1px;margin-top:
    13px;width:14px;height:3px'><img width=14 height=3
    src="rpt_TK1_TS_files/image001.gif" v:shapes="_x0000_s1271"></span><![endif]></p>
    </td>
    <td width=78 style='width:58.5pt;padding:.7pt .7pt .7pt .7pt;height:21.45pt'>
    <table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
     align=left width=73 style='width:54.7pt;border-collapse:collapse;
     border:none;mso-border-alt:solid black .5pt;mso-table-overlap:never;
     mso-yfti-tbllook:1184;mso-table-lspace:9.0pt;margin-left:6.75pt;
     mso-table-rspace:9.0pt;margin-right:6.75pt;mso-table-anchor-vertical:paragraph;
     mso-table-anchor-horizontal:margin;mso-table-left:left;mso-table-top:-1.8pt;
     mso-padding-alt:.7pt .7pt .7pt .7pt;mso-border-insideh:.5pt solid black;
     mso-border-insidev:.5pt solid black'>
     <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes;
      height:12.15pt'>
      <% for (int k = 0; k < 4; k++)
         {%>
      <td width=19 valign=top style='width:14.2pt;border:solid black 1.0pt;
      mso-border-alt:solid black .5pt;padding:.7pt .7pt .7pt .7pt;height:12.15pt'>
      <%if (dt_total.Rows[_j]["birth_yy"].ToString() != "")
        {%>
      <p class=MsoNormal align=center style='text-align:center'><span
      style='font-size:14.0pt'><%=dt_total.Rows[_j]["birth_yy"].ToString().Substring(k, 1)%><o:p></o:p></span></p>
      <% }
        else
        { %>
        <p class=MsoNormal align=center style='text-align:center'><span
      style='font-size:14.0pt'>&nbsp;<o:p></o:p></span></p>
        <%} %> 
      </td>
      <%} %> 
      
     </tr>
    </table>
    <p class=MsoNormal align=center style='text-align:center'><o:p></o:p></p>
    </td>
   </tr>
  </table>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:VI'><o:p></o:p></span></p>
  </td>
 </tr>
</table>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=666
 style='width:499.75pt;border-collapse:collapse;mso-yfti-tbllook:1184;
 mso-padding-alt:0in 0in 0in 0in'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes;
  height:16.15pt'>
  <td width=168 style='width:126.25pt;padding:0in 0in 0in 0in;height:16.15pt'>
  <p class=MsoNormal><span style='font-size:14.0pt;mso-bidi-font-size:12.0pt;
  mso-fareast-language:VI'>[03]. Giới tính: Nam<span
  style='mso-spacerun:yes'>      </span></span></p>
  </td>
  <td width=24 style='width:.25in;padding:0in 0in 0in 0in;height:16.15pt'>
  <table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 align=left
   width=22 style='width:16.8pt;border-collapse:collapse;border:none;
   mso-border-alt:solid black .5pt;mso-table-overlap:never;mso-yfti-tbllook:
   1184;mso-table-lspace:9.0pt;margin-left:6.75pt;mso-table-rspace:9.0pt;
   margin-right:6.75pt;mso-table-anchor-vertical:paragraph;mso-table-anchor-horizontal:
   margin;mso-table-left:left;mso-table-top:-.1in;mso-padding-alt:0in 5.4pt 0in 5.4pt;
   mso-border-insideh:.5pt solid black;mso-border-insidev:.5pt solid black'>
   <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>
    <td width=22 style='width:16.8pt;border:solid black 1.0pt;mso-border-alt:
    solid black .5pt;padding:0in 5.4pt 0in 5.4pt'>
	<%if (dt_total.Rows[_j]["sex"].ToString() == "M")
      { %>
    <p class=MsoNormal align=center style='text-align:center'>x<o:p></o:p></p>
	 <%}
      else
      { %>
	  <p class=MsoNormal align=center style='text-align:center'>&nbsp;<o:p></o:p></p>
	  <%} %>
    </td>
   </tr>
  </table>
  </td>
  <td width=30 style='width:22.5pt;padding:0in 0in 0in 0in;height:16.15pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-size:14.0pt'>Nữ</span></p>
  </td>
  <td width=24 style='width:.25in;padding:0in 0in 0in 0in;height:16.15pt'>
  <table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 align=left
   style='border-collapse:collapse;border:none;mso-border-alt:solid black .5pt;
   mso-table-overlap:never;mso-yfti-tbllook:1184;mso-table-lspace:9.0pt;
   margin-left:6.75pt;mso-table-rspace:9.0pt;margin-right:6.75pt;mso-table-anchor-vertical:
   paragraph;mso-table-anchor-horizontal:margin;mso-table-left:left;mso-table-top:
   -20.65pt;mso-padding-alt:0in 5.4pt 0in 5.4pt;mso-border-insideh:.5pt solid black;
   mso-border-insidev:.5pt solid black'>
   <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>
    <td width=18 style='width:13.8pt;border:solid black 1.0pt;mso-border-alt:
    solid black .5pt;padding:0in 5.4pt 0in 5.4pt'>
	<%if (dt_total.Rows[_j]["sex"].ToString()== "F")
      { %>
    <p class=MsoNormal align=center style='text-align:center'>x</p>
	<%}
      else
      { %>
	  <p class=MsoNormal align=center style='text-align:center'>&nbsp;</p>
	  <%} %>
    </td>
   </tr>
  </table>
  </td>
  <td width=420 style='width:315.0pt;padding:0in 0in 0in 0in;height:16.15pt'>
  <p class=MsoNormal style='margin-right:-16.75pt;tab-stops:85.25pt 2.0in 243.75pt'><span
  style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:VI'><span
  style='mso-spacerun:yes'> </span>[04]. Dân tộc: <%=dt_total.Rows[_j]["ethnic_type"].ToString()%><span
  style='mso-spacerun:yes'>          </span>, [05].Quốc tịch: <%=dt_total.Rows[_j]["nation"].ToString()%></span></p>
  </td>
 </tr>
</table>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='line-height:150%;tab-stops:346.5pt'><span
style='font-size:14.0pt;mso-bidi-font-size:12.0pt;line-height:150%;mso-fareast-language:
VI'>[06]. N&#417;i c&#7845;p gi&#7845;y
khai sinh (quê quán): [06.1]. Xã, ph&#432;&#7901;ng: <span style='mso-tab-count:
1'> </span><span style='mso-tab-count:1'><%=dt_total.Rows[_j]["birth_addr_ward"].ToString()%>         </span><span
style='mso-spacerun:yes'> </span><o:p></o:p></span></p>

<%if(dt_total.Rows[_j]["birth_addr_district"].ToString()=="") {%>
<p class=MsoNormal style='line-height:150%;tab-stops:121.5pt 2.5in 243.0pt 346.5pt'><span
style='font-size:14.0pt;mso-bidi-font-size:12.0pt;line-height:150%;mso-fareast-language:
VI'>[06.2]. Quận, huyện: <%=dt_total.Rows[_j]["birth_addr_district"].ToString()%><span style='mso-tab-count:3'>                                                           </span>[06.3].
Tỉnh, TP: <%=dt_total.Rows[_j]["birth_addr_city"].ToString()%><u1:p></u1:p></span></p>
<%} else {%>
<p class=MsoNormal style='line-height:150%;tab-stops:121.5pt 2.5in 243.0pt 346.5pt'><span
style='font-size:14.0pt;mso-bidi-font-size:12.0pt;line-height:150%;mso-fareast-language:
VI'>[06.2]. Quận, huyện: <%=dt_total.Rows[_j]["birth_addr_district"].ToString()%><span style='mso-tab-count:1'>                                                           </span>[06.3].
Tỉnh, TP: <%=dt_total.Rows[_j]["birth_addr_city"].ToString()%><u1:p></u1:p></span></p>
<%}%>

<p class=MsoNormal style='line-height:150%'><span style='font-size:14.0pt;
mso-bidi-font-size:12.0pt;line-height:150%;mso-fareast-language:VI'>[07].Thân nhân <o:p></o:p></span></p>

<p class=MsoNormal style='line-height:150%;tab-stops:247.5pt'><span
style='font-size:14.0pt;mso-bidi-font-size:12.0pt;line-height:150%;mso-fareast-language:
VI'>[07.1]. Cha ho&#7863;c M&#7865;
ho&#7863;c Ng&#432;&#7901;i giám h&#7897;: <%=dt_total.Rows[_j]["father_mother"].ToString()%><o:p></o:p></span></p>

<p class=MsoNormal style='line-height:150%'><span style='font-size:14.0pt;
mso-bidi-font-size:12.0pt;line-height:150%;mso-fareast-language:VI'>[07.2].Thân nhân khác: <o:p></o:p></span></p>














<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=618
 style='width:463.75pt;border-collapse:collapse;mso-yfti-tbllook:1184;
 mso-padding-alt:0in 0in 0in 0in'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes;
  height:18.4pt'>
  <td width=288 style='width:216.25pt;padding:0in 0in 0in 0in;height:18.4pt'>
  <p class=MsoNormal><span style='font-size:14.0pt;mso-bidi-font-size:12.0pt;
  mso-fareast-language:VI'>[08]. S&#7889; ch&#7913;ng minh th&#432; (H&#7897;
  chi&#7871;u):</span></p>
  </td>
  <td width=330 valign=top style='width:247.5pt;padding:0in 0in 0in 0in;
  height:18.4pt'>
  <table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 align=left
   style='border-collapse:collapse;border:none;mso-border-alt:solid black .5pt;
   mso-table-overlap:never;mso-yfti-tbllook:1184;mso-table-lspace:9.0pt;
   margin-left:6.75pt;mso-table-rspace:9.0pt;margin-right:6.75pt;mso-table-anchor-vertical:
   paragraph;mso-table-anchor-horizontal:margin;mso-table-left:left;mso-table-top:
   -.1pt;mso-padding-alt:0in .7pt 0in .7pt;mso-border-insideh:.5pt solid black;
   mso-border-insidev:.5pt solid black'>
   <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes;
    height:17.5pt'>
    <% len = dt_total.Rows[_j]["person_id"].ToString().Length;
       for (int k = 0; k < len; k++)
       {%>
    <td width=23 style='width:17.1pt;border:solid black 1.0pt;mso-border-alt:
    solid black .5pt;padding:0in .7pt 0in .7pt;height:17.5pt'>
    <p class=MsoNormal align=center style='text-align:center'><span
    style='font-size:14.0pt'><%=dt_total.Rows[_j]["person_id"].ToString().Substring(k, 1)%><o:p></o:p></span></p>
    </td>
    <%} %>
       <%if (len < 12)
         {
             for (int l = len; l < 12; l++)
             { %>
             <td width=23 style='width:17.1pt;border:solid black 1.0pt;mso-border-alt:
    solid black .5pt;padding:0in .7pt 0in .7pt;height:17.5pt'>
    <p class=MsoNormal align=center style='text-align:center'><span
    style='font-size:14.0pt'>&nbsp;<o:p></o:p></span></p>
    </td>
              <%}
			 }%>
   
   </tr>
  </table>
  <p class=MsoNormal><o:p></o:p></p>
  </td>
 </tr>
</table>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=691
 style='width:518.2pt;border-collapse:collapse;mso-yfti-tbllook:1184;
 mso-padding-alt:0in 0in 0in 0in'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes;
  height:14.8pt'>
  <td width=138 valign=top style='width:103.75pt;padding:0in 0in 0in 0in;
  height:14.8pt'>
  <p class=MsoNormal><span style='font-size:14.0pt;mso-bidi-font-size:12.0pt;
  mso-fareast-language:VI'>[08.1]. Ngày c&#7845;p:</span></p>
  </td>
  <td width=216 valign=top style='width:2.25in;padding:0in 0in 0in 0in;
  height:14.8pt'>
  <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 align=left
   width=198 style='width:148.25pt;border-collapse:collapse;mso-table-overlap:
   never;mso-yfti-tbllook:1184;mso-table-lspace:9.0pt;margin-left:6.75pt;
   mso-table-rspace:9.0pt;margin-right:6.75pt;mso-table-anchor-vertical:paragraph;
   mso-table-anchor-horizontal:margin;mso-table-left:left;mso-table-top:-.1pt;
   mso-padding-alt:.7pt .7pt .7pt .7pt'>
   <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes;
    height:21.45pt'>
    <td width=42 style='width:31.25pt;padding:.7pt .7pt .7pt .7pt;height:21.45pt'>
    <table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
     align=left style='border-collapse:collapse;border:none;mso-border-alt:
     solid black .5pt;mso-table-overlap:never;mso-yfti-tbllook:1184;mso-table-lspace:
     9.0pt;margin-left:6.75pt;mso-table-rspace:9.0pt;margin-right:6.75pt;
     mso-table-anchor-vertical:paragraph;mso-table-anchor-horizontal:margin;
     mso-table-left:left;mso-table-top:-.45pt;mso-padding-alt:.7pt .7pt .7pt .7pt;
     mso-border-insideh:.5pt solid black;mso-border-insidev:.5pt solid black'>
     <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>
     <% for (int k = 0; k < 2; k++)
         {%>
      <td width=19 valign=top style='width:.2in;border:solid black 1.0pt;
      mso-border-alt:solid black .5pt;padding:.7pt .7pt .7pt .7pt'>
	  <%if((dt_total.Rows[_j]["issue_dd"].ToString()!=""))
	  {%>
      <p class=MsoNormal align=center style='text-align:center'><span
      style='font-size:14.0pt'><%=dt_total.Rows[_j]["issue_dd"].ToString().Substring(k, 1)%><o:p></o:p></span></p>
	  <%}else
	  {%>
		<p class=MsoNormal align=center style='text-align:center'><span
      style='font-size:14.0pt'>&nbsp;<o:p></o:p></span></p>
	  <%}%>
      </td>
       <%}%>  
      
     </tr>
    </table>
    <p class=MsoNormal align=center style='text-align:center'><o:p></o:p></p>
    </td>
    <td width=12 valign=bottom style='width:9.0pt;padding:.7pt .7pt .7pt .7pt;
    height:21.45pt'>
    <p class=MsoNormal align=center style='text-align:center'><!--[if gte vml 1]><v:shape
     id="_x0000_s1241" type="#_x0000_t32" style='position:absolute;left:0;
     text-align:left;margin-left:-.7pt;margin-top:9.8pt;width:8.25pt;height:0;
     z-index:3;mso-position-horizontal-relative:text;
     mso-position-vertical-relative:text' o:connectortype="straight"
     strokeweight="1.5pt"/><![endif]--><![if !vml]><span style='mso-ignore:
    vglayout;position:absolute;z-index:3;left:0px;margin-left:-2px;margin-top:
    12px;width:14px;height:3px'><img width=14 height=3
    src="rpt_TK1_TS_files/image001.gif" v:shapes="_x0000_s1241"></span><![endif]></p>
    </td>
    <td width=48 style='width:36.25pt;padding:.7pt .7pt .7pt .7pt;height:21.45pt'>
    <table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
     align=left width=42 style='width:31.5pt;border-collapse:collapse;
     border:none;mso-border-alt:solid black .5pt;mso-table-overlap:never;
     mso-yfti-tbllook:1184;mso-table-lspace:9.0pt;margin-left:6.75pt;
     mso-table-rspace:9.0pt;margin-right:6.75pt;mso-table-anchor-vertical:paragraph;
     mso-table-anchor-horizontal:margin;mso-table-left:left;mso-table-top:-1.3pt;
     mso-padding-alt:.7pt .7pt .7pt .7pt;mso-border-insideh:.5pt solid black;
     mso-border-insidev:.5pt solid black'>
     <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>
     <% for (int k = 0; k < 2; k++)
         {%>
      <td width=22 valign=top style='width:16.6pt;border:solid black 1.0pt;
      mso-border-alt:solid black .5pt;padding:.7pt .7pt .7pt .7pt'>
	  <%if((dt_total.Rows[_j]["issue_mm"].ToString()!=""))
	  {%>
      <p class=MsoNormal align=center style='text-align:center'><span
      style='font-size:14.0pt'><%=dt_total.Rows[_j]["issue_mm"].ToString().Substring(k, 1)%><o:p></o:p></span></p>
	  <%} else { %>
	  <p class=MsoNormal align=center style='text-align:center'><span
      style='font-size:14.0pt'>&nbsp;<o:p></o:p></span></p>
	  <%} %>
      </td>
       <%}%>
      
     </tr>
    </table>
    <p class=MsoNormal align=center style='text-align:center'><o:p></o:p></p>
    </td>
    <td width=18 valign=bottom style='width:13.25pt;padding:.7pt .7pt .7pt .7pt;
    height:21.45pt'>
    <p class=MsoNormal align=center style='text-align:center'><!--[if gte vml 1]><v:shape
     id="_x0000_s1240" type="#_x0000_t32" style='position:absolute;left:0;
     text-align:left;margin-left:.95pt;margin-top:10.05pt;width:8.25pt;
     height:0;z-index:2;mso-position-horizontal-relative:text;
     mso-position-vertical-relative:text' o:connectortype="straight"
     strokeweight="1.5pt"/><![endif]--><![if !vml]><span style='mso-ignore:
    vglayout;position:absolute;z-index:2;left:0px;margin-left:0px;margin-top:
    12px;width:14px;height:3px'><img width=14 height=3
    src="rpt_TK1_TS_files/image001.gif" v:shapes="_x0000_s1240"></span><![endif]></p>
    </td>
    <td width=78 style='width:58.5pt;padding:.7pt .7pt .7pt .7pt;height:21.45pt'>
    <table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
     align=left width=73 style='width:54.7pt;border-collapse:collapse;
     border:none;mso-border-alt:solid black .5pt;mso-table-overlap:never;
     mso-yfti-tbllook:1184;mso-table-lspace:9.0pt;margin-left:6.75pt;
     mso-table-rspace:9.0pt;margin-right:6.75pt;mso-table-anchor-vertical:paragraph;
     mso-table-anchor-horizontal:margin;mso-table-left:left;mso-table-top:-1.8pt;
     mso-padding-alt:.7pt .7pt .7pt .7pt;mso-border-insideh:.5pt solid black;
     mso-border-insidev:.5pt solid black'>
     <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes;
      height:12.15pt'>
      <% for (int k = 0; k < 4; k++)
         {%>
      <td width=19 valign=top style='width:14.2pt;border:solid black 1.0pt;
      mso-border-alt:solid black .5pt;padding:.7pt .7pt .7pt .7pt;height:12.15pt'>
	  <%if((dt_total.Rows[_j]["issue_yy"].ToString()!=""))
	  {%>
      <p class=MsoNormal align=center style='text-align:center'><span
      style='font-size:14.0pt'><%=dt_total.Rows[_j]["issue_yy"].ToString().Substring(k, 1)%><o:p></o:p></span></p>
	   <%} else { %>
	   <p class=MsoNormal align=center style='text-align:center'><span
      style='font-size:14.0pt'>&nbsp;<o:p></o:p></span></p>
	   <%}%> 
      </td>
       <%}%> 
      
     </tr>
    </table>
    <p class=MsoNormal align=center style='text-align:center'><o:p></o:p></p>
    </td>
   </tr>
  </table>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:VI'><o:p></o:p></span></p>
  </td>
  <td width=337 valign=top style='width:252.45pt;padding:0in 0in 0in 0in;
  height:14.8pt'>
  <p class=MsoNormal style='tab-stops:91.25pt 246.5pt'><span style='font-size:
  14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:VI'>[08.2]. N&#417;i
  c&#7845;p: <%=dt_total.Rows[_j]["place_per_id"].ToString()%><o:p></o:p></span></p>
  </td>
 </tr>
</table>


<p class=MsoNormal style='text-align:left;line-height:29.0pt;mso-line-height-rule:exactly'><span
style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:VI'>[09].
Địa chỉ đăng ký hộ khẩu: [09.1]. Số nhà, đường phố, thôn xóm: <%=dt_total.Rows[_j]["per_addr_no"].ToString()%><u1:p></u1:p></span></p>

<%if(dt_total.Rows[_j]["per_addr_ward"].ToString()=="") {%>
<p class=MsoNormal style='line-height:29.0pt;mso-line-height-rule:exactly;
tab-stops:117.0pt 148.5pt 175.5pt 202.5pt 3.25in 274.5pt 301.5pt 4.75in 5.25in 409.5pt 441.0pt'><span
style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:VI'>[09.2].
Xã, phường: <%=dt_total.Rows[_j]["per_addr_ward"].ToString()%><span style='mso-tab-count:1'>        </span><span
style='mso-tab-count:2'>              </span><span
style='mso-spacerun:yes'> </span><%if(dt_total.Rows[_j]["per_addr_district"].ToString()=="") {%>[09.3]. Quận, huyện: <%=dt_total.Rows[_j]["per_addr_district"].ToString()%><span style='mso-tab-count:
1'>   </span><span style='mso-tab-count:2'>                  </span><span
style='mso-spacerun:yes'> </span><%} else {%>[09.3]. Quận, huyện: <%=dt_total.Rows[_j]["per_addr_district"].ToString()%><span style='mso-tab-count:
1'>   </span><span
style='mso-spacerun:yes'> </span><%}%>[09.4].Tỉnh, TP: <%=dt_total.Rows[_j]["per_addr_city"].ToString()%><u6:p></u6:p></span></p>
<%} else {%>
<p class=MsoNormal style='line-height:29.0pt;mso-line-height-rule:exactly;
tab-stops:117.0pt 148.5pt 175.5pt 202.5pt 3.25in 274.5pt 301.5pt 4.75in 5.25in 409.5pt 441.0pt'><span
style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:VI'>[09.2].
Xã, phường: <%=dt_total.Rows[_j]["per_addr_ward"].ToString()%><span style='mso-tab-count:1'>        </span> <span style='mso-tab-count:1'>        </span><span
style='mso-spacerun:yes'> </span><%if(dt_total.Rows[_j]["per_addr_district"].ToString()=="") {%>[09.3]. Quận, huyện: <%=dt_total.Rows[_j]["per_addr_district"].ToString()%><span style='mso-tab-count:
1'>   </span><span style='mso-tab-count:2'>                  </span><span
style='mso-spacerun:yes'> </span><%} else {%> [09.3]. Quận, huyện: <%=dt_total.Rows[_j]["per_addr_district"].ToString()%><span style='mso-tab-count:
1'>   </span><span
style='mso-spacerun:yes'>  </span><%}%>[09.4].Tỉnh, TP:  <%=dt_total.Rows[_j]["per_addr_city"].ToString()%><u6:p></u6:p></span></p>
<%}%>


<p class=MsoNormal style='line-height:29.0pt;mso-line-height-rule:exactly'><span
style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:VI'>[10].
Địa chỉ liên hệ (nơi sinh sống): [10.1]. Số nhà, đường phố, thôn xóm: <%=dt_total.Rows[_j]["cur_addr_no"].ToString()%><u1:p></u1:p></span></p>

<%if(dt_total.Rows[_j]["cur_addr_ward"].ToString()=="") {%>
<p class=MsoNormal style='line-height:29.0pt;mso-line-height-rule:exactly;
tab-stops:117.0pt 148.5pt 175.5pt 202.5pt 3.25in 274.5pt 301.5pt 4.75in 5.25in 409.5pt 441.0pt'><span
style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:VI'>[10.2].
Xã, phường: <%=dt_total.Rows[_j]["cur_addr_ward"].ToString()%><span style='mso-tab-count:1'>        </span><span
style='mso-tab-count:2'>              </span><span
style='mso-spacerun:yes'> </span><%if(dt_total.Rows[_j]["cur_addr_district"].ToString()=="") {%>[10.3]. Quận, huyện: <%=dt_total.Rows[_j]["cur_addr_district"].ToString()%><span style='mso-tab-count:
1'>   </span><span style='mso-tab-count:2'>                  </span><span
style='mso-spacerun:yes'> </span><%} else {%>[10.3]. Quận, huyện: <%=dt_total.Rows[_j]["cur_addr_district"].ToString()%><span style='mso-tab-count:
1'>   </span><span
style='mso-spacerun:yes'> </span><%}%>[10.4].Tỉnh, TP: <%=dt_total.Rows[_j]["cur_addr_city"].ToString()%><u6:p></u6:p></span></p>
<%} else {%>
<p class=MsoNormal style='line-height:29.0pt;mso-line-height-rule:exactly;
tab-stops:117.0pt 148.5pt 175.5pt 202.5pt 3.25in 274.5pt 301.5pt 4.75in 5.25in 409.5pt 441.0pt'><span
style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:VI'>[10.2].
Xã, phường: <%=dt_total.Rows[_j]["cur_addr_ward"].ToString()%><span style='mso-tab-count:1'>        </span> <span style='mso-tab-count:1'>        </span><span
style='mso-spacerun:yes'> </span><%if(dt_total.Rows[_j]["cur_addr_district"].ToString()=="") {%>[10.3]. Quận, huyện: <%=dt_total.Rows[_j]["cur_addr_district"].ToString()%><span style='mso-tab-count:
1'>   </span><span style='mso-tab-count:2'>                  </span><span
style='mso-spacerun:yes'> </span><%} else {%> [10.3]. Quận, huyện: <%=dt_total.Rows[_j]["cur_addr_district"].ToString()%><span style='mso-tab-count:
1'>   </span><span
style='mso-spacerun:yes'>  </span><%}%>[10.4].Tỉnh, TP:  <%=dt_total.Rows[_j]["cur_addr_city"].ToString()%><u6:p></u6:p></span></p>
<%}%>




<%if(dt_total.Rows[_j]["tel"].ToString()=="") {%>
<p class=MsoNormal style='text-align:justify;line-height:29.0pt;mso-line-height-rule:
exactly;tab-stops:2.25in 3.75in 4.75in 7.0in'><span style='font-size:14.0pt;
mso-bidi-font-size:12.0pt;mso-fareast-language:VI'>[11]. Số điện thoại liên hệ:
<%=dt_total.Rows[_j]["tel"].ToString()%><span style='mso-tab-count:
1'>         </span><span style='mso-tab-count:
1'>         </span> [12].Email: <%=dt_total.Rows[_j]["email"].ToString()%><span style='mso-tab-count:1'>                                           </span></span></p>

<%}else { %>
<p class=MsoNormal style='text-align:justify;line-height:29.0pt;mso-line-height-rule:
exactly;tab-stops:2.25in 3.75in 4.75in 7.0in'><span style='font-size:14.0pt;
mso-bidi-font-size:12.0pt;mso-fareast-language:VI'>[11]. Số điện thoại liên hệ:
<%=dt_total.Rows[_j]["tel"].ToString()%><span style='mso-tab-count:
1'>         </span> [12].Email: <%=dt_total.Rows[_j]["email"].ToString()%><span style='mso-tab-count:1'>                                           </span></span></p>

<%}%>




<p class=MsoNormal style='margin-bottom:6.0pt;text-align:justify;line-height:
29.0pt;mso-line-height-rule:exactly;tab-stops:3.5in'><span style='font-size:
14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:VI'>[13]. N&#417;i
&#273;&#259;ng ký khám ch&#7919;a b&#7879;nh ban &#273;&#7847;u: <%=dt_total.Rows[_j]["health_place"].ToString()%> <o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;margin-right:0in;margin-bottom:6.0pt;
margin-left:0in;text-align:justify;mso-outline-level:1;tab-stops:347.25pt'><b
style='mso-bidi-font-weight:normal'><span style='font-size:13.0pt;letter-spacing:
-.2pt;mso-fareast-language:VI;mso-bidi-language:HE'>B. THAM GIA B&#7842;O
HI&#7874;M XÃ H&#7896;I, B&#7842;O HI&#7874;M Y T&#7870;:<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-top:6.0pt;margin-right:0in;margin-bottom:6.0pt;
margin-left:0in;text-align:justify;mso-outline-level:1;tab-stops:347.25pt'><b
style='mso-bidi-font-weight:normal'><span style='mso-fareast-language:VI;
mso-bidi-language:HE'>I. CÙNG THAM GIA B&#7842;O HI&#7874;M XÃ H&#7896;I
B&#7854;T BU&#7896;C, B&#7842;O HI&#7874;M Y T&#7870;<o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify;line-height:29.0pt;mso-line-height-rule:
exactly;tab-stops:347.25pt'><span style='font-size:14.0pt;mso-bidi-font-size:
12.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>[14]. Quy&#7871;t
&#273;&#7883;nh tuy&#7875;n d&#7909;ng, h&#7907;p &#273;&#7891;ng lao
&#273;&#7897;ng (h&#7907;p &#273;&#7891;ng làm vi&#7879;c): s&#7889; <b> <%=dt_total.Rows[_j]["contract_no"].ToString()%> </b>
ngày <b><%=dt_total.Rows[_j]["begin_contract"].ToString()%></b></span><span style='font-size:14.0pt;
mso-bidi-font-size:12.0pt;mso-fareast-language:VI;mso-bidi-language:HE'> có
hi&#7879;u l&#7921;c t&#7915; ngày <b><%=dt_total.Rows[_j]["begin_contract"].ToString()%></b></span><span
style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:VI;
mso-bidi-language:HE'> lo&#7841;i h&#7907;p &#273;&#7891;ng <b><%=dt_total.Rows[_j]["contract_kind"].ToString()%></b><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:29.0pt;mso-line-height-rule:
exactly'><span style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:
VI;mso-bidi-language:HE'>[15]. Tên c&#417; quan, &#273;&#417;n v&#7883;: <%=dt_total.Rows[_j]["ten_cq_dv"].ToString()%><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:29.0pt;mso-line-height-rule:
exactly'><span style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:
VI;mso-bidi-language:HE'>[16]. Ch&#7913;c v&#7909;, ch&#7913;c danh ngh&#7873;,
công vi&#7879;c: <%=dt_total.Rows[_j]["pos_type"].ToString()%> <%=dt_total.Rows[_j]["job_type"].ToString()%><o:p></o:p></span></p>


<p class=MsoNormal style='text-align:justify;line-height:29.0pt;mso-line-height-rule:
exactly;tab-stops:dotted 112.5pt blank 211.5pt 400.5pt 495.0pt'><span
style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:VI;
mso-bidi-language:HE'>[17]. L&#432;&#417;ng chính: <%=dt_total.Rows[_j]["salary"].ToString()%> VND<span style='mso-tab-count:
1'>                         </span><span
style='mso-spacerun:yes'> </span>[18]. Ph&#7909; c&#7845;p: [18.1]. Ch&#7913;c
v&#7909; <span style='mso-tab-count:1 dotted'>............... </span><span
style='mso-tab-count:1'>                          </span>, <o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:29.0pt;mso-line-height-rule:
exactly;tab-stops:139.5pt 2.75in 4.25in 346.5pt 6.0in 495.0pt'><span
style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:VI;
mso-bidi-language:HE'>[18.2]. TN v&#432;&#7907;t khung <span style='mso-tab-count:
2'>                </span><span style='mso-spacerun:yes'> </span>, [18.3]. TN
ngh&#7873; <span style='mso-tab-count:1'>           </span><span
style='mso-tab-count:1'>                       </span><span
style='mso-spacerun:yes'> </span>, [18.4]. Khác <o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:29.0pt;mso-line-height-rule:
exactly;mso-outline-level:1'><b style='mso-bidi-font-weight:normal'><span
style='mso-fareast-language:VI;mso-bidi-language:HE'>II. THAM GIA B&#7842;O
HI&#7874;M XÃ H&#7896;I T&#7920; NGUY&#7878;N<o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify;line-height:29.0pt;mso-line-height-rule:
exactly'><span style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:
VI;mso-bidi-language:HE'>[19]. </span><span style='font-size:14.0pt;mso-fareast-language:
VI;mso-bidi-language:HE;mso-bidi-font-weight:bold'>M&#7913;c thu nh&#7853;p
tháng &#273;óng b&#7843;o hi&#7875;m xã h&#7897;i t&#7921; nguy&#7879;n: <o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:29.0pt;mso-line-height-rule:
exactly'><span style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:
VI;mso-bidi-language:HE'>[20]. </span><span style='font-size:14.0pt;mso-fareast-language:
VI;mso-bidi-language:HE;mso-bidi-font-weight:bold'>Ph&#432;&#417;ng th&#7913;c
&#273;óng:<span style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:29.0pt;mso-line-height-rule:
exactly;mso-outline-level:1'><b><span style='mso-fareast-language:VI;
mso-bidi-language:HE'>III. CH&#7880; THAM GIA B&#7842;O HI&#7874;M Y T&#7870;<o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify;line-height:29.0pt;mso-line-height-rule:
exactly'><span style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:
VI;mso-bidi-language:HE'>[21]. Tham gia b&#7843;o hi&#7875;m y t&#7871; theo
&#273;&#7889;i t&#432;&#7907;ng: </span><span style='font-size:14.0pt;
mso-bidi-font-size:12.0pt;mso-fareast-language:VI'><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:29.0pt;mso-line-height-rule:
exactly'><span style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:
VI;mso-bidi-language:HE'>[22]. M&#7913;c ti&#7873;n làm c&#259;n c&#7913;
&#273;óng b&#7843;o hi&#7875;m y t&#7871;: <o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:29.0pt;mso-line-height-rule:
exactly'><span style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-fareast-language:
VI;mso-bidi-language:HE'>[23]. </span><span style='font-size:14.0pt;mso-fareast-language:
VI;mso-bidi-language:HE;mso-bidi-font-weight:bold'>Ph&#432;&#417;ng th&#7913;c
&#273;óng: <o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:2.0pt;text-align:justify;line-height:150%'><span
style='font-size:14.0pt;mso-bidi-font-size:12.0pt;line-height:150%;mso-fareast-language:
VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
 style='border-collapse:collapse;mso-yfti-tbllook:480;mso-padding-alt:0in 5.4pt 0in 5.4pt'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>
  <td width=347 valign=top style='width:260.5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='text-align:justify'><span style='font-size:14.0pt;
  mso-bidi-font-size:12.0pt;mso-fareast-language:VI;mso-bidi-language:HE;
  mso-bidi-font-style:italic'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='margin-top:2.0pt;text-align:justify'><span lang=SV
  style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-ansi-language:SV;
  mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='margin-top:2.0pt;text-align:justify'><span lang=SV
  style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-ansi-language:SV;
  mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='margin-top:2.0pt;text-align:justify'><span lang=SV
  style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-ansi-language:SV;
  mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='margin-top:2.0pt;text-align:justify'><span lang=SV
  style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-ansi-language:SV;
  mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='margin-top:2.0pt;text-align:justify'><span lang=SV
  style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-ansi-language:SV;
  mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='margin-top:2.0pt;text-align:justify'><span lang=SV
  style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-ansi-language:SV;
  mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=347 valign=top style='width:260.55pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='text-align:center'><span lang=SV
  style='font-size:14.0pt;mso-ansi-language:SV;mso-fareast-language:VI;
  mso-bidi-language:HE;mso-bidi-font-weight:bold'>Tôi cam &#273;oan nh&#7919;ng
  n&#7897;i dung kê khai là &#273;úng và ch&#7883;u trách nhi&#7879;m
  tr&#432;&#7899;c pháp lu&#7853;t v&#7873; nh&#7919;ng n&#7897;i dung &#273;ã
  kê khai.<o:p></o:p></span></p>
  <p class=MsoNormal align=center style='text-align:center'><i><span lang=SV
  style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-ansi-language:SV;
  mso-fareast-language:VI;mso-bidi-language:HE'>.........., ngày ....... tháng
  ....... n&#259;m ...........<o:p></o:p></span></i></p>
  <p class=MsoNormal align=center style='text-align:center'><b><span lang=SV
  style='font-size:14.0pt;mso-ansi-language:SV;mso-fareast-language:VI;
  mso-bidi-language:HE'>Ng&#432;&#7901;i khai<o:p></o:p></span></b></p>
  <p class=MsoNormal align=center style='text-align:center'><i><span lang=SV
  style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-ansi-language:SV;
  mso-fareast-language:VI;mso-bidi-language:HE'>(Ký, ghi rõ h&#7885; tên)<o:p></o:p></span></i></p>
  <p class=MsoNormal style='margin-top:2.0pt;text-align:justify'><span lang=SV
  style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-ansi-language:SV;
  mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='margin-top:2.0pt;text-align:justify'><span lang=SV
  style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-ansi-language:SV;
  mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='margin-top:2.0pt;text-align:justify'><span lang=SV
  style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-ansi-language:SV;
  mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='margin-top:2.0pt;text-align:justify'><span lang=SV
  style='font-size:14.0pt;mso-bidi-font-size:12.0pt;mso-ansi-language:SV;
  mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal align=center style='text-align:center'><b><span lang=SV
  style='font-size:14.0pt;mso-ansi-language:SV;mso-fareast-language:VI;
  mso-bidi-language:HE'><%=dt_total.Rows[_j]["full_name"].ToString()%><o:p></o:p></span></b></p>
  
  </td>
 </tr>
</table>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='margin-top:3.0pt;margin-right:0in;margin-bottom:6.0pt;
margin-left:0in'><span lang=SV style='mso-ansi-language:SV'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-top:3.0pt;margin-right:0in;margin-bottom:6.0pt;
margin-left:0in'><span lang=SV style='mso-ansi-language:SV'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-top:3.0pt;margin-right:0in;margin-bottom:6.0pt;
margin-left:0in'><span lang=SV style='mso-ansi-language:SV'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-top:3.0pt;margin-right:0in;margin-bottom:6.0pt;
margin-left:0in'><span lang=SV style='mso-ansi-language:SV'><o:p>&nbsp;</o:p></span></p>



<%
if ((rpt_type == "1") && (_j == num_row - 1))//nhan vien cuoi cung 
{ 
         %>
         
<span lang=SV style='font-size:12.0pt;font-family:"Times New Roman","serif";
mso-fareast-font-family:"Times New Roman";mso-ansi-language:SV;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA'>
</span>
         <%
}
else
{   
  %>
    
<span lang=SV style='font-size:12.0pt;font-family:"Times New Roman","serif";
mso-fareast-font-family:"Times New Roman";mso-ansi-language:SV;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA'><br clear=all style='mso-special-character:line-break;
page-break-before:always'>
</span>
<% 
}    
%>
<p class=MsoNormal style='margin-top:3.0pt;margin-right:0in;margin-bottom:6.0pt;
margin-left:0in'><span lang=SV style='mso-ansi-language:SV'><o:p>&nbsp;</o:p></span></p>





<% } // het trang two part or info%>

<%  if (rpt_type != "1") //in two part hoac phu luc
     {
 %>

<p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
margin-bottom:6.0pt;margin-left:0in;text-align:center'><b><span lang=SV
style='font-size:14.0pt;mso-ansi-language:SV;mso-fareast-language:VI;
mso-bidi-language:HE'>PH&#7908; L&#7908;C: TH&#7900;I GIAN LÀM VI&#7878;C CÓ
&#272;ÓNG BHXH <o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
margin-bottom:6.0pt;margin-left:0in;text-align:center'><b><span lang=PT-BR
style='font-size:14.0pt;mso-ansi-language:PT-BR;mso-fareast-language:VI;
mso-bidi-language:HE'>CH&#431;A H&#431;&#7902;NG M&#7896;T L&#7846;N</span></b><span
lang=PT-BR style='font-size:14.0pt;mso-ansi-language:PT-BR;mso-fareast-language:
VI;mso-bidi-language:HE;mso-bidi-font-weight:bold'><o:p></o:p></span></p>

<p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
style='font-size:14.0pt;mso-ansi-language:PT-BR;mso-fareast-language:VI;
mso-bidi-language:HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 width=676
 style='width:507.0pt;margin-left:5.4pt;border-collapse:collapse;border:none;
 mso-border-alt:solid windowtext .5pt;mso-yfti-tbllook:480;mso-padding-alt:
 0in 5.4pt 0in 5.4pt;mso-border-insideh:.5pt solid windowtext;mso-border-insidev:
 .5pt solid windowtext'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes'>
  <td width=54 rowspan=2 style='width:40.15pt;border:solid windowtext 1.0pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><b><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE'>T&#7915; tháng n&#259;m<o:p></o:p></span></b></p>
  </td>
  <td width=59 rowspan=2 style='width:44.35pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><b><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE'>&#272;&#7871;n tháng n&#259;m<o:p></o:p></span></b></p>
  </td>
  <td width=373 rowspan=2 style='width:279.5pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><b><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE'>Di&#7877;n gi&#7843;i<o:p></o:p></span></b></p>
  </td>
  <td width=68 rowspan=2 style='width:51.35pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><b><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE'>C&#259;n c&#7913; &#273;óng<o:p></o:p></span></b></p>
  </td>
  <td width=122 colspan=2 valign=top style='width:91.65pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><b><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE'>T&#7927; l&#7879; &#273;óng (%)<o:p></o:p></span></b></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:1'>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><b><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE'>BHXH<o:p></o:p></span></b></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><b><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE'>BHTN<o:p></o:p></span></b></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:2'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><b><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE'>1<o:p></o:p></span></b></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><b><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE'>2<o:p></o:p></span></b></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><b><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE'>3<o:p></o:p></span></b></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><b><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE'>4<o:p></o:p></span></b></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><b><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE'>5<o:p></o:p></span></b></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><b><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE'>6<o:p></o:p></span></b></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:3'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:4'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:5'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:6'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:7'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:8'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:9'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:10'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:11'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:12'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:13'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:14'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:15'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:16'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:17'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:18'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:19'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:20'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:21'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:22'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:23'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:24'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:25'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:26'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:27;mso-yfti-lastrow:yes'>
  <td width=54 valign=top style='width:40.15pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=59 valign=top style='width:44.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=373 valign=top style='width:279.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=68 valign=top style='width:51.35pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=62 valign=top style='width:46.15pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=61 valign=top style='width:45.5pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0in;
  margin-bottom:6.0pt;margin-left:0in;text-align:center'><span lang=PT-BR
  style='mso-ansi-language:PT-BR;mso-fareast-language:VI;mso-bidi-language:
  HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
</table>

</div>

<%
    if (_j == num_row - 1)//nhan vien cuoi cung 
     { 
         %>
         
<b><span lang=PT-BR style='font-size:14.0pt;font-family:"Times New Roman","serif";
mso-fareast-font-family:"Times New Roman";mso-ansi-language:PT-BR;mso-fareast-language:
VI;mso-bidi-language:HE'>
</span></b>
         <%
     }
     else
     {   
  %>
    
<b><span lang=PT-BR style='font-size:14.0pt;font-family:"Times New Roman","serif";
mso-fareast-font-family:"Times New Roman";mso-ansi-language:PT-BR;mso-fareast-language:
VI;mso-bidi-language:HE'><br clear=all style='page-break-before:always;
mso-break-type:section-break'>
</span></b>
<% 
     }
    
%>
<% } // het trang two part or info%>

<% } //hết trang two part or info or phu luc 1%>






<%  if (rpt_type == "3") //in chi phan phu luc 2
    {
 %>

<div class=WordSection2>

<p class=MsoNormal align=center style='margin-top:3.0pt;text-align:center'><b><span
lang=PT-BR style='font-size:14.0pt;mso-ansi-language:PT-BR;mso-fareast-language:
VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='margin-top:3.0pt;text-align:center'><b><span
lang=PT-BR style='font-size:14.0pt;mso-ansi-language:PT-BR;mso-fareast-language:
VI;mso-bidi-language:HE'>PH&#7908; L&#7908;C: NG&#431;&#7900;I CÙNG THAM GIA B&#7842;O
HI&#7874;M Y T&#7870;<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='margin-top:3.0pt;text-align:center'><span
lang=PT-BR style='font-size:14.0pt;mso-ansi-language:PT-BR;mso-fareast-language:
VI;mso-bidi-language:HE;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 width=1055
 style='width:791.4pt;border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;
 mso-yfti-tbllook:480;mso-padding-alt:0in 5.4pt 0in 5.4pt;mso-border-insideh:
 .5pt solid windowtext;mso-border-insidev:.5pt solid windowtext'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:30.65pt'>
  <td width=33 rowspan=2 style='width:24.85pt;border:solid windowtext 1.0pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:30.65pt'>
  <p class=MsoNormal align=center style='text-align:center'><span lang=PT-BR
  style='font-size:14.0pt;mso-ansi-language:PT-BR;mso-fareast-language:VI;
  mso-bidi-language:HE'>S&#7889; TT<o:p></o:p></span></p>
  </td>
  <td width=126 rowspan=2 style='width:94.55pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:30.65pt'>
  <p class=MsoNormal align=center style='text-align:center'><span lang=PT-BR
  style='font-size:14.0pt;mso-ansi-language:PT-BR;mso-fareast-language:VI;
  mso-bidi-language:HE'>H&#7885; và tên<o:p></o:p></span></p>
  </td>
  <td width=104 rowspan=2 style='width:78.0pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:30.65pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>Ngày
  tháng n&#259;m sinh<o:p></o:p></span></p>
  </td>
  <td width=48 rowspan=2 style='width:.5in;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:30.65pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>N&#7919;
  (X)<o:p></o:p></span></p>
  </td>
  <td width=80 rowspan=2 style='width:60.0pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:30.65pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>Mã
  s&#7889;<o:p></o:p></span></p>
  </td>
  <td width=80 rowspan=2 style='width:60.0pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:30.65pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>Quan
  h&#7879;<o:p></o:p></span></p>
  </td>
  <td width=208 rowspan=2 style='width:156.0pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:30.65pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>&#272;&#7883;a
  ch&#7881; th&#432;&#7901;ng trú <o:p></o:p></span></p>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>ho&#7863;c
  t&#7841;m trú<o:p></o:p></span></p>
  </td>
  <td width=144 rowspan=2 style='width:1.5in;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:30.65pt'>
  <p class=MsoNormal align=center style='text-align:center'><span lang=SV
  style='font-size:14.0pt;mso-ansi-language:SV;mso-fareast-language:VI;
  mso-bidi-language:HE'>N&#417;i &#273;&#259;ng ký KCB ban &#273;&#7847;u<o:p></o:p></span></p>
  </td>
  <td width=144 colspan=2 style='width:1.5in;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:30.65pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>Tháng
  n&#259;m &#273;óng BHYT<o:p></o:p></span></p>
  </td>
  <td width=88 rowspan=2 style='width:66.0pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:30.65pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>Ghi chú<o:p></o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:1'>
  <td width=72 style='width:.75in;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>T&#7915;<o:p></o:p></span></p>
  </td>
  <td width=72 style='width:.75in;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>&#272;&#7871;n
  <o:p></o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:2'>
  <td width=33 style='width:24.85pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:6.0pt;text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>1<o:p></o:p></span></p>
  </td>
  <td width=126 style='width:94.55pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:6.0pt;text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>2<o:p></o:p></span></p>
  </td>
  <td width=104 style='width:78.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:6.0pt;text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>3<o:p></o:p></span></p>
  </td>
  <td width=48 style='width:.5in;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:6.0pt;text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>4<o:p></o:p></span></p>
  </td>
  <td width=80 style='width:60.0pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:6.0pt;text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>5<o:p></o:p></span></p>
  </td>
  <td width=80 style='width:60.0pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:6.0pt;text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>6<o:p></o:p></span></p>
  </td>
  <td width=208 style='width:156.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:6.0pt;text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>7<o:p></o:p></span></p>
  </td>
  <td width=144 style='width:1.5in;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:6.0pt;text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>8<o:p></o:p></span></p>
  </td>
  <td width=72 style='width:.75in;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:6.0pt;text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>9<o:p></o:p></span></p>
  </td>
  <td width=72 style='width:.75in;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:6.0pt;text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>10<o:p></o:p></span></p>
  </td>
  <td width=88 style='width:66.0pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal align=center style='margin-top:6.0pt;text-align:center'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'>11<o:p></o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:3'>
  <td width=33 valign=top style='width:24.85pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=126 valign=top style='width:94.55pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=104 valign=top style='width:78.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=48 valign=top style='width:.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=208 valign=top style='width:156.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=88 valign=top style='width:66.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:4'>
  <td width=33 valign=top style='width:24.85pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=126 valign=top style='width:94.55pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=104 valign=top style='width:78.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=48 valign=top style='width:.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=208 valign=top style='width:156.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=88 valign=top style='width:66.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:5'>
  <td width=33 valign=top style='width:24.85pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=126 valign=top style='width:94.55pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=104 valign=top style='width:78.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=48 valign=top style='width:.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=208 valign=top style='width:156.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=88 valign=top style='width:66.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:6'>
  <td width=33 valign=top style='width:24.85pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=126 valign=top style='width:94.55pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=104 valign=top style='width:78.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=48 valign=top style='width:.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=208 valign=top style='width:156.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=88 valign=top style='width:66.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:7'>
  <td width=33 valign=top style='width:24.85pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=126 valign=top style='width:94.55pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=104 valign=top style='width:78.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=48 valign=top style='width:.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=208 valign=top style='width:156.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=88 valign=top style='width:66.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:8'>
  <td width=33 valign=top style='width:24.85pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=126 valign=top style='width:94.55pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=104 valign=top style='width:78.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=48 valign=top style='width:.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=208 valign=top style='width:156.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=88 valign=top style='width:66.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:9'>
  <td width=33 valign=top style='width:24.85pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=126 valign=top style='width:94.55pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=104 valign=top style='width:78.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=48 valign=top style='width:.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=208 valign=top style='width:156.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=88 valign=top style='width:66.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:10'>
  <td width=33 valign=top style='width:24.85pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=126 valign=top style='width:94.55pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=104 valign=top style='width:78.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=48 valign=top style='width:.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=208 valign=top style='width:156.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=88 valign=top style='width:66.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:11'>
  <td width=33 valign=top style='width:24.85pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=126 valign=top style='width:94.55pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=104 valign=top style='width:78.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=48 valign=top style='width:.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=208 valign=top style='width:156.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=88 valign=top style='width:66.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:12;mso-yfti-lastrow:yes'>
  <td width=33 valign=top style='width:24.85pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=126 valign=top style='width:94.55pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=104 valign=top style='width:78.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=48 valign=top style='width:.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=80 valign=top style='width:60.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=208 valign=top style='width:156.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=144 valign=top style='width:1.5in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=72 valign=top style='width:.75in;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width=88 valign=top style='width:66.0pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
  style='font-size:14.0pt;mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
</table>

<p class=MsoNormal style='text-align:justify'><span style='font-size:14.0pt;
mso-fareast-language:VI;mso-bidi-language:HE'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-top:3.0pt;margin-right:0in;margin-bottom:6.0pt;
margin-left:0in'><span lang=SV style='mso-ansi-language:SV'><o:p>&nbsp;</o:p></span></p>
<%
    if (_j == num_row - 1)//nhan vien cuoi cung 
     { 
         %>
         
<span lang=SV style='font-size:12.0pt;font-family:"Times New Roman","serif";
mso-fareast-font-family:"Times New Roman";mso-ansi-language:SV;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA'>
</span>
         <%
     }
     else
     {   
  %>
    
<span lang=SV style='font-size:12.0pt;font-family:"Times New Roman","serif";
mso-fareast-font-family:"Times New Roman";mso-ansi-language:SV;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA'><br clear=all style='mso-special-character:line-break;
page-break-before:always'>
</span>
<% 
     }
    
%>



</div>
<%} // het trang in phuc luc 2 %>
<%} //end for %>
</body>

</html>
