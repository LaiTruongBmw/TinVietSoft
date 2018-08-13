<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Production Closing Detail</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

//-----------------------------------------------------

var G1_WH			= 0,
	G1_DATE			= 1,
	G1_TRANS		= 2,
	G1_SLIP_NO		= 3,
	G1_ITEM_CODE	= 4,
	G1_ITEM_NAME	= 5,
	G1_UOM			= 6,
	G1_QTY    		= 7;
	
var G2_WH			= 0,
	G2_DATE			= 1,
	G2_TRANS		= 2,
	G2_SLIP_NO		= 3,
	G2_ITEM_CODE	= 4,
	G2_ITEM_NAME	= 5,
	G2_UOM			= 6,
	G2_QTY    		= 7;	

//=================================================================================
var G3_DETAIL_PK    	= 0, 
    G3_MASTER_PK    	= 1,         
    G3_PROD_ITEM_PK     = 2,
    G3_PROD_CODE    	= 3,
    G3_PROD_NAME    	= 4,
    G3_PROD_UOM         = 5,   
    G3_PROD_QTY       	= 6,
    G3_MAT_ITEM_PK      = 7,
    G3_MAT_CODE    		= 8,
    G3_MAT_NAME 		= 9,
	G3_MAT_UOM			= 10,
    G3_ST_QTY       	= 11,
    G3_CONS_QTY    		= 12;
 
 //===============================================================================================
function BodyInit()
 {
    System.Translate(document);  // Translate to language session    
 
	var p_master_pk = "<%=request.QueryString("p_master_pk") %>";
	
	txtMasterPK.text = p_master_pk;
    //----------------------------         
    SetGridFormat();  
    //----------------------------
    OnSearch("grdOut");
 }
 //==================================================================================
 
 function SetGridFormat()
 {             
    grdOut.GetGridControl().ColFormat(G1_QTY) = "#,###,###,###,###,###.##";                          
	grdIn.GetGridControl().ColFormat(G2_QTY)  = "#,###,###,###,###,###.##"; 
	
    grdCons.GetGridControl().ColFormat(G3_PROD_QTY) = "#,###,###,###,###,###.##"; 
	grdCons.GetGridControl().ColFormat(G3_ST_QTY) 	= "#,###,###,###,###,###.##";
	grdCons.GetGridControl().ColFormat(G3_CONS_QTY) = "#,###,###,###,###,###.##";	
 }
 
//=============================================================================================
function OnSearch(pos)
{
    switch(pos)
    {        
        case 'grdOut':
			data_fppr00321_1.Call("SELECT");                                   
        break;
		
        case 'grdIn':
			data_fppr00321_2.Call("SELECT");                                   
        break;
		
        case 'grdCons':
			data_fppr00321_3.Call("SELECT");                                   
        break;
    }
}
 
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case'data_fppr00321_1':
            OnSearch('grdIn'); 
        break; 
		
		case'data_fppr00321_2':
            OnSearch('grdCons'); 
        break; 	

		case'data_fppr00321_3':
			if ( grdCons.rows > 1 )
			{
				grdCons.SetCellBgColor( 1, G3_PROD_CODE, grdCons.rows - 1, G3_PROD_UOM, 0xCCFFFF );
				grdCons.SetCellBgColor( 1, G3_MAT_CODE,  grdCons.rows - 1, G3_MAT_UOM,  0xFFFFCC );				
                
                grdCons.Subtotal( 0, 2, -1, '6!12');
			}	
        break; 	
    }          
}
    
//=================================================================================
</script>

<body>   
    <!---------------------------------------------------------------->
    <gw:data id="data_fppr00321_1" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fppr00321_1"  > 
                <input bind="grdOut">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdOut" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fppr00321_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fppr00321_2"  > 
                <input bind="grdIn">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdIn" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fppr00321_3" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fppr00321_3"    > 
                <input bind="grdCons">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdCons" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->   
    <table style="width: 100%; height: 100%">                     
        <tr style="height: 55%">                         
			<td style="width: 50%">                                         
                <gw:grid id='grdOut' header='W/H|Date|Trans|Slip No|Item Code|Item Name|UOM|Qty'
                    format='0|4|0|0|0|0|0|0' 
					aligns='0|1|0|0|0|0|1|3' 				 
                    editcol='0|0|0|0|0|0|0|0' 
					widths='2000|1200|1500|1200|1500|3000|800|1500'
                    sorting='T' 
					styles='width:100%; height:100%' />                                             
            </td>		 
			<td style="width: 50%">                                        
                <gw:grid id='grdIn' header='W/H|Date|Trans|Slip No|Item Code|Item Name|UOM|Qty'
                    format='0|4|0|0|0|0|0|0' 
					aligns='0|1|0|0|0|0|1|3' 				 
                    editcol='0|0|0|0|0|0|0|0' 
					widths='2000|1200|1500|1200|1500|3000|800|1500'
                    sorting='T' 
					styles='width:100%; height:100%' />                                               
            </td>                               
        </tr>
		<tr style="height: 45%">                         
			<td style="width: 100%" colspan=2 >                                         
				<gw:grid id='grdCons' 
					header='_PK|_M_PK|_PROD_PK|Prod Code|Prod Name|UOM|Prod Qty|_MAT_PK|Mat Code|Mat Name|UOM|S/T Qty|Cons Qty'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|1|3|0|0|0|1|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='0|0|0|1500|3000|800|1500|0|1500|3000|800|1500|1500'
                    sorting='T' styles='width:100%; height:100%'   />                                              
            </td>			                     
        </tr>		
    </table>
 
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" />
<!------------------------------------------------------------------------------>
</html>
