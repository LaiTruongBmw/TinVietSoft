<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Asset</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_PK                = 0,
    G_ASSET_CODE        = 1,
    G_ASSET_NAME        = 2,
    G_CCY               = 3,
    G_ASSET_AMOUNT      = 4,
    G_DESCIPTION        = 5;

//------------------------------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    data_fpma00022.Call("SELECT");
}
//------------------------------------------------------------------------------------------------
function OnFormatGrid()
{    
}
//-----------------------------------------------------------------------------------------------
function OnSearch()
{ 
    data_fpma00022.Call("SELECT");
    
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
    var col_val = idGrid2.GetGridData( idGrid2.row, G_PK);
    
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
      if(p_oGrid.GetGridData( i, G_PK) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
//-------------------------------------------------------------------------------------------------
function CheckDataExist(p_oGrid,p_value)
{
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, G_PK) == p_value)
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
            var col_val = oGrid.GetGridData(event.row, G_PK );
            
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
        case 'data_fpma00022':
            lblRecord2.text = idGrid.rows-1 + " (s)";
        break;
    }
}
//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G_PK);		
		
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
    <gw:data id="data_fpma00022" onreceive="OnReceiveData(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00022"  > 
                <input bind="idGrid" >
                    <input bind="txtSTItem" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%" id="STITEM">
            <td style="width: 5%; white-space: nowrap" align="right">
                Asset
            </td>
            <td style="width: 44%" colspan="5">
                <gw:textbox id="txtSTItemPK" styles="display: none" />
                <gw:textbox id="txtSTItem" styles="width:100%" csstype="mandatory" onenterkey="OnSearch()" />
            </td>
            <td style="width: 14%" align="center">
                <gw:label id="lblRecord2" styles="color: blue">record(s)</gw:label>
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="8">
                <gw:grid id='idGrid' header='_PK|Asset Code|Asset Name|CCY|Asset Amount|Remark'
                    format='0|0|0|0|1|0' aligns='0|0|0|1|0|0' check='|||||' editcol='1|1|1|1|1|1'
                    widths='0|2000|2500|800|1500|1000' sorting='T' styles='width:100%; height:100%'
                    oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="8">
                <table>
                    <tr>
                        <td style="width: 96%" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 1%" style="white-space: nowrap">
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
            <td colspan="8">
                <gw:grid id='idGrid2' header='_PK|Asset Code|Asset Name|CCY|Asset Amount|Remark'
                    format='0|0|0|0|1|0' aligns='0|0|0|1|0|0' check='|||||' editcol='1|1|1|1|1|1'
                    widths='0|2000|2500|800|1500|1000' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
</body>
</html>
