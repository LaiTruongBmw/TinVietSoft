<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Purchasing Order Setting</title>
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
    txtStaffName.SetEnable(false);
    txtDeliverName.SetEnable(false);
    txtShipToName.SetEnable(false);
    txtSupplierName.SetEnable(false);
    txtDeliverName.SetEnable(false);
    txtBillToName.SetEnable(false); 
   
    txtPLCode.SetEnable(false);
    txtPLName.SetEnable(false);
    //----------------------------------                
    FormFormat();   
    OnSearch('Master');
}
//=============================================================================
function OnSearch(pos)
{
    switch(pos)
    {        
        case 'Master':
            data_epap00010.Call("SELECT");
        break;

    }
}
//=============================================================================
function OnSave(pos)
{
    switch (pos)
    {
        case 'Master':                
                data_epap00010.Call();
        break;    
        case 'Reset':
            if(confirm("Are your sure to Reset All Control ?"))
            {
                OnClearControl();
                data_epap00010.Call();
            }
        break;            
       
    }
}
//=============================================================================
function OnClearControl()
{
    txtStaffPK.text		="";
    txtStaffName.text	="";          
    txtRemark.text		="";
    txtSupplierPK.text	="";
    txtSupplierName.text="";
    txtBillToPK.text	="";
    txtBillToName.text	="";
     
    lstCurrency.value	=""; 
    txtDeliverPK.text	=""; 
    txtDeliverName.text	="";               
    txtSaleRep.text		="";
    txtShipToPK.text	=""; 
    txtShipToName.text	=""; 
    txtBuyRep.text		="";
    lstDeliType.value	="";
  
    txtPLPK.text		=""; 
    txtPLCode.text		="";                      
    txtPLName.text		="";
    lstPOType.value		="";                       
    lstPaymentTerm.value="";
    lstPriceType.value	="";
    txtExRate.text		="";
    lstPaymentMethod.value="";    
    txtContractNo.text	="";       
 
}
//=========================================================================        
    function OnDataReceive(obj)
    {
        switch (obj.id)
        {
            case "data_epap00010" :                  
            break;                                                                
        }    
    }   
//=============================================================================
 function FormFormat()
 {      
     var data ;
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPO2002') FROM DUAL")%>||";  //carrier
     lstDeliType.SetDataText(data);
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPO2001') FROM DUAL")%>||";  //po type
     lstPOType.SetDataText(data);
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0110') FROM DUAL")%>||";  //payment form
     lstPaymentMethod.SetDataText(data);
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0120') FROM DUAL")%>||";  //payment term
     lstPaymentTerm.SetDataText(data);
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
     lstCurrency.SetDataText(data);  
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0130') FROM DUAL" )%>||";    
     lstPriceType.SetDataText(data);      
     
     data = "data" + "|-2|###,###,#00|-1|###,###,##0|0|###,###|1|###,###.0|2|###,###.00|3|###,###.000|4|###,###.0000|5|###,###.00000|6|###,###.000000";  
     data = data   + "|7|###,###.0000000|8|###,###.00000000|9|###,###.000000000|10|###,###.0000000000|11|###,###.00000000000|12|###,###.000000000000";
     lstPOQTy.SetDataText(data); 
     lstPOReqQty.SetDataText(data); 
     lstPOPrice.SetDataText(data); 
     lstPOAmount.SetDataText(data); 
     
     lstTaxRate.SetDataText(data); 
     lstTaxAmount.SetDataText(data); 
     lstOthers.SetDataText(data); 
     lstTotalAmt.SetDataText(data); 
     //----------------------------
     lstReqQty.SetDataText(data); 
     lstTakeIn.SetDataText(data); 
     lstTakeInUP.SetDataText(data); 
	 lstTI_RefQty.SetDataText(data);
     lstTI_ItemAmt.SetDataText(data); 
     lstTI_TaxRate.SetDataText(data); 
     lstTI_TaxAmt.SetDataText(data); 
     lstTI_TotalAmt.SetDataText(data);  
	 //----------------------------     
     
 }
//=============================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/standard/formsch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtStaffName.text = obj[2];
                txtStaffPK.text   = obj[0];
            }
        break;         
       
        case 'Supplier' :
             var path = System.RootURL + "/standard/formsfp/ab/fpab00120.aspx?partner_type=AP";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {
	            txtSupplierPK.text   = object[0];
                txtSupplierName.text = object[2]; 
                
                lstPaymentMethod.value = object[34];
                lstPaymentTerm.value    = object[35];
                lstPOType.value      = object[36];              
	         }
        break;
       
        case 'Bill_To' :
             var path = System.RootURL + "/standard/formsfp/ab/fpab00120.aspx?partner_type=AP";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtBillToPK.text   = object[0];
                txtBillToName.text = object[2];  
	         }
        break;                
  
       
        case 'Currency':
             var path = System.RootURL + "/standard/formsfp/ab/fpab00220.aspx?code_group=LGCM0100";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {	        	                   
	            if ( object[0] == 1 )
	            {
	                txtLGGroupCodeID.text = 'LGCM0100';
	                rtnLGCode             = object[1];
	                
                    data_fpab00220_2.Call("SELECT");                                
	            }
	            else
	            {
	                lstCurrency.value = object[1];      
	            }    	                
	         }                
        break;       
        
        case 'Deliver' :
             var path = System.RootURL + "/standard/formsfp/ab/fpab00120.aspx?partner_type=AP";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtDeliverPK.text   = object[0];
                txtDeliverName.text = object[2];                
	         }
        break;           
       
        case 'Ship_To' :
             var path = System.RootURL + "/standard/formsfp/ab/fpab00120.aspx?partner_type=AR";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtShipToPK.text   = object[0];
                txtShipToName.text = object[2];  
	         }
        break;
       
        case 'DeliType':
             var path = System.RootURL + "/standard/formsfp/ab/fpab00220.aspx?code_group=LGPO2002";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {	        	                   
	            if ( object[0] == 1 )
	            {
	                txtLGGroupCodeID.text = 'LGPO2002';
	                rtnLGCode             = object[1];
	                
                    data_fpab00220_2.Call("SELECT");                                
	            }
	            else
	            {
	                lstDeliType.value = object[1];      
	            }    	                
	         }                
        break;
       
        case 'PLCenter': // PL
            fpath  = System.RootURL + "/standard/formsfp/ab/fpab00380.aspx";
            oValue = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {                 
                txtPLPK.text        = oValue[3];
                txtPLCode.text      = oValue[4];
                txtPLName.text      = oValue[5];
            }
        break;                
       
        case 'POType':
             var path = System.RootURL + "/standard/formsfp/ab/fpab00220.aspx?code_group=LGPO2001";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {	        	                   
	            if ( object[0] == 1 )
	            {
	                txtLGGroupCodeID.text = 'LGPO2001';
	                rtnLGCode             = object[1];
	                
                    data_fpab00220_2.Call("SELECT");                                
	            }
	            else
	            {
	                lstPOType.value = object[1];      
	            }    	                
	         }                
        break;          
                                                              
        case 'PaymentTerms':
             var path = System.RootURL + "/standard/formsfp/ab/fpab00220.aspx?code_group=LGCM0120";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {	        	                   
	            if ( object[0] == 1 )
	            {
	                txtLGGroupCodeID.text = 'LGCM0120';
	                rtnLGCode             = object[1];
	                
                    data_fpab00220_2.Call("SELECT");                                
	            }
	            else
	            {
	                lstPaymentTerm.value = object[1];      
	            }    	                
	         }                              
        break; 
       
        case 'PaymentMethod':        
             var path = System.RootURL + "/standard/formsfp/ab/fpab00220.aspx?code_group=LGCM0110";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {	        	                   
	            if ( object[0] == 1 )
	            {
	                txtLGGroupCodeID.text = 'LGCM0110';
	                rtnLGCode             = object[1];
	                
                    data_fpab00220_2.Call("SELECT");                                
	            }
	            else
	            {
	                lstPaymentMethod.value = object[1];      
	            }    	                
	         }                
        break;                                                                             
    }	       
}

//=============================================================================
</script>

<body>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epap00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0, 1,2,3,4,5, 6,7,8,9,10, 11,12,13,14,15, 16,17,18,19,20, 21,22,23,24,25, 26,27,28,29,30, 31,32,33,34,35, 36,37,38,39,40, 41,42, 43" function="st_lg_sel_epap00010"  procedure="st_lg_upd_epap00010"> 
                <inout> 
                    <inout  bind="txtMasterPK" />
                     
                    <inout  bind="txtStaffPK" />
                    <inout  bind="txtStaffName" />                                          
                    <inout  bind="txtRemark" />                     
                    <inout  bind="txtSupplierPK" />
                    <inout  bind="txtSupplierName" />
                     
                    <inout  bind="txtBillToPK" />
                    <inout  bind="txtBillToName" />                     
                    <inout  bind="txtNULL01" /> 
                    <inout  bind="lstCurrency" />                            
                    <inout  bind="txtDeliverPK" /> 
					
                    <inout  bind="txtDeliverName" />                                          
                     <inout  bind="txtSaleRep" />                     
                    <inout  bind="txtShipToPK" /> 
                    <inout  bind="txtShipToName" />                     
                    <inout  bind="txtBuyRep" /> 
                  
                    <inout  bind="lstDeliType" />                 
                    <inout  bind="txtPLPK" /> 
                    <inout  bind="txtPLCode" />                      
                    <inout  bind="txtPLName" />
                    <inout  bind="lstPOType" />  
					                     
                    <inout  bind="lstPaymentTerm" />
                    <inout  bind="lstPriceType" />
                    <inout  bind="txtExRate" />
                    <inout  bind="lstPaymentMethod" />    
                    <inout  bind="txtContractNo" />       
		            
		             <inout  bind="lstPOQTy" /> 
                     <inout  bind="lstPOPrice" />   
                     <inout  bind="lstPOAmount" />                      
                     <inout  bind="lstTaxRate" />  
                     <inout  bind="lstTaxAmount" />
					  
                     <inout  bind="lstOthers" /> 
                     <inout  bind="lstTotalAmt" />                        
                     <inout  bind="lstPOReqQty" />                      
                     <inout  bind="lstReqQty" /> 
                     <inout  bind="lstTakeIn" />
					 
                     <inout  bind="lstTakeInUP" />
                     <inout  bind="lstTI_ItemAmt" />
                     <inout  bind="lstTI_TaxRate" />
                     <inout  bind="lstTI_TaxAmt" /> 
                     <inout  bind="lstTI_TotalAmt" />                       
					 
                     <inout  bind="chkPOAutoCal" /> 
                     <inout  bind="chkINAutoCal" />    
					 
					 <inout  bind="lstTI_RefQty" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <table style="width: 100%; height: 2%" border="1">
        <tr>
            <td>
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%; width: 100%">
                        <td colspan="4" style="width: 99%">
                            <table>
                                <tr>
                                    <td style="width: 98%">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnReset" img="reset" alt="Reset All" onclick="OnSave('Reset')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnSave" img="save" alt="Save" onclick="OnSave('Master')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%; width: 100%">
                        <td align="right" style="width: 3%">
                            <a onclick="OnPopUp('Charger')" href="#tips" style="color: #0000ff">Charger</a>
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtStaffName" styles="width:100%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                        <td align="right" style="width: 3%">
                            Remark
                        </td>
                        <td style="width: 25%" colspan="0">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="background-color: #EEEEEE; height: 1%; width: 100%">
                        <td colspan="5">
                            <a style="font-family: Courier New; font-size: medium; color: #FF8000">P/O Info</a>
                        </td>
                    </tr>
                    <tr style="width: 100%; height: 1%">                      
                        <td align="right" style="width: 5%; white-space: nowrap">
                            <a title="Supplier" onclick="OnPopUp('Supplier')" href="#tips" style="color: #0000ff">
                                Supplier</a>
                        </td>
                        <td style="width: 45%"  >
                            <gw:textbox id="txtSupplierName" styles="width:100%;" onenterkey="" />
                            <gw:textbox id="txtSupplierPK" styles="display:none" />
                        </td>
                        <td style="width: 5%" align="right" >
							Ex-Rate
						</td>    
						<td style="width: 45%">
							<gw:textbox id="txtExRate" type="number" format="#,###,###,###,###.##R" styles="width:100%;" />
						</td>
                    </tr>
                    <tr style="height: 1%; width: 100%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            <a onclick="OnPopUp('Bill_To')" href="#tips" style="color: #0000ff">Bill to</a>
                        </td>
                        <td style="width: 45%" colspan="0">
                            <gw:textbox id="txtBillToName" styles="width:100%;" />
                            <gw:textbox id="txtBillToPK" styles="display=none" />
                        </td>
                        <td align="right" style="width: 5%">                             
                        </td>
                        <td style="width:45%">                           
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                            <a onclick="OnPopUp('Currency')" href="#tips" style="color: #0000ff">Currency</a>
                        </td>
                        <td style="width: 50%">
                            <gw:list id="lstCurrency" styles="width:100%;" onchange="getExRate();" />
                        </td>
                        
                    </tr>
                    <tr style="background-color: #EEEEEE; height: 1%; width: 100%">
                        <td colspan="5">
                            <a style="font-family: Courier New; font-size: medium; color: #FF8000">Delivery</a>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%">
                            <a title="Deliver" onclick="OnPopUp('Deliver')" href="#tips" style="color: #0000ff">
                                Deliver</a>
                        </td>
                        <td style="width: 50%" colspan="0">
                            <gw:textbox id="txtDeliverName" styles="width:100%;" onenterkey="" />
                            <gw:textbox id="txtDeliverPK" styles="display=none" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Sale Rep
                        </td>
                        <td style="width: 25%" colspan="0">
                            <gw:textbox id="txtSaleRep" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%">
                            <a title="Ship To" onclick="OnPopUp('Ship_To')" href="#tips" style="color: #0000ff">
                                Ship to</a>
                        </td>
                        <td style="width: 50%" colspan="0">
                            <gw:textbox id="txtShipToName" styles="width:100%;" onenterkey="" />
                            <gw:textbox id="txtShipToPK" styles="display=none" />
                        </td>
                        <td align="right" style="width: 5%" colspan="0">
                            Buy Rep
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtBuyRep" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            <a onclick="OnPopUp('DeliType')" href="#tips" style="color: #0000ff">Deli Type</a>
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstDeliType" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="background-color: #EEEEEE; height: 1%; width: 100%">
                        <td colspan="5">
                            <a style="font-family: Courier New; font-size: medium; color: #FF8000">Payment</a>
                        </td>
                    </tr>
                    <tr style="height: 1%">
					  <td align="right" style="width: 5%; white-space: nowrap">
                            <a title="PLCenter" onclick="OnPopUp('PLCenter')" style="color: #0000ff; cursor: hand">
                                P/L</a>
                        </td>
                        <td style="width: 45%; white-space: nowrap">
                            <gw:textbox id="txtPLPK" styles="display: none" />
                            <gw:textbox id="txtPLCode" styles="width: 30%" />
                            <gw:textbox id="txtPLName" styles="width: 70%" />
                        </td>
						
                        <td align="right" style="width: 5%; white-space: nowrap">
                            
                        </td>
                        <td style="width: 45%; white-space: nowrap" colspan="0">
                           
                        </td>
                       
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            <a onclick="OnPopUp('POType')" href="#tips" style="color: #0000ff">P/O Type</a>
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstPOType" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            <a onclick="OnPopUp('PaymentTerms')" href="#tips" style="color: #0000ff">Pay Term</a>
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstPaymentTerm" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            <a onclick="OnPopUp('Incoterms')" href="#tips" style="color: #0000ff">Price Type</a>
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstPriceType" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%">
                            
                        </td>
                        <td style="width: 30%">
                            
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            <a onclick="OnPopUp('PaymentMethod')" href="#tips" style="color: #0000ff">Pay Method</a>
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstPaymentMethod" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Contract No
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtContractNo" styles="width: 100%" />
                        </td>
                    </tr>
                    <tr style="background-color: #EEEEEE; height: 1%; width: 100%">
                        <td colspan="5">
                            <a style="font-family: Courier New; font-size: medium; color: #FF8000">Number Format(PO)</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan ="4">
                            <table>
                                <tr>
									<td align="right" style="width: 10%; white-space: nowrap">
                                       Req Qty
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstPOReqQty" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                       P/O Qty
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstPOQTy" styles="width:100%;" />
                                    </td>                                    
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                        Unit Price
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstPOPrice" styles="width:100%;" />
                                    </td>                                    
                                </tr>
                                 <tr>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                       Item Amount
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstPOAmount" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                       Tax Rate
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstTaxRate" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                        Tax Amount
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstTaxAmount" styles="width:100%;" />
                                    </td>                                    
                                </tr>
                                 <tr>
                                     <td align="right" style="width: 10%; white-space: nowrap">
                                       Others Exp
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstOthers" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                       Total Amount
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstTotalAmt" styles="width:100%;" />
                                    </td>                                    
                                    <td align="right" >Auto Cal </td>
                                     <td style="width: 20%" colspan="0">
                                        <gw:checkbox id="chkPOAutoCal" onchange="" defaultvalue="Y|N" value="Y" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                     <tr style="background-color: #EEEEEE; height: 1%; width: 100%">
                        <td colspan="5">
                            <a style="font-family: Courier New; font-size: medium; color: #FF8000">Number Format(Stock Incoming) </a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan ="4">
                            <table>
                                <tr>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                       Req Qty
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstReqQty" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                       Take In
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstTakeIn" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                        Unit Price
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstTakeInUP" styles="width:100%;" />
                                    </td>                                    
                                </tr>
                                 <tr>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                       Amount
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstTI_ItemAmt" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                       Tax Rate
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstTI_TaxRate" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                        Tax Amount
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstTI_TaxAmt" styles="width:100%;" />
                                    </td>                                    
                                </tr>
                                 <tr>
                                     <td align="right" style="width: 10%; white-space: nowrap">
                                       Total Amount
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstTI_TotalAmt" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                       Ref Qty
                                    </td>
                                    <td style="width: 25%">
                                       <gw:list id="lstTI_RefQty" styles="width:100%;" />
                                    </td>                                    
                                     <td align="right" >Auto Cal </td>
                                     <td style="width: 20%" colspan="0">
                                        <gw:checkbox id="chkINAutoCal" onchange="" defaultvalue="Y|N" value="Y" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtLGCodeList" styles='display:none;width:100%' />
    <gw:textbox id="txtLGGroupCodeID" styles='display:none;width:100%' />
    <!------------------------------------------->
	<gw:textbox id="txtNULL01" styles='display:none;width:100%' />
</body>
</html>
