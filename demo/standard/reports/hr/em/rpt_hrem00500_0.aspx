<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/msword";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html xmlns:w="urn:schemas-microsoft-com:office:word"
xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
xmlns="http://www.w3.org/TR/REC-html40">
<%
    string emp_pk;
	string p_contract_pk       = Request["p_contract_pk"].ToString();
    string SQL
	= "select a.CONTRACT_NO as num0 " +
        ",substr(nvl(a.BEGIN_CONTRACT,a.begin_probation),7,2)  as printdate1 " +
        ",substr(nvl(a.BEGIN_CONTRACT,a.begin_probation),5,2) as printmonth2 " +
        ",substr(nvl(a.BEGIN_CONTRACT,a.begin_probation),1,4) as printyear3 " +
        ",b.FULL_NAME as full_name4 " +
        ",(select CODE_NM from vhr_hr_code where id='HR0009' and code=b.NATION) as nation5 " +
        ",(case when length(b.BIRTH_DT)=8 then  substr(b.BIRTH_DT,7,2)  end ) as birthdate6 " +
        ",(case when length(b.BIRTH_DT)=8 then substr(b.BIRTH_DT,5,2)  end ) as birthmonth7 " +
        ",substr(b.BIRTH_DT,1,4) as birthyear8 " +
        ",(select CODE_FNM from vhr_hr_code where id='HR0021' and code=b.PLACE_BIRTH ) as place_birth9 " +
        ",b.PERMANENT_ADDR as permanent_add10 " +
        ",b.PERSON_ID as person_id11 " +
        ",to_char(to_date(b.ISSUE_DT,'yyyymmdd'),'dd/mm/yyyy')   as issuedate12 " +
        ",(select CODE_NM from vhr_hr_code where id='HR0014' and code=b.PLACE_PER_ID ) as place_persion13 " +
        ",'' labour_no14  " +
        ",''  as labourdate15 " +
        ",'' as lb_place16 " +
        ",(select char_2 from vhr_hr_code where id='HR0001' and code=a.CONTRACT_TYPE ) as contract_type17 " +
        ",substr(a.BEGIN_CONTRACT,7,2)  as stcontractdate18 " +
        ",substr(a.BEGIN_CONTRACT,5,2) as stcontractmonth19 " +
        ",substr(a.BEGIN_CONTRACT,1,4) as stcontractyearw20 " +
        ",substr(a.end_CONTRACT,7,2)  as etcontractdate21 " +
        ",substr(a.end_CONTRACT,5,2) as etcontractmonth22 " +
        ",substr(a.end_CONTRACT,1,4) as etcontractyearw23 " +
        ",substr(a.BEGIN_PROBATION,7,2)  as probationdate24 " +
        ",substr(a.BEGIN_PROBATION,5,2) as probationmonth25 " +
        ",substr(a.BEGIN_PROBATION,1,4) as probationyear26 " +
        ",substr(a.end_PROBATION,7,2)  as probationdate27 " +
        ",substr(a.end_PROBATION,5,2) as probationmonth28 " +
        ",substr(a.end_PROBATION,1,4) as probationyear29  " +
        ",(select CODE_FNM from vhr_hr_code where id='HR0008' and code=b.POS_TYPE) as position30 " +
        ",(select remark_code from vhr_hr_code where id='HR0010' and code=b.job_TYPE) as c_job31 " +
        ",to_char(a.BASIC_SAL,'99,999,999') as salary32 " +
        ",substr(nvl(a.BEGIN_CONTRACT,a.begin_probation),7,2)  as effectdate33 " +
        ",substr(nvl(a.BEGIN_CONTRACT,a.begin_probation),5,2) as effectmonth34 " +
        ",substr(nvl(a.BEGIN_CONTRACT,a.begin_probation),1,4) as effectyear35 " +
        ",(select char_4 from vhr_hr_code where id='HR0001' and code=a.CONTRACT_TYPE ) as title36 " +
        ",(select CODE_FNM from vhr_hr_code where id='HR0010' and code=b.job_TYPE) as job37 " +
        ", b.MONEY_KIND " +
        ",to_char(nvl(a.social_emp,0) + nvl(a.health_emp,0) + nvl(a.unemp_emp,0),'99.9') as ins_emp " +
        ",nvl(a.social_company,0) + nvl(a.health_company,0) + nvl(a.unemp_company,0) as ins_com " +
        ",(SELECT CO.PARTNER_LNAME FROM TCO_COMPANY CO WHERE CO.DEL_IF=0 AND CO.PK=B.TCO_COMPANY_PK) CO_LNAME " +
        ",(SELECT CO.ADDR1 FROM TCO_COMPANY CO WHERE CO.DEL_IF=0 AND CO.PK=B.TCO_COMPANY_PK) CO_ADDR " +
        ",(SELECT CO.PHONE_NO FROM TCO_COMPANY CO WHERE CO.DEL_IF=0 AND CO.PK=B.TCO_COMPANY_PK) CO_PHONE_NO " +
        "from thr_labour_contract a,thr_employee b,tco_org c,thr_work_group d  " +
        "where a.del_if=0 and b.del_if=0 and c.del_if=0 and d.del_if=0  " +
        "and b.pk=a.thr_employee_pk " +
        "and c.pk=b.tco_org_PK " +
        "and d.pk=b.thr_wg_pk " +
        "and a.pk in (" + p_contract_pk + ") " ;
        
//Response.Write(SQL);
//Response.End();
    DataTable dt_total = CtlLib.TableReadOpen(SQL);
    int irow;
    irow = dt_total.Rows.Count;
    if (irow == 0)
    {
        Response.Write("There is no data");
        Response.End();
    }
    SQL
    = "select code,code_nm  " +
        "from vhr_hr_code " +
        "where id='HR0036' order by code  ";
    DataTable dt_name = CtlLib.TableReadOpen(SQL);
    int irow_name;
    irow_name = dt_name.Rows.Count;
    /*if (irow_name != 23)
    {
        Response.Write("There is enough information of HR code Labour Contract Report!");
        Response.End();
    }*/
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 11">
<meta name=Originator content="Microsoft Word 11">
<link rel=File-List href="rpt_Labour_Contract_files/filelist.xml">
<title>CỘNG HỊA X HỘI CHỦ NGHĨA VIỆT NAM</title>
<o:SmartTagType namespaceuri="urn:schemas-microsoft-com:office:smarttags"
 name="place"/>
<o:SmartTagType namespaceuri="urn:schemas-microsoft-com:office:smarttags"
 name="country-region"/>
<o:SmartTagType namespaceuri="urn:schemas-microsoft-com:office:smarttags"
 name="PlaceName"/>
<o:SmartTagType namespaceuri="urn:schemas-microsoft-com:office:smarttags"
 name="PlaceType"/>
<o:SmartTagType namespaceuri="urn:schemas-microsoft-com:office:smarttags"
 name="City"/>
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Yen</o:Author>
  <o:LastAuthor>ty-ml</o:LastAuthor>
  <o:Revision>2</o:Revision>
  <o:TotalTime>295</o:TotalTime>
  <o:LastPrinted>2008-07-22T04:19:00Z</o:LastPrinted>
  <o:Created>2008-07-22T06:21:00Z</o:Created>
  <o:LastSaved>2008-07-22T06:21:00Z</o:LastSaved>
  <o:Pages>1</o:Pages>
  <o:Words>1056</o:Words>
  <o:Characters>6022</o:Characters>
  <o:Company>VinaGenuWin</o:Company>
  <o:Lines>50</o:Lines>
  <o:Paragraphs>14</o:Paragraphs>
  <o:CharactersWithSpaces>7064</o:CharactersWithSpaces>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:GrammarState>Clean</w:GrammarState>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" LatentStyleCount="156">
 </w:LatentStyles>
</xml><![endif]--><!--[if !mso]><object
 classid="clsid:38481807-CA0E-42D2-BF39-B33AF135CC4D" id=ieooui></object>
<style>
st1\:*{behavior:url(#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
p.Style1, li.Style1, div.Style1
	{mso-style-name:Style1;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:63.0pt;
	margin-bottom:.0001pt;
	text-indent:-63.0pt;
	mso-pagination:widow-orphan;
	mso-list:l6 level1 lfo2;
	tab-stops:list .75in;
	font-size:9.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";}
span.spelle
	{mso-style-name:spelle;}
span.GramE
	{mso-style-name:"";
	mso-gram-e:yes;}
@page Section1
	{size:595.45pt 841.7pt;
	margin:.6in .7in .3in .6in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
 /* List Definitions */
 @list l0
	{mso-list-id:579680210;
	mso-list-template-ids:-840145452;
	mso-list-style-name:"Style Numbered VNI-Helve 13 pt Bold";}
@list l0:level1
	{mso-level-text:Đ3fiề3%u;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:13.0pt;
	mso-bidi-font-size:13.0pt;
	font-family:Arial;
	mso-ansi-font-weight:bold;
	mso-bidi-font-weight:bold;}
@list l0:level2
	{mso-level-number-format:none;
	mso-level-text:"";
	mso-level-tab-stop:63.0pt;
	mso-level-number-position:left;
	margin-left:63.0pt;
	text-indent:-9.0pt;
	mso-ansi-font-size:9.0pt;
	mso-bidi-font-size:9.0pt;
	font-family:Arial;
	mso-ansi-font-weight:normal;
	mso-bidi-font-weight:normal;
	mso-ansi-font-style:normal;
	mso-bidi-font-style:normal;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:1230188111;
	mso-list-type:hybrid;
	mso-list-template-ids:-2014516878 1552969296 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:.25in;
	mso-level-number-position:left;
	margin-left:0in;
	text-indent:0in;
	font-family:Symbol;}
@list l1:level2
	{mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level4
	{mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level7
	{mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
	{mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2
	{mso-list-id:1297178727;
	mso-list-type:hybrid;
	mso-list-template-ids:-1061545850 1552969296 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:.25in;
	mso-level-number-position:left;
	margin-left:0in;
	text-indent:0in;
	font-family:Symbol;}
@list l2:level2
	{mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level3
	{mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level4
	{mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level5
	{mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level6
	{mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level7
	{mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level8
	{mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level9
	{mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3
	{mso-list-id:1650793303;
	mso-list-type:hybrid;
	mso-list-template-ids:56670758 1552969296 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l3:level1
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:.25in;
	mso-level-number-position:left;
	margin-left:0in;
	text-indent:0in;
	font-family:Symbol;}
@list l3:level2
	{mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level3
	{mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level4
	{mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level5
	{mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level6
	{mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level7
	{mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level8
	{mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level9
	{mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4
	{mso-list-id:1682009144;
	mso-list-type:hybrid;
	mso-list-template-ids:708319432 1552969296 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l4:level1
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:.25in;
	mso-level-number-position:left;
	margin-left:0in;
	text-indent:0in;
	font-family:Symbol;}
@list l4:level2
	{mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level3
	{mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level4
	{mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level5
	{mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level6
	{mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level7
	{mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level8
	{mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level9
	{mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5
	{mso-list-id:1693341977;
	mso-list-type:hybrid;
	mso-list-template-ids:1851144098 1552969296 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l5:level1
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:.25in;
	mso-level-number-position:left;
	margin-left:0in;
	text-indent:0in;
	font-family:Symbol;}
@list l5:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l5:level3
	{mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level4
	{mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level5
	{mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level6
	{mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level7
	{mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level8
	{mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level9
	{mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l6
	{mso-list-id:2004699239;
	mso-list-type:hybrid;
	mso-list-template-ids:-1968505894 857629534 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l6:level1
	{mso-level-style-link:Style1;
	mso-level-text:"rticle  \:                      ";
	mso-level-tab-stop:.75in;
	mso-level-number-position:left;
	margin-left:63.0pt;
	text-indent:-63.0pt;
	mso-ansi-font-size:9.0pt;
	mso-bidi-font-size:9.0pt;
	font-family:Arial;
	mso-ansi-font-weight:normal;
	mso-bidi-font-weight:normal;
	mso-ansi-font-style:normal;
	mso-bidi-font-style:normal;}
@list l6:level2
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:135.0pt;
	mso-level-number-position:left;
	margin-left:135.0pt;
	text-indent:-.25in;
	mso-ansi-font-size:9.0pt;
	mso-bidi-font-size:9.0pt;
	font-family:"Times New Roman";
	mso-ansi-font-weight:normal;
	mso-bidi-font-weight:normal;
	mso-ansi-font-style:normal;
	mso-bidi-font-style:normal;}
@list l6:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:171.0pt;
	mso-level-number-position:right;
	margin-left:171.0pt;
	text-indent:-9.0pt;}
@list l6:level4
	{mso-level-tab-stop:207.0pt;
	mso-level-number-position:left;
	margin-left:207.0pt;
	text-indent:-.25in;}
@list l6:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:243.0pt;
	mso-level-number-position:left;
	margin-left:243.0pt;
	text-indent:-.25in;}
@list l6:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:279.0pt;
	mso-level-number-position:right;
	margin-left:279.0pt;
	text-indent:-9.0pt;}
@list l6:level7
	{mso-level-tab-stop:315.0pt;
	mso-level-number-position:left;
	margin-left:315.0pt;
	text-indent:-.25in;}
@list l6:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:351.0pt;
	mso-level-number-position:left;
	margin-left:351.0pt;
	text-indent:-.25in;}
@list l6:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:387.0pt;
	mso-level-number-position:right;
	margin-left:387.0pt;
	text-indent:-9.0pt;}
@list l7
	{mso-list-id:2072075684;
	mso-list-type:hybrid;
	mso-list-template-ids:1550500322 1552969296 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l7:level1
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:.25in;
	mso-level-number-position:left;
	margin-left:0in;
	text-indent:0in;
	font-family:Symbol;}
@list l7:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l7:level3
	{mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level4
	{mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level5
	{mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level6
	{mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level7
	{mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level8
	{mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level9
	{mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
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
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";
	mso-ansi-language:#0400;
	mso-fareast-language:#0400;
	mso-bidi-language:#0400;}
</style>
<![endif]-->
</head>

<body lang=EN-US style='tab-interval:.5in'>

<div class=Section1>
<% 
     
     for (int i = 0; i < irow; i++) 
    {
       
    %> 

<p class=MsoNormal style='line-height:15.0pt;mso-line-height-rule:exactly;
tab-stops:225.0pt'><b><span style='mso-spacerun:yes'>    </span><span
class=SpellE>Tên</span> <span class=SpellE>đơn</span> <span class=SpellE>vị</span>:
<span class=SpellE><span class=GramE><%= dt_total.Rows[i]["CO_LNAME"].ToString() %> </span></span> </b><span style='mso-tab-count:1'>           </span><b style='mso-bidi-font-weight:normal'>CỘNG
HÒA XÃ HỘI CHỦ NGHĨA VIỆT <st1:country-region w:st="on"><st1:place w:st="on"><st1:country-region
w:st="on"><st1:place w:st="on">NAM</st1:place></st1:country-region></st1:place></st1:country-region></b></p>

<p class=MsoNormal style='line-height:15.0pt;mso-line-height-rule:exactly;
tab-stops:4.0in'><i style='mso-bidi-font-style:normal'><span
style='mso-spacerun:yes'>    </span>Name of enterprise</i><span
style='mso-tab-count:1'>                                                             </span><span
style='mso-spacerun:yes'>     </span><span class=SpellE><b style='mso-bidi-font-weight:
normal'>Độc</b></span><b style='mso-bidi-font-weight:normal'> <span
class=SpellE>lập</span> – <span class=SpellE>Tự</span> do – <span class=SpellE>Hạnh</span>
<span class=SpellE>phúc</span></b></p>

<p class=MsoNormal style='line-height:15.0pt;mso-line-height-rule:exactly;
tab-stops:3.5in'><span style='mso-spacerun:yes'>    </span><span class=SpellE>Số<span
class=GramE>:<%= dt_total.Rows[i][0].ToString() %></span></span><span style='mso-tab-count:1'>                                                                      </span><span
style='mso-spacerun:yes'>          </span><st1:PlaceName w:st="on"><b
 style='mso-bidi-font-weight:normal'><span style='font-size:11.0pt'>SOCIALIST</span></b></st1:PlaceName></st1:PlaceName><b
style='mso-bidi-font-weight:normal'><span style='font-size:11.0pt'> <st1:PlaceType w:st="on"><st1:PlaceType
w:st="on">REPUBLIC</st1:PlaceType></st1:PlaceType> OF <st1:country-region w:st="on"><st1:place w:st="on"><st1:place
w:st="on"><st1:country-region w:st="on">VIETNAM</st1:place></st1:country-region></st1:country-region></st1:place></span></b></p>


<p class=MsoNormal style='text-align:justify;mso-line-height-alt:5.0pt'><span
style='font-size:11.0pt'><span style='mso-spacerun:yes'>    </span></span><i
style='mso-bidi-font-style:normal'>No</i><span style='font-size:11.0pt'><span
style='mso-tab-count:7'>                                                                           </span><span
style='mso-spacerun:yes'>  </span><span
style='mso-spacerun:yes'>          </span><span
style='mso-spacerun:yes'> </span><st1:City w:st="on"><st1:place w:st="on"><st1:City
w:st="on"><st1:place w:st="on"><b style='mso-bidi-font-weight:normal'><u>Independence</u></b></st1:place></st1:City></st1:place></st1:City><b
style='mso-bidi-font-weight:normal'><u> – Freedom – Happiness</u></b></span> <o:p></o:p></p>


<p class=MsoNormal style='text-align:justify;mso-line-height-alt:5.0pt'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='mso-line-height-alt:5.0pt'><span style='mso-tab-count:
7'></span><%= dt_name.Rows[22][1].ToString() %>, ngày <%= dt_total.Rows[i][1].ToString() %> tháng <%= dt_total.Rows[i][2].ToString() %> năm <%= dt_total.Rows[i][3].ToString() %></p>

<p class=MsoNormal style='mso-line-height-alt:5.0pt'><span style='mso-tab-count:
8'>                                                                                                </span><span
style='font-size:13.0pt;mso-bidi-font-size:12.0pt'><span
style='mso-spacerun:yes'>      </span></span><i style='mso-bidi-font-style:
normal'><span style='font-size:11.0pt;mso-bidi-font-size:12.0pt'>Date<span
style='mso-spacerun:yes'>      </span>month<span style='mso-spacerun:yes'>    
</span>year</span><o:p></o:p></i></p>

<p class=MsoNormal style='mso-line-height-alt:5.0pt'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal align=center style='text-align:center;line-height:18.0pt;
mso-line-height-rule:exactly'><b><span style='font-size:18.0pt'><%= dt_total.Rows[i][36].ToString() %><o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center;line-height:15.0pt;
mso-line-height-rule:exactly'><b><span style='mso-bidi-font-size:10.0pt'>LABOUR
CONTRACT<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center;line-height:15.0pt;
mso-line-height-rule:exactly'>(Ban hành <span class=GramE>theo</span> Thông tư
số 21/2003/TT – BLĐTBXH ngày 22/9/2003 </p>

<p class=MsoNormal align=center style='text-align:center;line-height:15.0pt;
mso-line-height-rule:exactly'><span class=GramE>của</span> Bộ Lao động – Thưong
binh và Xã hội)</p>

<p class=MsoNormal align=center style='text-align:center;line-height:15.0pt;
mso-line-height-rule:exactly'><i style='mso-bidi-font-style:normal'><span
style='font-size:11.0pt;mso-bidi-font-size:10.0pt'>Issued under the Circular of
the Ministry of Labour, Invalids<o:p></o:p></span></i></p>

<p class=MsoNormal align=center style='text-align:center;line-height:15.0pt;
mso-line-height-rule:exactly'><span class=GramE><i style='mso-bidi-font-style:
normal'><span style='font-size:11.0pt;mso-bidi-font-size:10.0pt'>and</span></i></span><i
style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;mso-bidi-font-size:
10.0pt'> Social Affairs No 21/2003/TT-BLĐTBXH on 22 September 2003<o:p></o:p></span></i></p>

<p class=MsoNormal align=center style='text-align:center;line-height:15.0pt;
mso-line-height-rule:exactly'><span style='font-size:10.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly;tab-stops:5.0in'><span style='mso-bidi-font-size:11.0pt'>Chúng tôi, một
bên là Ông/Bà: <b><%= dt_name.Rows[1][1].ToString() %></b></span><span style='font-size:15.0pt;mso-bidi-font-size:
14.0pt'>&nbsp;</span><span style='mso-bidi-font-size:11.0pt'><span
style='mso-spacerun:yes'>           </span><span style='mso-tab-count:1'>                                                      </span>Quốc
tịch<span class=GramE>: <%= dt_name.Rows[2][1].ToString() %></span> <u1:p></u1:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;
mso-bidi-font-size:10.0pt'>We are, from one side, Mr<span class=GramE>./</span>Mrs<span
style='mso-spacerun:yes'>                                                             
</span><span style='mso-tab-count:2'>                     </span>Nationality<o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'>Chức vụ: <%= dt_name.Rows[3][1].ToString() %><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;
mso-bidi-font-size:10.0pt'>Position<o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly;tab-stops:5.0in'><span style='mso-bidi-font-size:11.0pt'>Đại diện cho:
<%= dt_total.Rows[i]["CO_LNAME"].ToString() %><span style='mso-spacerun:yes'>    </span><span
style='mso-spacerun:yes'>                              </span><span
style='mso-tab-count:1'>                           </span>Điện thoại: <%= dt_total.Rows[i]["CO_PHONE_NO"].ToString() %></span></p>

<u1:p></u1:p>
<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;
mso-bidi-font-size:10.0pt'>On behalf of<span style='mso-tab-count:9'>                                                                                                    </span>Telephone<span
style='mso-tab-count:2'>                    </span><o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'>Địa chỉ:  <%= dt_total.Rows[i]["CO_ADDR"].ToString() %><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;
mso-bidi-font-size:8.0pt'>Address</span></i><i style='mso-bidi-font-style:normal'><span
style='mso-bidi-font-size:11.0pt'><o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly;tab-stops:5.0in'><span class=spelle><span style='mso-bidi-font-size:
11.0pt'>Và</span></span><span style='mso-bidi-font-size:11.0pt'> <span
class=spelle>một</span> <span class=spelle>bên</span> <span class=spelle>là</span>
<span class=spelle>Ông/Bà</span>: </span><span style='font-size:11.0pt'><b><%= dt_total.Rows[i][4].ToString() %></b> </span><span
style='mso-bidi-font-size:11.0pt'><span style='mso-tab-count:1'>                                                                               </span><span
class=spelle>Quốc</span> <span class=spelle>tịch</span>: <span class=GramE><span
class=spelle><%= dt_total.Rows[i][5].ToString() %></span></span><span class=spelle></span> <st1:place w:st="on"></st1:place><st1:country-region
w:st="on"></st1:country-region><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;
mso-bidi-font-size:8.0pt'>And from other side, Mr<span class=GramE>./</span>Mrs
<span style='mso-tab-count:5'>                                                 </span><span
style='mso-spacerun:yes'>         </span><span style='mso-tab-count:2'>               </span>Nationality<o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'>Sinh ngày: <span class=GramE><%= dt_total.Rows[i][6].ToString() %></span>
tháng <%= dt_total.Rows[i][7].ToString() %> năm <%= dt_total.Rows[i][8].ToString() %> tại <%= dt_total.Rows[i][9].ToString() %><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;
mso-bidi-font-size:8.0pt'>Date of birth <span style='mso-tab-count:1'>   </span>month<span
style='mso-tab-count:1'>   </span><span style='mso-spacerun:yes'>  
</span>year<span style='mso-spacerun:yes'>             </span>at</span></i><i
style='mso-bidi-font-style:normal'><span style='font-size:14.0pt;mso-bidi-font-size:
11.0pt'><o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'>Nghề nghiệp:<span
style='mso-spacerun:yes'>  </span><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;
mso-bidi-font-size:8.0pt'>Occupation</span></i><i style='mso-bidi-font-style:
normal'><span style='font-size:14.0pt;mso-bidi-font-size:11.0pt'><o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'>Địa chỉ thường trú: <%= dt_total.Rows[i][10].ToString() %><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt'>Permanence
Address<o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly;tab-stops:2.0in 4.0in'><span style='mso-bidi-font-size:11.0pt'>Số CMND:
<%= dt_total.Rows[i][11].ToString() %><span style='mso-tab-count:1'>     </span>Cấp ngày: <%= dt_total.Rows[i][12].ToString() %><span
style='mso-spacerun:yes'>   </span><span style='mso-tab-count:1'>    </span>tại
<span class=GramE><%= dt_total.Rows[i][13].ToString() %></span><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;
mso-bidi-font-size:8.0pt'>ID card N</span></i><i style='mso-bidi-font-style:
normal'><sup><span style='mso-bidi-font-size:8.0pt'>o</span></sup></i><i
style='mso-bidi-font-style:normal'><span style='mso-bidi-font-size:8.0pt'> <span
style='mso-tab-count:1'>      </span><span
style='mso-spacerun:yes'>                       </span></span></i><i
style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;mso-bidi-font-size:
8.0pt'>Issued on day<span style='mso-spacerun:yes'>    </span>month<span
style='mso-spacerun:yes'>   </span>year<span style='mso-spacerun:yes'>  
</span>issued at</span></i><i style='mso-bidi-font-style:normal'><span
style='mso-bidi-font-size:11.0pt'><o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'>Số sổ <span class=GramE>lao</span>
động:<span style='mso-tab-count:1'> </span><%= dt_total.Rows[i][14].ToString() %><span style='mso-tab-count:1'>      </span>Cấp
ngày:<span style='mso-tab-count:1'>         </span><%= dt_total.Rows[i][15].ToString() %><span style='mso-tab-count:
2'>                  </span>tại<span style='mso-spacerun:yes'>         </span><%= dt_total.Rows[i][16].ToString() %><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;
mso-bidi-font-size:8.0pt'>Labour book No (If any)</span></i><i
style='mso-bidi-font-style:normal'><span style='font-size:13.0pt;mso-bidi-font-size:
8.0pt'><span style='mso-spacerun:yes'>        </span></span></i><i
style='mso-bidi-font-style:normal'><span style='mso-bidi-font-size:8.0pt'><span
style='mso-spacerun:yes'>  </span></span></i><i style='mso-bidi-font-style:
normal'><span style='font-size:11.0pt;mso-bidi-font-size:8.0pt'>Issued on
day<span style='mso-spacerun:yes'>   </span><span
style='mso-spacerun:yes'> </span>month<span style='mso-spacerun:yes'>  
</span>year<span style='mso-spacerun:yes'>   </span>issued at</span></i><i
style='mso-bidi-font-style:normal'><span style='font-size:13.0pt;mso-bidi-font-size:
11.0pt'><o:p></o:p></span></i></p>

<p class=MsoNormal style='text-indent:.5in;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'>Thỏa thuận ký kết <span
class=GramE>lao</span> động và cam kết làm đúng những điều khoản sau đây:<o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:.5in;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;
mso-bidi-font-size:8.0pt'>Agree to sign this labour contract and commit to
implement the following provisions:</span></i><i style='mso-bidi-font-style:
normal'><span style='font-size:14.0pt;mso-bidi-font-size:11.0pt'><o:p></o:p></span></i></p>

<p class=MsoNormal style='line-height:15.0pt;mso-line-height-rule:exactly'><span
style='font-size:9.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-indent:.5in;line-height:15.0pt;mso-line-height-rule:
exactly'><b><span style='font-size:13.0pt'>Điều 1: Thời hạn và công việc hợp
đồng<o:p></o:p></span></b></p>

<p class=Style1 style='margin-left:0in;text-indent:0in;line-height:15.0pt;
mso-line-height-rule:exactly;mso-list:none;tab-stops:45.0pt'><b
style='mso-bidi-font-weight:normal'><i style='mso-bidi-font-style:normal'><span
style='font-size:11.0pt;mso-bidi-font-size:9.0pt;font-family:"Times New Roman"'><span
style='mso-spacerun:yes'>              </span>Article 1:<span
style='mso-spacerun:yes'>  </span>Term and work contrac</span></i></b><b
style='mso-bidi-font-weight:normal'><i style='mso-bidi-font-style:normal'><span
style='font-size:10.0pt;mso-bidi-font-size:9.0pt;font-family:"Times New Roman"'>t<o:p></o:p></span></i></b></p>

<p class=Style1 style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l2 level1 lfo4;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:12.0pt;
mso-bidi-font-size:11.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:12.0pt;mso-bidi-font-size:
11.0pt;font-family:"Times New Roman"'>Loại hợp đồng lao động: <%= dt_total.Rows[i][17].ToString() %><o:p></o:p></span></p>

<p class=Style1 style='margin-left:.25in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:none;tab-stops:.5in'><i
style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;mso-bidi-font-size:
8.0pt;font-family:"Times New Roman"'>Categories of labour contract<o:p></o:p></span></i></p>
<%if (dt_total.Rows[i][18].ToString()!="")
  { %>
<p class=Style1 style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l2 level1 lfo4;
tab-stops:list .25in'><![if !supportLists]><span style='mso-bidi-font-size:
8.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
Symbol'><span style='mso-list:Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:12.0pt;mso-bidi-font-size:
11.0pt;font-family:"Times New Roman"'>Từ ngày <%= dt_total.Rows[i][18].ToString() %><span
style='mso-spacerun:yes'>  </span>tháng <%= dt_total.Rows[i][19].ToString() %> năm <%= dt_total.Rows[i][20].ToString() %> đến ngày </span><span
style='font-size:12.0pt;mso-bidi-font-size:8.0pt;font-family:"Times New Roman"'><%= dt_total.Rows[i][21].ToString() %>
tháng <%= dt_total.Rows[i][22].ToString() %> năm <%= dt_total.Rows[i][23].ToString() %></span><span style='mso-bidi-font-size:8.0pt;
font-family:"Times New Roman"'><o:p></o:p></span></p>

<p class=Style1 style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:none;tab-stops:.5in'><i
style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;mso-bidi-font-size:
8.0pt;font-family:"Times New Roman"'><span style='mso-spacerun:yes'>     
</span>From date<span style='mso-spacerun:yes'>    </span>month<span
style='mso-spacerun:yes'>       </span>year<span
style='mso-spacerun:yes'>            </span>to date<span
style='mso-spacerun:yes'>           </span>month<span
style='mso-spacerun:yes'>           </span>year<o:p></o:p></span></i></p>
<%}
 %>
<p class=Style1 style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l2 level1 lfo4;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:12.0pt;
mso-bidi-font-size:11.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:12.0pt;mso-bidi-font-size:
11.0pt;font-family:"Times New Roman"'>Thử việc từ ngày<span
style='mso-spacerun:yes'>   </span><%= dt_total.Rows[i][24].ToString() %><span style='mso-spacerun:yes'> 
</span>tháng<span style='mso-spacerun:yes'>  </span><%= dt_total.Rows[i][25].ToString() %><span
style='mso-spacerun:yes'>   </span>năm <%= dt_total.Rows[i][26].ToString() %><span style='mso-spacerun:yes'> 
</span>đến ngày<span style='mso-spacerun:yes'>  </span><%= dt_total.Rows[i][27].ToString() %><span
style='mso-spacerun:yes'>  </span>tháng<span style='mso-spacerun:yes'>  </span><%= dt_total.Rows[i][28].ToString() %><span
style='mso-spacerun:yes'>  </span>năm <%= dt_total.Rows[i][29].ToString() %><o:p></o:p></span></p>

<p class=Style1 style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:none;tab-stops:.5in'><i
style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;mso-bidi-font-size:
8.0pt;font-family:"Times New Roman"'><span style='mso-spacerun:yes'>     
</span>Probation time from <span class=GramE>date<span
style='mso-spacerun:yes'>  </span>month</span><span style='mso-spacerun:yes'> 
</span><span style='mso-spacerun:yes'>     </span><span
style='mso-spacerun:yes'> </span>year<span style='mso-spacerun:yes'>          
</span>to date<span style='mso-spacerun:yes'>      </span><span
style='mso-spacerun:yes'>      </span><span
style='mso-spacerun:yes'>  </span>month<span style='mso-spacerun:yes'>       
</span>year<o:p></o:p></span></i></p>

<p class=Style1 style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l2 level1 lfo4;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:12.0pt;
mso-bidi-font-size:11.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:12.0pt;mso-bidi-font-size:
11.0pt;font-family:"Times New Roman"'>Địa điểm làm việc: <%= dt_name.Rows[7][1].ToString() %><o:p></o:p></span></p>

<p class=Style1 style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:none;tab-stops:.5in'><i
style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;font-family:
"Times New Roman"'><span style='mso-spacerun:yes'>  </span><span
style='mso-spacerun:yes'>     </span>Place of work:<o:p></o:p></span></i></p>

<p class=Style1 style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l2 level1 lfo4;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:12.0pt;
mso-bidi-font-size:11.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:12.0pt;mso-bidi-font-size:
11.0pt;font-family:"Times New Roman"'>Chức danh chuyên môn:<%= dt_total.Rows[i][37].ToString() %><span
style='mso-spacerun:yes'>                          </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Chức vụ(nếu
có): <%= dt_total.Rows[i][30].ToString() %><o:p></o:p></span></p>

<p class=Style1 style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:none;tab-stops:.5in'><i
style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;mso-bidi-font-size:
8.0pt;font-family:"Times New Roman"'><span style='mso-spacerun:yes'>      
</span>Qualification:<span style='mso-tab-count:5'>                                                       </span><span
style='mso-spacerun:yes'>       </span>Position (if any)<span
style='mso-spacerun:yes'>  </span><span style='mso-tab-count:1'>  </span></span></i><i
style='mso-bidi-font-style:normal'><span style='font-size:10.0pt;mso-bidi-font-size:
8.0pt;font-family:"Times New Roman"'><o:p></o:p></span></i></p>

<p class=Style1 style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l2 level1 lfo4;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:12.0pt;
mso-bidi-font-size:11.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:12.0pt;mso-bidi-font-size:
11.0pt;font-family:"Times New Roman"'>Công việc phải làm: <%= dt_total.Rows[i][31].ToString() %><o:p></o:p></span></p>

<p class=Style1 style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:none;tab-stops:.5in'><span
style='mso-bidi-font-size:8.0pt;font-family:"Times New Roman"'><span
style='mso-spacerun:yes'>       </span></span><span style='font-size:10.0pt;
mso-bidi-font-size:8.0pt;font-family:"Times New Roman"'><span
style='mso-spacerun:yes'> </span></span><i style='mso-bidi-font-style:normal'><span
style='font-size:11.0pt;mso-bidi-font-size:8.0pt;font-family:"Times New Roman"'>Job
desciption:</span></i><i style='mso-bidi-font-style:normal'><span
style='font-size:13.0pt;mso-bidi-font-size:11.0pt;font-family:"Times New Roman"'><o:p></o:p></span></i></p>


<p class=MsoNormal style='text-indent:.5in;line-height:15.0pt;mso-line-height-rule:
exactly'><b><span style='font-size:13.0pt'>Điều 2: Chế độ làm việc</span></b><span
style='font-size:9.0pt'><o:p></o:p></span></p>

<p class=Style1 style='margin-left:0in;text-indent:0in;line-height:15.0pt;
mso-line-height-rule:exactly;mso-list:none;tab-stops:.5in'><b style='mso-bidi-font-weight:
normal'><i style='mso-bidi-font-style:normal'><span style='font-size:10.0pt;
mso-bidi-font-size:9.0pt;font-family:"Times New Roman"'><span
style='mso-spacerun:yes'>    </span><span
style='mso-spacerun:yes'>           </span></span></i></b><b style='mso-bidi-font-weight:
normal'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;
mso-bidi-font-size:9.0pt;font-family:"Times New Roman"'>Article 2:<span
style='mso-spacerun:yes'>  </span>Work regime</span></i></b><b
style='mso-bidi-font-weight:normal'><i style='mso-bidi-font-style:normal'><span
style='font-size:10.0pt;mso-bidi-font-size:9.0pt;font-family:"Times New Roman"'><o:p></o:p></span></i></b></p>


<p class=Style1 style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l3 level1 lfo6;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:12.0pt;
mso-bidi-font-size:11.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:12.0pt;mso-bidi-font-size:
11.0pt;font-family:"Times New Roman"'>Thời gian làm việc: <%= dt_name.Rows[8][1].ToString() %><o:p></o:p></span></p>

<p class=Style1 style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:none;tab-stops:.5in'><span
style='font-size:10.0pt;mso-bidi-font-size:8.0pt;font-family:"Times New Roman"'><span
style='mso-spacerun:yes'>        </span></span><i style='mso-bidi-font-style:
normal'><span style='font-size:11.0pt;mso-bidi-font-size:8.0pt;font-family:
"Times New Roman"'>Time of work:</span></i><i style='mso-bidi-font-style:normal'><span
style='font-size:13.0pt;mso-bidi-font-size:11.0pt;font-family:"Times New Roman"'><o:p></o:p></span></i></p>

<p class=Style1 style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l5 level1 lfo8;
tab-stops:list .25in'><![if !supportLists]><span style='mso-bidi-font-size:
8.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
Symbol'><span style='mso-list:Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:12.0pt;mso-bidi-font-size:
11.0pt;font-family:"Times New Roman"'>Được cấp phát những dụng cụ làm việc gồm</span><span
style='mso-bidi-font-size:8.0pt;font-family:"Times New Roman"'>: </span><span
style='font-size:12.0pt;mso-bidi-font-size:8.0pt;font-family:"Times New Roman"'><%= dt_name.Rows[9][1].ToString() %></span><span style='mso-bidi-font-size:8.0pt;font-family:"Times New Roman"'><o:p></o:p></span></p>

<p class=Style1 style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:none;tab-stops:.5in'><span
style='font-size:13.0pt;mso-bidi-font-size:8.0pt;font-family:"Times New Roman"'><span
style='mso-spacerun:yes'>      </span></span><i style='mso-bidi-font-style:
normal'><span style='font-size:11.0pt;mso-bidi-font-size:8.0pt;font-family:
"Times New Roman"'>Providing with working equipments included:</span></i><i
style='mso-bidi-font-style:normal'><span style='font-size:8.0pt;font-family:
"Times New Roman"'><o:p></o:p></span></i></p>

<p class=Style1 style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:none;tab-stops:.5in'><span
style='font-size:12.0pt;mso-bidi-font-size:11.0pt;font-family:"Times New Roman"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-indent:.5in;line-height:15.0pt;mso-line-height-rule:
exactly'><b><span style='font-size:13.0pt'>Điều 3:<span
style='mso-spacerun:yes'>    </span>Nghĩa vụ và quyền lợi của người <span
class=GramE>lao</span> động<o:p></o:p></span></b></p>

<p class=Style1 style='margin-left:0in;text-indent:.5in;line-height:15.0pt;
mso-line-height-rule:exactly;mso-list:none;tab-stops:.5in'><b style='mso-bidi-font-weight:
normal'><i style='mso-bidi-font-style:normal'><span style='font-size:10.0pt;
mso-bidi-font-size:9.0pt;font-family:"Times New Roman"'>Article 3:<span
style='mso-spacerun:yes'>  </span>Obligations, rights and benefits of the
emploee<o:p></o:p></span></i></b></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><b>1. Quyền lợi</b><b><span style='font-size:13.0pt;mso-bidi-font-size:
12.0pt'>:<o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><b><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;
mso-bidi-font-size:12.0pt'>1. Rights and benefits:</span></i></b><i
style='mso-bidi-font-style:normal'><span style='font-size:8.0pt;mso-bidi-font-size:
9.0pt'><o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l5 level1 lfo8;
tab-stops:list .25in'><![if !supportLists]><span style='mso-bidi-font-size:
11.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
Symbol'><span style='mso-list:Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Phương
tiện đi lại làm việc: <%= dt_name.Rows[10][1].ToString() %><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'><span
style='mso-spacerun:yes'>      </span></span><i style='mso-bidi-font-style:
normal'><span style='font-size:10.0pt;mso-bidi-font-size:8.0pt'>Means of
transport for working:</span></i><i style='mso-bidi-font-style:normal'><span
style='font-size:11.0pt;mso-bidi-font-size:10.0pt'><span style='mso-tab-count:
1'>           </span></span></i><i style='mso-bidi-font-style:normal'><span
style='mso-bidi-font-size:11.0pt'><o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
mso-list:l5 level1 lfo8;tab-stops:list .25in'><![if !supportLists]><span
style='mso-bidi-font-size:11.0pt;font-family:Symbol;mso-fareast-font-family:
Symbol;mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Mức
lương chính hoặc tiền công: <%= dt_total.Rows[i][32].ToString() %>
 <%
    if(dt_total.Rows[i][38].ToString()=="01")            
    {
  %>
 VND
 <%} else { %> USD 
 <% } %>
  <o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='font-size:13.0pt;mso-bidi-font-size:11.0pt'><span
style='mso-spacerun:yes'>      </span></span><i style='mso-bidi-font-style:
normal'><span style='font-size:11.0pt'>Basic salary or wages:<o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l5 level1 lfo8;
tab-stops:list .25in'><![if !supportLists]><span style='mso-bidi-font-size:
11.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
Symbol'><span style='mso-list:Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Hình
thức trả lương: <%= dt_name.Rows[11][1].ToString() %><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='font-size:10.0pt;mso-bidi-font-size:8.0pt'><span
style='mso-spacerun:yes'>       </span></span><i style='mso-bidi-font-style:
normal'><span style='font-size:11.0pt;mso-bidi-font-size:8.0pt'><span
style='mso-spacerun:yes'> </span>Form of paying wage:</span></i><i
style='mso-bidi-font-style:normal'><span style='font-size:14.0pt;mso-bidi-font-size:
11.0pt'><o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l5 level1 lfo8;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:11.0pt;
mso-bidi-font-size:10.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:11.0pt;mso-bidi-font-size:
10.0pt'>Phụ cấp gồm: <%= dt_name.Rows[12][1].ToString() %><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:10.0pt'><span
style='mso-spacerun:yes'>      </span></span><i style='mso-bidi-font-style:
normal'><span style='font-size:11.0pt;mso-bidi-font-size:10.0pt'><span
style='mso-spacerun:yes'> </span>Allowances:<o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l5 level1 lfo8;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:11.0pt;
mso-bidi-font-size:10.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Được trả
lương vào các ngày <%= dt_name.Rows[13][1].ToString() %> hàng tháng.</span><span style='font-size:11.0pt;
mso-bidi-font-size:10.0pt'><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt'><span
style='mso-spacerun:yes'>       </span>To be paid monthly on</span></i><i
style='mso-bidi-font-style:normal'><span style='font-size:10.0pt'><o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l5 level1 lfo8;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:9.0pt;
mso-bidi-font-size:8.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Tiền
thưởng: <%= dt_name.Rows[14][1].ToString() %></span><span style='font-size:9.0pt;mso-bidi-font-size:8.0pt'><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='font-size:13.0pt;mso-bidi-font-size:11.0pt'><span
style='mso-spacerun:yes'>    </span></span><i style='mso-bidi-font-style:normal'><span
style='font-size:11.0pt'><span style='mso-spacerun:yes'>  </span>Bonuses</span></i><i
style='mso-bidi-font-style:normal'><span style='font-size:8.0pt'><o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l5 level1 lfo8;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:9.0pt;
mso-bidi-font-size:8.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Chế độ
nâng lương: <%= dt_name.Rows[15][1].ToString() %></span><span style='font-size:9.0pt;
mso-bidi-font-size:8.0pt'><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='font-size:13.0pt;mso-bidi-font-size:11.0pt'><span
style='mso-spacerun:yes'>      </span></span><i style='mso-bidi-font-style:
normal'><span style='font-size:11.0pt'>Regime for advancement in wage grades</span></i><i
style='mso-bidi-font-style:normal'><span style='font-size:8.0pt'><o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l5 level1 lfo8;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:9.0pt;
mso-bidi-font-size:8.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Được
trang bị bảo hộ lao động gồm: <%= dt_name.Rows[16][1].ToString() %></span><span
style='font-size:9.0pt;mso-bidi-font-size:8.0pt'><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt'><span
style='mso-spacerun:yes'>       </span>Providing with protection equipment
included:</span></i><i style='mso-bidi-font-style:normal'><span
style='font-size:8.0pt'><o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l5 level1 lfo8;
tab-stops:list .25in'><![if !supportLists]><span style='mso-bidi-font-size:
11.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
Symbol'><span style='mso-list:Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Chế độ
nghỉ ngơi (nghỉ hàng tuần, phép năm, lễ tết…): <%= dt_name.Rows[17][1].ToString() %><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='font-size:13.0pt;mso-bidi-font-size:11.0pt'><span
style='mso-spacerun:yes'>      </span></span><i style='mso-bidi-font-style:
normal'><span style='font-size:11.0pt'>Time of rest (weekly leave, annual
leave, and pulic holiday…)<o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l5 level1 lfo8;
tab-stops:list .25in'><![if !supportLists]><span style='mso-bidi-font-size:
11.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
Symbol'><span style='mso-list:Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Bảo hiểm
xã hội, y tế, thất nghiệp: Căn cứ theo quy định của luật pháp Việt Nam về BHXH, BHYT và BHTN (Công ty: <%= dt_total.Rows[i]["ins_com"].ToString() %>%, Người Lao Động <%= dt_total.Rows[i]["ins_emp"].ToString() %>%)<o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:14.0pt;
mso-bidi-font-size:11.0pt'><span style='mso-spacerun:yes'>      </span></span></i><i
style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;mso-bidi-font-size:
8.0pt'>Social insurance, health insurance, unemployee insurance<o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l5 level1 lfo8;
tab-stops:list .25in'><![if !supportLists]><span style='mso-bidi-font-size:
11.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
Symbol'><span style='mso-list:Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Chế độ đào
tạo: <%= dt_name.Rows[19][1].ToString() %><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt'><span
style='mso-spacerun:yes'>      </span>Regime for vocational training<o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'><span
style='mso-spacerun:yes'>      </span>Những thỏa thuận khác: <%= dt_name.Rows[20][1].ToString() %><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt'><span
style='mso-spacerun:yes'>      </span>Other agreements:<o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><b>2. Nghĩa vụ</b><b><span style='font-size:13.0pt;mso-bidi-font-size:
12.0pt'>:<o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><b><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;
mso-bidi-font-size:12.0pt'>2. Obligations</span></i></b><i style='mso-bidi-font-style:
normal'><span style='font-size:8.0pt;mso-bidi-font-size:9.0pt'><o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l4 level1 lfo10;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:10.0pt;
mso-bidi-font-size:9.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Hoàn
thành những công việc đã cam kết trong hợp đồng lao động</span><span
style='font-size:10.0pt;mso-bidi-font-size:9.0pt'><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='font-size:13.0pt;mso-bidi-font-size:11.0pt'><span
style='mso-spacerun:yes'>      </span></span><i style='mso-bidi-font-style:
normal'><span style='font-size:11.0pt;mso-bidi-font-size:10.0pt'>To fulfill the
works undertaken in labour contract<o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l4 level1 lfo10;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:9.0pt;
mso-bidi-font-size:8.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol;mso-bidi-font-weight:bold'><span style='mso-list:
Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Chấp
hành lệnh điều hành sản xuất – kinh doanh, nội quy kỷ luật lao động, an toàn vệ
sinh lao động<span class=GramE>,…</span></span><b><span style='font-size:9.0pt;
mso-bidi-font-size:8.0pt'><o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:14.0pt;
mso-bidi-font-size:11.0pt'><span style='mso-spacerun:yes'>     </span></span></i><i
style='mso-bidi-font-style:normal'><span style='font-size:11.0pt'>To</span></i><i
style='mso-bidi-font-style:normal'><span style='font-size:14.0pt;mso-bidi-font-size:
11.0pt'> c</span></i><i style='mso-bidi-font-style:normal'><span
style='font-size:11.0pt;mso-bidi-font-size:8.0pt'>omply with production and
business orders, internal labour discipline and occupational safety regulations<b><o:p></o:p></b></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l4 level1 lfo10;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:9.0pt;
mso-bidi-font-size:8.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol;mso-bidi-font-weight:bold'><span style='mso-list:
Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Bồi
thường vi phạm và vật chất: <%= dt_name.Rows[21][1].ToString() %></span><b><span style='font-size:9.0pt;mso-bidi-font-size:8.0pt'><o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:10.0pt;
mso-bidi-font-size:11.0pt'><span style='mso-spacerun:yes'>     </span></span></i><i
style='mso-bidi-font-style:normal'><span style='font-size:11.0pt'><span
style='mso-spacerun:yes'>  </span>Compensation for violating labour discipline
and material liability</span></i><b><i style='mso-bidi-font-style:normal'><span
style='font-size:8.0pt'><o:p></o:p></span></i></b></p>

<p class=MsoNormal style='line-height:15.0pt;mso-line-height-rule:exactly'><b><span
style='font-size:10.0pt;mso-bidi-font-size:9.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='text-indent:.5in;line-height:15.0pt;mso-line-height-rule:
exactly'><b><span style='font-size:13.0pt'>Điều 4: Nghĩa vụ và quyền hạn của
người sử dụng <span class=GramE>lao</span> động<o:p></o:p></span></b></p>

<p class=Style1 style='margin-left:0in;text-indent:0in;line-height:15.0pt;
mso-line-height-rule:exactly;mso-list:none;tab-stops:.5in'><span
style='font-size:10.0pt;mso-bidi-font-size:9.0pt;font-family:"Times New Roman"'><span
style='mso-spacerun:yes'>         </span><b style='mso-bidi-font-weight:normal'><i
style='mso-bidi-font-style:normal'><span style='mso-tab-count:1'>       </span>Article
4:<span style='mso-spacerun:yes'>  </span>Obligations and rights of employer<o:p></o:p></i></b></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly;tab-stops:9.0pt'><span class=GramE><b>1.Nghĩa</b></span><b> vụ: </b><span
style='font-size:10.0pt;mso-bidi-font-size:9.0pt'><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly;tab-stops:9.0pt'><span class=GramE><b style='mso-bidi-font-weight:normal'><i
style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;mso-bidi-font-size:
9.0pt'>1.Obiligations</span></i></b></span><b style='mso-bidi-font-weight:normal'><i
style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;mso-bidi-font-size:
9.0pt'><o:p></o:p></span></i></b></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l1 level1 lfo12;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:9.0pt;
mso-bidi-font-size:8.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Bảo đảm
việc làm và thực hiện đầy đủ những điều đã cam kết trong hợp đồng <span
class=GramE>lao</span> động.</span><span style='font-size:9.0pt;mso-bidi-font-size:
8.0pt'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:.25in;text-align:justify;line-height:
15.0pt;mso-line-height-rule:exactly'><i style='mso-bidi-font-style:normal'><span
style='font-size:11.0pt;mso-bidi-font-size:8.0pt'>To <span class=GramE>ensure<span
style='mso-spacerun:yes'>  </span>the</span> employment and fully implement
committed regulations in labour contract<o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l7 level1 lfo14;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:9.0pt;
mso-bidi-font-size:8.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Thanh
toán đầy đủ, đúng thời hạn các chế độ và quyền lợi cho người <span class=GramE>lao</span>
động theo hợp đồng lao động, thỏa ước lao động tập thể (nếu có).</span><span
style='font-size:9.0pt;mso-bidi-font-size:8.0pt'><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;text-indent:.25in;line-height:
15.0pt;mso-line-height-rule:exactly'><i style='mso-bidi-font-style:normal'><span
style='font-size:11.0pt;mso-bidi-font-size:8.0pt'>To pay fully and on times all
remuneration and other fringe benefits of employee in accordance with labour
contract, collective labour agreements, if any.<o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span class=GramE><b>2.Quyền</b></span><b> hạn:</b><b><span
style='font-size:13.0pt;mso-bidi-font-size:12.0pt'><o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span class=GramE><b style='mso-bidi-font-weight:normal'><i
style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;mso-bidi-font-size:
9.0pt'>2.Rights</span></i></b></span><b><i style='mso-bidi-font-style:normal'><span
style='font-size:14.0pt;mso-bidi-font-size:12.0pt'>:</span></i></b><b
style='mso-bidi-font-weight:normal'><i style='mso-bidi-font-style:normal'><span
style='font-size:11.0pt;mso-bidi-font-size:9.0pt'><o:p></o:p></span></i></b></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l7 level1 lfo14;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:9.0pt;
mso-bidi-font-size:8.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Điều
hành người <span class=GramE>lao</span> động hoàn thành công việc theo hợp đồng
(bố trí, điều chuyển, tạm ngừng việc…).</span><span style='font-size:9.0pt;
mso-bidi-font-size:8.0pt'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:.25in;text-align:justify;line-height:
15.0pt;mso-line-height-rule:exactly'><i style='mso-bidi-font-style:normal'><span
style='font-size:11.0pt;mso-bidi-font-size:8.0pt'>To manage the employees to
fulfill the works in accordance with labour contract (assign, appcint<span
class=GramE>,postpone</span>…)<o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:0in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l7 level1 lfo14;
tab-stops:list .25in'><![if !supportLists]><span style='font-size:14.0pt;
mso-bidi-font-size:13.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol;mso-bidi-font-weight:bold'><span style='mso-list:
Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Tạm
hoãn, chấm dứt hợp đồng <span class=GramE>lao</span> động, kỷ luật nguời lao
động theo quy định của pháp luật, thỏa ước lao động tập thể (nếu có) và nội quy
lao động của doanh nghiệp.</span><b><span style='font-size:14.0pt;mso-bidi-font-size:
13.0pt'><o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-left:.25in;text-align:justify;text-indent:
-.25in;line-height:15.0pt;mso-line-height-rule:exactly'><i style='mso-bidi-font-style:
normal'><span style='mso-bidi-font-size:11.0pt'><span
style='mso-spacerun:yes'>     </span></span></i><i style='mso-bidi-font-style:
normal'><span style='font-size:13.0pt;mso-bidi-font-size:11.0pt'><span
style='mso-spacerun:yes'> </span></span></i><i style='mso-bidi-font-style:normal'><span
style='font-size:11.0pt;mso-bidi-font-size:8.0pt'>To postpone, terminate the
labour contract, penalty the employee in accordance with the law, collective
labour agreement (if any) and internal labour regulations of enterprises.<o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:.25in;text-align:justify;text-indent:
-.25in;line-height:15.0pt;mso-line-height-rule:exactly'><b><i style='mso-bidi-font-style:
normal'><span style='font-size:15.0pt;mso-bidi-font-size:13.0pt'><o:p>&nbsp;</o:p></span></i></b></p>

<p class=MsoNormal style='text-align:justify;text-indent:.5in;line-height:15.0pt;
mso-line-height-rule:exactly'><b><span style='font-size:13.0pt'>Điều 5: Điều
khoản thi hành</span></b><b><i style='mso-bidi-font-style:normal'><span
style='font-size:15.0pt;mso-bidi-font-size:13.0pt'><o:p></o:p></span></i></b></p>

<p class=Style1 style='margin-left:0in;text-indent:.5in;line-height:15.0pt;
mso-line-height-rule:exactly;mso-list:none;tab-stops:.5in'><b style='mso-bidi-font-weight:
normal'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;
mso-bidi-font-size:10.0pt;font-family:"Times New Roman"'>Article 5:
Implementation provisions<o:p></o:p></span></i></b></p>


<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:.5in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l7 level1 lfo14;
tab-stops:45.0pt'><![if !supportLists]><span style='font-size:10.0pt;
mso-bidi-font-size:9.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>-<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span></span></span><![endif]><span
style='mso-bidi-font-size:11.0pt'>Những vấn đề về lao động không ghi trong hợp
đồng lao động thì áp dụng quy định của thỏa ước tập thể, trường hợp chưa có
thỏa ước tập thể thì áp dụng quy định của pháp luật lao động<span class=GramE>..</span></span><span
style='font-size:10.0pt;mso-bidi-font-size:9.0pt'><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly;tab-stops:45.0pt'><span style='font-size:13.0pt;mso-bidi-font-size:
11.0pt'><span style='mso-spacerun:yes'> </span><span style='mso-tab-count:1'>              </span></span><i
style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;mso-bidi-font-size:
10.0pt'>The problems concerning with labour is not defined in labour contract
shall be apply with provisions of collective labour agreement. In case of not
having collective labour agreement shall be applied regulation of labour
legislation.<o:p></o:p></span></i></p>

<p class=MsoNormal style='margin-left:0in;text-align:justify;text-indent:.5in;
line-height:15.0pt;mso-line-height-rule:exactly;mso-list:l7 level1 lfo14;
tab-stops:list 45.0pt'><![if !supportLists]><span style='font-size:10.0pt;
font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:Symbol'><span
style='mso-list:Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;
</span></span></span><![endif]><span style='mso-bidi-font-size:11.0pt'>Hợp đồng
<span class=GramE>lao</span> động được làm thành 02 bản có giá trị ngang nhau,
mỗi bên giữ một bản và có hiệu lực từ ngày <%= dt_total.Rows[i][33].ToString() %> tháng <%= dt_total.Rows[i][34].ToString() %> năm <%= dt_total.Rows[i][35].ToString() %></span><span
style='font-size:13.0pt;mso-bidi-font-size:12.0pt'>. </span><span
style='mso-bidi-font-size:11.0pt'>Khi hai bên ký kết phụ lục hợp đồng <span
class=GramE>lao</span> động thì nội dung của phụ lục hợp đồng lao động cũng có
giá trị như các nội dung của bản hợp đồng lao động này.</span><i
style='mso-bidi-font-style:normal'><span style='font-size:10.0pt'><o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;text-indent:.5in;line-height:15.0pt;
mso-line-height-rule:exactly'><i style='mso-bidi-font-style:normal'><span
style='font-size:10.0pt'><span style='mso-spacerun:yes'> </span></span></i><i
style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;mso-bidi-font-size:
10.0pt'><span style='mso-spacerun:yes'>  </span>Labour contract is made in 2
copies of equal validity, each party keeps one copy and comes into force on
date <%= dt_total.Rows[i][33].ToString() %> month <%= dt_total.Rows[i][34].ToString() %> year <%= dt_total.Rows[i][35].ToString() %>. When both parties sign appendix of
labour contract, the content of appendix shall be valued as the contents of
this labour contract.<o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;text-indent:.5in;line-height:15.0pt;
mso-line-height-rule:exactly'><span style='mso-bidi-font-size:11.0pt'><span
style='mso-spacerun:yes'>  </span>Hợp đồng này làm tại <%= dt_total.Rows[i]["CO_LNAME"].ToString() %> ngày
<%= dt_total.Rows[i][1].ToString() %> tháng <%= dt_total.Rows[i][2].ToString() %> năm <%= dt_total.Rows[i][3].ToString() %><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;
mso-bidi-font-size:12.0pt'><span style='mso-tab-count:1'>            </span><span
style='mso-spacerun:yes'>   </span>This labour contract is made at<span
style='mso-tab-count:1'>        </span><span
style='mso-spacerun:yes'>           </span><span
style='mso-spacerun:yes'>     </span>on date<span
style='mso-spacerun:yes'>         </span>month<span
style='mso-spacerun:yes'>      </span>year<o:p></o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:10.0pt;
mso-bidi-font-size:8.0pt'><o:p>&nbsp;</o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><i style='mso-bidi-font-style:normal'><span style='font-size:10.0pt;
mso-bidi-font-size:8.0pt'><o:p>&nbsp;</o:p></span></i></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'><span style='mso-tab-count:
1'>            </span><b style='mso-bidi-font-weight:normal'>NGƯỜI LAO ĐỘNG<span
style='mso-tab-count:4'>                                                </span>NGƯỜI
SỬ DỤNG LAO ĐỘNG<o:p></o:p></b></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><b style='mso-bidi-font-weight:normal'><span style='mso-bidi-font-size:
11.0pt'><span style='mso-spacerun:yes'> </span><span
style='mso-spacerun:yes'>                </span></span></b><b style='mso-bidi-font-weight:
normal'><span style='font-size:11.0pt;mso-bidi-font-size:10.0pt'>EMPLOYEE</span></b><b
style='mso-bidi-font-weight:normal'><span style='mso-bidi-font-size:11.0pt'><span
style='mso-tab-count:6'>                                                                      </span></span></b><b
style='mso-bidi-font-weight:normal'><span style='font-size:11.0pt;mso-bidi-font-size:
10.0pt'>EMPLOYER<o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'><span
style='mso-spacerun:yes'>                 </span>(Ký Tên)<span class=GramE>/<i
style='mso-bidi-font-style:normal'>(</i></span><i style='mso-bidi-font-style:
normal'>Sign)<span style='mso-tab-count:1'>       </span></i><span
style='mso-tab-count:4'>                                                </span>(Ký
tên, đóng dấu)/<i style='mso-bidi-font-style:normal'>(Sign and stamp)<o:p></o:p></i></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'><span
style='mso-spacerun:yes'>         </span>Ghi rõ họ và tên/<i style='mso-bidi-font-style:
normal'>Write full name</i><span style='mso-tab-count:3'>                         </span><span
style='mso-spacerun:yes'>  </span>Ghi rõ họ và tên/<i style='mso-bidi-font-style:
normal'>Write full name</i><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly'><span style='mso-bidi-font-size:11.0pt'><o:p>&nbsp;</o:p></span></p>


<p class=MsoNormal style='text-align:justify;line-height:15.0pt;mso-line-height-rule:
exactly;tab-stops:center 99.0pt 5.0in'><span style='mso-bidi-font-size:11.0pt'><span
style='mso-tab-count:1'>             </span><b style='mso-bidi-font-weight:
normal'><%= dt_total.Rows[i][4].ToString() %></b><span style='mso-tab-count:1'>                                                       </span><b
style='mso-bidi-font-weight:normal'><%= dt_name.Rows[1][1].ToString() %><o:p></o:p></b></span></p>

 <%
     if (i == irow - 1)//nhan vien cuoi cung 
     { 
         %>
         
<b><span style='font-size:12.0pt;font-family:"Times New Roman";mso-fareast-font-family:
"Times New Roman";mso-ansi-language:EN-US;mso-fareast-language:EN-US;
mso-bidi-language:AR-SA'><br clear=all >
</span></b>
         <%
     }
     else
     {   
  %>
    
<b><span style='font-size:12.0pt;font-family:"Times New Roman";mso-fareast-font-family:
"Times New Roman";mso-ansi-language:EN-US;mso-fareast-language:EN-US;
mso-bidi-language:AR-SA'><br clear=all style='page-break-before:always'>
</span></b>
<% 
     }
    }
%>


</div>

</body>

</html>
