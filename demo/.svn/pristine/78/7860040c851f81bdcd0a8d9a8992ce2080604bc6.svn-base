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
var G1_PO_D_PK   	= 0,	
    G1_SEQ       	= 1, 
	G1_REF_NO   	= 2,   
    G1_REQ_ITEM_PK  = 3,
    G1_REQ_ITEM_CD  = 4,
    G1_REQ_ITEM_NM  = 5,
    G1_PO_ITEM_PK   = 6,
    G1_PO_ITEM_CD   = 7,
    G1_PO_ITEM_NM   = 8,        
    G1_REQ_QTY      = 9,
    G1_REQ_UOM      = 10,
	G1_PO_QTY       = 11,
    G1_PO_UOM       = 12,
    G1_UPRICE       = 13,
    G1_PO_AMT       = 14,
    G1_VAT_RATE     = 15,
    G1_VAT_AMT      = 16,
    G1_OTHERS_EXP   = 17,
    G1_TOTAL_AMT    = 18,
    G1_ETD_FROM     = 19,
    G1_ETD_TO       = 20,
    G1_ETA_FROM     = 21,
    G1_ETA_TO       = 22,
    G1_NULL_01      = 23,
    G1_NULL_02      = 24,
    G1_REMARK       = 25,
    G1_PR_D_PK      = 26,
    G1_PARENT_PK    = 27,
    G1_NULL_03      = 28,   
    G1_PO_M_PK      = 29; 
    
//======================================================================
var flag = false;var callerWindowObj;var curr_row ;var p_type;
function BodyInit()
{   System.Translate(document);

    callerWindowObj = dialogArguments;
	txtLang.text = "<%=Session("SESSION_LANG")%>";
    //----------------------------------               
    txtPONo.SetEnable(false);
     
    txtStaffName.SetEnable(false);
    txtDeliverName.SetEnable(false);
    txtShipToName.SetEnable(false);
    txtSupplierName.SetEnable(false);
    txtDeliverName.SetEnable(false);
    txtBillToName.SetEnable(false); 
    
    txtPLCode.SetEnable(false);
    txtPLName.SetEnable(false);
    //---------------------------------- 
               
    DataList();
    
    OnChangeTab();
    OnToggleGrid();
    //----------------------------------
    txtCancelChargerPK.text   = "<%=Session("EMPLOYEE_PK")%>";
	
    txtMasterPK.text = "<%=Request.querystring("po_pk")%>";
    
	p_type = "<%=Request.querystring("type")%>";  
	
	if ( p_type == 'APPROVE' )
	{ 
		btnCancel.style.display = "none";
        curr_row = callerWindowObj.grdConfirm.row;
        if(callerWindowObj.grdConfirm.rows-1 == 1)
        {   
            cNext.style.display = "none";
            cPrev.style.display = "none";
        }
	}
	else
	{		
        btnApprove.style.display = "none";
        curr_row = callerWindowObj.grdApprove.row;
        if(callerWindowObj.grdApprove.rows-1 == 1)
        {   
            cNext.style.display = "none";
            cPrev.style.display = "none";
        }
	}
	
    OnSearch('grdMaster');
    //----------------------------------    
}
//======================================================================

 function DataList()
 {      
     var data ;
     
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPO2003') FROM DUAL")%>|StandardPO|STANDARD P/O";  //report type
     lstReportType.SetDataText(data);
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
     
     data = "<%=CtlLib.SetListDataSQL("select pk,DEPT_ID || ' * '|| DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>||"; 
     lstDept.SetDataText(data);  
     lstDept.value = '' ;
     //-----------------------     
     
 }
 
//======================================================================
  
function OnSearch(pos)
{  
    switch (pos)
    {    
        case 'grdMaster':        
            data_epbp00031_1.Call("SELECT");
        break;
        
        case 'grdDetail':            
            data_epbp00031_2.Call("SELECT");
        break;
    }
}

//======================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "pro_epbp00031":
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();
        break;
        
 		case "pro_epbp00031_1":
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();
        break;	
				
        case "data_epbp00031_1":                    
            //---------------------------- 
            OnSearch('grdDetail');               
        break;
        
        case "data_epbp00031_2":
	       if ( grdDetail.rows > 1 )
	        {
	            grdDetail.SetCellBold( 1, G1_PO_ITEM_CD, grdDetail.rows - 1, G1_PO_ITEM_CD,  true);
	            
                grdDetail.SetCellBold( 1, G1_PO_QTY,  grdDetail.rows - 1, G1_PO_QTY,  true);
                grdDetail.SetCellBold( 1, G1_REQ_QTY, grdDetail.rows - 1, G1_REQ_QTY, true);
                
                grdDetail.SetCellBold( 1, G1_TOTAL_AMT, grdDetail.rows - 1, G1_TOTAL_AMT, true);               
                
                grdDetail.SetCellBgColor( 1, G1_REQ_ITEM_CD , grdDetail.rows - 1, G1_REQ_ITEM_NM , 0xCCFFFF );
                var qty = 0;
                for ( var i = 1 ; i < grdDetail.rows ; i++)
                {
                    qty += Number(grdDetail.GetGridData( i, G1_PO_QTY ))
                    if ( Number(grdDetail.GetGridData( i, G1_REQ_ITEM_PK)) > 0 && ( grdDetail.GetGridData( i, G1_REQ_ITEM_PK) != grdDetail.GetGridData( i, G1_PO_ITEM_PK) ) )
                    {
                        grdDetail.GetGridControl().Cell( 7, i, G1_PO_ITEM_CD, i, G1_PO_ITEM_NM ) = 0x3300cc;
                    }
                }        
	        }  
	        else
	        {
	            qty = 0;
	        } 
	        lblTotalQty.text = addCommas(qty);
	        lblRowCount.text = addCommas(grdDetail.rows - 1);
        break; 				            
    }
}
//====================================================================================
function addCommas(nStr)
{
	nStr += '';
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1))
	{
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
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
//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Approve' :
            if ( confirm('Do you want to Approve this P/O?'))
            {
                pro_epbp00031.Call();
            }    
        break;
		
		case 'Cancel' :
            if ( confirm('Do you want to Cancel this P/O?'))
            {
                pro_epbp00031_1.Call();
            }    
        break;
    }
}
//======================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";

		grdDetail.GetGridControl().ColHidden(G1_REQ_ITEM_CD) = true ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_ITEM_NM) = true ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_QTY)     = true ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_UOM)     = true ;
		grdDetail.GetGridControl().ColHidden(G1_ETD_TO)      = true ;
		grdDetail.GetGridControl().ColHidden(G1_ETA_TO)      = true ;
		
        imgMaster.src = "../../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";
        
		grdDetail.GetGridControl().ColHidden(G1_REQ_ITEM_CD) = false;
		grdDetail.GetGridControl().ColHidden(G1_REQ_ITEM_NM) = false ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_QTY)     = false ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_UOM)     = false ;
		grdDetail.GetGridControl().ColHidden(G1_ETD_TO)      = false ;
		grdDetail.GetGridControl().ColHidden(G1_ETA_TO)      = false ;				
		
        imgMaster.src = "../../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}
//===================================================================================

function OnCheckPrice()
{
    var path = System.RootURL + '/standard/formsep/bp/epbp00112.aspx'; 
	var object = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:50;dialogHeight:30');		 	
}

//===================================================================================
function OnPrev()
{
    if(!flag)
    { 
        flag = true;
    }
    if(curr_row > 1)
    {
        curr_row--;
        cNext.style.color = "#1b2ff2";
        if ( p_type == 'APPROVE' )
        {
            txtMasterPK.text = callerWindowObj.grdConfirm.GetGridData( curr_row, 1); 
        }
        else
        {
	        txtMasterPK.text = callerWindowObj.grdApprove.GetGridData( curr_row, 0); 
        }
        OnSearch('grdMaster');
    }
    else
    {
        cPrev.style.color = "#CCCCCC";
    }
}
//================================================================= 
function OnNext()
{
    if(!flag) flag = true;
    if(curr_row < (p_type == 'APPROVE' ? callerWindowObj.grdConfirm.rows - 1 : callerWindowObj.grdApprove.rows - 1))
    {
        curr_row++;
        cPrev.style.color = "#1b2ff2";
        if ( p_type == 'APPROVE' )
        {
            txtMasterPK.text = callerWindowObj.grdConfirm.GetGridData( curr_row, 1);
        }
        else
        {
	        txtMasterPK.text = callerWindowObj.grdApprove.GetGridData( curr_row, 0); 
        }
        OnSearch('grdMaster');
    }
    else
    {
        cNext.style.color = "#CCCCCC";
    }
}
</script>
<body>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00031_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" function="st_lg_sel_epbp00031_1">
                <input>                                                                                                                                                 
                    <inout bind="txtMasterPK" />
                    <inout bind="txtPONo" />
                    <inout bind="dtPODate" />
                    <tnout bind="lblStatus" />
                    <inout bind="txtStaffPK" />
                    <inout bind="txtStaffName" />  
                    <inout bind="txtRefTablePK" />
                    <inout bind="txtRefNo" />
                    <inout bind="lstReportType" /> 
                    <inout bind="txtRemark" /> 
                    <inout bind="txtSupplierPK" /> 
                    <inout bind="txtSupplierName" />
                    <inout bind="txtBillToPK" />
                    <inout bind="txtBillToName" />                  
                    <inout bind="lstCurrency" />                    
                    <inout bind="txtNULL01" />
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
                    <inout bind="lstDeliType" />
                    <inout bind="lstDept" />
                </input>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00031_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="4" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26" function="st_lg_sel_epbp00031_2"  > 
                <input bind="grdDetail">
                    <input bind="txtMasterPK" /> 
					<input bind="txtLang" />               
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_epbp00031" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00031" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_epbp00031_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00031_1" > 
                <input>
                    <input bind="txtMasterPK" /> 
					<input bind="txtCancelChargerPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
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
            <td style="width: 4%">
                <b id="cPrev" style="color: #1b2ff2; cursor: hand;" onclick="OnPrev()"><<</b>
            </td>
            <td style="width: 1%">
                <b id="cNext" style="color: #1b2ff2; cursor: hand;" onclick="OnNext()">>></b>
            </td>
            <td style="width: 1%">
                <gw:button id="btnApprove" img="Approve" text="Approve" onclick="OnProcess('Approve')" />
                <gw:button id="btnCancel" img="Cancel" text="Cancel" onclick="OnProcess('Cancel')" />
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
            <td style="width: 1%" valign="middle" align="left">
            </td>
            <td colspan="5">
                <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab()"> 
                                <span value="1" id="1">P/O Info</span> 
                                <span value="2" id="2">Delivery</span>
                                <span value="3" id="3">Payment</span>
                            </gw:radio>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td colspan="5" align="right" style="white-space: nowrap">
                <gw:list id="lstReportType" styles='width:100%;display:none' csstype="mandatory" />
            </td>
            <td style="width: 1%">
            </td>
        </tr>
        <tr style="height: 1%" id="info">
            <td colspan="14">
                <table style="height: 100%; width: 100%; background-color: #CCFFFF" border="0">
                    <tr style="height: 1%">
                        <td colspan="7">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                            Supplier
                                    </td>
                                    <td style="width: 45%">
                                        <gw:textbox id="txtSupplierName" styles="width:100%;" onenterkey="" />
                                        <gw:textbox id="txtSupplierPK" styles="display:none" />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Bill to
                                    </td>
                                    <td style="width: 45%">
                                        <gw:textbox id="txtBillToName" styles="width:100%;" />
                                        <gw:textbox id="txtBillToPK" styles="display:none" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Ref
                                No
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtRefNo" styles="width: 100%" />
                            <gw:textbox id="txtRefTablePK" styles="width: 100%;display: none" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Ex-Rate
                        </td>
                        <td style="width: 15%">
                            <gw:list id="lstCurrency" styles="width:100%;" />
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtExRate" type="number" format="#,###,###,###,###.##R" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            P/O Amt
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtPOAmount" type="number" format="#,###,###,###,###.###R" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Dept
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstDept" styles='width:100%;' />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Tax Rate
                        </td>
                        <td style="width: 30%" colspan="2">
                            <gw:textbox id="txtTaxRate" type="number" format="#,###,###,###,###.###R" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            VAT Amt
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtVATAmount" type="number" format="#,###,###,###,###.###R" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                        </td>
                        <td style="width: 25%" colspan="4">
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Total Amt
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtTotalAmount" type="number" format="#,###,###,###,###.###R" styles="width:100%;" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%" id="shipment">
            <td colspan="14">
                <table style="height: 100%; width: 100%; background-color: #CCFFFF" border="0">
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%">
                            Deliver
                        </td>
                        <td style="width: 65%" colspan="3">
                            <gw:textbox id="txtDeliverName" styles="width:100%;" onenterkey="" />
                            <gw:textbox id="txtDeliverPK" styles="display=none" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Sale Rep
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtSaleRep" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%">
                            Ship to
                        </td>
                        <td style="width: 65%" colspan="3">
                            <gw:textbox id="txtShipToName" styles="width:100%;" onenterkey="" />
                            <gw:textbox id="txtShipToPK" styles="display=none" />
                        </td>
                        <td align="right" style="width: 5%">
                            Buy Rep
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtBuyRep" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            ETD
                        </td>
                        <td style="width: 30%; white-space: nowrap">
                            <gw:datebox id="dtETDFrom" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                            ~
                            <gw:datebox id="dtETDTo" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                        </td>
                        <td style="width: 5%" align="right">
                            ETA
                        </td>
                        <td style="width: 30%; white-space: nowrap">
                            <gw:datebox id="dtETAFrom" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                            ~
                            <gw:datebox id="dtETATo" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Deli Type
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstDeliType" styles="width:100%;" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%" id="payment">
            <td colspan="14">
                <table style="height: 100%; width: 100%; background-color: #CCFFFF" border="0">
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            P/L
                        </td>
                        <td colspan="3" style="white-space: nowrap">
                            <gw:textbox id="txtPLPK" styles="display: none" />
                            <gw:textbox id="txtPLCode" styles="width: 30%" />
                            <gw:textbox id="txtPLName" styles="width: 70%" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap;">
                            Contract No
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtContractNo" styles="width: 100%" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            P/O Type
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstPOType" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Pay Term
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstPaymentTerm" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                        </td>
                        <td style="width: 25%">
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Price Type
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstPriceType" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Pay Method
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstPaymentMethod" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%">
                        </td>
                        <td style="width: 25%">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="14">
                <table style="height: 100%; width: 100%" border="0">
                    <tr>
                        <td style="width: 10%">
                            <img status="expand" id="imgMaster" alt="Show all column" src="../../../../system/images/close_popup.gif"
                                style="cursor: hand" onclick="OnToggleGrid()" />
                        </td>
                        <td style="width: 10%">
                        </td>
                        <td style="width: 5%">
                            Item:
                        </td>
                        <td style="width: 15%">
                            <gw:label id="lblRowCount" styles='width:100%;color:cc0000;font:9pt' text='' type="number"
                                format="###,###.##" />
                        </td>
                        <td style="width: 5%">
                            Qty:
                        </td>
                        <td style="width: 15%">
                            <gw:label id="lblTotalQty" styles='width:100%;color:cc0000;font:9pt' text='' type="number"
                                format="###,###.##" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 93%">
            <td colspan="12">
                <gw:grid id='grdDetail' header='_PK|Seq|Ref No|_Req_Item_PK|Req Item Code|Req Item Name|_PO_ITEM_PK|P/O Item Code|P/O Item Name|Req Qty|UOM|P/O Qty|UOM|U/Price|P/O Amt|VAT(%)|VAT Amt|Others Exp|Total Amt|ETD From|ETD To|ETA From|ETA To|_NULL_01|Dept|Remark|_PO_MR_D_PK|_PARENT_PK|_Null03|_PO_PO_M_PK'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|4|4|4|0|0|0|0|0|0|0' aligns='0|1|0|0|0|0|0|0|0|3|1|3|1|3|3|3|3|3|3|1|1|1|1|0|0|0|0|0|0|0'
                    check='|||||||||||||||||||||||||||||' editcol='0|0|1|0|0|0|0|0|0|1|0|1|0|1|1|1|1|1|1|1|1|1|1|0|0|1|0|0|0|0'
                    widths='0|800|1200|0|2000|2500|0|2000|2500|1500|1000|1500|1000|1500|1500|1000|1500|1500|1500|1200|1200|1200|1200|1200|1500|1000|0|0|0|0'
                    sorting='T' acceptnulldate='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <gw:textbox id="txtCancelChargerPK" styles="width: 100%;display: none" />
    <gw:textbox id="txtNULL01" styles='display:none;width:100%' />
    <gw:textbox id="txtLang" styles='display:none;width:100%' />
    <!--------------------------------------------------------------------------->
</body>
</html>
