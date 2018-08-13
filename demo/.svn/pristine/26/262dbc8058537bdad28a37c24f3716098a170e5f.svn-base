<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<% CtlLib.SetUser(Session["APP_DBUSER"].ToString());%>
<% 	
    Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8";
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
    string p_from_date, p_to_date, p_status, p_item, para;
    p_from_date = Request.QueryString["p_from_date"];
    p_to_date = Request.QueryString["p_to_date"];
    p_status = Request.QueryString["p_status"];
    p_item = Request.QueryString["p_item"];
    para = "'" + p_from_date + "','" + p_to_date + "','" + p_status + "','" + p_item + "'";
    DataTable dt,dt1;
    dt = CtlLib.TableReadOpenCursor("SALE.sp_rpt_dsre00040_1", para);
    dt1 = CtlLib.TableReadOpenCursor("sale.sp_rpt_dsre00040");
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_dsre00040_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_dsre00040_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_dsre00040_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Mr Lee</o:Author>
  <o:LastAuthor>Mr Khanh</o:LastAuthor>
  <o:LastPrinted>2011-06-13T03:37:58Z</o:LastPrinted>
  <o:Created>2011-06-10T09:01:23Z</o:Created>
  <o:LastSaved>2011-06-13T03:38:04Z</o:LastSaved>
  <o:Company>Prive</o:Company>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"Page &P of &N";
	margin:.37in .27in .46in .28in;
	mso-header-margin:.33in;
	mso-footer-margin:.31in;
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
.style22
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:\B3CB\C6C0, monospace;
	mso-font-charset:129;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal_Sheet1;}
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
.xl25
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl26
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl28
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl29
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
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
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
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
.xl31
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"dd\/mm\/yy";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"dd\/mm\/yy";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl37
	{mso-style-parent:style22;
	color:black;
	font-size:18.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	white-space:normal;}
.xl40
	{mso-style-parent:style22;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>rpt_dsre00040</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>210</x:DefaultRowHeight>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>0</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:DoNotDisplayGridlines/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>10</x:ActiveRow>
       <x:ActiveCol>6</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>6765</x:WindowHeight>
  <x:WindowWidth>11880</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>255</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="3073"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl25>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1819 style='border-collapse:
 collapse;table-layout:fixed;width:1364pt'>
 <col class=xl25 width=64 style='width:48pt'>
 <col class=xl25 width=68 style='mso-width-source:userset;mso-width-alt:2486;
 width:51pt'>
 <col class=xl25 width=128 style='mso-width-source:userset;mso-width-alt:4681;
 width:96pt'>
 <col class=xl25 width=87 style='mso-width-source:userset;mso-width-alt:3181;
 width:65pt'>
 <col class=xl25 width=79 style='mso-width-source:userset;mso-width-alt:2889;
 width:59pt'>
 <col class=xl25 width=103 span=2 style='mso-width-source:userset;mso-width-alt:
 3766;width:77pt'>
 <col class=xl25 width=140 span=2 style='mso-width-source:userset;mso-width-alt:
 5120;width:105pt'>
 <col class=xl25 width=102 style='mso-width-source:userset;mso-width-alt:3730;
 width:77pt'>
 <col class=xl25 width=215 style='mso-width-source:userset;mso-width-alt:7862;
 width:161pt'>
 <col class=xl25 width=102 style='mso-width-source:userset;mso-width-alt:3730;
 width:77pt'>
 <col class=xl25 width=232 style='mso-width-source:userset;mso-width-alt:8484;
 width:174pt'>
 <col class=xl25 width=64 span=4 style='width:48pt'>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 width=64 style='height:15.0pt;width:48pt' align=left
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
  </v:shapetype><v:shape id="_x0000_s1025" type="#_x0000_t75" style='position:absolute;
   margin-left:2.25pt;margin-top:3pt;width:72.75pt;height:34.5pt;z-index:1'>
   <v:imagedata src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt1.Rows[0]["tco_bpphoto_pk"]%>&table_name=TCO_BPPHOTO" o:title="img00001"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:3px;margin-top:4px;width:97px;
  height:46px'><img width=97 height=46 src="rpt_dsre00040_files/image001.jpg"
  v:shapes="_x0000_s1025"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=20 class=xl25 width=64 style='height:15.0pt;width:48pt'></td>
   </tr>
  </table>
  </span></td>
  <td colspan=9 rowspan=2 class=xl37 width=950 style='width:712pt'
  x:fmla="=UPPER( &quot;S/O Revision checking&quot;)">S/O REVISION CHECKING</td>
  <td class=xl26 width=215 style='width:161pt'></td>
  <td class=xl26 width=102 style='width:77pt'></td>
  <td class=xl26 width=232 style='width:174pt'></td>
  <td class=xl26 width=64 style='width:48pt'></td>
  <td class=xl26 width=64 style='width:48pt'></td>
  <td class=xl26 width=64 style='width:48pt'></td>
  <td class=xl26 width=64 style='width:48pt'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl25 style='height:15.0pt'></td>
  <td colspan=3 class=xl26 style='mso-ignore:colspan'></td>
  <td colspan=4 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl27 style='height:15.0pt'></td>
  <td colspan=2 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl25 width=87 style='width:65pt'>Date</td>
  <td colspan=3 class=xl38 width=285 style='width:213pt'><%=System.DateTime.ParseExact(p_from_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%> ~ <%=System.DateTime.ParseExact(p_to_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")%></td>
  <td class=xl25></td>
  <td class=xl39 width=140 style='width:105pt'>Date Report:</td>
  <td class=xl40><%= DateTime.Now.ToString("dd/MM/yyyy HH:mm") %></td>
  <td colspan=7 class=xl25 style='mso-ignore:colspan'></td>
 </tr>

 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl28 width=64 style='height:22.5pt;width:48pt'>Slip No</td>
  <td class=xl29 width=68 style='width:51pt'>Rev Date</td>
  <td class=xl29 width=128 style='width:96pt'>Customer</td>
  <td class=xl29 width=87 style='width:65pt'>Status</td>
  <td class=xl30 width=79 style='width:59pt'>SO Item No</td>
  <td class=xl30 width=103 style='width:77pt'>Rev Type</td>
  <td class=xl30 width=103 style='width:77pt'>Column</td>
  <td class=xl29 width=140 style='width:105pt'>Before Revision</td>
  <td class=xl29 width=140 style='width:105pt'>After Revision</td>
  <td class=xl30 width=102 style='width:77pt'>Remark</td>
  <td colspan=7 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <%
     string pro = string.Empty;
     int[] arrSlipNo_count = new int[dt.Rows.Count];
     int a = 0;
     int strSlipNo_count = 1;

     for (int y = 0; y < dt.Rows.Count; y++)
     {
         if (pro == "" || pro == null)
         {
             pro = dt.Rows[y]["slip_no"].ToString();
             strSlipNo_count = 1;
         }
         else
         {
             if (dt.Rows[y]["slip_no"].ToString().Trim() != pro.Trim())
             {
                 arrSlipNo_count[a] = strSlipNo_count;
                 strSlipNo_count = 1;
                 a++;
                 pro = dt.Rows[y]["slip_no"].ToString();
             }
             else
             {
                 strSlipNo_count++;
             }
         }
     }
     arrSlipNo_count[a] = strSlipNo_count;
     a = 0;
     pro = string.Empty;
     //------------------------------
     for (int i = 0; i < dt.Rows.Count; i++)
     {
%>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
 <%
                if (pro != dt.Rows[i]["slip_no"].ToString())
                {
 %>
  <td rowspan="<%=arrSlipNo_count[a]%>" height=25 class=xl31 width=64 style='height:18.75pt;width:48pt' x:num><%= dt.Rows[i]["slip_no"]%></td>
  <td rowspan="<%=arrSlipNo_count[a]%>" class=xl32 width=68 style='width:51pt'><%= dt.Rows[i]["rev_date"]%></td>
  <td rowspan="<%=arrSlipNo_count[a]%>" class=xl33 width=128 style='width:96pt'><%= dt.Rows[i]["partner_name"]%></td>
  <td rowspan="<%=arrSlipNo_count[a]%>" class=xl33 width=87 style='width:65pt'><%= dt.Rows[i]["status"]%></td>
  <td rowspan="<%=arrSlipNo_count[a]%>" class=xl33 width=79 style='width:59pt'><%= dt.Rows[i]["rv_revision_d_ref_no"]%></td>
  <td rowspan="<%=arrSlipNo_count[a]%>" class=xl34 width=103 style='width:77pt'><%= dt.Rows[i]["revision_type"]%></td>
  <% 
                    pro = dt.Rows[i]["slip_no"].ToString();
                    a++;
                }
  %>
  <td class=xl35 width=103 style='width:77pt'><%= dt.Rows[i]["column_name"]%></td>
  <td class=xl36 width=140 style='width:105pt'><%= dt.Rows[i]["old_item"]%></td>
  <td class=xl36 width=140 style='width:105pt'><%= dt.Rows[i]["new_item"]%></td>
  <td class=xl33 width=102 style='width:77pt'><%= dt.Rows[i]["description"]%></td>
  <td colspan=7 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <%} %>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=64 style='width:48pt'></td>
  <td width=68 style='width:51pt'></td>
  <td width=128 style='width:96pt'></td>
  <td width=87 style='width:65pt'></td>
  <td width=79 style='width:59pt'></td>
  <td width=103 style='width:77pt'></td>
  <td width=103 style='width:77pt'></td>
  <td width=140 style='width:105pt'></td>
  <td width=140 style='width:105pt'></td>
  <td width=102 style='width:77pt'></td>
  <td width=215 style='width:161pt'></td>
  <td width=102 style='width:77pt'></td>
  <td width=232 style='width:174pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
