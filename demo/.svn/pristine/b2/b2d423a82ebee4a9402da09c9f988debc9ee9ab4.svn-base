<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Many STItem</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_ST_ITEM_PK    = 0,
    G_ITEM_PK       = 1,
    G_Item_Code     = 2,
    G_Item_Name     = 3,
    G_Grp_PK        = 4,
    G_Group         = 5,
    G_UOM           = 6,
    G_Description   = 7;
    
//-------------------------------------------

function BodyInit()
{
	System.Translate(document);
	//-------------------------
	var p_group_type = "<%=Request.querystring("group_type")%>";
    var data = "";  
    
    data = "<%=CtlLib.SetListDataSQLPara("select pk, grp_cd || ' * ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and (PROD_YN ={0} or SALE_YN ={1} or MAT_YN ={2} or SUB_MAT_YN ={3} or SEMI_PROD_YN ={4} or PUR_YN ={5}) order by grp_cd ", Request.querystring("group_type")) %>";     
    lstGroup.SetDataText(data);
    
    var group_pk = "<%=request.QueryString("group_pk")%>";
    
    if ( Number(group_pk) > 0 )
    {
        lstGroup.value = group_pk ;
        lstGroup.SetEnable(false);
    }    
	//----------------------------------
}
//======================================================================

function OnFormatGrid()
{
   
}

//======================================================================
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
	            data_fpab00350.Call("SELECT");
        break;
    }
   
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

function OnReceiveData(obj)
{
   switch(obj.id)
    {
        case 'data_fpab00350':
        break;
      }
}
//======================================================================

function OnGridCellDoubleClick(oGrid)
{
  if(oGrid.id == "idGrid" && event.row > 0 )
  {
    var col_val_1 = oGrid.GetGridData(event.row, G_ST_ITEM_PK );
    var col_val_2 = oGrid.GetGridData(event.row, G_ITEM_PK    );
    
    if ( event.row > 0 && ( !CheckDataExist(idGrid2, col_val_1, col_val_2 )) )
    {
        SetRowBackGroundColor( oGrid, col_val_1, col_val_2, 0x0000FF);
        
		idGrid2.AddRow();
		
		for(var i=0;i<oGrid.cols;i++)
		{
		  idGrid2.SetGridText(idGrid2.rows-1,i,oGrid.GetGridData(event.row,i));
		}
     }
  }
  countItem()
}
//======================================================================

function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}
//================================================================================================

function CheckDataExist(p_oGrid,p_value_01,p_value_02)
{
    if ( chkDuplicate.value == 'Y' )
    {
        return false ;
    }
    //------------------------
    for(var i=1;i<p_oGrid.rows;i++)
    {
          if ( p_oGrid.GetGridData(i, G_ST_ITEM_PK) == p_value_01 && p_oGrid.GetGridData(i, G_ITEM_PK) == p_value_02 )
          {
             return true;
          }
    }    
    //------------------------
    return false;
}
//================================================================================================

function SetRowBackGroundColor(p_oGrid, p_col_val_01, p_col_val_02, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if ( p_oGrid.GetGridData( i, G_ST_ITEM_PK) == p_col_val_01 && p_oGrid.GetGridData( i, G_ITEM_PK) == p_col_val_02 )
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}

//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
		
        var col_val_01 = oGrid.GetGridData( row, G_ST_ITEM_PK);		
		var col_val_02 = oGrid.GetGridData( row, G_ITEM_PK   );
		
        if ( row > 0 && ( !CheckDataExist( idGrid2, col_val_01, col_val_02 )) )
        {
            SetRowBackGroundColor( oGrid, col_val_01, col_val_02 , 0x0000FF);
            
	        idGrid2.AddRow();
    		
	        for(var j=0; j<oGrid.cols; j++)
	        {
	            idGrid2.SetGridText( idGrid2.rows-1, j, oGrid.GetGridData( row, j) );
	        }
        }
		
	}
    
    countItem();    
}
//-------------------------------------------------------------------------------------------------
function OnRemove()
{
      if ( idGrid2.row > 0 )
      {
            var col_val_01 = idGrid2.GetGridData( idGrid2.row, G_ST_ITEM_PK );
            var col_val_02 = idGrid2.GetGridData( idGrid2.row, G_ITEM_PK    );
            
            idGrid2.RemoveRowAt(idGrid2.row);
            
            SetRowBackGroundColor(idGrid,col_val_01,col_val_02,0x000000); 
            
            countItem();
      }
}
//======================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00350" onreceive="OnReceiveData(this)"> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00350" > 
                  <input bind="idGrid" > 
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
                    <input bind="radSearchPage" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Group
            </td>
            <td style="width: 55%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch(1)" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
                <b>Item</b>
            </td>
            <td style="width: 20%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
            <td style="width: 8%; white-space: nowrap">
                <gw:radio id="radSearchPage" value="1" styles="width:100%" onchange="OnSearch(1)"> 
                    <span value="1">ST Item</span> 
                    <span value="2">Item</span> 
                </gw:radio>
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="7">
                <gw:grid id='idGrid' header='_ST_ITEM_PK|_ITEM_PK|Item Code|Item Name|_TCO_ITEMGRP_PK|_Group|UOM|Description'
                    format='0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|1|0' defaults='|||||||' editcol='0|0|0|0|0|0|0|0'
                    widths='0|0|2000|6500|0|0|800|0' sorting='T' styles='width:100%; height:100%'
                    oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="7">
                <table>
                    <tr>
                        <td align="center" style="width:100%">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td  align="right" style="white-space: nowrap">
                            <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" />
                            Duplicate
                        </td>
                        <td align="right">
                            <gw:button id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(idGrid)" />
                        </td>
                        <td align="right">
                            <gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="7">
                <gw:grid id='idGrid2' header='_ST_ITEM_PK|_ITEM_PK|Item Code|Item Name|_TCO_ITEMGRP_PK|_Group|UOM|Description'
                    format='0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|1|0' defaults='|||||||' editcol='0|0|0|0|0|0|0|0'
                    widths='0|0|2000|6500|0|0|800|0' sorting='T' styles='width:100%; height:100%'
                    oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------------------------------->
</body>
</html>
