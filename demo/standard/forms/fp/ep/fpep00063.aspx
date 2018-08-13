<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head id="Head2" runat="server">
    <title>Daily Production Report</title>
</head>

<script>    

 
//------------------------------------------------------------------------------------------------------    
function BodyInit()
{           
    
    System.Translate(document);  // Translate to language session
          
}
//------------------------------------------------------------------------------------------------------
function OnReport()
{
    var url =System.RootURL + '/reports/fp/ep/rpt_fpep00063.aspx?ReportDate=' + dtRptDate.value ;
	System.OpenTargetPage(url);  
}
//------------------------------------------------------------------------------------------------------
</script>
<body>    
    <!-------------------------------------------------------------------------------------------------->
    <form id="form1" runat="server">
        <table style="width: 100%; height: 100%">        
            <tr style="height: 20%">
                <td align="center" style="font-size:x-large; color:Burlywood">
                    DAILY PRODUCTION REPORT
                </td>
            </tr>
            <tr style="height: 1%">
                <td style="width: 100%;" align="center" >
                    <table style="width: 1%; height: 100%">
                        <tr>
                            <td width="1%" nowrap>Report Date</td>
                            <td width="1%"><gw:datebox id="dtRptDate" lang="1" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 1%">
                <td align="center">
                    <gw:icon id="btnReport" text="Report" styels="width:100%" onclick="OnReport()" />
                </td>
            </tr>
            <tr style="height: 78%">
                <td align="center">
                </td>
            </tr>
        </table>
        
    </form>
</body> 
</html>     