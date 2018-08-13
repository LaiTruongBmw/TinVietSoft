<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Outgoing Req Item</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//======================================================================    

var G_SALEORDER_M_PK        = 0,
    G_SLIP_NO               = 1,
    G_ORDER_DT              = 2,
    G_PO_NO                 = 3,
    G_BILL_TO_PK            = 4,
    G_BILL_TO_NAME          = 5,
    G_SALEORDER_D_PK        = 6,
    G_TCO_ITEM_PK           = 7,
    G_ITEM_CODE             = 8,
    G_ITEM_NAME             = 9,
    G_ORD_UOM               = 10, 
	G_ORD_QTY				= 11,
    G_ITEM_ETD              = 12,
    G_ITEM_ETA              = 13;
    
//======================================================================

function BodyInit()
{
	System.Translate(document);
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate = dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //----------------------------   
    FormatGrid();
    
}
//======================================================================
 function FormatGrid()
 {           
    var ctrl = idGrid.GetGridControl(); 
    
    //ctrl.ColFormat(G_REQ_QTY) = "#,###,###,###,###,###.##";
    //ctrl.ColFormat(G_TR_QTY)  = "#,###,###,###,###,###.##";
    //ctrl.ColFormat(G_BAL_QTY) = "#,###,###,###,###,###.##";
    
    idGrid.GetGridControl().MergeCells  = 2 ;	
    idGrid.GetGridControl().MergeCol(0) = true ;	
    idGrid.GetGridControl().MergeCol(1) = true ;   	
    idGrid.GetGridControl().MergeCol(2) = true ;	
    idGrid.GetGridControl().MergeCol(3) = true ;	
    idGrid.GetGridControl().MergeCol(4) = true ; 
    idGrid.GetGridControl().MergeCol(5) = true ; 
 } 
//======================================================================

function OnSearch()
{
    fpab00500.Call("SELECT");
}        
//======================================================================
function OnSelect(oGrid)
{   
          var arr_data = new Array();
   
   if(oGrid.rows > 1)
   {   
      for(var i=1;i<oGrid.rows;i++)
      {
         var arrTemp=new Array();
         
         for(var j=0;j<oGrid.cols;j++)
         {
            arrTemp[arrTemp.length]= oGrid.GetGridData(i,j);
         }
         
         arr_data[arr_data.length]= arrTemp;
      }
      
	  if ( arr_data !=null )
	  {
		window.returnValue =  arr_data;
		window.close();
	  }
	  else
	  {
	    alert("You have not selected data yet.");
	  }
   }	   	
}

//======================================================================
function OnDataReceive(obj)
{
//    if ( idGrid.rows > 1 )
//    {
//         idGrid.SetCellBgColor( 1, G_ITEM_CODE, idGrid.rows-1,  G_ITEM_NAME, 0xCCFFFF );
//         idGrid.SetCellBgColor( 1, G_BAL_QTY, idGrid.rows-1,    G_BAL_QTY, 0xCCFFFF );
//         
//         idGrid.SetCellBold( 1, G_REF_NO, idGrid.rows - 1,    G_REF_NO, true); 
//         idGrid.SetCellBold( 1, G_ITEM_CODE, idGrid.rows - 1, G_ITEM_CODE, true);
//         
//         idGrid.SetCellBold( 1, G_REQ_QTY, idGrid.rows - 1, G_BAL_QTY, true);  
//         idGrid.SetCellBold( 1, G_LOT_NO,  idGrid.rows - 1, G_LOT_NO,  true);
//    }
}
//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G_SALEORDER_D_PK);		
		
        if ( row > 0 && ( !CheckDataExist( idGrid2, col_val)) )
        {
            SetRowBackGroundColor( oGrid, col_val, 0x0000FF);
            
	        idGrid2.AddRow();
    		
	        for(var j=0; j<oGrid.cols; j++)
	        {
	            idGrid2.SetGridText( idGrid2.rows-1, j, oGrid.GetGridData( row, j) );
	        }
        }
		
	}
    
    countItem();    
}
//================================================================================================

function CheckDataExist(p_oGrid,p_value)
{
    if ( chkDuplicate.value == 'Y' )
    {
        return false ;
    }
    
      for(var i=1;i<p_oGrid.rows;i++)
       {
          if(p_oGrid.GetGridData(i, G_SALEORDER_D_PK) == p_value)
          {
             return true;
          }
       }
       return false;
}
//================================================================================================

function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, G_SALEORDER_D_PK ) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
//======================================================================
function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}
//======================================================================

function OnGridCellDoubleClick(oGrid)
{
  if(oGrid.id == "idGrid" && event.row > 0 )
  {
    var col_val = oGrid.GetGridData(event.row, G_SALEORDER_D_PK );
    if(event.row > 0 && ( !CheckDataExist(idGrid2,col_val)) )
    {
        SetRowBackGroundColor(oGrid,col_val,0x0000FF);
		idGrid2.AddRow();
		for(var i=0;i<oGrid.cols;i++)
		{
		  idGrid2.SetGridText(idGrid2.rows-1,i,oGrid.GetGridData(event.row,i));
		}
     }
  }
  countItem()
}
//-------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData( idGrid2.row, G_SALEORDER_D_PK);
    
    idGrid2.RemoveRowAt(idGrid2.row);
    
    SetRowBackGroundColor(idGrid,col_val,0x000000); 
    
    countItem()
  }
 }
 //======================================================================
function OnExit()
{
    window.close();
} 
//======================================================================

</script>

<body>
    <!--------------------------------------------------------->
    <gw:data id="fpab00500" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="st_lg_sel_fpab00500" > 
                <input> 
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtSearchNo" />
                </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 1%">
            <td colspan="6">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="white-space: nowrap; width: 20%">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~
                            <gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            No
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSearchNo" styles="width:100%;" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="center">
                        </td>
                        <td style="width: 28%">
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnExit" img="cancel" alt="Exit" text="Exit" onclick="OnExit()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="6">
                <gw:grid id='idGrid' header='_SALEORDER_M_PK|Slip No|Order Date|P/O No|_BILL_TO_PK|Bill To|_SALEORDER_D_PK|_TCO_ITEM_PK|Item Code|Item Name|UOM|Ord Qty|Item ETD|Item ETA'
                    format='0|0|4|0|0|0|0|0|0|0|0|1|4|4' aligns='0|0|0|0|0|0|0|0|0|0|1|0|1|1' check='|||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' autosize='T' styles='width:100%; height:100%' oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr>
            <td style="width: 96%" align="center">
                <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
            </td>
            <td style="width: 1%" align="right" style="white-space: nowrap">
                <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" />
                Duplicate
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(idGrid)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
            </td>
            <td style="width: 1%">
                <gw:button id="btnSelect" img="select" alt="Select" text="Select" onclick="OnSelect(idGrid2)" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="6">
                <gw:grid id='idGrid2' header='_SALEORDER_M_PK|Slip No|Order Date|P/O No|_BILL_TO_PK|Bill To|_SALEORDER_D_PK|_TCO_ITEM_PK|Item Code|Item Name|UOM|Ord Qty|Item ETD|Item ETA'
                    format='0|0|0|0|0|0|0|0|0|0|0|1|4|4' aligns='0|0|0|0|0|0|0|0|0|0|1|0|1|1' check='|||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' autosize='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
    <gw:textbox id="txtType" styles="width:100%;display:none" />
    <!-------------------------------------------------------------------------->
</body>
</html>
