<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
    
    string p_times,p_rpt_month;
     
    p_times       = Request["l_times"].ToString();
    p_rpt_month  = Request["l_rpt_month"].ToString();
   string SQL
	= "SELECT A.EMP_ID as c1  " + 
        ",A.FULL_NAME  c2  " +
        ",A.SO_BHXH c3  " +
        ",A.SO_BHYT  c4  " +
        ",DECODE(LENGTH(A.BIRTH_DT),4,A.BIRTH_DT,TO_CHAR(TO_DATE(A.BIRTH_DT,'YYYYMMDD'),'DD/MM/YYYY')) AS NGAYSINH5   " +
        ",DECODE(A.SEX,'F','X','') AS SEXc6  " +
        ",A.SO_CMT c7  " +
        ",TO_CHAR(TO_DATE(A.NGAY_CAP,'YYYYMMDD'),'DD/MM/YYYY') c8  " +
        ",(SELECT CHAR_1 FROM VHR_HR_CODE V WHERE V.ID='HR0014' AND V.CODE=A.TINH_CAP) c9  " +
        ",(SELECT CODE_FNM FROM VHR_HR_CODE V WHERE V.ID='HR0021' AND V.CODE=A.NGUYEN_QUAN) c10 " +
        ",(SELECT CODE_FNM FROM VHR_HR_CODE V WHERE V.ID='HR0008' AND V.CODE=A.CHUC_DANH) c11  " +
        ",A.ADDRESS c12  " +
        ",(SELECT CHAR_1 FROM VHR_HR_CODE V WHERE V.ID='HR0012' AND V.CODE=A.HEALTH_PLACE) AS TINH13  " +
        ",(SELECT CHAR_2 FROM VHR_HR_CODE V WHERE V.ID='HR0012' AND V.CODE=A.HEALTH_PLACE) AS BENHVIEN14  " +
        "FROM THR_INSURANCE_MANAGE A " +
        "WHERE A.DEL_IF=0 AND A.THANG_BC='" + p_rpt_month + "' " +
        "AND A.LOAI_BH in ('01','10') " +
        "AND A.LAN_BAO='" + p_times + "' " +
        "ORDER BY A.LOAI_BH,A.EMP_ID ";

//Response.Write(SQL);
//Response.End();
    DataTable dt_Emp = CtlLib.TableReadOpen(SQL);
    int irow_emp,icol_emp;
    irow_emp = dt_Emp.Rows.Count;
    icol_emp=dt_Emp.Columns.Count;
    
     if (irow_emp == 0)
    {
        Response.Write("There is no data");
        Response.End();
    }
     
    //getting information of labels 
    SQL
    = "select code_fnm,to_char(sysdate,'dd/mm/yyyy')  " +
        "from vhr_hr_code " +
        "where id='HR0049'  order by code ";
    DataTable dt_name = CtlLib.TableReadOpen(SQL);
    int irow_name;
    irow_name = dt_name.Rows.Count;
    if (irow_name <7)
    {
        Response.Write("You have to input enough information of HR0049 code");
        Response.End();
    }
    %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="01a-TBH_files/filelist.xml">
<link rel=Edit-Time-Data href="01a-TBH_files/editdata.mso">
<link rel=OLE-Object-Data href="01a-TBH_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>truong</o:Author>
  <o:LastAuthor>Ho Thu Hien</o:LastAuthor>
  <o:LastPrinted>2010-06-18T06:52:16Z</o:LastPrinted>
  <o:Created>2010-06-18T06:51:40Z</o:Created>
  <o:LastSaved>2010-06-18T07:17:09Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
 <o:OfficeDocumentSettings>
  <o:RelyOnVML/>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.28in .1in .27in .11in;
	mso-header-margin:.14in;
	mso-footer-margin:.16in;
	mso-page-orientation:landscape;}
.font10
	{color:windowtext;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font29
	{color:black;
	font-size:8.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma;
	mso-generic-font-family:auto;
	mso-font-charset:0;}
.font30
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma;
	mso-generic-font-family:auto;
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
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl26
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl27
	{mso-style-parent:style16;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center-across;
	vertical-align:middle;}
.xl28
	{mso-style-parent:style0;
	font-size:13.0pt;}
.xl29
	{mso-style-parent:style0;
	font-size:13.0pt;
	mso-number-format:"Short Date";
	text-align:center;}
.xl30
	{mso-style-parent:style0;
	font-size:13.0pt;
	text-align:center;}
.xl31
	{mso-style-parent:style16;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl32
	{mso-style-parent:style0;
	font-size:12.0pt;}
.xl33
	{mso-style-parent:style16;
	font-size:13.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center-across;
	vertical-align:middle;}
.xl34
	{mso-style-parent:style0;
	font-size:13.0pt;
	mso-number-format:"Short Date";}
.xl35
	{mso-style-parent:style16;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl36
	{mso-style-parent:style16;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl37
	{mso-style-parent:style16;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl38
	{mso-style-parent:style16;
	font-size:13.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl39
	{mso-style-parent:style16;
	font-size:12.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl40
	{mso-style-parent:style16;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center-across;
	vertical-align:middle;}
.xl41
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center-across;
	vertical-align:top;}
.xl42
	{mso-style-parent:style0;
	text-align:center;}
.xl43
	{mso-style-parent:style0;
	font-size:13.0pt;
	text-align:left;}
.xl44
	{mso-style-parent:style16;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl45
	{mso-style-parent:style16;
	font-size:12.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl46
	{mso-style-parent:style16;
	font-size:13.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl47
	{mso-style-parent:style16;
	font-size:13.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl48
	{mso-style-parent:style16;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl49
	{mso-style-parent:style16;
	font-size:11.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:left;
	vertical-align:middle;
	white-space:normal;}
.xl50
	{mso-style-parent:style16;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Scientific;}
.xl51
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl52
	{mso-style-parent:style0;}
.xl53
	{mso-style-parent:style16;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl54
	{mso-style-parent:style16;
	font-size:13.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl55
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl56
	{mso-style-parent:style16;
	font-size:13.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;}
.xl57
	{mso-style-parent:style16;
	font-size:13.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;}
.xl58
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl59
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;}
.xl60
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl61
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl62
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl63
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl64
	{mso-style-parent:style16;
	font-size:11.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl65
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl69
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl70
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl71
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl72
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl73
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl74
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl75
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl76
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl77
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	vertical-align:middle;}
.xl78
	{mso-style-parent:style0;
	font-size:13.0pt;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl79
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl80
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl81
	{mso-style-parent:style0;
	font-size:13.0pt;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#FFFF99;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl82
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl83
	{mso-style-parent:style0;
	font-size:13.0pt;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl84
	{mso-style-parent:style0;
	font-size:13.0pt;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl85
	{mso-style-parent:style0;
	font-size:13.0pt;
	vertical-align:middle;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl86
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl87
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl88
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl89
	{mso-style-parent:style0;
	font-size:13.0pt;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl90
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl91
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl92
	{mso-style-parent:style0;
	font-size:13.0pt;
	border:.5pt solid windowtext;}
.xl93
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl94
	{mso-style-parent:style0;
	font-size:13.0pt;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;}
.xl95
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl96
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl97
	{mso-style-parent:style0;
	font-size:13.0pt;
	text-align:center;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;}
.xl98
	{mso-style-parent:style0;
	font-size:13.0pt;
	text-align:center;
	vertical-align:middle;}
.xl99
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl100
	{mso-style-parent:style0;
	font-size:13.0pt;
	background:white;
	mso-pattern:auto none;}
.xl101
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-style:italic;
	text-decoration:underline;
	text-underline-style:single;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl102
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";}
.xl103
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl104
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	text-align:center;}
.xl105
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl106
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl107
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";}
.xl108
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl109
	{mso-style-parent:style16;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;}
.xl110
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl111
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;}
.xl112
	{mso-style-parent:style0;
	font-size:12.0pt;
	text-align:center;}
.xl113
	{mso-style-parent:style0;
	font-size:11.0pt;
	text-align:left;}
.xl114
	{mso-style-parent:style0;
	font-size:11.0pt;}
.xl115
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl116
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;}
.xl117
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;}
.xl118
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"mm\/dd\/yyyy";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl119
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl120
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:VNI-Times;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl121
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:VNI-Times, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl122
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:VNI-Times, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl123
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl124
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:white;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl125
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl126
	{mso-style-parent:style0;
	font-size:13.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl127
	{mso-style-parent:style0;
	font-size:13.0pt;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl128
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl129
	{mso-style-parent:style16;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	background:white;
	mso-pattern:auto none;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
-->
</style>
<![if !supportAnnotations]><style id="dynCom" type="text/css"><!-- --></style>

<script language="JavaScript"><!--

function msoCommentShow(com_id,anchor_id) {
	if(msoBrowserCheck()) {
	   c = document.all(com_id);
	   a = document.all(anchor_id);
	   if (null != c) {
		var cw = c.offsetWidth;
		var ch = c.offsetHeight;
		var aw = a.offsetWidth;
		var ah = a.offsetHeight;
		var x = a.offsetLeft;
		var y = a.offsetTop;
		var el = a;
		while (el.tagName != "BODY") {
		   el = el.offsetParent;
		   x = x + el.offsetLeft;
		   y = y + el.offsetTop;
		   }		
		var bw = document.body.clientWidth;
		var bh = document.body.clientHeight;
		var bsl = document.body.scrollLeft;
		var bst = document.body.scrollTop;
		if (x + cw + ah/2 > bw + bsl && x + aw - ah/2 - cw >= bsl ) {
		   c.style.left = x + aw - ah / 2 - cw; 
		}
		else {
		   c.style.left = x + ah/2; 
		}
		if (y + ch + ah/2 > bh + bst && y + ah/2 - ch >= bst ) {
	 	   c.style.top = y + ah/2 - ch;
		} 
		else {
		   c.style.top = y + ah/2;
		}
		c.style.visibility = "visible";
	   }
	}
}

function msoCommentHide(com_id) {
	if(msoBrowserCheck()) {
	  c = document.all(com_id)
	  if (null != c) {
	    c.style.visibility = "hidden";
	    c.style.left = "-10000";
	    c.style.top = "-10000";
	  }
	}
}

function msoBrowserCheck() {
 ms=navigator.appVersion.indexOf("MSIE");
 vers = navigator.appVersion.substring(ms+5, ms+6);
 ie4 = (ms>0) && (parseInt(vers) >=4);
 return ie4
}

if (msoBrowserCheck()) {
document.styleSheets.dynCom.addRule(".msocomspan1","position:absolute");
document.styleSheets.dynCom.addRule(".msocomspan2","position:absolute");
document.styleSheets.dynCom.addRule(".msocomspan2","left:-1.5ex");
document.styleSheets.dynCom.addRule(".msocomspan2","width:2ex");
document.styleSheets.dynCom.addRule(".msocomspan2","height:0.5em");
document.styleSheets.dynCom.addRule(".msocomanch","font-size:0.5em");
document.styleSheets.dynCom.addRule(".msocomanch","color:red");
document.styleSheets.dynCom.addRule(".msocomhide","display: none");
document.styleSheets.dynCom.addRule(".msocomtxt","visibility: hidden");
document.styleSheets.dynCom.addRule(".msocomtxt","position: absolute");        
document.styleSheets.dynCom.addRule(".msocomtxt","top:-10000");         
document.styleSheets.dynCom.addRule(".msocomtxt","left:-10000");         
document.styleSheets.dynCom.addRule(".msocomtxt","width: 33%");                 
document.styleSheets.dynCom.addRule(".msocomtxt","background: infobackground");
document.styleSheets.dynCom.addRule(".msocomtxt","color: infotext");
document.styleSheets.dynCom.addRule(".msocomtxt","border-top: 1pt solid threedlightshadow");
document.styleSheets.dynCom.addRule(".msocomtxt","border-right: 2pt solid threedshadow");
document.styleSheets.dynCom.addRule(".msocomtxt","border-bottom: 2pt solid threedshadow");
document.styleSheets.dynCom.addRule(".msocomtxt","border-left: 1pt solid threedlightshadow");
document.styleSheets.dynCom.addRule(".msocomtxt","padding: 3pt 3pt 3pt 3pt");
document.styleSheets.dynCom.addRule(".msocomtxt","z-index: 100");
}

// -->
</script>
<![endif]><!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>1a</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>330</x:DefaultRowHeight>
     <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>63</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>180</x:VerticalResolution>
     </x:Print>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>8</x:ActiveRow>
       <x:ActiveCol>8</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>7680</x:WindowHeight>
  <x:WindowWidth>19035</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>75</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>_FilterDatabase</x:Name>
  <x:Hidden/>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>='1a'!$A$10:$IK$61</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl52>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1813 style='border-collapse:
 collapse;table-layout:fixed;width:1360pt'>
 <col class=xl30 width=45 style='mso-width-source:userset;mso-width-alt:1645;
 width:34pt'>
 <col class=xl42 width=55 style='mso-width-source:userset;mso-width-alt:2011;
 width:41pt'>
 <col class=xl43 width=169 style='mso-width-source:userset;mso-width-alt:6180;
 width:127pt'>
 <col class=xl28 width=125 style='mso-width-source:userset;mso-width-alt:4571;
 width:94pt'>
 <col class=xl28 width=91 style='mso-width-source:userset;mso-width-alt:3328;
 width:68pt'>
 <col class=xl29 width=121 style='mso-width-source:userset;mso-width-alt:4425;
 width:91pt'>
 <col class=xl30 width=55 style='mso-width-source:userset;mso-width-alt:2011;
 width:41pt'>
 <col class=xl112 width=111 style='mso-width-source:userset;mso-width-alt:4059;
 width:83pt'>
 <col class=xl29 width=91 style='mso-width-source:userset;mso-width-alt:3328;
 width:68pt'>
 <col class=xl30 width=57 style='mso-width-source:userset;mso-width-alt:2084;
 width:43pt'>
 <col class=xl52 width=107 style='mso-width-source:userset;mso-width-alt:3913;
 width:80pt'>
 <col class=xl42 width=102 style='mso-width-source:userset;mso-width-alt:3730;
 width:77pt'>
 <col class=xl113 width=288 style='mso-width-source:userset;mso-width-alt:10532;
 width:216pt'>
 <col class=xl114 width=48 style='mso-width-source:userset;mso-width-alt:1755;
 width:36pt'>
 <col class=xl114 width=71 style='mso-width-source:userset;mso-width-alt:2596;
 width:53pt'>
 <col class=xl52 width=90 style='mso-width-source:userset;mso-width-alt:3291;
 width:68pt'>
 <col class=xl52 width=79 style='mso-width-source:userset;mso-width-alt:2889;
 width:59pt'>
 <col class=xl52 width=108 style='mso-width-source:userset;mso-width-alt:3949;
 width:81pt'>
 <tr class=xl32 height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl24 colspan=3 width=269 style='height:22.5pt;mso-ignore:
  colspan;width:202pt' x:str="Mã  đơn vị: <%=dt_name.Rows[1][0].ToString() %>             Mã KCB:<%=dt_name.Rows[11][0].ToString() %> ">Mã<span
  style='mso-spacerun:yes'>  </span>đơn vị: <%=dt_name.Rows[1][0].ToString() %><span
  style='mso-spacerun:yes'>             </span>Mã KCB:<%=dt_name.Rows[11][0].ToString() %><span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl27 width=125 style='width:94pt'></td>
  <td class=xl28 width=91 style='width:68pt'></td>
  <td class=xl29 width=121 style='width:91pt'></td>
  <td class=xl30 width=55 style='width:41pt'></td>
  <td colspan=8 class=xl31 width=875 style='width:656pt'></td>
  <td class=xl32 width=90 style='width:68pt'></td>
  <td class=xl32 width=79 style='width:59pt'></td>
  <td class=xl32 width=108 style='width:81pt'></td>
 </tr>
 <tr class=xl32 height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl24 colspan=3 style='height:22.5pt;mso-ignore:colspan'>Tên
  đơn vị: <font class="font10"><%=dt_name.Rows[0][0].ToString() %></font></td>
  <td class=xl33></td>
  <td class=xl28></td>
  <td class=xl34></td>
  <td class=xl28></td>
  <td colspan=6 class=xl128>DANH SÁCH LAO ĐỘNG ĐỀ NGHỊ CẤP SỔ BHXH, THẺ BHYT</td>
  <td colspan=3 class=xl129 width=209 style='width:157pt'>Mẫu số: 01a-TBH</td>
  <td colspan=2 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl32 height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl35 colspan=2 style='height:22.5pt;mso-ignore:colspan'>Địa
  chỉ: <%=dt_name.Rows[2][0].ToString() %></td>
  <td class=xl36></td>
  <td colspan=2 class=xl35 style='mso-ignore:colspan'></td>
  <td class=xl37></td>
  <td class=xl38></td>
  <td class=xl39></td>
  <td colspan=5 class=xl39>Số<span style='mso-spacerun:yes'>  </span>01<span
  style='mso-spacerun:yes'>   </span>tháng <%=p_rpt_month.Substring(4,2) %> Năm <%=p_rpt_month.Substring(0,4) %></td>
  <td class=xl40></td>
  <td class=xl41></td>
  <td colspan=3 class=xl32 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl28 style='height:16.5pt'></td>
  <td class=xl42></td>
  <td class=xl43></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
  <td class=xl34></td>
  <td class=xl44></td>
  <td class=xl45></td>
  <td class=xl46></td>
  <td class=xl47></td>
  <td colspan=2 class=xl48 style='mso-ignore:colspan'></td>
  <td class=xl49></td>
  <td class=xl50></td>
  <td class=xl51></td>
  <td colspan=3 class=xl52 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl38 style='height:16.5pt'></td>
  <td class=xl53></td>
  <td class=xl54></td>
  <td colspan=2 class=xl55 style='mso-ignore:colspan'></td>
  <td class=xl56></td>
  <td class=xl57></td>
  <td class=xl58></td>
  <td class=xl59></td>
  <td class=xl60></td>
  <td class=xl62></td>
  <td class=xl61></td>
  <td class=xl63></td>
  <td class=xl51></td>
  <td class=xl64></td>
  <td colspan=3 class=xl52 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=40 style='mso-height-source:userset;height:30.0pt'>
  <td rowspan=2 height=138 class=xl65 width=45 style='height:103.5pt;
  width:34pt'>Số <br>
    TT</td>
  <td rowspan=2 class=xl130 width=55 style='border-bottom:.5pt solid black;
  width:41pt'>Mã NV</td>
  <td rowspan=2 class=xl130 width=169 style='border-bottom:.5pt solid black;
  width:127pt'>Họ và tên</td>
  <td rowspan=2 class=xl65 width=125 style='width:94pt'>Số sổ BHXH</td>
  <td rowspan=2 class=xl65 width=91 style='width:68pt' x:str="Số thẻ BHYT ">Số
  thẻ BHYT<span style='mso-spacerun:yes'> </span></td>
  <td rowspan=2 class=xl66 width=121 style='width:91pt'>Ngày, tháng, năm sinh</td>
  <td rowspan=2 class=xl65 width=55 style='width:41pt'>Nữ <br>
    (X)</td>
  <td colspan=3 class=xl132 width=259 style='border-right:.5pt solid black;
  border-left:none;width:194pt'>Số chứng minh thư</td>
  <td rowspan=2 class=xl65 width=107 style='width:80pt'>Nguyên quán</td>
  <td rowspan=2 class=xl130 width=102 style='border-bottom:.5pt solid black;
  width:77pt' x:str="Chức danh công việc ">Chức danh công việc<span
  style='mso-spacerun:yes'> </span></td>
  <td rowspan=2 class=xl130 width=288 style='border-bottom:.5pt solid black;
  width:216pt'>Địa chỉ</td>
  <td colspan=2 class=xl65 width=119 style='border-left:none;width:89pt'>Nơi
  đăng ký KCB ban đầu (mã số)</td>
  <td rowspan=2 class=xl126 style='border-bottom:.5pt solid black'>Ghi chú</td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=98 style='mso-height-source:userset;height:73.5pt'>
  <td height=98 class=xl67 width=111 style='height:73.5pt;border-top:none;
  border-left:none;width:83pt'>Số</td>
  <td class=xl66 width=91 style='border-top:none;border-left:none;width:68pt'>Ngày
  cấp</td>
  <td class=xl65 width=57 style='border-top:none;border-left:none;width:43pt'>Mã
  tỉnh cấp CMND</td>
  <td class=xl65 width=48 style='border-top:none;border-left:none;width:36pt'>Tỉnh</td>
  <td class=xl68 style='border-top:none;border-left:none'>Bệnh viện</td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl77 height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 class=xl69 style='height:21.75pt;border-top:none'>1</td>
  <td class=xl70 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl71 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl69 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl69 style='border-top:none;border-left:none'>4</td>
  <td class=xl72 style='border-top:none;border-left:none'>5</td>
  <td class=xl69 style='border-top:none;border-left:none'>6</td>
  <td class=xl73 style='border-top:none;border-left:none'>7</td>
  <td class=xl72 style='border-top:none;border-left:none'>8</td>
  <td class=xl69 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl74 style='border-top:none;border-left:none' x:num>9</td>
  <td class=xl74 style='border-top:none;border-left:none' x:num>10</td>
  <td class=xl75 style='border-top:none;border-left:none' x:num>11</td>
  <td class=xl75 style='border-top:none;border-left:none' x:num>12</td>
  <td class=xl75 style='border-top:none;border-left:none' x:num>13</td>
  <td class=xl76 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=2 class=xl77 style='mso-ignore:colspan'></td>
 </tr>
 <%
    
    for(int i=0;i<irow_emp;i++)
    {
        
  %>
 <tr class=xl85 height=48 style='mso-height-source:userset;height:36.0pt'>
  <td height=48 class=xl78 style='height:36.0pt;border-top:none' x:num><%=i+1 %></td>
  <td class=xl79 style='border-top:none;border-left:none' x:num><%=dt_Emp.Rows[i][0].ToString()%></td>
  <td class=xl119 style='border-top:none;border-left:none' x:num><%=dt_Emp.Rows[i][1].ToString()%></td>
  <td class=xl81 style='border-top:none;border-left:none' x:num><%=dt_Emp.Rows[i][2].ToString()%></td>
  <%   for(int j=3;j<icol_emp;j++)
        { %>
  <td class=xl118 style='border-top:none;border-left:none' x:str><%=dt_Emp.Rows[i][j].ToString()%></td>
 <%     }
   
  %>
  <td class=xl84 >&nbsp;</td>
  <td colspan=2 class=xl85 style='mso-ignore:colspan'></td>
 </tr>
 <% }%>
 <tr class=xl28 height=0 style='display:none;mso-height-source:userset;
  mso-height-alt:675'>
  <td class=xl89 style='border-top:none'>&nbsp;</td>
  <td class=xl90 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl91 align=right style='border-top:none;border-left:none' x:num>0</td>
  <td class=xl92 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl92 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl93 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl94 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl95 style='border-top:none;border-left:none' x:num>0</td>
  <td class=xl93 style='border-top:none;border-left:none' x:num="0">00/01/1900</td>
  <td class=xl94 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl95 style='border-top:none;border-left:none' x:num>0</td>
  <td class=xl95 style='border-top:none;border-left:none' x:num>0</td>
  <td class=xl96 align=right style='border-top:none;border-left:none' x:num>0</td>
  <td class=xl94 style='border-top:none;border-left:none' x:num>79</td>
  <td class=xl94 style='border-top:none;border-left:none' x:str="'041">041</td>
  <td class=xl92 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=0 style='display:none;mso-height-source:userset;
  mso-height-alt:675'>
  <td class=xl89 style='border-top:none'>&nbsp;</td>
  <td class=xl90 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl91 align=right style='border-top:none;border-left:none' x:num>0</td>
  <td class=xl92 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl92 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl93 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl94 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl95 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl93 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl94 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl95 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl95 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl96 style='border-left:none'>&nbsp;</td>
  <td class=xl94 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl94 style='border-top:none;border-left:none'>&nbsp;</td>
  <td class=xl92 style='border-top:none;border-left:none'>&nbsp;</td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl30 style='height:16.5pt'></td>
  <td class=xl42></td>
  <td class=xl43></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td class=xl30></td>
  <td class=xl112></td>
  <td class=xl29></td>
  <td class=xl30></td>
  <td class=xl52></td>
  <td class=xl42></td>
  <td class=xl113></td>
  <td colspan=2 class=xl114 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl52 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=48 style='mso-height-source:userset;height:36.0pt'>
  <td height=48 class=xl97 style='height:36.0pt'>&nbsp;</td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl28></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td class=xl60></td>
  <td class=xl99></td>
  <td class=xl60></td>
  <td colspan=2 class=xl98 style='mso-ignore:colspan'></td>
  <td class=xl97>&nbsp;</td>
  <td class=xl100>&nbsp;</td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=0 style='display:none;mso-height-source:userset;
  mso-height-alt:720'>
  <td height=0 class=xl97>&nbsp;</td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl28></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td class=xl60></td>
  <td class=xl99></td>
  <td class=xl60></td>
  <td colspan=2 class=xl98 style='mso-ignore:colspan'></td>
  <td class=xl97>&nbsp;</td>
  <td class=xl100>&nbsp;</td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=0 style='display:none;mso-height-source:userset;
  mso-height-alt:720'>
  <td height=0 class=xl97>&nbsp;</td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl28></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td class=xl60></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td colspan=2 class=xl60 style='mso-ignore:colspan'></td>
  <td class=xl99></td>
  <td colspan=2 class=xl98 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=0 style='display:none;mso-height-source:userset;
  mso-height-alt:720'>
  <td height=0 class=xl97>&nbsp;</td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl28></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td class=xl60></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td colspan=2 class=xl60 style='mso-ignore:colspan'></td>
  <td class=xl99></td>
  <td colspan=2 class=xl98 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=0 style='display:none;mso-height-source:userset;
  mso-height-alt:720'>
  <td height=0 class=xl97>&nbsp;</td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl28></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td class=xl60></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td colspan=2 class=xl60 style='mso-ignore:colspan'></td>
  <td class=xl99></td>
  <td colspan=2 class=xl98 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=0 style='display:none;mso-height-source:userset;
  mso-height-alt:720'>
  <td height=0 class=xl97>&nbsp;</td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl28></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td class=xl60></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td colspan=2 class=xl60 style='mso-ignore:colspan'></td>
  <td class=xl99></td>
  <td colspan=2 class=xl98 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=0 style='display:none;mso-height-source:userset;
  mso-height-alt:720'>
  <td height=0 class=xl97>&nbsp;</td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl28></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td class=xl60></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td colspan=2 class=xl60 style='mso-ignore:colspan'></td>
  <td class=xl99></td>
  <td colspan=2 class=xl98 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=0 style='display:none;mso-height-source:userset;
  mso-height-alt:720'>
  <td height=0 class=xl97>&nbsp;</td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl28></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td class=xl60></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td colspan=2 class=xl60 style='mso-ignore:colspan'></td>
  <td class=xl99></td>
  <td colspan=2 class=xl98 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=0 style='display:none;mso-height-source:userset;
  mso-height-alt:720'>
  <td height=0 class=xl97>&nbsp;</td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl28></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td class=xl60></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td colspan=2 class=xl60 style='mso-ignore:colspan'></td>
  <td class=xl99></td>
  <td colspan=2 class=xl98 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=0 style='display:none;mso-height-source:userset;
  mso-height-alt:720'>
  <td height=0 class=xl97>&nbsp;</td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl28></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td class=xl60></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td colspan=2 class=xl60 style='mso-ignore:colspan'></td>
  <td class=xl99></td>
  <td colspan=2 class=xl98 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=0 style='display:none;mso-height-source:userset;
  mso-height-alt:720'>
  <td height=0 class=xl97>&nbsp;</td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl28></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td class=xl60></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td colspan=2 class=xl60 style='mso-ignore:colspan'></td>
  <td class=xl99></td>
  <td colspan=2 class=xl98 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=0 style='display:none;mso-height-source:userset;
  mso-height-alt:720'>
  <td height=0 class=xl97>&nbsp;</td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl28></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td class=xl60></td>
  <td class=xl59></td>
  <td class=xl98></td>
  <td colspan=2 class=xl60 style='mso-ignore:colspan'></td>
  <td class=xl99></td>
  <td colspan=2 class=xl98 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=42 style='mso-height-source:userset;height:31.5pt'>
  <td height=42 colspan=2 class=xl30 style='height:31.5pt;mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl101 colspan=3 style='mso-ignore:colspan'>* Phần dành cho cơ quan
  BHXH ghi:</td>
  <td class=xl25></td>
  <td class=xl102></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl103></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=42 style='mso-height-source:userset;height:31.5pt'>
  <td height=42 colspan=2 class=xl30 style='height:31.5pt;mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl26 colspan=8 style='mso-ignore:colspan'
  x:str="'- Số sổ BHXH được cấp:................................ số, Từ số:................................ Đến số:................................">-
  Số sổ BHXH được cấp:................................ số, Từ
  số:................................ Đến số:................................</td>
  <td class=xl103></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=42 style='mso-height-source:userset;height:31.5pt'>
  <td height=42 colspan=2 class=xl30 style='height:31.5pt;mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl26 colspan=8 style='mso-ignore:colspan'
  x:str="'- Số thẻ BHYT được cấp:.............................. thẻ, trong đó cấp ngoại tỉnh:........................................ thẻ.">-
  Số thẻ BHYT được cấp:.............................. thẻ, trong đó cấp ngoại
  tỉnh:........................................ thẻ.</td>
  <td class=xl103></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=42 style='mso-height-source:userset;height:31.5pt'>
  <td height=42 colspan=2 class=xl30 style='height:31.5pt;mso-ignore:colspan'></td>
  <td class=xl26></td>
  <td class=xl24 colspan=8 style='mso-ignore:colspan'
  x:str="'- Thời hạn sử dụng của thẻ BHYT: Từ ngày ____/____/_______ Đến ngày ____/____/_______">-
  Thời hạn sử dụng của thẻ BHYT: Từ ngày ____/____/_______ Đến ngày
  ____/____/_______</td>
  <td class=xl103></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=0 style='display:none;mso-height-source:userset;
  mso-height-alt:630'>
  <td height=0 colspan=2 class=xl30 style='mso-ignore:colspan'></td>
  <td class=xl43></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl102></td>
  <td class=xl24></td>
  <td class=xl25></td>
  <td class=xl102></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl103></td>
  <td class=xl26></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=42 style='mso-height-source:userset;height:31.5pt'>
  <td height=42 colspan=2 class=xl30 style='height:31.5pt;mso-ignore:colspan'></td>
  <td class=xl43></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl102></td>
  <td class=xl24></td>
  <td class=xl25></td>
  <td class=xl102></td>
  <td class=xl103>Ngày..... tháng...... năm..........</td>
  <td class=xl24></td>
  <td class=xl103></td>
  <td class=xl26></td>
  <td class=xl103>Ngày 20 tháng <%=dt_name.Rows[0][1].ToString().Substring(3,2) %> năm <%=dt_name.Rows[0][1].ToString().Substring(6,4) %></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl111 height=42 style='mso-height-source:userset;height:31.5pt'>
  <td height=42 class=xl104 style='height:31.5pt'></td>
  <td class=xl60></td>
  <td class=xl99></td>
  <td class=xl105></td>
  <td class=xl106>Cán bộ thu</td>
  <td class=xl107></td>
  <td class=xl105></td>
  <td class=xl108></td>
  <td class=xl107></td>
  <td class=xl109 x:str="Phụ trách thu"><span
  style='mso-spacerun:yes'> </span>Phụ trách thu<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl105></td>
  <td class=xl106>Người lập biểu</td>
  <td class=xl110></td>
  <td class=xl106>Người sử dụng lao động</td>
  <td colspan=2 class=xl105 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl111 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=42 style='mso-height-source:userset;height:31.5pt'>
  <td height=42 class=xl30 style='height:31.5pt'></td>
  <td class=xl103></td>
  <td class=xl26></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl102></td>
  <td class=xl24></td>
  <td class=xl25></td>
  <td class=xl102></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl103></td>
  <td class=xl26></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=32 style='mso-height-source:userset;height:24.0pt'>
  <td height=32 class=xl30 style='height:24.0pt'></td>
  <td class=xl103></td>
  <td class=xl26></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl102></td>
  <td class=xl24></td>
  <td class=xl25></td>
  <td class=xl102></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
  <td class=xl103></td>
  <td class=xl26></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=46 style='mso-height-source:userset;height:34.5pt'>
  <td height=46 class=xl30 style='height:34.5pt'></td>
  <td class=xl42></td>
  <td class=xl43></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td class=xl30></td>
  <td class=xl112></td>
  <td class=xl29></td>
  <td class=xl30></td>
  <td class=xl52></td>
  <td class=xl42></td>
  <td class=xl113></td>
  <td colspan=2 class=xl114 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl52 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=48 style='mso-height-source:userset;height:36.0pt'>
  <td height=48 class=xl30 style='height:36.0pt'></td>
  <td class=xl42></td>
  <td class=xl43></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td class=xl30></td>
  <td class=xl112></td>
  <td class=xl29></td>
  <td class=xl30></td>
  <td class=xl52></td>
  <td class=xl42></td>
  <td class=xl113></td>
  <td colspan=2 class=xl114 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl52 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td height=32 class=xl30 style='height:24.0pt'></td>
  <td class=xl42></td>
  <td class=xl43></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td class=xl30></td>
  <td class=xl112></td>
  <td class=xl29></td>
  <td class=xl30></td>
  <td class=xl52></td>
  <td class=xl42></td>
  <td class=xl113></td>
  <td colspan=2 class=xl114 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl52 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl30 style='height:24.75pt'></td>
  <td class=xl42></td>
  <td class=xl43></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td class=xl30></td>
  <td class=xl112></td>
  <td class=xl29></td>
  <td class=xl30></td>
  <td class=xl52></td>
  <td class=xl112><%=dt_name.Rows[5][0].ToString() %></td>
  <td class=xl113></td>
  <td class=xl115><%=dt_name.Rows[6][0].ToString() %></td>
  <td class=xl114></td>
  <td colspan=3 class=xl52 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td height=37 class=xl30 style='height:27.75pt'></td>
  <td class=xl42></td>
  <td class=xl43></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td class=xl30></td>
  <td class=xl112></td>
  <td class=xl29></td>
  <td class=xl30></td>
  <td class=xl52></td>
  <td class=xl42></td>
  <td class=xl113></td>
  <td colspan=2 class=xl114 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl52 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=0 style='display:none;mso-height-source:userset;mso-height-alt:
  600'>
  <td height=0 class=xl30></td>
  <td class=xl42></td>
  <td class=xl43></td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td class=xl30></td>
  <td class=xl112></td>
  <td class=xl29></td>
  <td class=xl30></td>
  <td class=xl52></td>
  <td class=xl42></td>
  <td class=xl113></td>
  <td colspan=2 class=xl114 style='mso-ignore:colspan'></td>
  <td colspan=3 class=xl52 style='mso-ignore:colspan'></td>
 </tr>
 
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=45 style='width:34pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=169 style='width:127pt'></td>
  <td width=125 style='width:94pt'></td>
  <td width=91 style='width:68pt'></td>
  <td width=121 style='width:91pt'></td>
  <td width=55 style='width:41pt'></td>
  <td width=111 style='width:83pt'></td>
  <td width=91 style='width:68pt'></td>
  <td width=57 style='width:43pt'></td>
  <td width=107 style='width:80pt'></td>
  <td width=102 style='width:77pt'></td>
  <td width=288 style='width:216pt'></td>
  <td width=48 style='width:36pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=90 style='width:68pt'></td>
  <td width=79 style='width:59pt'></td>
  <td width=108 style='width:81pt'></td>
 </tr>
 <![endif]>
</table>

<div style='mso-element:comment-list'><![if !supportAnnotations]>

<hr class=msocomhide align=left size=1 width="33%">

<![endif]>

<div style='mso-element:comment'><![if !supportAnnotations]>

<div id="_com_1" class=msocomtxt
onmouseover="msoCommentShow('_com_1','_anchor_1')"
onmouseout="msoCommentHide('_com_1')" language=JavaScript><![endif]>

<div><![if !supportAnnotations]><a class=msocomhide href="#_msoanchor_1"
name="_msocom_1">[1]</a><![endif]><!--[if gte mso 9]><xml>
 <v:shapetype id="_x0000_t202" coordsize="21600,21600" o:spt="202" path="m,l,21600r21600,l21600,xe">
  <v:stroke joinstyle="miter"/>
  <v:path gradientshapeok="t" o:connecttype="rect"/>
 </v:shapetype><v:shape id="_x0000_s1025" type="#_x0000_t202" style='position:absolute;
  margin-left:269.25pt;margin-top:995.25pt;width:96pt;height:37.5pt;z-index:1;
  visibility:hidden;mso-wrap-style:tight' fillcolor="infoBackground [80]"
  o:insetmode="auto">
  <v:fill color2="infoBackground [80]"/>
  <v:shadow on="t" color="black" obscured="t"/>
  <v:path o:connecttype="none"/>
  <v:textbox style='mso-direction-alt:auto'/>
  <![if mso]><x:ClientData ObjectType="Note">
   <x:MoveWithCells/>
   <x:SizeWithCells/>
   <x:AutoFill>False</x:AutoFill>
   <x:Row>40</x:Row>
   <x:Column>2</x:Column>
   <x:Author>CONGHUNG</x:Author>
  </x:ClientData>
  <![endif]></v:shape></xml><![endif]--><![if !vml]><span style='mso-ignore:
vglayout'><![endif]>

<div v:shape="_x0000_s1025" style='padding:.75pt 0pt 0pt .75pt;text-align:left'
class=shape><font class="font29">CONGHUNG:</font><font class="font30"><br>
huynh thi kim huong</font></div>

<![if !vml]></span><![endif]></div>

<![if !supportAnnotations]></div>

<![endif]></div>

</div>

</body>

</html>
