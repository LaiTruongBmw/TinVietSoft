<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP GET P/O MASTER</title>
</head>
<%  ESysLib.SetUser("PROD")%>

<script>

var flag;
//======================================================================
var G_PK         = 0 ;
                 
var G1_Null_01   = 0,
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
    G1_PO_Qty_2  = 11,
    G1_UOM_2     = 12,
    G1_UPrice    = 13,
    G1_PO_Amt    = 14,
    G1_VAT_Rate  = 15,
    G1_VAT_Amount = 16,
    G1_Total_Amt = 17,
    G1_ETD_From  = 18,
    G1_ETD_To    = 19,
    G1_ETA_From  = 20,
    G1_ETA_To    = 21,
    G1_Ref_No    = 22,
    G1_Null_02     = 23,
    G1_Remark    = 24,
    G1_PR_D_PK   = 25,
    G1_PARENT_PK = 26,
    G1_Null_03   = 27,   
    G1_PO_M_PK   = 28; 
    
//======================================================================

function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if(imgArrow.status == "expand"){
    left.style.display="none";
    imgArrow.status = "collapse";
    right.style.width="100%";
    imgArrow.src = "../../../system/images/button/next.gif";
    }
    else{
    left.style.display="";
    imgArrow.status = "expand";
    right.style.width="75%";
    imgArrow.src = "../../../system/images/button/previous.gif";
    }
}

//======================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
    //---------------------------------- 

    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;      
    //----------------------------------            
    
    txtPONo.SetEnable(false);
    txtStaffName.SetEnable(false);
    txtDeliverName.SetEnable(false);
    txtShipToName.SetEnable(false);
    txtSupplierName.SetEnable(false);
    txtDeliverName.SetEnable(false);
    txtBillToName.SetEnable(false); 
    txtCenterCode.SetEnable(false);
    txtCenterName.SetEnable(false);
    txtPLCode.SetEnable(false);
    txtPLName.SetEnable(false);
    //---------------------------------- 
               
    FormFormat();
    
    OnChangeTab();
    OnToggleGrid();
    //------------------------- 
}
//======================================================================

 function FormFormat()
 {      
     var data ;

     //----------------------- 
     data = "<%=ESysLib.SetListDataFUNC("SELECT COMM.f_logistic_code('LGPO2002') FROM DUAL")%>||";  //carrier
     lstDeliType.SetDataText(data);
     //----------------------- 
     data = "<%=ESysLib.SetListDataFUNC("SELECT COMM.f_logistic_code('LGPO2001') FROM DUAL")%>||";  //po type
     lstPOType.SetDataText(data);
     //----------------------- 
     data = "<%=ESysLib.SetListDataFUNC("SELECT COMM.f_logistic_code('LGCM0110') FROM DUAL")%>||";  //payment form
     lstPaymentMethod.SetDataText(data);
     //----------------------- 
     data = "<%=ESysLib.SetListDataFUNC("SELECT COMM.f_logistic_code('LGCM0120') FROM DUAL")%>||";  //payment term
     lstPaymentTerm.SetDataText(data);
     //----------------------- 
     data = "<%=ESysLib.SetListDataFUNC("SELECT COMM.f_logistic_code('LGCM0100') FROM DUAL" )%>";    
     lstCurrency.SetDataText(data);  
     //----------------------- 
     data = "<%=ESysLib.SetListDataFUNC("SELECT COMM.f_logistic_code('LGCM0130') FROM DUAL" )%>||";    
     lstPriceType.SetDataText(data);
     
     //-----------------------
     data ="data|1|P/O Qty 1|2|P/O Qty 2"
     lstPriceBy.SetDataText(data);  
     lstPriceBy.value = 1; 
     
     //-----------------------
     var ctr = grdDetail.GetGridControl(); 
    
     ctr.ColFormat(G1_PO_Qty_1)  = "#,###,###,###,###,###.###";
     ctr.ColFormat(G1_PO_Qty_2)  = "#,###,###,###,###,###.###";
     
     ctr.ColFormat(G1_UPrice)     = "#,###,###,###,###,###.###";
     ctr.ColFormat(G1_PO_Amt)     = "#,###,###,###,###,###.###";     
     ctr.ColFormat(G1_VAT_Rate)   = "#,###,###,###,###,###.###";
     ctr.ColFormat(G1_Total_Amt)  = "#,###,###,###,###,###.###";  
     ctr.ColFormat(G1_VAT_Amount) = "#,###,###,###,###,###.###";
     
 }
//======================================================================
function OnSearch(pos)
{  
    switch (pos)
    {
        case 'grdSearch':
            data_bisl00042.Call("SELECT");
        break;
    
        case 'grdMaster':
            if ( grdSearch.row > 0 )
            {
                txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
            }
            else
            {
                txtMasterPK.text = '' ;
            }
            
            flag = 'view' ;
            data_bisl00042_1.Call("SELECT");                              
        break;
        
        case 'grdDetail':            
            data_bisl00042_2.Call("SELECT");
        break;
    }
}

//======================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_bisl00042_1": 
                //---------------------------- 
                OnSearch('grdDetail');              
        break;
        
        case "data_bisl00042_2":
	        if ( grdDetail.rows > 1 )
	        {
	            grdDetail.SetCellBold( 1, G1_PO_Item_Code, grdDetail.rows - 1, G1_PO_Item_Code,  true);
	            
                grdDetail.SetCellBold( 1, G1_PO_Qty_1, grdDetail.rows - 1, G1_PO_Qty_1, true);
                grdDetail.SetCellBold( 1, G1_PO_Qty_2, grdDetail.rows - 1, G1_PO_Qty_2, true);
                grdDetail.SetCellBold( 1, G1_UPrice,    grdDetail.rows - 1, G1_UPrice,    true);                
                grdDetail.SetCellBold( 1, G1_Total_Amt, grdDetail.rows - 1, G1_Total_Amt, true); 
                
                grdDetail.SetCellBgColor( 1, G1_Req_Item_Code , grdDetail.rows - 1, G1_Req_Item_name , 0xCCFFFF );
                
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
                 
         case 'data_bisl00042' :
            data_bisl00042_1.Call("SELECT");
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
		
        imgMaster.src = "../../../system/images/iconmaximize.gif";
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
		
        imgMaster.src = "../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}

 //===================================================================================
function OnSelect(pos)
{
    var arr_data = new Array();
    
    switch (pos)
    {
        case 'Partial' :
                            
            
            // the last row is sub total --> no need to select 
            for(var i = 1; i < grdDetail.rows; i++ )
            {
                if ( grdDetail.GetGridControl().isSelected(i) == true )
                {
                     var arrTemp = new Array();
                         
                     for( var j = 0; j < grdDetail.cols; j++ )
                     {
                          arrTemp[arrTemp.length]= grdDetail.GetGridData(i,j);
                     }
                         
                     arr_data[arr_data.length]= arrTemp;
                }
            }
        break;
        
        case 'ALL' :
            var arr_data = new Array();
            // the last row is sub total --> no need to select 
            for(var i = 1; i < grdDetail.rows; i++ )
            {
                 var arrTemp = new Array();
                     
                 for( var j = 0; j < grdDetail.cols; j++ ) 
                 {
                      arrTemp[arrTemp.length]= grdDetail.GetGridData(i,j);
                 }
                     
                 arr_data[arr_data.length]= arrTemp;
            }            
        break;        
    }
    
    if ( arr_data != null )
    {
        var callerWindowObj = dialogArguments;    
          
        callerWindowObj.txtRefNo.text = txtPONo.text; 
        
        callerWindowObj.txtSupplierPK.text   = txtSupplierPK.text ; 
        callerWindowObj.txtSupplierName.text = txtSupplierName.text ;
        
        callerWindowObj.lstCurrency.value = lstCurrency.value ;
        
        callerWindowObj.txtPLPK.text   = txtPLCenterPK.text ;
        callerWindowObj.txtPLName.text = txtCenterName.text + ' - ' + txtCenterName.text;
    }
              
    window.returnValue =  arr_data;
    window.close();
            
}


 //===================================================================================

</script>

<body>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_bisl00042" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso id="1" type="grid" user="prod" function="inv.sp_sel_bisl00042" >
                <input  bind="grdSearch">
                    <input bind="txtPONoSearch" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_bisl00042_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40" function="inv.sp_sel_bisl00042_1" >
                <input>                         
                    <inout bind="txtMasterPK" />
                    <inout bind="txtPONo" />
                    <inout bind="dtPODate" />
                    <tnout bind="lblStatus" />
                    <inout bind="txtStaffPK" />
                    <inout bind="txtStaffName" />  
                    <inout bind="txtRefTablePK" />
                    <inout bind="txtRefNo" />
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
                    <inout bind="txtPLCenterPK" />
                    <inout bind="txtCenterPK" />
                    <inout bind="txtCenterCode" />
                    <inout bind="txtCenterName" />                    
                    <inout bind="txtPLPK" />
                    <inout bind="txtPLCode" />
                    <inout bind="txtPLName" />                                                                                                      
                    <inout bind="txtContractNo" />                                                                             
                    <inout bind="lstPaymentMethod" />
                    <inout bind="lstPaymentTerm" />
                    <inout bind="lstPriceType" />  
                    <inout bind="txtExRate" />
                    <inout bind="lstPOType" />
                </input>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_bisl00042_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="4" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28" function="inv.sp_sel_bisl00042_2"  > 
                <input bind="grdDetail">
                    <input bind="txtMasterPK" />               
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 25%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td style="width: 10%" align="right">
                            Date
                        </td>
                        <td style="width: 89%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~
                            <gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 2%" align="right">
                        <td style="width: 10%; white-space: nowrap">
                            P/O No.
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtPONoSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|P/O Date|P/O No|Ref No" format="0|4|0|0" aligns="1|1|0|0"
                                defaults="|||" editcol="0|0|0|0" widths="0|1200|1500|0" styles="width:100%; height:100%"
                                sorting="T" oncellclick="OnSearch('grdMaster')" param="0,1,2,3" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 75%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 5%">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            P/O No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtPONo" styles="width: 100%" csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            P/O Date
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtPODate" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 30%" align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%" colspan="2">
                            Charger
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtStaffName" styles="width:100%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                        <td align="right" style="width: 10%">
                            Remark
                        </td>
                        <td style="width: 25%" colspan="3">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 1%" valign="middle" align="left">
                        </td>
                        <td colspan="5" align="center">
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
                                                    <gw:textbox id="txtBillToPK" styles="display=none" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Ref No
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtRefNo" styles="width: 100%" />
                                        <gw:textbox id="txtRefTablePK" styles="width: 100%;display: none" />
                                    </td>
                                    <td align="right" style="width: 5%">
                                        Price by
                                    </td>
                                    <td style="width: 30%">
                                        <gw:list id="lstPriceBy" styles='width:100%;' csstype="mandatory" />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Currency
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstCurrency" styles="width:100%;" onchange="getExRate();" />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        P/O Amt
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtPOAmount" type="number" format="#,###,###,###,###.###R" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        VAT Amt
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtVATAmount" type="number" format="#,###,###,###,###.###R" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Total Amt
                                    </td>
                                    <td style="width: 25%">
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
                        <td colspan="12">
                            <table style="height: 100%; width: 100%; background-color: #CCFFFF" border="0">
                                <tr style="height: 1%">
                                    <td colspan="6">
                                        <table style="height: 100%; width: 100%">
                                            <tr style="height: 1%">
                                                <td align="right" style="width: 5%; white-space: nowrap">
                                                    Center
                                                </td>
                                                <td style="width: 45%; white-space: nowrap" colspan="3">
                                                    <gw:textbox id="txtPLCenterPK" styles="display: none" />
                                                    <gw:textbox id="txtCenterPK" styles="display: none" />
                                                    <gw:textbox id="txtCenterCode" styles="width: 30%" />
                                                    <gw:textbox id="txtCenterName" styles="width: 70%" />
                                                </td>
                                                <td align="right" style="width: 5%; white-space: nowrap">
                                                    P/L
                                                </td>
                                                <td style="width: 45%; white-space: nowrap">
                                                    <gw:textbox id="txtPLPK" styles="display: none" />
                                                    <gw:textbox id="txtPLCode" styles="width: 30%" />
                                                    <gw:textbox id="txtPLName" styles="width: 70%" />
                                                </td>
                                            </tr>
                                        </table>
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
                                        Pay Method
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstPaymentMethod" styles="width:100%;" />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Price Type
                                    </td>
                                    <td style="width: 30%">
                                        <gw:list id="lstPriceType" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 5%">
                                        Ex-Rate
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtExRate" type="number" format="#,###,###,###,###.##R" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 5%">
                                        Contract No
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtContractNo" styles="width: 100%" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="12">
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td style="width: 1%">
                                        <img status="expand" id="imgMaster" alt="Show all column" src="../../../system/images/close_popup.gif"
                                            style="cursor: hand" onclick="OnToggleGrid()" />
                                    </td>
                                    <td style="width: 97%; white-space: nowrap" align="left">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:icon id="btnSelect" img="2" text="Select" onclick="OnSelect('Partial')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:icon id="btnSelectALL" img="2" text="Select ALL" onclick="OnSelect('ALL')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 54%">
                        <td colspan="12">
                            <gw:grid id='grdDetail' header='_Null01|_PK|Seq|_Req_Item_PK|Req Item Code|Req Item Name|_PO_ITEM_PK|P/O Item Code|P/O Item Name|P/O Qty 1|UOM|P/O Qty 2|UOM|U/Price|P/O Amount|VAT(%)|VAT Amount|Total Amount|ETD From|ETD To|ETA From|ETA To|Ref No|_Null02|Remark|_PO_MR_D_PK|_PARENT_PK|_Null03|_PO_PO_M_PK'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|4|4|4|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0|0|3|1|3|1|3|3|3|3|3|1|1|1|1|0|0|0|0|0|0|0'
                                check='||||||||||||||||||||||||||||' editcol='0|0|1|0|0|0|0|0|0|1|0|1|0|1|1|1|0|1|1|1|1|1|0|0|1|0|0|0|0'
                                widths='1000|0|1000|0|2000|2500|0|2000|2500|1500|1000|1500|1000|1500|1500|1500|1500|1500|1200|1200|1200|1200|1200|1500|1000|0|0|0|0'
                                sorting='T' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)"
                                acceptnulldate='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                    <tr style="height: 40%">
                        <td colspan="12">
                            <gw:grid id='grdLotNo' header='_Null01|_PK|Seq|_Req_Item_PK|Req Item Code|Req Item Name|_PO_ITEM_PK|P/O Item Code|P/O Item Name|P/O Qty 1|UOM|P/O Qty 2|UOM|U/Price|P/O Amount|VAT(%)|VAT Amount|Total Amount|ETD From|ETD To|ETA From|ETA To|Ref No|_Null02|Remark|_PO_MR_D_PK|_PARENT_PK|_Null03|_PO_PO_M_PK'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|4|4|4|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0|0|3|1|3|1|3|3|3|3|3|1|1|1|1|0|0|0|0|0|0|0'
                                check='||||||||||||||||||||||||||||' editcol='0|0|1|0|0|0|0|0|0|1|0|1|0|1|1|1|0|1|1|1|1|1|0|0|1|0|0|0|0'
                                widths='1000|0|1000|0|2000|2500|0|2000|2500|1500|1000|1500|1000|1500|1500|1500|1500|1500|1200|1200|1200|1200|1200|1500|1000|0|0|0|0'
                                sorting='T' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)"
                                acceptnulldate='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
    <!------------------------------------------->
</body>
</html>
