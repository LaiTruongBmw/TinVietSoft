<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 
<head runat="server">
    <title>B/C Checking</title>
</head>

<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 

var user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
var user_name  = "<%=Session("USER_NAME")%>" ;             
 
var G2_INCOME_PK        = 0,
    G2_TRANS_CODE       = 1,
    G2_IN_DATE          = 2,
    G2_REQ_ITEM_PK      = 3,
    G2_REQ_ITEM_CODE    = 4,
    G2_REQ_ITEM_NAME    = 5,
    G2_IN_ITEM_PK       = 6,
    G2_IN_ITEM_CODE     = 7,
    G2_IN_ITEM_NAME     = 8,
    G2_IN_QTY_01        = 9,
    G2_IN_UOM_01        = 10,
    G2_IN_QTY_02        = 11,
    G2_IN_UOM_02        = 12,
    G2_UNIT_PRICE       = 13,
    G2_AMOUNT           = 14,
    G2_CCY              = 15,
    G2_LOT_NO           = 16,
    G2_ITEM_BC          = 17,
    G2_REF_NO           = 18,
    G2_WAREHOUSE_PK     = 19,
    G2_SUPPLIER_PK      = 20,
    G2_SUPPLIER_NAME    = 21,
    G2_ABPL_PK          = 22,
    G2_PL_NM            = 23,
    G2_CHARGER_PK       = 24,
    G2_FULL_NAME        = 25,
    G2_PO_PO_D_PK       = 26,
    G2_QC_IREQ_D_PK     = 27,
    G2_DESCRIPTION      = 28;
    
//=====================================================================================
function BodyInit()
 {
    System.Translate(document); 
      //---------------------- 
      dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-7));      
      //----------------------
      OnFormatGrid();      
      //----------------------
      OnToggleGrid();
 }      
 
//=====================================================================================
 function OnFormatGrid()
 {
    var data ;

    data = "<%=ESysLib.SetListDataSQL("SELECT TRANS_CODE,TRANS_CODE || ' - ' || trans_name  FROM tlg_in_trans_code  WHERE del_if = 0  ORDER BY trans_code" )%>||";    
    lstTransType.SetDataText(data);                     
    lstTransType.value = '' ;
    
    data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT TRANS_CODE,TRANS_CODE || ' - ' || trans_name  FROM tlg_in_trans_code  WHERE del_if = 0  ORDER BY trans_code " ) %> ";       
    grdDetail.SetComboFormat(G2_TRANS_CODE,data); 
    
    data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT PK, wh_id || ' - ' || wh_name FROM tlg_in_warehouse WHERE DEL_IF = 0 AND USE_YN = 'Y' order by wh_id " ) %> ";       
    grdDetail.SetComboFormat(G2_WAREHOUSE_PK,data);                        
 
    var trl ;
    
    trl = grdDetail.GetGridControl();
    trl.ColFormat(G2_IN_QTY_01)  = "###,###,###,###,###.##";
    trl.ColFormat(G2_IN_QTY_02)  = "###,###,###,###,###.##";
    trl.ColFormat(G2_UNIT_PRICE) = "###,###,###,###,###.##";
    trl.ColFormat(G2_AMOUNT)     = "###,###,###,###,###.##";
        
    grdDetail.GetGridControl().Cell( 7, 0, G2_TRANS_CODE,   0, G2_TRANS_CODE)   = 0x3300cc;
    grdDetail.GetGridControl().Cell( 7, 0, G2_WAREHOUSE_PK, 0, G2_WAREHOUSE_PK) = 0x3300cc;
 }

//=====================================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		                    
            case 'Detail' :
                data_epfm00140.Call("SELECT");   
            break;             
      }  
 }

//=====================================================================================
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
            case "data_epfm00140" :
                if ( grdDetail.rows > 1 )
                {
                    grdDetail.SetCellBold( 1, G2_IN_QTY_01, grdDetail.rows - 1, G2_IN_QTY_01, true);
                    grdDetail.SetCellBold( 1, G2_IN_QTY_02, grdDetail.rows - 1, G2_IN_QTY_02, true);
                    grdDetail.SetCellBold( 1, G2_LOT_NO, grdDetail.rows - 1, G2_LOT_NO, true);
                    grdDetail.SetCellBold( 1, G2_REF_NO, grdDetail.rows - 1, G2_REF_NO, true);
                    
                    for ( var i = 1 ; i < grdDetail.rows ; i++)
                    {
                        if ( Number(grdDetail.GetGridData( i, G2_REQ_ITEM_PK)) > 0 && ( grdDetail.GetGridData( i, G2_REQ_ITEM_PK) != grdDetail.GetGridData( i, G2_IN_ITEM_PK) ) )
                        {
                            grdDetail.GetGridControl().Cell( 7, i, G2_IN_ITEM_CODE, i, G2_IN_ITEM_NAME ) = 0x3300cc;
                        }
                    }                      
                }
            break;                         
      }  
 }
 
//=====================================================================================
 
 function OnSave(pos)
 {
      switch (pos)         
      {		                    
            case 'Detail' :
                data_epfm00140.Call();
            break;
      }  
 }

//=====================================================================================
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdDetail" :    
                var event_col = event.col ;
                var event_row = event.row ;
                                         
                if ( ( event_col == G2_FULL_NAME ) && event_row > 0 )
                {                      
                     var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
	                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	                 
	                 if ( obj != null )
	                 {
                         grdDetail.SetGridText( event_row, G2_CHARGER_PK, obj[0] ); //emp_pk
                         grdDetail.SetGridText( event_row, G2_FULL_NAME,  obj[2] ); //emp_name           	                          
                     }	                
                }
                else if ( event_col == G2_IN_UOM_01 || event_col == G2_IN_UOM_02 )
                {
                       var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
	                   var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                   if ( obj != null )
	                   {
	                        grdDetail.SetGridText( event_row, event_col, obj[1]);
	                   }	
                }
                else if ( event_col == G2_IN_ITEM_CODE || event_col == G2_IN_ITEM_NAME )
                {
                       var path = System.RootURL + '/form/fp/ab/fpab00110.aspx?group_type=||Y|Y||';
                       var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                       
                       if ( object != null )
                       {
                            grdDetail.SetGridText( event_row, G2_IN_ITEM_PK,   object[0] );
                            grdDetail.SetGridText( event_row, G2_IN_ITEM_CODE, object[1] );
                            grdDetail.SetGridText( event_row, G2_IN_ITEM_NAME, object[2] );
                       }                       
                } 
                else if ( event_col == G2_SUPPLIER_NAME )
                {
                       var path = System.RootURL + "/form/fp/ab/fpab00120.aspx?partner_type=AP";
                       var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                       
                       if ( object != null )
                       {
                            grdDetail.SetGridText( event_row, G2_SUPPLIER_PK,   object[0] );
                            grdDetail.SetGridText( event_row, G2_SUPPLIER_NAME, object[2] );
                       }                       
                }  
                else if ( event_col == G2_PL_NM )
                {
                       var path = System.RootURL + "/form/bd/dp/bddp00012.aspx";
                       var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                       
                       if ( object != null )
                       {
                            grdDetail.SetGridText( event_row, G2_ABPL_PK, object[0] );
                            grdDetail.SetGridText( event_row, G2_PL_NM,   object[2] );
                       }                       
                }                                                              
            break;             
      }         
}   

//=====================================================================================
function OnAddNew(pos)
{
    if ( lstTransType.value == '' )
    {
        alert("Pls select transaction code first.");
        return;
    }
    
    switch (pos)
	{
        case 'FreeItem':
             var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=||Y|Y||';//purchase_yn=Y
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_TRANS_CODE, lstTransType.value );//trans_code
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_ITEM_PK,   arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_ITEM_CODE, arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_ITEM_NAME, arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_UOM_01,    arrTemp[5]);//item_uom
                            grdDetail.SetGridText( grdDetail.rows-1, G2_UNIT_PRICE,   arrTemp[7]);//Price                            
                    }		            
             }        
        break;  
        
        case 'PO':
             var path = System.RootURL + '/form/fp/ab/fpab00020.aspx?type=INCOME';
             var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
             if ( object != null )
             {
                    var arrTemp
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REF_NO,     arrTemp[1]);//PO No
                            grdDetail.SetGridText( grdDetail.rows-1, G2_PO_PO_D_PK, arrTemp[5]);//PO Detail PK	    
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_ITEM_PK,  arrTemp[7]);//item_pk
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_ITEM_PK,   arrTemp[7]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_ITEM_CODE, arrTemp[8]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_ITEM_NAME, arrTemp[9]);//item_name
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_QTY_01, arrTemp[12]);//in qty 01	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_UOM_01, arrTemp[13]);//item_uom
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_QTY_02, arrTemp[16]);//in qty 02
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_UOM_02, arrTemp[17]);//uom
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_UNIT_PRICE, arrTemp[19] );//Item Price
                            
                            var dQuantiy = grdDetail.GetGridData( grdDetail.rows-1, G2_IN_QTY_01) ;
                            var dPrice   = grdDetail.GetGridData( grdDetail.rows-1, G2_UNIT_PRICE) ;
                            
                            if(dQuantiy!=""&& dPrice!="")
                            {    
                                var dAmount = dQuantiy * dPrice;
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G2_AMOUNT, parseFloat(dAmount+"").toFixed(2));
                            }
                            else
                            {
                                grdDetail.SetGridText( grdDetail.rows-1, G2_AMOUNT,"");
                            }                                                                    
                    }		            
             }        
        break;           
    }    
}

//=====================================================================================
function OnDelete(obj)
 {
    var ctrl = obj.GetGridControl();
	var row  = ctrl.row;
	
	if ( row > 0 ) 
	{
		if ( obj.GetGridData( ctrl.row, 0 ) == "" ) 
		{						
			obj.RemoveRow();					
		}		
		else 
		{
			if ( confirm( " Do you want to mark this row to delete ? " ) ) 
			{
				obj.DeleteRow();
			}
		}
	}
 }

//=====================================================================================
 function OnUnDelete(obj) 
 {
	var ctrl = obj.GetGridControl();

	if ( ctrl.row > 0 ) 
	{
		if ( confirm ( "Do you want to undelete?" ) ) 
		{				
			obj.UnDeleteRow();
		}
	}
}

//=====================================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";

		grdDetail.GetGridControl().ColHidden(G2_REQ_ITEM_CODE) = true ;
		grdDetail.GetGridControl().ColHidden(G2_REQ_ITEM_NAME) = true ;
		grdDetail.GetGridControl().ColHidden(G2_IN_QTY_02)     = true ;
		grdDetail.GetGridControl().ColHidden(G2_IN_UOM_02)     = true ;
		grdDetail.GetGridControl().ColHidden(G2_LOT_NO)        = true ;
		grdDetail.GetGridControl().ColHidden(G2_ITEM_BC)       = true ;
        imgMaster.src = "../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";		
    }
    else
    {
        imgMaster.status = "expand";

		grdDetail.GetGridControl().ColHidden(G2_REQ_ITEM_CODE) = false ;
		grdDetail.GetGridControl().ColHidden(G2_REQ_ITEM_NAME) = false ;
		grdDetail.GetGridControl().ColHidden(G2_IN_QTY_02)     = false ;
		grdDetail.GetGridControl().ColHidden(G2_IN_UOM_02)     = false ;				
		grdDetail.GetGridControl().ColHidden(G2_LOT_NO)        = false ;
		grdDetail.GetGridControl().ColHidden(G2_ITEM_BC)       = false ;		

        imgMaster.src = "../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}

//=====================================================================================

 function CheckInput()
 {
    var col, row
    
    col = event.col
    row = event.row        
      
    if ( col == G2_IN_QTY_01 || col == G2_IN_QTY_02 || col == G2_UNIT_PRICE || col == G2_AMOUNT )
    {                
    //------------------------------------------                
        var dQuantiy ;
 
        dQuantiy =  grdDetail.GetGridData(row,col)
        if (Number(dQuantiy))
        {   
            grdDetail.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));
        }
        else
        {
            grdDetail.SetGridText(row,col,"")
        } 
    //------------------------------------------        
        if ( col == G2_IN_QTY_01 || col == G2_UNIT_PRICE )
        {
            dQuantiy = grdDetail.GetGridData( row, G2_IN_QTY_01) ;
            dPrice   = grdDetail.GetGridData( row, G2_UNIT_PRICE) ;
            
            if(dQuantiy!=""&& dPrice!="")
            {    
                var dAmount = dQuantiy * dPrice;
                
                grdDetail.SetGridText( row, G2_AMOUNT, parseFloat(dAmount+"").toFixed(2));
            }
            else
            {
                grdDetail.SetGridText( row, G2_AMOUNT,"");
            }            
        }        
	}

 }

//=========================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_epfm00140" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28" function="inv.sp_sel_epfm00140" procedure="inv.sp_upd_epfm00140"  > 
                <input> 
                    <input bind="lstTransType" /> 
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtItem" />
                    <input bind="txtSearchNo" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 1%" align="left">
                            <img status="expand" id="imgMaster" alt="Show all column" src="../../../system/images/close_popup.gif"
                                style="cursor: hand" onclick="OnToggleGrid()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Trans Type
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstTransType" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="left">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~
                            <gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Item
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="left">
                            <gw:textbox id="txtItem" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            No
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="left">
                            <gw:textbox id="txtSearchNo" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 3%">
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:icon id="idBtnPO" img="2" text="P/O" styles='width:100%' onclick="OnAddNew('PO')" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:icon id="idBtnFreeItem" img="2" text="Free Item" styles='width:100%' onclick="OnAddNew('FreeItem')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnDelete2" img="delete" alt="delete" onclick="OnDelete(grdDetail)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnUnDelete2" img="udelete" alt="Un Delete" onclick="OnUnDelete(grdDetail)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSave2" img="save" alt="Save" onclick="OnSave('Detail')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdDetail' header='_PK|Trans|Date|_REQ_ITEM_PK|Req Item Code|Req Item Name|_INCOME_ITEM_PK|In Item Code|In Item Name|In Qty 01|UOM|In Qty 02|UOM|U/Price|Amount|CCY|Lot No|Item BC|Ref No|W/H|_SUPPLIER_PK|Supplier|_TAC_ABPL_PK|P/L|_CHARGER_PK|Charger|_PO_PO_D_PK|_QC_IREQ_D_PK|Description'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0|0|3|1|3|1|3|3|1|1|1|0|0|0|0|0|0|0|0|0|0|0'
                    check='||||||||||||||||||||||||||||' editcol='0|1|1|0|0|0|0|0|0|1|0|1|0|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|1'
                    widths='0|1500|1200|0|1500|2500|0|1500|2500|1200|1000|1200|1000|1200|1200|1000|1500|1500|1500|2000|0|2000|0|2000|0|2000|0|0|1000'
                    sorting='T' styles='width:100%; height:100%'  onafteredit="CheckInput()"
                    oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
