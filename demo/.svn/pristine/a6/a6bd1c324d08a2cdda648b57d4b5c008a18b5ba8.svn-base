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
var vPage = 0 ;

var G_STItem_PK         = 0,
    G_STItem_Code       = 1,
    G_STItem_Name       = 2,
    G_tco_itemgrp_pk    = 3,
    G_Item_Group        = 4,
    G_Unit              = 5,
    G_Lot_Qty           = 6,
    G_Price             = 7,
    G_LisPrice          = 8,
    G_StPrice           = 9,
    G_LmPrice           = 10,
    G_MkPrice           = 11,
    G_pur_type          = 12,
    G_volume            = 13,
    G_tin_warehouse_pk  = 14,
    G_partner_pk        = 15,
    G_partner_id        = 16,
    G_partner_name      = 17,
    G_Description       = 18,
    G_LOT_UOM           = 19,
    G_WT_UOM            = 20,
    G_Lot_WT            = 21,
    G_Weight            = 22;
//-------------------------------------------

function BodyInit()
{
       System.Translate(document);
	//-------------------------
	var p_group_type = "<%=Request.querystring("group_type")%>";
    var data = "";  
    
    data = "<%=CtlLib.SetListDataSQLPara("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and (SALE_YN = {0} or PUR_YN ={1} or PROD_YN ={2} or SEMI_PROD_YN ={3} or MAT_YN ={4} or SUB_MAT_YN ={5} ) order by grp_cd ", Request.querystring("group_type")) %>";     
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
    var trl;
    
    trl = idGrid.GetGridControl();	
    trl.ColFormat(G_Price)           = "###,###,###,###,###.##"; 
       
    trl = idGrid2.GetGridControl();	
    trl.ColFormat(G_Price)           = "###,###,###,###,###.##";        
}

//======================================================================
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
	            data_fpab00210.Call("SELECT");
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
        case 'data_fpab00210':
        break;
      }
}
//======================================================================

function OnGridCellDoubleClick(oGrid)
{
  if(oGrid.id == "idGrid" && event.row > 0 )
  {
    var col_val = oGrid.GetGridData(event.row, G_STItem_PK );
    
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
          if(p_oGrid.GetGridData(i, G_STItem_PK) == p_value)
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
      if(p_oGrid.GetGridData( i, G_STItem_PK) == p_col_val)
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
        var col_val = oGrid.GetGridData( row, G_STItem_PK);		
		
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
    <gw:data id="data_fpab00210" onreceive="OnReceiveData(this)"> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00210" > 
                  <input bind="idGrid" > 
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
                Group
            </td>
            <td style="width: 45%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch(1)" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
                <b>Item</b>
            </td>
            <td style="width: 43%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
        </tr>
        <!---------------------------------------------------------------------------------------------->
        <tr style="height: 49%">
            <td colspan="5">
                <gw:grid id="idGrid" header="_PK|STItem Code|STItem Name|_tco_itemgrp_pk|Item Group|Unit|_Quantity|Price|_LisPrice|_StPrice|_LmPrice|_MkPrice|_pur_type|_volume|_tin_warehouse_pk|_partner_pk|_partner_id|_partner_name|Description|_LOT UOM|_WT UOM|_Lot WT|_Weight"
                    format="0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    defaults="|||||||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|2500|2500|1500|2500|800|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" styles="width:100%; height:100%"
                    sorting="T" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="5">
                <table>
                    <tr>
                        <td style="width: 100%" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td align="right" style="white-space: nowrap">
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
            <td colspan="5">
                <gw:grid id="idGrid2" header="_PK|STItem Code|STItem Name|_tco_itemgrp_pk|Item Group|Unit|_Quantity|Price|_LisPrice|_StPrice|_LmPrice|_MkPrice|_pur_type|_volume|_tin_warehouse_pk|_partner_pk|_partner_id|_partner_name|Description|_LOT UOM|_WT UOM|_Lot WT|_Weight"
                    format="0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    defaults="|||||||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|2500|2500|1500|2500|800|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" styles="width:100%; height:100%"
                    sorting="T" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------------------------------->
</body>
</html>
