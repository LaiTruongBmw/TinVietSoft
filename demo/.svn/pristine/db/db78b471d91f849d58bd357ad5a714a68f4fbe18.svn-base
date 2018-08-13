<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Student</title>
    <%  ESysLib.SetUser("mafg")%>

<script>
function BodyInit()
{
 	System.Translate(document);
}	
var _emp_id = "<%=session("EMP_ID") %>";
function OnSearch(){
    dsoPrintingInquiry.Call("SELECT");
    //alert(grdPrintResultInquiry.GetGridData(1,14));
}
function OnPrint()
{
   var  url= System.RootURL + "/reports/fp/ep/fpep00110.aspx?p_dtfrom="+dtFrom.value+"&p_dtto="+dtTo.value
        +"&p_lotno="+txtLotNo.text+"&p_vendno="+txtVendoNo.text+"&p_matno="+txtMatNo.text;
        System.OpenTargetPage( url, "_blank" );
}
</script>
</head>
<body>
    <gw:data id="dsoPrintingInquiry"> 
        <xml> 
            <dso type="grid"  function="mafg.sp_sel_fpep00110">  
                <input bind="grdPrintResultInquiry"   > 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="txtLotNo" /> 
                    <input bind="txtVendoNo" /> 	 
                    <input bind="txtMatNo" />															
                </input> 
                <output bind="grdPrintResultInquiry" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table width="100%" style="height: 100%">
        <tr style="height: 2%">
            <td colspan="12">
            <fieldset>
                <table width="100%" style="height: 100%">
                    <tr style="height: 100%">
                        <td width="10%">
                            Operation Date</td>
                        <td style="width: 6%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" onchange = "OnSearch()"/>
                        </td>
                        <td width="1%">~</td>
                        <td style="width: 6%; white-space: nowrap">
                            <gw:datebox id="dtTo" lang="1" onchange = "OnSearch()"/>
                        </td>
                        <td width="9%" align="right">
                            Lot No</td>
                        <td width="14%">
                            <gw:textbox id="txtLotNo" onenterkey = "OnSearch()"/>
                        </td>
                        <td width="12%" align="right">
                            Vendor No</td>
                        <td width="14%">
                            <gw:textbox id="txtVendoNo" onenterkey = "OnSearch()"/>
                        </td>
                        <td width="15%" align="right">
                            Material No</td>
                        <td width="15%">
                            <gw:textbox id="txtMatNo" onenterkey = "OnSearch()"/>
                        </td>
                        <td with="1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                           <gw:imgbtn id="btnPrint2" img="excel" alt="Print" onclick="OnPrint()" />
                     </td>
                    </tr>
                </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="12">
                <gw:grid id="grdPrintResultInquiry" 
                    header="_pk|_vg_gu|Operation Date|Machine No|Start Time|End Time|Total Time|Lot No
                    |Vendor No|Vendor Name|Material No|Material Name|Drum Qty|Instruted Qty|Printing QTY|_Loss Qty|Printing Type|Machine Type|Operator ID|Operator Name|Dept ID|Dept Name"
                    format="0|0|4|0|0|0|0|0|0|0|0|0|0|1|1|0|0|0|0|0|0|0" 
                    aligns="0|0|0|0|1|1|1|0|0|0|0|0|3|3|3|3|0|0|0|0|0|0"
                    defaults="|||||||||||||||||||||" 
                    editcolcolor="true"
                    autosize="true"
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    widths="1000|1500|1500|1200|1300|1300|1300|2000|1200|1500|1200|1500|1700|1500|1500|1500|1500|1500|1000|1000|1000|1000"
                    sorting='T' styles="width:100%; height:100%"/>
            </td>
        </tr>
    </table>
    <gw:list id="lstPrintType" styles='display:none;'></gw:list>
    <gw:list id="lstMachineType" styles='display:none;'></gw:list>
    <gw:list id="lstMachNo" styles='display:none;'></gw:list>
</body>
</html>
