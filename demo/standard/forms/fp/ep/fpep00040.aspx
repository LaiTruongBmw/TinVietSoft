<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head runat="server">
    <title>Production Result 3</title>
</head>

<script>   
 
//---------------------------------------------------------

function Loading(pos)
{
    switch (pos)
    {
        case 'MR_RESULT':
            var fpath = System.RootURL + "/form/fp/ep/fpep00041.aspx"; 
            System.OpenModal( fpath , 2000 ,  2000, 'resizable:yes;status:yes;fullscreen:yes;titlebar:yes;location:yes');    
        break;
        
        case 'MA_RESULT':
            var fpath = System.RootURL + "/form/fp/ep/fpep00043.aspx"; 
            System.OpenModal( fpath , 2000 ,  2000, 'resizable:yes;status:yes;fullscreen:yes;titlebar:yes;location:yes');            
        break;
        
        case 'MI_RESULT':
             var fpath = System.RootURL + "/form/fp/ep/fpep00044.aspx";  
            System.OpenModal( fpath , 2000 ,  2000, 'resizable:yes;status:yes;fullscreen:yes;titlebar:yes;location:yes');            
        break;   
        
        case 'RECYCLE':
             var fpath = System.RootURL + "/form/fp/ep/fpep00045.aspx";  
            System.OpenModal( fpath , 2000 ,  2000, 'resizable:yes;status:yes;fullscreen:yes;titlebar:yes;location:yes');            
        break;               
    }    
}

//---------------------------------------------------------

</script>

<body>
    <!------------------------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 25%">
            <td colspan="5">
            </td>
        </tr>
        <tr style="height: 20%" valign="middle">
            <td style="width: 25%">
            </td>
            <td valign="middle" style="width: 20%">
                <table style="width: 100%; height: 100%; background-color: #CCCC99" border="1">
                    <tr valign="middle" style="">
                        <td style="width: 100%" valign="middle" align="center">
                            <a id="idBtn1" title="Click here to open MR RESULT" onclick="Loading('MR_RESULT')" href="#tips"
                                style="color: #CC0033; cursor: hand; font-size: 20">MR RESULT</a>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 10%">
            </td>
            <td valign="middle" style="width: 20%">
                <table style="width: 100%; height: 100%; background-color: #CCCC99" border="1">
                    <tr valign="middle" style="">
                        <td style="width: 100%" valign="middle" align="center">
                            <a id="idBtn2" title="Click here to open MA RESULT" onclick="Loading('MA_RESULT')" href="#tips"
                                style="color: #CC0033; cursor: hand; font-size: 20">MA CUTTING</a>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 25%">
            </td>
        </tr>
        <tr style="height: 10%">
            <td colspan="5">
            </td>
        </tr>
        <tr style="height: 20%" valign="middle">
            <td style="width: 25%">
            </td>
            <td valign="middle" style="width: 20%">
                <table style="width: 100%; height: 100%; background-color: #CCCC99" border="1">
                    <tr valign="middle" style="">
                        <td style="width: 100%" valign="middle" align="center">
                            <a id="idBtn3" title="Click here to open MI RESULT" onclick="Loading('MI_RESULT')" href="#tips"
                                style="color: #CC0033; cursor: hand; font-size: 20">MI CUTTING</a>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 10%">
            </td>
            <td valign="middle" style="width: 20%">
                <table style="width: 100%; height: 100%; background-color: #CCCC99" border="1">
                    <tr valign="middle" style="">
                        <td style="width: 100%" valign="middle" align="center">
                            <a id="idBtn4" title="Click here to open RECYCLE" onclick="Loading('RECYCLE')" href="#tips"
                                style="color: #CC0033; cursor: hand; font-size: 20">NONE OPERATION</a>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 25%">
            </td>
        </tr>
        <tr style="height: 25%">
            <td colspan="5">
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------------------>
</body>
</html>
