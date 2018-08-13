<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head runat="server">
    <title>Mat Booking 2 Popup</title>
</head>

<script>
 
    var  user_pk   =  "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name =  "<%=Session("USER_NAME")%>" ;
    
    var 
    G1_saleorderd_pk =0,
    G1_so_item_no=1,
    G1_tco_stitem_pk =2,
    G1_item_code =3,
    G1_item_name =4,
    G1_order_qty =5,
    G1_unit =6,
    G1_lot_qty =7,
    G1_lot_uom =8,
    G1_pro_book =9,
    G1_mat_book =10,
    G1_po_book =11,
    G1_possible_st_dt =12,
    G1_wi_qty =13,
    G1_TO_qty =14,
    G1_TO_Bal =15;
    
    var 
    G2_mat_item_pk =0,
    G2_item_code =1,
    G2_item_nm =2 ,
    G2_need_qty =3,
    G2_mat_book =4,
    G2_available_dt =5,
    G2_stock_loc =6,
    G2_ref_stock_qty =7,
    G2_ref_booked =8,
    G2_available_qty =9,
    G2_reserve_qty  =10;  

 //---------------------------------------------------------
 function BodyInit()
 {
     BindingDataList()
 } 

//-------------------------------------------------------------------------------------------
 function MergeColumn()
{

      grdDetail.GetGridControl().MergeCells  = 2 ;	
      grdDetail.GetGridControl().MergeCol(0) = true ;	
      grdDetail.GetGridControl().MergeCol(1) = true ;   	
      grdDetail.GetGridControl().MergeCol(2) = true ;	
    
}

//---------------------------------------------------------

function FormatGrid()
{
    var grdCrl ;
    
    grdCrl = grdDetail.GetGridControl(); 
    
    grdCrl.ColFormat(G2_need_qty)           = "###,###,###,###.##";
    grdCrl.ColFormat(G2_mat_book)           = "###,###,###,###.##";
    grdCrl.ColFormat(G2_ref_stock_qty)      = "###,###,###,###.##";
    grdCrl.ColFormat(G2_ref_booked)         = "###,###,###,###.##";
    grdCrl.ColFormat(G2_available_qty)      = "###,###,###,###.##";
    grdCrl.ColFormat(G2_reserve_qty)        = "###,###,###,###.##";       
    
}

 //---------------------------------------------------------
 function BindingDataList()
 {         
   var sData="";
        
    sData = "DATA|O|Order Date|E|ETD";

    idList.SetDataText(sData);
        
 }        
 
 //---------------------------------------------------------
 function OnSearch(pos)
 {
      switch(pos)
      {
        case 1:
            fpbp000911.Call('SELECT')
        break;
        case 2:
        break;
      }
 }
 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
 
      
 }
 
 //---------------------------------------------------------
 
 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 1 :
            break;
      }  
 }
 

//------------------------------------------------------------------------------------------------

function OnDateChange()
{
	var strRad = radSearchDate.GetData();
	
	switch (strRad)
	{
		case 'a':
				dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-14));
			break;			
		case 'b':
				dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-30));
			break;
		case 'c':
				dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-90));
			break;						
	}
}

//------------------------------------------------------------------------------------------------

function OnProcess(pos)
{
	
}

</script>
   
<body>
      <!------------------------------------------------------------------>
    <gw:data id="fpbp000911" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  parameter="0,1,2,3" function="prod.sp_sel_fpbp000911_1" > 
                <input> 
                    <input bind="idList" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                    <input bind="txtOrderNo" />
                    <input bind="ckBal" />  
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1" cellpadding="0" cellspacing="0">
        <tr id='top' style="height: 100%; width:100%">
            <td style="width:50%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 5%">
                        
                         <td style="width: 40%" align="center" colspan="4">
                            <gw:radio id="radSearchDate" value="a" styles="width:100%" onchange="OnDateChange()">                      
			                    <span value="a">2 Weeks</span>                       
			                    <span value="b">1 Month</span>    
			                    <span value="c">3 Months</span>                
        			        </gw:radio>
                        </td>
                        <td style="width: 7%" align="right">
                            <b>SO No</b>
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtOrderNo" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 4%" align="right" >
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch(1)" />
                        </td>
                    </tr>
                    <tr style="height: 5%">
                        <td style="width: 12%" colspan="2">
                            <gw:list id="idList" styles="color:blue;width:100%" value="O" onchange="OnSearch(1)" />
                        </td>
                        <td style="width: 5%" align="right">
                            <b>From</b>
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>"  />
                        </td>
                        <td style="width: 3%" align="right">
                            <b>To</b>
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtTo" lang="<%=Session("Lang")%>"  />
                        </td>
                        
                        <td style="width: 4%" align="right">
                            <gw:checkbox id="ckBal" defaultvalue="Y|N" value="Y" />
                        </td>
                        <td style="width: 11%" align="left">
                            <b>Balance</b>
                        </td>              
                    </tr>
                    <tr style="height: 95%">
                        <td colspan="12">
                            <gw:grid id='grdMaster'
                                header='_PK|Select|Priority|So Item No|_TCO_STITEM_PK|ST Item Code|ST Item Name|Spec|Need Qty|Booking Qty'
                                format='0|3|0|0|0|0|0|0|0|1'
                                aligns='0|0|1|0|0|0|0|0|0|0'
                                defaults='|||||||||'
                                editcol='1|1|1|1|1|1|1|1|1|1'
                                widths='0|800|1000|0|1500|1500|2500|3000|1500|1500'
                                sorting='T'
                                styles='width:100%; height:100%'
                                />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width:50%">
                <table style="width: 100%; height: 100%">
                    <tr style="height:5%">
                        <td>
                        </td>
                    </tr>
                    <tr style="height:95%">
                        <td style=" width:100%">
                            <gw:grid id='grd'
                                header='_PK|SO Item No|_TCO_STITEM_PK|Item Code|Item Name|Oder Qty|Unit|Lot Qty|Lot UOM|Pro. Booking|Mat. Booking|PO Booking|Possible Start Dt|WI Qty|T/O Qty|T/O Bal.'
                                format='0|0|0|0|0|1|0|1|0|1|1|1|4|1|1|1'
                                aligns='0|0|0|0|0|0|1|0|1|0|0|0|0|0|0|0'
                                defaults='|||||||||||||||'
                                editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                                widths='0|1500|0|1500|2000|1500|1000|1500|1000|1500|1500|1500|1200|1500|1500|1500'
                                sorting='T'
                                styles='width:100%; height:100%'
                                acceptNullDate="true"
                                oncellclick="OnSearch(2)"
                                />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
     <!------------------------------------------------------------------------------------------->
    <gw:textbox id="txtMaster_PK" style="display: none" />
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txt_user_pk" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------------------------->
</body>
</html>
