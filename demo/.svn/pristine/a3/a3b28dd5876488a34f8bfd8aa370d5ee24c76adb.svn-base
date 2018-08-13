<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Many Item</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>

function BodyInit()
{
    txtLoc.text = '<%=Request.QueryString("loc") %>';

    jarc00050.Call();
	//OnFormatGrid();
}
//------------------------------------------------------------------------------------------------
function OnFormatGrid()
{
    var trl;
    
    trl = idGrid.GetGridControl();	
    trl.ColFormat(G_Price)           = "###,###,###,###,###.##"; 
       
    trl = idGrid2.GetGridControl();	
    trl.ColFormat(G_Price)           = "###,###,###,###,###.##";        
}
//-----------------------------------------------------------------------------------------------
function OnSearch()
{ 
   data_fpab00070_1.Call("SELECT");
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
    var col_val = idGrid2.GetGridData( idGrid2.row, 0);
    
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
      if(p_oGrid.GetGridData( i, 0) == p_col_val)
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
              if(p_oGrid.GetGridData(i, 0) == p_value)
              {
                 return true;
              }
       }
       return false;
}
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == "idGrid" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, 0 );
            
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
        case 'data_fpab00070_1':
            lblRecord2.text = idGrid.rows-1 + " (s)";
        break;
		case 'jarc00050':
			data_fpab00070_1.Call("SELECT");
		break;
    }
}
//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, 0);		
		
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
    <gw:data id="data_fpab00070_1" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="st_ht_sel_60250060_popup_item" > 
                  <input bind="idGrid" > 
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="jarc00050" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="2" type="list" procedure="st_ht_sel_60250060_popup_list" > 
                <input> 
                    <input bind="txtLoc" />
                </input> 
                <output>
                    <output bind="lstGroup" /> 
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Item Group
            </td>
            <td style="width: 40%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch()" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
                Item
            </td>
            <td style="width: 35%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch()" />
                <gw:textbox id="txtLoc" styles="width:100%;display:none"/>
            </td>
            <td style="width: 14%" align="center">
                <gw:label id="lblRecord2" styles="color: blue">record(s)</gw:label>
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="7">
                <gw:grid id="idGrid" header='_PK|Item Code|Item Name|Item Group|Unit|Price|Currency|_Quantity|_Amount|Description'
                    format='0|0|0|0|0|-0|0|0|0|0' aligns='0|0|0|0|0|3|0|3|3|0' defaults='|||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|1000|1000|1100|1000|1000|1000|1000'
                    autosize="T" sorting='T' acceptnulldate="T" styles="width:100%;height:100%" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="7">
                <table>
                    <tr>
                        <td style="width: 96%" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 1%" style="white-space: nowrap">
                            <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" styles='width:100%;display:none' />
                            
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(idGrid)" styles='width:100%;display:none' />
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
            <td colspan="7">
                <gw:grid id="idGrid2" header='_PK|Item Code|Item Name|Item Group|Unit|Price|Currency|_Quantity|_Amount|Description'
                    format='0|0|0|0|0|-0|0|0|0|0' aligns='0|0|0|0|0|3|0|3|3|0' defaults='|||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|1000|1000|1100|1000|1000|1000|1000'
                    autosize="T" sorting='T' acceptnulldate="T" styles="width:100%;height:100%" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
</body>
</html>
