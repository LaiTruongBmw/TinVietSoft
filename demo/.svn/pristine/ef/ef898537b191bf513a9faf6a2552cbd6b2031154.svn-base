<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get BOM Item</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_GRP_CD     = 0,   
    G_ITEM_PK    = 1,
    G_ITEM_CODE  = 2,
    G_ITEM_NAME  = 3,
    G_STATUS     = 4;   
//======================================================================
function BodyInit()
{
	//-------------------------
    System.Translate(document);
    data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from comm.tco_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and ( PROD_YN = 'Y' or SALE_YN = 'Y' or SEMI_PROD_YN = 'Y' ) order by grp_nm " ) %>||Select ALL";     
    lstGroup.SetDataText(data);   
    lstGroup.value = '';
	//---------------------------------------
}

//======================================================================
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 'grdDetail':
	            data_fphb00012.Call("SELECT");
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
//======================================================================
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
//======================================================================

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

//======================================================================

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
//======================================================================

function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}
//======================================================================

function OnReceiveData(obj)
{
    switch(obj.id)
    {
        case 'data_fphb00012':
            lblRecord.text = idGrid.rows-1 + " record(s)";
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
//======================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fphb00012" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_sel_fphb00012" > 
                  <input bind="grdDetail" > 
                    <input bind="lstGroup" />
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
                Group
            </td>
            <td style="width: 45%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch('grdDetail')" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
                Item
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
            </td>
            <td style="width: 19%;" align="center">
                <gw:label id="lblRecord" styles="color: blue">record(s)</gw:label>
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdDetail')" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="7">
                <gw:grid id="idGrid" header="Group|_PK|Item Code|Item Name|Status" format="0|0|0|0|0"
                    aligns="0|0|0|0|1" editcol="0|0|0|0|0" widths="2000|0|2000|3500|1000" styles="width:100%; height:100%"
                    sorting="T" oncelldblclick="OnGridCellDoubleClick(idGrid)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="7">
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
                <gw:grid id="idGrid2" header="Group|_PK|Item Code|Item Name|Status" format="0|0|0|0|0"
                    aligns="0|0|0|0|1" editcol="0|0|0|0|0" widths="2000|0|2000|3500|1000" styles="width:100%; height:100%"
                    sorting="T" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
</body>
</html>
