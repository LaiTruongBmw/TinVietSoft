<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>POP UP CREATE CUSTOMER NAME</title>
</head>

<script>
 //---------------------------------------------------------
 function BodyInit()
 {
     //---------------------------
     System.Translate(document);  // Translate to language session
     //-------------------------
	 
     var callerWindowObj = dialogArguments;  
	
	 txtPartnerPK.text = callerWindowObj.txtDeliToPK.text;
     lblPartner.text   = callerWindowObj.txtDeliToCode.text + " - " + callerWindowObj.txtDeliToName.text;
			
     txtItemPK.text = callerWindowObj.grdDetail.GetGridData( callerWindowObj.grdDetail.row, callerWindowObj.G2_ITEM_PK);
	
     pro_dsbs00204.Call();
 } 
 
 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
        case "pro_dsbs00204" :
		    if(txtPartItemPK.text =="")
		    {
		        data_dsbs00204.StatusUpdate();
		        data_dsbs00204_1.Call('SELECT');
		    }
			else
		    {
		        data_dsbs00204.Call('SELECT')
		    }
        break;       		        
    }
 }
 
//=====================================================================================================
 
 function OnSaveItem()
 {
      data_dsbs00204.Call()
 }
//=====================================================================================================

function OnCancel()
{
    window.returnValue = "";
    window.close();
}
//=====================================================================================================

function OnSelect()
{
    window.returnValue = txtPartnerItemName.text;
    window.close();
}
//=====================================================================================================
</script>

<body> 
     <!-------------------------------------check exist------------------------------->
    <gw:data id="pro_dsbs00204" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dsbs00204" > 
                <input>
                    <input bind="txtPartnerPK" />
                    <input bind="txtItemPK" />
                </input> 
                <output>
                    <output bind="txtPartItemPK" />
                </output>
            </dso> 
        </xml> 
    </gw:data>     
     <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00204" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="control" function="st_lg_sel_dsbs00204" parameter="0,1,2,3,4,5,6,7" procedure="st_lg_upd_dsbs00204" > 
                <input>
                    <inout bind="txtPartItemPK" /> 
                    <inout bind="txtPartnerPK" /> 
                    <inout bind="txtItemPK" />
                    <inout bind="txtItemCode" />
                    <inout bind="txtItemName" />
                    <inout bind="txtPartnerItemName" /> 
					<inout bind="txtATT01" />  
					<inout bind="txtATT02" />                   
                </input>                             
            </dso> 
        </xml> 
    </gw:data>
     <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00204_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="control" function="st_lg_sel_dsbs00204_1" > 
                <input>
                    <inout bind="txtItemPK" />
                    <inout bind="txtItemCode" />
                    <inout bind="txtItemName" />
                </input>                             
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
				<table style="width: 100%; height: 100%; border: 2px solid #034D72; background-color:#CCFFFF">					 				
				    <tr style="height:10%">
				        <td style="width: 5%; white-space:nowrap" align="right">Partner :</td>
				        <td style="width:92%" colspan=4 >
				            <gw:label id="lblPartner" text="-" styles="color:red; font-weight:bold" />
				        </td>				        	        
				    </tr>                    
                    <tr style="height:10%">
                        <td style="width: 15%; " align="right" >Item : </td>                        
						<td align="center" colspan=4 style="white-space:nowrap" >						
							<gw:textbox id="txtItemCode" styles='width:100%;color:cc0000'  />                        													 
                        </td>
					</tr>   
					<tr style="height:10%">
                        <td style="width: 15%; " align="right" ></td>                        
						<td align="center" colspan=4 style="white-space:nowrap" >													                        						
							<gw:textbox id="txtItemName" styles='width:100%;color:cc0000'  />
                        </td>
					</tr>   
					<tr style="height:10%">
				        <td style="width: 5%; white-space:nowrap" align="right"> </td>
				        <td style="width:92%">				             
				        </td>
				        <td style="white-space:nowrap; width:1%">
				            <gw:button img="select" alt="Select" id="btnSelect" onclick="OnSelect()" />				            
				        </td>				        			        
				        <td style="white-space:nowrap ; width:1%">				            
				            <gw:button img="cancel" alt="Cancel" id="btnCancel" onclick="OnCancel()" />
				        </td>		
						<td style="white-space:nowrap; width:1%">
				            <gw:button img="save" alt="Save" id="btnSaveDetail" onclick="OnSaveItem()" />				            
				        </td>			        
				    </tr>  
                    <tr style="height:10%">
                        <td style="width: 5%;white-space:nowrap" align="right"> Partner Item : </td>
                     	<td style="width: 95%; " colspan="4" align="center" >						
							<gw:textbox id="txtPartnerItemName" styles='width:100%' csstype="mandatory" />		
                        </td>                    
                    </tr>  
					<tr style="height:10%">
                        <td style="width: 5%;white-space:nowrap" align="right"> Name 01 : </td>
                     	<td style="width: 95%; " colspan="4" align="center" >						
							<gw:textbox id="txtATT01" styles='width:100%' csstype="mandatory" />		
                        </td>                    
                    </tr>
					 <tr style="height:10%">
                        <td style="width: 5%;white-space:nowrap" align="right"> Name 02 : </td>
                     	<td style="width: 95%; " colspan="4" align="center" >						
							<gw:textbox id="txtATT02" styles='width:100%' csstype="mandatory" />		
                        </td>                    
                    </tr>                 
                </table>			
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtPartItemPK" text="" styles='display:none' />
    <gw:textbox id="txtReturnValue" text="" styles='display:none' />
    <gw:textbox id="txtPartnerPK" styles='display:none'  />
    <gw:textbox id="txtItemPK" styles='display:none'  />
    <!------------------------------------------------------------------------>
</body>
</html>
