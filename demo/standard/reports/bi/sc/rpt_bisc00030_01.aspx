<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%  CtlLib.SetUser("inv");
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<%    
    string p_from_date = Request.QueryString["p_from_date"];
    string p_to_date = Request.QueryString["p_to_date"];
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="ProgId" content="Excel.Sheet">
    <meta name="Generator" content="Microsoft Excel 11">
    <link rel="File-List" href="DAILY_COMMODITY_2_files/filelist.xml">
    <link rel="Edit-Time-Data" href="DAILY_COMMODITY_2_files/editdata.mso">
    <link rel="OLE-Object-Data" href="DAILY_COMMODITY_2_files/oledata.mso">
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
  <o:Author>Daewon</o:Author>
  <o:LastAuthor>Mr. Khanh</o:LastAuthor>
  <o:LastPrinted>2010-10-30T08:27:39Z</o:LastPrinted>
  <o:Created>2010-08-04T04:13:11Z</o:Created>
  <o:LastSaved>2010-10-30T08:36:05Z</o:LastSaved>
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
            margin: 0in 0in 0in .26in;
            mso-header-margin: 0in;
            mso-footer-margin: 0in;
            mso-page-orientation: landscape;
            mso-horizontal-page-align: center;
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
        .style21
        {
            mso-number-format: "_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
            mso-style-name: "Comma_IMPORTED COMMODITY 200902";
        }
        .style22
        {
            mso-number-format: "_-* \#\,\#\#0\.00_-\;\\-* \#\,\#\#0\.00_-\;_-* \0022-\0022??_-\;_-\@_-";
            mso-style-name: "Comma_Raw Material File 2009\.2\(2009\B1441- 12 \C6D4\B9C8\AC10\) \C218\C815\.xls\.1228";
        }
        .style23
        {
            mso-number-format: "_-* \#\,\#\#0\.00_-\;\\-* \#\,\#\#0\.00_-\;_-* \0022-\0022??_-\;_-\@_-";
            mso-style-name: "Comma_THONG KE 09";
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
        .style24
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
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            border: none;
            mso-protection: locked visible;
            mso-style-name: "Normal_IMPORTED COMMODITY 200902";
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
        .xl28
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
        }
        .xl29
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "\[ENG\]\[$-409\]dd\\-mmm\\-yy\;\@";
            text-align: center;
            vertical-align: middle;
        }
        .xl30
        {
            mso-style-parent: style24;
            color: maroon;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
        }
        .xl31
        {
            mso-style-parent: style24;
            font-size: 14.0pt;
            font-style: italic;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
        }
        .xl32
        {
            mso-style-parent: style23;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_-* \#\,\#\#0\.00_-\;\\-* \#\,\#\#0\.00_-\;_-* \0022-\0022??_-\;_-\@_-";
            text-align: center;
            vertical-align: middle;
        }
        .xl33
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
        }
        .xl34
        {
            mso-style-parent: style23;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_-* \#\,\#\#0\.00_-\;\\-* \#\,\#\#0\.00_-\;_-* \0022-\0022??_-\;_-\@_-";
            text-align: center;
            vertical-align: middle;
            white-space: normal;
        }
        .xl35
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: 1.0pt solid windowtext;
            background: #CCFFFF;
            mso-pattern: auto none;
        }
        .xl36
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: none;
            background: #CCFFFF;
            mso-pattern: auto none;
        }
        .xl37
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: none;
            background: #CCFFFF;
            mso-pattern: auto none;
            white-space: normal;
        }
        .xl38
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "\[ENG\]\[$-409\]dd\\-mmm\\-yy\;\@";
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: none;
            background: #CCFFFF;
            mso-pattern: auto none;
            white-space: normal;
        }
        .xl39
        {
            mso-style-parent: style24;
            font-size: 14.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: none;
            background: #CCFFFF;
            mso-pattern: auto none;
        }
        .xl40
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: 1.0pt solid windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: none;
            background: #CCFFFF;
            mso-pattern: auto none;
        }
        .xl41
        {
            mso-style-parent: style23;
            color: purple;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_-* \#\,\#\#0\.00_-\;\\-* \#\,\#\#0\.00_-\;_-* \0022-\0022??_-\;_-\@_-";
            text-align: center;
            vertical-align: middle;
        }
        .xl42
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: none;
            border-left: 1.0pt solid windowtext;
            white-space: normal;
        }
        .xl43
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: .5pt dashed windowtext;
            border-left: none;
            white-space: normal;
        }
        .xl44
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: .5pt dashed windowtext;
            border-left: none;
            background: white;
            mso-pattern: auto none;
        }
        .xl45
        {
            mso-style-parent: style21;
            color: black;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "\[ENG\]\[$-409\]dd\\-mmm\\-yy\;\@";
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: .5pt dashed windowtext;
            border-left: none;
        }
        .xl46
        {
            mso-style-parent: style24;
            color: maroon;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: .5pt dashed windowtext;
            border-left: none;
        }
        .xl47
        {
            mso-style-parent: style21;
            font-size: 14.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
            text-align: right;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: .5pt dashed windowtext;
            border-left: none;
        }
        .xl48
        {
            mso-style-parent: style21;
            font-size: 14.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: .5pt dashed windowtext;
            border-left: none;
        }
        .xl49
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
            vertical-align: middle;
            border-top: none;
            border-right: 1.0pt solid windowtext;
            border-bottom: .5pt dashed windowtext;
            border-left: none;
            background: white;
            mso-pattern: auto none;
        }
        .xl50
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            vertical-align: middle;
            border-top: .5pt dashed windowtext;
            border-right: .5pt dashed windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: 1.0pt solid windowtext;
            white-space: normal;
        }
        .xl51
        {
            mso-style-parent: style24;
            font-style: italic;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: .5pt dashed windowtext;
            border-left: none;
            background: #CCFFFF;
            mso-pattern: auto none;
        }
        .xl52
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: .5pt dashed windowtext;
            border-left: none;
            background: #CCFFFF;
            mso-pattern: auto none;
        }
        .xl53
        {
            mso-style-parent: style24;
            color: black;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "\[ENG\]\[$-409\]dd\\-mmm\\-yy\;\@";
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: .5pt dashed windowtext;
            border-left: none;
            background: #CCFFFF;
            mso-pattern: auto none;
        }
        .xl54
        {
            mso-style-parent: style24;
            color: maroon;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: .5pt dashed windowtext;
            border-left: none;
            background: #CCFFFF;
            mso-pattern: auto none;
        }
        .xl55
        {
            mso-style-parent: style23;
            font-size: 12.0pt;
            font-weight: 700;
            text-decoration: underline;
            text-underline-style: single-accounting;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_-* \#\,\#\#0\.00_-\;\\-* \#\,\#\#0\.00_-\;_-* \0022-\0022??_-\;_-\@_-";
            text-align: right;
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: .5pt dashed windowtext;
            border-left: none;
            background: #CCFFFF;
            mso-pattern: auto none;
        }
        .xl56
        {
            mso-style-parent: style24;
            color: maroon;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)";
            vertical-align: middle;
            border-top: none;
            border-right: .5pt dashed windowtext;
            border-bottom: .5pt dashed windowtext;
            border-left: none;
            background: #CCFFFF;
            mso-pattern: auto none;
        }
        .xl57
        {
            mso-style-parent: style23;
            font-size: 12.0pt;
            font-weight: 700;
            text-decoration: underline;
            text-underline-style: single-accounting;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_-* \#\,\#\#0\.00_-\;\\-* \#\,\#\#0\.00_-\;_-* \0022-\0022??_-\;_-\@_-";
            vertical-align: middle;
            border-top: none;
            border-right: 1.0pt solid windowtext;
            border-bottom: .5pt dashed windowtext;
            border-left: none;
            background: #CCFFFF;
            mso-pattern: auto none;
        }
        .xl58
        {
            mso-style-parent: style23;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_-* \#\,\#\#0\.000_-\;\\-* \#\,\#\#0\.000_-\;_-* \0022-\0022??_-\;_-\@_-";
            text-align: right;
            vertical-align: middle;
            border-top: 1.0pt solid windowtext;
            border-right: .5pt dashed windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: none;
            background: aqua;
            mso-pattern: auto none;
            white-space: normal;
        }
        .xl59
        {
            mso-style-parent: style23;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_-* \#\,\#\#0\.000_-\;\\-* \#\,\#\#0\.000_-\;_-* \0022-\0022??_-\;_-\@_-";
            text-align: center;
            vertical-align: middle;
            border-top: 1.0pt solid windowtext;
            border-right: .5pt dashed windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: none;
            background: silver;
            mso-pattern: auto none;
            white-space: normal;
        }
        .xl60
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "\[$VND\]\\ \#\,\#\#0\.000_\)\;\\\(\[$VND\]\\ \#\,\#\#0\.000\\\)";
            vertical-align: middle;
            border-top: 1.0pt solid windowtext;
            border-right: 1.0pt solid windowtext;
            border-bottom: 1.0pt solid windowtext;
            border-left: none;
            background: aqua;
            mso-pattern: auto none;
            white-space: normal;
        }
        .xl61
        {
            mso-style-parent: style24;
            color: red;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "\[ENG\]\[$-409\]dd\\-mmm\\-yy\;\@";
            text-align: center;
            vertical-align: middle;
        }
        .xl62
        {
            mso-style-parent: style24;
            font-size: 14.0pt;
            font-style: italic;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "\#\,\#\#0\.00_\)\;\\\(\#\,\#\#0\.00\\\)";
            text-align: center;
            vertical-align: middle;
        }
        .xl63
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "\0022$\0022\#\,\#\#0\.00";
            text-align: center;
            vertical-align: middle;
        }
        .xl64
        {
            mso-style-parent: style22;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "\[$VND\]\\ \#\,\#\#0_\)\;\\\(\[$VND\]\\ \#\,\#\#0\\\)";
            text-align: center;
            vertical-align: middle;
        }
        .xl65
        {
            mso-style-parent: style24;
            font-size: 14.0pt;
            font-style: italic;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "\0022$\0022\#\,\#\#0\.00";
            text-align: center;
            vertical-align: middle;
        }
        .xl66
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_-* \#\,\#\#0\.000_-\;\\-* \#\,\#\#0\.000_-\;_-* \0022-\0022??_-\;_-\@_-";
            text-align: center;
            vertical-align: middle;
        }
        .xl67
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "\[$VND\]\\ \#\,\#\#0_\)\;\\\(\[$VND\]\\ \#\,\#\#0\\\)";
            text-align: center;
            vertical-align: middle;
        }
        .xl68
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_\(* \#\,\#\#0\.000_\)\;_\(* \\\(\#\,\#\#0\.000\\\)\;_\(* \0022-\0022???_\)\;_\(\@_\)";
            text-align: center;
            vertical-align: middle;
        }
        .xl69
        {
            mso-style-parent: style22;
            font-size: 12.0pt;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            mso-number-format: "_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022??_-\;_-\@_-";
            text-align: center;
            vertical-align: middle;
        }
        .xl70
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: none;
            border-right: none;
            border-bottom: 1.0pt solid windowtext;
            border-left: none;
        }
        .xl71
        {
            mso-style-parent: style24;
            font-size: 18.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: 1.0pt solid windowtext;
            border-right: none;
            border-bottom: 1.0pt solid windowtext;
            border-left: 1.0pt solid windowtext;
            background: #FFFF99;
            mso-pattern: auto none;
            white-space: normal;
        }
        .xl72
        {
            mso-style-parent: style24;
            font-size: 18.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: 1.0pt solid windowtext;
            border-right: none;
            border-bottom: 1.0pt solid windowtext;
            border-left: none;
            background: #FFFF99;
            mso-pattern: auto none;
            white-space: normal;
        }
        .xl73
        {
            mso-style-parent: style24;
            font-size: 18.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: 1.0pt solid windowtext;
            border-right: 1.0pt solid black;
            border-bottom: 1.0pt solid windowtext;
            border-left: none;
            background: #FFFF99;
            mso-pattern: auto none;
            white-space: normal;
        }
        .xl74
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: 1.0pt solid windowtext;
            border-right: none;
            border-bottom: 1.0pt solid windowtext;
            border-left: 1.0pt solid windowtext;
            background: silver;
            mso-pattern: auto none;
            white-space: normal;
        }
        .xl75
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: 1.0pt solid windowtext;
            border-right: none;
            border-bottom: 1.0pt solid windowtext;
            border-left: none;
            background: silver;
            mso-pattern: auto none;
            white-space: normal;
        }
        .xl76
        {
            mso-style-parent: style24;
            font-size: 12.0pt;
            font-weight: 700;
            font-family: Arial, sans-serif;
            mso-font-charset: 0;
            text-align: center;
            vertical-align: middle;
            border-top: 1.0pt solid windowtext;
            border-right: .5pt dashed black;
            border-bottom: 1.0pt solid windowtext;
            border-left: none;
            background: silver;
            mso-pattern: auto none;
            white-space: normal;
        }
        -- ></style>
    <!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Imported commodity</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>375</x:DefaultRowHeight>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:Scale>70</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Zoom>80</x:Zoom>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>7</x:ActiveRow>
       <x:ActiveCol>3</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
    <x:Sorting>
     <x:Sort>Column E</x:Sort>
    </x:Sorting>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>9975</x:WindowHeight>
  <x:WindowWidth>19320</x:WindowWidth>
  <x:WindowTopX>-210</x:WindowTopX>
  <x:WindowTopY>30</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:SupBook>
  <x:Path>\\B3\B-3 &#51089;&#50629;&#51068;&#48372;\B-3 &#51089;&#50629;&#51068;&#48372; 02&#45380;8&#50900;.xls</x:Path>
  <x:SheetName>B-3</x:SheetName>
  <x:SheetName>&#44277;&#51221;&#54364;&#51077;&#47141;</x:SheetName>
  <x:SheetName>&#44277;&#51221;&#54364;&#52636;&#47141;</x:SheetName>
  <x:SheetName>1</x:SheetName>
  <x:SheetName>2</x:SheetName>
  <x:SheetName>3</x:SheetName>
  <x:SheetName>4</x:SheetName>
  <x:SheetName>5</x:SheetName>
  <x:SheetName>6</x:SheetName>
  <x:SheetName>7</x:SheetName>
  <x:SheetName>8</x:SheetName>
  <x:SheetName>9</x:SheetName>
  <x:SheetName>10</x:SheetName>
  <x:SheetName>11</x:SheetName>
  <x:SheetName>12</x:SheetName>
  <x:SheetName>&#45572;&#44228;</x:SheetName>
  <x:SheetName>&#45572;&#44228;-1</x:SheetName>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>0</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>1</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>2</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>3</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>4</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>5</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>6</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>7</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>8</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>9</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>10</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>11</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>12</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>13</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>14</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>15</x:SheetIndex>
  </x:Xct>
  <x:Xct>
   <x:Count>0</x:Count>
   <x:SheetIndex>16</x:SheetIndex>
  </x:Xct>
 </x:SupBook>
 <x:ExcelName>
  <x:Name>_Fill</x:Name>
  <x:Hidden/>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>_FilterDatabase</x:Name>
  <x:Hidden/>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>='Imported commodity'!$A$3:$G$6</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>_Key1</x:Name>
  <x:Hidden/>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>_Order1</x:Name>
  <x:Hidden/>
  <x:Formula>=255</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>_Sort</x:Name>
  <x:Hidden/>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>aaa</x:Name>
  <x:Hidden/>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>abc</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>abd</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>acd</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>AZ</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>BQ</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>BR</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>DL</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>Print_Area</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>PRINT_AREA_MI</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>V1111115</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>WPS</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>Z_9DCB00C7_E15E_11D5_84A0_00A0CC557E3B_.wvu.FilterData</x:Name>
  <x:Hidden/>
  <x:Formula>='\\B3\B-3 &#51089;&#50629;&#51068;&#48372;\[B-3 &#51089;&#50629;&#51068;&#48372; 02&#45380;8&#50900;.xls]B-3'!#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>Z_9DCB00C7_E15E_11D5_84A0_00A0CC557E3B_.wvu.PrintArea</x:Name>
  <x:Hidden/>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>&#44160;&#49324;&#54788;&#54889;2</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>&#44208;&#51116;&#46976;</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>&#44428;&#46301;&#50857;</x:Name>
  <x:Hidden/>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>&#12596;</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>&#12596;&#12615;&#12609;</x:Name>
  <x:Hidden/>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>&#47932;&#49457;</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>&#47952;&#51648;</x:Name>
  <x:Hidden/>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>&#49324;&#46993;</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>&#49440;&#50864;</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>&#12615;</x:Name>
  <x:Hidden/>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>&#50756;&#47308;</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>&#51089;&#50629;&#51648;&#49884;</x:Name>
  <x:Hidden/>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>&#51089;&#50629;&#51648;&#49884;&#49436;</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>&#51116;&#44256;&#51204;&#50857;&#52376;&#47532;</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>&#51204;&#54868;&#47785;&#47197;</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
 <x:ExcelName>
  <x:Name>&#52509;&#54364;&#51648;</x:Name>
  <x:Formula>=#REF!</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
    <!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1032"/>
</xml><![endif]-->
    <!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>
<body link="blue" vlink="purple" class="xl28">
    <table x:str border="0" cellpadding="0" cellspacing="0" width="1512" style='border-collapse: collapse;
        table-layout: fixed; width: 1134pt'>
        <col class="xl28" width="123" style='mso-width-source: userset; mso-width-alt: 4498;
            width: 92pt'>
        <col class="xl28" width="225" style='mso-width-source: userset; mso-width-alt: 8228;
            width: 169pt'>
        <col class="xl28" width="51" style='mso-width-source: userset; mso-width-alt: 1865;
            width: 38pt'>
        <col class="xl29" width="136" style='mso-width-source: userset; mso-width-alt: 4973;
            width: 102pt'>
        <col class="xl30" width="176" style='mso-width-source: userset; mso-width-alt: 6436;
            width: 132pt'>
        <col class="xl31" width="200" style='mso-width-source: userset; mso-width-alt: 7314;
            width: 150pt'>
        <col class="xl28" width="171" style='mso-width-source: userset; mso-width-alt: 6253;
            width: 128pt'>
        <col class="xl28" width="200" style='mso-width-source: userset; mso-width-alt: 7314;
            width: 150pt'>
        <col class="xl32" width="230" style='mso-width-source: userset; mso-width-alt: 8411;
            width: 173pt'>
        <tr height="33" style='mso-height-source: userset; height: 24.75pt'>
            <td colspan="8" height="33" class="xl70" width="1282" style='height: 24.75pt; width: 961pt'>
                <!--[if gte vml 1]><v:shapetype id="_x0000_t201" coordsize="21600,21600"
   o:spt="201" path="m,l,21600r21600,l21600,xe">
   <v:stroke joinstyle="miter"/>
   <v:path shadowok="f" o:extrusionok="f" strokeok="f" fillok="f"
    o:connecttype="rect"/>
   <o:lock v:ext="edit" shapetype="t"/>
  </v:shapetype><v:shape id="_x0000_s1025" type="#_x0000_t201" style='position:absolute;
   margin-left:0;margin-top:0;width:961.5pt;height:24.75pt;z-index:1;
   visibility:hidden' o:insetmode="auto">
   <o:lock v:ext="edit" rotation="t" text="t"/>
   <![if excel]><x:ClientData ObjectType="Drop">
    <x:MoveWithCells/>
    <x:SizeWithCells/>
    <x:PrintObject>False</x:PrintObject>
    <x:UIObj/>
    <x:Val>0</x:Val>
    <x:Min>0</x:Min>
    <x:Max>0</x:Max>
    <x:Inc>1</x:Inc>
    <x:Page>10</x:Page>
    <x:Dx>16</x:Dx>
    <x:Sel>0</x:Sel>
    <x:SelType>Single</x:SelType>
    <x:LCT>Normal</x:LCT>
    <x:DropStyle>Simple</x:DropStyle>
    <x:DropLines>20</x:DropLines>
    <x:WidthMin>108</x:WidthMin>
   </x:ClientData>
   <![endif]></v:shape><v:shape id="_x0000_s1026" type="#_x0000_t201" style='position:absolute;
   margin-left:0;margin-top:0;width:961.5pt;height:24.75pt;z-index:2;
   visibility:hidden' o:insetmode="auto">
   <o:lock v:ext="edit" rotation="t" text="t"/>
   <![if excel]><x:ClientData ObjectType="Drop">
    <x:MoveWithCells/>
    <x:SizeWithCells/>
    <x:PrintObject>False</x:PrintObject>
    <x:UIObj/>
    <x:Val>0</x:Val>
    <x:Min>0</x:Min>
    <x:Max>0</x:Max>
    <x:Inc>1</x:Inc>
    <x:Page>10</x:Page>
    <x:Dx>16</x:Dx>
    <x:Sel>0</x:Sel>
    <x:SelType>Single</x:SelType>
    <x:LCT>Normal</x:LCT>
    <x:DropStyle>Simple</x:DropStyle>
    <x:DropLines>8</x:DropLines>
    <x:WidthMin>108</x:WidthMin>
   </x:ClientData>
   <![endif]></v:shape><v:shape id="_x0000_s1027" type="#_x0000_t201" style='position:absolute;
   margin-left:0;margin-top:0;width:961.5pt;height:24.75pt;z-index:3;
   visibility:hidden' o:insetmode="auto">
   <o:lock v:ext="edit" rotation="t" text="t"/>
   <![if excel]><x:ClientData ObjectType="Drop">
    <x:MoveWithCells/>
    <x:SizeWithCells/>
    <x:PrintObject>False</x:PrintObject>
    <x:UIObj/>
    <x:Val>0</x:Val>
    <x:Min>0</x:Min>
    <x:Max>0</x:Max>
    <x:Inc>1</x:Inc>
    <x:Page>10</x:Page>
    <x:Dx>16</x:Dx>
    <x:Sel>0</x:Sel>
    <x:SelType>Single</x:SelType>
    <x:LCT>Normal</x:LCT>
    <x:DropStyle>Simple</x:DropStyle>
    <x:DropLines>8</x:DropLines>
    <x:WidthMin>108</x:WidthMin>
   </x:ClientData>
   <![endif]></v:shape><v:shape id="_x0000_s1028" type="#_x0000_t201" style='position:absolute;
   margin-left:0;margin-top:0;width:961.5pt;height:24.75pt;z-index:4;
   visibility:hidden' o:insetmode="auto">
   <o:lock v:ext="edit" rotation="t" text="t"/>
   <![if excel]><x:ClientData ObjectType="Drop">
    <x:MoveWithCells/>
    <x:SizeWithCells/>
    <x:PrintObject>False</x:PrintObject>
    <x:UIObj/>
    <x:Val>0</x:Val>
    <x:Min>0</x:Min>
    <x:Max>0</x:Max>
    <x:Inc>1</x:Inc>
    <x:Page>10</x:Page>
    <x:Dx>16</x:Dx>
    <x:Sel>0</x:Sel>
    <x:SelType>Single</x:SelType>
    <x:LCT>Normal</x:LCT>
    <x:DropStyle>Simple</x:DropStyle>
    <x:DropLines>8</x:DropLines>
    <x:WidthMin>108</x:WidthMin>
   </x:ClientData>
   <![endif]></v:shape><v:shape id="_x0000_s1029" type="#_x0000_t201" style='position:absolute;
   margin-left:0;margin-top:0;width:961.5pt;height:24.75pt;z-index:5;
   visibility:hidden' o:insetmode="auto">
   <o:lock v:ext="edit" rotation="t" text="t"/>
   <![if excel]><x:ClientData ObjectType="Drop">
    <x:MoveWithCells/>
    <x:SizeWithCells/>
    <x:PrintObject>False</x:PrintObject>
    <x:UIObj/>
    <x:Val>0</x:Val>
    <x:Min>0</x:Min>
    <x:Max>0</x:Max>
    <x:Inc>1</x:Inc>
    <x:Page>10</x:Page>
    <x:Dx>16</x:Dx>
    <x:Sel>0</x:Sel>
    <x:SelType>Single</x:SelType>
    <x:LCT>Normal</x:LCT>
    <x:DropStyle>Simple</x:DropStyle>
    <x:DropLines>8</x:DropLines>
    <x:WidthMin>108</x:WidthMin>
   </x:ClientData>
   <![endif]></v:shape><v:shape id="_x0000_s1030" type="#_x0000_t201" style='position:absolute;
   margin-left:0;margin-top:0;width:961.5pt;height:24.75pt;z-index:6;
   visibility:hidden' o:insetmode="auto">
   <o:lock v:ext="edit" rotation="t" text="t"/>
   <![if excel]><x:ClientData ObjectType="Drop">
    <x:MoveWithCells/>
    <x:SizeWithCells/>
    <x:PrintObject>False</x:PrintObject>
    <x:UIObj/>
    <x:Val>0</x:Val>
    <x:Min>0</x:Min>
    <x:Max>0</x:Max>
    <x:Inc>1</x:Inc>
    <x:Page>10</x:Page>
    <x:Dx>16</x:Dx>
    <x:Sel>0</x:Sel>
    <x:SelType>Single</x:SelType>
    <x:LCT>Normal</x:LCT>
    <x:DropStyle>Simple</x:DropStyle>
    <x:DropLines>8</x:DropLines>
    <x:WidthMin>108</x:WidthMin>
   </x:ClientData>
   <![endif]></v:shape><v:shape id="_x0000_s1031" type="#_x0000_t201" style='position:absolute;
   margin-left:0;margin-top:0;width:961.5pt;height:24.75pt;z-index:7;
   visibility:hidden' o:insetmode="auto">
   <o:lock v:ext="edit" rotation="t" text="t"/>
   <![if excel]><x:ClientData ObjectType="Drop">
    <x:MoveWithCells/>
    <x:SizeWithCells/>
    <x:PrintObject>False</x:PrintObject>
    <x:UIObj/>
    <x:Val>0</x:Val>
    <x:Min>0</x:Min>
    <x:Max>0</x:Max>
    <x:Inc>1</x:Inc>
    <x:Page>10</x:Page>
    <x:Dx>16</x:Dx>
    <x:Sel>0</x:Sel>
    <x:SelType>Single</x:SelType>
    <x:LCT>Normal</x:LCT>
    <x:DropStyle>Simple</x:DropStyle>
    <x:DropLines>8</x:DropLines>
    <x:WidthMin>108</x:WidthMin>
   </x:ClientData>
   <![endif]></v:shape><![endif]-->
<%
            DataTable dt2 = CtlLib.TableReadOpenCursor("INV.sp_rpt_bisc00030_2", "0");               
%>  
		   
                <%= dt2.Rows[0]["partner_name"]%>
            </td>
            <td class="xl32" width="230" style='width: 173pt'>
            </td>
        </tr>
        <tr height="81" style='mso-height-source: userset; height: 60.75pt'>
            <td colspan="8" height="81" class="xl71" width="1282" style='border-right: 1.0pt solid black;
                height: 60.75pt; width: 961pt'>
                SUPPLIER STOCK INCOME AMOUNT (
                <%=System.DateTime.ParseExact(p_from_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy/MM/dd")%>
                ~
                <%=System.DateTime.ParseExact(p_to_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy/MM/dd")%>
                )
            </td>
            <td class="xl34">
            </td>
        </tr>
        <tr height="62" style='mso-height-source: userset; height: 46.5pt'>
            <td height="62" class="xl35" style='height: 46.5pt'>
                W/H
            </td>
            <td class="xl36">
                SUPPLIER
            </td>
            <td class="xl37" width="51" style='width: 38pt'>
                CCY
            </td>
            <td class="xl38" width="136" style='width: 102pt'>
                IN DATE
            </td>
            <td class="xl36">
                REF NO
            </td>
            <td class="xl39">
                AMOUNT
            </td>
            <td class="xl36">
                EX RATE
            </td>
            <td class="xl40">
                TR AMOUNT
            </td>
            <td class="xl41">
            </td>
        </tr>
        <%
            string para = "'" + p_from_date + "','" + p_to_date + "'";
            DataTable dt;
            decimal TotalAmount = 0;
            decimal TotalTrAmount = 0;
            decimal TotalAmountAll = 0;
            decimal TotalTrAmountAll = 0;
            dt = CtlLib.TableReadOpenCursor("INV.SP_RPT_BISC00030_1", para);
            //---------------------
            string pro = string.Empty;
            int[] arrID_count = new int[100];
            int a = 0;
            int strID_count = 1;

            for (int y = 0; y < dt.Rows.Count; y++)
            {
                if (pro == "" || pro == null)
                {
                    pro = dt.Rows[y]["ware_house"].ToString();
                    strID_count = 1;
                }
                else
                {
                    if (dt.Rows[y]["ware_house"].ToString().Trim() != pro.Trim())
                    {
                        arrID_count[a] = strID_count;
                        strID_count = 1;
                        a++;
                        pro = dt.Rows[y]["ware_house"].ToString();
                    }
                    else
                    {
                        strID_count++;
                    }
                }
            }
            arrID_count[a] = strID_count;
            a = 0;
            pro = string.Empty;
            //---------------------
            string supplier = string.Empty;
            string wh = string.Empty;
            int[] arrSupplier_count = new int[100];
            int b = 0;
            int strSupplier_count = 1;

            for (int z = 0; z < dt.Rows.Count; z++)
            {
                if (supplier == "" || supplier == null )
                {
                    supplier = dt.Rows[z]["supplier"].ToString();
                    wh = dt.Rows[z]["ware_house"].ToString();
                    strSupplier_count = 1;
                }
                else
                {
                    if (dt.Rows[z]["supplier"].ToString().Trim() != supplier.Trim() || dt.Rows[z]["ware_house"].ToString().Trim() != wh.Trim())
                    {
                        arrSupplier_count[b] = strSupplier_count;
                        strSupplier_count = 1;
                        b++;
                        supplier = dt.Rows[z]["supplier"].ToString();
                        wh = dt.Rows[z]["ware_house"].ToString();
                    }
                    else
                    {
                        strSupplier_count++;
                    }
                }
            }
            arrSupplier_count[b] = strSupplier_count;
            b = 0;
            supplier = string.Empty;
            wh =  string.Empty;
            //------------------------            
            for (int i = 0; i < dt.Rows.Count; i++)
            {              
        %>
        <%     
            if (pro != dt.Rows[i]["ware_house"].ToString() && i != 0)
            {
        %>
        <tr height="33" style='mso-height-source: userset; height: 24.75pt'>
            <td height="33" class="xl50" width="123" style='height: 24.75pt; width: 92pt'>
                &nbsp;
            </td>
            <td class="xl51">
                &nbsp;
            </td>
            <td class="xl52">
                &nbsp;
            </td>
            <td class="xl53">
                &nbsp;
            </td>
            <td class="xl54">
                &nbsp;
            </td>
            <td class="xl55" x:num>
                <span style='mso-spacerun: yes'></span>
                <%= TotalAmount%>
            </td>
            <td class="xl56">
                &nbsp;
            </td>
            <td class="xl57" x:num>
                <span style='mso-spacerun: yes'></span>
                <%= TotalTrAmount%>
            </td>
            <td class="xl41">
            </td>
        </tr>
        <%
            TotalAmountAll += TotalAmount;
            TotalTrAmountAll += TotalTrAmount;
            TotalAmount = 0; 
            TotalTrAmount = 0;
            }
        %>
        <tr height="33" style='mso-height-source: userset; height: 24.75pt'>
            <%
                if (pro != dt.Rows[i]["ware_house"].ToString())
                {
            %>
            <td rowspan="<%=arrID_count[a]%>" height="33" class="xl42" width="123" style='height: 24.75pt;
                width: 92pt'>
                <%= dt.Rows[i]["ware_house"]%>
            </td>
            <% 
                pro = dt.Rows[i]["ware_house"].ToString();
                a++;
                }
            %>
            <%
                if (supplier != dt.Rows[i]["supplier"].ToString() || dt.Rows[i]["ware_house"].ToString().Trim() != wh.Trim())
                {
            %>
            <td rowspan="<%=arrSupplier_count[b]%>" class="xl43" width="225" style='width: 169pt'>
                <%= dt.Rows[i]["supplier"]%> 
            </td>
            <% 
                supplier = dt.Rows[i]["supplier"].ToString();
                wh = dt.Rows[i]["ware_house"].ToString();
                b++;
                }
            %>
            <td class="xl44">
                <%= dt.Rows[i]["ccy"] %> 
            </td>
            <td class="xl45">
                <%= dt.Rows[i]["in_date"]%>
            </td>
            <td class="xl46">
                <%= dt.Rows[i]["ref_no"]%>
            </td>
            <td class="xl47" x:num>
                <span style='mso-spacerun: yes'></span>
                <%= dt.Rows[i]["amount"]%>
            </td>
            <td class="xl48" x:num>
                <span style='mso-spacerun: yes'></span>
                <%= dt.Rows[i]["ex_rate"]%>
            </td>
            <td class="xl49" x:num>
                <span style='mso-spacerun: yes'></span>
                <%= dt.Rows[i]["tr_amount"]%>
            </td>
            <td class="xl41">
            </td>
        </tr>
        <%
            TotalAmount += Convert.ToDecimal(dt.Rows[i]["amount"]);
            TotalTrAmount += Convert.ToDecimal(dt.Rows[i]["tr_amount"]);
            } %>
        <tr height="33" style='mso-height-source: userset; height: 24.75pt'>
            <td height="33" class="xl50" width="123" style='height: 24.75pt; width: 92pt'>
                &nbsp;
            </td>
            <td class="xl51">
                &nbsp;
            </td>
            <td class="xl52">
                &nbsp;
            </td>
            <td class="xl53">
                &nbsp;
            </td>
            <td class="xl54">
                &nbsp;
            </td>
            <td class="xl55" x:num>
                <span style='mso-spacerun: yes'></span>
                <%= TotalAmount%>
            </td>
            <% TotalAmountAll += TotalAmount; %>
            <td class="xl56">
                &nbsp;
            </td>
            <td class="xl57" x:num>
                <span style='mso-spacerun: yes'></span>
                <%= TotalTrAmount%>
            </td>
            <% TotalTrAmountAll += TotalTrAmount;%>
            <td class="xl41">
            </td>
        </tr>
        <tr height="35" style='mso-height-source: userset; height: 26.25pt'>
            <td colspan="5" height="35" class="xl74" width="711" style='border-right: .5pt dashed black;
                height: 26.25pt; width: 533pt'>
                TOTAL
            </td>
            <td class="xl58" width="200" style='width: 150pt' x:num>
                <span style='mso-spacerun: yes'></span>
                <%=  TotalAmountAll%>
            </td>
            <td class="xl59" width="171" style='width: 128pt'>
                &nbsp;
            </td>
            <td class="xl60" align="right" width="200" style='width: 150pt' x:num>
                VND
                <%=  TotalTrAmountAll%>
            </td>
            <td class="xl32">
            </td>
        </tr>
        <![if supportMisalignedColumns]>
        <tr height="0" style='display: none'>
            <td width="123" style='width: 92pt'>
            </td>
            <td width="225" style='width: 169pt'>
            </td>
            <td width="51" style='width: 38pt'>
            </td>
            <td width="136" style='width: 102pt'>
            </td>
            <td width="176" style='width: 132pt'>
            </td>
            <td width="200" style='width: 150pt'>
            </td>
            <td width="171" style='width: 128pt'>
            </td>
            <td width="200" style='width: 150pt'>
            </td>
            <td width="230" style='width: 173pt'>
            </td>
        </tr>
        <![endif]>
    </table>
</body>
</html>
