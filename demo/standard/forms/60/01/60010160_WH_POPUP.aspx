<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Many Item</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_ITEM_PK           = 0,
    G_ITEM_CODE         = 1,
    G_ITEM_NAME         = 2,
    G_GRP_PK            = 3,
    G_GRP_NAME          = 4,
    G_UOM               = 5,
    G_PUR_PRICE         = 6,
    G_PRICE             = 7,   
	G_PROD_PRICE	    = 8,
    G_REMARK            = 9;

//------------------------------------------------------------------------------------------------
function BodyInit()
{
    var data = "<%=CtlLib.SetListDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE b.GROUP_ID='LGIN0210' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM")%>||Select ALL";
    lstWHType.SetDataText(data);
    lstWHType.value = '' ;
	
}
//------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                 data_fpab00070_1.Call("SELECT");
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
    var col_val = idGrid2.GetGridData( idGrid2.row, G_ITEM_PK);
    
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
      if(p_oGrid.GetGridData( i, G_ITEM_PK) == p_col_val)
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
              if(p_oGrid.GetGridData(i, G_ITEM_PK) == p_value)
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
            var col_val = oGrid.GetGridData(event.row, G_ITEM_PK );
            
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
    }
}
//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G_ITEM_PK);		
		
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
  function OnPopUp()
{
	var path = System.RootURL + "/standard/forms/ag/ci/agci00070.aspx";
	var object = System.OpenModal( path ,950 , 850 ,  'resizable:yes;status:yes');

}
</script> 

<body>
    <!---------------------------------------------------------------->
   
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00070_1" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="<%=l_user%>ac_sel_60010160_wh_popup" > 
                  <input bind="idGrid" >
				  	<input bind="lstWHType" />
					<input bind="txtWH_ID_Name" />	
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%" id="STITEM">
            <td style="width: 5%; white-space: nowrap" align="right">
            </td>
            <td style="width: 44%" colspan="5">
                
            </td>
        </tr>
        <tr style="height: 1%">
		    <td style="width: 10%" align="right">
			</td>
            <td style="width: 5%" align="right">
                W/H Type
            </td>
            <td style="width: 40%">
                 <gw:list id="lstWHType" styles="width: 100%" onchange="OnSearch()" />
            </td>
            <td style="width: 5%" align="right">
                <b style="color: #1b2ff2; cursor: hand" >W/H </b>

            </td>
            <td style="width: 25%">
                <gw:textbox id="txtWH_ID_Name" styles="width:100%" onenterkey="OnSearch(1)" />
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
				 <gw:grid id="idGrid" 
				    header="_PK|W/H ID|W/H NAME|_tin_storage_pk|Storage|_WH Item Class|Item Grade|_Item Use YN|_Outside YN|_Stock YN|_Use YN|_Start Date|_End Date|Description"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|2000|3000|2000|2000|2000|2000|2000|0|0|0|0|0|0" 
					styles="width:100%; height:100%" sorting="T" oncelldblclick="OnGridCellDoubleClick(this)" />
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
            <td colspan="7">
                <gw:grid id="idGrid2" header="_PK|W/H ID|W/H NAME|_tin_storage_pk|Storage|_WH Item Class|Item Grade|_Item Use YN|_Outside YN|_Stock YN|_Use YN|_Start Date|_End Date|Description"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|2000|3000|2000|2000|2000|2000|2000|0|0|0|0|0|0" 
					styles="width:100%; height:100%" sorting="T" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
</body>
</html>
