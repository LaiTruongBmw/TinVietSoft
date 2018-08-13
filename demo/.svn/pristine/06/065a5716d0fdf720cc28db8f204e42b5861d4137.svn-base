<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Stock</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_PK        = 0,
    G_WH_PK     = 1,
    G_WH_Name   = 2,
    G_ITEM_PK   = 3,
    G_Item_Code = 4,
    G_Item_Name = 5,
    G_UOM       = 6,
    G_Stock     = 7,
    G_Lot_No    = 8;  
//-------------------------------------------

function BodyInit()
{
    System.Translate(document); 
	//-------------------------
	var p_group_type = "<%=Request.querystring("group_type")%>";
    var data = "";  
    
    data = "<%=CtlLib.SetListDataSQLPara("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and (PROD_YN ={0} or SALE_YN ={1} or MAT_YN ={2} or SUB_MAT_YN ={3} or SEMI_PROD_YN ={4} or PUR_YN ={5}) order by grp_cd ", Request.querystring("group_type")) %>||";     
    lstGroup.SetDataText(data);
    lstGroup.value = "" ;
	
    data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_id || ' * ' || wh_name  FROM tlg_in_warehouse  WHERE del_if = 0  ORDER BY wh_name  ASC" )%>||";    
    lstWH.SetDataText(data);     
    
	var group_pk = "<%=request.QueryString("group_pk")%>";
    
    if ( Number(group_pk) > 0 )
    {
        lstGroup.value = group_pk ;
        lstGroup.SetEnable(false);
    }    
	//----------------------------------
	OnFormatGrid();
}
//======================================================================

function OnFormatGrid()
{
    var trl;
    
    trl = idGrid.GetGridControl();	
    trl.ColFormat(G_Stock)           = "###,###,###,###,###.##"; 
       
    trl = idGrid2.GetGridControl();	
    trl.ColFormat(G_Stock)           = "###,###,###,###,###.##";        
}

//======================================================================
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
	            data_bias00011.Call("SELECT");
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
        case 'data_bias00011':
        break;
      }
}
//======================================================================

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
//======================================================================

function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
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
          if(p_oGrid.GetGridData(i, G_PK) == p_value)
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
      if(p_oGrid.GetGridData( i, G_PK) == p_col_val)
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
//-------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData(idGrid2.row,4);
    idGrid2.RemoveRowAt(idGrid2.row);
    SetRowBackGroundColor(idGrid,col_val,0x000000); 
    countItem()
  }
}
//======================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_bias00011" onreceive="OnReceiveData(this)"> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_bias00011" > 
                  <input bind="idGrid" > 
                    <input bind="lstWH" />
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                W/H
            </td>
            <td style="width: 35%">
                <gw:list id="lstWH" styles="width:100%" onchange="OnSearch(1)" csstype="mandatory" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Group
            </td>
            <td style="width: 35%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch(1)" csstype="mandatory" />
            </td>            
            <td style="width: 15%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
			<td style="width: 3%" align="right">                
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
            </td>
        </tr>
        <!---------------------------------------------------------------------------------------------->
        <tr style="height: 49%">
            <td colspan="8">
                <gw:grid id="idGrid" header="_PK|_WH_PK|W/H Name|_ITEM_PK|Item Code|Item Name|UOM|Stock|Lot No"
                    format="0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|1|3|1" defaults="||||||||" editcol="0|0|0|0|0|0|0|0|0"
                    widths="0|0|2500|0|2000|2500|800|1200|0" styles="width:100%; height:100%" sorting="T"
                    oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="3" align="center">
                <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
            </td>
            <td colspan="3" align="right" style="white-space: nowrap">
                <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" />
                Duplicate
            </td>
            <td colspan="1" align="right">
                <gw:button id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(idGrid)" />
            </td>
            <td align="right">
                <gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="8">
                <gw:grid id="idGrid2" header="_PK|_WH_PK|W/H Name|_ITEM_PK|Item Code|Item Name|UOM|Stock|Lot No"
                    format="0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|1|3|1" defaults="||||||||" editcol="0|0|0|0|0|0|0|0|0"
                    widths="0|0|2500|0|2000|2500|800|1200|0" styles="width:100%; height:100%" sorting="T" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------------------------------->
</body>
</html>
