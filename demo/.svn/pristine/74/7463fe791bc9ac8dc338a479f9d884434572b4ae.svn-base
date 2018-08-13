<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Monitoring Display</title>
</head>

<script type="text/javascript">
//==============================================================================    
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
}
//==============================================================================
function BindingDataList()
{    
}  
//==============================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Monitor':
            var fpath = System.RootURL + "/form/fp/gm/fpgm00061.aspx"; 
            System.OpenModal( fpath , 2000 ,  2000, 'resizable:yes;status:no;fullscreen:yes;titlebar:yes;location:yes');            
        break;
        
        case 'LineHourResult':
            var fpath = System.RootURL + "/form/fp/gm/fpgm00065.aspx"; 
            System.OpenModal( fpath , 2000 ,  2000, 'resizable:yes;status:no;fullscreen:yes;titlebar:yes;location:yes');                    
        break;
        
        case 'LineDailyResult':
            var fpath = System.RootURL + "/form/fp/gm/fpgm00068.aspx"; 
            System.OpenModal( fpath , 2000 ,  2000, 'resizable:yes;status:yes;fullscreen:yes;titlebar:yes;location:yes');                    
        break;   
		
        case 'SHORTAGE':
			var fpath = System.RootURL + "/form/fp/gm/fpgm00064.aspx"; 
            System.OpenModal( fpath , 2000 ,  2000, 'resizable:yes;status:yes;fullscreen:yes;titlebar:yes;location:yes');                               
        break;		     
        
        case '1':
			var fpath = System.RootURL + "/form/fp/gm/fpgm00066.aspx"; 
            System.OpenModal( fpath , 2000 ,  2000, 'resizable:yes;status:yes;fullscreen:yes;titlebar:yes;location:yes');                               
        break;
                    
    }
}
//============================================================================
</script>

<body>
    <!------------------------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 20%">
        </tr>
        <tr style="height: 60%">
            <td style="width: 30%">
            </td>
            <td style="width: 40%">
                <table style="width: 100%; height: 100%; border: 3px solid #034D72">
                    <tr>
                        <td style="border: 1px solid #034D72; width: 30%; white-space: nowrap; background-color: #CCFFFF" align="left" >
							&nbsp;&nbsp;&nbsp;&nbsp;
							<b style="font-size: 15;">
								1. 
							</b>
							&nbsp;&nbsp; 											
                            <b style="color: #CC0066; cursor: hand; font-size: 20;" onclick="OnPopUp('Monitor')">
                                Monitoring </b>
							&nbsp;&nbsp;&nbsp;&nbsp;								 
                        </td>   						                     
                    </tr>
                    <tr>
                        <td style="border: 1px solid #034D72; white-space: nowrap; background-color: #CCFFFF" align="left" >
							&nbsp;&nbsp;&nbsp;&nbsp;
							<b style="font-size: 15;">
								2.
							</b>
							&nbsp;&nbsp;
                            <b style="color: #CC0066; cursor: hand; font-size: 20; white-space: nowrap" onclick="OnPopUp('LineHourResult')">
                                Line Hours Result</b>
							&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #034D72; white-space: nowrap; background-color: #CCFFFF" align="left" >
							&nbsp;&nbsp;&nbsp;&nbsp;
							<b style="font-size: 14;">
								3.
							</b>
							&nbsp;&nbsp;
                            <b style="color: #CC0066; cursor: hand; font-size: 20; white-space: nowrap" onclick="OnPopUp('SHORTAGE')">
                                Component Shortage</b>
							&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>                        
                    </tr>
                    <tr>
                        <td style="border: 1px solid #034D72; white-space: nowrap; background-color: #CCFFFF" align="left" >
							&nbsp;&nbsp;&nbsp;&nbsp;
							<b style="font-size: 14;">
								4.
							</b>
							&nbsp;&nbsp; 
                            <b style="color: #CC0066; cursor: hand; font-size: 20; white-space: nowrap" onclick="OnPopUp('LineDailyResult')">
                                Line Daily Result</b>
							&nbsp;&nbsp;&nbsp;&nbsp;	
                        </td>                        
                    </tr>
					<tr>
					    <td style="border: 1px solid #034D72; width: 30%; white-space: nowrap; background-color: #CCFFFF" align="left" >
							&nbsp;&nbsp;&nbsp;&nbsp;
							<b style="font-size: 14;">
								5.
							</b>
							&nbsp;&nbsp;
                            <b style="color: #CC0066; cursor: hand; font-size: 20; font: tahoma" onclick="OnPopUp('1')">
                                Line Product </b>
							&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
					</tr>	
                </table>
            </td>
            <td style="width: 30%">
            </td>
        </tr>
        <tr style="height: 20%">
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------------>
</html>
