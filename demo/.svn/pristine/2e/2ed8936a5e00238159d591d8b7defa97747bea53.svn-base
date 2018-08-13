<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Many Item ( IMEX )</title>
</head>
<%  CtlLib.SetUser("imex")
  
%>

<script>

var G_GROUP_PK  = 0,
    G_GRP_CD    = 1,
    G_ITEM_PK   = 2,
    G_ITEM_CODE = 3,
    G_ITEM_NAME = 4,
    G_UOM       = 5,
    G_HS_CODE   = 6,
    G_IMEX_TAX  = 7,
    G_CONS_TAX  = 8,
    G_VAT_TAX   = 9,
    G_REG       = 10,
    G_REMARK    = 11;
//------------------------------------------------------------------------------------------------
function BodyInit()
{	
	//-------------------------
    var data = "";  
    
    data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_name from tlg_ie_item_group where del_if = 0  order by grp_cd ")%>||Select ALL";     
    lstGroup.SetDataText(data);   
    lstGroup.value="";
    
    //-------------------------   
    
    var group_pk = "<%=request.QueryString("group_pk")%>";
    
    if ( Number(group_pk) > 0 )
    {
        lstGroup.value = group_pk ;
        lstGroup.SetEnable(false);
    }
	//---------------------------------------
	OnFormatGrid();
	//---------------------------------------
	
}
//------------------------------------------------------------------------------------------------
function OnFormatGrid()
{
    var trl;
    
    trl = idGrid.GetGridControl();	
    trl.ColFormat(G_IMEX_TAX) = "###,###,###,###,###.##"; 
    trl.ColFormat(G_CONS_TAX) = "###,###,###,###,###.##";
    trl.ColFormat(G_VAT_TAX)  = "###,###,###,###,###.##";
       
    trl = idGrid2.GetGridControl();	
    trl.ColFormat(G_IMEX_TAX) = "###,###,###,###,###.##"; 
    trl.ColFormat(G_CONS_TAX) = "###,###,###,###,###.##";
    trl.ColFormat(G_VAT_TAX)  = "###,###,###,###,###.##";       
}
//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                 data_epcs00011.Call("SELECT");
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
        case 'data_epcs00011':
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
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_epcs00011" onreceive="OnReceiveData(this)"> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_epcs00011" > 
                  <input bind="idGrid" > 
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
            <td style="width: 40%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch(1)" csstype="mandatory" />
            </td>
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
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="7">
                <gw:grid id='idGrid' header='_GROUP_PK|Group|_ITEM_PK|Item Code|Item Name|UOM|HS Code|IMEX Tax|Cons Tax|VAT|Reg|Remark'
                    format='0|0|0|0|0|0|0|1|1|1|0|0' aligns='0|0|0|0|0|0|1|3|3|3|0|0' check='|||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0' widths='0|1500|0|2000|2500|1000|1500|1200|1200|1200|1000|1000'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick="OnGridCellDoubleClick(this)" />
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
                            <gw:button id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(idGrid)" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="7">
                <gw:grid id='idGrid2' header='_GROUP_PK|Group|_ITEM_PK|Item Code|Item Name|UOM|HS Code|IMEX Tax|Cons Tax|VAT|Reg|Remark'
                    format='0|0|0|0|0|0|0|1|1|1|0|0' aligns='0|0|0|0|0|0|1|3|3|3|0|0' check='|||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0' widths='0|1500|0|2000|2500|1000|1500|1200|1200|1200|1000|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
</body>
</html>
