<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Group / UnGroup Item</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>

    //=======================================================================
    var l_master_pk = "";
    var callerWindowObj = dialogArguments;
	
    function BodyInit() 
	{
        System.Translate(document);
		
        txtMasterPK.text = callerWindowObj.txtMasterPK.text;        
        //-------------------------
    }
    //=======================================================================
    function OnProcess(pos)		
	{
		switch(pos)
		{
			case 'GROUP-ITEM':
				if ( confirm("Do you want to group Item ?") )
				{
					pro_dscd00077_1.Call();
				}
			break;	

			case 'UNGROUP-ITEM':
				if ( confirm("Do you want to un-group Item ?") )
				{
					pro_dscd00077_2.Call();
				}
			break;		
		} 
    }
    //=======================================================================
    function OnDataReceive(obj) 
	{
        switch (obj.id) 
		{
            case 'pro_dscd00077_1':
				alert(txtReturnValue.text);
				
				this.close();
            break;
			
			case 'pro_dscd00077_2':
				alert(txtReturnValue.text);
				
				this.close();
            break;
        }

    }
    //=======================================================================
</script>
<body>
	<!--------------------------------------------------------------------------->    
    <gw:data id="pro_dscd00077_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00077_1" > 
                <input>
                    <input bind="txtMasterPK" />                    
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------------------------------------------->    
    <gw:data id="pro_dscd00077_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00077_2" > 
                <input>
                    <input bind="txtMasterPK" />                    
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" align="center">        
        <tr style="height: 100%"  align="center" >
             
            <td align="center" style="width: 50%">
                <gw:button id="idBtnGroup" img="Group Item" text="Group Item" onclick="OnProcess('GROUP-ITEM')" />
            </td>
			
			<td align="center" style="width: 50%">
                <gw:button id="idBtnUnGroup" img="Un-Group Item" text="Un-Group Item" onclick="OnProcess('UNGROUP-ITEM')" />
            </td>
        </tr>              
    </table>
</body>
<!---------------------------------------------------------------------->
<gw:textbox id='txtMasterPK' styles="width:100%;display:none" /> 
<gw:textbox id='txtReturnValue' styles="width:100%;display:none" /> 
<!---------------------------------------------------------------------->
</html>
