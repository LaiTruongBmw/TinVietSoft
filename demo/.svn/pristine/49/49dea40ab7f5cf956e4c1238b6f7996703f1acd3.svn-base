<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Stock Booking</title>
</head>

<script>
 var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
 var  user_name = "<%=Session("USER_NAME")%>"  ;
    //columns of grdMaster
	var G1_DELI_TO_PK               = 0,
		G1_PARTNER_NAME				= 1,
		G1_ORDER_DT					= 2,
		G1_SO_M_PK					= 3,		
		G1_SLIP_NO					= 4,
		G1_SO_D_PK					= 5,		
		G1_SO_ITEM_NO				= 6,
		G1_TCO_ITEM_PK				= 7,
		G1_ITEM_CODE				= 8,
		G1_ITEM_NAME				= 9,
		G1_UOM						= 10,
		G1_ITEM_ETD					= 11,		 
		G1_ORD_QTY					= 12,
		G1_SUBMITTED_QTY			= 13,
		G1_APPROVED_QTY				= 14,
		G1_ISSUE_QTY				= 15; 
    //columns of the grdDetail
    var G2_CHK                      = 0,                                                 
        G2_STATUS                   = 1,
        G2_DETAIL_PK                = 2,        
        G2_TCO_ITEM_PK              = 3,    
        G2_BOOK_ITEM_PK             = 4,
        G2_ITEM_CODE                = 5,
        G2_ITEM_NAME                = 6,
        G2_UOM                      = 7,
        G2_LOT_NO                   = 8,
        G2_BOOK_QTY                 = 9,
        G2_REF_NO                   = 10,
        G2_BOOK_DATE                = 11,
		G2_TIN_WAREHOUSE_PK         = 12,
        G2_WH_NAME                  = 13,
        G2_EMP_PK                   = 14,    
        G2_FULL_NAME                = 15,
        G2_DESCRIPTION		        = 16,
        G2_SO_D_PK                  = 17;

//=================================================================================
	        
function BodyInit()
{
    System.Translate(document); 
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>";
	
    dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-30));    
    //--------------------

    OnFormatGrid();
    // ------------------------
}

//=================================================================================

function OnFormatGrid()
{
	 var data = '';	
	
     sData = "DATA|O|Order Date|E|ETD";

     idList.SetDataText(sData);	
	 //---------------------------------
	 
     grdMaster.GetGridControl().MergeCells  = 2 ;	
     grdMaster.GetGridControl().MergeCol(0) = true ;	
     grdMaster.GetGridControl().MergeCol(1) = true ;   	
     grdMaster.GetGridControl().MergeCol(2) = true ;
	 grdMaster.GetGridControl().MergeCol(3) = true ;	
	 grdMaster.GetGridControl().MergeCol(4) = true ;	
	 grdMaster.GetGridControl().MergeCol(5) = true ;	
	 grdMaster.GetGridControl().MergeCol(6) = true ;		
	 
	 var ctrl = grdMaster.GetGridControl();     
     ctrl.ColFormat(G1_ORD_QTY)	      = "###,###,###.##";	 	
	 ctrl.ColFormat(G1_SUBMITTED_QTY) = "###,###,###.##";	
	 ctrl.ColFormat(G1_APPROVED_QTY)  = "###,###,###.##";	
	 ctrl.ColFormat(G1_ISSUE_QTY)     = "###,###,###.##";	
	 
	 var ctrl = grdDetail.GetGridControl();     
     ctrl.ColFormat(G2_BOOK_QTY) = "###,###,###.##";	 	
	  
}

//=================================================================================

function OnAddNew(obj)
{
    switch (obj)
    {
        case "grdDetail" :
			 if ( grdMaster.row > 0 )
			 { 
	             var path = System.RootURL + "/form/bi/sb/bisb00051.aspx?p_wh_pk=" + "" + "&p_group_pk=" +"" + "&p_item=" + "" + "&p_cust=" + grdMaster.GetGridData( grdMaster.row, G1_PARTNER_NAME) ;
		         var object = System.OpenModal( path , 950 , 400 ,  'resizable:yes;status:yes');
				 
		         if ( object != null )
		         {
	                    for( var i=0; i < object.length; i++)	  
	                    {	                          
	                   			var arrTemp = object[i];
	        
	                            grdDetail.AddRow();    	 
								//-------------  							    
	                            grdDetail.SetGridText(grdDetail.rows-1, G2_TIN_WAREHOUSE_PK, arrTemp[0]);	
								grdDetail.SetGridText(grdDetail.rows-1, G2_WH_NAME,          arrTemp[1]);    
	                            grdDetail.SetGridText(grdDetail.rows-1, G2_BOOK_ITEM_PK,     arrTemp[2]);	    
	                            grdDetail.SetGridText(grdDetail.rows-1, G2_ITEM_CODE,        arrTemp[3]);    
	                            grdDetail.SetGridText(grdDetail.rows-1, G2_ITEM_NAME,        arrTemp[4]);
								grdDetail.SetGridText(grdDetail.rows-1, G2_UOM,              arrTemp[5]);
								
								grdDetail.SetGridText(grdDetail.rows-1, G2_SO_D_PK, txtSODetailPK.text );
								//-------------
	                            grdDetail.SetGridText(grdDetail.rows-1, G2_LOT_NO, 	 arrTemp[6]);
	                            grdDetail.SetGridText(grdDetail.rows-1, G2_BOOK_QTY, arrTemp[11]);																								 		
	                    }		         
				 }
			 }
			 else
			 {
			 	alert("Pls Select 1 Valid Order Item !!!");
			 }
		break;
    }   
}

//=================================================================================

 function OnGridCellClick(obj)
 {
      switch (obj)         
      {		        
        case 'grdMaster' :
            OnSearch('grdDetail');
        break; 
      }  
 }

//=================================================================================
  
 function OnDataReceive(obj)
 {     
      switch (obj.id)         
      {		        
        case 'data_bisb00050' :			
			if ( grdMaster.rows > 1 )
	        {
				grdMaster.SetCellBold( 1, G1_PARTNER_NAME, grdMaster.rows - 1, G1_PARTNER_NAME, true); 
	            grdMaster.SetCellBold( 1, G1_SO_ITEM_NO,   grdMaster.rows - 1, G1_SO_ITEM_NO,   true);
				grdMaster.SetCellBold( 1, G1_ITEM_CODE,    grdMaster.rows - 1, G1_ITEM_CODE,    true);
				grdMaster.SetCellBold( 1, G1_ORD_QTY,      grdMaster.rows - 1, G1_ORD_QTY,      true);
				
				grdMaster.SetCellBgColor( 1, G1_ITEM_CODE, grdMaster.rows - 1, G1_ITEM_NAME, 0xCCFFFF );
				
				grdMaster.GetGridControl().Cell( 7, 1, G1_APPROVED_QTY, grdMaster.rows - 1, G1_APPROVED_QTY ) = 0x3300cc;
	        }  			                
        break; 
        
        case 'data_bisb00050_1':   
			if ( grdDetail.rows > 1 )
	        {
				grdDetail.SetCellBold( 1, G2_WH_NAME,   grdDetail.rows - 1, G2_WH_NAME,   true); 
	            grdDetail.SetCellBold( 1, G2_ITEM_CODE, grdDetail.rows - 1, G2_ITEM_CODE, true);
				grdDetail.SetCellBold( 1, G2_LOT_NO,    grdDetail.rows - 1, G2_LOT_NO,    true);
				grdDetail.SetCellBold( 1, G2_BOOK_QTY,  grdDetail.rows - 1, G2_BOOK_QTY,  true);
				
				grdDetail.SetCellBgColor( 1, G2_ITEM_CODE, grdDetail.rows - 1, G2_ITEM_NAME, 0xCCFFFF );
				
				grdDetail.GetGridControl().Cell( 7, 1, G2_BOOK_QTY, grdDetail.rows - 1, G2_BOOK_QTY ) = 0x3300cc;
				
				for ( var i=1; i<grdDetail.rows; i++ )
				{
					if ( grdDetail.GetGridData(i, G2_TCO_ITEM_PK) != grdDetail.GetGridData(i, G2_BOOK_ITEM_PK) )
					{
						grdDetail.GetGridControl().Cell( 7, i, G2_ITEM_CODE, i, G2_ITEM_NAME ) = 0x3300cc;
					}
				}	
	        }  	        
        break; 
		
		case 'pro_bisb00050':
			alert(txtReturnValue.text);
			OnSearch('grdDetail');
		break;
      }  
 }
 
//=================================================================================
  
 function OnSave(pos)
 {
      switch (pos)         
      {		        
        case 'grdDetail' :
            data_bisb00050_1.Call();
        break; 
      }  
 }
 
//=================================================================================

function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdMaster' : 						      
            data_bisb00050.Call("SELECT")            
        break;

        case 'grdDetail' :
			 if ( grdMaster.row > 0 )
			 {
                txtSODetailPK.text = grdMaster.GetGridData( grdMaster.row, G1_SO_D_PK ) ;
            	data_bisb00050_1.Call("SELECT");
             }
        break;
		
    }
}
 
//=================================================================================

function OnCellClick()
{
    OnSearch('grdDetail');
}

//=================================================================================

function OnDeleteClick()
{
        var ctrl = grdDetail.GetGridControl();
        var row  = ctrl.row;
        
        if ( row < 0 ) 
        {			
	            alert("Please select a Record to delete .");
        }			
        else 
        {
            if ( grdDetail.GetGridData( ctrl.row, G2_DETAIL_PK ) == "" ) 
            {						
				
			        grdDetail.RemoveRow();					
	        }
			
            else 
            {
	            if ( confirm( "Do you want to mark this row to delete?" ) ) 
	            {
		            grdDetail.DeleteRow();
	            }
            }
        }
	            
}

//=================================================================================
 
function OnUnDeleteClick()
{
	grdDetail.UnDeleteRow()
}

//=================================================================================

function OnProcess()
{
  	 var book_pk = "";
     var t_link = "";
            
     for( var i=1; i<grdDetail.rows; i++)
     {
         var b = grdDetail.GetGridData(i,G2_DETAIL_PK);
         
         if ( grdDetail.GetGridData(i,G2_CHK) == "-1" )
         {
            book_pk = book_pk + t_link + b ;
            t_link = ",";
         }
     }
     
     txtArrPK.text = book_pk;
     
     if(txtArrPK.text=="")
     {
         alert('You must select one slip to sumbmit.');
     }
     else
     {
          if ( confirm ('Do you want to Submit ?') )
          {
                 pro_bisb00050.Call();
          }       
     }
}
//=================================================================================

</script>

<body>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_bisb00050" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="lg_pro_bisb00050" > 
                <input>
					 <input bind="txtArrPK" />
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="data_bisb00050" onreceive="OnDataReceive(this)"> 
        <xml> 
             <dso id="1" type="grid" function="lg_sel_bisb00050" > 
                 <input bind="grdMaster" > 
                     <input bind="idList" /> 
                     <input bind="dtFrom" /> 
                     <input bind="dtTo" />  
                     <input bind="txtSOPONo" />                        
                     <input bind="txtItem" /> 
					 <input bind="chkBalance" />
					 <input bind="txtEmpPK" />
					 <input bind="chkUser" />
                  </input> 
                 <output bind="grdMaster" /> 
             </dso> 
         </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="data_bisb00050_1" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="2" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" function="lg_sel_bisb00050_1"  procedure="lg_upd_bisb00050_1" > 
                    <input bind="grdDetail" > 
                        <input bind="txtSODetailPK" />
                     </input> 
                    <output bind="grdDetail" /> 
                </dso> 
            </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr style="height: 100%">
                        <td style="width: 10%">
                            <gw:list id="idList" styles="color:blue;width:100%" value="O" onchange="OnSearch('grdMaster')" />
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            <b>SO/PO No</b>
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtSOPONo" styles="width:100%" onenterkey="OnSearch('grdMaster')" />
                        </td>
                        <td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 15%" align="right">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('grdMaster')" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Bal
                            <gw:checkbox id="chkBalance" defaultvalue="Y|N" value="Y" onclick="OnSearch('grdMaster')" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            User
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdMaster')" />
                        </td>
                        <td style="width: 9%" align="left">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch('grdMaster')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td>
                <gw:grid id='grdMaster' header='_deli_to_pk|Partner|Order DT|_SO_M_PK|SO/PO No|_SO_D_PK|S/O Item No|_Tco_item_pk|Item Code|Item Name|UOM|ETD|Ord Qty|Submit Qty|Approve Qty|Issue Qty'
                    format='0|0|4|0|0|0|0|0|0|0|0|4|0|0|0|0' aligns='0|0|1|0|0|0|0|0|0|0|1|1|3|3|3|3'
                    check='|||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|3000|1200|0|1500|0|1500|0|1500|3000|800|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' oncellclick='OnGridCellClick("grdMaster")' />
            </td>
        </tr>
        <tr style="height: 5%">
            <td style="width: 100%">
                <table width="100%">
                    <tr>
                        <td style="width: 92%" align="left">
                            <gw:icon id="idBtnSubmit" img="2" text="Submit" styles='width:5%' onclick="OnProcess()" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn img="new" alt="New Booking From Stock" id="btnAddNew" onclick="OnAddNew('grdDetail')" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn img="delete" alt="OnDelete" id="btnDelete" onclick="OnDeleteClick()" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn img="udelete" alt="OnUnDelete" id="btnUnDelete" onclick="OnUnDeleteClick()" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn img="save" alt="Save" id="btnAddSave" onclick="OnSave('grdDetail')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 45%">
            <td>
                <gw:grid id='grdDetail' header='Chk|Status|_DETAIL_PK|_Tco_item_pk|_Book_item_pk|Item Code|Item Name|UOM|Lot No|Book Qty|Ref No|Book Date|_WH_PK|W/H|_Emp_pk|Charger|Remark|_Tsa_saleorderd_pk'
                    format='3|0|0|0|0|0|0|0|0|1|0|4|0|0|0|0|0|0' aligns='0|1|0|0|0|0|0|1|1|0|0|1|0|0|0|0|0|0'
                    check='|||||||||||||||||' editcol='1|0|0|0|0|0|0|0|1|1|1|1|0|0|0|0|1|0' widths='800|1200|0|0|0|1500|2500|800|1200|1200|1500|1200|0|2500|0|1500|1200|0'
                    sorting='T' acceptnulldate="T" styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------->
    <gw:textbox id="txtSODetailPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtEmpPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtArrPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <!-------------------------------------------------------------------->
</body>
</html>
