<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Pop Up "Exchange Production I/O"</title>
</head>

<script>    
    //==========================================================================
    function BodyInit() 
	{	
	    System.Translate(document);
	    var callerWindowObj = dialogArguments;  
	
		txtFactoryPK.text = callerWindowObj.lstFactory.value; 
		txtOrdPlanPK.text = callerWindowObj.txtOrdPlanPK.text;   
		txtSpec01PK.text = callerWindowObj.txtSpec01PK.text;
		txtSpec02PK.text = callerWindowObj.txtSpec02PK.text;
		txtSpec03PK.text = callerWindowObj.txtSpec03PK.text;
		txtSpec04PK.text = callerWindowObj.txtSpec04PK.text;
		txtSpec05PK.text = callerWindowObj.txtSpec05PK.text; 	
		
		lblStyle.text   = callerWindowObj.lblStyle.text; 	
		lblPOSpec.text  = callerWindowObj.lblPOSpec.text; 
	
        pro_fpip00011.Call();
    }
    //==========================================================================
    function OnDataReceive(obj) 
	{
        switch (obj.id) 
		{
            case 'pro_fpip00011_2':			
            	//-------------------------
            	alert(txtReturnValue.text);
            
            	window.close();                 
            break;
			
			case 'pro_fpip00011':
				 pro_fpip00011_1.Call();
			break;
			
			case 'pro_fpip00011_1':
				 
			break;			
        }
    }    
	//==========================================================================
	function OnProcess(pos)
	{
		switch(pos)
		{
			case 'Exchange':
				if ( !(Number(txtExchangeQty.text) > 0))
				{
					alert("Pls input Exchange Qty");
					return;
				}
				
				if ( confirm("Are you sure to exchange " + txtExchangeQty.text + " from " + lstFromRG.value + " to " + lstToRG.value + " ?") )
				{
					pro_fpip00011_2.Call();
				}	
			break;
		}
	}
	//==========================================================================
</script>

<body>
    <!-------------------------------------------------------------------------->
	<gw:data id="pro_fpip00011" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpip00011" > 
                <input>					
                    <input bind="txtFactoryPK" /> 
					<input bind="txtOrdPlanPK" />
                </input> 
                <output>
                    <output bind="lstFromRG" />
                </output>
            </dso> 
        </xml> 
    </gw:data>	
	<!-------------------------------------------------------------------------->
	<gw:data id="pro_fpip00011_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpip00011_1" > 
                <input>					
                    <input bind="txtFactoryPK" />
					<input bind="txtOrdPlanPK" /> 
					<input bind="lstFromRG" />
                </input> 
                <output>
                    <output bind="lstToRG" />
                </output>
            </dso> 
        </xml> 
    </gw:data>		
	<!-------------------------------------------------------------------------->
	<gw:data id="pro_fpip00011_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fpip00011_2" > 
                <input>
					<input bind="txtOrdPlanPK" />
					<input bind="txtSpec01PK" />
					<input bind="txtSpec02PK" />
					<input bind="txtSpec03PK" />
					<input bind="txtSpec04PK" />
					<input bind="txtSpec05PK" />
					<input bind="dtProdDate" />
                    <input bind="lstFromRG" /> 
					<input bind="lstToRG" />					
					<input bind="txtExchangeQty" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>			
    <!-------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%;" border="1">
        <tr style="height: 50%">
            <td style="background-color: CCFFFF; border: 1px solid #034D72">
                <table style="width: 100%; height: 100%">
					<tr>
						<td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
						<td colspan=3>
							<gw:datebox id="dtProdDate" lang="1" width="10%" />
						</td>
					</tr>
					<tr>
						<td style="width: 5%; white-space: nowrap" align="right">
                            Style
                        </td>
						<td colspan=3>
							<gw:label id="lblStyle" styles='width:100%;color:cc0000;font:9pt' />
						</td>
					</tr>
					<tr>
						<td style="width: 5%; white-space: nowrap" align="right">
                            PO/Spec
                        </td>
						<td colspan=3>
							<gw:label id="lblPOSpec" styles='width:100%;color:cc0000;font:9pt' />
						</td>
					</tr>					
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            From
                        </td>
                        <td style="width: 45%" >
                            <gw:list id="lstFromRG" styles='width:100%' "
                                csstype="mandatory" onchange="pro_fpip00011_1.Call()" />
                        </td>
						<td style="width: 5%; white-space: nowrap" align="right">
                            To
                        </td>
                        <td style="width: 45%" colspan="3">
                            <gw:list id="lstToRG" styles='width:100%'
                                csstype="mandatory" />
                        </td>
                    </tr>                     
                </table>
            </td>
        </tr>
        <tr style="height: 50%">
            <td style="background-color: CCFFFF">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 20%; white-space: nowrap; color: DarkRed" align="right">
                            Exchange Qty</td>
                        <td style="width: 40%">
                            <gw:textbox id="txtExchangeQty" styles='width:100%;color:red' type="number" format="###,###,###" />
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 35%" align="center">
                            <gw:icon id="ibtnExchange" img="2" text="Process" alt="Exchange Qty"
                                onclick="OnProcess('Exchange')" styles='width:100%' />
                        </td>                        
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
	<gw:textbox id="txtFactoryPK" styles='width:100%;display:none' />
	<gw:textbox id="txtSpec01PK" styles='width:100%;display:none' />
	<gw:textbox id="txtSpec02PK" styles='width:100%;display:none' />
	<gw:textbox id="txtSpec03PK" styles='width:100%;display:none' />
	<gw:textbox id="txtSpec04PK" styles='width:100%;display:none' />
	<gw:textbox id="txtSpec05PK" styles='width:100%;display:none' />	
	<gw:textbox id="txtOrdPlanPK" styles='width:100%;display:none' />
	<gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
	<!-------------------------------------------------------------------------->
</body>
</html>
