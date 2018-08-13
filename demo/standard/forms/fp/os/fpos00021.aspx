<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>PURCHASING REQUEST</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
    
var G_PK                = 0,
    G_PP_ORDPLAN_PK     = 1,
    G_PROD_DATE         = 2,
    G_COMPONENT_PK      = 3,
    G_COMPONENT_ID      = 4,
    G_COMPONENT_NM      = 5,
    G_PROD_QTY          = 6,
    G_UNIT_PRICE        = 7,
    G_MASTER_PK         = 8,
    G_PARTNER_PK        = 9,
    G_PARTNER_ID        = 10,
    G_PARTNER_NM        = 11,
    G_BAL_AMT           = 12;

    
    var callerWindowObj = dialogArguments;
//======================================================================

function BodyInit()
{
    //System.Translate(document);  // Translate to language session
    //---------------------------------- 
        
    //txtPRNo.SetEnable(false);
    //txtRequesterID.SetEnable(false);
    //txtRequesterName.SetEnable(false);
    //txtPONo.SetEnable(false);
    //txtCenterCode.SetEnable(false);
    //txtCenterName.SetEnable(false);    
    //txtPLCode.SetEnable(false);
    //txtPLName.SetEnable(false);
    //txtLineName.SetEnable(false);
    //-------------------------
    System.Translate(document); 
    data_fppr00211.StatusInsert();
    BindingDataList();   
     
    //---------------------------------- 
    txtRequeterPK.text = "<%=Session("EMPLOYEE_PK")%>";
    txtRequeterCD.text = "<%=Session("EMP_ID")%>"
    txtRequeterNM.text = "<%=Session("USER_NAME")%>";
    
    txtChargerPK.text = "<%=Session("EMPLOYEE_PK")%>";
    txtChargerCD.text = "<%=Session("EMP_ID")%>";
    txtChargerNM.text = "<%=Session("USER_NAME")%>";
    
    BindGrid();
    Calculate();
    
    //OnSearch('grdMaster');               
}
//============================================================================== 

 function BindingDataList()
 {      
     var data ;    
          
     data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0110') FROM DUAL")%>"; 
     lstPayMethod.SetDataText(data);          
     
     
     data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
     lstCCY.SetDataText(data);
     lstCCY.value = "USD";        
      
 }
 //===================================================================================
 function BindGrid()
 {
    for (var i=1;i < callerWindowObj.grdMaster.rows;i++)
    {
        if(callerWindowObj.grdMaster.GetGridData(i,callerWindowObj.G_CHK)=="-1")
        {
            grdPurchase.AddRow();
            grdPurchase.SetGridText(grdPurchase.rows-1,G_PP_ORDPLAN_PK,callerWindowObj.grdMaster.GetGridData(i,callerWindowObj.G_PP_ORDPLAN_PK));
            grdPurchase.SetGridText(grdPurchase.rows-1,G_PROD_DATE,callerWindowObj.grdMaster.GetGridData(i,callerWindowObj.G_PROD_DATE));
            grdPurchase.SetGridText(grdPurchase.rows-1,G_COMPONENT_PK,callerWindowObj.grdMaster.GetGridData(i,callerWindowObj.G_PT_COMPONENT_PK));
            grdPurchase.SetGridText(grdPurchase.rows-1,G_COMPONENT_ID,callerWindowObj.grdMaster.GetGridData(i,callerWindowObj.G_COMPONENT_ID));
            grdPurchase.SetGridText(grdPurchase.rows-1,G_COMPONENT_NM,callerWindowObj.grdMaster.GetGridData(i,callerWindowObj.G_COMPONENT_NM));
            grdPurchase.SetGridText(grdPurchase.rows-1,G_PROD_QTY,callerWindowObj.grdMaster.GetGridData(i,callerWindowObj.G_PEOD_QTY));
            grdPurchase.SetGridText(grdPurchase.rows-1,G_UNIT_PRICE,callerWindowObj.grdMaster.GetGridData(i,callerWindowObj.G_UNIT_PRICE));
            grdPurchase.SetGridText(grdPurchase.rows-1,G_PARTNER_PK,callerWindowObj.grdMaster.GetGridData(i,callerWindowObj.G_TCO_BUSPARTNER_PK));
            grdPurchase.SetGridText(grdPurchase.rows-1,G_PARTNER_ID,callerWindowObj.grdMaster.GetGridData(i,callerWindowObj.G_PARTNER_ID));
            grdPurchase.SetGridText(grdPurchase.rows-1,G_PARTNER_NM,callerWindowObj.grdMaster.GetGridData(i,callerWindowObj.G_PARTNER_NM));
            grdPurchase.SetGridText(grdPurchase.rows-1,G_BAL_AMT,callerWindowObj.grdMaster.GetGridData(i,callerWindowObj.G_BAL_AMOUNT));
        }
    }
    txtPartnerPK.text=grdPurchase.GetGridData(1,G_PARTNER_PK);
    txtPartnerCD.text=grdPurchase.GetGridData(1,G_PARTNER_ID);
    txtPartnerNM.text=grdPurchase.GetGridData(1,G_PARTNER_NM);
 }
 //===================================================================================
 function Calculate()
 {
    var total_amt = 0;
    for (i=1;i<grdPurchase.rows;i++)
    {
        total_amt =Number(total_amt) + Number(grdPurchase.GetGridData(i,G_BAL_AMT));
    }
    txtVATAmount.text=Number(total_amt)*0.1
    txtAmount.text=Number(total_amt) + (Number(total_amt)*0.1);
 }
 //===================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdMaster':        
            data_epbp00152_1.Call("SELECT");
        break;
        
        case 'grdDetail':            
            data_epbp00152_2.Call("SELECT");
        break;
    
    }
}

//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case'data_fppr00211':
            for(i=1;i<grdPurchase.rows;i++)
            {
               grdPurchase.SetGridText(i,G_MASTER_PK,txtMasterPK.text) ;
            }
            data_fppr00211_1.Call();
        break; 
        case 'data_fppr00211_1':
            this.close();
        break;
    }
}

//=================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Save' :
            if ( confirm('Do you want to Save this P/R?'))
            {
                data_fppr00211.Call();
            }    
        break;        
    }
}
//=================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Partner':
            var fpath = System.RootURL + "/form/fp/ab/fpab00120.aspx";
            var object = System.OpenModal( fpath , 750 , 500 , 'resizable:yes;status:yes'); 
            if (object != null)
            {                  
                txtPartnerPK.text = object[0];
                txtPartnerCD.text = object[1];
                txtPartnerNM.text = object[2];
            }
        break;
        case 'Requester':
            var fpath = System.RootURL + "/form/ch/ae/chae00010_search_emp.aspx";
            var object = System.OpenModal( fpath , 750 , 500 , 'resizable:yes;status:yes'); 
            if (object != null)
            {                  
                txtRequeterPK.text = object[0];
                txtRequeterCD.text = object[1];
                txtRequeterNM.text = object[2];
            }
        break;
        
        case 'Charger':
            var fpath = System.RootURL + "/form/ch/ae/chae00010_search_emp.aspx";
            var object = System.OpenModal( fpath , 750 , 500 , 'resizable:yes;status:yes'); 
            if (object != null)
            {                  
                txtChargerPK.text = object[0];
                txtChargerCD.text = object[1];
                txtChargerNM.text = object[2];
            }
        break;
    }
}
//================================================================= 
</script>

<body>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_fppr00211" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="<%=l_user%>lg_sel_fppr00211" procedure="<%=l_user%>lg_upd_fppr00211">
                <inout>
                    <inout bind="txtMasterPK" />
                    <inout bind="txtPRNo" />
                    <inout bind="dtReqDate" />
                    <inout bind="txtPartnerPK" />                    
                    <inout bind="txtPartnerCD" />
                    <inout bind="txtPartnerNM" />
                    <inout bind="lstPayMethod" />
                    
                    <inout bind="txtRequeterPK" />                    
                    <inout bind="txtRequeterCD" />                                         
                    <inout bind="txtRequeterNM" />
                    
                    <inout bind="txtChargerPK" /> 
                    <inout bind="txtChargerCD" />
                    <inout bind="txtChargerNM" />
                    
                    <inout bind="txtPartnerDesc" />
                    <inout bind="txtPayDesc" />      
                                                       
                    <inout bind="txtAmount" />
                    <inout bind="txtVATAmount" />
                    <inout bind="lstCCY" />                                                                                                      
                    <inout bind="txtExRate" />                                                                                                  
                </inout>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_fppr00211_1" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="4" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8" function="<%=l_user%>lg_sel_fppr00211_1" procedure="<%=l_user%>lg_upd_fppr00211_1"> 
                <input bind="grdPurchase">
                    <input bind="txtMasterPK" />               
                </input> 
                <output bind="grdPurchase" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <td id="right" style="width: 100%">
        <table style="width: 100%; height: 100%">
            <tr style="height: 1%">
                <td align="right" style="width: 13%; white-space: nowrap">
                    Slip No
                </td>
                <td style="width: 35%">
                    <gw:textbox id="txtPRNo" styles="width: 100%" csstype="mandatory" readonly="true" />
                </td>
                <td align="right" style="width: 10%; white-space: nowrap">
                    Req Date
                </td>
                <td style="width: 10%">
                    <gw:datebox id="dtReqDate" lang="<%=Application("Lang")%>" mode="01" />
                </td>
                <td align="right" style="width: 25%">
                    <gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt' />
                </td>
                <td style="width: 5%">
                </td>
                <td style="width: 1%">
                </td>
                <td style="width: 1%">
                </td>
                <td style="width: 1%" align="right">
                </td>
                <td style="width: 1%">
                    <gw:icon id="btnSave" img="2" text="Save" onclick="OnProcess('Save')" />
                </td>
                <td style="width: 1%">
                    <gw:icon id="btnCancel" img="2" text="Cancel" onclick="OnProcess('Cancel')" />
                </td>
            </tr>
            <tr style="height: 1%">
                <td colspan="12">
                    <table style="height: 100%; width: 100%; background-color: #CCFFFF">
                        <tr style="height: 30%">
                            <td align="right" style="width: 10%; white-space: nowrap">
                                <a title="Partner" onclick="OnPopUp('Partner')" href="#tips" style="color: #0000ff">
                                    Partner</a>
                            </td>
                            <td style="width: 40%; white-space: nowrap">
                                <gw:textbox id="txtPartnerPK" styles="display: none" />
                                <gw:textbox id="txtPartnerCD" styles="width: 30%" readonly="true" />
                                <gw:textbox id="txtPartnerNM" styles="width: 70%" readonly="true" />
                            </td>
                            <td align="right" style="width: 10%; white-space: nowrap">
                                Pay Method
                            </td>
                            <td style="width: 40%; white-space: nowrap">
                                <gw:list id="lstPayMethod" styles="width: 100%" />
                            </td>
                        </tr>
                        <tr style="height: 30%">
                            <td align="right" style="width: 10%; white-space: nowrap">
                                <a title="Requester" onclick="OnPopUp('Requester')" href="#tips" style="color: #0000ff">
                                    Requester</a>
                            </td>
                            <td align="right" style="width: 40%; white-space: nowrap">
                                <gw:textbox id="txtRequeterPK" styles="display:none" />
                                <gw:textbox id="txtRequeterCD" styles="width:30%" readonly="true" />
                                <gw:textbox id="txtRequeterNM" styles="width:70%" readonly="true" />
                            </td>
                            <td align="right" style="width: 10%">
                                <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color: #0000ff">
                                    Charger</a>
                            </td>
                            <td align="right" style="width: 40%; white-space: nowrap">
                                <gw:textbox id="txtChargerPK" styles="display:none" />
                                <gw:textbox id="txtChargerCD" styles="width:30%" readonly="true" />
                                <gw:textbox id="txtChargerNM" styles="width:70%" readonly="true" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 10%; white-space: nowrap">
                                Partner Desc
                            </td>
                            <td style="width: 40%; white-space: nowrap" colspan="3">
                                <gw:textbox id="txtPartnerDesc" styles="width:100%" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 10%; white-space: nowrap">
                                Payment Desc
                            </td>
                            <td style="width: 40%; white-space: nowrap" colspan="3">
                                <gw:textbox id="txtPayDesc" styles="width:100%" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 1%">
                <td colspan="12">
                    <table style="height: 100%; width: 100%">
                        <tr style="height: 1%">
                            <td align="right" style="width: 10%">
                                Total Amount
                            </td>
                            <td align="right" style="width: 15%">
                                <gw:textbox id="txtAmount" styles='width:100%;color:Red' type="number" format="###,###,###.###"
                                    readonly="true" />
                            </td>
                            <td align="right" style="width: 10%">
                                VAT Amount
                            </td>
                            <td style="width: 15%">
                                <gw:textbox id="txtVATAmount" styles="width: 100%;color:Red" type="number" format="###,###,###.###"
                                    readonly="true" />
                            </td>
                            <td align="right" style="width: 10%">
                                CCY
                            </td>
                            <td align="right" style="width: 15%">
                                <gw:list id="lstCCY" styles='width:100%;' />
                            </td>
                            <td align="right" style="width: 10%">
                                EX-Rate
                            </td>
                            <td align="right" style="width: 15%">
                                <gw:textbox id="txtExRate" styles="width: 100%" type="number" format="###,###,###.###" />
                            </td>
                            <td align="right" style="width: 25%">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 96%">
                <td colspan="12">
                    <gw:grid id='grdPurchase' header='_PK|_PP_ORDPLAN_PK|Prod Date|_PT_COMPONENT_PK|Component ID|Component NM|Prod Qty|Unit Price|_PC_PAYMENT_REQ_M_PK|_Partner_pk|_partner_id|_partner_nm|_bal_amount'
                        format='0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1'
                        widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T'
                        styles='width:100%; height:100%' />
                </td>
            </tr>
        </table>
        <!--------------------------------------------------------------------------->
        <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
        <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
        <!--------------------------------------------------------------------------->
</body>
</html>
