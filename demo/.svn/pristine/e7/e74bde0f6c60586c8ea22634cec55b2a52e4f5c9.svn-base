<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head>
    <title>Warehouse Location Entry</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_DETAIL_PK		= 0,
	G_STORAGE_PK	= 1,
	G_STORAGE_ID	= 2,	
	G_ROW			= 3,
	G_STAIR			= 4,
	G_COLUMN		= 5,
	G_RACK_ID		= 6,
	G_USE_YN		= 7,
	G_STORE_QTY 	= 8,
	G_REMARK		= 9;
	
var G2_ITEM_PK		= 0,
	G2_SEQ			= 1,
	G2_ITEM_CODE	= 2,
	G2_ITEM_NAME	= 3,	
	G2_UOM			= 4,
	G2_STORE_QTY	= 5;	
	
var arr_FormatNumber = new Array();
var arr_ForNum_ITEM  = new Array();

//======================================================================

function BodyInit()
{
    System.Translate(document); 
	
    BindingDataList();
	
	dat_ItemGroupTree.Call('SELECT');
}

//======================================================================

function BindingDataList()
{
	var data = '';
	
	data = "<%=CtlLib.SetListDataSQL("select a.pk,a.STRG_ID || ' * ' || a.STRG_NAME from tlg_in_storage a where a.del_if = 0 order by a.STRG_ID")%>||Select ALL";	
	lstStorage.SetDataText(data);
	lstStorage.value = '';
	
	data = "<%=CtlLib.SetGridColumnDataSQL("select a.pk, a.STRG_ID || ' * ' || a.STRG_NAME from tlg_in_storage a where a.del_if = 0 order by a.STRG_ID " ) %> ";       
	grdWHLocation.SetComboFormat(G_STORAGE_PK,data);
	
	var ctr = grdWHLocation.GetGridControl(); 
    ctr.ColFormat(G_STORE_QTY) = "#,###,###,###,###,###.##";
	
	arr_FormatNumber[G_STORE_QTY] = 2;
	
	var ctr = grdItem.GetGridControl(); 
    ctr.ColFormat(G2_STORE_QTY) = "#,###,###,###,###,###.##";
	
	arr_ForNum_ITEM[G2_STORE_QTY] = 2;	
}

//======================================================================

function OnSearch(pos)
{
	switch(pos)
	{
		case 'WH_LOC':		
			idData_grdWHLocation.Call("SELECT");
		break;
			
		case 'ITEM_LIST':
			txtGroup_PK.SetDataText(oTree.GetCurrentNode().oid);
            
			data_agfp00040_2.Call("SELECT");		
		break;
	}	
}

//======================================================================

function OnAdd()
{
    if (lstStorage.GetData() == '')
    {
        alert('Please select one Storage.')
        return;
    }
    else
    {
        grdWHLocation.AddRow();
        grdWHLocation.SetGridText(grdWHLocation.rows - 1, G_STORAGE_PK, lstStorage.value);                
    }
}

//======================================================================

function OnDelete()
{
	grdWHLocation.DeleteRow();
}

//======================================================================

function OnUDelete()
{
	grdWHLocation.UnDeleteRow();
}

//======================================================================

function OnSave(pos)
{
	switch(pos)
	{
		case 'STORAGE':
			for (var row = 1; row < grdWHLocation.rows; row++)
			{
				if (grdWHLocation.GetGridData(row, G_STORAGE_PK) == '')
				{
					if (lstStorage.value == '')
					{
						alert('Please select one Storage.')
						return;
					}
					else
					{
						grdWHLocation.SetGridText(row, G_STORAGE_PK, lstStorage.value);									
					}			
				}
        
				/*if (grdWHLocation.GetGridData(row, 4) == '')
				{
					alert('Please input Area.');
					return;
				}
				
				if (grdWHLocation.GetGridData(row, 5) == '')
				{
					alert('Please input Floor.');
					return;
				}
				
				if (grdWHLocation.GetGridData(row, 6) == '')
				{
					alert('Please input Room.');
					return;
				}*/
			}
    
    		idData_grdWHLocation.Call();	
		break;
		
		case 'ITEM':
			data_agfp00040_2.Call();
		break;
	}
	

}

//======================================================================

function OnGridAfterEdit()
{
    if (grdWHLocation.col == G_STORAGE_ID || grdWHLocation.col == G_ROW || grdWHLocation.col == G_STAIR || grdWHLocation.col == G_COLUMN)
    {
        var temp = grdWHLocation.GetGridData(grdWHLocation.row, G_STORAGE_ID) + grdWHLocation.GetGridData(grdWHLocation.row, G_ROW) + grdWHLocation.GetGridData(grdWHLocation.row, G_STAIR) + grdWHLocation.GetGridData(grdWHLocation.row, G_COLUMN);
	    grdWHLocation.SetGridText(grdWHLocation.row, G_RACK_ID, temp);
    }
}

//======================================================================

function OnExcel()
{
      var url =System.RootURL + '/reports/ag/fp/agfp00040.aspx'  ;
      window.open(url); 
}

//======================================================================

function CheckInput(obj)
{   
	switch (obj.id)
	{
		case 'grdWHLocation':
			var  row, col 
        
			row = event.row ;
			col = event.col ;    
        
			if ( col == G_STORE_QTY ) 
			{      
				var dQuantiy
        
				dQuantiy =  grdWHLocation.GetGridData(row,col)
        
				if (Number(dQuantiy))
				{   
					if (dQuantiy >0)
					{
						grdWHLocation.SetGridText(row,col, System.Round( dQuantiy, arr_FormatNumber[col]));
					}
					else
					{
						grdWHLocation.SetGridText(row,col,"")
					}
				}
				else
				{
					grdWHLocation.SetGridText(row,col,"")
				}          
			} 		
		break;
		
		case 'grdItem':
			var  row, col 
        
			row = event.row ;
			col = event.col ;    
        
			if ( col == G2_STORE_QTY ) 
			{      
				var dQuantiy
        
				dQuantiy =  grdItem.GetGridData(row,col)
        
				if (Number(dQuantiy))
				{   
					if (dQuantiy >0)
					{
						grdItem.SetGridText(row,col, System.Round( dQuantiy, arr_ForNum_ITEM[col]));
					}
					else
					{
						grdItem.SetGridText(row,col,"")
					}
				}
				else
				{
					grdItem.SetGridText(row,col,"")
				}          
			} 				
		break;
	}	    
} 
 
//======================================================================

</script>

<body>
	<!------------------------------------------------------------------------------->
    <gw:data id="data_agfp00040_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5" function="st_lg_sel_agfp00040_2" procedure="st_lg_upd_agfp00040_2" > 
                <input bind="grdItem" > 
                    <input bind="txtItem" /> 
                    <input bind="txtGroup_PK" />
                </input> 
                <output bind="grdItem" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------------------->
    <gw:data id="dat_ItemGroupTree" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree"  function="st_lg_sel_agfp00040_1" > 
                <input>
                                       
                </input>
                <output bind="oTree" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------------------->
	<gw:data id="idData_grdWHLocation">
                    <xml>
                        <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="st_lg_sel_agfp00040" procedure="st_lg_upd_agfp00040">
                            <input bind="grdWHLocation" >
				                <input bind="lstStorage" />
                                <input bind="txtRow" />
                                <input bind="txtStair" />
                                <input bind="txtColumn" />
								<input bind="txtRack" />
                            </input>
                            <output bind="grdWHLocation" />
                        </dso>
                    </xml>
    </gw:data>
	<!------------------------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 10%" align="right">
                <b>Storage</b></td>
            <td style="width: 20%">
                <gw:list id="lstStorage" styles="width:100%" onclick="OnSearch('WH_LOC')" />
            </td>
            <td style="width: 5%" align="right">
                <b>Row</b></td>
            <td style="width: 10%">
                <gw:textbox id="txtRow" styles="width:100%" />
            </td>
            <td style="width: 5%" align="right">
                <b>Stair</b></td>
            <td style="width: 10%">
                <gw:textbox id="txtStair" styles="width:100%" />
            </td>
            <td style="width: 5%" align="right">
                <b>Column</b></td>
            <td style="width: 10%">
                <gw:textbox id="txtColumn" styles="width:100%" />
            </td>
			<td style="width: 5%" align="right">
                <b>Rack</b></td>
            <td style="width: 10%">
                <gw:textbox id="txtRack" styles="width:100%" />
            </td>
            <td style="width: 4%" align="right">
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btSearch" img="search" alt="Search" onclick="OnSearch('WH_LOC')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btNew" img="new" alt="Add" onclick="OnAdd()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btDel" img="delete" alt="Delete" onclick="OnDelete()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btUnDel" img="udelete" alt="UnDelete" onclick="OnUDelete()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btSave" img="save" alt="Save" onclick="OnSave('STORAGE')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btExcel" img="excel" alt="Excel" onclick="OnExcel()" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="20">
                
                <gw:grid id="grdWHLocation" 
					header="_pk|Storage|Storage ID|Row|Stair|Column|Rack ID|Active|Store Qty|Remark"
                    format="0|0|0|0|0|0|0|3|0|0" 
					aligns="0|1|0|0|0|0|0|0|3|0" 
					defaults="|||||||-1||"
                    editcol="0|1|1|1|1|1|1|1|1|1" 
					widths="0|1500|1500|1500|1500|1500|2000|1000|1500|0"
                    styles="width:100%; height:100%" sorting="T" 
					onafteredit="OnGridAfterEdit(); CheckInput(this);"
                    param="0,1,2,3,4,5,6,7,8,9" />
            </td>
        </tr>
		<tr style="height: 50%" >
			<td colspan="20">
				<table style="height: 100%; width: 100%"  >
					<tr style="height: 1%" >	
						<td style="width: 40%" rowspan=2 >
							<gw:tree id="oTree" style="width: 100%; height: 100%; overflow: auto;" onclicknode="OnSearch('ITEM_LIST')" />
						</td>	
						<td style="width: 5%" align="right">
                            Item
						</td>
                        <td style="width: 53%">
                            <gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch('ITEM_LIST')" />
                        </td>
						<td style="width: 1%" valign="bottom" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('ITEM_LIST')" />
                        </td>                         
                        <td style="width: 1%" valign="bottom" align="right">
                            <gw:imgbtn id="ibtnSave" img="save" alt="Save Item" text="Save Item" onclick="OnSave('ITEM')" />
                        </td>						
					</tr>				 
					<tr style="height: 99%">
						<td style="width: 60%" colspan=4 >
							<gw:grid id="grdItem" 
								header='_Pk|Seq|Item Code|Item Name|UOM|Store Qty'
                                format='0|0|0|0|0|0'
                                aligns='0|1|0|0|1|3'
                                defaults='|||||' 
								editcol='0|0|0|0|0|1'
                                widths='0|600|1500|2500|800|1500'
                                styles="width:100%; height:100%" 								 
								onafteredit="CheckInput(this)" /> 
						</td>
					</tr>
				<table>		
			</td>
		</tr>
    </table>
    <!------------------------------------------------------------------------------>
    <gw:textbox id="txtGroup_PK" styles='display:none' />	
	<!------------------------------------------------------------------------------>
</body>
</html>
