<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>STOCK CONSUMPTION CONFIRM</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//-----------------------------------------------------

var flag;

var G_PK    = 0 ;
//---------------------------------------------------------
var G1_DETAIL_PK    = 0, 
    G1_MASTER_PK    = 1,  
	G1_ITEM_PK      = 2,
	G1_ITEM_CODE    = 3,
    G1_ITEM_NAME    = 4,
    G1_UOM          = 5,
    G1_LOT_NO       = 6,
    G1_BEGIN_QTY    = 7,
    G1_CONS_QTY     = 8,
    G1_ADJ_QTY      = 9,
    G1_OUT_QTY      = 10,    
    G1_END_QTY      = 11,
    G1_REMARK       = 12;
    
var arr_FormatNumber = new Array();

//===================================================================================
function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if(imgArrow.status == "expand"){
    left.style.display="none";
    imgArrow.status = "collapse";
    right.style.width="100%";
    imgArrow.src = "../../../system/images/button/next.gif";
    }
    else{
    left.style.display="";
    imgArrow.status = "expand";
    right.style.width="75%";
    imgArrow.src = "../../../system/images/button/previous.gif";
    }
}

//===================================================================================

function BodyInit()
{  
    System.Translate(document);  // Translate to language session    
    txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
    //----------  
    txtChargerName.SetEnable(false);
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //----------------------------
    
    BindingDataList();    
    //----------------------------
 }
 
 //======================================================================================
 
 function BindingDataList()
 {  
     var data ;
     
     data = "<%=ESysLib.SetListDataSQL("SELECT pk,wh_id || ' * ' || wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn = 'Y' ORDER BY 2 " )%>";    
     lstWarehouse.SetDataText(data);
     
     data = data + '||' ;
     lstWHSearch.SetDataText(data);
     lstWHSearch.value = '' ;      
     //-----------------------  
     
     var ctrl = grdDetail.GetGridControl(); 
    
     ctrl.ColFormat(G1_BEGIN_QTY)    = "#,###,###,###,###,###.###";
     ctrl.ColFormat(G1_CONS_QTY)     = "#,###,###,###,###,###.###";
     ctrl.ColFormat(G1_OUT_QTY)      = "#,###,###,###,###,###.###";
     ctrl.ColFormat(G1_ADJ_QTY)      = "#,###,###,###,###,###.###";
     ctrl.ColFormat(G1_END_QTY)      = "#,###,###,###,###,###.###";
     
     arr_FormatNumber[G1_BEGIN_QTY] = 3;
     arr_FormatNumber[G1_CONS_QTY]  = 3;
     arr_FormatNumber[G1_OUT_QTY]   = 3;
     arr_FormatNumber[G1_ADJ_QTY]   = 3;
     arr_FormatNumber[G1_END_QTY]   = 3;    
                       
 }
  
//=====================================================================================
function OnProcess(pos)
{
     switch(pos)
     {

        case 'ReLoad' :
            if ( confirm('Do you want to reload data.') )
            {
                pro_fppr00050_4.Call();
            }    
        break;

        case 'LoadData' :
            if ( confirm('Do you want to close data.') )
            {
                if ( lstWarehouse.value != "" )
                {
                    txtChargerPK.text   = "<%=Session("EMPLOYEE_PK")%>" ;
                    txtChargerName.text = "<%=Session("USER_NAME")%>" ;
                    
                    pro_fppr00050.Call();
                }else
                {
                    alert('Please select Warehouse first!');
                }
            }    
        break;
        
        case 'Release' :
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to release data.') )
                {
                    pro_fppr00050_1.Call();
                }
            }
            else
            {
                alert('Pls select data');
            }                     
        break;   
        
        case 'Submit':
            if ( txtMasterPK.text != '' )
            {
                if ( confirm('Do you want to submit this slip.') )
                {            
                    pro_fppr00050_2.Call();
                }    
            }
            else
            {
                alert('Pls select data');
            }    
        break;                 
		
		case 'RELOAD_STOCK':
			 if ( txtMasterPK.text != '' )
            {
                if ( confirm('Do you want to reload this stock.') )
                {            
                    pro_fppr00050_3.Call();
                }    
            }
            else
            {
                alert('Pls select data');
            }  
		break;
             
     }
}

//=====================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        
        case 'grdList':
            data_fppr00050.Call("SELECT");
        break;
        
        case 'Master':
            if ( grdVouchers.row > 0 )
            {
                txtMasterPK.text = grdVouchers.GetGridData( grdVouchers.row, G_PK );
            }
            
            data_fppr00050_1.Call("SELECT");
        break;
        
        case 'grdDetail':        
            data_fppr00050_2.Call("SELECT");
        break;
    }
}

//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_fppr00050_1": 
            OnSearch('grdDetail');                
        break;

        case "data_fppr00050_2":            
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G1_BEGIN_QTY, grdDetail.rows - 1, G1_BEGIN_QTY, true);	
               
                grdDetail.SetCellBold( 1, G1_OUT_QTY,   grdDetail.rows - 1, G1_OUT_QTY,   true);
                grdDetail.SetCellBold( 1, G1_ADJ_QTY,   grdDetail.rows - 1, G1_ADJ_QTY,   true);   
                grdDetail.SetCellBold( 1, G1_END_QTY,   grdDetail.rows - 1, G1_END_QTY,   true);                
                grdDetail.SetCellBold( 1, G1_ITEM_CODE, grdDetail.rows - 1, G1_ITEM_CODE, true);	

                grdDetail.SetCellBgColor( 1, G1_BEGIN_QTY, grdDetail.rows - 1, G1_END_QTY, 0xCCFFFF );
                                                                                                
                grdDetail.GetGridControl().Cell( 7, 1, G1_OUT_QTY, grdDetail.rows - 1, G1_END_QTY ) = 0x3300cc;		
				
				grdDetail.Subtotal(0, 2, -1, '7!8!9!10!11');
            }    
            //----------------------                
        break;
        
        case 'pro_fppr00050':
			data_fppr00050_1.Call("SELECT")
		break;
		
        case 'pro_fppr00050_2':
            data_fppr00050_1.Call("SELECT")
		break;	
		
        case 'pro_fppr00050_1':
           	data_fppr00050_1.Call("SELECT")
		break;

		case 'pro_fppr00050_3':
           	alert(txtReturnValue.text);
		break;		
						
   }            
}

//===================================================================================
function OnSave()
{
    if ( txtMasterPK.text != '' )
    {
        data_fppr00050_2.Call();        
    }
    else
    {
        alert('Pls select data first.');
    }
} 

//=================================================================================

function CheckInput()
{   
    var col, row;
    
    col = event.col;
    row = event.row;
    
    if ( col == G1_END_QTY )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col);
        
        if (Number(dQuantiy))
        {   
            
                grdDetail.SetGridText( row, col, System.Round(dQuantiy, arr_FormatNumber[col]) );
            
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        }     
     } 
     //------------------
     if ( col == G1_END_QTY)
     { 
            var dOutQty = Number(grdDetail.GetGridData( row, G1_BEGIN_QTY)) - Number(grdDetail.GetGridData( row, G1_END_QTY)) ;      
        	var dAdjQty = Number(dOutQty) - Number(grdDetail.GetGridData( row, G1_CONS_QTY)) ; 
			
        	grdDetail.SetGridText( row, G1_OUT_QTY, System.Round(dOutQty, arr_FormatNumber[G1_OUT_QTY]) ); 
        	grdDetail.SetGridText( row, G1_ADJ_QTY, System.Round(dAdjQty, arr_FormatNumber[G1_ADJ_QTY]) );                 
     } 
	 else if ( col == G1_ADJ_QTY )
	 {
            var dOutQty = Number(grdDetail.GetGridData( row, G1_CONS_QTY )) + Number(grdDetail.GetGridData( row, G1_ADJ_QTY)) ;      
        	var dEndQty = Number(grdDetail.GetGridData( row, G1_BEGIN_QTY)) - Number(dOutQty) ;
			
        	grdDetail.SetGridText( row, G1_OUT_QTY, System.Round(dOutQty, arr_FormatNumber[G1_OUT_QTY]) ); 
        	grdDetail.SetGridText( row, G1_END_QTY, System.Round(dEndQty, arr_FormatNumber[G1_END_QTY]) );                 	 
	 }	 
     //------------------
}
//=====================================================================================
function OnReport(pos)
{
	switch(pos)
	{
		case 'DAILY':
		 	if(txtMasterPK.text!="")
		    {
		            var url =System.RootURL + '/reports/bi/mc/rpt_fppr00050_1.aspx?p_tin_warehouse_pk='+ lstWarehouse.value + '&p_stock_date='+ dtStockDate.value + '&p_tin_warehouse_name=' + lstWarehouse.GetText();
		            window.open(url);                
		    } 			
		break;
		
		case 'MONTHLY':
		 	if(txtMasterPK.text!="")
		    {
		            var url =System.RootURL + '/reports/bi/mc/rpt_fppr00050_2.aspx?p_tin_warehouse_pk='+ lstWarehouse.value + '&p_stock_date='+ dtStockDate.value + '&p_tin_warehouse_name=' + lstWarehouse.GetText();
		            window.open(url);                
		    } 		
		break;
	}              
}  

//===================================================================================
function OnCalculate()
{
	for ( var i=1;i<grdDetail.rows;i++)
	{
		    var dOutQty  = Number(grdDetail.GetGridData( i, G1_BEGIN_QTY)) - Number(grdDetail.GetGridData( i, G1_END_QTY)) ;      
        	var dAdjQty = Number(dOutQty) - Number(grdDetail.GetGridData( i, G1_CONS_QTY)) ;                           
        	grdDetail.SetGridText( i, G1_OUT_QTY, System.Round(dOutQty, arr_FormatNumber[G1_OUT_QTY]) ); 
        	grdDetail.SetGridText( i, G1_ADJ_QTY, System.Round(dAdjQty, arr_FormatNumber[G1_ADJ_QTY]) );         
	}
}
//===================================================================================
function OnDelete()
{
    grdDetail.DeleteRow();
}
//===================================================================================
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'FreeItem':
			if ( txtMasterPK.text != '' )
			{			
             	var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=Y|Y|Y|Y|Y|';
             	var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
				
             	if ( object != null )
            	{
                    var arrTemp
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1); 	
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK,   arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE, arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME, arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_UOM,       arrTemp[5]);//item_uom                            
                    }		            
            	}  
			}	      
        break;  
 	}		
}	
//===================================================================================
</script>

<body>
    <!-----------------------grdVouchers---------------------------------------->
    <gw:data id="data_fppr00050" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1" function="<%=l_user%>lg_sel_fppr00050" > 
                <input>                      
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="lstWHSearch" />
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
                </input> 
                <output bind="grdVouchers" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_fppr00050_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5" function="<%=l_user%>lg_sel_fppr00050_1"  > 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="lstWarehouse" />   
                     <inout  bind="dtStockDate" />                                            
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />   
                     <inout  bind="txtDescription" />   
                     <inout  bind="lblStatus" />                                                       
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00050_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="<%=l_user%>lg_sel_fppr00050_2" procedure="<%=l_user%>lg_upd_fppr00050_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                    <input bind="txtItem" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_fppr00050" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fppr00050" > 
                <input>
                     <input bind="lstWarehouse" />
                     <input bind="dtStockDate" />
					 <input bind="txtChargerPK" />
                </input> 
                <output> 
                    <output bind="txtMasterPK" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_fppr00050_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fppr00050_1" > 
                <input>
                     <input bind="txtMasterPK" />
                </input> 
                <output> 
                    <output bind="txtMasterPK" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_fppr00050_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fppr00050_2" > 
                <input>
                     <input bind="txtMasterPK" />
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!-------------------------------------------------------------------->
    <gw:data id="pro_fppr00050_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fppr00050_3" > 
                <input>
                     <input bind="txtMasterPK" />
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 25%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Date
                        </td>
                        <td style="width: 89%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~<gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdList')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%">
                            W/H
                        </td>
                        <td colspan="1">
                            <gw:list id="lstWHSearch" styles="width:100%;" />
                        </td>
						<td>
							<gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdVouchers')">User
							</gw:checkbox>
						</td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdVouchers" header="_PK|Date|W/H|Status" format="0|4|0|0" aligns="0|1|0|0"
                                defaults="|||0" editcol="0|0|0|0" widths="0|1200|1500|800" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3" oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 75%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="background-color: #B4E7FF" colspan="11">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 1%">
                                        <gw:icon id="btnRelease" img="2" text="Release" alt="Release Closing Data" styles='width:100%;display:none'
                                            onclick="OnProcess('Release')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnLoadData" img="2" text="Load Ending Stock" alt="Load Closing Data"
                                            styles='width:100%' onclick="OnProcess('LoadData')" />
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 1%">
										<gw:icon id="btnReportDaily" img="2" text="Release" styles='width:100%' onclick="OnProcess('Release')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnCancel" img="2" text="Cancel Approve" alt="Approve" styles='width:100%;display:none'
                                            onclick="OnProcess('Cancel')" />
                                    </td>
                                    <td style="width: 50%">
                                    </td>
									 <td style="width: 1%; display:none">
										<gw:icon id="btnReportMonthly" img="2" text="Report Monthly" styles='width:100%' onclick="OnReport('MONTHLY')" />
                                    </td>
                                   <td>
                                    <gw:label id="lblStatus" styles="color:red;font-weight:1.5" />
                                   </td>
                                     <td style="width: 1%">
                                        <gw:icon id="btnSubmit" img="2" text="Submit" alt="Approve" styles='width:100%'
                                            onclick="OnProcess('Submit')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="right" style="width: 5%">
                            W/H
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstWarehouse" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Stock Date
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtStockDate" lang="1" />
                        </td>
                        <td align="right" style="width: 5%">
                            Charger
                        </td>
                        <td style="width: 40%" colspan="3">
                            <gw:textbox id="txtChargerName" styles="width:100%" />
                            <gw:textbox id="txtChargerPK" styles="display:none" />
                        </td>                       
                    </tr>
                     <tr>
                        <td>
                            Desc.
                        </td>
                         <td style="width: 100%" colspan="7">
                            <gw:textbox id="txtDescription" styles="width:100%" />
                        </td>  
                    </tr>
                    <tr style="height: 2%">
                        <td colspan=10 >
							<table style="width: 100%; height: 100%" >
								<tr>
									<td style="width: 5%" align="left">
										<img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
											style="cursor: hand" onclick="OnToggle()" />
									</td>
									<td align="right" style="width:5%" >
										Item
									</td>
									<td align="right" style="width:30%" >
										<gw:textbox id="txtItem" styles="width:100%" onenterkey=" OnSearch('grdDetail')" />
									</td>
									<td style="width:5%" align="left" >
										<gw:imgbtn id="btnSearch2" img="search" alt="Search" text="Search" onclick=" OnSearch('grdDetail')" />
									</td>
									
									<td>
											
									</td>
										
									<td style="width: 1%">
										<gw:imgbtn img="process" alt="Calculate" id="btnGroupItem" onclick="OnCalculate()" />
									</td>
									
									<td style="width: 1%">
										<gw:icon id="btnReLoadData" img="2" text="Reload Ending Stock" alt="Reload Stock Balance"
                                            styles='width:100%' onclick="OnProcess('RELOAD_STOCK')" />
									</td>
									
									<td align="right">
										<gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
									</td>									
								</tr>
							</table>
						</td>
                    </tr>
                   
                    <tr style="height: 94%">
                        <td colspan="8">
                            <gw:grid id='grdDetail' 
								header='_PK|_pr_st_close_M_PK|_TCO_ITEM_PK|Item Code|Item Name|UOM|Lot No|Stock Qty|Cons Qty|Adj Qty|Out Qty|End Qty|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|0|0|1|1|3|3|3|3|3|0'
                                editcol='0|0|1|0|0|0|0|0|0|0|0|1|1' 
								widths='0|0|0|1500|2000|800|1500|1500|1500|1500|1500|1500|1500'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<!---------------------------------------------------------------------------------->
</html>
