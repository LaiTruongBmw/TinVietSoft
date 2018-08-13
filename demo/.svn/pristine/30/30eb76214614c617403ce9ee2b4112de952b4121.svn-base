<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Adjust Item</title>
</head>

<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script language="javascript" type="text/javascript"> 
 
//=======================================================================

var callerWindowObj = dialogArguments;  

function BodyInit()
{
    System.Translate(document);    	
	//----------------------------
   
    BindingDataList(); 	
    //-------------------------
	
	txtUser_PK.text = "<%=Session("USER_PK")%>";
	
	dso_wh_list.Call("SELECT");
	//-------------------------
}  
//=======================================================================
 function BindingDataList()
 {   
	var data ;
     
     data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id||' * ' || wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_name  ASC" )%>";    
     lstWarehouse.SetDataText(data);
     
 }
 //=======================================================================
 function OnProcess(pos)
{
    switch(pos)
    {
        case 'LoadStock':            
            if ( confirm("Do you want to load stock ?") )
            {            
               lg_pro_bisa00023.Call();
			   
            }    
            else
            {
                alert("Error.");
            }
        break;
		//case 'Cancel'
		//	window.close();
		//break;
    }
}
//=======================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
		case 'lg_pro_bisa00023':
			callerWindowObj.txtMasterPK.text = txtMasterPK.text;   			
			window.close();
		break;
   }   
}
//=======================================================================
</script>

<body>
	<!---------------------------------------------------------------->
    <gw:data id="dso_wh_list" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_bisa00020_3" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="lstWarehouse" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!-------------------------------------------------------------------->
    <gw:data id="st_lg_pro_bisa00023" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_bisa00023" > 
                <input>
					 <input bind="lstWarehouse" />
					 <input bind="dtStockDate"/>
                </input> 
                <output> 
                    <output bind="txtMasterPK" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width:100%;height:50%" >
        <tr>
			 <td align="right" style="width: 10%" >
                W/H
            </td>
             <td style="width: 90%" colspan = 2>
                <gw:list id="lstWarehouse" styles='width:100%' csstype="mandatory" />
              </td>
		</tr>
		<tr>
			<td align="right" style="width: 10%; white-space: nowrap">
                Date
             </td>
            <td style="width: 90%" colspan = 2>
                 <gw:datebox id="dtStockDate" lang="1" />
             </td> 
        </tr>
		<tr>			
			<td></td>
			<td align="center" style="width: 20%">
               <gw:button id="idBtnSave" img="save" text="Save" onclick="OnProcess('LoadStock')" />
            </td>
			<td align="center" style="width: 20%">
               <gw:button id="idBtnCancel" img="cancel" text="Cancel" onclick="window.close()"/>
            </td>			
		</tr>
    </table>
</body>
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtMasterPK" styles="display:none;" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------->
</html>
