<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Goods Delivery Request Entry</title>
</head>

<script>

    var  user_pk   = "<%=Session("EMPLOYEE_PK")%>";
    var  user_name = "<%=Session("USER_NAME")%>"  ;
//-----------------------------------------------------
var flag = '' ;

//-----------------------------------------------------
var G1_GD_PK    = 0,
    G1_Slip_No  = 1,
    G1_Date     = 2,
    G1_PO_No    = 3;

var G2_PK               = 0,
    G2_GD_OUTGO_M_PK    = 1,
    G2_SEQ              = 2,
    G2_REF_NO           = 3,
    G2_REQ_ITEM_PK      = 4,
    G2_REQ_ITEM_CODE    = 5,
    G2_REQ_ITEM_NAME    = 6,
    G2_OUT_ITEM_PK      = 7,
    G2_OUT_ITEM_CODE    = 8,
    G2_OUT_ITEM_NAME    = 9,
    G2_REQ_UOM          = 10,
    G2_REQ_QTY          = 11,
    G2_OUT_UOM          = 12,
    G2_OUT_QTY          = 13,
    G2_UNIT_PRICE       = 14,
    G2_AMOUNT           = 15,
    G2_DESCRIPTION      = 16,
    G2_LOT_NO           = 17;
//==========================================================================

function BodyInit()
{
    System.Translate(document); 
    txtPONo.SetEnable(false);
    txtSlipNo.SetEnable(false);
    txtExRate.SetEnable(false);
    txtAmount.SetEnable(false);
    txtDescription.SetEnable(false);
    txtChargerNm.SetEnable(false);
    txtCustCode.SetEnable(false);
    txtCustName.SetEnable(false);
    
    //----------------------        
    FormatGrid();
    OnToggleGrid();
    //---------------------- 
    txtMasterPK.text = "<%=Request.querystring("outgo_pk")%>";
    data_dscd00112_1.Call('SELECT');
    //----------------------     
}

//==========================================================================
 function FormatGrid()
 {
        var data="";  
           
        data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_name  FROM inv.tin_warehouse  WHERE del_if = 0 ORDER BY wh_name  ASC" )%>";    
        lstOutWH.SetDataText(data); 
                     
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('ACAB0110','','') FROM DUAL" )%>";    
        lstCurrency.SetDataText(data);
        lstCurrency.value = "USD";
                           
        data = "<%=CtlLib.SetListDataSQL("SELECT TRANS_CODE,TRANS_CODE || ' - ' || trans_name  FROM inv.tin_trans_code  WHERE del_if = 0 and type = 'I' ORDER BY trans_code" )%>||";    
        lstTransType.SetDataText(data);                     
        lstTransType.value = '' ;
                                 
        var ctrl ;
        ctrl = grdDetail.GetGridControl();	
        
        ctrl.ColFormat(G2_REQ_QTY) = "###,###,###,###,###.##";
        ctrl.ColFormat(G2_OUT_QTY) = "###,###,###,###,###.##";
        ctrl.ColFormat(G2_UNIT_PRICE) = "###,###,###,###,###.##";
        ctrl.ColFormat(G2_AMOUNT)     = "###,###,###,###,###.##";
  }
//==========================================================================

function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdDetail' :        
            data_dscd00112_2.Call("SELECT")            
        break;
                
        case 'Master' :
            if ( grdSearch.row > 0 )
            {
                txtMasterPK.text = grdSearch.GetGridData( event.row, G1_GD_PK);                
            }
            else
            {
                txtMasterPK.text = '' ;
            }
            
            data_dscd00112_1.Call("SELECT");
        break;
    }
}
//==========================================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_dscd00112_1" :
            if ( flag == 'save')
            {
                for(var i=1; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G2_GD_OUTGO_M_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G2_GD_OUTGO_M_PK, txtMasterPK.text);
                    }    
                }                
                OnSave('Detail');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetail');   
            }               
        break;
               
        case "data_dscd00112_2":
	        if ( grdDetail.rows > 1 )
	        {
	            grdDetail.SetCellBold( 1, G2_OUT_ITEM_CODE,  grdDetail.rows - 1, G2_OUT_ITEM_CODE,  true);
	            grdDetail.SetCellBold( 1, G2_REF_NO,  grdDetail.rows - 1, G2_REF_NO,  true);
                grdDetail.SetCellBold( 1, G2_OUT_QTY, grdDetail.rows - 1, G2_OUT_QTY, true);
                grdDetail.SetCellBold( 1, G2_UNIT_PRICE, grdDetail.rows - 1, G2_UNIT_PRICE, true);
                grdDetail.SetCellBold( 1, G2_AMOUNT, grdDetail.rows - 1, G2_AMOUNT, true);
                
                grdDetail.SetCellBgColor( 1, G2_REQ_ITEM_CODE , grdDetail.rows - 1, G2_REQ_ITEM_NAME , 0xCCFFFF );
                
                for ( var i = 1 ; i < grdDetail.rows ; i++)
                {
                    if ( Number(grdDetail.GetGridData( i, G2_REQ_ITEM_PK)) > 0 && ( grdDetail.GetGridData( i, G2_REQ_ITEM_PK) != grdDetail.GetGridData( i, G2_OUT_ITEM_PK) ) )
                    {
                        grdDetail.GetGridControl().Cell( 7, i, G2_OUT_ITEM_CODE, i, G2_OUT_ITEM_NAME ) = 0x3300cc;
                    }
                }        
	        }
        break;
        
        case 'pro_dscd00112':
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();            
        break;
    }
}
//==========================================================================
 
function OnAddNew(obj)
{
      switch (obj)         
      {	  
            case 'grdDetail' :
                var path = System.RootURL + '/standard/forms/ds/cd/dscd00031.aspx';
	            var object = System.OpenModal( path ,1100 , 700 ,  'resizable:yes;status:yes', this);
                var seq = 0;
                if ( object != null )
                {
	                //-----------------                  
                    for ( var i=0; i< object.length; i++)
                    {
                        data = object[i];                       
                        seq = grdDetail.rows;
                        if(seq == 0)         
                        {
                            seq = 1;
                        }
                        grdDetail.AddRow();                     
                        grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ,  seq);
                        seq++;
                        grdDetail.SetGridText( grdDetail.rows-1, G2_OUT_ITEM_PK,  data[2] );
                        grdDetail.SetGridText( grdDetail.rows-1, G2_OUT_ITEM_CODE, data[3] );
                        grdDetail.SetGridText( grdDetail.rows-1, G2_OUT_ITEM_NAME, data[4] );
                        grdDetail.SetGridText( grdDetail.rows-1, G2_OUT_QTY,       data[7]);
                        grdDetail.SetGridText( grdDetail.rows-1, G2_OUT_UOM,       data[5] );
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G2_LOT_NO,       data[6]);
                      
                    } 
                    TotalAmount();
                }                  
            break;
     }         
}
//==========================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";

		grdDetail.GetGridControl().ColHidden(G2_REQ_ITEM_CODE) = true ;
		grdDetail.GetGridControl().ColHidden(G2_REQ_ITEM_NAME) = true ;
		grdDetail.GetGridControl().ColHidden(G2_REQ_QTY) = true ;
		grdDetail.GetGridControl().ColHidden(G2_REQ_UOM) = true ;
		grdDetail.GetGridControl().ColHidden(G2_REF_NO) = true ;
		
        imgMaster.src = "../../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";
        
		grdDetail.GetGridControl().ColHidden(G2_REQ_ITEM_CODE) = false ;
		grdDetail.GetGridControl().ColHidden(G2_REQ_ITEM_NAME) = false ;
		grdDetail.GetGridControl().ColHidden(G2_REQ_QTY) = false ;
		grdDetail.GetGridControl().ColHidden(G2_REQ_UOM) = false ;
		grdDetail.GetGridControl().ColHidden(G2_REF_NO) = false ;			
		

        imgMaster.src = "../../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}
//==========================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Cancel' :
            if ( confirm('Do you want to Cancel this Slip?'))
            {
                pro_dscd00112.Call();
            }    
        break;
            }
}
</script>

<body>
    <!---------------------------------------------------------------------------->
    <gw:data id="data_dscd00112_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="control" function="st_lg_sel_dscd00112_1" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15"> 
                <inout > 
                     <inout bind="txtMasterPK" /> 
                     <inout bind="txtSlipNo" /> 
                     <inout bind="dtDate" />
                     <inout bind="txtChargerPK"/>
                     <inout bind="txtChargerNm"/>
                     <inout bind="lblStatus" /> 
                     <inout bind="txtPONo"/>
                     <inout bind="lstOutWH"/>
                     <inout bind="txtCustPK"/>
                     <inout bind="txtCustCode"/>
                     <inout bind="txtCustName"/>
                     <inout bind="lstTransType"/>
                     <inout bind="txtAmount"/>
                     <inout bind="lstCurrency"/>
                     <inout bind="txtExRate"/>
                     <inout bind="txtDescription"/>
                </inout> 
             </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
    <gw:data id="data_dscd00112_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_dscd00112_2" parameter ="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" procedure="st_lg_upd_dscd00112_2"> 
                <input bind="grdDetail" > 
                     <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
    <gw:data id="pro_dscd00112" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00110_4" > 
                <input>
                    <input bind="txtMasterPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="right" style="width: 75%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            <b>Slip No</b>
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%" />
                        </td>
                        <td style="width: 10%" align="right">
                            <b>Doc Date</b>
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtDate" lang="1" />
                        </td>
                        <td style="width: 15%">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt' text='status' />
                        </td>
                        <td style="width: 5%" colspan="5">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnApprove" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Out W/H
                        </td>
                        <td align="left" style="width: 30%">
                            <gw:list id="lstOutWH" styles='width:100%' />
                        </td>
                        <td style="width: 10%" align="right">
                            Cust
                        </td>
                        <td style="width: 20%" colspan="8">
                            <gw:textbox id="txtCustPK" styles='display:none' />
                            <gw:textbox id="txtCustCode" styles='width:30%' />
                            <gw:textbox id="txtCustName" styles='width:69%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            P/O No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtArraySOPK" styles='width:100%; display:none' />
                            <gw:textbox id="txtPONo" styles='width:100%' />
                        </td>
                        <td style="width: 10%" align="right">
                            Currency</td>
                        <td style="width: 15%" colspan="3">
                            <gw:list id="lstCurrency" styles='width:100%' />
                        </td>
                        <td style="width: 5%" align="right">
                            Ex.Rate</td>
                        <td style="width: 10%" colspan="5">
                            <gw:textbox id="txtExRate" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Charger
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtChargerPK" styles='width:100%;display:none' />
                            <gw:textbox id="txtChargerNm" styles='width:100%' />
                        </td>
                        <td style="width: 10%" align="right">
                            Trans.Code</td>
                        <td style="width: 15%" colspan="3">
                            <gw:list id="lstTransType" styles='width:100%' />
                        </td>
                        <td style="width: 5%" align="right">
                            Amount</td>
                        <td style="width: 20%" colspan="5">
                            <gw:textbox id="txtAmount" csstype="mandatory" styles='width:100%' type="number"
                                format="#,###.###" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%">
                            <b>Description</b>
                        </td>
                        <td align="left" style="width: 30%" colspan="10">
                            <gw:textbox id="txtDescription" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="11">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 1%">
                                    <td style="width: 1%; white-space: nowrap" align="left">
                                        <img status="expand" id="imgMaster" alt="Show all column" src="../../../../system/images/close_popup.gif"
                                            style="cursor: hand" onclick="OnToggleGrid()" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                    </td>
                                    <td style="width: 10%" align="right">
                                    </td>
                                    <td style="width: 20%">
                                    </td>
                                    <td style="width: 20%">
                                    </td>
                                    <td style="width: 5%">
                                    </td>
                                    <td style="width: 1%" align="left">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 95%">
                        <td colspan="11">
                            <gw:grid id='grdDetail' header='_pk|_gd_outgo_m_pk|Seq|Ref No|_req_item_pk|Req Item Code|Req Item Name|_out_item_pk|Out Item Code|Out Item Name|Req Uom|Req Qty|Out Uom|Out Qty|Unit Price|Amount|Description|Lot No'
                                format='0|0|0|0|0|0|0|0|0|0|0|1|0|1|1|1|0|0' aligns='0|0|1|0|0|0|0|0|0|0|1|0|1|0|0|0|0|0'
                                check='|||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|0|500|1000|0|1000|1000|0|1500|2500|1000|1000|1000|1000|1200|2000|1500|1000'
                                sorting='T' styles='width:100%; height:100%'/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <!-------------------------------------------------------------->
</body>
</html>
