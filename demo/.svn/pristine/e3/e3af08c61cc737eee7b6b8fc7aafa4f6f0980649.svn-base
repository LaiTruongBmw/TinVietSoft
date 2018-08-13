<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head runat="server">
    <title>Material Booking 2</title>
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
 function OnToggle()
 {
    var top  = document.all("top");    
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        top.style.display="none";       
        imgArrow.status = "collapse";
        imgArrow.src = "../../../system/images/down.gif";
    }
    else
    {
        top.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/up.gif";
    }
 }
 
 //---------------------------------------------------------
 function BodyInit()
 {
      grdMaster.GetGridControl().FrozenCols = 7;
      
      grdDetail.GetGridControl().FrozenCols = 6;
      
      txt_user_pk.text = user_pk;
       
      dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-7));
    
      // MergeColumn();
      //FormatGrid();
      BindingDataList()
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
    
    grdCrl = grdMaster.GetGridControl();   
    grdCrl.ColFormat(G1_order_qty)      = "###,###,###,###.##";     
    grdCrl.ColFormat(G1_lot_qty)        = "###,###,###,###.##";
    grdCrl.ColFormat(G1_pro_book)       = "###,###,###,###.##";
    grdCrl.ColFormat(G1_mat_book)       = "###,###,###,###.##";
    grdCrl.ColFormat(G1_po_book)        = "###,###,###,###.##";
    grdCrl.ColFormat(G1_wi_qty)         = "###,###,###,###.##";
    grdCrl.ColFormat(G1_TO_qty)         = "###,###,###,###.##";
    grdCrl.ColFormat(G1_TO_Bal)         = "###,###,###,###.##";
        
    
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
      switch (pos)         
      {		        
            case 1 :
                fpbp00091.Call("SELECT");
            break; 
            case 2 :
                if ( grdMaster.row > 0 )
                {
                    txtMaster_PK.text = grdMaster.GetGridData( grdMaster.row, G1_saleorderd_pk );
                    lblSoNo.text = grdMaster.GetGridData( grdMaster.row, G1_so_item_no);
                    lblBillTo.text = grdMaster.GetGridData( grdMaster.row, 2 );
                }    
                fpbp00091_1.Call("SELECT");   
            break;             
      }  
 }

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
            case "fpbp00091" :
                txtMaster_PK.text = '' ;
                lblSoNo.text = '';
                lblBillTo.text = '';
               // fpbp00091_1.Call('SELECT');
            break;
            case "fpbp00091_1" :
                countItem();
            break; 
            case "fpbp00091_2" :
                alert(txtReturnValue.text);
            break;
            case "fpbp00091_3" :
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
	switch (pos)
	{
		case 'CreateTOReq':
				fpbp00091_2.Call();
			break;	
	    case 'CreateCOInv':
	            fpbp00091_3.Call();
	        break;		
	}
}

//------------------------------------------------------------------------------------------------
function OnBookMat()
{
    var path = System.RootURL + "/form/fp/bp/fpbp00091_1.aspx";
    var	obj = System.OpenModal( path ,1000 , 600 ,  'resizable:yes;status:yes');
}
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="fpbp00091" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  parameter="0,1,2,3" function="prod.sp_sel_fpbp00091" > 
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
    <gw:data id="fpbp00091_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"   function="prod.sp_sel_fpbp00091_1" > 
                <input> 
                    <input bind="txtMaster_PK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr id='top' style="height: 50%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style="height: 5%">
                        <td style="width: 10%">
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
                        <td style="width: 25%" align="center">
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
                        <td style="width: 4%" align="right">
                            <gw:checkbox id="ckBal" defaultvalue="Y|N" value="Y" />
                        </td>
                        <td style="width: 11%" align="left">
                            <b>Balance</b>
                        </td>
                        <td style="width: 4%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch(1)" />
                        </td>
                        <td style="width: 4%" align="right">
                            <gw:icon id="btnNew" img="in" text="New List" styles='width:100%' onclick="OnBookMat()" />
                         </td>
                    </tr>
                    <tr style="height: 95%">
                        <td colspan="12">
                            <gw:grid id='grdMaster'
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
        <tr style="height: 5%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 8%" align="right">
                            <b>Total Item</b>
                        </td>
                        <td style="width: 7%" align="left">
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
                        <td style="width: 50%" align="left">
                            <gw:label id="lblBillTo" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                         <td style="width: 5%" align="right">
                            <gw:imgbtn id="btnCancel" img="cancel" alt="Search"  onclick="" />
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="btnSave" img="save" alt="Search"  onclick="" />
                        </td>
                        <td style="width: 4%" align="right">
                            <gw:imgbtn id="ibtnExcel" img="excel" alt="Excel" onclick="OnExcel()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 45%">
            <td>
                <gw:grid id='grdDetail'
                    header='_MAT_ITEM_PK|Item Code|Item Name|Need Qty|Mat. Booked|Available DT|Stock Loc|Ref Stock Qty|Ref Booked|Available Qty|Reserve Qty'
                    format='0|0|0|1|1|4|0|1|1|1|1'
                    aligns='0|0|0|0|0|0|0|0|0|0|0'
                    defaults='||||||||||'
                    editcol='1|1|1|1|1|1|1|1|1|1|1'
                    widths='0|1500|2000|1500|1500|1200|1500|1500|1500|1500|1500'
                    sorting='F'
                    styles='width:100%; height:100%'
                    />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../system/images/up.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!------------------------------------------------------------------------------------------->
    <gw:textbox id="txtMaster_PK" style="display: none" />
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txt_user_pk" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------------------------->
</body>
</html>
