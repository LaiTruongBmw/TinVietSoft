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
		
	var G1_REF_NO		= 0,
		G1_GROUP		= 1,
		G1_ITEM_PK	    = 2,
		G1_ITEM_CODE	= 3,
		G1_ITEM_NAME	= 4,
		G1_SIZE			= 5,
		G1_COLOR		= 6,
		G1_REQ_QTY		= 7,
		G1_OUT_QTY		= 8,
		G1_BAL_QTY		= 9,
		G1_STOCK_QTY	= 10,
		G1_UOM			= 11,
		G1_OUTGO_D_PK 	= 12;
		
 var v_language = "<%=Session("SESSION_LANG")%>";

 //==================================================================
 function BodyInit()
 {
     
	System.Translate(document);
	
	//-----------------------------------
    FormatGrid();
	//----------------------------------- 
	
	var item = "<%=request.QueryString("item") %>";
      
    txtItem01.text = item ;
	
	if ( txtItem01.text != '' ) 
	{
		OnSearch('grdOutGo');
	}	
    //-----------------------------------    
 } 
 //======================================================================
 function FormatGrid()
 {    
      var trl;   
	  //----------------------------------------------------
      trl = grdOutGo.GetGridControl();
	  trl.ColFormat(G1_REQ_QTY)   = "###,###,###,###,###.##";	
      trl.ColFormat(G1_OUT_QTY)   = "###,###,###,###,###.##";
      trl.ColFormat(G1_BAL_QTY)   = "###,###,###,###,###.##";	  
	  trl.ColFormat(G1_STOCK_QTY) = "###,###,###,###,###.##";
	  
	  trl.MergeCells = 2;
	  trl.MergeCol(0) = true;
      trl.MergeCol(1) = true;
      trl.MergeCol(2) = true;
	  trl.MergeCol(3) = true;
      //----------------------------------------------------
	  var data = "";
 	  	  
	  data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' and ( mat_yn = 'Y' or sub_mat_yn = 'Y' or pur_yn='Y' or semi_prod_yn='Y' ) order by grp_cd ")%>||";     
      lstGroup01.SetDataText(data);
      lstGroup01.value = '';	                        
 }   
 
//=========================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        
		case 'grdOutGo' :       
			 //--------------------------------                
             data_dsos00051_2.Call("SELECT"); 
			 //--------------------------------           
        break;		                   
    }
}
 
 
//=========================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {         
		case 'data_dsos00051_2' :
            
            if ( grdOutGo.rows > 1 )
            {  
				grdOutGo.SetCellBold( 1, G1_REF_NO, grdOutGo.rows - 1, G1_REF_NO, true);
				              
                grdOutGo.SetCellBgColor( 1, G1_ITEM_CODE, grdOutGo.rows - 1, G1_ITEM_NAME, 0xCCFFFF ); 
				grdOutGo.SetCellBgColor( 1, G1_REQ_QTY,   grdOutGo.rows - 1, G1_STOCK_QTY, 0xCCFFFF );
				
				grdOutGo.Subtotal( 0, 2,-1, '7!8!9!10');
            }
			//--------------------------------
        break;				                  
    }
}  

//=========================================================================

function OnPopUp()
{
	if ( grdOutGo.row > 0 )
	{
		var fpath = System.RootURL + "/standard/forms/ds/os/dsos00052.aspx?OUTGO_D_PK=" + grdOutGo.GetGridData( grdOutGo.row, G1_OUTGO_D_PK) ;
    	var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:70;dialogHeight:25');		
	}
	else
	{
		alert("PLS SELECT ONE ROW ! ");
	}	 
}
//=========================================================================

</script>

<body>
	<!------------------------------------------------------------------>
    <gw:data id="data_dsos00051_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  parameter="0,1,2,3" function="st_lg_sel_dsos00051_2" > 
                <input>					                     
					<input bind="lstGroup01" />
					<input bind="txtItem01" />
					<input bind="txtRefNo01" />				                  
                </input> 
                <output bind="grdOutGo" /> 
            </dso> 
        </xml> 
    </gw:data>             
    <!-------------------------------------------------------------------->
	<table style="width: 100%; height: 100%" name="Balance Checking" >
		<tr style="height: 1%" >
			<td style="width: 5%; white-space:nowrap" align="right" >
				Group
			</td> 
			<td style="width: 30%; white-space:nowrap" align="left" >
				<gw:list id="lstGroup01" styles="width: 100%" onchange="OnSearch('grdOutGo')" />
			</td> 
			<td style="width: 5%; white-space:nowrap" align="right" >
				Item
			</td> 
			<td style="width: 20%; white-space:nowrap" align="left" >
				<gw:textbox id="txtItem01" styles="width:100%" onenterkey="OnSearch('grdOutGo')" />
			</td>
			<td style="width: 5%; white-space:nowrap" align="right" >
				Ref No
			</td> 
			<td style="width: 20%; white-space:nowrap" align="left" >
				<gw:textbox id="txtRefNo01" styles="width:100%" onenterkey="OnSearch('grdOutGo')" />
			</td>			  
			<td style="width: 10%; white-space:nowrap" align="right" >
				<gw:button img="select" alt="View Detail" id="btnSelect1" onclick="OnPopUp()" />				 
			</td>
			<td style="width: 5%; white-space:nowrap" align="right">
                <gw:button id="btnSearch03" img="search" onclick="OnSearch('grdOutGo')" />
            </td>	
		</tr>
		<tr style="height: 99%" >
			<td colspan=12 >
				<gw:grid id="grdOutGo" 
					 header="Ref No|Group|_DETAIL_PK|Item Code|Item name|Size|Color|Req Qty|Outgo Qty|Bal Qty|Stock Qty|UOM|_OUTGO_M_PK"
                     format="0|0|0|0|0|0|0|0|0|0|0|0|0" 
					 aligns="0|0|0|0|0|0|0|3|3|3|3|1|0" 
					 editcol="0|0|0|0|0|0|0|0|0|0|0|0|0" 
					 widths="1500|1500|0|1500|2500|1200|1200|1300|1300|1300|1300|800|0"
                     styles="width:100%; height:100%" sorting="T" 
					 acceptnulldate="true" param="0,1,2,3,4" />
			</td>
		</tr>
	</table>
</body>
<!------------------------------------------------------------------------------->
</html>
