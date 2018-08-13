<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>S/O Checking</title>
</head>

<script>
 var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
 var  user_name = "<%=Session("USER_NAME")%>"  ;

var G_BILL_TO_NAME       = 0,  
    G_TSA_SALEORDER_M_PK = 1,
    G_ORDER_DT           = 2,
    G_PO_NO              = 3,
	G_ETD				 = 4,	
    G_TSA_SALEORDER_D_PK = 5,
    G_SEQ_NUM            = 6,
    G_TCO_ITEM_PK        = 7,
    G_ITEM_CODE          = 8,
    G_ITEM_NAME          = 9,
	G_CUST_ITEM			 = 10,
    G_ORD_UOM            = 11,
    G_UNIT_PRICE         = 12,
    G_ORD_QTY            = 13,
    G_AMOUNT             = 14,
	G_CANCEL_QTY		 = 15,
	G_CANCEL_AMOUNT      = 16,
    G_OUT_QTY            = 17,
    G_DELI_AMOUNT        = 18,
    G_BAL_QTY            = 19,
    G_BAL_AMOUNT         = 20,
	G_DELI_RATIO		 = 21;

//================================================================================  
	
function OnToggle(pos)
{
    switch (pos)
    {
        case '1':
            var left = document.all("left"); 
            var right = document.all("right"); 
            var imgArrow = document.all("imgArrow"); 

            if(imgArrow.status == "expand")
            {
                left.style.display="none";
                imgArrow.status = "collapse";
                right.style.width="100%";
                imgArrow.src = "../../../../system/images/button/next.gif";
            }
            else
            {
                left.style.display="";
                imgArrow.status = "expand";
                right.style.width="70%";
                imgArrow.src = "../../../../system/images/button/previous.gif";
            }        
        break; 
    }    
}
	
//================================================================================  
	        
function BodyInit()
{  
    System.Translate(document);
    //--------------------	 
    FormatGrid();      
    //--------------------    
    OnSearchStatus(); 
	//--------------------
	OnToggle('1');
	//--------------------
	data_dsbs00060_1.Call("SELECT");   
}
  
//================================================================================  

function FormatGrid()
{
	 var data = '';	
	 //---------------------------------------
     data = "DATA|O|Order Date|E|ETD";
      
     idList.SetDataText(data);
	 
	 //-----------------
	 data = "data|10|Grand|20|by Partner";
     lstGridType.SetDataText(data);  
     lstGridType.value = '10'; 
	
	 //-----------------
	 data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGSA1020') FROM DUAL" )%>||";    
     lstOrderType.SetDataText(data);	
	 lstOrderType.value = "";	
	 
	 data = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 order by partner_name")%>||";
	 lstCompany.SetDataText(data);	
	 lstCompany.value = "";
	 
	 data = "<%=CtlLib.SetListDataSQL("SELECT pk ,factory_id || ' - ' || factory_name FROM tlg_pr_factory WHERE del_if = 0 and use_yn = 'Y' ORDER BY factory_id" )%>||"; 
	 lstFactory.SetDataText(data);
	 lstFactory.value="";
	 //---------------------------------------
     var ctrl = grdDetail.GetGridControl();
             
     ctrl.ColFormat(G_UNIT_PRICE)    = "###,###,###.######" ;
     ctrl.ColFormat(G_ORD_QTY)       = "###,###,###.##" ;
     ctrl.ColFormat(G_AMOUNT)        = "###,###,###.##" ;
	 ctrl.ColFormat(G_CANCEL_QTY)    = "###,###,###.##" ;
     ctrl.ColFormat(G_CANCEL_AMOUNT) = "###,###,###.##" ;
     ctrl.ColFormat(G_OUT_QTY)       = "###,###,###.##" ;
     ctrl.ColFormat(G_DELI_AMOUNT)   = "###,###,###.##" ;
     ctrl.ColFormat(G_BAL_QTY)       = "###,###,###.##" ;
     ctrl.ColFormat(G_BAL_AMOUNT)    = "###,###,###.##" ;

	 //---------------------------------------
	 var ctrl = grdDetail.GetGridControl() ;
      
     ctrl.MergeCells  = 2 ;	
      
     ctrl.MergeCol(0) = true ;	
     ctrl.MergeCol(1) = true ;   	
     ctrl.MergeCol(2) = true ;	
     ctrl.MergeCol(3) = true ;
     ctrl.MergeCol(4) = true ;
}
//================================================================================  

 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {		 
            case 'data_dsbs00060' :
				 
				SummaryData();
				                
                //-------------------
                if (grdDetail.rows > 1)
                {
                    grdDetail.SetCellBold( 1, G_AMOUNT,        grdDetail.rows-1, G_AMOUNT,        true);  
					grdDetail.SetCellBold( 1, G_CANCEL_AMOUNT, grdDetail.rows-1, G_CANCEL_AMOUNT, true);
					grdDetail.SetCellBold( 1, G_DELI_AMOUNT,   grdDetail.rows-1, G_DELI_AMOUNT,   true);                    
                    grdDetail.SetCellBold( 1, G_BAL_AMOUNT,    grdDetail.rows-1, G_BAL_AMOUNT,    true);
                                        
                    grdDetail.SetCellBgColor( 1, G_ITEM_CODE, grdDetail.rows-1, G_ITEM_NAME, 0xCCFFFF );
                    
					if ( lstGridType.value == '20' )
					{
						grdDetail.Subtotal( 0, 2, 0, '13!14!15!16!17!18!19!20','###,###,###.##');
					}
					else if ( lstGridType.value == '10' )
					{
						grdDetail.Subtotal( 0, 2, -1, '13!14!15!16!17!18!19!20','###,###,###.##');
					}	
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
			sumPOQty    = Number(sumPOQty)    + Round(Number(grdDetail.GetGridData( i, G_ORD_QTY)),2);	
			sumPOAmount = Number(sumPOAmount) + Round(Number(grdDetail.GetGridData( i, G_AMOUNT )),2);	 
		} 		
		 
		txtCustNum.text = sumCustNum;		 
		txtPONum.text   = sumPONum;		
		txtPOQty.text   = Round(sumPOQty,2);
		txtPOAmount.text= Round(sumPOAmount,2);   
 }
 
//================================================================================  

function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdDetail' :				    
			var imgArrow = document.all("imgArrow"); 

            if(imgArrow.status == "expand")
			{
				txtDivisionPK.text == "" ;
			}
			
            data_dsbs00060.Call("SELECT");
            
        break;       
    }
}
//================================================================================
function OnTreeClk()
{
	var obj = event.srcElement.GetCurrentNode(); 
      
   	txtDivisionPK.text  = '' + obj.oid; 
	
	OnSearch('grdDetail');
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
	switch(pos)
	{
		case '1':
			var url = System.RootURL + "/standard/reports/ds/bs/rpt_dsbs00060_1.aspx?";
				url += "p_company_pk="     + lstCompany.value;
				url += "&p_tlg_mt_div_pk=" + txtDivisionPK.text;
				url += "&p_date_type="     + idList.value;
				url += "&p_from_date="     + dtFrom.value;
				url += "&p_to_date="       + dtTo.value;
				url += "&p_item="          + txtPOItem.text;
				url += "&p_bill_to="       + txtBillTo.text;
				url += "&p_so_uprice="     + chkSalePrice.GetData();
				url += "&p_order_type="    + lstOrderType.value; 
			
			System.OpenTargetPage(url);   		
		break;
		
		case '2':    
			var url =System.RootURL + "/standard/reports/ds/bs/rpt_dsbs00060_2.aspx?p_master_pk=" + grdDetail.GetGridData(grdDetail.row, G_TSA_SALEORDER_M_PK);
			System.OpenTargetPage(url);            
		break;
		
		
		case '3':     
			var url = System.RootURL + "/standard/reports/ds/bs/rpt_dsbs00060_3.aspx?p_company_pk=" + lstCompany.value;
				url+= "&p_tlg_mt_div_pk=" + txtDivisionPK.text;
				url+= "&p_date_type="     + idList.GetData();
				url+= "&p_from_dt="       + dtFrom.value;
				url+= "&p_to_dt="         + dtTo.value;
				url+= "&p_po_item="       + txtPOItem.text;
				url+= "&p_bill_to="       + txtBillTo.text;
				url+= "&p_so_uprice="     + chkSalePrice.GetData();
				url+= "&p_order_type="    + lstOrderType.value;
			 
			System.OpenTargetPage(url);   			
		break;	
		
		case '4':     
			var url = System.RootURL + "/standard/reports/ds/bs/rpt_dsbs00063.aspx?p_company_pk=" + lstCompany.value;			 
				url+= "&p_date_type="     + idList.GetData();
				url+= "&p_from_dt="       + dtFrom.value;
				url+= "&p_to_dt="         + dtTo.value;
				url+= "&p_po_item="       + txtPOItem.text;
				url+= "&p_bill_to="       + txtBillTo.text;				 
				url+= "&p_order_type="    + lstOrderType.value;
			 
			System.OpenTargetPage(url);   			
		break;
    }
}
//================================================================================

function OnPopUp(pos)
{
	switch(pos)
	{
		case 'SUM-DELI':

            var path = System.RootURL + '/standard/forms/ds/bs/dsbs00062.aspx' ;
            var obj = System.OpenModal( path ,1000 , 550 ,  'resizable:yes;status:yes');            
		break;	
		
		case 'Report':
                             
            var path = System.RootURL + '/standard/forms/ds/bs/dsbs00063.aspx';
		    var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
                      
        break;    		
	}
}
//================================================================================

</script>

<body>
    <!-------------------------------------------------------------------->
	<gw:data id="data_dsbs00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" function="st_lg_sel_dsbs00060_1" > 
                <input>
                    <input bind="txtGroupSearch" />
                </input>
                <output bind="oTree" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="data_dsbs00060" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="2" type="grid" function="st_lg_sel_dsbs00060"  > 
                    <input bind="grdDetail" > 
						<input bind="lstCompany" />
						<input bind="txtDivisionPK" />
                        <input bind="idList" />
                        <input bind="dtFrom" />
                        <input bind="dtTo" />
                        <input bind="txtPOItem" />
                        <input bind="lstOrderType" />
                        <input bind="txtBillTo" />
						<input bind="chkSalePrice" />
						<input bind="lstFactory" />
                     </input> 
                    <output bind="grdDetail" /> 
                </dso> 
            </xml> 
        </gw:data>
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
		<tr style="height: 1%" >
			<td colspan=2 >
			<div style="width:100%;" class="eco_line">
				<table style="width: 100%; height: 100%; " class="eco_bg">                    
                    <tr>
						<td style="width: 6%; white-space:nowrap" align="right">
						
						</td>
						<td style="width: 14%; white-space:nowrap" align="right">
							<gw:list id="lstFactory" styles="width:100%;display:none" />
						</td>
						
						<td style="width: 5%; white-space:nowrap" align="right">
							Cust Num
						</td>
						<td style="width: 15%; white-space:nowrap" align="center">							 
							<gw:label id="txtCustNum" styles='width:100%;color:cc0000;font:11pt;t-align:center' />
                        </td>
						<td style="width: 5%; white-space:nowrap" align="right">
							P/O Num
						</td>
                        <td style="width: 15%; white-space:nowrap" align="center">							
							<gw:label id="txtPONum" styles='width:100%;color:cc0000;font:11pt'   />
                        </td>
						<td style="width: 5%; white-space:nowrap" align="right">
							P/O Qty
						</td>
						 <td style="width: 15%; white-space:nowrap" align="center">						 	                             
							<gw:label id="txtPOQty" styles='width:100%;color:cc0000;font:11pt'   />		
                        </td>
						<td style="width: 5%; white-space:nowrap" align="right">
							P/O Amount
						</td>
						<td style="width: 15%; white-space:nowrap" align="center">							
							<gw:label id="txtPOAmount" styles='width:100%;color:cc0000;font:11pt'   />											                          
                        </td>						 
                    </tr>                    
                </table>
				</div>
			</td>
		</tr>	
        <tr style="height: 1%">
            <td colspan=2 >
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td colspan=2 style="width: 20%">
                            <gw:list id="idList" styles="color:blue;width:100%" value="O" />
                        </td>
                        <td style="width: 25%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>   
						                     
                        <td style="width: 5%; white-space: nowrap" align="right">
                            PO/Item
                        </td>                       
					    <td style="width: 25%">
                            <gw:textbox id="txtPOItem" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
                        </td>
						
						<td  style="width: 5%; white-space: nowrap">
 							Ord/Type
						</td>
						
						<td  style="width: 15%; white-space: nowrap">
 							<gw:list id="lstOrderType" styles="width:100%" />
						</td>						 						
						
						<td style="width: 2%">                             
                        </td>						
                        <td style="width: 1%">
                             
                        </td>
                        <td style="width: 1%" >
                            <gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 1%">
							<gw:button img="excel" alt="Report" id="btnReport1" onclick="OnPopUp('Report')" />
                            
                        </td>
                    </tr>
					<tr>
						<td style="width: 10%" align="center" >
							<img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                style="cursor: hand;display:none" onclick="OnToggle('1')" />
						</td>                         
                        <td style="width: 25%; white-space: nowrap;" align="center" colspan=2 class="eco_bg" >
                            <gw:radio id="radSearchStatus" value="a" styles="width:100%" onchange="OnSearchStatus()">                      
			                    <span value="a">1 Week</span>                       
			                    <span value="b">2 Weeks</span>    
			                    <span value="c">1 Month</span>                
			                </gw:radio>
                        </td>
                       
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Buyer
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtBillTo" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
                        </td>
						
						<td  style="width: 20%; white-space: nowrap" align="center" colspan=2 >
							<gw:checkbox id="chkSalePrice" defaultvalue="Y|N" value="Y" onchange="OnSearch()" /> <b style="color: purple">S/O Price</b>	
							
							<a title="Supplier" onclick="OnPopUp('SUM-DELI')" href="#tips" class="eco_link">
                                <b>Deli (%)</b></a>
								
						</td>
						
						<td  style="width: 2%; white-space: nowrap">
						</td>
						
                        <td style="width: 3%" colspan= 3 > 
	                         <gw:list id="lstGridType" styles='width:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>		
        <tr style="height: 98%">
			<td style="width: 30%" id="left" >             
                <gw:tree id="oTree" style="width: 100%; height: 100%; overflow: auto;" onclicknode="OnTreeClk()" />
            </td>
            <td style="width: 70%" id="right" >             
                <gw:grid id='grdDetail' 
					header='Buyer|_SO_PK|Ord Date|P/O No|ETD|_SO_D_PK|Seq|_TCO_ITEM_PK|Item Code|Item Name|Cust Item|UOM|U/P|Ord Qty|Amount|Cancel Qty|Amount|Deli Qty|Amount|Bal Qty|Bal Amount|Deli(%)'
                    format='0|0|4|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|0|1|0|1|0|0|0|0|1|3|3|3|3|3|3|3|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
				    widths='1500|0|1200|1500|1200|0|800|0|1500|2500|1200|800|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<gw:list id="lstCompany" styles="width:100%;display:none" />
<gw:textbox id="txtGroupSearch" styles="width:100%;display:none"  />
<gw:textbox id="txtDivisionPK" styles="width:100%;display:none"  />

</html>
