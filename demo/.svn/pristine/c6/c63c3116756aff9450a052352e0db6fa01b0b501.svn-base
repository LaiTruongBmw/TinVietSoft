<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>SO/Cons Checking</title>
</head>

<script>
	var p_action  = 'view';  
		
	var G1_WH_NM		= 0,
		G1_OUT_DATE		= 1,
		G1_SLIP_NO	    = 2,
		G1_REF_NO    	= 3,
		G1_SEQ      	= 4,
		G1_ITEM_CODE	= 5,
		G1_ITEM_NAME	= 6,		 		
		G1_UOM			= 7,
		G1_OUT_QTY		= 8,
		G1_LINE_NAME	= 9,
		G1_CHARGER		= 10,		
		G1_REMARK 		= 11;
		
 var v_language = "<%=Session("SESSION_LANG")%>";

 //==================================================================
 function BodyInit()
 {
     
	System.Translate(document);
	
	//-----------------------------------
    FormatGrid();
	//----------------------------------- 
	
	var outgo_d_pk = "<%=request.QueryString("OUTGO_D_PK") %>";
      
    txtOutGoDPK.text = outgo_d_pk ;
	 
	OnSearch('grdOutGo');	 
    //-----------------------------------    
 } 
 //======================================================================
 function FormatGrid()
 {    
      var trl;   
	  //----------------------------------------------------
      trl = grdOutGo.GetGridControl();
      trl.ColFormat(G1_OUT_QTY)   = "###,###,###,###,###.##";
	  
	  trl.MergeCells = 2;
	  trl.MergeCol(0) = true;
      trl.MergeCol(1) = true;
      trl.MergeCol(2) = true;
	  trl.MergeCol(3) = true;
      //----------------------------------------------------                        
 }   
 
//=========================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        
		case 'grdOutGo' :       
			 //--------------------------------                
             data_dsos00052.Call("SELECT"); 
			 //--------------------------------           
        break;		                   
    }
}
 
 
//=========================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {         
		case 'data_dsos00052' :
           
            if ( grdOutGo.rows > 1 )
            {  
				grdOutGo.SetCellBold( 1, G1_ITEM_CODE, grdOutGo.rows - 1, G1_ITEM_CODE, true);
				grdOutGo.SetCellBold( 1, G1_OUT_QTY  , grdOutGo.rows - 1, G1_OUT_QTY,   true); 
				
				grdOutGo.Subtotal( 0, 2,-1, '8');
            }
			//--------------------------------
        break;				                  
    }
}  
 
//=========================================================================

</script>

<body>
	<!------------------------------------------------------------------>
    <gw:data id="data_dsos00052" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"   parameter="0,1,2,3" function="st_lg_sel_dsos00052" > 
                <input>					                     
					<input bind="txtOutGoDPK" />					 		                  
                </input> 
                <output bind="grdOutGo" /> 
            </dso> 
        </xml> 
    </gw:data>             
    <!-------------------------------------------------------------------->
	<table style="width: 100%; height: 100%" name="Balance Checking" >		 
		<tr style="height: 99%" >
			<td colspan=12 >
				<gw:grid id="grdOutGo" 
					 header="W/H|Date|Slip No|Ref No|Seq|Item Code|Item name|UOM|Out Qty|Line Name|Charger|Remark"
                     format="0|4|0|0|0|0|0|0|0|0|0|0" 
					 aligns="0|1|0|0|1|0|0|1|3|0|0|0" 
					 editcol="0|0|0|0|0|0|0|0|0|0|0|0" 
					 widths="1500|1200|1500|1500|800|1500|2500|800|1200|1500|1500|0"
                     styles="width:100%; height:100%" sorting="T" 
					 acceptnulldate="true" param="0,1,2,3,4" />
			</td>
		</tr>
	</table>
</body>
<!------------------------------------------------------------------------------->
<gw:textbox id="txtOutGoDPK" styles="width:100%;display:none"   />
<!------------------------------------------------------------------------------->
</html>
