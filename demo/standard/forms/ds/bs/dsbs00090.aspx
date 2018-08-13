<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>SO Approve</title>
</head>

<script>

var  reponse_row ;
 
var  user_pk   = "<%=Session("EMPLOYEE_PK")%>";
var  user_name = "<%=Session("USER_NAME")%>"  ;
//idGrid1

var G_NO                = 0 ,
    G_PK                = 1 ,
    G_ORDER_TYPE        = 2 ,   
    G_ORDER_DT          = 3 ,
    G_ORD_PRIORITY      = 4 ,
    G_PO_NO             = 5 ,
    G_BILL_TO           = 6 ,    
    G_SO_ITEM_NO        = 7 ,
    G_ITEM_ETD          = 8 ,
    G_TCO_ITEM_PK       = 9 ,
    G_ITEM_CODE         = 10 ,
    G_ITEM_NAME         = 11 ,
    G_ORD_QTY           = 12 ,
    G_ITEM_UNIT         = 13 ,
    G_LOT_QTY           = 14 ,
    G_LOT_UOM           = 15 ,
    G_WEIGHT_QTY        = 16 ,   
    G_WEIGHT_UOM        = 17 ,
    G_MASTER_REMARK     = 18 ,
    G_ORD_ITEM_STATUS   = 19 ,
    G_APPROVE_DATE      = 20 ,
    G_RESPONSE          = 21 ,
    G_DETAIL_REMARK     = 22 ,
    G_ST_BOM_PK         = 23 ,
    G_tsa_sale_order_pk = 24 ;
    
 //---------------------------------------------------------
 function BodyInit()
 {
    System.Translate(document); 
        //-----------------
        txtTotalOrdQty.SetEnable(false);
        txtTotalWeightQty.SetEnable(false);
        //-----------------
        idGrid.GetGridControl().FrozenCols = 7;
        //-----------------        
        txt_user_pk.text = user_pk;
        //-----------------
        dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-30));
        //-----------------
        BindingDataList();
        FormatGrid();
        OnChangePage();
        //-----------------        
 } 

 //---------------------------------------------------------
 function BindingDataList()
 {         
    var data="";
        
    data = "DATA|O|Order Date|E|Item ETD|A|Approve Date";
    idList.SetDataText(data);
    //--------------------------------------------------
    
    data = "<%=CtlLib.SetListDataSQL("SELECT a.CODE, a.CODE || ' ' || a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0080' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.CODE not in ('10') ORDER BY a.CODE , a.CODE_NM " )%>";    
    lstStatus.SetDataText(data);    
    //--------------------------------------------------       
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0080' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM" ) %> ";       
    idGrid.SetComboFormat(G_ORD_ITEM_STATUS,data);
    //--------------------------------------------------
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0110' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM" ) %> ";       
    idGrid.SetComboFormat(G_ORD_PRIORITY,data);
    //--------------------------------------------------    
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0050' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM" ) %> ";       
    idGrid.SetComboFormat(G_ORDER_TYPE,data);
    //--------------------------------------------------    
 } 
 
 //---------------------------------------------------------------
function FormatGrid()
{
    var ctrl ;
    
    ctrl = idGrid.GetGridControl();
    
    ctrl.ColFormat(G_ORD_QTY)    = "###,###,###.##" ;
    ctrl.ColFormat(G_LOT_QTY)    = "###,###,###.##" ;
    ctrl.ColFormat(G_WEIGHT_QTY) = "###,###,###.##" ;    
}  
//------------------------------------------------------------------------------------------------

function OnChangePage()
{
	var strRad = radSearchPage.GetData();
	
	switch (strRad)
	{
		case '1':
            //----------------------------------------------------------
			idGrid.GetGridControl().ColHidden(G_PO_NO)          = true ;
			idGrid.GetGridControl().ColHidden(G_BILL_TO)        = true ;
			idGrid.GetGridControl().ColHidden(G_LOT_QTY)        = true ;
			idGrid.GetGridControl().ColHidden(G_LOT_UOM)        = true ;
			idGrid.GetGridControl().ColHidden(G_MASTER_REMARK)  = true ;
			idGrid.GetGridControl().ColHidden(G_DETAIL_REMARK)  = true ;				
	    break;			
	    
		case '2':
            //----------------------------------------------------------
			idGrid.GetGridControl().ColHidden(G_PO_NO)          = false ;
			idGrid.GetGridControl().ColHidden(G_BILL_TO)        = false ;
			idGrid.GetGridControl().ColHidden(G_LOT_QTY)        = false ;
			idGrid.GetGridControl().ColHidden(G_LOT_UOM)        = false ;
			idGrid.GetGridControl().ColHidden(G_MASTER_REMARK)  = false ;
			idGrid.GetGridControl().ColHidden(G_DETAIL_REMARK)  = false ;
		break;
	}
} 
 //-----------------------------------------------------
    function OnChangeStatus()
       {
         switch(lstStatus.value)
         {
            case '20':
                idBtnApprove.SetEnable(true)
                idBtnReject.SetEnable(true)
                idBtnCancelApprove.SetEnable(true)
            break;
            case '30':
                idBtnApprove.SetEnable(true)
                idBtnReject.SetEnable(false)
                idBtnCancelApprove.SetEnable(false)
            break;
            case '40':
                idBtnApprove.SetEnable(false)
                idBtnReject.SetEnable(false)
                idBtnCancelApprove.SetEnable(true)
            break;
            case '50':
                idBtnApprove.SetEnable(false)
                idBtnReject.SetEnable(false)
                idBtnCancelApprove.SetEnable(true)
            break;
            case '60':
                 idBtnApprove.SetEnable(false)
                idBtnReject.SetEnable(false)
                idBtnCancelApprove.SetEnable(false)
            break;
         }
         OnSearch(1)
       } 
 //---------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 1 :
                dsbs00090.Call("SELECT");
            break;     
      }  
 }
 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {
            case "dsbs00090" :
                for(var i =1; i<idGrid.rows; i++)
                {
                    if ( idGrid.GetGridData( i, G_ST_BOM_PK) == "")
                    {
                         idGrid.GetGridControl().Cell( 6 , i , 0 , i, idGrid.cols - 1 ) = 0xCCFFFF;
                    }     
                }
                OnTotal();
                
                reponse_row = 0 ;
            break;      
            
      }  
 }
 
//------------------------------------------------------------------------------------------------
function OnSave()
{
     dsbs00090.Call();
}
 
//---------------------------------------------------------
 
 function OnExcel(pos)
 {
      switch (pos)         
      {		        
            case 'Approve' :

                var url =System.RootURL + '/standard/reports/ds/bs/dsbs00090.xls?dtApproveDate=' + dtApproveDate.value ;
                
		        System.OpenTargetPage(url);                 

            break;
      }  
 }

//---------------------------------------------------------
 
 function OnProcess(pos)
 {
      switch (pos)         
      {		        
            case 'Approve' :
                for ( i = 1 ; i < idGrid.rows ; i++ )
                {
                    if ( idGrid.GetGridControl().isSelected(i) == true )
                    {

                        idGrid.SetGridText( i,  G_ORD_ITEM_STATUS, '40') ;
                        idGrid.SetRowStatus(i,16)

                    } 
                }             
            break;
            case 'Reject' :
                for ( i = 1 ; i < idGrid.rows ; i++ )
                {
                    if ( idGrid.GetGridControl().isSelected(i) == true )
                    {

                        idGrid.SetGridText( i,  G_ORD_ITEM_STATUS, '50') ;
                        idGrid.SetRowStatus(i,16)
                    } 
                }             
            break;
            case 'Cancel' :
                for ( i = 1 ; i < idGrid.rows ; i++ )
                {
                    if ( idGrid.GetGridControl().isSelected(i) == true )
                    {

                        idGrid.SetGridText( i,  G_ORD_ITEM_STATUS, '30') ;
                        idGrid.SetRowStatus(i,16)
                    } 
                }             
            break;
            
            case 'BOM' :
                 var path = System.RootURL + '/standard/forms/fp/hb/fphb00030.aspx';
	             var object = System.OpenModal( path ,1000 , 600 ,  'resizable:yes;status:yes');
            break;
            
            case 'MR' :            
                 //---------------------------------
                 if ( idGrid.row > 0 )
                 {
                     var path = System.RootURL + '/standard/forms/fp/bp/fpbp00131.aspx?sod_pk='+ idGrid.GetGridData( idGrid.row, G_PK) +'&so_item_no='+ idGrid.GetGridData( idGrid.row, G_SO_ITEM_NO );
                     var obj = System.OpenModal( path ,950 ,600 , 'resizable:yes;status:yes');
                 }    
                 else
                 {
                    alert('PLS SELECT ONE SALE ORDER !!!');
                 }    
                 //---------------------------------                  
            break;                
      }  
 }
 
//---------------------------------------------------------------
function OnTotal()
{
    if ( idGrid.GetGridControl().Rows < 2 )
    {
        lblOrdQtyUOM.text    = '';
        lblWeightQtyUOM.text = '';
        
        txtTotalOrdQty.SetDataText('');
        txtTotalWeightQty.SetDataText('');
        
        return;
    }
    else
    {
        lblOrdQtyUOM.text    = idGrid.GetGridData( 1, G_ITEM_UNIT  );
        lblWeightQtyUOM.text = idGrid.GetGridData( 1, G_WEIGHT_UOM );
    }
    
    var i, ltotal1 = 0, ltotal2 = 0;
    
    for( i = 1; i < idGrid.GetGridControl().Rows ; i++)
    {
        ltotal1 += parseFloat(idGrid.GetGridData(i, G_ORD_QTY    ));
        ltotal2 += parseFloat(idGrid.GetGridData(i, G_WEIGHT_QTY ));
    }
    
    txtTotalOrdQty.SetDataText('' + ltotal1);
    txtTotalWeightQty.SetDataText('' + ltotal2);
}

 //-------------------------------------------------------------------
 function OnBFEdit()
 {
    col = event.col ;
    
    if ( col == G_ORDER_TYPE || col == G_ORD_PRIORITY || col == G_ORD_ITEM_STATUS )
    {
        idGrid.GetGridControl().Col = G_NO;
    }    
 }
//===================================================================================

function TextOnBlur()
{
    if ( reponse_row > 0 )
    {
        idGrid.SetGridText( reponse_row, G_RESPONSE, txtRespone.GetData()+"" ) ;
    }
}
//===================================================================================

//===================================================================================

function OnClick()
{
    txtSaleOrderPK.text=idGrid.GetGridData(idGrid.row,G_PK);
    txtOrderQty.text=idGrid.GetGridData(idGrid.row,G_ORD_QTY);
    txtSaleOrderPk.text=idGrid.GetGridData(idGrid.row,G_tsa_sale_order_pk);
    
}
//==================================================================================
function OnPrint()
{
    if(txtSaleOrderPk.text!="")
    { 
        var url =System.RootURL + "/standard/reports/ds/bs/rpt_dsbs00090.aspx?Sale_order_pk=" +txtSaleOrderPk.text;
	    System.OpenTargetPage(url); 
	}
	else
	{
	    alert("Please select Order to report");
	}
}
//===================================================================================
function OnPopUp()
{
    if(txtSaleOrderPK.text!="")
    { 
        var url = System.RootURL + "/standard/forms/ds/bs/dsbs00091.aspx?saleorderpk="+ txtSaleOrderPK.text+"&order_qty="+txtOrderQty.text ;
	    var object = System.OpenModal( url ,600 , 400,  'resizable:yes;status:yes', this); 
	}
	else
	{
	    alert("Please select Order to report");
	}
     
}
//===================================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00090" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"  parameter="1,19,22" function="sale.sp_sel_dsbs00090" procedure="sale.sp_upd_dsbs00090" > 
                <input> 
                    <input bind="idList" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="lstStatus" /> 
                    <input bind="txtOrderNo" />
                    <input bind="txtItem" />
                </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 15%">
                            <gw:list id="idList" styles="color:blue;width:100%" value="O" onchange="OnSearch(1)" />
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 5%" align="right">
                            Status
                        </td>
                        <td style="width: 15%" align="right">
                            <gw:list id="lstStatus" styles="color:red;width:100%" value="O" onchange="OnChangeStatus()" />
                        </td>
                        <td style="width: 5%" align="right">
                            SO No
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtOrderNo" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 15%" align="right">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 3%" align="right">
                        </td>
                        <td style="width: 1%" align="center">
                            <gw:button id="ibtnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch(1)" />
                        </td>
                        <td style="width: 1%" align="center">
                            <gw:button id="ibtnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 20%; white-space: nowrap" align="left">
                            Pages
                            <gw:radio id="radSearchPage" value="1" styles="width:100%" onchange="OnChangePage()">                      
			                    <span value="1">1</span>                       
			                    <span value="2">2</span>    			                                
        			        </gw:radio>
                        </td>
                        <td style="width: 75%" align="center">
                        </td>
                        <%--<td style="width: 1%" align="left">
                            <gw:button img="excel" alt="Print report" id="btnPrint" onclick="OnPrint()" />
                        </td>--%>
                        <td style="width: 1%" align="left">
                            <gw:button id="idBtnGenerate" img="in" text="Prod Card" onclick="OnPopUp()" />
                        </td>
                        
                        <td style="width: 1%" align="left">
                            <gw:button id="idBtnApprove" img="in" text="Approve" onclick="OnProcess('Approve')" />
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:button id="idBtnReject" img="in" text="Reject" onclick="OnProcess('Reject')" />
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:button id="idBtnCancelApprove" img="in" text="Cancel Approve"
                                onclick="OnProcess('Cancel')" />
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:imgbtn id="ibtnRegisterBOM" img="registration" alt="Register BOM" onclick="OnProcess('BOM')" />
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:imgbtn id="ibtnMR" img="registration" alt="Generate Consumption" onclick="OnProcess('MR')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id='top' style="height: 80%">
            <td>
                <!--<gw:grid id="idGrid" header="No|_b.pk|Issuer|Ord Date|ETD|Ord Type|SO No|Deli To|Item Name|Pattern|Color|ST Unit|Ord Qty|Ord Qty(M)|Deli Loc|Note|Group Name|ST Item Code|Unit Price|Brand|Details PO No|Model|Stage|Order Type|Usage|Swatch|Bill To|Takeout Req date|Master PO No|Currency|Amount|Reserved Qty|Take Out from Stock|FX-Rate|VAT Y/N|VAT Rate|Approve date|Ord Status"
                    format="0|0|0|4|4|0|0|0|0|0|0|0|1|1|0|0|0|0|1|0|0|0|0|0|0|0|0|4|0|0|1|1|1|1|3|1|0|0"
                    acceptnulldate="true" aligns="0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|1|0|0|0|0|0|0|1|0"
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|1500|1500|1200|1200|1500|1500|1500|2500|0|3000|1000|1500|1500|2000|2000|3000|1500|1500|2000|1500|1500|1500|1000|1500|800|1000|1500|1500|1000|1500|1500|1000|1000|800|1000|1200|1000"
                    styles="width:100%; height:100%" sorting="T" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37" />
                    -->
                <gw:grid id='idGrid' header='NO|_PK|Ord Type|Ord DT|Priority|PO No|Bill To|SO Item|Item ETD|_TCO_ITEM_PK|Item Code|Item Name|Ord Qty|UOM|Lot Qty|Lot UOM|Weight|WT UOM|Ord Remark|Item Status|Approve DT|Response|Remark|_stbom_pk|_tsa_sale_order_pk'
                    format='0|0|0|4|0|0|0|0|4|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0|0' aligns='1|0|0|1|0|0|0|0|1|0|0|0|3|1|3|1|3|1|0|0|1|0|0|0|0'
                    defaults='||||||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='800|1000|1200|1200|1200|1200|1500|1500|1200|1000|1200|1500|1200|1000|1000|1000|1000|1000|1200|1200|1200|1200|1000|0|1000'
                    sorting='T' styles='width:100%; height:100%' onbeforeedit="<%--OnBFEdit()" onclick="reponse_row=idGrid.row;txtRespone.SetDataText(idGrid.GetGridData(idGrid.row,G_RESPONSE)),--%>OnClick()" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 20%" align="left">
                            Response
                        </td>
                        <td align="right" style="width: 40%">
                        </td>
                        <td style="width: 40%; white-space: nowrap" align="right">
                            Total :
                            <gw:textbox id="txtTotalOrdQty" styles="width:25%" type="number" format="#,###,###,###,###.##R" />
                            (<gw:label id="lblOrdQtyUOM" styles='width:1%' text='' />) /
                            <gw:textbox id="txtTotalWeightQty" styles="width:25%" type="number" format="#,###,###,###,###.##R" />
                            (<gw:label id="lblWeightQtyUOM" styles='width:1%' text='' />)
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 17%">
            <td>
                <gw:textarea id="txtRespone" styles="width:100%;height:95%" onblur="TextOnBlur()" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------------->
    <gw:textbox id="txtMaster_PK" style="display: none" />
    <gw:textbox id="txtOrderQty" style="display: none" />
    <gw:textbox id="txtSaleOrderPk" style="display: none" />
    <gw:textbox id="txtSaleOrderPK" style="display: none" />
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txt_user_pk" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------------->
</body>
</html>
