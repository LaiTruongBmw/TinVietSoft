<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head >
    <title>G/D Plan Detail</title>
</head>

<script  >

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
          
    var G1_DELI_TO_PK           = 0,
        G1_PARTNER      		= 1,
		G1_PO_NO                = 2,
        G1_REQ_SO_D_PK          = 3,
        G1_SO_ITEM_NO           = 4,        
        G1_DELI_ITEM_PK         = 5,
        G1_ITEM_CODE            = 6,
        G1_ITEM_NAME            = 7,
        G1_GD_PLAN_M_PK         = 8,
        G1_PLAN_DATE            = 9,
        G1_PLAN_QTY             = 10,
        G1_STOCK_QTY            = 11,
        G1_BAL_QTY              = 12,
        G1_GD_OUTGO_M_PK        = 13,
		G1_OUTGO_SLIP_NO		= 14,
		G1_CHK                  = 15; 
       
    var G2_DETAIL_PK            = 0,
        G2_MASTER_PK         	= 1,
        G2_SEQ                  = 2,
        G2_DELI_ITEM_PK         = 3,
        G2_STOCK_ITEM_PK        = 4,
        G2_ITEM_CODE            = 5,
        G2_ITEM_NAME            = 6,
        G2_UOM                  = 7,
        G2_LOT_NO               = 8,
        G2_STOCK_QTY            = 9,
        G2_SO_ITEM_NO           = 10,
        G2_PARTNER_ID_NAME      = 11,
        G2_TIN_WAREHOUSE_PK     = 12,
        G2_WH_NAME              = 13,
        G2_DESCRIPTION          = 14,
		G2_REQ_SO_D_PK			= 15,
		G2_STOCK_SO_D_PK		= 16;				
		
var arr_FormatNumber = new Array(); 		
//==================================================================================================
	
 function BodyInit()
 {
    System.Translate(document);
    txtEmployeePK.text = "<%=Session("EMPLOYEE_PK")%>" ;
    //---------------------------
    FormatGrid();
    //---------------------------
    dtTo.SetDataText(System.AddDate(dtFrom.GetData(),30));
	
    OnSearch('grdMaster');
 }
 
//==================================================================================================

 function FormatGrid()
 {	
      grdDetail.GetGridControl().ColFormat(G2_STOCK_QTY) = "###,###,###,###,###";
	  
	  arr_FormatNumber[G2_STOCK_QTY]           = 0;
	  
	  grdMaster.GetGridControl().ColFormat(G1_PLAN_QTY)  = "###,###,###,###,###";
	  grdMaster.GetGridControl().ColFormat(G1_STOCK_QTY) = "###,###,###,###,###";
	  grdMaster.GetGridControl().ColFormat(G1_BAL_QTY)   = "###,###,###,###,###";
      //------------------------------------------------        
 	  grdMaster.GetGridControl().MergeCells  = 2 ;	
	  grdMaster.GetGridControl().MergeCol(0) = true; 
	  grdMaster.GetGridControl().MergeCol(1) = true; 
	  grdMaster.GetGridControl().MergeCol(2) = true;
	  grdMaster.GetGridControl().MergeCol(3) = true;
	  grdMaster.GetGridControl().MergeCol(4) = true;
	  grdMaster.GetGridControl().MergeCol(5) = true;
	  grdMaster.GetGridControl().MergeCol(6) = true;
	  grdMaster.GetGridControl().MergeCol(7) = true;     
	  
	  grdMaster.GetGridControl().Cell( 7, 0, G1_OUTGO_SLIP_NO, 0, G1_OUTGO_SLIP_NO ) = 0x3300cc;
	  grdDetail.GetGridControl().Cell( 7, 0, G2_STOCK_QTY,     0, G2_STOCK_QTY     ) = 0x3300cc;  
 }
//==================================================================================================
 function OnSearch(id)
 {
    switch (id)
    {            
        case 'grdMaster' : 
            data_dscd00080.Call("SELECT");            
        break;
         
        case 'grdDetail' :
		    var t_comma = "" ;
			
			txtMasterPK.text = "" ;
			lblSOItemNo.text = "" ;
			  
			for ( var i=1; i < grdMaster.rows; i++ )
			{
				if ( grdMaster.GetGridData( i, G1_CHK) == -1 )
				{ 
					txtMasterPK.text = txtMasterPK.text + t_comma + grdMaster.GetGridData( i, G1_GD_PLAN_M_PK );
					lblSOItemNo.text = lblSOItemNo.text + t_comma + grdMaster.GetGridData( i, G1_SO_ITEM_NO   );
					t_comma = ",";
				}
			}

			if ( txtMasterPK.text == "" && grdMaster.row > 0 ) 
			{  
				txtMasterPK.text = grdMaster.GetGridData( grdMaster.row, G1_GD_PLAN_M_PK ); 
				lblSOItemNo.text = grdMaster.GetGridData( grdMaster.row, G1_SO_ITEM_NO   );
			}
			
            data_dscd00080_1.Call("SELECT");            
        break;                
                       
    }
 }
 
//==================================================================================================
 function OnPopUp()
 {   
     if ( grdMaster.row > 0 )
     { 
         var path = System.RootURL + '/standard/forms/ds/cd/dscd00081.aspx';
         var object = System.OpenModal( path , 1050 , 600 ,  'resizable:yes;status:yes', this);
    	 
         if ( object != null )
         {
                for( var i=0; i < object.length; i++)	  
                {	                          
           			    var arrTemp = object[i];

                        grdDetail.AddRow();    	
					    //------------- 
					    grdDetail.SetGridText(grdDetail.rows-1, G2_MASTER_PK, grdMaster.GetGridData( grdMaster.row, G1_GD_PLAN_M_PK));
                        grdDetail.SetGridText(grdDetail.rows-1, G2_SEQ,       grdDetail.rows-1 );							   
	
                        grdDetail.SetGridText(grdDetail.rows-1, G2_STOCK_ITEM_PK, arrTemp[2]);//_BOOK_ITEM_PK	    
                        grdDetail.SetGridText(grdDetail.rows-1, G2_ITEM_CODE,     arrTemp[3]);  //Item Code  
                        grdDetail.SetGridText(grdDetail.rows-1, G2_ITEM_NAME,     arrTemp[4]);//Item Name
						grdDetail.SetGridText(grdDetail.rows-1, G2_UOM,           arrTemp[5]); //uom
						 
					    grdDetail.SetGridText(grdDetail.rows-1, G2_LOT_NO,        arrTemp[6]); //Lot No   	
					       				
					    grdDetail.SetGridText(grdDetail.rows-1, G2_STOCK_QTY,     arrTemp[9]); //res Qty
						
					    grdDetail.SetGridText(grdDetail.rows-1, G2_SO_ITEM_NO,      arrTemp[10]);//SO Item No
                        grdDetail.SetGridText(grdDetail.rows-1, G2_PARTNER_ID_NAME, arrTemp[11]);//Partner Name
						
                        grdDetail.SetGridText(grdDetail.rows-1, G2_TIN_WAREHOUSE_PK, arrTemp[0]);//_TIN_WAREHOUSE_PK
                        grdDetail.SetGridText(grdDetail.rows-1, G2_WH_NAME,          arrTemp[1]);//WH Name
                }		         
	     }
     }
     else
     {
 	    alert("Pls Select 1 Valid Order Item !!!");
     }			 
 }
 
//==================================================================================================

 function OnDataReceive(obj)
 {
    switch (obj.id)
    {
        case 'data_dscd00080' : 
			btnAutoDeli.SetEnable(false);
			btnCancelDeli.SetEnable(false);
			
			txtMasterPK.text = "";
			lblSOItemNo.text = "";
			
			grdDetail.ClearData();
			
			if ( grdMaster.rows > 1 )			
			{
				grdMaster.GetGridControl().Cell( 7, 0, G1_OUTGO_SLIP_NO, grdMaster.rows-1, G1_OUTGO_SLIP_NO ) = 0x3300cc;
				
				grdMaster.SetCellBold( 1, G1_OUTGO_SLIP_NO, grdMaster.rows-1, G1_OUTGO_SLIP_NO, true);				
				grdMaster.SetCellBold( 1, G1_PO_NO,         grdMaster.rows-1, G1_PO_NO,         true);
				grdMaster.SetCellBold( 1, G1_ITEM_CODE,     grdMaster.rows-1, G1_ITEM_CODE,     true);
				
				grdMaster.SetCellBgColor( 1, G1_PLAN_QTY , grdMaster.rows - 1, G1_BAL_QTY , 0xCCFFFF );
			}                         
        break;
		
        case 'data_dscd00080_1':
            for ( var i=1; i<grdDetail.rows; i++ )
			{
				if ( grdDetail.GetGridData( i, G2_STOCK_ITEM_PK) != grdDetail.GetGridData( i, G2_DELI_ITEM_PK) )
                {
                     grdDetail.GetGridControl().Cell( 7, i, G2_ITEM_CODE, i, G2_ITEM_NAME ) = 0x3300cc;
                }
				//------
				if ( grdDetail.GetGridData( i, G2_REQ_SO_D_PK) != grdDetail.GetGridData( i, G2_STOCK_SO_D_PK) )
                {
                     grdDetail.GetGridControl().Cell( 7, i, G2_SO_ITEM_NO, i, G2_SO_ITEM_NO ) = 0xFF0033;
                }
			}  
			
			if ( grdDetail.rows > 1 )			
			{			
				grdDetail.SetCellBold( 1, G2_ITEM_CODE, grdDetail.rows-1, G2_ITEM_CODE, true);
				
				grdDetail.GetGridControl().Cell( 7, 1, G2_STOCK_QTY, grdDetail.rows-1, G2_STOCK_QTY ) = 0x3300cc;
				grdDetail.SetCellBgColor( 1, G2_STOCK_QTY , grdDetail.rows - 1, G2_STOCK_QTY , 0xCCFFFF );
			} 
        break;
		
        case 'pro_dscd00080':
			alert(txtReturnValue.text);
			
            OnSearch('grdMaster');
        break;
			
        case 'pro_dscd00080_1':
			alert(txtReturnValue.text);
			
            OnSearch('grdMaster');
        break;                                                    
    }
 }
//================================================================================================== 
 function OnGridCellClick(objGrid)
 {
 		if ( objGrid.row > 0 )
    	{	
			if ( objGrid.GetGridData(objGrid.row, G1_GD_OUTGO_M_PK) > 0)
			{
				btnAutoDeli.SetEnable(false);	
				btnCancelDeli.SetEnable(true);			
			}
			else
			{
				btnAutoDeli.SetEnable(true);
				btnCancelDeli.SetEnable(false);
			}
			//------    		    	    			  
        	OnSearch('grdDetail');
		}	    	    	   
 } 

//==================================================================================================
 function OnSave(pos)
 {
    switch (pos.id)
    {
        case "grdDetail" :
            data_dscd00080_1.Call();
        break;        
    }
 }

//==================================================================================================

 function OnDelete()
 {    
	if ( grdDetail.GetGridData( grdDetail.row, G2_DETAIL_PK ) == "" ) 
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
 
//==================================================================================================
function OnProcess(pos)
{
	switch(pos)
	{
		case 'DELI' :
			txtMasterPK.text  = "";
			txtPartnerPK.text = "";			
			txtRefNo.text     = "";
			
			var t_comma = "" ;
			var t_comma02 = "" ;
			var l_po_no = "" ;
			 
	 		for ( var i=1; i < grdMaster.rows; i++ )
			{
				if ( grdMaster.GetGridData( i, G1_CHK) == -1 )
				{ 
					if ( txtPartnerPK.text != "" && txtPartnerPK.text != grdMaster.GetGridData( i, G1_DELI_TO_PK ))
					{
						alert("DIFFERENCE CUSTOMNER !!!");
						return;
					}
					else
					{
						txtPartnerPK.text = grdMaster.GetGridData( i, G1_DELI_TO_PK );
					}
										
					txtMasterPK.text = txtMasterPK.text + t_comma + grdMaster.GetGridData( i, G1_GD_PLAN_M_PK );					
					t_comma = ",";
					
					if ( l_po_no != grdMaster.GetGridData( i, G1_PO_NO ) )
					{
						l_po_no = grdMaster.GetGridData( i, G1_PO_NO );
						txtRefNo.text = txtRefNo.text + t_comma02 + grdMaster.GetGridData( i, G1_PO_NO );
						t_comma02 = ",";
					}
				}
			}
			
			if ( txtMasterPK.text != "" )
			{			
	        	if ( confirm ('Do you want to make Delivery slip for ' + txtRefNo.text + ' ?'))
	        	{
	            	pro_dscd00080.Call();
	        	}
			}		
			else
			{
				alert("PLS CHECK ON THE PLAN BEFORE MAKE DELIVERY SLIP !!! ");
			}			
		break;
		
		case 'CANCEL' :
			if ( grdMaster.row > 0 && grdMaster.GetGridData( grdMaster.row, G1_GD_OUTGO_M_PK) > 0 )
			{
				txtOutGoPK.text = grdMaster.GetGridData( grdMaster.row, G1_GD_OUTGO_M_PK);
				
				if ( confirm("Do you want to cancel delivery slip " + grdMaster.GetGridData( grdMaster.row, G1_OUTGO_SLIP_NO) + " ?"))
				{															
					pro_dscd00080_1.Call();
				}
			}
		break;
	}
}

//==================================================================================================
 
function CheckInput()
{
	var  row, col;
	
    row = event.row ;
    col = event.col ;    
         
    if ( col == G2_STOCK_QTY)
    {
        var dQuantiy =  grdDetail.GetGridData(row,col);
        
        if (Number(dQuantiy))
        {               
           grdDetail.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[G2_STOCK_QTY] ));
        }   
        else
        {
            grdDetail.SetGridText(row,col,"")
        }       
    } 
}
//==================================================================================================
function OnGridCellDoubleClick(obj)
{
	switch(obj.id)
	{
		case 'grdMaster':
			if ( event.col == G1_OUTGO_SLIP_NO )
			{
         		var path = System.RootURL + '/standard/forms/ds/cd/dscd00070.aspx?outgo_m_pk='+ grdMaster.GetGridData( grdMaster.row, G1_GD_OUTGO_M_PK) ;
         		var object = System.OpenModal( path , 1000 , 600 ,  'resizable:yes;status:yes');			
			}	
		break;
	}
}
//==================================================================================================
</script>

<body>
    <!-----------------------------------Auto deli------------------------------->
    <gw:data id="pro_dscd00080" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process"  procedure="st_lg_pro_dscd00080" > 
                <input>
                    <input bind="txtMasterPK" /> 
                    <input bind="txtPartnerPK" />
					<input bind="txtRefNo" />
					<input bind="txtEmployeePK" />
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------------------Kiem tra xem trong DB co duoc process chua------------------------------->
    <gw:data id="pro_dscd00080_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process"  procedure="st_lg_pro_dscd00080_1" > 
                <input>
                    <input bind="txtOutGoPK" />
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------------------Request Master------------------------------->
    <gw:data id="data_dscd00080" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="st_lg_sel_dscd00080"  > 
                <input>
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                    <input bind="txtSlipCust" /> 
                    <input bind="txtItem" /> 
					<input bind="chkBal" />
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------Request Detail-------------------------------->
    <gw:data id="data_dscd00080_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="st_lg_sel_dscd00080_1"  procedure="st_lg_upd_dscd00080_1" > 
                <input>
                    <input bind="txtMasterPK" />  
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------LAYOUT FORM------------------------------------------>
    <table style="width: 100%; height: 100%" >
        <tr style="height: 1%">
            <td style="width: 100%">
                <table width="100%">
                    <tr>
                        <td style="width: 5%" align=right>
                            <b>Date</b>
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" styles="width=80%" />                        
                            ~
                            <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" styles="width=80%" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align=right>
                            <b>Slip/Cust</b>
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtSlipCust" styles='width:100%;' onenterkey="OnSearch('grdMaster')" />
                        </td>
                        <td style="width: 5%" align=right>
                            <b>Item</b>
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtItem" styles='width:100%;' onenterkey="OnSearch('grdMaster')" />
                        </td>
						<td style="width: 20%" align="center">
							<gw:checkbox id="chkBal" styles="color:red" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdMaster')" >Deli Bal</gw:checkbox>
						</td>
                        <td style="width: 7%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdMaster')" />
                        </td>
						<td style="width: 1%" align="right">
                            <gw:button id="btnCancelDeli" img="cancel" text="Cancel Deli" onclick="OnProcess('CANCEL')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnAutoDeli" img="Auto" text="Auto Deli" onclick="OnProcess('DELI')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td style="width: 100%">
                <gw:grid id='grdMaster' header='_DELI_TO_PK|Partner|P/O No|_TSA_SALEORDER_D_PK|S/O Item No|_DELI_ITEM_PK|Item Code|Item Name|_PK|Plan Date|Plan Qty|Book Qty|Bal Qty|_OUTGO_PK|Deli Slip No|Chk'
                    format='0|0|0|0|0|0|0|0|0|4|0|0|0|0|0|3' 
					aligns='0|0|0|0|1|0|0|0|0|1|3|3|3|0|1|0'
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|3000|1500|0|1800|0|1500|3000|0|1200|1200|1200|1200|0|1500|500'
                    sorting='T' styles='width:100%; height:100%' oncellclick='OnGridCellClick(this)' oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr style="height: 10%">                        
                        <td style="width: 97%" align="left">
                            <gw:label id="lblSOItemNo" styles="color:teal" />
                        </td>                        
                        <td style="width: 1%" align="right">
                            <gw:button id="btnViewDetail" img="View Detail" text="View Detail" onclick="OnPopUp()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSave" img="save" alt="Save" onclick="OnSave(grdDetail)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td style="width: 100%">
				<gw:grid id='grdDetail' header='_PK|_GD_PLAN_M_PK|Seq|_DELI_ITEM_PK|_STOCK_ITEM_PK|Item Code|Item Name|UOM|Lot No|Stock Qty|S/O Item No|Partner|_WH_PK|W/H|Remark|_REQ_SO_D_PK|_STOCK_SO_D_PK'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|0|0|0|0|1|1|3|1|0|0|0|0|0|0'
					editcol='0|0|1|0|0|0|0|0|0|1|0|0|0|0|1|0|0' 
					widths='0|0|800|0|0|1500|3500|800|1500|1200|1800|2500|0|2000|1000|0|0'
                    sorting='T' styles='width:100%; height:100%' onafteredit='CheckInput()' />				 														 					
            </td>
        </tr>
    </table>
    <!-------------------------Hiden control------------------>
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />    
    <gw:textbox id="txtPartnerPK" styles='width:100%;display:none' />
    <gw:textbox id="txtEmployeePK" styles='width:100%;display:none' />
    <gw:textbox id="txtRefNo" styles='width:100%;display:none' />
	<gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
	
	<gw:textbox id="txtOutGoPK" styles='width:100%;display:none' />
	<!-------------------------Hiden control------------------>
</body>
</html>
