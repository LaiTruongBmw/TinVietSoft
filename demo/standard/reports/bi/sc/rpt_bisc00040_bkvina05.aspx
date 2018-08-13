<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser("inv");
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string p_from_date = Request.QueryString["from_date"];
    string p_to_date = Request.QueryString["to_date"];
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta name="ProgId" content="Excel.Sheet">
    <meta name="Generator" content="Microsoft Excel 11">
    <link rel="File-List" href="rpt_bisc00040_bkvina05_files/filelist.xml">
    <link rel="Edit-Time-Data" href="rpt_bisc00040_bkvina05_files/editdata.mso">
    <link rel="OLE-Object-Data" href="rpt_bisc00040_bkvina05_files/oledata.mso">
    <!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]-->
    <!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>Mr. Khanh</o:LastAuthor>
  <o:Created>1996-10-14T23:33:28Z</o:Created>
  <o:LastSaved>2010-09-27T09:01:29Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
    <style>
        <!
        --table
        {
            mso-displayed-decimal-separator: "\.";
            mso-displayed-thousand-separator: "\,";
        }
        @page
        {
            margin: 1.0in .75in 1.0in .75in;
            mso-header-margin: .5in;
            mso-footer-margin: .5in;
        }
        .font7
        {
            color: black;
            font-size: 8.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
        }
        .font8
        {
            color: black;
            font-size: 8.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Tahoma, sans-serif;
            mso-font-charset: 0;
        }
        tr
        {
            mso-height-source: auto;
        }
        col
        {
            mso-width-source: auto;
        }
        br
        {
            mso-data-placement: same-cell;
        }
        .style16
        {
            mso-number-format: "_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
            mso-style-name: Comma;
            mso-style-id: 3;
        }
        .style0
        {
            mso-number-format: General;
            text-align: general;
            vertical-align: bottom;
            white-space: nowrap;
            mso-rotate: 0;
            mso-background-source: auto;
            mso-pattern: auto;
            color: windowtext;
            font-size: 10.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Arial;
            mso-generic-font-family: auto;
            mso-font-charset: 0;
            border: none;
            mso-protection: locked visible;
            mso-style-name: Normal;
            mso-style-id: 0;
        }
        td
        {
            mso-style-parent: style0;
            padding: 0px;
            mso-ignore: padding;
            color: windowtext;
            font-size: 10.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Arial;
            mso-generic-font-family: auto;
            mso-font-charset: 0;
            mso-number-format: General;
            text-align: general;
            vertical-align: bottom;
            border: none;
            mso-background-source: auto;
            mso-pattern: auto;
            mso-protection: locked visible;
            white-space: nowrap;
            mso-rotate: 0;
        }
        .xl24
        {
            mso-style-parent: style0;
            color: red;
            font-size: 16.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            border-top: none;
            border-right: none;
            border-bottom: .5pt solid windowtext;
            border-left: none;
        }
        .xl25
        {
            mso-style-parent: style0;
            color: blue;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            border: .5pt solid windowtext;
            background: #CCFFCC;
            mso-pattern: auto none;
        }
        .xl26
        {
            mso-style-parent: style16;
            color: blue;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
            text-align: center;
            border: .5pt solid windowtext;
            background: #CCFFCC;
            mso-pattern: auto none;
        }
        .xl27
        {
            mso-style-parent: style16;
            color: blue;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
            text-align: center;
            border: .5pt solid windowtext;
            background: #CCFFCC;
            mso-pattern: auto none;
            white-space: normal;
        }
        .xl28
        {
            mso-style-parent: style0;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            vertical-align: middle;
            border: .5pt solid windowtext;
        }
        .xl29
        {
            mso-style-parent: style16;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
            vertical-align: middle;
            border: .5pt solid windowtext;
        }
        .xl30
        {
            mso-style-parent: style0;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            border: .5pt solid windowtext;
            background: #FFCC99;
            mso-pattern: auto none;
        }
        .xl31
        {
            mso-style-parent: style16;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
            border: .5pt solid windowtext;
            background: #FFCC99;
            mso-pattern: auto none;
        }
        .xl32
        {
            mso-style-parent: style0;
            vertical-align: middle;
            border: .5pt solid windowtext;
            white-space: normal;
        }
        .xl33
        {
            mso-style-parent: style0;
            vertical-align: middle;
            border: .5pt solid windowtext;
        }
        -- ></style>
    <![if !supportAnnotations]><style id="dynCom" type="text/css">
                                   <!
                                   -- --
                                   ></style>

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
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>11</x:ActiveRow>
       <x:ActiveCol>6</x:ActiveCol>
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
  <x:WindowHeight>9300</x:WindowHeight>
  <x:WindowWidth>15135</x:WindowWidth>
  <x:WindowTopX>120</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:AcceptLabelsInFormulas/>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1032"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>
<body link="blue" vlink="purple">
    <table x:str border="0" cellpadding="0" cellspacing="0" width="1014" style='border-collapse: collapse;
        table-layout: fixed; width: 762pt'>
        <col width="90" style='mso-width-source: userset; mso-width-alt: 3291; width: 68pt'>
        <col width="190" style='mso-width-source: userset; mso-width-alt: 6948; width: 143pt'>
        <col width="64" style='width: 48pt'>
        <col width="87" style='mso-width-source: userset; mso-width-alt: 3181; width: 65pt'>
        <col width="77" style='mso-width-source: userset; mso-width-alt: 2816; width: 58pt'>
        <col width="116" style='mso-width-source: userset; mso-width-alt: 4242; width: 87pt'>
        <col width="61" style='mso-width-source: userset; mso-width-alt: 2230; width: 46pt'>
        <col width="68" style='mso-width-source: userset; mso-width-alt: 2486; width: 51pt'>
        <col width="77" style='mso-width-source: userset; mso-width-alt: 2816; width: 58pt'>
        <col width="52" style='mso-width-source: userset; mso-width-alt: 1901; width: 39pt'>
        <col width="68" style='mso-width-source: userset; mso-width-alt: 2486; width: 51pt'>
        <col width="64" style='width: 48pt'>
        <tr height="17" style='height: 12.75pt'>
            <td height="17" width="90" style='height: 12.75pt; width: 68pt'>
            </td>
            <td width="190" style='width: 143pt'>
            </td>
            <td width="64" style='width: 48pt'>
            </td>
            <td width="87" style='width: 65pt'>
            </td>
            <td width="77" style='width: 58pt'>
            </td>
            <td width="116" style='width: 87pt'>
            </td>
            <td width="61" style='width: 46pt'>
            </td>
            <td width="68" style='width: 51pt'>
            </td>
            <td width="77" style='width: 58pt'>
            </td>
            <td width="52" style='width: 39pt'>
            </td>
            <td width="68" style='width: 51pt'>
            </td>
            <td width="64" style='width: 48pt'>
            </td>
        </tr>
        <tr height="27" style='height: 20.25pt'>
            <td colspan="12" height="27" class="xl24" style='height: 20.25pt'>
                Delivery Report
            </td>
        </tr>
        <tr height="80" style='height: 60.0pt'>
            <td height="80" class="xl25" style='height: 60.0pt; border-top: none'>
                Item Code
            </td>
            <td class="xl25" style='border-top: none; border-left: none'>
                Item name
            </td>
            <td class="xl25" style='border-top: none; border-left: none'>
                GAGE
            </td>
            <td class="xl26" style='border-top: none; border-left: none' x:str="Begin Qty">
                <span style='mso-spacerun: yes'></span>Begin Qty<span style='mso-spacerun: yes'>
                </span>
            </td>
            <td class="xl26" style='border-top: none; border-left: none' x:str="In Qty">
                <span style='mso-spacerun: yes'></span>In Qty<span style='mso-spacerun: yes'> </span>
            </td>
            <td class="xl26" style='border-top: none; border-left: none' x:str="Exchange Qty">
                <span style='mso-spacerun: yes'></span>Exchange Qty<span style='mso-spacerun: yes'>
                </span><![if !supportAnnotations]><span class="msocomspan1"><span class="msocomspan2"
                    id="_anchor_1" onmouseover="msoCommentShow('_com_1','_anchor_1')" onmouseout="msoCommentHide('_com_1')"
                    language="JavaScript"><a class="msocomanch" href="#_msocom_1" name="_msoanchor_1">[1]</a></span></span><![endif]>
            </td>
            <td class="xl27" width="61" style='border-top: none; border-left: none; width: 46pt'
                x:str="Quatity&#10;Bad goods">
                <span style='mso-spacerun: yes'></span>Quatity<br>
                Bad goods<span style='mso-spacerun: yes'> </span><![if !supportAnnotations]><span
                    class="msocomspan1"><span class="msocomspan2" id="_anchor_2" onmouseover="msoCommentShow('_com_2','_anchor_2')"
                        onmouseout="msoCommentHide('_com_2')" language="JavaScript"><a class="msocomanch"
                            href="#_msocom_2" name="_msoanchor_2">[2]</a></span></span><![endif]>
            </td>
            <td class="xl27" width="68" style='border-top: none; border-left: none; width: 51pt'
                x:str="Exported&#10;Qty">
                <span style='mso-spacerun: yes'></span>Exported<br>
                Qty<span style='mso-spacerun: yes'> </span><![if !supportAnnotations]><span class="msocomspan1"><span
                    class="msocomspan2" id="_anchor_3" onmouseover="msoCommentShow('_com_3','_anchor_3')"
                    onmouseout="msoCommentHide('_com_3')" language="JavaScript"><a class="msocomanch"
                        href="#_msocom_3" name="_msoanchor_3">[3]</a></span></span><![endif]>
            </td>
            <td class="xl27" width="77" style='border-top: none; border-left: none; width: 58pt'
                x:str="Total&#10;Out Qty">
                <span style='mso-spacerun: yes'></span>Total<br>
                Out Qty<span style='mso-spacerun: yes'> </span><![if !supportAnnotations]><span class="msocomspan1"><span
                    class="msocomspan2" id="_anchor_4" onmouseover="msoCommentShow('_com_4','_anchor_4')"
                    onmouseout="msoCommentHide('_com_4')" language="JavaScript"><a class="msocomanch"
                        href="#_msocom_4" name="_msoanchor_4">[4]</a></span></span><![endif]>
            </td>
            <td class="xl27" width="52" style='border-top: none; border-left: none; width: 39pt'
                x:str="End Qty&#10;books">
                <span style='mso-spacerun: yes'></span>End Qty<br>
                books<span style='mso-spacerun: yes'> </span><![if !supportAnnotations]><span class="msocomspan1"><span
                    class="msocomspan2" id="_anchor_5" onmouseover="msoCommentShow('_com_5','_anchor_5')"
                    onmouseout="msoCommentHide('_com_5')" language="JavaScript"><a class="msocomanch"
                        href="#_msocom_5" name="_msoanchor_5">[5]</a></span></span><![endif]>
            </td>
            <td class="xl27" width="68" style='border-top: none; border-left: none; width: 51pt'
                x:str="End Qty&#10;Infact">
                <span style='mso-spacerun: yes'></span>End Qty<br>
                Infact<span style='mso-spacerun: yes'> </span><![if !supportAnnotations]><span class="msocomspan1"><span
                    class="msocomspan2" id="_anchor_6" onmouseover="msoCommentShow('_com_6','_anchor_6')"
                    onmouseout="msoCommentHide('_com_6')" language="JavaScript"><a class="msocomanch"
                        href="#_msocom_6" name="_msoanchor_6">[6]</a></span></span><![endif]>
            </td>
            <td class="xl27" width="64" style='border-top: none; border-left: none; width: 48pt'
                x:str="Quatity&#10;Dif.End month">
                <span style='mso-spacerun: yes'></span>Quatity<br>
                Dif.End month<span style='mso-spacerun: yes'> </span><![if !supportAnnotations]><span
                    class="msocomspan1"><span class="msocomspan2" id="_anchor_7" onmouseover="msoCommentShow('_com_7','_anchor_7')"
                        onmouseout="msoCommentHide('_com_7')" language="JavaScript"><a class="msocomanch"
                            href="#_msocom_7" name="_msoanchor_7">[7]</a></span></span><![endif]>
            </td>
        </tr>
        <%
            string para = "'" + p_from_date + "','" + p_to_date + "'";
            DataTable dt;
            dt = CtlLib.TableReadOpenCursor("inv.sp_rpt_bisc00040_bkvina05", para);

            decimal TotalBeginQty = 0;
            decimal TotalInQty = 0;
            decimal TotalExchangeQty = 0;
            decimal TotalDefQty = 0; 
            decimal TotalDeliQty = 0;
            decimal TotalOutQty = 0;
            decimal TotalEndQty = 0; 
            decimal TotalCheckQty = 0;
            decimal TotalAdjustQty = 0; 
            
            for (int i = 0; i < dt.Rows.Count; i++)
            {
          
        %>
        <tr height="20" style='height: 15.0pt'>
            <td height="20" class="xl28" style='height: 15.0pt; border-top: none'>
                <%= dt.Rows[i]["item_code"] %>
            </td>
            <td class="xl32" width="190" style='border-top: none; border-left: none; width: 143pt'>
                <%= dt.Rows[i]["item_name"]%>
            </td>
            <td class="xl28" align="right" style='border-top: none; border-left: none' x:num>
                <%= dt.Rows[i]["spec_nm"]%>
            </td>
            <td class="xl33" style='border-top: none; border-left: none' x:num>
                <%= dt.Rows[i]["begin_qty"]%>
            </td>
            <td class="xl29" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= dt.Rows[i]["in_qty"]%>
            </td>
            <td class="xl33" style='border-top: none; border-left: none' x:num>
                <%= dt.Rows[i]["exchange_qty"]%>
            </td>
            <td class="xl33" style='border-top: none; border-left: none' x:num>
                <%= dt.Rows[i]["def_qty"]%>
            </td>
            <td class="xl29" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= dt.Rows[i]["deli_qty"]%>
            </td>
            <td class="xl29" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= dt.Rows[i]["out_qty"]%>
            </td>
            <td class="xl33" style='border-top: none; border-left: none' x:num>
                <%= dt.Rows[i]["end_qty"]%>
            </td>
            <td class="xl33" style='border-top: none; border-left: none' x:num>
                <%= dt.Rows[i]["check_qty"]%>
            </td>
            <td class="xl33" style='border-top: none; border-left: none' x:num>
                <%= dt.Rows[i]["adjust_qty"]%>
            </td>
        </tr>
        <% 
            TotalBeginQty += Convert.ToDecimal(dt.Rows[i]["begin_qty"]);
            TotalInQty += Convert.ToDecimal(dt.Rows[i]["in_qty"]);
            TotalExchangeQty += Convert.ToDecimal(dt.Rows[i]["exchange_qty"]);
            TotalDefQty += Convert.ToDecimal(dt.Rows[i]["def_qty"]);
            TotalDeliQty += Convert.ToDecimal(dt.Rows[i]["deli_qty"]);
            TotalOutQty += Convert.ToDecimal(dt.Rows[i]["out_qty"]);
            TotalEndQty += Convert.ToDecimal(dt.Rows[i]["end_qty"]);
            TotalCheckQty += Convert.ToDecimal(dt.Rows[i]["check_qty"]);
            TotalAdjustQty += Convert.ToDecimal(dt.Rows[i]["adjust_qty"]);
            } %>
        <tr height="21" style='height: 15.75pt'>
            <td height="21" class="xl30" style='height: 15.75pt; border-top: none'>
                &nbsp;
            </td>
            <td class="xl30" style='border-top: none; border-left: none'>
                &nbsp;
            </td>
            <td class="xl30" style='border-top: none; border-left: none'>
                &nbsp;
            </td>
            <td class="xl31" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
               <%= TotalBeginQty %>
            </td>
            <td class="xl31" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
               <%= TotalInQty %>
            </td>
            <td class="xl31" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= TotalExchangeQty %>
            </td>
            <td class="xl31" style='border-top: none; border-left: none' x:num>
                <%= TotalDefQty%>
            </td>
            <td class="xl31" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= TotalDeliQty %>
            </td>
            <td class="xl31" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= TotalOutQty %>
            </td>
            <td class="xl31" style='border-top: none; border-left: none' x:num>
                <%= TotalEndQty%>
            </td>
            <td class="xl31" style='border-top: none; border-left: none' x:num>
                <span style='mso-spacerun: yes'></span>
                <%= TotalCheckQty%>
            </td>
            <td class="xl31" style='border-top: none; border-left: none' x:num>
                <%= TotalAdjustQty%>
            </td>
        </tr>
        <![if supportMisalignedColumns]>
        <tr height="0" style='display: none'>
            <td width="90" style='width: 68pt'>
            </td>
            <td width="190" style='width: 143pt'>
            </td>
            <td width="64" style='width: 48pt'>
            </td>
            <td width="87" style='width: 65pt'>
            </td>
            <td width="77" style='width: 58pt'>
            </td>
            <td width="116" style='width: 87pt'>
            </td>
            <td width="61" style='width: 46pt'>
            </td>
            <td width="68" style='width: 51pt'>
            </td>
            <td width="77" style='width: 58pt'>
            </td>
            <td width="52" style='width: 39pt'>
            </td>
            <td width="68" style='width: 51pt'>
            </td>
            <td width="64" style='width: 48pt'>
            </td>
        </tr>
        <![endif]>
    </table>
    <div style='mso-element: comment-list'>
        <![if !supportAnnotations]>
        <hr class="msocomhide" align="left" size="1" width="33%">
        <![endif]>
        <div style='mso-element: comment'>
            <![if !supportAnnotations]>
            <div id="_com_1" class="msocomtxt" onmouseover="msoCommentShow('_com_1','_anchor_1')"
                onmouseout="msoCommentHide('_com_1')" language="JavaScript">
                <![endif]>
                <div>
                    <![if !supportAnnotations]><a class="msocomhide" href="#_msoanchor_1" name="_msocom_1">[1]</a><![endif]><!--[if gte mso 9]><xml>
 <v:shapetype id="_x0000_t202" coordsize="21600,21600" o:spt="202" path="m,l,21600r21600,l21600,xe">
  <v:stroke joinstyle="miter"/>
  <v:path gradientshapeok="t" o:connecttype="rect"/>
 </v:shapetype><v:shape id="_x0000_s1025" type="#_x0000_t202" style='position:absolute;
  margin-left:299.25pt;margin-top:-82.5pt;width:74.25pt;height:85.5pt;
  z-index:1;visibility:hidden' fillcolor="infoBackground [80]" o:insetmode="auto">
  <v:fill color2="infoBackground [80]"/>
  <v:shadow on="t" color="black" obscured="t"/>
  <v:path o:connecttype="none"/>
  <v:textbox style='mso-direction-alt:auto'/>
  <x:ClientData ObjectType="Note">
   <x:MoveWithCells/>
   <x:SizeWithCells/>
   <x:AutoFill>False</x:AutoFill>
   <x:Row>2</x:Row>
   <x:Column>5</x:Column>
   <x:Author>ower</x:Author>
  </x:ClientData>
 </v:shape></xml><![endif]--><![if !vml]><span style='mso-ignore: vglayout'><![endif]>
     <div v:shape="_x0000_s1025" style='padding: .75pt 0pt 0pt .75pt; text-align: left'
         class="shape">
         <font class="font7">ower:</font><font class="font8"><br>
             S&#7916; D&#7908;NG CHO HÀNG KHÁC</font></div>
     <![if !vml]></span><![endif]></div>
                <![if !supportAnnotations]></div>
            <![endif]></div>
        <div style='mso-element: comment'>
            <![if !supportAnnotations]>
            <div id="_com_2" class="msocomtxt" onmouseover="msoCommentShow('_com_2','_anchor_2')"
                onmouseout="msoCommentHide('_com_2')" language="JavaScript">
                <![endif]>
                <div>
                    <![if !supportAnnotations]><a class="msocomhide" href="#_msoanchor_2" name="_msocom_2">[2]</a><![endif]><!--[if gte mso 9]><xml>
 <v:shape id="_x0000_s1026" type="#_x0000_t202" style='position:absolute;
  margin-left:347.25pt;margin-top:-82.5pt;width:75pt;height:85.5pt;z-index:2;
  visibility:hidden' fillcolor="infoBackground [80]" o:insetmode="auto">
  <v:fill color2="infoBackground [80]"/>
  <v:shadow on="t" color="black" obscured="t"/>
  <v:path o:connecttype="none"/>
  <v:textbox style='mso-direction-alt:auto'/>
  <x:ClientData ObjectType="Note">
   <x:MoveWithCells/>
   <x:SizeWithCells/>
   <x:AutoFill>False</x:AutoFill>
   <x:Row>2</x:Row>
   <x:Column>6</x:Column>
   <x:Author>ower</x:Author>
  </x:ClientData>
 </v:shape></xml><![endif]--><![if !vml]><span style='mso-ignore: vglayout'><![endif]>
     <div v:shape="_x0000_s1026" style='padding: .75pt 0pt 0pt .75pt; text-align: left'
         class="shape">
         <font class="font7">ower:</font><font class="font8"><br>
             h�&nbsp;ng h&#432;<br>
         </font>
     </div>
     <![if !vml]></span><![endif]></div>
                <![if !supportAnnotations]></div>
            <![endif]></div>
        <div style='mso-element: comment'>
            <![if !supportAnnotations]>
            <div id="_com_3" class="msocomtxt" onmouseover="msoCommentShow('_com_3','_anchor_3')"
                onmouseout="msoCommentHide('_com_3')" language="JavaScript">
                <![endif]>
                <div>
                    <![if !supportAnnotations]><a class="msocomhide" href="#_msoanchor_3" name="_msocom_3">[3]</a><![endif]><!--[if gte mso 9]><xml>
 <v:shape id="_x0000_s1027" type="#_x0000_t202" style='position:absolute;
  margin-left:395.25pt;margin-top:-82.5pt;width:75pt;height:85.5pt;z-index:3;
  visibility:hidden' fillcolor="infoBackground [80]" o:insetmode="auto">
  <v:fill color2="infoBackground [80]"/>
  <v:shadow on="t" color="black" obscured="t"/>
  <v:path o:connecttype="none"/>
  <v:textbox style='mso-direction-alt:auto'/>
  <x:ClientData ObjectType="Note">
   <x:MoveWithCells/>
   <x:SizeWithCells/>
   <x:AutoFill>False</x:AutoFill>
   <x:Row>2</x:Row>
   <x:Column>7</x:Column>
   <x:Author>ower</x:Author>
  </x:ClientData>
 </v:shape></xml><![endif]--><![if !vml]><span style='mso-ignore: vglayout'><![endif]>
     <div v:shape="_x0000_s1027" style='padding: .75pt 0pt 0pt .75pt; text-align: left'
         class="shape">
         <font class="font7">ower:</font><font class="font8"><br>
             xu&#7845;t khách h�&nbsp;ng</font></div>
     <![if !vml]></span><![endif]></div>
                <![if !supportAnnotations]></div>
            <![endif]></div>
        <div style='mso-element: comment'>
            <![if !supportAnnotations]>
            <div id="_com_4" class="msocomtxt" onmouseover="msoCommentShow('_com_4','_anchor_4')"
                onmouseout="msoCommentHide('_com_4')" language="JavaScript">
                <![endif]>
                <div>
                    <![if !supportAnnotations]><a class="msocomhide" href="#_msoanchor_4" name="_msocom_4">[4]</a><![endif]><!--[if gte mso 9]><xml>
 <v:shape id="_x0000_s1028" type="#_x0000_t202" style='position:absolute;
  margin-left:443.25pt;margin-top:-82.5pt;width:75pt;height:85.5pt;z-index:4;
  visibility:hidden' fillcolor="infoBackground [80]" o:insetmode="auto">
  <v:fill color2="infoBackground [80]"/>
  <v:shadow on="t" color="black" obscured="t"/>
  <v:path o:connecttype="none"/>
  <v:textbox style='mso-direction-alt:auto'/>
  <x:ClientData ObjectType="Note">
   <x:MoveWithCells/>
   <x:SizeWithCells/>
   <x:AutoFill>False</x:AutoFill>
   <x:Row>2</x:Row>
   <x:Column>8</x:Column>
   <x:Author>ower</x:Author>
  </x:ClientData>
 </v:shape></xml><![endif]--><![if !vml]><span style='mso-ignore: vglayout'><![endif]>
     <div v:shape="_x0000_s1028" style='padding: .75pt 0pt 0pt .75pt; text-align: left'
         class="shape">
         <font class="font7">ower:</font><font class="font8"><br>
             t&#7893;ng xu&#7845;t<br>
         </font>
     </div>
     <![if !vml]></span><![endif]></div>
                <![if !supportAnnotations]></div>
            <![endif]></div>
        <div style='mso-element: comment'>
            <![if !supportAnnotations]>
            <div id="_com_5" class="msocomtxt" onmouseover="msoCommentShow('_com_5','_anchor_5')"
                onmouseout="msoCommentHide('_com_5')" language="JavaScript">
                <![endif]>
                <div>
                    <![if !supportAnnotations]><a class="msocomhide" href="#_msoanchor_5" name="_msocom_5">[5]</a><![endif]><!--[if gte mso 9]><xml>
 <v:shape id="_x0000_s1029" type="#_x0000_t202" style='position:absolute;
  margin-left:491.25pt;margin-top:-82.5pt;width:76.5pt;height:85.5pt;z-index:5;
  visibility:hidden' fillcolor="infoBackground [80]" o:insetmode="auto">
  <v:fill color2="infoBackground [80]"/>
  <v:shadow on="t" color="black" obscured="t"/>
  <v:path o:connecttype="none"/>
  <v:textbox style='mso-direction-alt:auto'/>
  <x:ClientData ObjectType="Note">
   <x:MoveWithCells/>
   <x:SizeWithCells/>
   <x:AutoFill>False</x:AutoFill>
   <x:Row>2</x:Row>
   <x:Column>9</x:Column>
   <x:Author>ower</x:Author>
  </x:ClientData>
 </v:shape></xml><![endif]--><![if !vml]><span style='mso-ignore: vglayout'><![endif]>
     <div v:shape="_x0000_s1029" style='padding: .75pt 0pt 0pt .75pt; text-align: left'
         class="shape">
         <font class="font7">ower:</font><font class="font8"><br>
             t&#7891;n cu&#7889;i s&#7893; sách</font></div>
     <![if !vml]></span><![endif]></div>
                <![if !supportAnnotations]></div>
            <![endif]></div>
        <div style='mso-element: comment'>
            <![if !supportAnnotations]>
            <div id="_com_6" class="msocomtxt" onmouseover="msoCommentShow('_com_6','_anchor_6')"
                onmouseout="msoCommentHide('_com_6')" language="JavaScript">
                <![endif]>
                <div>
                    <![if !supportAnnotations]><a class="msocomhide" href="#_msoanchor_6" name="_msocom_6">[6]</a><![endif]><!--[if gte mso 9]><xml>
 <v:shape id="_x0000_s1030" type="#_x0000_t202" style='position:absolute;
  margin-left:539.25pt;margin-top:-82.5pt;width:76.5pt;height:85.5pt;z-index:6;
  visibility:hidden' fillcolor="infoBackground [80]" o:insetmode="auto">
  <v:fill color2="infoBackground [80]"/>
  <v:shadow on="t" color="black" obscured="t"/>
  <v:path o:connecttype="none"/>
  <v:textbox style='mso-direction-alt:auto'/>
  <x:ClientData ObjectType="Note">
   <x:MoveWithCells/>
   <x:SizeWithCells/>
   <x:AutoFill>False</x:AutoFill>
   <x:Row>2</x:Row>
   <x:Column>10</x:Column>
   <x:Author>ower</x:Author>
  </x:ClientData>
 </v:shape></xml><![endif]--><![if !vml]><span style='mso-ignore: vglayout'><![endif]>
     <div v:shape="_x0000_s1030" style='padding: .75pt 0pt 0pt .75pt; text-align: left'
         class="shape">
         <font class="font7">ower:</font><font class="font8"><br>
             t&#7891;n th&#7921;c t&#7871;</font></div>
     <![if !vml]></span><![endif]></div>
                <![if !supportAnnotations]></div>
            <![endif]></div>
        <div style='mso-element: comment'>
            <![if !supportAnnotations]>
            <div id="_com_7" class="msocomtxt" onmouseover="msoCommentShow('_com_7','_anchor_7')"
                onmouseout="msoCommentHide('_com_7')" language="JavaScript">
                <![endif]>
                <div>
                    <![if !supportAnnotations]><a class="msocomhide" href="#_msoanchor_7" name="_msocom_7">[7]</a><![endif]><!--[if gte mso 9]><xml>
 <v:shape id="_x0000_s1031" type="#_x0000_t202" style='position:absolute;
  margin-left:587.25pt;margin-top:-82.5pt;width:77.25pt;height:85.5pt;
  z-index:7;visibility:hidden' fillcolor="infoBackground [80]" o:insetmode="auto">
  <v:fill color2="infoBackground [80]"/>
  <v:shadow on="t" color="black" obscured="t"/>
  <v:path o:connecttype="none"/>
  <v:textbox style='mso-direction-alt:auto'/>
  <x:ClientData ObjectType="Note">
   <x:MoveWithCells/>
   <x:SizeWithCells/>
   <x:AutoFill>False</x:AutoFill>
   <x:Row>2</x:Row>
   <x:Column>11</x:Column>
   <x:Author>ower</x:Author>
  </x:ClientData>
 </v:shape></xml><![endif]--><![if !vml]><span style='mso-ignore: vglayout'><![endif]>
     <div v:shape="_x0000_s1031" style='padding: .75pt 0pt 0pt .75pt; text-align: left'
         class="shape">
         <font class="font7">ower:</font><font class="font8"><br>
             chênh l&#7879;ch</font></div>
     <![if !vml]></span><![endif]></div>
                <![if !supportAnnotations]></div>
            <![endif]></div>
    </div>
</body>
</html>
