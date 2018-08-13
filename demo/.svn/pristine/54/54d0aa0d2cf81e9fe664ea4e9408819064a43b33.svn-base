<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>PURCHASING REQUEST ENTRY</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
    
var G1_NULL_01   = 0,
    G1_PR_D_PK   = 1,
    G1_PR_M_PK   = 2,    
    G1_SEQ       = 3,
    G1_ITEM_PK   = 4,
    G1_ITEM_CODE = 5,
    G1_ITEM_NAME = 6,
    G1_REQ_QTY   = 7,
    G1_UOM       = 8,             
    G1_UPRICE    = 9,
    G1_ITEM_AMT  = 10,
	G1_TAX_RATE	 = 11,
	G1_TAX_AMT	 = 12,
	G1_TOTAL_AMT = 13,
    G1_STOCK_QTY = 14,
    G1_EXPECT_QTY= 15,
	G1_ETD_FROM  = 16,
    G1_ETD_TO    = 17,
    G1_TABLE_NAME= 18,
    G1_TABLE_PK  = 19,    
    G1_REMARK    = 20; 

//======================================================================
    var flag = false;var callerWindowObj;var curr_row ;var p_type;
function BodyInit()
{
    System.Translate(document);  // Translate to language session
    //---------------------------------- 
    callerWindowObj = dialogArguments;

    txtLang.text = "<%=Session("SESSION_LANG")%>";
	    
    txtPRNo.SetEnable(false);
    txtRequesterID.SetEnable(false);
    txtRequesterName.SetEnable(false);
 
    txtPLCode.SetEnable(false);
    txtPLName.SetEnable(false);
    //-------------------------

    BindingDataList();  
	
	OnChangeTab();   
    //---------------------------------- 
    txtMasterPK.text = "<%=Request.querystring("pr_pk")%>";
	
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
}
//============================================================================== 

 function BindingDataList()
 {      
     var data ;    
          
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPO1001') FROM DUAL")%>"; 
     lstDeliLoc.SetDataText(data);      	 
	 
	 data = "<%=CtlLib.SetListDataSQL("select pk,DEPT_ID || ' * '|| DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>"; 
     lstDept.SetDataText(data); 
     
     data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
     lstCCY.SetDataText(data);             
     
     var ctr = grdDetail.GetGridControl(); 
          
     ctr.ColFormat(G1_REQ_QTY)   = "#,###,###,###,###,###.##";
     ctr.ColFormat(G1_UPRICE)    = "#,###,###,###,###,###.##";    
     ctr.ColFormat(G1_ITEM_AMT)  = "#,###,###,###,###,###.##";
	 ctr.ColFormat(G1_TAX_RATE)  = "#,###,###,###,###,###";
	 ctr.ColFormat(G1_TAX_AMT)   = "#,###,###,###,###,###.##";
	 ctr.ColFormat(G1_TOTAL_AMT) = "#,###,###,###,###,###.##"; 
	 	      
	 ctr.ColFormat(G1_STOCK_QTY)  = "#,###,###,###,###,###.##";
	 ctr.ColFormat(G1_EXPECT_QTY) = "#,###,###,###,###,###.##";       
 }
 
 //===================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdMaster':        
            data_epbp00151_1.Call("SELECT");
        break;
        
        case 'grdDetail':            
            data_epbp00151_2.Call("SELECT");
        break;
    
    }
}

//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
       case "data_epbp00151_1": 
            //---------------------------- 
            OnSearch('grdDetail');               
        break;
        
        case "data_epbp00151_2":
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G1_ITEM_CODE, grdDetail.rows - 1, G1_ITEM_CODE, true);  
				              
				grdDetail.SetCellBgColor( 1, G1_ITEM_CODE , grdDetail.rows - 1, G1_ITEM_NAME  , 0xCCFFFF );
				grdDetail.SetCellBgColor( 1, G1_STOCK_QTY , grdDetail.rows - 1, G1_EXPECT_QTY , 0xCCFFFF );
            }  
            //--------------------------------
        break;   
                   
        case "pro_epbp00151":
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();
        break;    
		
		case "pro_epbp00151_1":
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();
        break;         
    }
}

//=================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Approve' :
            if ( confirm('Do you want to approve this P/R?'))
            {
                pro_epbp00151.Call();
            }    
        break;
		
		case 'Cancel' :
            if ( confirm('Do you want to Cancel this P/R?'))
            {
                pro_epbp00151_1.Call();
            }    
        break;        
    }
}
//====================================================================
function OnChangeTab()
{ 
    var tab_pr_info   = document.all("tab_pr_info"); 
    var tab_pr_amount = document.all("tab_pr_amount"); 
    
    switch (radTab.value)
    {
        case '1':
            tab_pr_info.style.display   = "";
            tab_pr_amount.style.display = "none";         
        break;
        
        case '2' :
            tab_pr_info.style.display   = "none";
            tab_pr_amount.style.display = "";
        break;               
    }
}  
//================================================================= 
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
    <!---------------------------------------------------------------->
    <gw:data id="pro_epbp00151" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00151" > 
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
    <gw:data id="pro_epbp00151_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00151_1" > 
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
    <gw:data id="data_epbp00151_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22" function="st_lg_sel_epbp00151_1"  >
                <input>
                    <inout bind="txtMasterPK" />
                    <inout bind="txtPRNo" />
                    <inout bind="dtReqDate" />
                    <inout bind="lbStatus" />                    
                    <inout bind="txtRequesterPK" />
                    
                    <inout bind="txtRequesterID" />
                    <inout bind="txtRequesterName" />   
                    <inout bind="txtArrSOpk" />     
                    <inout bind="txtPORef" />                                
                    
                    <inout bind="txtItemAmt" />            
                                                            
                    <inout bind="txtPLPK" />
                    <inout bind="txtPLCode" />
                    <inout bind="txtPLName" /> 
                    <inout bind="txtLinePK" /> 
                    <inout bind="txtLineNm" />  
                                                         
                    <inout bind="lstDeliLoc" />   
                    <inout bind="lstCCY" /> 
					<inout bind="lstDept" />
                    <inout bind="txtDescription" />  
                       
					<inout bind="dtETDFrom" />
					<inout bind="dtETDTo" />
					
					<inout bind="txtExRate" />
					<inout bind="txtTaxAmt" />
					<inout bind="txtTotalAmt" />  
					
					<inout bind="txtSupplierPK" />
					<inout bind="txtSupplierName" />                                                                                                                  
                </input>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00151_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="4" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="st_lg_sel_epbp00151_2" > 
                <input bind="grdDetail">
                    <input bind="txtMasterPK" />  
					<input bind="txtLang" />            
                </input> 
                <output bind="grdDetail" />  
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <td id="right" style="width: 100%">
        <table style="width: 100%; height: 100%">
            <tr style="height: 1%">
                <td align="right" style="width: 10%; white-space: nowrap">
                    P/R No
                </td>
                <td style="width: 35%">
                    <gw:textbox id="txtPRNo" styles="width: 100%" csstype="mandatory" />
                </td>
                <td align="right" style="width: 10%; white-space: nowrap">
                    Req Date
                </td>
                <td style="width: 10%">
                    <gw:datebox id="dtReqDate" lang="<%=Application("Lang")%>" mode="01" />
                </td>
                <td align="center" style="width: 25%">
                    <gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt' />
                </td>
                <td>
                    <b id="cPrev" style="color: #1b2ff2; cursor: hand;" onclick="OnPrev()"><<</b>
                </td>
                <td>
                    <b id="cNext" style="color: #1b2ff2; cursor: hand;" onclick="OnNext()">>></b>
                </td>
                <td style="width: 1%" align="center" colspan="6">
                    <gw:button id="btnApprove" img="Approve" text="Approve" onclick="OnProcess('Approve')" />
                    <gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
                </td>
            </tr>
            <tr style="height: 1%">
                <td align="right" style="width: 10%">
                    Requester
                </td>
                <td style="width: 35%; white-space: nowrap">
                    <gw:textbox id="txtRequesterPK" styles="display:none" />
                    <gw:textbox id="txtRequesterID" styles="width:30%;display:none" />
                    <gw:textbox id="txtRequesterName" styles="width:100%" />
                </td>
                <td align="right" style="width: 10%">
                    Remark
                </td>
                <td style="width: 25%" colspan="11">
                    <gw:textbox id="txtDescription" styles="width:100%" />
                </td>
            </tr>
            <tr style="height: 1%">
                <td colspan="12">
                    <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab()"> 
                                <span value="1" id="1">P/R Info</span> 
                                <span value="2" id="2">Amount/Budget</span>                            
                            </gw:radio>
                </td>
            </tr>
            <tr style="height: 1%">
                <td colspan="13">
                    <table style="height: 100%; width: 100%; background-color: #CCFFFF" id="tab_pr_info">
                        <tr style="height: 30%">
                            <td align="right" style="width: 5%; white-space: nowrap">
                                Dept
                            </td>
                            <td style="width: 45%; white-space: nowrap">
                                <gw:list id="lstDept" styles="width:100%" />
                            </td>
                            <td align="right" style="width: 5%; white-space: nowrap">
                                Deli Loc >
                            </td>
                            <td style="width: 45%; white-space: nowrap">
                                <gw:list id="lstDeliLoc" styles="width:100%" />
                            </td>
                        </tr>
                        <tr style="height: 30%">
                            <td align="right" style="width: 5%; white-space: nowrap">
                                ETD
                            </td>
                            <td align="left" style="width: 45%">
                                <gw:datebox id="dtETDFrom" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                                ~
                                <gw:datebox id="dtETDTo" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                            </td>
                            <td align="right" style="width: 5%">
                                P/L
                            </td>
                            <td align="right" style="width: 45%; white-space: nowrap">
                                <gw:textbox id="txtPLPK" styles="display: none" />
                                <gw:textbox id="txtPLCode" styles="width: 30%" />
                                <gw:textbox id="txtPLName" styles="width: 70%" />
                            </td>
                        </tr>
                    </table>
                    <table style="height: 100%; width: 100%" id="tab_pr_amount">
                        <tr>
                            <td align="right" style="width: 10%">
                                Ex-Rate
                            </td>
                            <td style="width: 20%">
                                <gw:list id="lstCCY" styles='width:100%;' />
                            </td>
                            <td align="right" style="width: 20%">
                                <gw:textbox id="txtExRate" styles="width: 100% " type="number" format="###,###,###.###" />
                            </td>
                            <td align="right" style="width: 10%">
                                Supplier
                            </td>
                            <td style="width: 40%">
                                <gw:textbox id="txtSupplierName" styles="width:100%;" onenterkey="" />
                                <gw:textbox id="txtSupplierPK" styles="display:none" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 10%; white-space: nowrap">
                                Item Amount
                            </td>
                            <td align="right" style="width: 40%" colspan="2">
                                <gw:textbox id="txtItemAmt" styles="width: 100% " type="number" format="###,###,###.###" />
                            </td>
                            <td style="width: 50%" colspan="2">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 10%; white-space: nowrap">
                                Tax Amount
                            </td>
                            <td align="right" style="width: 40%" colspan="2">
                                <gw:textbox id="txtTaxAmt" styles="width: 100% " type="number" format="###,###,###.###" />
                            </td>
                            <td style="width: 50%" colspan="2">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 10%; white-space: nowrap">
                                Total Amount
                            </td>
                            <td align="right" style="width: 40%" colspan="2">
                                <gw:textbox id="txtTotalAmt" styles="width: 100% " type="number" format="###,###,###.###" />
                            </td>
                            <td style="width: 50%" colspan="2">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 96%">
                <td colspan="14">
                    <gw:grid id='grdDetail' header='_Null|_PK|_PO_PR_M_PK|Seq|_TCO_ITEM_PK|Item Code|Item Name|Req Qty|UOM|U/Price|Item Amt|Tax(%)|Tax Amt|Total Amt|Stock Qty|Expect Qty|ETD From|ETD To|_REF_TABLE_NAME|_REF_TABLE_PK|Remark'
                        format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|4|0|0|0' aligns='0|0|0|1|0|0|0|3|1|3|3|3|3|3|3|3|1|1|0|0|0'
                        check='||||||||||||||||||||' editcol='0|0|0|1|0|0|0|1|0|1|1|1|1|1|0|0|1|1|0|0|0'
                        widths='0|0|0|800|0|1500|3000|1200|800|1200|1200|1000|1200|1200|1200|1200|1200|1200|0|0|0'
                        styles='width:100%; height:100%' sorting='T' acceptnulldate="T" />
                </td>
            </tr>
        </table>
        <!--------------------------------------------------------------------------->
        <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
        <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
        <!--------------------------------------------------------------------------->
        <gw:textbox id="txtArrSOpk" styles="width: 100%;display: none" />
        <gw:textbox id="txtPORef" styles="width: 100%;display: none" />
        <gw:textbox id="txtLinePK" styles='display:none;width:100%' />
        <gw:textbox id="txtLineNm" styles='display:none;width:100%' />
        <gw:textbox id="txtLang" styles='display:none;width:100%' />
</body>
</html>
