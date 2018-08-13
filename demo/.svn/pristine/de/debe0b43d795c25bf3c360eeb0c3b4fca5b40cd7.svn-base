<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up view P/O detail</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

//======================================================================
var G1_Null_01     = 0,
    G1_PO_D_PK   = 1,
    G1_Seq       = 2,
    
    G1_Req_Item_PK   = 3,
    G1_Req_Item_Code = 4,
    G1_Req_Item_name = 5,
    G1_PO_ITEM_PK    = 6,
    G1_PO_Item_Code  = 7,
    G1_PO_Item_Name  = 8,
    
    G1_PO_Qty_1  = 9,
    G1_UOM_1     = 10,
    G1_TAKEIN    = 11,
    G1_PO_Qty_2  = 12,
    G1_UOM_2     = 13,
    G1_UPrice    = 14,
    G1_PO_Amt    = 15,
    G1_VAT_Rate   = 16,
    G1_VAT_Amount= 17,
    G1_Total_Amt = 18,
    G1_ETD_From  = 19,
    G1_ETD_To    = 20,
    G1_ETA_From  = 21,
    G1_ETA_To    = 22,
    G1_Ref_No      = 23,
    G1_Null_02   = 24,
    G1_Remark    = 25,
    G1_PR_D_PK   = 26,
    G1_PARENT_PK = 27,   
    G1_Null_03   = 28, 
    G1_PO_M_PK   = 29;
    
//======================================================================
 var callerWindowObj = dialogArguments;  
function BodyInit()
{   System.Translate(document);
    //----------------------------------               
    txtPONo.SetEnable(false);
    txtRefPONo.SetEnable(false);
    txtStaffName.SetEnable(false);
    txtDeliverName.SetEnable(false);
    txtShipToName.SetEnable(false);
    txtSupplierName.SetEnable(false);
    txtDeliverName.SetEnable(false);
    txtBillToName.SetEnable(false); 
   
    txtPLCode.SetEnable(false);
    txtPLName.SetEnable(false);
    //---------------------------------- 
               
  
    BindingData();
    OnChangeTab();
    OnToggleGrid();
    //----------------------------------
      txtClose.text  = dialogArguments.chkClose.value;
      if(txtClose.text =='Y')
      {
         btnClose.style.display = "none" ;
      }else
      {
         btnUnClose.style.display = "none" ;
      }
	  
    txtMasterPK.text = "<%=Request.querystring("po_pk")%>";
    epbp00081_setting.Call('SELECT');  
    //----------------------------------    
}
//======================================================================
 function BindingData()
 {
    var data ;
     
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGCM0140') FROM DUAL")%>||";  //tradding 
     lstPOType.SetDataText(data);
     lstPOType.value = '' ;
     
     data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGPO2002') FROM DUAL")%>||";  //carrier
     lstCarrier.SetDataText(data);
     lstCarrier.value = '' ;
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGCM0110') FROM DUAL")%>||";  //payment form
     lstPaymentMethod.SetDataText(data);
     lstPaymentMethod.value = '' ;  
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGCM0120') FROM DUAL")%>||";  //payment term
     lstPaymentTerm.SetDataText(data);
     lstPaymentTerm.value = '' ; 
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
     lstCurrency.SetDataText(data);
     lstCurrency.value = "USD";   
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGCM0130') FROM DUAL" )%>||";    
     lstPriceType.SetDataText(data);
     lstPriceType.value = '';
     
     //-----------------------
     data ="data|1|P/O Qty 1|2|P/O Qty 2"
     lstPriceBy.SetDataText(data);  
     lstPriceBy.value = 1; 
 }
 function FormFormat()
 {      
     
     
     var ctr = grdDetail.GetGridControl(); 
    
     ctr.ColFormat(G1_PO_Qty_1)  = txtMaskPOQTy.text;
     ctr.ColFormat(G1_TAKEIN)  = txtMaskPOQTy.text;
     ctr.ColFormat(G1_PO_Qty_2)  = txtMaskPOQTy2.text;
     
     ctr.ColFormat(G1_UPrice)     = txtMaskPOPrice.text;
     ctr.ColFormat(G1_PO_Amt)     = txtMaskPOAmount.text;     
     ctr.ColFormat(G1_VAT_Rate)   = txtMaskItemRate.text;
     ctr.ColFormat(G1_Total_Amt)  = txtMaskTotalAmt.text;  
     ctr.ColFormat(G1_VAT_Amount) = txtMaskTaxAmount.text;      
     
 }

//======================================================================
  
function OnSearch(pos)
{  
    switch (pos)
    {    
        case 'grdMaster':        
            data_epbp00081_1.Call("SELECT");
        break;
        
        case 'grdDetail':            
            data_epbp00081_2.Call("SELECT");
        break;
    }
}

//======================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "pro_epbp00081":
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();
        break;
        
        case 'epbp00081_setting':
              FormFormat();
            data_epbp00081_1.Call('SELECT')
        break;
        
        case "data_epbp00081_1":                    
            //---------------------------- 
            data_epbp00081_2.Call('SELECT')          
        break;
        
        case "data_epbp00081_2":
	        if ( grdDetail.rows > 1 )
	        {
	            grdDetail.SetCellBold( 1, G1_PO_Item_Code, grdDetail.rows - 1, G1_PO_Item_Code,  true);
	            
                grdDetail.SetCellBold( 1, G1_PO_Qty_1,  grdDetail.rows - 1, G1_TAKEIN, true);
                grdDetail.SetCellBold( 1, G1_PO_Qty_2,  grdDetail.rows - 1, G1_PO_Qty_2, true);
                grdDetail.SetCellBold( 1, G1_UPrice,    grdDetail.rows - 1, G1_UPrice,    true); 
                grdDetail.SetCellBold( 1, G1_Total_Amt, grdDetail.rows - 1, G1_Total_Amt, true);               
                
                grdDetail.SetCellBgColor( 1, G1_Req_Item_Code , grdDetail.rows - 1, G1_Req_Item_name , 0xCCFFFF );
                grdDetail.SetCellBgColor( 1, G1_PO_Qty_1 , grdDetail.rows - 1, G1_PO_Qty_1 , 0xCCFFFF );
                grdDetail.SetCellBgColor( 1, G1_TAKEIN , grdDetail.rows - 1, G1_TAKEIN , 0xCCFFFF );
                
                for ( var i = 1 ; i < grdDetail.rows ; i++)
                {
                    if ( Number(grdDetail.GetGridData( i, G1_Req_Item_PK)) > 0 && ( grdDetail.GetGridData( i, G1_Req_Item_PK) != grdDetail.GetGridData( i, G1_PO_ITEM_PK) ) )
                    {
                        grdDetail.GetGridControl().Cell( 7, i, G1_PO_Item_Code, i, G1_PO_Item_Name ) = 0x3300cc;
                    }
                }        
                //--------------------------------
	        }   
        break;                
    }
}
//====================================================================
function OnChangeTab()
{ 
    var info     = document.all("info"); 
    var shipment = document.all("shipment"); 
    var payment  = document.all("payment");
    
    switch (radTab.value)
    {
        case '1':
            info.style.display     = "";
            shipment.style.display = "none"; 
            payment.style.display  = "none";           
        break;
        
        case '2' :
            info.style.display     = "none";
            shipment.style.display = "";
            payment.style.display  = "none"; 
        break;
        
        case '3' :
            info.style.display     = "none";
            shipment.style.display = "none";
            payment.style.display  = ""; 
        break;        
    }
}
//==============================================================================
function OnProcess(obj)
{
    if(obj == 1)
    {
            if ( confirm('Do you want to Close this Slip?'))
            {
                 pro_epbp00081.Call()
                
            }  
    }else
    {
         if ( confirm('Do you want to Unclose this Slip?'))
            {
                 pro_epbp00081.Call()
                
            }  
    }
}
//======================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";

		grdDetail.GetGridControl().ColHidden(G1_Req_Item_Code) = true ;
		grdDetail.GetGridControl().ColHidden(G1_Req_Item_name) = true ;
		grdDetail.GetGridControl().ColHidden(G1_PO_Qty_2)      = true ;
		grdDetail.GetGridControl().ColHidden(G1_UOM_2)         = true ;
		grdDetail.GetGridControl().ColHidden(G1_ETD_To)        = true ;
		grdDetail.GetGridControl().ColHidden(G1_ETA_To)        = true ;
		
        imgMaster.src = "../../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";
        
		grdDetail.GetGridControl().ColHidden(G1_Req_Item_Code) = false;
		grdDetail.GetGridControl().ColHidden(G1_Req_Item_name) = false ;
		grdDetail.GetGridControl().ColHidden(G1_PO_Qty_2)      = false ;
		grdDetail.GetGridControl().ColHidden(G1_UOM_2)         = false ;
		grdDetail.GetGridControl().ColHidden(G1_ETD_To)        = false ;
		grdDetail.GetGridControl().ColHidden(G1_ETA_To)        = false ;				
		
        imgMaster.src = "../../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}
//===================================================================================

</script>

<body>
    <gw:data id="pro_epbp00081" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00081" > 
                <input>
                    <input bind="txtClose" />
                    <input bind="txtMasterPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
  <!--------------------------------------->
    <gw:data id="epbp00081_setting" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3" function="st_lg_sel_epbp00081_setting"> 
                <inout> 	                 
                     <inout bind="txtMaskPOQTy" />  
                     <inout bind="txtMaskPOPrice" /> 
                     <inout bind="txtMaskPOAmount" /> 
                     
                     <inout bind="txtMaskItemRate" /> 
                     <inout bind="txtMaskTaxAmount" /> 
                     <inout bind="txtMaskOthers" /> 
                     <inout bind="txtMaskTotalAmt" /> 
                     <inout bind="txtMaskPOQTy2" /> 
                     
                </inout>
            </dso> 
        </xml> 
    </gw:data>

    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00081_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" function="st_lg_sel_epbp00081_1">
                <input>                                                                                                                                                 
                    <inout bind="txtMasterPK" />
                    <inout bind="txtPONo" />
                    <inout bind="dtPODate" />
                    <tnout bind="lblStatus" />
                    <inout bind="txtStaffPK" />
                    <inout bind="txtStaffName" />  
                    <inout bind="txtArraySOPK" />
                    <inout bind="txtRefPONo" />
                    <inout bind="txtRemark" /> 
                    <inout bind="txtSupplierPK" /> 
                    <inout bind="txtSupplierName" />
                    <inout bind="txtBillToPK" />
                    <inout bind="txtBillToName" />                  
                    <inout bind="lstCurrency" />                    
                    <inout bind="lstPriceBy" />
                    <inout bind="txtPOAmount" />   
                    <inout bind="txtVATAmount" /> 
                    <inout bind="txtTotalAmount" />
                    <inout bind="dtETDFrom" />
                    <inout bind="dtETDTo" />  
                    <inout bind="dtETAFrom" />
                    <inout bind="dtETATo" />   
                    <inout bind="txtDeliverPK" />
                    <inout bind="txtDeliverName" />                                        
                    <inout bind="txtBuyRep" />
                    <inout bind="txtShipToPK" />
                    <inout bind="txtShipToName" />                     
                    <inout bind="txtSaleRep" />  
                                      
                    <inout bind="txtPLPK" />
                    <inout bind="txtPLCode" />
                    <inout bind="txtPLName" />                                                                                                      
                    <inout bind="txtContractNo" />                                                                             
                    <inout bind="lstPaymentMethod" />
                    <inout bind="lstPaymentTerm" />
                    <inout bind="lstPriceType" />  
                    <inout bind="txtExRate" />
                    <inout bind="lstPOType" />
                    <inout bind="lstCarrier" />
                </input>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00081_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="4" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26" function="st_lg_sel_epbp00081_2"> 
                <input bind="grdDetail">
                    <input bind="txtMasterPK" />               
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>   
    <!--------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td align="right" style="width: 10%; white-space: nowrap">
                P/O No
            </td>
            <td style="width: 35%">
                <gw:textbox id="txtPONo" styles="width: 100%" csstype="mandatory" />
            </td>
            <td align="right" style="width: 10%; white-space: nowrap">
                P/O Date
            </td>
            <td style="width: 20%">
                <gw:datebox id="dtPODate" lang="<%=Application("Lang")%>" mode="01" />
            </td>
            <td style="width: 20%" align="center">
                <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt' />
            </td>
            <td style="width: 3%">
            </td>
            <td style="width: 1%">
            </td>
            <td style="width: 1%">
               <gw:button id="btnClose" img="Close" text="Close" onclick="OnProcess(1)" />
			   <gw:button id="btnUnClose" img="UnClose" text="UnClose" onclick="OnProcess(2)" />

            </td>
        </tr>
        <tr style="height: 1%">
            <td align="right" style="width: 10%">
                Charger
            </td>
            <td style="width: 30%">
                <gw:textbox id="txtStaffName" styles="width:100%" />
                <gw:textbox id="txtStaffPK" styles="display:none" />
            </td>
            <td align="right" style="width: 10%">
                Remark
            </td>
            <td style="width: 25%" colspan="8">
                <gw:textbox id="txtRemark" styles="width:100%;" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="12" align="left">
                <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab()"> 
                    <span value="1" id="1">P/O Info</span> 
                    <span value="2" id="2">Delivery</span>
                    <span value="3" id="3">Payment</span>
                </gw:radio>
            </td>
        </tr>
        <tr style="height: 1%" id="info">
            <td colspan="12">
                <table style="height: 100%; width: 100%; background-color: #CCFFFF" border="0">
                    <tr style="height: 1%">
                        <td colspan="6">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                        Supplier
                                    </td>
                                    <td style="width: 40%">
                                        <gw:textbox id="txtSupplierName" styles="width:100%;" onenterkey="" />
                                        <gw:textbox id="txtSupplierPK" styles="display:none" />
                                    </td>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                        Bill to
                                    </td>
                                    <td style="width: 40%">
                                        <gw:textbox id="txtBillToName" styles="width:100%;" />
                                        <gw:textbox id="txtBillToPK" styles="display=none" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Ref No</td>
                        <td style="width: 25%">
                            <gw:textbox id="txtRefPONo" styles="width: 100%" />
                            <gw:textbox id="txtArraySOPK" styles="width: 100%;display: none" />
                        </td>
                        <td align="right" style="width: 10%">
                            Price by
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstPriceBy" styles='width:100%;' csstype="mandatory" onchange="" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Currency
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstCurrency" styles="width:100%;" onchange="getExRate();" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%">
                            Amount
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtPOAmount" type="number" format="#,###,###,###,###.###R" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 10%">
                            VAT Amount
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtVATAmount" type="number" format="#,###,###,###,###.###R" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Total Amount
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtTotalAmount" type="number" format="#,###,###,###,###.###R" styles="width:100%;" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%" id="shipment">
            <td colspan="12">
                <table style="height: 100%; width: 100%; background-color: #CCFFFF" border="0">
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%">
                            Deliver
                        </td>
                        <td style="width: 60%" colspan="3">
                            <gw:textbox id="txtDeliverName" styles="width:100%;" onenterkey="" />
                            <gw:textbox id="txtDeliverPK" styles="display=none" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Sale Rep
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSaleRep" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%">
                            Ship to
                        </td>
                        <td style="width: 60%" colspan="3">
                            <gw:textbox id="txtShipToName" styles="width:100%;" onenterkey="" />
                            <gw:textbox id="txtShipToPK" styles="display=none" />
                        </td>
                        <td align="right" style="width: 10%">
                            Buy Rep
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtBuyRep" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            ETD
                        </td>
                        <td style="width: 25%; white-space: nowrap">
                            <gw:datebox id="dtETDFrom" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                            ~
                            <gw:datebox id="dtETDTo" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                        </td>
                        <td style="width: 10%" align="right">
                            ETA
                        </td>
                        <td style="width: 25%">
                            <gw:datebox id="dtETAFrom" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                            ~
                            <gw:datebox id="dtETATo" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Carrier
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstCarrier" styles="width:100%;" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%" id="payment">
            <td colspan="12">
                <table style="height: 100%; width: 100%; background-color: #CCFFFF" border="0">
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            <a title="PLCenter" onclick="OnPopUp('PLCenter')" style="color: #0000ff; cursor: hand">
                                            P/L</a>
                        </td>
                        <td colspan=3 style="  white-space: nowrap">
                            <gw:textbox id="txtPLPK" styles="display: none" />
                            <gw:textbox id="txtPLCode" styles="width: 30%" />
                            <gw:textbox id="txtPLName" styles="width: 70%" />
                        </td>                                   
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Contract No
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtContractNo" styles="width: 100%" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            P/O Type
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstPOType" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Pay Term
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstPaymentTerm" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Pay Method
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstPaymentMethod" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Price Type
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstPriceType" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 10%">
                            Ex-Rate
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtExRate" type="number" format="#,###,###,###,###.###R" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 10%">
                             
                        </td>
                        <td style="width: 20%">
                             
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 1%" colspan="8" align="left">
                <img status="expand" id="imgMaster" alt="Show all column" src="../../../../system/images/close_popup.gif"
                    style="cursor: hand" onclick="OnToggleGrid()" />
            </td>
            <td style="width: 1%">
                <gw:button id="btnQuotation" img="Quotation" text="Quotation" onclick="OnCheckPrice()" />
            </td>
        </tr>
        <tr style="height: 93%">
            <td colspan="12">
                <gw:grid id='grdDetail' header='_Null01|_PK|Seq|_Req_Item_PK|Req Item Code|Req Item Name|_PO_ITEM_PK|P/O Item Code|P/O Item Name|P/O Qty 1|UOM|TAKE IN |P/O Qty 2|UOM|U/Price|P/O Amount|VAT(%)|VAT Amount|Total Amount|ETD From|ETD To|ETA From|ETA To|Ref No|_Null02|Remark|_PO_MR_D_PK|_PARENT_PK|_Null03|_PO_PO_M_PK'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|4|4|4|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0|0|3|1|3|3|1|3|3|3|3|3|1|1|1|1|0|0|0|0|0|0|0'
                    check='|||||||||||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1000|0|1000|0|2000|2500|0|2000|2500|1500|1000|1500|1500|1000|1500|1500|1500|1500|1500|1200|1200|1200|1200|1200|1500|1000|0|0|0|0'
                    sorting='T' acceptnulldate='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <!--------------------------------------------------------------------------->
    
      <gw:textbox id="txtClose" styles='width:100%;display:none' />
    
     <gw:textbox id="txtMaskPOQTy" styles='display:none;width:100%' />
     <gw:textbox id="txtMaskPOQTy2" styles='display:none;width:100%' />
     <gw:textbox id="txtMaskPOPrice" styles='display:none;width:100%' />
     <gw:textbox id="txtMaskPOAmount" styles='display:none;width:100%' />
     
     <gw:textbox id="txtMaskItemRate" styles='display:none;width:100%' />
     <gw:textbox id="txtMaskTaxAmount" styles='display:none;width:100%' />
     <gw:textbox id="txtMaskOthers" styles='display:none;width:100%' /> 
     <gw:textbox id="txtMaskTotalAmt" styles='display:none;width:100%' />
</body>
</html>
