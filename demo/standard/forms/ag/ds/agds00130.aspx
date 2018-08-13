<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>LG TEAM REPORT</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
    function BodyInit() {
        OnSearch();
    }
    //====================================================================
    function OnSearch() {
        data_agds00130.Call("SELECT");
    }
    //====================================================================
    function OnReport() {
        var url = System.RootURL + "/reports/ag/ds/rpt_agds00130.aspx?p_from_dt=" + dtFrom.value + '&p_to_dt=' + dtTo.value + '&p_search=' + txtSFilter.text;
        System.OpenTargetPage(url);
    }
</script>
<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_agds00130"> 
    <xml>                                   
        <dso id="3" type="grid"  function="st_lg_sel_agds00130"> 
            <input bind="grdDetail" >
                <input bind="dtFrom" /> 
                <input bind="dtTo" /> 
                <input bind="txtSFilter" /> 
            </input>                   
            <output bind="grdDetail" /> 
        </dso> 
    </xml> 
    </gw:data>
    <!-------------------------------------------------------------->
    <!------------------------- MainTable -------------------------->
    <table style="height: 100%; width: 100%" name="Process Config">
        <tr style="height: 5%">
            <td align="right" style="width: 8%; white-space: nowrap">
                Print Date
            </td>
            <td style="width: 20%; white-space: nowrap">
                <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" />
                ~
                <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" />
            </td>
            <td width="5%">
                Search
            </td>
            <td width="20%" align="right">
                <gw:textbox id="txtSFilter" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td width="5%">
            </td>
            <td width="20%">
            </td>
            <td width="5%">
            </td>
            <td width="20%" align=right>
                <gw:imgbtn img="excel" alt="Report" id="btnReport" onclick="OnReport()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="ibnSearch1" img="search" alt="Search" styles='width:100%' onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="height: 55%; width: 100%">
            <td colspan="9">
                <gw:grid id='grdDetail' header='Report ID|Slip No|MC ID|User|Print Date' format='0|0|0|0|0'
                    aligns='0|0|0|0|0' check='||||' editcol='0|0|0|0|0' widths='2500|2000|2000|1500|1500'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------->
<gw:textbox id="txtMasterPK" style="display: none" />
<!---------------------------------------------------------------->
</html>
