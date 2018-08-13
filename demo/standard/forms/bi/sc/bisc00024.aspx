<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Adjust Item</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script language="javascript" type="text/javascript">
 
 var flag = "";  
 
 //---------------------------------------------------------
var G1_WH_PK        = 0, 
    G1_STOCK_DATE   = 1,   
    G1_ITEM_PK      = 2,   
    G1_LOT_NO       = 3,
	G1_BEF_ADJUST	= 4,
	G1_ADJUST_QTY	= 5,
	G1_AF_ADJUST	= 6,
	G1_REMARK		= 7;
	
	
var arr_FormatNumber = new Array();
//=======================================================================


function BodyInit()
{
    System.Translate(document);  

	txtItemName.SetEnable(false);	
	//----------------------------
    txtUser_PK.text = "<%=Session("USER_PK")%>";
	
    BindingDataList(); 	
    //-------------------------
	
	txtItemPK.text = "<%=request.QueryString("item_pk")%>" ;	 	 
	
	dso_wh_list.Call("SELECT");
	
}  
//=======================================================================
function OnReport()
{
    callerWindowObj.OnReport(radType.value)      
    this.close(); 	
}

//===============================================================================
function OnPopUp(pos)
{
    switch(pos)
    {      
		case 'LoadStock':
            var path = System.RootURL + '/standard/forms/bi/sa/bisa00023.aspx?master_pk=' + txtMasterPK.text ;            
			//var object = System.OpenModal( path ,100, 220 ,  'resizable:yes;status:yes',this);
			var object = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:15;dialogHeight:15');
			OnSearch('grdDetail');
        break;   	
    }	       
}
//=====================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'ITEM':
            pro_bisc00024.Call();
        break;    

		case 'STOCK':
			data_bisc00024_1.Call("SELECT");
		break;	
    }
}


//===============================================================================

function OnSave(pos)
{    
    switch(pos)
    { 
		case 'Master':
			if ( flag == "")
			{
				flag='save'; 
			
				data_bisc00024_1.Call();
            }       
        break;
    }
}

//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
		case 'pro_bisa00030':
			alert(txtReturnValue.text);		
								 
		break;
		
		case 'pro_bisa00030_1':
			alert(txtReturnValue.text);		
								 
		break;
		
		case 'data_bisc00024_1':
			if ( flag=='save' )
			{
				window.close();
			}
			//-------
			if ( grdDetail.rows-1 > 0 )
			{
				grdDetail.SetCellBold( 1, G1_ADJUST_QTY, grdDetail.rows - 1, G1_ADJUST_QTY, true);	
				
				grdDetail.SetCellBgColor( 1, G1_AF_ADJUST , grdDetail.rows - 1, G1_AF_ADJUST , 0xCCFFFF );                			 					
			}					 
		break;
		
		case 'pro_bisc00024':
			OnSearch('STOCK');
		break;
		
		case 'dso_wh_list':
			OnSearch('ITEM');
		break;
		
   }            
}
//===================================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G1_ADJUST_QTY || col == G1_AF_ADJUST )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {	 
			grdDetail.SetGridText( row, col, System.Round(dQuantiy, arr_FormatNumber[col]));			
			//----------------	
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        } 

		//----------------
			if ( col == G1_ADJUST_QTY ) 
			{
				var bef_adjust = Number(grdDetail.GetGridData( row, G1_BEF_ADJUST)) ;
				var adjust_qty = Number(grdDetail.GetGridData( row, G1_ADJUST_QTY)) ;
				
				var af_adjust  = Number(bef_adjust) + Number(adjust_qty);
				
				grdDetail.SetGridText( row, G1_AF_ADJUST, System.Round(af_adjust, arr_FormatNumber[G1_AF_ADJUST]));
			}
			//----------------
			if ( col == G1_AF_ADJUST ) 
			{ 
				var bef_adjust = Number(grdDetail.GetGridData( row, G1_BEF_ADJUST)) ;
				var af_adjust  = Number(grdDetail.GetGridData( row, G1_AF_ADJUST)) ;
				
				var adjust_qty = Number(af_adjust) - Number(bef_adjust);
				
				grdDetail.SetGridText( row, G1_ADJUST_QTY, System.Round(adjust_qty, arr_FormatNumber[G1_ADJUST_QTY]));
			}
		//----------------	
    }
}

//===================================================================================

function OnProcess(pos)
{
    switch(pos)
    {
        case 'Approve':
			if ( txtMasterPK.text != '' )
			{
                if ( confirm("Do you want to Approve this slip ?") )
                {            
                    pro_bisa00030.Call();
                }                
			}	
        break;
		
		case 'Cancel':
			if ( txtMasterPK.text != '' )
			{
                if ( confirm("Do you want to Cancel this slip ?") )
                {            
                    pro_bisa00030_1.Call();
                }                
			}
		break;	
    }
}

//======================================================================================
 
 function BindingDataList()
 {   
	//-----------------------  
     
     var ctrl = grdDetail.GetGridControl(); 
    
     ctrl.ColFormat(G1_BEF_ADJUST)     	= "#,###,###,###,###,###.##";
	 ctrl.ColFormat(G1_ADJUST_QTY)  	= "#,###,###,###,###,###.##";
	 ctrl.ColFormat(G1_AF_ADJUST)       = "#,###,###,###,###,###.##";
		
	arr_FormatNumber[G1_BEF_ADJUST]    	= 2;
	arr_FormatNumber[G1_AF_ADJUST] 		= 2;
	
	arr_FormatNumber[G1_ADJUST_QTY]	= 2;
 }
//=======================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="dso_wh_list" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_bisc00024_3" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="lstWarehouse" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------grdDetail---------------------------------------->
    <gw:data id="data_bisc00024_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3,4,5,6,7" function="st_lg_sel_bisc00024_1" procedure="st_lg_upd_bisc00024_1"> 
                <input>                      
                    <input bind="txtItemPK" /> 
                    <input bind="lstWarehouse" />                    
					<input bind="dtStockDate" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>		 
    <!---------------------------------------------------------------->
    <gw:data id="pro_bisc00024" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_sel_bisc00024" > 
                <input>
                    <input bind="txtItemPK" /> 
                </input> 
                <output>					 
                    <output bind="txtItemName" />
                </output>
            </dso> 
        </xml> 
    </gw:data>   
    <!---------------------------------------------------------------->
    <table style="width:100%;height:100%" >
		<tr>
			<td align="right" style="width: 10%" >
                Item
            </td>
            <td style="width: 90%" colspan = 2>
                <gw:textbox id="txtItemName" styles="width:100%" csstype="mandatory"  />
            </td>
		</tr>
		<tr>
			<td align="right" style="width: 10%" >
                W/H
            </td>
             <td style="width: 90%" colspan = 2>
                <gw:list id="lstWarehouse" styles='width:100%' csstype="mandatory" onchange="OnSearch('STOCK')"/>
              </td>
		</tr>
		<tr>
			<td align="right" style="width: 10%; white-space: nowrap">
                Date
             </td>
            <td style="width: 90%" colspan = 2>
                 <gw:datebox id="dtStockDate" lang="1" onchange="OnSearch('STOCK')" />
             </td> 
        </tr>
        <tr>
			<td style="width: 1%">
                			 
            </td>
			<td style="width: 1%">                 
				<gw:button id="btnApprove" img="Approve" text="Approve" onclick="OnSave('Master')" />	
            </td>			 
		</tr>
		<tr style="height: 100%">
            <td colspan = 10>
				<gw:grid id='grdDetail' 
					header='_WH_PK|_STOCK_DATE|_ITEM_PK|Lot No|Before Adjust|Adjust Qty|After Adjust|Remark'
					format='0|0|0|0|0|0|0|0' 
					aligns='0|0|0|1|3|3|3|0'                                  
					editcol='0|0|0|0|0|1|1|0' 
					widths='0|0|0|1200|1500|1500|1500|1000'
					sorting='T' onafteredit="CheckInput()" 
					styles='width:100%; height:100%' />	

 
			</td>
        </tr>
    </table>
</body>
<gw:textbox id="txtItemPK" styles="display:none" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%;display:none" />
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------->
</html>
