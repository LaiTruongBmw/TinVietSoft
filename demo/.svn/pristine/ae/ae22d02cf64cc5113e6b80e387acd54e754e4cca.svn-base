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
    
    string pk_list = Request["pk_list"].ToString();
    pk_list = pk_list.Substring(0, pk_list.Length - 1);
    
    string SQL
    = "Select A.Decide_no As Num      " + 
        ",B.Full_name As Full_name      " +
        ",(Case When Length(B.Birth_dt)=8 Then  to_char(to_date(b.birth_dt,'yyyymmdd'),'dd/mm/yyyy') else b.birth_dt End ) As Birthdate    " +
        ",(Select Code_nm From Vhr_hr_code Where Id='HR0021' And Code=B.Place_birth ) As Place_birth    " +
        ",B.Permanent_addr As Permanent_add     " +
        ",Substr(A.APPLY_FROM_DT,1,4) As Fromyear   " +
        ",Substr(A.APPLY_FROM_DT,5,2) As Frommonth   " +
        ",Substr(A.APPLY_FROM_DT,7.2) As Fromdate   " +
        ",(case when length(A.APPLY_TO_DT)>0 then Substr(A.APPLY_TO_DT ,1,4) else substr(A.APPLY_FROM_DT,1,4) end ) As Toyear   " +
        ",(case when length(A.APPLY_TO_DT)>0 then Substr(A.APPLY_TO_DT ,5,2) else substr(A.APPLY_FROM_DT,5,2) end ) As Tomonth   " +
        ",(case when length(A.APPLY_TO_DT)>0 then Substr(A.APPLY_TO_DT ,7,2) else substr(A.APPLY_FROM_DT,7,2) end ) As Todate   " +
        ",(Select Upper(Code_fnm) From Vhr_hr_code Where Id = 'HR0221' And Code = A.APPOINTMENT_TYPE ) Kind      " +
        ",(select code_fnm From vhr_hr_code where id = 'HR0221' and code = A.APPOINTMENT_TYPE ) kind_f  " +
        ",(case when a.APPOINTMENT_TYPE= '01' then (select C.ORG_LNM from tco_org c where c.del_if = 0 and c.pk = A.OLD_PK) else A.OLD_VALUE end) as Old_value   " +
        ",(case when a.APPOINTMENT_TYPE= '01' then (select C.ORG_LNM from tco_org c where c.del_if = 0 and c.pk = A.NEW_PK) else A.NEW_VALUE end) as New_value         " +
        ",(Select Co.Partner_lname From Tco_company Co Where Co.Del_if=0 And Co.Pk=B.Tco_company_pk) Co_lname " +
        "From Thr_appointment A,Thr_employee B,Tco_org C " +
        "Where A.Del_if=0 And B.Del_if=0 And C.Del_if=0      " +
        "And B.Pk=A.Thr_emp_pk     " +
        "And C.Pk=B.Tco_org_pk     " +
        "And A.Pk In (" + pk_list + ") " ;

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
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 11">
<meta name=Originator content="Microsoft Word 11">
<link rel=File-List href="rpt_decision_appointment_files/filelist.xml">
<title>C&#7897;ng Hòa Xã H&#7897;i Ch&#7911; Ngh&#297;a Vi&#7879;t Nam</title>
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Administrator</o:Author>
  <o:Template>Normal</o:Template>
  <o:LastAuthor>LEVAN</o:LastAuthor>
  <o:Revision>2</o:Revision>
  <o:TotalTime>129</o:TotalTime>
  <o:Created>2018-04-05T04:37:00Z</o:Created>
  <o:LastSaved>2018-04-05T04:37:00Z</o:LastSaved>
  <o:Pages>1</o:Pages>
  <o:Words>155</o:Words>
  <o:Characters>887</o:Characters>
  <o:Lines>7</o:Lines>
  <o:Paragraphs>2</o:Paragraphs>
  <o:CharactersWithSpaces>1040</o:CharactersWithSpaces>
  <o:Version>16.00</o:Version>
 </o:DocumentProperties>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]-->
<link rel=themeData href="rpt_hr_hrem01200_0_files/themedata.thmx">
<link rel=colorSchemeMapping
href="rpt_hr_hrem01200_0_files/colorschememapping.xml">
<!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:TrackMoves>false</w:TrackMoves>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>VI</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:UseWord2010TableStyleRules/>
   <w:DontGrowAutofit/>
   <w:DontUseIndentAsNumberingTabStop/>
   <w:FELineBreak11/>
   <w:WW11IndentRules/>
   <w:DontAutofitConstrainedTables/>
   <w:AutofitLikeWW11/>
   <w:HangulWidthLikeWW11/>
   <w:UseNormalStyleForList/>
   <w:DontVertAlignCellWithSp/>
   <w:DontBreakConstrainedForcedTables/>
   <w:DontVertAlignInTxbx/>
   <w:Word11KerningPairs/>
   <w:CachedColBalance/>
  </w:Compatibility>
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
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="375">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
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
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
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
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
 </w:LatentStyles>
</xml><![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;
	mso-font-charset:2;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:0 268435456 0 0 -2147483648 0;}
@font-face
	{font-family:"Angsana New";
	panose-1:2 2 6 3 5 4 5 2 3 4;
	mso-font-charset:222;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:16777217 0 0 0 65536 0;}
@font-face
	{font-family:"Cordia New";
	panose-1:2 11 3 4 2 2 2 2 2 4;
	mso-font-charset:222;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:16777217 0 0 0 65536 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:-536869121 1107305727 33554432 0 415 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-536859905 -1073732485 9 0 511 0;}
@font-face
	{font-family:AngsanaUPC;
	mso-font-alt:"Leelawadee UI";
	mso-font-charset:222;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:0 0 0 0 65537 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:0cm;
	line-height:107%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";
	mso-ansi-language:EN-US;
	mso-fareast-language:EN-US;}
h4
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-link:"Heading 4 Char";
	mso-style-next:Normal;
	margin-top:12.0pt;
	margin-right:0cm;
	margin-bottom:3.0pt;
	margin-left:0cm;
	mso-pagination:widow-orphan;
	page-break-after:avoid;
	mso-outline-level:4;
	font-size:14.0pt;
	font-family:"Times New Roman",serif;
	mso-fareast-font-family:"Cordia New";
	color:black;
	mso-ansi-language:EN-US;
	mso-fareast-language:EN-US;
	mso-bidi-language:TH;}
p.MsoBodyText, li.MsoBodyText, div.MsoBodyText
	{mso-style-unhide:no;
	mso-style-link:"Body Text Char";
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:6.0pt;
	margin-left:0cm;
	mso-pagination:widow-orphan;
	font-size:16.0pt;
	font-family:"Angsana New",serif;
	mso-ascii-font-family:"Angsana New";
	mso-fareast-font-family:"Cordia New";
	mso-bidi-font-family:AngsanaUPC;
	color:black;
	mso-ansi-language:#0400;
	mso-fareast-language:#0400;
	mso-bidi-language:TH;}
span.Heading4Char
	{mso-style-name:"Heading 4 Char";
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-parent:"";
	mso-style-link:"Heading 4";
	mso-ansi-font-size:14.0pt;
	mso-bidi-font-size:14.0pt;
	font-family:"Cordia New",serif;
	mso-fareast-font-family:"Cordia New";
	color:black;
	mso-ansi-language:EN-US;
	mso-fareast-language:EN-US;
	mso-bidi-language:TH;
	font-weight:bold;}
span.BodyTextChar
	{mso-style-name:"Body Text Char";
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-parent:"";
	mso-style-link:"Body Text";
	mso-ansi-font-size:16.0pt;
	mso-bidi-font-size:16.0pt;
	font-family:"Angsana New",serif;
	mso-ascii-font-family:"Angsana New";
	mso-fareast-font-family:"Cordia New";
	mso-hansi-font-family:"Angsana New";
	mso-bidi-font-family:AngsanaUPC;
	color:black;
	mso-bidi-language:TH;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-fareast-font-family:Calibri;
	mso-hansi-font-family:Calibri;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:54.0pt 72.0pt 72.0pt 72.0pt;
	mso-header-margin:36.0pt;
	mso-footer-margin:36.0pt;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
 /* List Definitions */
 @list l0
	{mso-list-id:698549050;
	mso-list-type:hybrid;
	mso-list-template-ids:-660058024 -1312233510 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:18.0pt;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;
	font-family:"Times New Roman",serif;
	mso-fareast-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
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
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1026"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=VI style='tab-interval:36.0pt'>

<div class=WordSection1>
<%     
     for (int i = 0; i < irow; i++) 
    {      
    %> 
<p class=MsoBodyText style='margin-top:3.0pt;margin-right:0cm;margin-bottom:
3.0pt;margin-left:0cm;tab-stops:211.5pt 216.0pt'><b style='mso-bidi-font-weight:
normal'><span lang=EN-US style='font-size:10.0pt;font-family:"Times New Roman",serif;
mso-ansi-language:EN-US'><%= dt_total.Rows[i]["Co_lname"].ToString() %></span></b><span lang=EN-US style='font-family:"Calibri",sans-serif;
mso-bidi-font-family:AngsanaUPC;mso-ansi-language:EN-US'><span
style='mso-spacerun:yes'>    </span><span style='mso-tab-count:1'> </span></span><b
style='mso-bidi-font-weight:normal'><span lang=vi style='font-size:13.0pt;
font-family:"Times New Roman",serif'><span style='mso-tab-count:1'> </span>C&#7897;ng
Hòa Xã H&#7897;i Ch&#7911; Ngh&#297;a Vi&#7879;t Nam<o:p></o:p></span></b></p>

<p class=MsoBodyText style='margin-top:3.0pt;margin-right:0cm;margin-bottom:
3.0pt;margin-left:0cm;tab-stops:right 212.65pt left 216.0pt'><b
style='mso-bidi-font-weight:normal'><span lang=EN-US style='font-size:13.0pt;
font-family:"Times New Roman",serif;mso-ansi-language:EN-US'>S&#7889;:
<%= dt_total.Rows[i]["Num"].ToString() %></span></b><b style='mso-bidi-font-weight:normal'><span
lang=vi style='font-size:13.0pt;font-family:"Times New Roman",serif'><span
style='mso-tab-count:1'>                            </span><span
style='mso-tab-count:2'>           </span>&#272;&#7897;c l&#7853;p – T&#7921;
Do – H&#7841;nh Phúc<o:p></o:p></span></b></p>

<p class=MsoBodyText align=center style='margin-top:3.0pt;margin-right:0cm;
margin-bottom:3.0pt;margin-left:0cm;text-align:center'><b style='mso-bidi-font-weight:
normal'><span lang=vi style='font-size:13.0pt;font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:-.05pt;
margin-bottom:3.0pt;margin-left:0cm;text-align:center;line-height:normal'><b><span
lang=EN-US style='font-size:13.0pt;font-family:"Times New Roman",serif'>QUY&#7870;T
&#272;&#7882;NH THAY &#272;&#7892;I <%= dt_total.Rows[i]["Kind"].ToString() %><o:p></o:p></span></b></p>

<p class=MsoBodyText style='margin-top:3.0pt;margin-right:0cm;margin-bottom:
3.0pt;margin-left:0cm'><b><span lang=vi style='font-size:13.0pt;font-family:
"Times New Roman",serif;letter-spacing:-.7pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoBodyText align=center style='margin-top:3.0pt;margin-right:0cm;
margin-bottom:3.0pt;margin-left:0cm;text-align:center'><b><span lang=vi
style='font-size:13.0pt;font-family:"Times New Roman",serif;letter-spacing:
-.7pt'>GIÁM &#272;&#7888;C &#272;I&#7872;U HÀNH CÔNG TY</span></b><span
lang=vi style='font-size:13.0pt;font-family:"Times New Roman",serif;letter-spacing:
-.7pt'><o:p></o:p></span></p>

<p class=MsoBodyText style='margin-top:3.0pt;margin-right:0cm;margin-bottom:
3.0pt;margin-left:0cm;tab-stops:1.0cm'><span lang=vi style='font-size:13.0pt;
font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>

<p class=MsoBodyText style='margin-top:3.0pt;margin-right:0cm;margin-bottom:
3.0pt;margin-left:18.0pt;text-indent:4.0pt;mso-list:l0 level1 lfo1;tab-stops:
list 18.0pt'><![if !supportLists]><span lang=vi style='font-size:13.0pt;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'><span
style='mso-list:Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><i style='mso-bidi-font-style:normal'><span
lang=vi style='font-size:13.0pt;font-family:"Times New Roman",serif'>C&#259;n c&#7913;
quy&#7871;t &#273;&#7883;nh s&#7889; 001 b&#7893; nhi&#7879;m giám &#273;&#7889;c
&#273;i&#7873;u hành, ngày 31/12/2018;<o:p></o:p></span></i></p>

<p class=MsoBodyText style='margin-top:3.0pt;margin-right:0cm;margin-bottom:
3.0pt;margin-left:18.0pt;text-indent:4.0pt;mso-list:l0 level1 lfo1;tab-stops:
list 18.0pt'><![if !supportLists]><span lang=vi style='font-size:13.0pt;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'><span
style='mso-list:Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><i style='mso-bidi-font-style:normal'><span
lang=vi style='font-size:13.0pt;font-family:"Times New Roman",serif'>C&#259;n c&#7913;
b&#7843;n ch&#7913;c n&#259;ng nhi&#7879;m v&#7909; và quy&#7873;n h&#7841;n c&#7911;a
giám &#273;&#7889;c &#273;i&#7873;u hành s&#7889; 002;<span style='mso-tab-count:
1'>        </span><o:p></o:p></span></i></p>

<p class=MsoBodyText style='margin-top:3.0pt;margin-right:0cm;margin-bottom:
3.0pt;margin-left:18.0pt;text-indent:4.0pt;mso-list:l0 level1 lfo1;tab-stops:
list 18.0pt'><![if !supportLists]><span lang=vi style='font-size:13.0pt;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'><span
style='mso-list:Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><i style='mso-bidi-font-style:normal'><span
lang=vi style='font-size:13.0pt;font-family:"Times New Roman",serif'>C&#259;n c&#7913;
quy ch&#7871; k&#7927; lu&#7853;t c&#7911;a công ty.<o:p></o:p></span></i></p>

<p class=MsoBodyText style='margin-top:3.0pt;margin-right:0cm;margin-bottom:
3.0pt;margin-left:18.0pt;text-indent:4.0pt;mso-list:l0 level1 lfo1;tab-stops:
list 18.0pt'><![if !supportLists]><span lang=vi style='font-size:13.0pt;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'><span
style='mso-list:Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><i style='mso-bidi-font-style:normal'><span
lang=vi style='font-size:13.0pt;font-family:"Times New Roman",serif'>Xét &#273;&#7873;
ngh&#7883; c&#7911;a Tr&#432;&#7903;ng phòng NS;<o:p></o:p></span></i></p>

<p class=MsoBodyText style='margin-top:3.0pt;margin-right:0cm;margin-bottom:
3.0pt;margin-left:18.0pt'><i style='mso-bidi-font-style:normal'><span lang=vi
style='font-size:13.0pt;font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></i></p>

<p class=MsoBodyText style='margin-top:3.0pt;margin-right:0cm;margin-bottom:
3.0pt;margin-left:0cm;tab-stops:1.0cm center 260.65pt left 325.75pt'><b><span
lang=vi style='font-size:13.0pt;font-family:"Times New Roman",serif'><span
style='mso-tab-count:2'>                                                            </span>QUY&#7870;T
&#272;&#7882;NH:<span style='mso-tab-count:1'>      </span></span></b><span
lang=vi style='font-size:13.0pt;font-family:"Times New Roman",serif'><o:p></o:p></span></p>

<p class=MsoNormal align=center style='margin-top:3.0pt;margin-right:0cm;
margin-bottom:3.0pt;margin-left:36.0pt;text-align:center;line-height:normal'><b
style='mso-bidi-font-weight:normal'><span lang=NL style='font-size:13.0pt;
font-family:"Times New Roman",serif;mso-ansi-language:NL'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='margin-top:3.0pt;margin-right:0cm;margin-bottom:3.0pt;
margin-left:0cm;text-align:justify;line-height:normal'><b style='mso-bidi-font-weight:
normal'><span lang=NL style='font-size:13.0pt;font-family:"Times New Roman",serif;
mso-ansi-language:NL'>&#272;i&#7873;u 1.</span></b><span lang=NL
style='font-size:13.0pt;font-family:"Times New Roman",serif;mso-ansi-language:
NL'> Thay &#273;&#7893;i <%= dt_total.Rows[i]["kind_f"].ToString() %> &#273;&#7889;i v&#7899;i:<o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:3.0pt;margin-right:0cm;margin-bottom:3.0pt;
margin-left:0cm;text-align:justify;line-height:normal;tab-stops:92.15pt 467.8pt'><span
lang=NL style='font-size:13.0pt;font-family:"Times New Roman",serif;mso-ansi-language:
NL'>Ông (Bà)<span style='mso-tab-count:1'>            </span>: <%= dt_total.Rows[i]["Full_name"].ToString() %><span
style='mso-tab-count:1'>                          </span><span
style='mso-tab-count:1'>                          </span><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:3.0pt;margin-right:0cm;margin-bottom:3.0pt;
margin-left:0cm;text-align:justify;line-height:normal;tab-stops:78.0pt 92.15pt'><span
lang=NL style='font-size:13.0pt;font-family:"Times New Roman",serif;mso-ansi-language:
NL'>Sinh ngày<span style='mso-tab-count:2'>           </span>: <%= dt_total.Rows[i]["Birthdate"].ToString() %><span
style='mso-tab-count:3'>                          </span><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:3.0pt;margin-right:0cm;margin-bottom:3.0pt;
margin-left:0cm;text-align:justify;line-height:normal;tab-stops:92.15pt'><span
lang=NL style='font-size:13.0pt;font-family:"Times New Roman",serif;mso-ansi-language:
NL'>Quê quán<span style='mso-tab-count:1'>            </span>: <%= dt_total.Rows[i]["Place_birth"].ToString() %><span
style='mso-tab-count:6'>                                                         </span><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:3.0pt;margin-right:0cm;margin-bottom:3.0pt;
margin-left:0cm;text-align:justify;line-height:normal;tab-stops:92.15pt'><span
lang=NL style='font-size:13.0pt;font-family:"Times New Roman",serif;mso-ansi-language:
NL'>Ch&#7895; &#7903; hi&#7879;n t&#7841;i<span style='mso-tab-count:1'>     </span>:
<%= dt_total.Rows[i]["Permanent_add"].ToString() %><span style='mso-tab-count:1'> </span><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:3.0pt;margin-right:0cm;margin-bottom:3.0pt;
margin-left:0cm;text-align:justify;line-height:normal;tab-stops:92.15pt'><span
lang=NL style='font-size:13.0pt;font-family:"Times New Roman",serif;mso-ansi-language:
NL'><%= dt_total.Rows[i]["kind_f"].ToString() %> c&#361;<span style='mso-tab-count:1'>     </span>: <%= dt_total.Rows[i]["Old_value"].ToString() %><span
style='mso-tab-count:2'>                </span><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:3.0pt;margin-right:0cm;margin-bottom:3.0pt;
margin-left:0cm;text-align:justify;line-height:normal;tab-stops:92.15pt'><span
lang=NL style='font-size:13.0pt;font-family:"Times New Roman",serif;mso-ansi-language:
NL'><%= dt_total.Rows[i]["kind_f"].ToString() %> m&#7899;i<span style='mso-tab-count:1'>   </span>: <%= dt_total.Rows[i]["New_value"].ToString() %><span
style='mso-tab-count:6'>                                                          </span><span
style='mso-tab-count:1'>          </span><span style='mso-tab-count:1'>                          </span><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:3.0pt;margin-right:0cm;margin-bottom:3.0pt;
margin-left:0cm;text-align:justify;line-height:normal;tab-stops:36.0pt dotted 351.0pt'><span
lang=NL style='font-size:13.0pt;font-family:"Times New Roman",serif;mso-ansi-language:
NL'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-top:3.0pt;margin-right:0cm;margin-bottom:3.0pt;
margin-left:0cm;text-align:justify;line-height:normal'><b style='mso-bidi-font-weight:
normal'><span lang=NL style='font-size:13.0pt;font-family:"Times New Roman",serif;
mso-ansi-language:NL'>&#272;i&#7873;u 2. </span></b><span lang=NL
style='font-size:13.0pt;font-family:"Times New Roman",serif;mso-ansi-language:
NL'>Quy&#7871;t &#273;&#7883;nh này thi hành k&#7875;<span
style='mso-spacerun:yes'>  </span>t&#7915; ngày <%= dt_total.Rows[i]["Fromdate"].ToString() %> tháng <%= dt_total.Rows[i]["Frommonth"].ToString() %> n&#259;m <%= dt_total.Rows[i]["Fromyear"].ToString() %> &#273;&#7871;n ngày <%= dt_total.Rows[i]["Todate"].ToString() %> tháng <%= dt_total.Rows[i]["Tomonth"].ToString() %> n&#259;m <%= dt_total.Rows[i]["Toyear"].ToString() %>.<span
style='mso-spacerun:yes'>                                                                                                                                                         
</span><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:3.0pt;margin-right:0cm;margin-bottom:3.0pt;
margin-left:0cm;text-align:justify;line-height:normal'><b style='mso-bidi-font-weight:
normal'><span lang=NL style='font-size:13.0pt;font-family:"Times New Roman",serif;
mso-ansi-language:NL'>&#272;i&#7873;u 3.</span></b><span lang=NL
style='font-size:13.0pt;font-family:"Times New Roman",serif;mso-ansi-language:
NL'> Các Ông(bà) tr&#432;&#7903;ng phòng nhân s&#7921;, tr&#432;&#7903;ng phòng
t&#7893; ch&#7913;c, và ông (bà) <%= dt_total.Rows[i]["Full_name"].ToString() %> có trách nhi&#7879;m thi hành quy&#7871;t
&#273;&#7883;nh này.<o:p></o:p></span></p>

<p class=MsoNormal><span lang=EN-US style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-left:324.0pt;text-indent:36.0pt'><b
style='mso-bidi-font-weight:normal'><span lang=EN-US style='font-size:13.0pt;
line-height:107%;font-family:"Times New Roman",serif'>GIÁM &#272;&#7888;C<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-left:324.0pt'><b style='mso-bidi-font-weight:
normal'><span lang=EN-US style='font-size:13.0pt;line-height:107%;font-family:
"Times New Roman",serif'><span style='mso-spacerun:yes'>      </span><o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-left:324.0pt'><b style='mso-bidi-font-weight:
normal'><span lang=EN-US style='font-size:13.0pt;line-height:107%;font-family:
"Times New Roman",serif'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='margin-left:324.0pt'><b style='mso-bidi-font-weight:
normal'><span lang=EN-US style='font-size:13.0pt;line-height:107%;font-family:
"Times New Roman",serif'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='margin-left:324.0pt'><b style='mso-bidi-font-weight:
normal'><span lang=EN-US style='font-size:13.0pt;line-height:107%;font-family:
"Times New Roman",serif'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='margin-left:324.0pt'><b style='mso-bidi-font-weight:
normal'><span lang=EN-US style='font-size:13.0pt;line-height:107%;font-family:
"Times New Roman",serif'><span style='mso-spacerun:yes'>       </span>Nguy&#7877;n
V&#361; Phong<o:p></o:p></span></b></p>
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
