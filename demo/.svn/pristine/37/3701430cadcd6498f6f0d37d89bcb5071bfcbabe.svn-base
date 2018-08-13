<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">

<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head>
    <title>POP UP GET SCAN DATA</title>
</head>

<script type="text/javascript" language="javascript">

//=========================================================================================
var G1_TR_DATE		= 0,
	G1_ITEM_BC		= 1,
	G1_ITEM_CODE	= 2,
	G1_ITEM_NAME	= 3,
	G1_UOM			= 4,
	G1_TR_QTY		= 5,
	G1_LOT_NO		= 6,
	G1_WH_ID		= 7,
	G1_WH_NAME		= 8,
	G1_WH_LOC		= 9,
	G1_PRO_YN		= 10,
	G1_PRO_TIME		= 11,
	G1_TR_PK		= 12;
//=================================================================================

function BodyInit()
{     
    System.Translate(document);
    BindingDataList();         
}
//=================================================================================

function BindingDataList()
{    
	//-------------------------------------------
    var data="";    
	
	var p_type = "<%=Request.querystring("p_type")%>";	
	
    data = "data|1|INCOMING|2|OUTGOING";
    lstTransType.SetDataText( data);
    lstTransType.value = p_type ;	  
    //-------------------------------------------
	var warehouse_pk = "<%=Request.querystring("warehouse_pk")%>";	
	  
    data = "<%=CtlLib.SetListDataSQL("select pk, WH_ID || ' * ' || WH_NAME from TLG_IN_WAREHOUSE a where  del_if=0 order by WH_ID ")%>||";
    lstWarehouse.SetDataText( data);
    lstWarehouse.value = warehouse_pk ;	
	//-------------------------------------------
	var ctr = grdMaster.GetGridControl();     
    ctr.ColFormat(G1_TR_QTY) = "#,###,###,###,###,###.##";	
	//-------------------------------------------	 

} 
//=================================================================================
function OnSearch()
{
     data_fpab00680.Call('SELECT');    
}

//=================================================================================

function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'data_fpab00680':			 
			if ( grdMaster.rows > 1 )
			{   				   				 			  
   				grdMaster.SetCellBold( 1, G1_ITEM_BC, grdMaster.rows - 1, G1_ITEM_BC, true);  
							
				grdMaster.SetCellBgColor( 1, G1_ITEM_CODE, grdMaster.rows - 1, G1_ITEM_NAME, 0xFFFFCC );					
				grdMaster.SetCellBgColor( 1, G1_WH_ID,     grdMaster.rows - 1, G1_WH_NAME,   0xCCFFFF );					
			}	
		break;
		 
	}
}

//=========================================================================================================

function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == "grdMaster" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, G1_TR_PK );
            
            if(event.row > 0 && ( !CheckDataExist(grdSelect,col_val)) )
            {
                SetRowBackGroundColor(oGrid,col_val,0x0000FF);
		        grdSelect.AddRow();
		        for(var i=0;i<oGrid.cols;i++)
		        {
		          grdSelect.SetGridText(idGrid2.rows-1,i,oGrid.GetGridData(event.row,i));
		        }
            }
      }
      countItem()
}

//=========================================================================================================
function OnRemove()
{
  	if(grdSelect.row > 0)
  	{
    	var col_val = grdSelect.GetGridData( grdSelect.row, G1_TR_PK);
    
    	grdSelect.RemoveRowAt(grdSelect.row);
    
    	SetRowBackGroundColor(grdMaster,col_val,0x000000); 
    
    	countItem();
  	}
}
 
//=========================================================================================================

function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, G1_TR_PK) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}

//=========================================================================================================
 
function countItem()
{
    lblCount.text=grdSelect.rows-1 + " item(s)."
}
//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G1_TR_PK);		
		
        if ( row > 0 && ( !CheckDataExist( grdSelect, col_val)) )
        {
            SetRowBackGroundColor( oGrid, col_val, 0x0000FF);
            
	        grdSelect.AddRow();
    		
	        for(var j=0; j<oGrid.cols; j++)
	        {
	            grdSelect.SetGridText( grdSelect.rows-1, j, oGrid.GetGridData( row, j) );
	        }
        }		
	}
    
    countItem();    
}
//=========================================================================================================
function CheckDataExist(p_oGrid,p_value)
{
    if ( chkDuplicate.value == 'Y' )
    {
        return false ;
    }
    
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, G1_TR_PK) == p_value)
              {
                 return true;
              }
       }
       return false;
}
//=========================================================================================================
</script>

<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpab00680" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_fpab00680" > 
                <input> 
                     <input bind="lstTransType" />   
                     <input bind="dtDateFrom" />  
                     <input bind="dtDateTo" />  
                     <input bind="txtBCLotNo" />  
					 <input bind="txtItem" />
					 <input bind="lstWarehouse" />
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>    
    <!------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%;">
        <tr style="width: 100%; height: 1%; white-space: nowrap;">   
			<td style="width: 5%; white-space: nowrap" align="right" >
                W/H
            </td>            
			<td style="width: 30%; white-space: nowrap;">
                <gw:list id="lstWarehouse" text="" styles="width:100%" onchange="OnSearch()" />
            </td>	         
            <td style="width: 5%; white-space: nowrap" align="right" >
                Date
            </td>
            <td style="width: 15%; white-space: nowrap;">
                <gw:datebox id="dtDateFrom" styles="width:100%" lang="<%=Session("Lang")%>" mode="01" />
                ~
                <gw:datebox id="dtDateTo" styles="width:100%" lang="<%=Session("Lang")%>" mode="01" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right" >
                Item
            </td>
            <td style="width: 15%; white-space: nowrap;">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch()"/>
            </td>
			 <td style="width: 5%; white-space: nowrap" align="right" >
                BC/Lot No
            </td>
            <td style="width: 15%; white-space: nowrap;">
                <gw:textbox id="txtBCLotNo" styles="width:100%" onenterkey="OnSearch()"/>
            </td>
			
            <td style="width: 4%">
            </td>		                                        
            <td style="width: 1%">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="width: 100%; height: 49%">
            <td colspan="17">
                <gw:grid id='grdMaster' 
                    header='Tr Date|Item BC|Item Code|Item Name|UOM|Tr Qty|Lot No|W/H ID|W/H Name|W/H Loc|Process Y/N|Process Time|_TR_PK'
                    format='4|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='1|0|0|0|1|3|1|0|0|1|1|1|0' 			 
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='1200|1300|1500|3000|800|1200|1300|1500|2500|1500|1200|1000|0'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick="OnGridCellDoubleClick(this)"  />
            </td>
        </tr>
		<tr style="width: 100%; height: 1%" >
			<td colspan="17" >
				<table style="width: 100%; height: 100%">
					<tr>
						<td style="width: 96%" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 1%" style="white-space: nowrap">
                            <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" />
                            Duplicate
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(grdMaster)" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdSelect)" />
                        </td>
					</tr>
				</table>
			</td>
		</tr>
		<tr style="width: 100%; height: 49%" >
			<td colspan="17">
                <gw:grid id='grdSelect' 
                    header='Tr Date|Item BC|Item Code|Item Name|UOM|Tr Qty|Lot No|W/H ID|W/H Name|W/H Loc|Process Y/N|Process Time|_TR_PK'
                    format='4|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='1|0|0|0|1|3|1|0|0|1|1|1|0' 			 
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='1200|1300|1500|3000|800|1200|1300|1500|2500|1500|1200|1000|0'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
		</tr>
    </table>
   
</body>

 <!--------------------------------------------------------->	
	<gw:list id="lstTransType" text="" styles="width:100%;display:none"  />
	<!--------------------------------------------------------->
 </html>