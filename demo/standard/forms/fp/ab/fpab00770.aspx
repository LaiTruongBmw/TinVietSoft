<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Location Stock Mapping</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script type="text/javascript"> 

var G1_TR_PK		= 0,
	G1_WH_LOC_PK	= 1,
	G1_LOC_ID       = 2,
	G1_TR_QTY		= 3,
	G1_TRANS_RATE	= 4,
	G1_INV_QTY		= 5,	 
	G1_TABLE_PK		= 6,
	G1_TABLE_NAME	= 7,
	G1_IO_TYPE 		= 8,
	G1_TR_DATE		= 9,
	G1_REMARK		= 10;
       
var G2_LOC_PK		= 0,
	G2_CHK			= 1,
	G2_WH_ID		= 2,
	G2_STORE_QTY	= 3,
	G2_TOTAL_QTY	= 4,
	G2_FREE_QTY		= 5,
	G2_ITEM_CODE	= 6,
	G2_ITEM_NAME	= 7,
	G2_UOM			= 8,
	G2_LOT_NO		= 9,
	G2_TR_QTY		= 10;
          
var arr_FormatNumber = new Array();
//====================================================================================
function BodyInit()
{
    System.Translate(document);
     
    FormatGrid(); 
    //-----------     
    var p_table_pk 		= "<%=Request.querystring("p_table_pk")%>";
	var p_table_name    = "<%=Request.querystring("p_table_name")%>";
	var p_io_type 		= "<%=Request.querystring("p_io_type")%>";	
	 
	txtTablePK.text   = p_table_pk;
	txtTableName.text = p_table_name;
	radIOType.value   = p_io_type;	
	
	OnSearch('MAPPING');	    
	//-----------  
	
} 

//====================================================================================
function FormatGrid()
{	
    var ctrl = grdMapping.GetGridControl();
	
    ctrl.ColFormat(G1_TR_QTY)  		= "###,###,###,###.##";
	ctrl.ColFormat(G1_TRANS_RATE)  	= "###,###,###,###.##";
	ctrl.ColFormat(G1_INV_QTY) 		= "###,###,###,###.##";
	
	arr_FormatNumber[G1_TR_QTY]  = 2;
	arr_FormatNumber[G1_INV_QTY] = 2;

	ctrl = grdLocation.GetGridControl();
	
    ctrl.ColFormat(G2_STORE_QTY)  	= "###,###,###,###.##";
	ctrl.ColFormat(G2_TOTAL_QTY) 	= "###,###,###,###.##";	
	ctrl.ColFormat(G2_FREE_QTY) 	= "###,###,###,###.##";
	ctrl.ColFormat(G2_TR_QTY) 		= "###,###,###,###.##";	
	
	grdLocation.GetGridControl().MergeCells  = 2 ;	
    grdLocation.GetGridControl().MergeCol(0) = true ;	
    grdLocation.GetGridControl().MergeCol(1) = true ;   	
    grdLocation.GetGridControl().MergeCol(2) = true ;
	grdLocation.GetGridControl().MergeCol(3) = true ;
	grdLocation.GetGridControl().MergeCol(4) = true ;
	grdLocation.GetGridControl().MergeCol(5) = true ;
	
	var data = '';
	
	data = "<%=CtlLib.SetListDataSQL("select a.pk,a.STRG_ID || ' * ' || a.STRG_NAME from tlg_in_storage a where a.del_if = 0 order by a.STRG_ID ")%>||Select ALL";	
	lstStorage.SetDataText(data);
	lstStorage.value = '';
	
}
 
 //==================================================================================
function OnReport()
{
    var url =System.RootURL + '/reports/fp/pw/rpt_fppw00110.aspx?p_pb_line_group_pk=' + txtLineGroupPK.text ;
	window.open(url, "_blank"); 
}
//====================================================================================

 function OnSearch(pos)
 {
    switch (pos)
    {        
        case 'MAPPING' :
		 
			data_fpab00770_1.Call("SELECT");					
	    break;              
		
		case 'WH_LOC':
			data_fpab00770_2.Call('SELECT');
		break;
    }        
 }

//====================================================================================
 function OnAddNew(pos)
 {  
    switch (pos)
    {                       
        case 'MAPPING':			     			
	        grdMapping.AddRow();
    		
			grdMapping.SetGridText( grdMapping.rows-1, G1_TRANS_RATE, txtTransRate.text  ); 
			 	 		
			grdMapping.SetGridText( grdMapping.rows-1, G1_TABLE_PK,   txtTablePK.text    );
			grdMapping.SetGridText( grdMapping.rows-1, G1_TABLE_NAME, txtTableName.text  );
			grdMapping.SetGridText( grdMapping.rows-1, G1_IO_TYPE, 	  radIOType.value 	 );
			
			if ( grdLocation.row > 0 ) 
			{
				grdMapping.SetGridText( grdMapping.rows-1, G1_WH_LOC_PK, grdLocation.GetGridData( grdLocation.row, G2_LOC_PK ) ); 
				grdMapping.SetGridText( grdMapping.rows-1, G1_LOC_ID, 	 grdLocation.GetGridData( grdLocation.row, G2_WH_ID  ) );								
			}
			
			grdMapping.SetGridText( grdMapping.rows-1, G1_TR_QTY,  Number(txtRemainQty.text) );
			grdMapping.SetGridText( grdMapping.rows-1, G1_INV_QTY, Number(txtRemainQty.text)*Number(txtTransRate.text) ); 
			
        break;		
                
    }    
 }
//====================================================================================

function OnSave(pos)
{   
    switch (pos)
    {
        case 'MAPPING' :
            data_fpab00770_1.Call();
        break; 
    }
}

//====================================================================================

function OnDelete(ogrid)
{
    if ( ogrid.row > 0 )
    {
        if ( ogrid.GetGridData( ogrid.row, 0) == '' )  
        {
	        ogrid.RemoveRowAt( ogrid.row ); 			
	    }
	    else			
	    {
	        ogrid.DeleteRow();
	    }
	}   
}

//====================================================================================

function OnUnDelete(ogrid)
{    
    ogrid.UnDeleteRow()
}
 
//========================================================================
 
 function CheckInput(obj)
 {   
    switch(obj.id)
    {         
        case 'grdMapping':
            var  row, col 
                
            row = event.row ;
            col = event.col ;    
            
            if ( col == G1_TR_QTY || col == G1_INV_QTY )
            {
                var dQuantiy;                
                dQuantiy =  grdMapping.GetGridData(row,col);
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        grdMapping.SetGridText(row,col, System.Round( dQuantiy, arr_FormatNumber[col] ) );												 	
                    }
                    else
                    {                         
                        grdMapping.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdMapping.SetGridText(row,col,"")
                }         
            }           
            //------------------------------------------
            if ( col == G1_TR_QTY )
	        {
		        var dInvQty = Number(grdMapping.GetGridData( row, G1_TR_QTY )) * Number(grdMapping.GetGridData( row, G1_TRANS_RATE )) ;                            			               
				grdMapping.SetGridText( row, G1_INV_QTY, System.Round( dInvQty, arr_FormatNumber[G1_INV_QTY] )) ;
	        }
			//------------------------------------------			
        break;
    }
 }
 
//========================================================================

function OnCellDoubleClick(obj)
{
	switch(obj.id)
	{
		case 'grdMapping':
			if ( ( event.col == G1_LOC_ID ) && event.row > 0 )
			{
				var event_col = event.col ;
                var event_row = event.row ;
                      
                var path = System.RootURL + '/form/fp/ab/fpab00160.aspx';
	            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	                 
	            if ( obj != null )
	            {
                    grdMapping.SetGridText( event_row, G1_WH_LOC_PK, obj[0] ); //loc_pk
                    grdMapping.SetGridText( event_row, G1_LOC_ID,    obj[7] ); //loc_id                    
                }	       			
			}
			else if ( ( event.col == G1_TRANS_RATE ) && event.row > 0 )
			{
				var path = System.RootURL + '/form/fp/ab/fpab00640.aspx?p_item_pk=' + txtItemPK.text + '&p_uom=' + lblUOM.text ;
	            var obj = System.OpenModal( path ,400 , 300, 'resizable:yes;status:yes');    	         
			}
		break;
	}	
}

//==============================================================================
    function OnProcess(pos)	
    {
		switch (pos)
		{
			case 'WH_LOC':			
				var t_assgin_qty = 0 ;
				
				if ( radIOType.value == 'I' )
				{
					for (var i=1;i<grdLocation.rows;i++)
					{
						if ( grdLocation.GetGridData( i, G2_CHK) == '-1' && Number(txtRemainQty.text)>0 && grdLocation.GetGridData( i, G2_LOC_PK) != grdLocation.GetGridData( i-1, G2_LOC_PK) )
						{
							if ( Number(grdLocation.GetGridData( i, G2_FREE_QTY)) >= Number(txtRemainQty.text)) 
							{
								t_assgin_qty = Number(txtRemainQty.text);
							}
							else
							{
								t_assgin_qty = Number(grdLocation.GetGridData( i, G2_FREE_QTY));
							}
							
							if ( t_assgin_qty > 0 )
							{
								txtRemainQty.text = Number(txtRemainQty.text) - t_assgin_qty;
														 
								grdMapping.AddRow();
									
								grdMapping.SetGridText( grdMapping.rows-1, G1_TR_QTY,     t_assgin_qty ); 
									
								grdMapping.SetGridText( grdMapping.rows-1, G1_WH_LOC_PK,  grdLocation.GetGridData( i, G2_LOC_PK)); 
								grdMapping.SetGridText( grdMapping.rows-1, G1_LOC_ID,     grdLocation.GetGridData( i, G2_WH_ID )); 
									
								grdMapping.SetGridText( grdMapping.rows-1, G1_TRANS_RATE, txtTransRate.text  ); 
									
								grdMapping.SetGridText( grdMapping.rows-1, G1_INV_QTY,    Number(t_assgin_qty)*Number(txtTransRate.text) ); 

								grdMapping.SetGridText( grdMapping.rows-1, G1_TABLE_PK,   txtTablePK.text    );
								grdMapping.SetGridText( grdMapping.rows-1, G1_TABLE_NAME, txtTableName.text  );
							}	
						}
					}				
				}
				else if ( radIOType.value == 'O' )
				{
					for (var i=1;i<grdLocation.rows;i++)
					{
						if ( grdLocation.GetGridData( i, G2_CHK) == '-1' && Number(txtRemainQty.text)>0 && grdLocation.GetGridData( i, G2_ITEM_CODE) == lblItemCode.text && grdLocation.GetGridData( i, G2_TR_QTY) > 0 )
						{
							if ( Number(grdLocation.GetGridData( i, G2_TR_QTY)) >= Number(txtRemainQty.text)) 
							{
								t_assgin_qty = Number(txtRemainQty.text);
							}
							else
							{
								t_assgin_qty = Number(grdLocation.GetGridData( i, G2_TR_QTY));
							}
							
							if ( t_assgin_qty > 0 )
							{
								txtRemainQty.text = Number(txtRemainQty.text) - t_assgin_qty;
														 
								grdMapping.AddRow();
									
								grdMapping.SetGridText( grdMapping.rows-1, G1_TR_QTY,     t_assgin_qty ); 
									
								grdMapping.SetGridText( grdMapping.rows-1, G1_WH_LOC_PK,  grdLocation.GetGridData( i, G2_LOC_PK)); 
								grdMapping.SetGridText( grdMapping.rows-1, G1_LOC_ID,  	  grdLocation.GetGridData( i, G2_WH_ID ));
									
								grdMapping.SetGridText( grdMapping.rows-1, G1_TRANS_RATE, txtTransRate.text  ); 
									
								grdMapping.SetGridText( grdMapping.rows-1, G1_INV_QTY,    Number(t_assgin_qty)*Number(txtTransRate.text) ); 

								grdMapping.SetGridText( grdMapping.rows-1, G1_TABLE_PK,   txtTablePK.text    );
								grdMapping.SetGridText( grdMapping.rows-1, G1_TABLE_NAME, txtTableName.text  );
							}	
						}
					}			
				}
			break;
			
			case 'MAPPING':
				if ( confirm("Do you want auto mapping Location ?"))
				{
					pro_fpab00770_mapping.Call();
				}	
			break;
		}				
    }     	
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {     
		case 'pro_fpab00770_1':		
			 
		    grdMapping.SetComboFormat( G1_WH_LOC_PK, txtRtnValue.text );
			
			data_fpab00770_1.Call("SELECT");
		break;	

		case 'pro_fpab00770_mapping':
			alert(txtRtnValue.text);
		break;
		
		case 'pro_fpab00770_3':
			if ( radIOType.value == 'O' )
			{
				txtItem.text  = lblItemCode.text;
				txtLotNo.text = lblLotNo.text;
				
				document.all("TAB_IO_INPUT").style.color  = ""; 
				document.all("TAB_IO_OUTPUT").style.color = "cc0000"; 
			}
			else if ( radIOType.value == 'I' )
			{
				txtItem.text  = "";
				txtLotNo.text = "";
				
				document.all("TAB_IO_INPUT").style.color  = "cc0000"; 
				document.all("TAB_IO_OUTPUT").style.color = ""; 
			}	
		break;
		
		case 'data_fpab00770_1': 
			pro_fpab00770_3.Call();
		break;
		
   }            
}	
//========================================================================

</script>

<body>     
	<!---------------------------------------------------------------->
    <gw:data id="pro_fpab00770_mapping" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_fpab00770_mapping" > 
                <input>
                    <input bind="radIOType" />
					<input bind="txtTableName" />
					<input bind="txtTablePK" />
					<input bind="lstStorage" />	
                </input> 
                <output>
					<output bind="txtRtnValue" />					 
                </output>
            </dso> 
        </xml> 
    </gw:data>	 
	<!---------------------------------------------------------------->
    <gw:data id="pro_fpab00770_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_fpab00770_1" > 
                <input>
                    <input bind="lstStorage" />				 			
                </input> 
                <output>
					<output bind="txtRtnValue" />					 
                </output>
            </dso> 
        </xml> 
    </gw:data>	 
	<!---------------------------------------------------------------->
    <gw:data id="pro_fpab00770_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_fpab00770_3" > 
                <input>
                    <input bind="radIOType" />
					<input bind="txtTableName" />
					<input bind="txtTablePK" /> 					
                </input> 
                <output>
					<output bind="radIOType" />
					<output bind="txtTableName" />
                    <output bind="txtTablePK" />									
					<output bind="txtSlipNo" />
					<output bind="txtItemPK" />
					<output bind="lblItemCode" />
					<output bind="lblItemName" />
					<output bind="lblUOM" />					
					<output bind="txtDevideQty" />
					<output bind="lblLotNo" />
					<output bind="txtTrDate" />
					<output bind="txtTransRate" />
					<output bind="txtMapQty" />
					<output bind="txtRemainQty" />
                </output>
            </dso> 
        </xml> 
    </gw:data>	 
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00770_1" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10" function="st_lg_sel_fpab00770_1"  procedure="st_lg_upd_fpab00770_1"  > 
			    <input bind="grdMapping" > 
                    <input bind="radIOType" />
					<input bind="txtTableName" />
					<input bind="txtTablePK" />			        		        					       
			    </input> 
			    <output bind="grdMapping" /> 
		    </dso> 
	    </xml> 
    </gw:data>
	<!------------------------------------------------------------------>
    <gw:data id="data_fpab00770_2" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0" function="st_lg_sel_fpab00770_2" > 
			    <input bind="grdLocation" > 
                    <input bind="lstStorage" />		
					<input bind="txtLoc" />
					<input bind="txtItem" />
					<input bind="txtLotNo" />
					<output bind="lblUOM" />					
			    </input> 
			    <output bind="grdLocation" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!-------------------------------------------------------------------> 
                <table style="width: 100%; height: 100%">
					<tr style="height: 1%">
						<td colspan=10 >
							<gw:radio id="radIOType" value="I" styles="width:100%;color:cc0000;font:11pt" onchange="OnSearch('MAPPING')"> 
                                <span value="I" id="TAB_IO_INPUT">INPUT</span> 
                                <span value="O" id="TAB_IO_OUTPUT">OUTPUT</span>                                             
                            </gw:radio>
						</td>
					</tr>
					<tr style="height: 1%">						 
                        <td style="width: 100%; white-space: nowrap; background-color: CCFFFF; border: 1px solid #034D72" align="right" colspan=10  >
                            <table style="width: 100%; height: 100%" >
								<tr style="height: 1%" >
									<td style="width: 5%; white-space: nowrap" align="left" >
										Item Code
									</td>
									<td style="width: 75%" align="left" colspan=3 >
										<gw:label id="lblItemCode" styles='width:100%;color:cc0000;font:9pt' />
									</td>
									<td style="width: 25%"  align="center" >
										<gw:label id="lblUOM" styles='width:100%;font:9pt' />
									</td>
								</tr>
								<tr style="height: 1%"  align="left" >
									<td style="width: 5%; white-space: nowrap" >
										Item Name
									</td>
									<td style="width: 95%" colspan=4  align="left" >
										<gw:label id="lblItemName" styles='width:100%;color:cc0000;font:9pt' />
									</td>
								</tr>
								<tr style="height: 1%" >
									<td style="width: 5%; white-space: nowrap" align="left" >
										Lot No
									</td>
									<td style="width: 45%" align="left" >
										<gw:label id="lblLotNo" styles='width:100%;color:cc0000;font:9pt' />
									</td>
									<td style="width: 5%; white-space: nowrap" align="left"  >		
										 
									</td>
									<td style="width: 45%"  align="center" colspan=2 >	
										 
									</td>									 
								</tr>
							</table>		
                        </td>                         
                    </tr>
					
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Qty
                        </td>
                        <td style="width: 25%" align="right">                     
							<gw:textbox id="txtDevideQty" type="number" format="#,###,###,###,###.##R" styles="width:100%;" />
                        </td> 					
                        <td style="width: 25%" align="right">                     
							<gw:textbox id="txtMapQty" type="number" format="#,###,###,###,###.##R" styles="width:100%;" />
                        </td>
                        <td style="width: 25%" align="right">                     
							<gw:textbox id="txtRemainQty" type="number" format="#,###,###,###,###.##R" styles="width:100%;" />
                        </td>
						
						<td style="width: 15%" align='right' >
							<gw:button id="btnProcess2" img="process" alt="Process" onclick="OnProcess('MAPPING')" />
						</td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch1" img="search" alt="Search" onclick="OnSearch('MAPPING')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnAddNew" img="new" alt="Add new" onclick="OnAddNew('MAPPING')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnDelete" img="delete" alt="Delete" onclick="OnDelete(grdMapping)" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnUndelete" img="undelete" alt="Undelete" onclick="OnUnDelete(grdMapping)" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSave" img="save" alt="Save" onclick="OnSave('MAPPING')" />
                        </td>
                    </tr>
					
                    <tr style="height: 49%">
                        <td colspan="10">                             
							<gw:grid id='grdMapping'
								header='_PK|_LOC_PK|Loc ID|Tr Qty|Trans Rate|Inv Qty|_table_pk|_table_name|_IO_Type|Date|Remark'
								format='0|0|0|0|0|0|0|0|0|4|0'
								aligns='0|0|1|3|3|3|0|0|0|1|0'
								check='||||||||||'
								editcol='0|0|1|1|0|1|0|0|0|1|1'
								widths='0|0|1500|1500|1200|1500|0|0|0|1200|0'
								sorting='T'								 
								styles='width:100%; height:100%' 
								acceptnulldate="T"
								onafteredit="CheckInput(this)" 
								oncelldblclick="OnCellDoubleClick(this)"
							/>	
                        </td>
                    </tr>
					
					<tr style="height: 1%">
						<td colspan="10">  
							<table style="width: 100%; height: 100%">
								<tr>
									<td style="width: 5%; white-space: nowrap" align="right">
										Storage
									</td>									
									<td style="width: 30%" align="right" colspan=2 >                     
										<gw:list id="lstStorage" styles="width:100%" />
									</td>
									<td style="width: 5%; white-space: nowrap" align="right">
										Location
									</td>									
									<td style="width: 15%" align="right" colspan=2 >                     
										<gw:textbox id="txtLoc" styles="width:100%;" />
									</td> 
									<td style="width: 5%; white-space: nowrap" align="right">
										Item
									</td>									
									<td style="width: 15%" align="right" colspan=2 >                     
										<gw:textbox id="txtItem" styles="width:100%;" />
									</td> 
									<td style="width: 5%; white-space: nowrap" align="right">
										Lot No
									</td>									
									<td style="width: 15%" align="right" colspan=2 >                     
										<gw:textbox id="txtLotNo" styles="width:100%;" />
									</td> 	
									<td style="width: 4%" align="right" >     
										<gw:button id="btnProcess2" img="process" alt="Process" onclick="OnProcess('WH_LOC')" />	
									</td>
									<td style="width: 1%" align="right" >     
										<gw:button id="btnSearch2" img="search" alt="Search" onclick="OnSearch('WH_LOC')" />	
									</td>									
								</tr>
							</table>
                        </td>                        					
                    </tr>
					
					<tr style="height: 50%">
                        <td colspan="10">                             
							<gw:grid id='grdLocation'
								header='_LOC_PK|V|Loc ID|Store Qty|Tr Qty|Free Qty|Item Code|Item Name|UOM|Lot No|Tr Qty'
								format='0|3|0|0|0|0|0|0|0|0|0'
								aligns='0|0|1|3|3|3|0|0|1|1|3'
								check='||||||||||'
								editcol='1|0|0|0|0|0|0|0|0|0|0'
								widths='0|400|1100|1200|1200|1200|1500|2500|800|1200|1200'
								sorting='T'								 
								styles='width:100%; height:100%' />
	
                        </td>
                    </tr>
					
                </table>
<!----------------------------------------------------------->
<gw:textbox id="txtItemPK" 		styles="width: 100%;display: none" />
<gw:textbox id="txtTablePK" 	styles="width: 100%;display: none" />
<gw:textbox id="txtTableName" 	styles="width: 100%;display: none" />	
<gw:textbox id="txtSlipNo" 		styles="width: 100%;display: none" />
<gw:textbox id="txtTransRate" 	styles="width: 100%;display: none" />
<gw:textbox id="txtTrDate" 		styles="width: 100%;display: none" />
<!----------------------------------------------------------->
<gw:textbox id="txtRtnValue" 	styles="width: 100%;display: none" />

</body>
</html>
