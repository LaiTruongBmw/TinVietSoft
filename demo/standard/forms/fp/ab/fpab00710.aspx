<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>S/O Detail</title>
</head>

<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//=============================================================================
function BodyInit()
{
    System.Translate(document);  // Translate to language session
    //---------------------------------- 
   
    txtItemCode.SetEnable(false);
    txtItemName.SetEnable(false);
    txtCustID.SetEnable(false);
    txtCustName.SetEnable(false);    

    //----------------------------------                
    FormFormat();   
    
	data_fpab00710.Call("SELECT");
}

//=============================================================================
 function FormFormat()
 {      
     var data ;
     //-----------------------              
     txtMasterPK.text = "<%=Request.querystring("sale_order_d_pk")%>";	  	
 }
 
//=============================================================================
function OnSearch(pos)
{
    switch(pos)
    {        
        case 'Master':
            data_fpab00710.Call("SELECT");
        break;

    }
}
//=============================================================================
function OnSave(pos)
{
    switch (pos)
    {
        case 'Master':    
			 data_fpab00710.StatusUpdate();            
             data_fpab00710.Call();
        break;   
		          
    }
}
//=============================================================================
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':                
             
			 if ( txtCustPK.text == '' )
			 {
			 		txtCustPK.text   = "<%=Request.querystring("partner_pk")%>";
					txtCustID.text   = "<%=Request.querystring("partner_id")%>";
					txtCustName.text = "<%=Request.querystring("partner_name")%>";

					txtItemPK.text   = "<%=Request.querystring("item_pk")%>";
					txtItemCode.text = "<%=Request.querystring("item_code")%>";
					txtItemName.text = "<%=Request.querystring("item_name")%>";
			 }
			 
        break;   
		          
    }
}

//=========================================================================        
    function OnDataReceive(obj)
    {
        switch (obj.id)
        {
            case "pro_fpab00710" :  
				                
            break;                                                                
        }    
    }    
//=============================================================================
function OnPopUp(pos)
{
    switch(pos)
    {         
        case 'Partner' :
             var path = System.RootURL + "/form/fp/ab/fpab00120.aspx?partner_type=AP";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {
	            txtCustPK.text   = object[0];
				txtCustID.text   = object[1];
                txtCustName.text = object[2];                          
	         }
        break;  
		
        case 'Item' :
             var path = System.RootURL + "/form/fp/ab/fpab00110.aspx?group_type=Y|Y|Y|Y|Y|Y";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {
					txtItemPK.text   = object[0];
					txtItemCode.text = object[1];
					txtItemName.text = object[2];                          
	         }
        break;  		                                                                    
    }	       
}

//=============================================================================
</script>

<body>     
	<!--------------------------------------------------------------------------->
    <gw:data id="data_fpab00710" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="st_lg_sel_fpab00710"  >
                <input>                         
                    <inout bind="txtMasterPK" />
                    <inout bind="txtSlipNo" />
                    <inout bind="dtOrderDate" />
                    <tnout bind="txtCustPK" />
                    <inout bind="txtCustID" />					
                    <inout bind="txtCustName" />  
                    <inout bind="txtSOItemNo" />
                    <inout bind="txtOrderQty" />					
                    <inout bind="txtItemPK" /> 
                    <inout bind="txtItemCode" /> 										
                    <inout bind="txtItemName" /> 					
                    <inout bind="txtRemark" />                    
                </input>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    
                <table style="width: 100%; height: 100%"  >                                                             
                    <tr style="width: 100%" >
						<td align="right" style="width: 5%">
                            Slip No
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSlipNo" styles="width:100%" css="mandatory"/>                    
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap">
                            Order Date
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtOrderDate" lang="1" />             
                        </td>                     
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Cust
                        </td>
                        <td style="width: 70%; white-space: nowrap" colspan=5 >
							<gw:textbox id="txtCustID" styles="width:30%;"  />
                            <gw:textbox id="txtCustName" styles="width:70%;"  />
                            <gw:textbox id="txtCustPK" styles="display:none" />
                        </td>                      
                    </tr>
					<tr style=" width: 100%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            S/O Item No
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSOItemNo" styles="width:100%"  />                    
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap">
                            Order Qty
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtOrderQty" styles="width:100%"  />                                
                        </td>    
                        <td align="right" style="width: 5%; white-space: nowrap">
                            <a title="Item" onclick="OnPopUp('Item')" href="#tips" style="color: #0000ff">
                                Item</a>
                        </td>
                        <td style="width: 70%; white-space: nowrap" colspan=5 >
							<gw:textbox id="txtItemCode" styles="width:30%;" />
                            <gw:textbox id="txtItemName" styles="width:70%;" />
                            <gw:textbox id="txtItemPK" styles="display=none" />
                        </td>
                    </tr>
					<tr>
                        <td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                            Remark
                        </td>
                        <td style="width: 95%" colspan=9 >
                            <gw:textbox id="txtRemark" styles="width:100%;"  /> 
                        </td>						 
                    </tr>   
					                                                                    
                </table>
         
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width:100%;display:none"  /> 
</body>
</html>
