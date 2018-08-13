<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<script>
    function OnReport(){
        //var url = System.RootURL + "/system/ReportEngine.aspx?file=tutorial/ab/rptTest.rpt&procedure=ESYS.sp_get_dictionnary2|ESYS.sp_get_dictionnary3"
        //+ "&parameter="+txtParameter.text+"|2";
        var url = System.RootURL + "/system/ReportEngine.aspx?file=tutorial/ab/rptTest.rpt&procedure=ESYS.sp_sel_menu2"
        + "&parameter="+txtParameter.text;
        window.open(url);
    }
</script>
<body>
    <table width="100%">
        <tr>
            <td width="10%">Parameter:</td>
            <td width="20%"><gw:textbox id="txtParameter" styles="width:100%" ></gw:textbox></td>
            <td width="3%"><gw:imgBtn id="btnReport" img="excel" onclick="OnReport()" /></td>
            <td width="67%"></td>
        </tr>
    </table>
</body>
</html>
