<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>S/O SETTING</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script type="text/javascript">
 
    //===============================================================
    function BodyInit() 
   {
        System.Translate(document); 
		
        txtDeliToCode.SetEnable(false);
        txtDeliToName.SetEnable(false);
        txtBillToCode.SetEnable(false);
        txtBillToName.SetEnable(false);
        txtDeliLoc.SetEnable(false);
		
        BindingDataList();
        FormatGrid();
		
        data_dsbs00220.Call('SELECT');
    }
    //===============================================================
function BindingDataList()
 {    
        var data="";                
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGCM0250') FROM DUAL" )%>||";    
        lstDeliMethod.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGCM0260') FROM DUAL" )%>||";    
        lstDeliTerm.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGCM0210') FROM DUAL" )%>||";    
        lstExNation.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGCM0220') FROM DUAL" )%>||";      
        lstDestNation.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGSA1030') FROM DUAL" )%>||";   
        lstSaleType.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGCM0100') FROM DUAL" )%>||";    
        lstCurrency.SetDataText(data);
        lstCurrency.value = "USD";
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGSA1020') FROM DUAL" )%>||";  
        lstOrdType.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGCM0110') FROM DUAL" )%>||";  
        lstPayForm.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGSA1040') FROM DUAL" )%>||";   
        lstOrdPriority.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGCM0120') FROM DUAL" )%>||";    
        lstPayTerm.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('IEBS0020') FROM DUAL" )%>||";     
        lstExPort.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('IEBS0021') FROM DUAL" )%>||";  
        lstDestPort.SetDataText(data); 
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGCM0130') FROM DUAL" )%>||";    
        lstPriceType.SetDataText(data);  
		
	    data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGSA1060') FROM DUAL" )%>";    
    	lstDiscountRate.SetDataText(data);     
    	lstDiscountRate.value = '';           
        
        data = "data|1|1|2|2|3|3|4|4|5|5|6|6";
        lstSaleTeam.SetDataText(data);  
        
		data = "data|0|0 %|5|5 %|10|10 %|15|15 %||";             
        lstTaxRate.SetDataText(data);    
        
        data="data|-2|###,###,#00|-1|###,###,##0|0|###,###|1|###,###.0|2|###,###.00|3|###,###.000|4|###,###.0000|5|###,###.00000|6|###,###.000000";
		
        lstOrderQty.SetDataText(data);
        lstUnitPrice.SetDataText(data);
        lstItemAmount.SetDataText(data);
        lstTaxAmount.SetDataText(data);
        lstTotalAmount.SetDataText(data);
		lstDiscountAmount.SetDataText(data);
        
        lstOrderQty.value = 0 ;
        lstUnitPrice.value = 2;
        lstItemAmount.value = 2 ;
        lstTaxAmount.value = 2 ;
        lstTotalAmount.value = 2 ;
		lstDiscountAmount.value = 2 ;
        
        lstSTQty.SetDataText(data);
        lstOrderUnit.SetDataText(data);
        lstLotUnit.SetDataText(data);
        lstLotQty.SetDataText(data);
        
        lstSTQty.value = 0 ;
        lstOrderUnit.value = 2;
        lstLotUnit.value = 2 ;
        lstLotQty.value = 2 ;
        
        
        
  }       
    //===============================================================
    function FormatGrid() {
    }

    //===============================================================
    function OnSearch(pos) {
        switch (pos) {
            case 'grdSearch':
                data_dsbs00120.Call("SELECT");
            break;

        }
    }

    //===============================================================
    function OnDataReceive(p_oData) {
        switch (p_oData.id) {
            case 'data_fpab00220':
                 if ( txtLGGroupCodeID.text == 'LGCM0100')
                 {
                    lstCurrency.SetDataText(txtLGCodeList.text);  
                    lstCurrency.value = iCodeID;                      
                 }
                 else if ( txtLGGroupCodeID.text == 'LGCM0250')
                 {
                    lstDeliMethod.SetDataText(txtLGCodeList.text);  
                    lstDeliMethod.value = iCodeID;                      
                 }
                 else if ( txtLGGroupCodeID.text == 'LGCM0220')
                 {
                    lstDestNation.SetDataText(txtLGCodeList.text);  
                    lstDestNation.value = iCodeID;                      
                 }
                 else if ( txtLGGroupCodeID.text == 'LGSA50')
                 {
                    lstDestPort.SetDataText(txtLGCodeList.text);  
                    lstDestPort.value = iCodeID;                      
                 }
                 else if ( txtLGGroupCodeID.text == 'LGCM0250')
                 {
                    lstDeliMethod.SetDataText(txtLGCodeList.text);  
                    lstDeliMethod.value = iCodeID;                      
                 }
                 else if ( txtLGGroupCodeID.text == 'LGSA1020')
                 {
                    lstOrdType.SetDataText(txtLGCodeList.text);  
                    lstOrdType.value = iCodeID;                      
                 }
                 else if ( txtLGGroupCodeID.text == 'LGCM0130')
                 {
                    lstPriceType.SetDataText(txtLGCodeList.text);  
                    lstPriceType.value = iCodeID;                      
                 }
                 else if ( txtLGGroupCodeID.text == 'LGCM0110')
                 {
                    lstPayForm.SetDataText(txtLGCodeList.text);  
                    lstPayForm.value = iCodeID;                      
                 }
                 else if ( txtLGGroupCodeID.text == 'LGCM0120')
                 {
                    lstPayTerm.SetDataText(txtLGCodeList.text);  
                    lstPayTerm.value = iCodeID;                      
                 }
                 else if ( txtLGGroupCodeID.text == 'LGCM0210')
                 {
                    lstExNation.SetDataText(txtLGCodeList.text);  
                    lstExNation.value = iCodeID;                      
                 }
                 else if ( txtLGGroupCodeID.text == 'LGSA1030')
                 {
                    lstSaleType.SetDataText(txtLGCodeList.text);  
                    lstSaleType.value = iCodeID;                      
                 }
                 else if ( txtLGGroupCodeID.text == 'LGSA1040')
                 {
                    lstOrdPriority.SetDataText(txtLGCodeList.text);  
                    lstOrdPriority.value = iCodeID;                      
                 }      
                 else if ( txtLGGroupCodeID.text == 'LGSA40')
                 {
                    lstExPort.SetDataText(txtLGCodeList.text);  
                    lstExPort.value = iCodeID;                      
                 }           
                 else if ( txtLGGroupCodeID.text == 'LGCM0260')
                 {
                    lstDeliTerm.SetDataText(txtLGCodeList.text);  
                    lstDeliTerm.value = iCodeID;                      
                 } 
				 else if ( txtLGGroupCodeID.text == 'LGSA1060')
                 {
                    lstDiscountRate.SetDataText(txtLGCodeList.text);  
                    lstDiscountRate.value = iCodeID;                      
                 }                                      
            break;
        }
    }
    //====================================================================================
    function OnPopUp(pos) {
        switch (pos) {
            case 'BillTo':
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AR";
                var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
                if (object != null) {
                    txtBillToPK.text = object[0];
                    txtBillToCode.text = object[1];
                    txtBillToName.text = object[2];
                }
                break;

            case 'DeliTo':
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AR";
                var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');

                if (object != null) {
                    txtDeliToPK.text = object[0];
                    txtDeliToCode.text = object[1];
                    txtDeliToName.text = object[2];
                    txtDeliToPK1.text = object[0];
                }
                break;

            case 'DeliLoc':
                if (txtDeliToPK.text != '') {
                    var path = System.RootURL + '/standard/forms/fp/ab/fpab00180.aspx?partner_pk=' + txtDeliToPK.text + '&partner_id=' + txtDeliToCode.text + '&partner_name=' + txtDeliToName.text;
                    var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
                    if (object != null) {
                        txtDeliLocPK.text = object[0];
                        txtDeliLoc.text = object[4];
                    }
                }
                else {
                    alert('Pls Select Deliery To first !!!');
                }
                break;
            case 'Dest Nation':
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0220";
                var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
                if (object != null) {
                    if (object[0] == 1) {
                        txtLGGroupCodeID.text = 'LGCM0220';
                        iCodeID = object[1];

                        data_fpab00220.Call("SELECT");
                    }
                    else
                        lstDestNation.value = object[1];
                }
                break;
            case 'Dest Port':
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGSA50";
                var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
                if (object != null) {
                    if (object[0] == 1) {
                        txtLGGroupCodeID.text = 'LGSA50';
                        iCodeID = object[1];

                        data_fpab00220.Call("SELECT");
                    }
                    else
                        lstDestPort.value = object[1];
                }
                break;
            case "Deli Method":
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0250";
                var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
                if (object != null) {
                    if (object[0] == 1) {
                        txtLGGroupCodeID.text = 'LGCM0250';
                        iCodeID = object[1];

                        data_fpab00220.Call("SELECT");
                    }
                    else
                        lstDeliMethod.value = object[1];
                }
                break;
            case "Ord Type":
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGSA1020";
                var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
                if (object != null) {
                    if (object[0] == 1) {
                        txtLGGroupCodeID.text = 'LGSA1020';
                        iCodeID = object[1];

                        data_fpab00220.Call("SELECT");
                    }
                    else
                        lstOrdType.value = object[1];
                }
                break;
            case "Price type":
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0130";
                var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
                if (object != null) {
                    if (object[0] == 1) {
                        txtLGGroupCodeID.text = 'LGCM0130';
                        iCodeID = object[1];

                        data_fpab00220.Call("SELECT");
                    }
                    else
                        lstPriceType.value = object[1];
                }
                break;
            case "Pay Way":
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0110";
                var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
                if (object != null) {
                    if (object[0] == 1) {
                        txtLGGroupCodeID.text = 'LGCM0110';
                        iCodeID = object[1];

                        data_fpab00220.Call("SELECT");
                    }
                    else
                        lstPayForm.value = object[1];
                }
                break;
            case "Pay Term":
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0120";
                var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
                if (object != null) {
                    if (object[0] == 1) {
                        txtLGGroupCodeID.text = 'LGCM0120';
                        iCodeID = object[1];

                        data_fpab00220.Call("SELECT");
                    }
                    else
                        lstPayTerm.value = object[1];
                }
                break;
            case "Ex Nation":
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0210";
                var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
                if (object != null) {
                    if (object[0] == 1) {
                        txtLGGroupCodeID.text = 'LGCM0210';
                        iCodeID = object[1];

                        data_fpab00220.Call("SELECT");
                    }
                    else
                        lstExNation.value = object[1];
                }
                break;
            case "Currency":            
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0100";
                var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
                if (object != null) {
                    if (object[0] == 1) {
                        txtLGGroupCodeID.text = 'LGCM0100';
                        iCodeID = object[1];

                        data_fpab00220.Call("SELECT");
                    }
                    else
                        lstCurrency.value = object[1];
                } 
                break;
            case "Production Type":
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGSA1030";
                var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
                if (object != null) {
                    if (object[0] == 1) {
                        txtLGGroupCodeID.text = 'LGSA1030';
                        iCodeID = object[1];

                        data_fpab00220.Call("SELECT");
                    }
                    else
                        lstSaleType.value = object[1];
                }
                break;
            case "Priority":
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGSA1040";
                var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
                if (object != null) {
                    if (object[0] == 1) {
                        txtLGGroupCodeID.text = 'LGSA1040';
                        iCodeID = object[1];

                        data_fpab00220.Call("SELECT");
                    }
                    else
                        lstOrdPriority.value = object[1];
                }
                break;
            case 'Ex Port':
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGSA40";
                var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
                if (object != null) {
                    if (object[0] == 1) {
                        txtLGGroupCodeID.text = 'LGSA40';
                        iCodeID = object[1];

                        data_fpab00220.Call("SELECT");
                    }
                    else
                        lstExPort.value = object[1];
                }
                break;
            case 'Deli Term':
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0260";
                var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
                if (object != null) {
                    if (object[0] == 1) {
                        txtLGGroupCodeID.text = 'LGCM0260';
                        iCodeID = object[1];

                        data_fpab00220.Call("SELECT");
                    }
                    else
                        lstDeliTerm.value = object[1];
                }
                break;
				
			case 'Discount Rate':
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGSA1060";
                var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
                if (object != null) {
                    if (object[0] == 1) {
                        txtLGGroupCodeID.text = 'LGSA1060';
                        iCodeID = object[1];

                        data_fpab00220.Call("SELECT");
                    }
                    else
                        lstDiscountRate.value = object[1];
                }
                break;
        }
    }  
    //================
    function OnSave()
    {
        data_dsbs00220.Call();
    }
	//================
</script>

<b class="eco_link" ody style="margin:0 0 0 0; padding:0 0 0 0;">
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00220" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_fpab00220_2" > 
                <input> 
                    <input bind="txtLGGroupCodeID" />
                </input>
	           <output>
	                <output bind="txtLGCodeList" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_dsbs00220" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35" function="st_lg_sel_dsbs00220" procedure="st_lg_upd_dsbs00220"> 
                <inout>  
                     <inout  bind="txtMasterPK" />    
                     <inout  bind="txtDeliToPK" />
                     <inout  bind="txtDeliToCode" />
                     <inout  bind="txtDeliToName" />
        
                     <inout  bind="txtBillToPK" />
                     <inout  bind="txtBillToCode" />
                     <inout  bind="txtBillToName" />      
                     
                     <inout  bind="lstDeliMethod" />   
                     <inout  bind="lstDeliTerm" /> 
                     
                     <inout  bind="txtDeliLocPK" />
                     <inout  bind="txtDeliLoc" />
                     
                     <inout  bind="lstExNation" />
                     <inout  bind="lstDestNation" />
                     
                     <inout  bind="lstExPort" />
                     <inout  bind="lstDestPort" />
                     
                     <inout  bind="lstOrdType" />
                     <inout  bind="lstPriceType" />
                     
                     <inout  bind="lstPayForm" />
                     <inout  bind="lstPayTerm" />
                     <inout  bind="lstCurrency" />    
                     
                     <inout  bind="lstOrdPriority" />
                     <inout  bind="lstTaxRate" />
                     
                     <inout  bind="lstSaleType" />
                     <inout  bind="lstSaleTeam" />
                     <inout  bind="lstStockType" /> 
                     
                     <inout  bind="lstOrderQty" /> 
                     <inout  bind="lstUnitPrice" /> 
                     <inout  bind="lstItemAmount" /> 
                     <inout  bind="lstTaxAmount" /> 
                     <inout  bind="lstTotalAmount" /> 
                     
                     <inout  bind="lstSTQty" /> 
                     <inout  bind="lstOrderUnit" /> 
                     <inout  bind="lstLotUnit" /> 
                     <inout  bind="lstLotQty" /> 
                     
					 <inout  bind="lstDiscountAmount" />
					 
					 <inout  bind="lstDiscountRate" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 100%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%; background-color: #DDDDDD">
                        <td style="font-family: Courier New; font-size: medium" colspan="6">
                            Delivery Info
                        </td>
                        <td>
                            <gw:button img="save" alt="Save" id="btnSave1" onclick="OnSave()" />
                        </td>
                    </tr>
                    <tr style="height=1%">
                        <td colspan="6">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 10%" align="right">
                                        <b class="eco_link"  style=" cursor: hand" onclick="OnPopUp('DeliTo')">Deli To </b>
                                    </td>
                                    <td style="width: 40%; white-space: nowrap">
                                        <gw:textbox id="txtDeliToCode" csstype="mandatory" styles='width:30%' />
                                        <gw:textbox id="txtDeliToName" csstype="mandatory" styles='width:70%' />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <b class="eco_link"  class="eco_link" style="cursor: hand" onclick="OnPopUp('BillTo')">Bill To </b>
                                    </td>
                                    <td style="width: 40%; white-space: nowrap">
                                        <gw:textbox id="txtBillToCode" csstype="mandatory" styles='width:30%' />
                                        <gw:textbox id="txtBillToName" csstype="mandatory" styles='width:70%' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height=1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            <b class="eco_link"  style=" cursor: hand" onclick="OnPopUp('Deli Method')">Deli Method
                            </b>
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstDeliMethod" styles='width:100%' onchange="" />
                        </td>
                        <td style="width: 10%" align="right">
                            <b class="eco_link"  style=" cursor: hand" onclick="OnPopUp('Deli Term')">Deli Term
                            </b>
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstDeliTerm" styles='width:100%' onchange="" />
                        </td>
                        <td style="width: 10%" align="right">
                            <b class="eco_link"  style=" cursor: hand" onclick="OnPopUp('DeliLoc')">Deli Loc </b>
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtDeliLoc" csstype="mandatory" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height=1%">
                        <td style="width: 10%" align="right">
                            <b class="eco_link"  style=" cursor: hand" onclick="OnPopUp('Ex Nation')">Ex Nation</b>
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstExNation" styles='width:100%' onchange="" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            <b class="eco_link"  style=" cursor: hand" onclick="OnPopUp('Dest Nation')">Dest Nation
                            </b>
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstDestNation" styles='width:100%' onchange="" />
                        </td>
                        <td style="width: 10%" align="right">
                        </td>
                        <td style="width: 30%">
                        </td>
                    </tr>
                    <tr style="height=1%">
                        <td style="width: 10%" align="right">
                            <b class="eco_link"  style=" cursor: hand" onclick="OnPopUp('Ex Port')">Ex Port </b>
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstExPort" styles='width:100%' onchange="" />
                        </td>
                        <td style="width: 10%" align="right">
                            <b class="eco_link"  style=" cursor: hand" onclick="OnPopUp('Dest Port')">Dest Port
                            </b>
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstDestPort" styles='width:100%' onchange="" />
                        </td>
                        <td style="width: 10%" align="right">
                        </td>
                        <td style="width: 30%">
                        </td>
                    </tr>
                    <tr style="height: 1%; background-color: #DDDDDD">
                        <td style="font-family: Courier New; font-size: medium" colspan="7">
                            Sales Term Info
                        </td>
                    </tr>
                    <tr style="height=1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            <b class="eco_link"  style=" cursor: hand" onclick="OnPopUp('Ord Type')">Order Type</b>
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstOrdType" styles='width:100%' />
                        </td>
                        <td style="width: 10%" align="right">
                            <b class="eco_link"  style=" cursor: hand" onclick="OnPopUp('Price type')">Price type</b>
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstPriceType" styles='width:100%' onchange="" />
                        </td>
                        <td style="width: 10%" align="right">
							<b class="eco_link"  style=" cursor: hand" onclick="OnPopUp('Discount Rate')">Discount Rate</b>
                        </td>
                        <td style="width: 30%">
							<gw:list id="lstDiscountRate" styles='width:100%'   />  
                        </td>
                    </tr>
                    <tr style="height=1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            <b class="eco_link"  style=" cursor: hand" onclick="OnPopUp('Pay Way')">Payment Method
                            </b>
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstPayForm" styles='width:100%' />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            <b class="eco_link"  style=" cursor: hand" onclick="OnPopUp('Pay Term')">Payment Term                                                                                                                
                            </b>
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstPayTerm" styles='width:100%' onchange="" />
                        </td>
                        <td style="width: 10%" align="right">
                            <b class="eco_link"  style=" cursor: hand" onclick="OnPopUp('Currency')">Currency</b>
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstCurrency" styles='width:100%' />
                        </td>
                    </tr>
					<tr style="height=1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                             Tax Rate
                        </td>
                        <td style="width: 20%">
                             <gw:list id="lstTaxRate" styles='width:100%;' onchange="OnChangePriceBy()" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                             
                        </td>
                        <td style="width: 20%">
                             
                        </td>
                        <td style="width: 10%" align="right">
                             
                        </td>
                        <td style="width: 30%">
                             
                        </td>
                    </tr>
					
                    <tr style="height: 1%; background-color: #DDDDDD">
                        <td style="font-family: Courier New; font-size: medium" colspan="7">
                            Extension Info
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            <b class="eco_link"  style=" cursor: hand" onclick="OnPopUp('Priority')">Priority</b>
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstOrdPriority" styles='width:100%' />
                        </td>
                        <td style="width: 10%" align="right">
                            
                        </td>
                        <td style="width: 20%">
                            
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            <b class="eco_link"  style=" cursor: hand" onclick="OnPopUp('Production Type')">Prod Type</b>
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstSaleType" styles='width:100%' />
                        </td>
                        <td style="width: 10%" align="right">
                            Sale Team
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstSaleTeam" styles='width:100%;' />
                        </td>
                        <td style="width: 10%" align="right">
                            Stock Type
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstStockType" styles='width:100%' />
                        </td>
                    </tr>
                     <tr style="height: 1%; background-color: #DDDDDD">
                        <td style="font-family: Courier New; font-size: medium" colspan="7">
                            Number Format
                        </td>
                    </tr>
                    <tr style="height:1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Order qty
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstOrderQty" styles='width:100%' />
                        </td>
                        <td style="width: 10%" align="right">
                            Unit Price
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstUnitPrice" styles='width:100%' onchange="" />
                        </td>
                        <td style="width: 10%" align="right">
                            Item Amount
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstItemAmount" styles='width:100%' onchange="" />
                        </td>
                    </tr>
                    <tr style="height:1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Tax Amount
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstTaxAmount" styles='width:100%' />
                        </td>
                        <td style="width: 10%" align="right">
                            Total Amount
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstTotalAmount" styles='width:100%' onchange="" />
                        </td>
                         <td style="width: 10%" align="right">
                            ST Qty
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstSTQty" styles='width:100%' onchange="" />
                        </td>
                    </tr>
                    <tr style="height:1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Ord Unit
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstOrderUnit" styles='width:100%' />
                        </td>
                        <td style="width: 10%" align="right">
                            Lot Unit
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstLotUnit" styles='width:100%' onchange="" />
                        </td>
                         <td style="width: 10%" align="right">
                            Lot Qty
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstLotQty" styles='width:100%' onchange="" />
                        </td>
                    </tr>
					<tr style="height:1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Discount Amt
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstDiscountAmount" styles='width:100%' />
                        </td>
                        <td style="width: 10%" align="right">
                            
                        </td>
                        <td style="width: 20%">
                            
                        </td>
                         <td style="width: 10%" align="right">
                             
                        </td>
                        <td style="width: 20%">
                             
                        </td>
                    </tr>
                    <tr style="height:30%">
                        
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------->
    <gw:textbox id="txtOrderPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtBillToPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtDeliToPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtDeliToPK1" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtDeliLocPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtEmpPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtMasterPK" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------->
    <gw:textbox id="txtLGCodeList" styles='display:none;width:100%' />
    <gw:textbox id="txtLGGroupCodeID" styles='display:none;width:100%' />
</body>
</html>
