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

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<link id=Main-File rel=Main-File href="../rpt_sample_duty.htm">
<link rel=File-List href=filelist.xml>
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]-->

<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.75in .7in .75in .7in;
	mso-header-margin:.3in;
	mso-footer-margin:.3in;}
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
.font5
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma;
	mso-generic-font-family:auto;
	mso-font-charset:1;}
.font6
	{color:black;
	font-size:8.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma;
	mso-generic-font-family:auto;
	mso-font-charset:1;}
.font7
	{color:red;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
td
	{mso-style-parent:style0;
	padding:0px;
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
.xl65
	{mso-style-parent:style0;
	mso-number-format:"\@";}
.xl66
	{mso-style-parent:style0;
	text-align:center;
	background:#D8E4BC;
	mso-pattern:black none;}
.xl67
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;}
.xl68
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;}
.xl69
	{mso-style-parent:style0;
	font-size:20.0pt;
	text-align:center;}	
-->
</style>
<![if !supportTabStrip]><script language="JavaScript">
<!--
function fnUpdateTabs()
 {
  if (parent.window.g_iIEVer>=4) {
   if (parent.document.readyState=="complete"
    && parent.frames['frTabs'].document.readyState=="complete")
   parent.fnSetActiveSheet(0);
  else
   window.setTimeout("fnUpdateTabs();",150);
 }
}

if (window.name!="frSheet")
 window.location.replace("../rpt_sample_duty.htm");
else
 fnUpdateTabs();
//-->
</script>
<![endif]><![if !supportAnnotations]><style id="dynCom" type="text/css"><!-- 
                                         .style1
                                         {
                                             mso-style-parent: style0;
                                             text-align: center;
                                             background: #D8E4BC;
                                             mso-pattern: black none;
                                             width: 148px;
                                         }
                                         .style2
                                         {
                                             mso-style-parent: style0;
                                             mso-number-format: "\@";
                                             width: 148px;
                                         }
--></style>

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
<![endif]>
</head>

<body link=blue vlink=purple>

<table border=0 cellpadding=0 cellspacing=0 width=533 style='border-collapse:
 collapse;table-layout:fixed;width:400pt; margin-right: 91px;'>
 <col width=79 style='mso-width-source:userset;mso-width-alt:2889;width:59pt'>
 <col style='mso-width-source:userset;mso-width-alt:2304;'>
 <col width=164 style='mso-width-source:userset;mso-width-alt:5997;width:123pt'>
 <col width=78 style='mso-width-source:userset;mso-width-alt:2852;width:59pt'>
 <col width=85 style='mso-width-source:userset;mso-width-alt:3108;width:64pt'>
 <col width=64 style='width:48pt'>
 <tr height=35 style='height:26.25pt'>
  <td colspan=6 height=35 class=xl69 width=533 style='height:26.25pt;
  width:400pt'>Import Duty list</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl66 style='height:15.0pt'>Seq</td>
  <td class=xl66>Emp ID</td>
  <td class=style1>Full Name</td>
  <td class=xl66>Amount</td>
  <td class=xl66>Remark</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl68 style='height:15.0pt'>1</td>
  <td class=xl67>200194</td>
  <td class=style2>NGUYỄN TRỌNG NGUYÊN</td>
  <td class=xl65 x:num>25000</td>
  <td class=xl65 x:num>abc</td>

 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl68 style='height:15.0pt'>2</td>
  <td class=xl67>200198</td>
  <td class=style2>TRỊNH XUÂN NHƯ</td>
  <td class=xl65 x:num>150000</td>

 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl68 style='height:15.0pt'>2</td>
  <td class=xl67>200198</td>
  <td class=style2>LA THI TU</td>
  <td class=xl65 x:num>50000</td>

 </tr>
 
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  
 </tr>
 <![endif]>
</table>


</body>

</html>
