<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>SALE ORDER ENTRY</title>
</head>

<script>

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
    
     var next_col_convert ;   
    
   var G1_MASTER_PK			= 0;
	    
    var G2_DETAIL_PK            = 0,   
        G2_MASTER_PK            = 1,   
        G2_SO_ITEM_NO           = 2,   
        G2_SEQ_NUM              = 3,   
        G2_ITEM_PK              = 4,   
        G2_ITEM_CODE            = 5,   
        G2_ITEM_NAME            = 6,          
        G2_CUST_ITEM         	= 7,   
        G2_ST_QTY               = 8,   
        G2_ST_UOM               = 9, 
        G2_ORD_UNIT             = 10,   
        G2_ORD_QTY              = 11,   
        G2_ORD_UOM              = 12,   
        G2_DELI                 = 13,   
        G2_LOT_UNIT             = 14,   
        G2_LOT_QTY              = 15,   
        G2_LOT_UOM              = 16, 
        G2_UNIT_PRICE           = 17,
		G2_ITEM_AMOUNT			= 18,
		G2_TAX_AMOUNT  			= 19,   
        G2_TOTAL_AMOUNT         = 20,   
        G2_ITEM_ETD             = 21,   
        G2_ITEM_ETA             = 22,               
        G2_REMARK               = 23;
       
 //---------------------------------------------------------
 var iCodeID = "" ;
 var callerWindowObj = dialogArguments;  

 //---------------------------------------------------------
 function BodyInit()
 {
    System.Translate(document); 
      OnChangeTab();
      //-----------------------------      
      //dtFromOrderDate.SetDataText(System.AddDate(dtToOrderDate.GetData(),-5));
      //-----------------------------
      System.Translate(document);
      txtEmp_PK.text = user_pk;
      
 	  txtBillToCode.SetEnable(false);
      txtBillToName.SetEnable(false);
      txtDeliToCode.SetEnable(false);
      txtDeliToName.SetEnable(false);
      txtDeliLocName.SetEnable(false);
      txtEmpCode.SetEnable(false);
      txtEmpName.SetEnable(false);
	  
	  txtStyleID.SetEnable(false);
      txtStyleName.SetEnable(false);
	  
	  txtClose.text  = dialogArguments.chkClose.value;
	  if(txtClose.text =='Y')
	  {
	     btnClose.style.display = "none" ;
	  }else
	  {
	     btnUnClose.style.display = "none" ;
	  }
      //----------------------------- 
      txtMasterPK.text = "<%=Request.querystring("p_tsa_saleorder_pk")%>";     
      BindingDataList();
      grd_order_default.Call('SELECT');
      //-----------------------------
      
 }
 
 //==========================================================
 function OnChangeTab()
 {
 
    var strRad = radTab.GetData();
    
    var tab_Deli_Info       = document.all("Tab-Deli-Info");    
    var tab_Sale_Term       = document.all("Tab-Sale-Term");    
    var tab_Extension_Info  = document.all("Tab-Extension-Info"); 
         
	switch (strRad)
	{
		case '1':
		    tab_Deli_Info.style.display      = "";
		    tab_Sale_Term.style.display      = "none";
		    tab_Extension_Info.style.display = "none";
		    
		    document.all("Deli-Info").style.color      = "red"; 
		    document.all("Sale-Term").style.color      = "";
		    document.all("Extension-Info").style.color = ""; 
        break;
        
        case '2':
		    tab_Deli_Info.style.display      = "none";
		    tab_Sale_Term.style.display      = "";
		    tab_Extension_Info.style.display = "none"; 
		    
		    document.all("Deli-Info").style.color      = ""; 
		    document.all("Sale-Term").style.color      = "red";
		    document.all("Extension-Info").style.color = "";       
        break;	
        
        case '3':
		    tab_Deli_Info.style.display      = "none";
		    tab_Sale_Term.style.display      = "none";
		    tab_Extension_Info.style.display = "";
		    
		    document.all("Deli-Info").style.color      = ""; 
		    document.all("Sale-Term").style.color      = "";
		    document.all("Extension-Info").style.color = "red";         
        break;        
    } 
 }

 //---------------------------------------------------------
 function FormatGrid()
 {
      var trl ;
      
      trl = grdDetail.GetGridControl();
      	
      trl.ColFormat(G2_ST_QTY )     = txtMaskSTQty.text;
	  trl.ColFormat(G2_ORD_UNIT)    = txtMaskOrderUnit.text;
      trl.ColFormat(G2_ORD_QTY )    = txtMaskOrderQty.text;
      trl.ColFormat(G2_LOT_UNIT)    = txtMaskLotUnit.text
      trl.ColFormat(G2_LOT_QTY)     = txtMaskLotQty.text; 
          
      trl.ColFormat(G2_UNIT_PRICE)  = txtMaskUnitPrice.text;
	  trl.ColFormat(G2_ITEM_AMOUNT) = txtMaskItemAmount.text;
      trl.ColFormat(G2_TAX_AMOUNT)  = txtMaskTaxAmount.text;
      trl.ColFormat(G2_TOTAL_AMOUNT)= txtMaskTotalAmount.text;   
      
      trl.ColFormat(G2_DELI)    = txtMaskOrderQty.text;   
      
      trl.FrozenCols = G2_ITEM_NAME ;
      
 }
 
  //---------------------------------------------------------
 function BindingDataList()
 {    
       var data="";    
            
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.f_logistic_code('LGCM0250') FROM DUAL" )%>";    
        lstDeliMethod.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.f_logistic_code('LGCM0260') FROM DUAL" )%>";    
        lstDeliTerm.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.f_logistic_code('LGCM0210') FROM DUAL" )%>"; 
        lstExNation.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.f_logistic_code('LGCM0220') FROM DUAL" )%>"; 
        lstDestNation.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.f_logistic_code('LGSA1030') FROM DUAL" )%>";    
        lstProductionType.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.f_logistic_code('LGCM0100') FROM DUAL" )%>";    
        lstCurrency.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.f_logistic_code('LGSA1020') FROM DUAL" )%>";    
        lstOrderType.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.f_logistic_code('LGCM0110') FROM DUAL" )%>";    
        lstPaymentMethod.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.f_logistic_code('LGSA1040') FROM DUAL" )%>"; 
        lstOrdPriority.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.f_logistic_code('LGCM0120') FROM DUAL" )%>";    
        lstPaymentTerm.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.f_logistic_code('IEBS0020') FROM DUAL" )%>";    
        lstExPort.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.f_logistic_code('IEBS0021') FROM DUAL" )%>";    
        lstDestPort.SetDataText(data); 
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.f_logistic_code('LGCM0130') FROM DUAL" )%>";    
        lstPriceType.SetDataText(data); 
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.f_logistic_code('LGSA1050') FROM DUAL" )%>";    
        lstStockType.SetDataText(data);        

		data = "data|0|0 %|5|5 %|10|10 %|15|15 %||";
    	lstTaxRate.SetDataText(data);     
    	lstTaxRate.value = '';                              
		//--------------------------
  }        

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
      switch (po_oData.id)         
      {
        case "grd_order_master" :
             data_dsbs00042_2.Call('SELECT');         
        break;
        
        case "data_dsbs00042_2" :
              if (grdDetail.rows > 1) 
			{
				grdDetail.SetCellBold( 1, G2_ST_QTY,  grdDetail.rows - 1, G2_ST_QTY,  true);
            	grdDetail.SetCellBold( 1, G2_ORD_QTY, grdDetail.rows - 1, G2_ORD_QTY, true);
				grdDetail.SetCellBold( 1, G2_LOT_QTY, grdDetail.rows - 1, G2_LOT_QTY, true);
				
				grdDetail.SetCellBold( 1, G2_DELI,  grdDetail.rows - 1, G2_DELI,  true);
			
            	grdDetail.SetCellBgColor( 1, G2_ITEM_CODE, grdDetail.rows - 1, G2_ITEM_NAME, 0xCCFFFF );			
            	grdDetail.SetCellBgColor( 1, G2_ORD_QTY, grdDetail.rows - 1, G2_ORD_QTY, 0xCCFFFF );
			    grdDetail.SetCellBgColor( 1, G2_DELI,  grdDetail.rows - 1, G2_DELI,   0xFFFFCC );
				
				lblTotalItem.text = grdDetail.rows-1 ;
				
				var total_qty = 0 ;
				
				for (var i=1 ; i<grdDetail.rows; i++)
				{
					total_qty = total_qty + Number(grdDetail.GetGridData( i, G2_ORD_QTY ));
				}

				lblTotalQty.text = total_qty;
            }            
            
        break;        
       
        
        case 'grd_order_default':              
		      FormatGrid();  
		      grd_order_master.Call('SELECT')
		 break;
		 case 'pro_dsbs00042':
		    window.returnValue = '1'; 
		    this.close(); 
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
                 pro_dsbs00042.Call()
                
            }  
    }else
    {
         if ( confirm('Do you want to Unclose this Slip?'))
            {
                 pro_dsbs00042.Call()
                
            }  
    }
}
</script>

<body>
    <gw:data id="pro_dsbs00042" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dsbs00042" > 
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
  
    <!------------------------------------------------------------------>
  <gw:data id="grd_order_master" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47" function="st_lg_sel_dsbs00042_1" > 
                <inout> 
                    <inout bind="txtMasterPK" />
					
                    <inout bind="dtOrderDate" />  
                    <inout bind="txtSoNo" />
                    <inout bind="lstOrderStatus" />					
					<inout bind="txtStylePK" />
                    <inout bind="txtStyleID" />
					
                    <inout bind="txtStyleName" />					
                    <inout bind="txtBillToPK" />
                    <inout bind="txtBillToCode" />
                    <inout bind="txtBillToName" />           
                    <inout bind="txtDeliToPK" />
					
                    <inout bind="txtDeliToCode" />
                    <inout bind="txtDeliToName" /> 
                    <inout bind="lstDeliMethod" />
                    <inout bind="lstDeliTerm" />        
                    <inout bind="txtDeliLocPK" /> 
					 
                    <inout bind="txtDeliLocName" />  
                    <inout bind="lstExNation" />  
                    <inout bind="lstDestNation" />       
                    <inout bind="txtPONum" /> 
                    <inout bind="lstExPort" />
					
                    <inout bind="lstDestPort" />  
					<inout bind="dtPODate" />					
					<inout bind="lstOrderType" />
					<inout bind="lstPriceType" />
					<inout bind="lstPaymentMethod" />
					
					<inout bind="lstPaymentTerm" />					
					<inout bind="txtEmpPK" />
                    <inout bind="txtEmpCode"/>
                    <inout bind="txtEmpName"/>					
					<inout bind="txtOrdAmt" />
					
					<inout bind="txtTaxAmt" />
					<inout bind="txtTotalAmt" />					
					<inout bind="lstTaxRate" />
					<inout bind="lstCurrency" />
					<inout bind="txtExchangeRate" />	
									
                    <inout bind="txtSaleRep" />
					<inout bind="txtBuyReq" />                    
					<inout bind="lstOrdPriority" />
                    <inout bind="lstProductionType" />
                    <inout bind="lstStockType" /> 
					
                    <inout bind="txtRemark" /> 
                    <inout bind="txtAtt01" />
                    <inout bind="txtAtt02" />
                    <inout bind="txtAtt03" />
                    <inout bind="txtAtt04" />	
									                    
                    <inout bind="dtETD" />
                    <inout bind="dtETA" />                                                       
                     
                </inout>
            </dso> 
        </xml> 
    </gw:data>
   
   <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00042_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22" function="st_lg_sel_dsbs00042_2"  > 
                <input> 
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="grd_order_default" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" function="st_lg_sel_dsbs00042_default" > 
                <inout>                           
                     
                     <inout  bind="txtMaskOrderQty" /> 
                     <inout  bind="txtMaskUnitPrice" /> 
                     <inout  bind="txtMaskItemAmount" /> 
                     <inout  bind="txtMaskTaxAmount" /> 
                     <inout  bind="txtMaskTotalAmount" />  
                     
                     <inout  bind="txtMaskSTQty" /> 
                     <inout  bind="txtMaskOrderUnit" /> 
                     <inout  bind="txtMaskLotUnit" /> 
                     <inout  bind="txtMaskLotQty" />                
                    
                </inout>
            </dso> 
        </xml> 
    </gw:data>    
    <!------------------------------------------------------------------>
 <table style="width: 100%; height: 100%" border="0">
            <tr style="height: 1%">
                <td>
                    <table style="width: 100%; height: 100%">
                        <tr>
						    <td style="width: 5%; white-space: nowrap" align="right">
                                <b>Ord Date</b>
                            </td>
                            <td style="width: 25%">
                                <gw:datebox id="dtOrderDate" lang="1" />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                <b>S/O No</b>
                            </td>
                            <td style="width: 30%">
                                <gw:textbox id="txtSoNo" styles='width:100%' csstype="mandatory" onenterkey="SetItemSequence()" />
                            </td>
                            <td style="width: 23%; white-space: nowrap" align="center" colspan="2">
                                <gw:label id="lstOrderStatus" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                            </td>  
							<td style="width: 1%" align="right">                                         
                            </td>                                   
                            <td style="width: 1%" align="left">                                        
                            </td>
                           
							<td style="width: 1%" align="left">
								<gw:button id="btnClose" img="Close" text="Close" onclick="OnProcess(1)" />
								<gw:button id="btnUnClose" img="UnClose" text="UnClose" onclick="OnProcess(2)" />
                            </td>                                                                                                  
                        </tr>                                
                    </table>
                </td>
            </tr>
			<tr style="height: 1%">
                <td>
                    <table style="width: 100%; height: 100%; background-color: #B4E7FF">
						<tr>
                            <td style="white-space: nowrap;width: 40%" align="left">
                                <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab()"> 
                                    <span value="1" id="Deli-Info">Delivery Info</span> 
                                    <span value="2" id="Sale-Term">Sales Term Info</span> 
                                    <span value="3" id="Extension-Info">Extension Info</span>
                                </gw:radio>
                            </td>
                            <td style="white-space: nowrap;width: 5%" align="right">
                                <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Style')">Style</b>
                            </td>
                            <td style="white-space: nowrap;width: 55%">
                                <gw:textbox id="txtStylePK" styles='display:none' />
                                <gw:textbox id="txtStyleID" styles='width:30%' />
                                <gw:textbox id="txtStyleName" styles='width:70%' />
                            </td>
                        </tr>
					</table>
				</td>
			</tr>		
            <tr style="height: 1%">
                <td valign="top">
                    <table id="Tab-Deli-Info" style="width: 100%; height: 100%">
                        <tr>
                            <td colspan="6">
                                <table style="width: 100%; height: 100%" border=0 >
                                    <tr>
                                        <td style="width: 5%; white-space: nowrap" align="right">
                                           Deli To 
                                        </td>
                                        <td style="width: 45%; white-space: nowrap">
											<gw:textbox id="txtDeliToPK" maxlen="100" styles='width:100%;display:none' />
                                            <gw:textbox id="txtDeliToCode" csstype="mandatory" styles='width:30%' />
                                            <gw:textbox id="txtDeliToName" csstype="mandatory" styles='width:70%' />
                                        </td>
                                        <td style="width: 5%; white-space: nowrap" align="right">
                                            Bill To 
                                        </td>
                                        <td style="width: 45%; white-space: nowrap;" >
											<gw:textbox id="txtBillToPK" maxlen="100" styles='width:100%;display:none' />
                                            <gw:textbox id="txtBillToCode" csstype="mandatory" styles='width:30%' />
                                            <gw:textbox id="txtBillToName" csstype="mandatory" styles='width:70%' />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Deli Method
                            </td>
                            <td style="width: 25%">
                                <gw:list id="lstDeliMethod" styles='width:100%' onchange="" />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Deli Term
                            </td>
                            <td style="width: 25%">
                                <gw:list id="lstDeliTerm" styles='width:100%' onchange="" />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Deli Loc
                            </td>
                            <td style="width: 35%">
								<gw:textbox id="txtDeliLocPK" maxlen="100" styles='width:100%;display:none' />
                                <gw:textbox id="txtDeliLocName" csstype="mandatory" styles='width:100%' />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Ex Nation
                            </td>
                            <td style="width: 25%">
                                <gw:list id="lstExNation" styles='width:100%' onchange="" />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Dest Nation
                            </td>
                            <td style="width: 25%">
                                <gw:list id="lstDestNation" styles='width:100%' onchange="" />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                P/O Num
                            </td>
                            <td style="width: 35%">
                                <gw:textbox id="txtPONum" styles='width:100%' />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Ex Port
                            </td>
                            <td style="width: 25%">
                                <gw:list id="lstExPort" styles='width:100%' onchange="" />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Dest Port
                            </td>
                            <td style="width: 25%">
                                <gw:list id="lstDestPort" styles='width:100%' onchange="" />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                <b>P/O Date</b>
                            </td>
                            <td style="width: 35%">
                                <gw:datebox id="dtPODate" lang="1" styles='width:80%' />
                            </td>
                        </tr>
                    </table>
                    <table id="Tab-Sale-Term" style="width: 100%; height: 100%">
                        <tr>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Ord Type
                            </td>
                            <td style="width: 25%">
                                <gw:list id="lstOrderType" styles='width:100%' onchange="OnChangeList(this)" />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                               Price type
                            </td>
                            <td style="width: 25%">
                                <gw:list id="lstPriceType" styles='width:100%' onchange="" />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                               Employee
                            </td>
                            <td style="width: 35%; white-space: nowrap" colspan=2 >
								<gw:textbox id="txtEmpPK" maxlen="100" styles='width:100%;display:none' />
                                <gw:textbox id="txtEmpCode" csstype="mandatory" styles='width:30%' />
                                <gw:textbox id="txtEmpName" csstype="mandatory" styles='width:70%' />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                <b>Order Amt</b>
                            </td>
                            <td style="width: 25%">
                                <gw:textbox id="txtOrdAmt" styles='width:100%' csstype="mandatory" type="number"
                                    format="###,###.###" />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Pay Method
                            </td>
                            <td style="width: 25%">
                                <gw:list id="lstPaymentMethod" styles='width:100%' />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                <b>Sale Rep</b>
                            </td>
                            <td style="width: 35%" colspan=2 >
                                <gw:textbox id="txtSaleRep" styles='width:100%' />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Tax Amt
                            </td>
                            <td style="width: 25%">
                                <gw:textbox id="txtTaxAmt" styles='width:100%' type="number" format="###,###.###"
                                    csstype="mandatory" onenterkey="OnChangeTextbox(this)" />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Pay Term
                            </td>
                            <td style="width: 25%">
                                <gw:list id="lstPaymentTerm" styles='width:100%' onchange="" />
                            </td>
                            <td style="width: 5%" align="right">
                                <b>Buy Rep</b>
                            </td>
                            <td style="width: 35%" colspan=2 >
                                <gw:textbox id="txtBuyReq" styles='width:100%' />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                <b>Total Amt </b>
                            </td>
                            <td style="width: 25%">
                                <gw:textbox id="txtTotalAmt" styles='width:100%' type="number" format="###,###.###"
                                    csstype="mandatory" />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                <b>Tax Rate</b>
                            </td>
                            <td style="width: 25%"> 
								<gw:list id="lstTaxRate" styles='width:100%' onchange="OnChangeRate()" csstype="mandatory" />                                       
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Ex-Rate
                            </td>
                            <td style="width: 15%; white-space: nowrap">
								<gw:list id="lstCurrency" styles='width:100%' />
							</td>
							<td style="width: 20%; white-space: nowrap">	
                                <gw:textbox id="txtExchangeRate" csstype="mandatory" type="number" format="###,###.###"
                                    styles='width:100%' text='' />
                            </td>
                        </tr>
                    </table>
                    <table id="Tab-Extension-Info" style="width: 100%; height: 100%">
                        <tr>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Priority
                            </td>
                            <td style="width: 25%">
                                <gw:list id="lstOrdPriority" styles='width:100%' />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right"> 
								Remark 1                                        
                            </td>
                            <td style="width: 25%" colspan=3 >                                    
                                <gw:textbox id="txtAtt01" styles='width:100%' />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Prod Type
                            </td>
                            <td style="width: 25%">
                                <gw:list id="lstProductionType" styles='width:100%' />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right"  >
								Remark 2   
							</td>
							<td colspan=3>	                                  
                                <gw:textbox id="txtAtt02" styles='width:100%' />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Stock Type
                            </td>
                            <td style="width: 25%">
                                <gw:list id="lstStockType" styles='width:100%' />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Remark 3
                            </td>
                            <td style="width: 25%" colspan=3 >
								<gw:textbox id="txtAtt03" styles='width:100%' />                                                                 
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Remark
                            </td>
                            <td style="width: 25%">
                                <gw:textbox id="txtRemark" styles='width:100%' />
                            </td>
                            <td style="width: 5%" align="right">
								Remark 4
                            </td>
                            <td style="width: 25%" colspan=3 >
                            	<gw:textbox id="txtAtt04" styles='width:100%' />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 1%">
                <td>
                    <table style="width: 100%; height: 100%">
                        <tr style="height: 2%">
                        
                            <td style="width: 5%" align="right">
                                ETD
                            </td>
                            <td style="width: 15%" align="left">
                                <gw:datebox id="dtETD" lang="1" onchange="OnSetDate('ETD')" />
                            </td>
                            <td style="width: 5%" align="right">
                                ETA
                            </td>
                            <td style="width: 15%" align="left">
                                <gw:datebox id="dtETA" lang="1" onchange="OnSetDate('ETA')" />
                            </td>                                    
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Items :
                            </td>
                            <td style="width: 20%; white-space: nowrap" align="center">
                                <gw:label id="lblTotalItem" styles='width:100%;color:cc0000;font:9pt' text='' />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Qty :
                            </td>
                            <td style="width: 20%; white-space: nowrap" align="center">
                                <gw:label id="lblTotalQty" styles='width:100%;color:cc0000;font:9pt' text='' type="number"
                                    format="###.###,###.##" />
                            </td>
                            <td style="width: 13%">
                            </td>
                            <td style="width: 1%">                                        
                            </td>
                            
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 97%">
                <td>
                    <gw:grid id='grdDetail' 
						header='_DETAIL_PK|_MASTER_PK|S/O Item No|Seq|_ITEM_PK|Item Code|Item Name|Cust Item|_Cust Qty|_UOM|_ORD UNIT|Ord Qty|UOM|DELIVERY|_Lot Unit|_Lot QTY|_UOM|U/Price|Item Amt|Tax Amt|Total Amt|ETD|ETA|Remark'
                        format='0|0|0|0|0|0|0|2|0|2|0|0|0|2|2|0|2|0|0|0|0|4|4|0'
                        aligns='0|0|0|1|0|0|0|0|3|1|3|3|3|1|3|3|1|3|3|3|3|1|1|0'
                        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                        widths='0|0|1600|500|0|2000|3000|1500|1200|800|1000|1200|800|1200|1000|1200|800|1200|1200|1200|1200|1200|1200|1000'
                        sorting='T' styles='width:100%; height:100%' acceptnulldate="T" 
                         />
                </td>
            </tr>
     </table>
     <!------------------------------------------------------>
    <gw:textbox id="txtMasterPK" maxlen="100" styles='width:100%;display:none' />       
    <!------------------------------------------------------>
    <gw:textbox id="txtClose" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
	<!------------------------------------------------------>
	<gw:textbox id="txtEmp_PK" maxlen="100" styles='width:100%;display:none' /> 
	<gw:textbox id="txtItemCD_Search" maxlen="100" styles='width:100%;display:none' /> 
	<gw:textbox id="txtItemNM_Search" maxlen="100" styles='width:100%;display:none' />
     <!------------------------------------------------------>
     <gw:textbox id="txtMaskOrderQty"   styles='width:100%;display:none' />
     <gw:textbox id="txtMaskUnitPrice"   styles='width:100%;display:none' />
     <gw:textbox id="txtMaskItemAmount"  styles='width:100%;display:none' />
     <gw:textbox id="txtMaskTaxAmount"   styles='width:100%;display:none' />
     <gw:textbox id="txtMaskTotalAmount" styles='width:100%;display:none' />
     
     <gw:textbox id="txtMaskSTQty"     styles='width:100%;display:none' />
     <gw:textbox id="txtMaskOrderUnit" styles='width:100%;display:none' />
     <gw:textbox id="txtMaskLotUnit"   styles='width:100%;display:none' />
     <gw:textbox id="txtMaskLotQty"    styles='width:100%;display:none' />
     
</body>
</html>
