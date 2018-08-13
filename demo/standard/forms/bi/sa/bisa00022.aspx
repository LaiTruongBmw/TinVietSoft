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
 
 var flag;  
 
 //---------------------------------------------------------
var G1_DETAIL_PK    = 0, 
    G1_MASTER_PK    = 1,
    G1_SEQ          = 2,
	G1_REF_NO       = 3,
    G1_ITEM_PK      = 4,
    G1_ITEM_CODE    = 5,
    G1_ITEM_NAME    = 6,
    G1_UOM          = 7,
    G1_LOT_NO       = 8,
	G1_BEF_ADJUST	= 9,
	G1_ADJUST_QTY	= 10,
	G1_AF_ADJUST	= 11,
	G1_REMARK		= 12;
	
var arr_FormatNumber = new Array();
//=======================================================================


function BodyInit()
{
    System.Translate(document);    
	//----------------------------
   
    BindingDataList(); 
	
    //-------------------------
	
	txtMasterPK.text = "<%=request.QueryString("master_pk")%>" ;
	OnSearch('grdDetail');
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
        case 'grdDetail':
            data_bisa00022_1.Call("SELECT");
        break;                
    }
}


//===============================================================================

function OnSave(pos)
{    
    switch(pos)
    { 
		case 'Master':
            data_bisa00022_1.Call();
            flag='save';        
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
		
		case 'data_bisa00022_1':
			if ( grdDetail.rows-1 > 0 )
			{
				grdDetail.SetCellBold( 1, G1_ADJUST_QTY, grdDetail.rows - 1, G1_ADJUST_QTY, true);	
				
				grdDetail.SetCellBgColor( 1, G1_AF_ADJUST , grdDetail.rows - 1, G1_AF_ADJUST , 0xCCFFFF );                			 					
			}					 
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
	/*var data ;
     
     data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id||' * ' || wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_name  ASC" )%>";    
     lstWarehouse.SetDataText(data);*/
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

 <!-----------------------grdDetail---------------------------------------->
    <gw:data id="data_bisa00022_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="st_lg_sel_bisa00022_1" procedure="st_lg_upd_bisa00022_1"> 
                <input>                      
                    <input bind="txtMasterPK" /> 
                    <input bind="txtItem" />                    
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>	
	<!---------------------------------------------------------------->
    <gw:data id="pro_bisa00030" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bisa00030" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bisa00030_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bisa00030_1" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>   
    <!---------------------------------------------------------------->
    <table style="width:100%;height:100%" >
        <tr>
			<td style="width: 1%">
                <gw:button id="btnApprove" img="Approve" text="Approve" onclick="OnProcess('Approve')" />				 
            </td>
			<td style="width: 1%">                 
				<gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
            </td>
			<td style="width: 53%">
			</td>			 		
			<td style="width: 5%" align="right">
				Item
			</td>                                     
			<td style="width: 35%; white-space: nowrap">
				<gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
			</td>
			<td style="width: 2%; white-space: nowrap">				 
			</td>
			<td style="width: 1%">
				<gw:button id="btnSearch_1" img="search" alt="Search" text="Search" onclick="OnSearch('grdDetail')" />
			</td>
			<td style="width: 1%">
                <gw:button id="idBtnLoadStock" img="Load Stock" text="Load Stock" onclick="OnPopUp('LoadStock')" />
            </td>
			<td style="width: 1%">
				<gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
			</td>
		</tr>
		<tr style="height: 100%">
            <td colspan = 10>
				<gw:grid id='grdDetail' 
					header='_PK|_OPEN_M_PK|Seq|Ref No|_ITEM_PK|Item Code|Item Name|UOM|Lot No|Before Adjust|Adjust Qty|After Adjust|Remark'
					format='0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|0|0|0|0|1|1|3|3|3|3'                                  
					editcol='0|0|1|1|0|0|0|0|0|0|1|1|1' 
					widths='0|0|800|1500|0|2000|3000|1000|1200|1500|1500|1500|1500'
					sorting='T' onafteredit="CheckInput()" 
					styles='width:100%; height:100%' />						
			</td>
        </tr>
    </table>
</body>
<gw:textbox id="txtMasterPK" styles="display:none" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%;display:none" />
<!---------------------------------------------------------------------->
</html>
