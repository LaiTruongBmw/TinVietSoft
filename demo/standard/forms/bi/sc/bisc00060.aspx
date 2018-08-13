<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Warehouse Stock Checking</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>


<script>


var G_PK            =	0,
    G_GROUP_PK      =	1,
    G_STATUS        =	2, 
    G_WH_NAME       =	3,
    G_GROUP         =	4,
    G_ITEM_CODE     =	5,
    G_ITEM_NAME     =	6,
    G_UOM           =	7,
    G_STOCK_QTY     =	8,
    G_MAX_QTY       =	9,
    G_MIN_QTY       =	10,
    G_MAX_DAY       =	11,
    G_MIN_DAY       =	12,
	G_DAILY_QTY		=   13,
    G_REMAIN_DAY    =	14,
	G_LAST_MONTH_QTY=   15,
    G_WH_PK         =   16;
    
//----------------------------------------------------------------------------------------

function BodyInit()
{
    System.Translate(document); 
	  
    FormatGrid();
    
}
//======================================================================================================
function FormatGrid()
{
    var data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||Select ALL";     
    lstGroup.SetDataText(data);
    lstGroup.value = '';
    
    data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from TLG_IN_WAREHOUSE where del_if = 0 and use_yn='Y' order by wh_id ")%>||Select ALL"; 
    lstWH.SetDataText(data);
    lstWH.value = '';
	
	data = "DATA|1|Over|2|Safe|3|Must Purchase|4|Not Safe||"; 
    lstStatus.SetDataText(data);
    lstStatus.value = '';
	
	var ctrl = grdLedger.GetGridControl();

    ctrl.ColFormat(G_STOCK_QTY) 	= "###,###,###.##" ;
    ctrl.ColFormat(G_MAX_QTY)    	= "###,###,###.##" ;
    ctrl.ColFormat(G_MIN_QTY) 		= "###,###,###.##" ;
	ctrl.ColFormat(G_MAX_DAY)  		= "###,###,###.##" ;
	ctrl.ColFormat(G_MIN_DAY)   	= "###,###,###.##" ;
	ctrl.ColFormat(G_DAILY_QTY)		= "###,###,###.##" ;
	ctrl.ColFormat(G_REMAIN_DAY) 	= "###,###,###.##" ;
	ctrl.ColFormat(G_LAST_MONTH_QTY)= "###,###,###.##" ;
}
//======================================================================================================


function OnPopUp(pos)
{
    switch(pos)
    {
        case '1':
			if ( event.col == G_ITEM_CODE || event.col == G_ITEM_NAME )
			{
            	txtItemPk.text   = grdLedger.GetGridData( grdLedger.row, G_PK        );
            	txtItemCode.text = grdLedger.GetGridData( grdLedger.row, G_ITEM_CODE );
            	txtWhPk.text     = grdLedger.GetGridData( grdLedger.row, G_WH_PK     );
            	txtGroup.text    = grdLedger.GetGridData( grdLedger.row, G_GROUP_PK  );
				
				var path = System.RootURL + "/standard/forms/bi/sc/bisc00061.aspx?wh_pk="+txtWhPk.text+'&item_code='+txtItemCode.text+'&group='+txtGroup.text;
	        	var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			}	                        	         
        break;
		
        case '2':
            var path = System.RootURL + "/standard/forms/bi/sc/bisc00061.aspx";
	        var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
	         
        break;
		
		case 'PROCESS':
            var path = System.RootURL + "/standard/forms/bi/sc/bisc00062.aspx";
	        var object = System.OpenModal( path ,400 ,200 ,'resizable:yes;status:yes');
	         
        break;
    }
      
	         
}
//======================================================================================================

function ReceiveData()
{
	if ( grdLedger.rows > 1 )
	{
		grdLedger.SetCellBold( 1,G_STOCK_QTY ,  grdLedger.rows - 1, G_STOCK_QTY,  true);
        grdLedger.SetCellBold( 1,G_REMAIN_DAY , grdLedger.rows - 1, G_REMAIN_DAY, true);	
		
	    for(var i=1 ; i<grdLedger.rows ;i++)
	    {
	       var l_status = grdLedger.GetGridData(i,G_STATUS);
		   
	       if(l_status == "Not Safe")
	       {	           
	            grdLedger.SetCellBgColor( i, G_PK , i, G_WH_PK , 0x99ffff );
	       }
	       else if(l_status == "Over")
	       {
	            grdLedger.SetCellBgColor( i, G_PK , i, G_WH_PK , 0x00FF66 );
	       }       
	    }
	}
}
//======================================================================================================
function OnSearch()
{
    data_bisc00060.Call("SELECT");
}
//======================================================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisc00060" onreceive="ReceiveData(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bisc00060" >  
                <input> 
                    <input bind="lstWH" />
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
					<input bind="lstStatus" />
                </input> 
                <output bind="grdLedger" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    
                
                            <table style="height: 100%; width: 100%">
                                <tr style="height: 1%">
									<td style="width: 10%">
                                        <gw:list id="lstStatus" styles="width:100%;" onchange="OnSearch('Ledger')" />
                                    </td>
									<td style="width: 5%">
                                    </td> 
                                    <td style="width: 5%" align="right">
                                        W/H</td>
                                    <td style="width: 25%">
                                        <gw:list id="lstWH" styles="width:100%;" onchange="OnSearch('Ledger')" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        Item</td>
                                    <td style="width: 25%">
                                        <gw:list id="lstGroup" styles="width:100%;" onchange="OnSearch('Ledger')" />
                                    </td>                                    
                                    <td style="width: 15%">
                                        <gw:textbox id="txtItem" styles="width:100%;" onenterkey="OnSearch('Ledger')" />
                                    </td>									
                                    <td style="width: 8%">
                                    </td>                                    
                                    <td style="width: 1%">
                                        <gw:button id="btnFreeItem" img="popup" alt="Free Item" text="Pop Up" onclick="OnPopUp('2')" />
                                    </td>
									<td style="width: 1%" align="right">
                                        <gw:button id="btnPopUp_1" img="popup" alt="process" text="process" onclick="OnPopUp('PROCESS')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button id="btnSearch_1" img="search" alt="Search" text="Search" onclick="OnSearch('Ledger')" />
                                    </td>
                                </tr>
								<tr style="height: 99%">
									<td colspan=15 >
										<gw:grid id='grdLedger' header='_PK|_Group_pk|Status|W/H Name|Group|Item Code|Item Name|UOM|Stock Qty|Max Qty|Min Qty|Max Day|Min Day|Daily Qty|Remain Days|Last Month|_wh_pk'
											format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
											aligns='0|0|0|0|0|0|0|1|3|3|3|3|3|3|3|3|0' 									 
											editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
											widths='0|0|1200|2000|2000|1200|2000|800|1300|1300|1300|1300|1300|1300|1300|1300|1000'
											sorting='T' styles='width:100%; height:100%' oncelldblclick="OnPopUp('1')" />
									</td>
								</tr>
                            </table>
                        
                   
           
</body>
<!------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
<gw:textbox id="txtItemPk" styles="width: 100%;display: none" />
<gw:textbox id="txtItemCode" styles="width: 100%;display: none" />
<gw:textbox id="txtGroup" styles="width: 100%;display: none" />
<gw:textbox id="txtWhPk" styles="width: 100%;display: none" />
<!------------------------------------------------------->
</html>
