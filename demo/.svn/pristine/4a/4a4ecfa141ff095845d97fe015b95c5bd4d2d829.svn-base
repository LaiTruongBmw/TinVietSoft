<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Measurement Details</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_ITEM_PK       = 0,
    G_ITEM_CODE     = 1,
    G_ITEM_NAME     = 2,    
    G_ITEM_UOM      = 3,
    G_TRANS_RATE_1  = 4,
    G_TRANS_UOM_1   = 5,
    G_TRANS_RATE_2  = 6,
    G_TRANS_UOM_2   = 7,    
    G_TRANS_RATE_3  = 8,
    G_TRANS_UOM_3   = 9,    
    G_TRANS_RATE_4  = 10,
    G_TRANS_UOM_4   = 11,    
    G_TRANS_RATE_5  = 12,
    G_TRANS_UOM_5   = 13;

//------------------------------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
	//-------------------------	
    var data = "";  
    
    data = "<%=CtlLib.SetListDataSQL("select pk,grp_cd || ' * ' || grp_nm from tlg_it_itemgrp v where del_if = 0 and LEAF_YN ='Y' ORDER BY grp_cd")%>||";       
    lstGroup.SetDataText(data);   
    lstGroup.value="";
            
	//---------------------------------------
	OnFormatGrid();
	//---------------------------------------
	
}
//------------------------------------------------------------------------------------------------
function OnFormatGrid()
{
    var trl;
    
    trl = grdDetail.GetGridControl();	
	
	trl.ColFormat(G_TRANS_RATE_1) = "###,###,###,###,###.#####";
    trl.ColFormat(G_TRANS_RATE_2) = "###,###,###,###,###.#####"; 
	trl.ColFormat(G_TRANS_RATE_3) = "###,###,###,###,###.#####";
    trl.ColFormat(G_TRANS_RATE_4) = "###,###,###,###,###.#####";
	trl.ColFormat(G_TRANS_RATE_5) = "###,###,###,###,###.#####";     
}
//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 'DETAIL':
                 data_agci00031.Call("SELECT");
        break;
    }
   
}
  
//======================================================================
function OnReceiveData(obj)
{
    switch(obj.id)
    {
        case 'data_agci00031':
			 if ( grdDetail.rows > 1 )
			 {
             	 	grdDetail.SetCellBold( 1, G_ITEM_CODE,   grdDetail.rows-1, G_ITEM_CODE,   true);
					grdDetail.SetCellBold( 1, G_ITEM_UOM,    grdDetail.rows-1, G_ITEM_UOM,    true);
					
					grdDetail.SetCellBold( 1, G_TRANS_UOM_1, grdDetail.rows-1, G_TRANS_UOM_1, true);
					grdDetail.SetCellBold( 1, G_TRANS_UOM_2, grdDetail.rows-1, G_TRANS_UOM_2, true);
					grdDetail.SetCellBold( 1, G_TRANS_UOM_3, grdDetail.rows-1, G_TRANS_UOM_3, true);
					
					grdDetail.SetCellBgColor( 1, G_TRANS_RATE_1,  grdDetail.rows - 1, G_TRANS_UOM_1,  0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G_TRANS_RATE_3,  grdDetail.rows - 1, G_TRANS_UOM_3,  0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G_TRANS_RATE_5,  grdDetail.rows - 1, G_TRANS_UOM_5,  0xCCFFFF );
			 }	
        break;
    }
}
 
//================================================================================================

function OnPopUp(pos)
{
	switch(pos)
	{
		case 'MODIFY' :
		 	var event_col = event.col ;
         	var event_row = event.row ;
		 
		 	if ( event_col == G_TRANS_UOM_1 || event_col == G_TRANS_UOM_2 || event_col == G_TRANS_UOM_3 )	
		 	{	
		 		var path = System.RootURL + '/form/fp/ab/fpab00640.aspx?p_item_pk=' + grdDetail.GetGridData( event_row, G_ITEM_PK ) + '&p_uom=' + grdDetail.GetGridData( event_row, event_col );	     	 
				var object = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:40;dialogHeight:10');	
		 	}	   	      
		break;
	}	
}

//=================================================================================================

</script>

<body>     
    <!---------------------------------------------------------------->
    <gw:data id="data_agci00031" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_agci00031" > 
                  <input bind="grdDetail" >				  	  
                    <input bind="lstGroup" />
                    <input bind="txtItem" />					 
                  </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">        
        <tr style="height: 1%">		    
            <td style="width: 5%" align="right">
                Group
            </td>
            <td style="width: 45%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch('DETAIL')" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
                Item
            </td>
            <td style="width: 30%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('DETAIL')" />
            </td>
            <td style="width: 14%" align="center">                 
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('DETAIL')" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="7">
                <gw:grid id="grdDetail" 
					header="_PK|Item Code|Item Name|UOM|Rate 1|UOM 1|Rate 2|UOM 2|Rate 3|UOM 3|Rate 4|UOM 4|Rate 5|UOM 5"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					aligns="0|0|0|1|3|1|3|1|3|1|3|1|3|1"
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					widths="0|2000|4000|1000|1200|1000|1200|1000|1200|1000|1200|1000|1200|1000"
                    styles="width:100%; height:100%" sorting="T" oncelldblclick="OnPopUp('MODIFY')" />
            </td>
        </tr>         
    </table>
    <!---------------------------------------------------------------->
</body>
</html>
