<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>S/O Production Status</title>
</head>

<script>
 var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
 var  user_name = "<%=Session("USER_NAME")%>"  ;

var G_BILL_TO_NAME       = 0,  
    G_TSA_SALEORDER_M_PK = 1,
    G_ORDER_DT           = 2,
    G_PO_NO              = 3,
    G_TSA_SALEORDER_D_PK = 4,
    G_SEQ_NUM            = 5,
    G_TCO_ITEM_PK        = 6,
    G_ITEM_CODE          = 7,
    G_ITEM_NAME          = 8,
    G_ORD_UOM            = 9,
    G_UNIT_PRICE         = 10,
    G_ORD_QTY            = 11,
    G_AMOUNT             = 12,
    G_OUT_QTY            = 13,
    G_DELI_AMOUNT        = 14,
    G_BAL_QTY            = 15,
    G_BAL_AMOUNT         = 16;
//------------------------------------------------------------------------
	        
function BodyInit()
{  
    System.Translate(document);
    //--------------------
    FormatGrid();      
    //--------------------   
    MergeColumn();
    //--------------------
    BindingDataList();
    //--------------------    
    OnSearchStatus();    
}
//------------------------------------------------------------------------
function BindingDataList()
{
	 var sData = '';	
	 //---------------------------------------
     sData = "DATA|O|Order Date|E|ETD";
     
     idList.SetDataText(sData);
     //---------------------------------------
}

//---------------------------------------------------------

function MergeColumn()
{
      var ctrl = grdDetail.GetGridControl() ;
      
      ctrl.MergeCells  = 2 ;	
      
      ctrl.MergeCol(0) = true ;	
      ctrl.MergeCol(1) = true ;   	
      ctrl.MergeCol(2) = true ;	
      ctrl.MergeCol(3) = true ;
      ctrl.MergeCol(4) = true ;
}
//================================================================================  

function FormatGrid()
{
        var ctrl = grdDetail.GetGridControl();
             
        ctrl.ColFormat(G_UNIT_PRICE)  = "###,###,###.######" ;
        ctrl.ColFormat(G_ORD_QTY)     = "###,###,###.##" ;
        ctrl.ColFormat(G_AMOUNT)      = "###,###,###.##" ;
        ctrl.ColFormat(G_OUT_QTY)     = "###,###,###.##" ;
        ctrl.ColFormat(G_DELI_AMOUNT) = "###,###,###.##" ;
        ctrl.ColFormat(G_BAL_QTY)     = "###,###,###.##" ;
        ctrl.ColFormat(G_BAL_AMOUNT)  = "###,###,###.##" ;
}
//================================================================================  

 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {		 
            case 'data_fppr00110' :
				SummaryData();
				                
                //-------------------
                if (grdDetail.rows > 1)
                {
                    grdDetail.SetCellBold( 1, G_AMOUNT,      grdDetail.rows-1, G_AMOUNT,      true);  
					grdDetail.SetCellBold( 1, G_DELI_AMOUNT, grdDetail.rows-1, G_DELI_AMOUNT, true);                    
                    grdDetail.SetCellBold( 1, G_BAL_AMOUNT,  grdDetail.rows-1, G_BAL_AMOUNT,  true);
                                        
                    grdDetail.SetCellBgColor( 1, G_ITEM_CODE, grdDetail.rows-1, G_ITEM_NAME, 0xCCFFFF );
                    
                    grdDetail.Subtotal( 0, 2, 0, '11!12!13!14!15!16!17');
                }								
                //-------------------                                
            break; 
      }  
 }
 
//================================================================================  
 function SummaryData()
 {
 	var sumCustNum 	= 0 ;
	var sumPONum   	= 0 ;
	var sumPOQty	= 0 ;
	var sumPOAmount	= 0 ;
	
	var sBillTo = "";
	var sPONo	= "";
	
		for ( var i = 1 ; i < grdDetail.rows ; i++ )		
		{
			if ( sBillTo != grdDetail.GetGridData( i, G_BILL_TO_NAME) )
			{
				sumCustNum = sumCustNum + 1;
				sBillTo = grdDetail.GetGridData( i, G_BILL_TO_NAME);
			}
			//------
			if ( sPONo != grdDetail.GetGridData( i, G_TSA_SALEORDER_M_PK) )
			{
				sumPONum = sumPONum + 1;
				sPONo = grdDetail.GetGridData( i, G_TSA_SALEORDER_M_PK);
			}	
			//------
			sumPOQty    = Number(sumPOQty)    + Number(grdDetail.GetGridData( i, G_ORD_QTY));	
			sumPOAmount = Number(sumPOAmount) + Number(grdDetail.GetGridData( i, G_AMOUNT ));	 
		} 		
		
		txtCustNum.text = sumCustNum;
		txtPONum.text   = sumPONum;
		txtPOQty.text   = sumPOQty;
		txtPOAmount.text= sumPOAmount;   
 }
 
//================================================================================  

function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdDetail' :
        
            data_fppr00110.Call("SELECT");
            
        break;       
    }
}
//================================================================================  
function OnSearchStatus()
{
	var strRad =radSearchStatus.GetData();
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
}
//===============================================================================
function OnReport(pos)
{
    if(pos == '1')
    {
         var url =System.RootURL + "/reports/ds/bs/rpt_fppr00110_1.aspx?p_list_date=" + idList.value + '&p_from_date=' + dtFrom.value + '&p_to_date=' + dtTo.value + '&p_item=' + txtPOItem.text + '&p_bill_to=' + txtBillTo.text; 
         System.OpenTargetPage(url);         
    }
    else if(pos == '2')
    {
         var url =System.RootURL + "/reports/ds/bs/rpt_fppr00110_2.aspx?p_master_pk=" + grdDetail.GetGridData(grdDetail.row, G_TSA_SALEORDER_M_PK);
         System.OpenTargetPage(url);            
    }
}
//================================================================================
</script>

<body>
    <!-------------------------------------------------------------------->
    <gw:data id="data_fppr00110" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="2" type="grid" function="<%=l_user%>lg_sel_fppr00110"  > 
                    <input bind="grdDetail" > 
                        <input bind="idList" />
                        <input bind="dtFrom" />
                        <input bind="dtTo" />
                        <input bind="txtPOItem" />
                        <input bind="txtBillTo" />
                     </input> 
                    <output bind="grdDetail" /> 
                </dso> 
            </xml> 
        </gw:data>
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">			 
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 10%">
                            <gw:list id="idList" styles="color:blue;width:100%" value="O" />
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 20%; white-space: nowrap; background-color: CCFFFF" align="center">
                            <gw:radio id="radSearchStatus" value="a" styles="width:100%" onchange="OnSearchStatus()">                      
			                    <span value="a">1 Week</span>                       
			                    <span value="b">2 Weeks</span>    
			                    <span value="c">1 Month</span>                
			                </gw:radio>
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            PO/Item
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtPOItem" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Bill To
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtBillTo" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
                        </td>
                       <td style="width: 1%">
                            <gw:imgbtn img="excel" alt="Report" id="btnReport" onclick="OnReport('1')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="excel" alt="Report" id="btnReport1" onclick="OnReport('2')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch('grdDetail')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>		
        <tr style="height: 98%">
            <td>             
                <gw:grid id='grdDetail' header='Bill To|_SO_PK|Ord Date|P/O No|_SO_D_PK|Seq|_TCO_ITEM_PK|Item Code|Item Name|UOM|U/P|Ord Qty|Amount|Deli Qty|Amount|Bal Qty|Bal Amount'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|1|0|0|0|1|3|3|3|3|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1500|0|1200|1500|0|800|0|1500|2500|1000|1200|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
</html>
