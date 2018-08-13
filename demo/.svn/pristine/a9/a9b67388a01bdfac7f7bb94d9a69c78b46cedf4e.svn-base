<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Working Tasks PopUp</title>
</head>
<%  
CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var G_TASK_PK   = 0,
    G_DATE  	= 1,
    G_WORK_DT 	= 2,
    G_SEQ      	= 3,     
    G_PLAN     	= 4, 
    G_STATUS   	= 5, 
    G_EMP_NOTE 	= 6; 
    
var flag = 'VIEW';
//====================================================================================================================
function BodyInit()
{  
	FormatGrid();
	
   	txtMasterPK.text = "<%=Request.querystring("task_pk")%>";	    
	
	OnSearch('TASK');
}
//====================================================================

function FormatGrid()
{	
    data ='DATA|1|PLAN|2|PROCESS|3|TEST|4|FINISH'
    lstStatus.SetDataText(data);           
}
//====================================================================
function OnDataReceive(obj)
{
     
}
//====================================================================
function OnSearch(pos)
{  
   	switch(pos)
	{		 
		case 'TASK' :
			 
   			data_agds00141_1.Call("SELECT");		
		break;
	}	   
}
 
//====================================================================
function OnSave()
{
        flag = 'SAVE';
        data_agds00141_1.Call();
}
//====================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_agds00141_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7" function="st_lg_sel_agds00141_1" procedure="st_lg_upd_agds00141_1"> 
                <inout> 
                    <inout bind="txtMasterPK" />
					
                    <inout bind="lbDate" />  
                     
                    <inout bind="lbStaff" />					
					<inout bind="dtTask" />
                    <inout bind="lstStatus" />					
                    <inout bind="dtEmpNote" />                                                             
                </inout>
            </dso> 
        </xml> 
    </gw:data>   
    <!------------------------- MainTable -------------------------->
                <table style="height: 100%; width: 100%; background-color: #B4E7FF" >                     
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%">
                            Emp
                        </td>
                        <td style="width: 20%;">
							<gw:label id="lbStaff" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 30%; white-space: nowrap">                             
							<gw:label id="lbDate" styles='width:60%;color:cc0000;font:9pt' />  							 
                        </td>                         
                        <td style="width: 5%" align="right">
                            Status
                        </td>
                        <td style="width: 25%" align="right">
                            <gw:list id="lstStatus" maxlen="100" styles='width:100%' />
                        </td>
						<td style="width: 10%" align="right">
                            <gw:imgbtn id="ibnUpdate02" img="save" alt="save"  onclick="OnSave()" />
                        </td>
                    </tr>
					<tr style="height: 1%">
						<td colspan="7">
                           	<hr noshade size="1" style="color: Silver" />
                       	</td>
					</tr>
					<tr style="height: 1%">
                        <td colspan="7" align="left">
                            Plan Desc
                        </td>                       
                    </tr>
                    <tr style="height: 47%">                        
                        <td colspan="7">
                            <gw:textarea id="dtTask" styles="width:100%;height:98%"> </gw:textarea>
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td colspan="7" align="left">
                            Emp Note
                        </td>                        
                    </tr>    
                    <tr style="height: 49%">                         
                        <td colspan="7">
                            <gw:textarea id="dtEmpNote" styles="width:100%;height:98%"> </gw:textarea>
                        </td>
                    </tr>                    
                </table>            
</body>
<!---------------------------------------------------------------->
<gw:textbox id="txtMasterPK" style="display: none" />
<!---------------------------------------------------------------->
</html>
