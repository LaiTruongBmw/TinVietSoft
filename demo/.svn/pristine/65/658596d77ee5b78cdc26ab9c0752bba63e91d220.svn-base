<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>OUTGOING CONFIRM</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

//---------------------------------------------------------
var G1_CHK    		= 0, 
    G1_INV_PK    	= 1,  
	G1_INV_ID		= 2,  
    G1_CUST_TYPE    = 3,
	G1_CUST_NAME	= 4,
    G1_AMOUNT    	= 5;

var G2_WAREHOUSE	= 0,
	G2_STOCK_DATE	= 1,
	G2_POINT_ID		= 2,
	G2_GROUP_CD		= 3,
	G2_CONS_ITEM_PK	= 4,
	G2_ITEM_CODE	= 5,
	G2_ITEM_NAME	= 6,
	G2_UOM			= 7,
	G2_CONS_QTY		= 8;
	    
//===================================================================================

function BodyInit()
{   
    //----------------------------
    System.Translate(document); 
    BindingDataList();    
    //----------------------------
 }
 
 //======================================================================================
 
 function BindingDataList()
 {  
     var data ;
     
	 data = "<%=CtlLib.SetListDataSQL(" SELECT CODE, CODE || ' ' || NAME FROM tco_commcode WHERE PARENT_CODE = 'POINT' AND CODE IN ('POINT-01','POINT-02','POINT-04','POINT-05','POINT-06','POINT-09','POINT-11') ORDER BY CODE ")%>";
	 lstPoint.SetDataText(data);
     //-----------------------  
     
     var ctrl = grdInvoice.GetGridControl();     
     ctrl.ColFormat(G1_AMOUNT)    = "#,###,###,###,###,###"; 
	 
	 var ctrl = grdCons.GetGridControl();     
     ctrl.ColFormat(G2_CONS_QTY) = "#,###,###,###,###,###.##"; 		  		                              
 }
  
//=====================================================================================
function OnProcess(pos)
{
     switch(pos)
     {       
	        case 'ProcessData' :
				if ( txtInvPK.text != '' )
				{
	            	if ( confirm('Do you want to process data.') )
	            	{                	                
	                	pro_bimc00080.Call();                
	            	}
				}	
				else
				{
					alert("Pls select INVOICE to process!");
				}    
	        break;
     }
}

//=====================================================================================
function OnSearch(pos)
{
    switch (pos)
    {         		 
        case 'grdInvoice':    			        
            data_bimc00080_1.Call("SELECT");
        break;
		        
		case 'grdCons':
			if ( event.col == G1_CHK )
			{
				var t_link = "";
				txtInvPK.text = "";
				
				for (var i=1 ; i<grdInvoice.rows ; i++ )
				{
				 	if ( grdInvoice.GetGridData(i,G1_CHK) == -1 )
					{
						txtInvPK.text = txtInvPK.text + t_link + grdInvoice.GetGridData(i,G1_INV_PK);
						t_link = ",";
					}
					
					if (txtInvPK.text != "")
					{
						data_bimc00080_2.Call("SELECT");
					}
					else
					{
						grdCons.ClearData();
					}
				}
			}
		break;			
    }
}

//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_bimc00080_1": 
			txtInvPK.text = '';
            grdCons.ClearData();                
        break;

        case "data_bimc00080_2":            
            if ( grdCons.rows > 1 )
            {
                grdCons.SetCellBold( 1, G2_CONS_QTY,  grdCons.rows - 1, G2_CONS_QTY,  true);					 
                grdCons.SetCellBold( 1, G2_ITEM_CODE, grdCons.rows - 1, G2_ITEM_CODE, true);                  
            }    
            //----------------------               
        break;               
		                		
 		case 'pro_bimc00080':
			alert(txtReturnValue.text);
			
			OnSearch('grdInvoice');
		break;		
   }            
}

//=====================================================================================
function OnReport(pos)
{
	switch(pos)
	{
		case 'DAILY':
		 	if(txtMasterPK.text!="")
		    {
		            var url =System.RootURL + '/reports/bi/mc/rpt_bimc00080_1.aspx?p_tin_warehouse_pk='+ lstPoint.value + '&p_stock_date='+ dtStockDate.value + '&p_tin_warehouse_name=' + lstPoint.GetText();
		            window.open(url);                
		    } 			
		break;				 
	}              
}   
//===================================================================================
function OnCheck()
{  
	if ( chkALL.value == "Y")
	{
		var t_link = "";
		txtInvPK.text = "";
				
		for (var i=1; i<grdInvoice.rows;i++)
		{
			grdInvoice.SetGridText(i,G1_CHK,-1);
			
			txtInvPK.text = txtInvPK.text + t_link + grdInvoice.GetGridData(i,G1_INV_PK);
			t_link = ",";
			
			if (txtInvPK.text != "")
			{
				data_bimc00080_2.Call("SELECT");
			}
		}
	}	
	else
	{
		for (var i=1; i<grdInvoice.rows;i++)
		{
			grdInvoice.SetGridText(i,G1_CHK,0);
		}	
		
		grdCons.ClearData();
	}
} 
//===================================================================================

function OnPopUp(pos)
{
	switch (pos)
	{	
		case 'Invoice':
			if ( event.col == G1_INV_ID )
			{   
				var fpath = System.RootURL + "/standard/forms/ht/fo/htfo00041.aspx?pk=" + grdInvoice.GetGridData( grdInvoice.row, G1_INV_PK);
 				var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	 		
			}			 
		break;
	}	
}
//===================================================================================
</script>

<body>   
    <!------------------------------------------------------------------>
    <gw:data id="data_bimc00080_1" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="st_lg_sel_bimc00080_1" > 
                <input bind="grdInvoice">                    
                    <input bind="lstPoint" /> 
					<input bind="dtStockDate" />
                </input> 
                <output bind="grdInvoice" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------>
    <gw:data id="data_bimc00080_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="st_lg_sel_bimc00080_2" > 
                <input bind="grdCons">                    
                    <input bind="txtInvPK" /> 
                </input> 
                <output bind="grdCons" /> 
            </dso> 
        </xml> 
    </gw:data>		 
    <!-------------------------------------------------------------------->
    <gw:data id="pro_bimc00080" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_bimc00080" > 
                <input>
                     <input bind="txtInvPK" />
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>    
    <!-------------------------------------------------------------------->
                <table style="width: 100%; height: 100%">                     
                    <tr style="height: 2%">						 
						<td style="width: 10%" align="center" >
							<gw:checkbox id="chkALL" styles="color:blue" defaultvalue="Y|N" value="N" onclick="OnCheck()">
							</gw:checkbox>
						</td>						
                        <td align="right" style="width: 10%">
                            Point
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstPoint" styles='width:100%' csstype="mandatory" onchange="OnSearch('grdInvoice')" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Stock Date
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtStockDate" lang="1" />
                        </td>						 
						<td style="width: 18%"></td> 
						<td style="width: 1%; white-space: nowrap" align="center">
                             <gw:imgbtn id="btnSearch1" img="search" text="Search" alt="Search"
                                            onclick="OnSearch('grdInvoice')" />
                        </td> 						                      
                        <td style="width: 1%; white-space: nowrap" align="center">
                             <gw:imgbtn id="btnLoadData" img="process" text="Process" alt="Process"
                                            onclick="OnProcess('ProcessData')" />
                        </td>						 
                    </tr>                  
                    <tr style="height: 49%">
                        <td colspan="9">
                            <gw:grid id='grdInvoice' 
								header='Chk|_PK|Inv ID|Customer Type|Customer Name|Amount (VND)'
                                format='3|0|0|0|0|0' 
								aligns='0|0|0|0|0|3'
                                editcol='0|0|1|0|0|0' 
								widths='800|0|1500|2000|2500|1500'
								oncelldblclick="OnPopUp('Invoice')"
                                sorting='T' styles='width:100%; height:100%' oncellclick="OnSearch('grdCons')" />															 					  
                        </td>
                    </tr>
					<tr  style="height: 50%">
						<td colspan="9">							 
							 <gw:grid id='grdCons' 
								header='W/H|_S_DATE|_POINT_ID|Group|_TCO_ITEM_PK|Item Code|Item Name|UOM|Cons Qty'
                                format='0|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|0|0|0|0|1|3'
                                editcol='0|0|0|0|0|0|0|0|0' 
								widths='2000|0|0|1500|0|1500|2500|800|1500'											 
                                sorting='T' styles='width:100%; height:100%'   />									 
						</td>						 
					</tr>
                </table>
</body>
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<gw:textbox id="txtInvPK" styles="width:100%; display:none" />
<!---------------------------------------------------------------------------------->
</html>
