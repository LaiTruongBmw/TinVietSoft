<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Order Checking</title>
</head>

<script>
 
    var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>" ;
    
    var iM_Ord_Amt        = 23 ;
        iM_Total_Amt      = 24 ;
    
    var iD_Unit_Price     = 6 ,
        iD_Ord_Qty        = 7 ,
        iD_VAT_Rate       = 8 ,
        iD_Amount         = 9 ,
        iD_Reserved_Qty   = 14 ,
        iD_TakeOut_Req    = 15 ,
        iD_TakeOut_Plan   = 16 ,
        iD_PP_Plan        = 17 ,   
        iD_BC_Qty         = 18 ,
        iD_Prod_Qty       = 19 ,
        iD_Sum_TO_Qty     = 20 ;
        iD_TakeOut_Qty    = 26 ;
        iD_Balance        = 31 ;
        
    var G3_unit_price   = 14,   
        G3_ord_qty      = 15,
        G3_vat_rate     = 16,   
        G3_amount       = 17,  
        G3_prod_qty     = 18,   
        G3_take_out_qty = 19,   
        G3_balance      = 20;    
    
 //---------------------------------------------------------
 function OnToggle()
 {
    var top  = document.all("top");    
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        top.style.display="none";       
        imgArrow.status = "collapse";
        imgArrow.src = "../../../../system/images/down.gif";
    }
    else
    {
        top.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../../system/images/up.gif";
    }
 }
 
 //---------------------------------------------------------
 function BodyInit()
 {
    System.Translate(document); 
      grdMaster.GetGridControl().FrozenCols = 7;
      
      grdDetail.GetGridControl().FrozenCols = 6;
      
      txt_user_pk.text = user_pk;
       
      dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-7));
    
      BindingDataList();
      MergeColumn();
      FormatGrid();
 } 

//-------------------------------------------------------------------------------------------
 function MergeColumn()
{

      grdMaster.GetGridControl().MergeCells  = 2 ;	
      grdMaster.GetGridControl().MergeCol(0) = true ;	
      grdMaster.GetGridControl().MergeCol(1) = true ;   	
      grdMaster.GetGridControl().MergeCol(2) = true ;	
      grdMaster.GetGridControl().MergeCol(3) = true ;	
      grdMaster.GetGridControl().MergeCol(4) = true ;
      grdMaster.GetGridControl().MergeCol(5) = true ;
      grdMaster.GetGridControl().MergeCol(6) = true ;
      grdMaster.GetGridControl().MergeCol(7) = true ;
      grdMaster.GetGridControl().MergeCol(8) = true ;
      grdMaster.GetGridControl().MergeCol(9) = true ;
      grdMaster.GetGridControl().MergeCol(10) = true ;
      grdMaster.GetGridControl().MergeCol(11) = true ;
      grdMaster.GetGridControl().MergeCol(12) = true ;
      grdMaster.GetGridControl().MergeCol(13) = true ;
      grdMaster.GetGridControl().MergeCol(14) = true ;
      grdMaster.GetGridControl().MergeCol(15) = true ;
      grdMaster.GetGridControl().MergeCol(16) = true ;
      grdMaster.GetGridControl().MergeCol(17) = true ;
      grdMaster.GetGridControl().MergeCol(18) = true ;
      grdMaster.GetGridControl().MergeCol(19) = true ;
      grdMaster.GetGridControl().MergeCol(20) = true ;
      grdMaster.GetGridControl().MergeCol(21) = true ;
      grdMaster.GetGridControl().MergeCol(22) = true ;
      grdMaster.GetGridControl().MergeCol(23) = true ;
      grdMaster.GetGridControl().MergeCol(24) = true ;
      grdMaster.GetGridControl().MergeCol(25) = true ;
      grdMaster.GetGridControl().MergeCol(26) = true ;
      grdMaster.GetGridControl().MergeCol(27) = true ;
      grdMaster.GetGridControl().MergeCol(28) = true ;
      grdMaster.GetGridControl().MergeCol(29) = true ;
      grdMaster.GetGridControl().MergeCol(30) = true ;
      
      grdDetail.GetGridControl().MergeCells  = 2 ;	
      grdDetail.GetGridControl().MergeCol(0) = true ;	
      grdDetail.GetGridControl().MergeCol(1) = true ;   	
      grdDetail.GetGridControl().MergeCol(2) = true ;	
      grdDetail.GetGridControl().MergeCol(3) = true ;	
      grdDetail.GetGridControl().MergeCol(4) = true ;
      grdDetail.GetGridControl().MergeCol(5) = true ;
      grdDetail.GetGridControl().MergeCol(6) = true ;
      grdDetail.GetGridControl().MergeCol(7) = true ;
      grdDetail.GetGridControl().MergeCol(8) = true ;
      grdDetail.GetGridControl().MergeCol(9) = true ;
      grdDetail.GetGridControl().MergeCol(10) = true ;
      grdDetail.GetGridControl().MergeCol(11) = true ;
      grdDetail.GetGridControl().MergeCol(12) = true ;
      grdDetail.GetGridControl().MergeCol(13) = true ;
      grdDetail.GetGridControl().MergeCol(14) = true ;
      grdDetail.GetGridControl().MergeCol(15) = true ;
      grdDetail.GetGridControl().MergeCol(16) = true ;
      grdDetail.GetGridControl().MergeCol(17) = true ;
      grdDetail.GetGridControl().MergeCol(18) = true ;
      grdDetail.GetGridControl().MergeCol(19) = true ;
      grdDetail.GetGridControl().MergeCol(20) = true ;
      grdDetail.GetGridControl().MergeCol(21) = true ;
      grdDetail.GetGridControl().MergeCol(22) = true ;
      grdDetail.GetGridControl().MergeCol(23) = true ;
      grdDetail.GetGridControl().MergeCol(24) = true ;
      grdDetail.GetGridControl().MergeCol(25) = true ;
      grdDetail.GetGridControl().MergeCol(26) = true ;
      grdDetail.GetGridControl().MergeCol(27) = true ;
      grdDetail.GetGridControl().MergeCol(28) = true ;
      grdDetail.GetGridControl().MergeCol(29) = true ;
      grdDetail.GetGridControl().MergeCol(30) = true ;
}

//---------------------------------------------------------

function FormatGrid()
{
    var grdCrl ;
    
    grdCrl = grdDetail.GetGridControl(); 
    
    grdCrl.ColFormat(iD_Unit_Price)   = "###,###,###,###.##";
    grdCrl.ColFormat(iD_Ord_Qty)      = "###,###,###,###.##";
    grdCrl.ColFormat(iD_VAT_Rate)     = "###,###,###,###.##";
    grdCrl.ColFormat(iD_Amount)       = "###,###,###,###.##";
    grdCrl.ColFormat(iD_Reserved_Qty) = "###,###,###,###.##";
    grdCrl.ColFormat(iD_TakeOut_Req)  = "###,###,###,###.##";
    grdCrl.ColFormat(iD_TakeOut_Plan) = "###,###,###,###.##";
    grdCrl.ColFormat(iD_PP_Plan)      = "###,###,###,###.##";    
    grdCrl.ColFormat(iD_BC_Qty)       = "###,###,###,###.##";
    grdCrl.ColFormat(iD_Prod_Qty)     = "###,###,###,###.##";
    
    grdCrl.ColFormat(iD_Sum_TO_Qty)   = "###,###,###,###.##";     
    grdCrl.ColFormat(iD_TakeOut_Qty)  = "###,###,###,###.##";
    grdCrl.ColFormat(iD_Balance)      = "###,###,###,###.##";
         
    /**************************************************************/    
    grdCrl = grdMaster.GetGridControl(); 
    
    grdCrl.ColFormat(iM_Ord_Amt)      = "###,###,###,###.##";
    grdCrl.ColFormat(iM_Total_Amt)    = "###,###,###,###.##";
    
    /**************************************************************/    
    grdCrl = grdMaster2.GetGridControl(); 
    
    grdCrl.ColFormat(G3_unit_price) = "###,###,###,###.##";
    grdCrl.ColFormat(G3_ord_qty)    = "###,###,###,###.##";    
    grdCrl.ColFormat(G3_vat_rate)   = "###,###,###,###.##";
    grdCrl.ColFormat(G3_amount)     = "###,###,###,###.##";    
    grdCrl.ColFormat(G3_prod_qty)   = "###,###,###,###.##";    
    grdCrl.ColFormat(G3_take_out_qty) = "###,###,###,###.##";
    grdCrl.ColFormat(G3_balance)    = "###,###,###,###.##";
          
}

 //---------------------------------------------------------
 function BindingDataList()
 {         
    var sData="";
        
    sData = "DATA|O|Order Date|E|ETD";

    idList.SetDataText(sData);
    idList2.SetDataText(sData);
        
 }        
 
 //---------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 1 :
                data_dsbs00030.Call("SELECT");
            break; 
            case 2 :
                if ( grdMaster.row > 0 )
                {
                    txtMaster_PK.text = grdMaster.GetGridData( grdMaster.row, 32 );
                    lblSoNo.text = grdMaster.GetGridData( grdMaster.row, 4 );
                    lblBillTo.text = grdMaster.GetGridData( grdMaster.row, 2 );
                }    
                data_dsbs00030_1.Call("SELECT");   
            break;
            case 3:
                data_dsbs00030_3.Call("SELECT");  
            break;             
      }  
 }

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
            case "data_dsbs00030" :
                txtMaster_PK.text = '' ;
                lblSoNo.text = '';
                lblBillTo.text = '';
                data_dsbs00030_1.Call('SELECT');
            break;
            case "data_dsbs00030_1" :
                countItem();
            break; 
            case "pro_dsbs00030_2" :
                alert(txtReturnValue.text);
            break;
            case "pro_dsbs00030_3" :
                alert(txtReturnValue.text);
            break;                        
      }  
 }
 
 //---------------------------------------------------------
 
 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 1 :
                data_dsbs00030_3.Call();  
            break;
      }  
 }
 
//------------------------------------------------------------------------------------------------

function countItem()
{
    lblTotalItem.text=grdDetail.rows-1 + " item(s)."
}

//------------------------------------------------------------------------------------------------

function OnDateChange()
{
    var index=idTab.GetCurrentPageNo();
    
    switch(index)
    {
        case 0:
	        var strRad = radSearchDate.GetData();
        	
	        switch (strRad)
	        {
		        case 'a':
				        dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-7));
			        break;			
		        case 'b':
				        dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-14));
			        break;
		        case 'c':
				        dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-30));
			        break;						
	        }
	    break;
	    case 1:
	        var strRad = radSearchDate2.GetData();
        	
	        switch (strRad)
	        {
		        case 'a':
				        dtFrom2.SetDataText(System.AddDate(dtTo2.GetData(),-7));
			        break;			
		        case 'b':
				        dtFrom2.SetDataText(System.AddDate(dtTo2.GetData(),-14));
			        break;
		        case 'c':
				        dtFrom2.SetDataText(System.AddDate(dtTo2.GetData(),-30));
			        break;						
	        }
	    break;
	}
}

//------------------------------------------------------------------------------------------------

function OnProcess(pos)
{
	switch (pos)
	{
		case 'CreateTOReq':
				pro_dsbs00030_2.Call();
			break;	
	    case 'CreateCOInv':
	            pro_dsbs00030_3.Call();
	        break;		
	}
}


//------------------------------------------------------------------------------------------------

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00030" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"  parameter="0,1,2,3" function="sale.sp_sel_dsbs00030" > 
                <input> 
                    <input bind="idList" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                    <input bind="txtOrderNo" />
                    <input bind="ckClose" />  
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00030_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"  function="sale.sp_sel_dsbs00030_1" > 
                <input> 
                    <input bind="txtMaster_PK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_dsbs00030_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="sale.sp_pro_dsbs00030_2" > 
                <input>
                    <input bind="txtMaster_PK" /> 
                    <input bind="txt_user_pk" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_dsbs00030_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="sale.sp_pro_dsbs00030_3" > 
                <input>
                    <input bind="txtMaster_PK" />
                    <input bind="txt_user_pk" />                     
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00030_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"  parameter="5,6,12" function="sale.sp_sel_dsbs00030_3" procedure="SALE.sp_upd_dsbs00030_3"> 
                <input> 
                    <input bind="idList2" /> 
                    <input bind="dtFrom2" /> 
                    <input bind="dtTo2" />  
                    <input bind="txtOrderNo2" />
                    <input bind="ckClose2" />  
                </input> 
                <output bind="grdMaster2" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr id='Tr1' style="height: 100%">
            <td style="width: 100%">
                <!-- <gw:tab id="idTab" style="width: 100%; height: 100%; border6px"> -->
                <gw:tab id="idTab" style="width: 100%; height: 100%; border6px">
                <table id="t_process" name="S/O Process" style="width: 100%; height: 100%">
                    <tr>
                        <td>
                            <gw:grid id='grdSOProcess'
                                header='Bill To|Ord DT|Slip No|Ord Qty|Mat Cons|Stock Book|PO Book|Mat T/I|In Qty|Qut Qty|In Qty|Qut Qty|In Qty|Qut Qty|In Qty|Qut Qty|In Qty|Qut Qty|T/O Qty|Bal Qty'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                defaults='|||||||||||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                sorting='T'
                                styles='width:100%; height:100%'
                            />                        
                        </td>
                    </tr>
                </table>
                <table id="t1" name="Tab 1" style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td>
                            <img status="expand" id="imgArrow" src="../../../../system/images/up.gif" style="cursor: hand;
                                position: absolute; left: 1;" onclick="OnToggle()" />
                        </td>
                    </tr>
                    <tr id='top' style="height: 49%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 5%">
                                    <td style="width: 10%">
                                        <gw:list id="idList" styles="color:blue;width:100%" value="O" onchange="OnSearch(1)" />
                                    </td>
                                    <td style="width: 20%">
                                        <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                                        ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                                    </td>
                                    <td style="width: 20%" align="center" nowrap>
                                        <gw:radio id="radSearchDate" value="a" styles="width:100%" onchange="OnDateChange()">                      
			                                <span value="a">1 Week</span>                       
			                                <span value="b">2 Weeks</span>    
			                                <span value="c">1 Month</span>                
        			                    </gw:radio>
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <b>SO No</b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtOrderNo" styles="width:100%" onenterkey="OnSearch(1)" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        <gw:checkbox id="ckClose" defaultvalue="Y|N" value="N" onchange="OnSearch(1)" />
                                    </td>
                                    <td style="width: 10%" align="left">
                                        <b>Closed Order</b>
                                    </td>
                                    <td style="width: 3%">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <!-- <gw:button id="ibtnSave" img="save" alt="Save" onclick="OnSave()" />  -->
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button id="ibtnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch(1)" />
                                    </td>
                                </tr>
                                <tr style="height: 95%">
                                    <td colspan="12">
                                        <gw:grid id="grdMaster" header="_Bill_To_pk|_Bill To|Bill To|Ord Date|SO No|Ord Type|_Ord Status|Sales Type|Ord Priority|PO No|CCY Unit|Sale Rep|Buy Rep|Pay Form|Pay Term|_Deli_To_PK|_Deli To|Deli To|_Deli_Loc_PK|Deli Loc|Deli Method|Deli Term|Tax rate|Ord Amt|Total Amt|ETD|ETA|_Emp_PK|EMP ID|EMP Name|Close YN|Description|_tsa_saleorder_pk"
                                            format="0|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|4|0|0|0|3|0|0" aligns="0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|3|1|1|0|0|0|0|0|0"
                                            defaults="|||||||||||||||||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                            widths="0|0|3500|1200|2000|1500|1500|1500|1500|1500|1000|1200|1200|1500|2200|1000|1000|2000|1000|1500|1500|1500|1000|1500|1500|1200|1200|1000|1000|2000|1000|1000|1000"
                                            styles="width:100%; height:100%" sorting="T" acceptnulldate="true" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32"
                                            oncellclick="OnSearch(2)" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 5%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 8%" align="right">
                                        <b>Total Item</b>
                                    </td>
                                    <td style="width: 8%; white-space:nowrap" align="left">
                                        <gw:label id="lblTotalItem" styles='width:100%;color:cc0000;font:9pt' text='item' />
                                    </td>
                                    <td style="width: 8%" align="right">
                                        SO No
                                    </td>
                                    <td style="width: 13%" align="center">
                                        <gw:label id="lblSoNo" styles='width:100%;color:cc0000;font:9pt' />
                                    </td>
                                    <td style="width: 7%" align="right">
                                        Bill To
                                    </td>
                                    <td style="width: 30%" align="left">
                                        <gw:label id="lblBillTo" styles='width:100%;color:cc0000;font:9pt' />
                                    </td>
                                    
                                    <td style="width: 12%" align="right">
                                        <gw:button id="idBtnCreateCOInv" img="Create C/I" text="Create C/I" styles='display:none' onclick="OnProcess('CreateCOInv')" />
                                    </td>
                                    <td style="width: 11%" align="right">
                                        <gw:button id="idBtnCreateTOReq" img="Create T/O Request" text="Create T/O Request"
                                            onclick="OnProcess('CreateTOReq')" />
                                    </td>
                                    <td style="width: 4%" align="right">
                                        <gw:button id="ibtnExcel" img="excel" alt="Excel" onclick="OnExcel()" styles="display:none" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 45%">
                        <td>
                            <gw:grid id="grdDetail" header="_tsa_saleorderd_pk|_tco_item_pk|Item Code|Item Name|_Cust Item Name|UOM|U/P|Ord Qty|VAT Rate|Amount|Item Status|ETD|ETA|Deli Method|Reserved Qty|T/O Req|T/O Plan|Prod Plan Qty|BC Qty|Prod Qty|T/O Qty|_takeout_item_pk|Item Code|Item Name|UOM|T/O Date|T/O Qty|UOM|Return Date|Return Qty|UOM|Balance|Close YN|Close Date|Description"
                                format="0|0|0|0|0|0|0|0|0|0|0|4|4|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0|4|0|0|0|3|4|0"
                                aligns="0|0|0|0|0|1|3|3|3|3|1|1|1|1|3|3|3|3|3|3|3|0|0|0|1|1|3|1|1|3|1|3|0|1|0"
                                defaults="||||||||||||||||||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                widths="1000|1365|2000|4500|600|600|1000|1000|1000|1500|1200|1200|1200|1200|1200|1000|1000|1000|1000|1000|1000|1800|2500|4500|600|1200|1000|600|1200|1000|600|1000|1000|1200|1000"
                                styles="width:100%; height:100%" sorting="F" acceptnulldate="T" oncellclick=""
                                param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34" />
                        </td>
                    </tr>
                </table>
                <table id="t2" name="Tab 2" style="width: 100%; height: 100%">
                    <tr id='top2' style="height: 49%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 5%">
                                    <td style="width: 10%">
                                        <gw:list id="idList2" styles="color:blue;width:100%" value="O" onchange="OnSearch(1)" />
                                    </td>
                                    <td style="width: 20%">
                                        <gw:datebox id="dtFrom2" lang="<%=Session("Lang")%>" />
                                        ~<gw:datebox id="dtTo2" lang="<%=Session("Lang")%>" />
                                    </td>
                                    <td style="width: 20%" align="center" nowrap>
                                        <gw:radio id="radSearchDate2" value="a" styles="width:100%" onchange="OnDateChange()">                      
			                                <span value="a">1 Week</span>                       
			                                <span value="b">2 Weeks</span>    
			                                <span value="c">1 Month</span>                
        			                    </gw:radio>
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <b>SO No</b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtOrderNo2" styles="width:100%" onenterkey="OnSearch(1)" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        <gw:checkbox id="ckClose2" defaultvalue="Y|N" value="N" onchange="OnSearch(3)" />
                                    </td>
                                    <td style="width: 10%" align="left">
                                        <b>Closed Order</b>
                                    </td>
                                    <td style="width: 3%">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button id="ibtnSearch2" img="search" alt="Search" text="Get Order" onclick="OnSearch(3)" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button id="ibtnSave" img="save" alt="Save" onclick="OnSave(1)" />
                                    </td>
                                </tr>
                                <tr style="height: 95%">
                                    <td colspan="12">
                                        <gw:grid id="grdMaster2" header='Bill To ID|Bill To Name|Order DT|Slip No|Close YN|_Tsa_Saleorder_Pk|_Tsa_Saleorderd_Pk|_Tco_Item_Pk|Item Code|Item Name|_Cust Item Nm|Item Unit|Item Close YN|Item Close DT|Unit Price|Ord Qty|VAT Rate|Amount|Prod Qty|Take Out Qty|Balance|Description'
                                            format='0|0|4|0|3|0|0|0|0|0|0|0|3|4|0|0|0|0|0|0|0|0' aligns='0|0|1|0|1|0|0|0|0|0|0|0|1|1|3|3|3|3|3|3|3|0'
                                            defaults='|||||||||||||||||||||' editcol='0|0|0|0|1|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0'
                                            widths='1300|2000|1200|1200|800|0|0|0|1500|2000|2000|1000|1300|1300|1200|1200|1200|1200|1200|1200|1200|2000'
                                            sorting='T' styles="width:100%; height:100%" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                </gw:tab>
                <!-- </gw:tab> -->
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------------------------->
    <!------------------------------------------------------------------------------------------->
    <gw:textbox id="txtMaster_PK" style="display: none" />
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txt_user_pk" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------------------------->
</body>
</html>
