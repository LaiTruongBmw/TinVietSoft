<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>UPDATE SLIP SEQ</title>
</head>

<script>

var G1_AS_SL                    = 0,
    G1_PackingType              = 1,
    G1_Packages_Type            = 2,
    G1_Label_Type               = 3,
    G1_Pack_Seq                 = 4,
    G1_TSA_SALEORDER_PK         = 5,
    G1_PO_No                    = 6,
    G1_Item_BC                  = 7,
    G1_PA_PACKING_WI_PK         = 8,
    G1_Package_PK               = 9;
    
var G2_SPEC01_PK        = 0,
    G2_Spec_01          = 1,
    G2_SPEC02_PK        = 2,
    G2_Spec_02          = 3,
    G2_SPEC03_PK        = 4,
    G2_Spec_03          = 5,
    G2_SPEC04_PK        = 6,
    G2_Spec_04          = 7,
    G2_SPEC05_PK        = 8,
    G2_Spec_05          = 9,
    G2_Pack_Qty         = 10,
    G2_Packages_PK      = 11,
    G2_Packages_Item_PK = 12;
    
//===========================================================

 function BodyInit()
 {
    System.Translate(document);
    //----------------------
    txtTableName.text = "<%=Request.querystring("table_name")%>";
	//----------------
	FormatGrid();
	//----------------
	OnSearch('lstPackagesType');
	//----------------
 } 
//===========================================================
 function FormatGrid()
 { 
      //-------------------------------------------------
   
                       
 }
//===========================================================
 function OnDataReceive(obj)
 { 
    switch (obj.id)
    {          
        case 'pro_fpab00740_1' :
            //-------------------------
            ibtnSave.SetEnable(true); 
			ibtnCancel.SetEnable(true); 
        break;
        
        case 'pro_fpab00740_2' :
            //-------------------------
            alert(txtReturnValue.text);
            
            window.close();
        break;                 
    }
 }
//===========================================================
 function OnSearch(pos)
 { 
    switch (pos)
    {        
        case 'lstPackagesType':
            ibtnSave.SetEnable(false);
			ibtnCancel.SetEnable(false); 
            //----------------------
            pro_fpab00740_1.Call();
        break;                                     
    }
 }
//==============================================================================
function OnProcess(pos)
{
    switch (pos)
    {        
        case 'SAVE' :
                   
            if ( confirm('Do you want to update seq number?') )
            {
                pro_fpab00740_2.Call();
            } 
			
        break;
		
		case 'CANCEL' :
		
			window.close(); 
			
		break;
    }
}

//==============================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="pro_fpab00740_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_fpab00740_1" > 
                <input>
                    <input bind="txtTableName" /> 
                </input> 
                <output>
                    <output bind="txtSeqNum" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_fpab00740_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_fpab00740_2" > 
                <input>
					<input bind="txtTableName" />
                    <input bind="txtSeqNum" />                     
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%;" border="1">
		<tr style="height: 40%">
            <td style="background-color: CCFFFF">
                <table style="width: 100%; height: 100%">
                    <tr>  
						<td style="width: 20%">							 
                        </td>						
						<td style="width: 10%" align="right" >
							Seq Number
                        </td>						
                        <td style="width: 50%">
                            <gw:textbox id="txtSeqNum" styles='width:100%' type="number" format="###,###,###" />
                        </td>
                        <td style="width: 20%">
							 
                        </td>                        						
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 60%">
            <td style="background-color: CCFFFF">
                <table style="width: 100%; height: 100%">
                    <tr>  
						<td style="width: 20%">							 
                        </td>
                        
                        <td style="width: 30%" align="center">
                            <gw:button id="ibtnSave" img="save" text="Save" alt="Save"
                                onclick="OnProcess('SAVE')" />
                        </td>
                        <td style="width: 30%" align="center">
                            <gw:button id="ibtnCancel" img="cancel" text="Cancel" alt="Cancel"
                                onclick="OnProcess('CANCEL')" />
                        </td>	

						<td style="width: 20%">							 
                        </td>						
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtTableName" styles='width:100%;display:none' />    
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
