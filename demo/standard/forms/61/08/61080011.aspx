<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Many Item</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>

var G_tco_item_pk       = 0,
    G_Item_Code         = 1,
    G_Item_Name         = 2,
    G_Spec              = 3,
    G_Unit_CD           = 4,
    G_Unit              = 5,
    G_AlterUnit_CD      = 6,
    G_AlterUnit         = 7,
    G_Last_Price        = 15;
//------------------------------------------------------------------------------------------------
function BodyInit()
{
	 BindingDataList();
	// data_shab00010_1.Call("SELECT");
}
//-----------------------------------------------------------------------------------------------
function BindingDataList()
 {    
     
 }
//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                 data_kpsh00021.Call("SELECT");
        break;
    }
   
}
//-----------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData( idGrid2.row, G_tco_item_pk);
    
    idGrid2.RemoveRowAt(idGrid2.row);
    
    SetRowBackGroundColor(idGrid,col_val,0x000000); 
    
    countItem()
  }
}
//-------------------------------------------------------------------------------------------------
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, G_tco_item_pk) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
//-------------------------------------------------------------------------------------------------
function CheckDataExist(p_oGrid,p_value)
{
    if ( chkDuplicate.value == 'Y' )
    {
        return false ;
    }
    
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, G_tco_item_pk) == p_value)
              {
                 return true;
              }
       }
       return false;
}
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
      if( oGrid.row > 0 )
      {
            var col_val = oGrid.GetGridData(oGrid.row, G_tco_item_pk );
            if(oGrid.GetGridData(oGrid.row,0)!="")
            {
                if(oGrid.row > 0 && ( !CheckDataExist(idGrid2,col_val)) )
                {
                     SetRowBackGroundColor(oGrid,col_val,0x0000FF);
		            idGrid2.AddRow();
		            for(var i=0;i<oGrid.cols;i++)
		            {
		              idGrid2.SetGridText(idGrid2.rows-1,i,oGrid.GetGridData(oGrid.row,i));
		            }
                }
            }
             
      }
      countItem()
}
//------------------------------------------------------------------------------------------------
function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}
//======================================================================
function OnReceiveData(obj)
{
    switch(obj.id)
    {
        case 'data_kpsh00021':
            lblRecord2.text = idGrid.rows-1 + " (s)";
        break;
    }
}
//================================================================================================
function OnAddNew()
{
    idGrid.AddRow();
}
//================================================================================================
function OnSave()
{
    data_kpsh00021.Call();
}
//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G_tco_item_pk);		
		
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

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_kpsh00021" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="PM_SEL_61080011" parameter="0,1,2,3" procedure="PM_UPD_61080011"> 
                  <input bind="idGrid" > 
                    <input bind="txtItem" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Item
            </td>
            <td style="width: 35%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
            <td style="width: 14%" align="center">
                <gw:label id="lblRecord2" styles="color: blue">record(s)</gw:label>
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnAddNew" img="new" alt="Add New" onclick="OnAddNew()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="6">
                <gw:grid id='idGrid' header='_PK|Item Code|Item Name|UOM' format='0|0|0|0' aligns='0|0|0|0'
                    check='|||' editcol='1|1|1|1' widths='1000|1000|1000|1000' sorting='T' autosize='T'
                    styles='width:100%; height:100%' oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="6">
                <table>
                    <tr>
                        <td style="width: 96%" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 1%" style="white-space: nowrap">
                            <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" />
                            Duplicate
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(idGrid)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="6">
                <gw:grid id='idGrid2' header='_PK|Item Code|Item Name|UOM' format='0|0|0|0' aligns='0|0|0|0'
                    check='|||' editcol='1|1|1|1' widths='1000|1000|1000|1000' sorting='T' autosize='T'
                    styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
</body>
</html>
