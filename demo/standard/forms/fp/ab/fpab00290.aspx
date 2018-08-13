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

var G1_PK          = 0,
	G1_ITEM_PK     = 1,
    G1_ITEM_CODE   = 2,
    G1_ITEM_NAME   = 3,
	G1_UOM		   = 4,
	G1_LOT_NO      = 5,
    G1_STOCK_QTY   = 6,
	G1_REQ_QTY	   = 7,	
	G1_PRE_QTY     = 8;	
    
var G2_PK			= 0,
	G2_ITEM_PK   	= 1,
    G2_ITEM_CODE 	= 2,
    G2_ITEM_NAME 	= 3,
    G2_UOM       	= 4,
	G2_LOT_NO  		= 5,
    G2_SHORTAGE     = 6,
    G2_SEL_QTY   	= 7,
    G2_BAL_QTY   	= 8;  
//-------------------------------------------

function BodyInit()
{
	System.Translate(document);
	//-------------------------
	var p_group_type   = "<%=Request.querystring("group_type")%>";
	var p_warehouse_pk = "<%=Request.querystring("warehouse_pk")%>";
	
    var data = "";  
    
    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang1.SetDataText(data);      
    lstLang1.value = "<%=Session("SESSION_LANG")%>";
	
	data = "data|0||1|<=0|2|>0";
    lstOperator.SetDataText(data);
	lstOperator.value = '0';
    
    data = "<%=CtlLib.SetListDataSQLPara("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and ( SALE_YN ={0} or PUR_YN ={1} or  PROD_YN ={2} or  SEMI_PROD_YN ={3} or MAT_YN ={4} or SUB_MAT_YN ={5}) order by grp_cd ", Request.querystring("group_type")) %>||";     
    lstGroup.SetDataText(data);
    lstGroup.value = '';
     
    data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_id || ' * ' || wh_name  FROM tlg_in_warehouse  WHERE del_if = 0  ORDER BY wh_id  ASC" )%>||";    
    lstWH.SetDataText(data);     
    lstWH.value = '';
      
    if ( Number(p_warehouse_pk)>0 )
	{
	    lstWH.value = p_warehouse_pk;
	}
	 
    var group_pk = "<%=request.QueryString("group_pk")%>";
    
    if ( Number(group_pk) > 0 )
    {
        lstGroup.value = group_pk ;
        lstGroup.SetEnable(false);
    }  
	
	chkLotNo.value = 'Y';
	//----------------------------------
	OnFormatGrid(); 
}

var arr_FormatNumber = new Array(); 
//======================================================================

function OnFormatGrid()
{
    var trl;
    
    trl = idGrid.GetGridControl();	 
    trl.ColFormat(G1_STOCK_QTY) = "###,###,###,###,###.##"; 
    trl.ColFormat(G1_REQ_QTY)   = "###,###,###,###,###.##"; 
	trl.ColFormat(G1_PRE_QTY)   = "###,###,###,###,###.##";  
	
    trl = idGrid2.GetGridControl();	
    trl.ColFormat(G2_SHORTAGE) = "###,###,###,###,###.##";   
    trl.ColFormat(G2_SEL_QTY)   = "###,###,###,###,###.##"; 
    trl.ColFormat(G2_BAL_QTY)   = "###,###,###,###,###.##";    
    
    arr_FormatNumber[G2_SEL_QTY] = 2;  
	arr_FormatNumber[G2_BAL_QTY] = 2;  
}

//======================================================================
function OnSearch(obj)
{ 
    switch(obj)
    {
        case '1':
	            data_fpab00290.Call("SELECT");
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
        case 'data_fpab00290':
        break;
      }
}
//======================================================================

function OnGridCellDoubleClick(oGrid)
{
	if(oGrid.id == "idGrid" && event.row > 0 )
	{
		var col_val = oGrid.GetGridData(event.row, G1_PK );
    
		if(event.row > 0 && ( !CheckDataExist(idGrid2,col_val)) )
		{
			SetRowBackGroundColor(oGrid,col_val,0x0000FF);
		
			idGrid2.AddRow();
			idGrid2.SetGridText( idGrid2.rows-1, G2_PK, oGrid.GetGridData( event.row, G1_PK));
		
			idGrid2.SetGridText( idGrid2.rows-1, G2_ITEM_PK   , oGrid.GetGridData( event.row, G1_ITEM_PK   ));
			idGrid2.SetGridText( idGrid2.rows-1, G2_ITEM_CODE , oGrid.GetGridData( event.row, G1_ITEM_CODE ));
			idGrid2.SetGridText( idGrid2.rows-1, G2_ITEM_NAME , oGrid.GetGridData( event.row, G1_ITEM_NAME ));
			idGrid2.SetGridText( idGrid2.rows-1, G2_UOM       , oGrid.GetGridData( event.row, G1_UOM       ));
			idGrid2.SetGridText( idGrid2.rows-1, G2_LOT_NO    , oGrid.GetGridData( event.row, G1_LOT_NO    ));
				 
			if ( Number(oGrid.GetGridData( event.row, G1_PRE_QTY)) < 0 )
			{
				idGrid2.SetGridText( idGrid2.rows-1, G2_SHORTAGE , Number(oGrid.GetGridData( event.row, G1_STOCK_QTY )) );				
				idGrid2.SetGridText( idGrid2.rows-1, G2_SEL_QTY  , Number(oGrid.GetGridData( event.row, G1_STOCK_QTY )) );
			}
			else
			{
				idGrid2.SetGridText( idGrid2.rows-1, G2_SHORTAGE , Number(oGrid.GetGridData( event.row, G1_PRE_QTY )) );				
				idGrid2.SetGridText( idGrid2.rows-1, G2_SEL_QTY  , Number(oGrid.GetGridData( event.row, G1_PRE_QTY )) );
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
          if(p_oGrid.GetGridData(i, G2_PK) == p_value)
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
      if(p_oGrid.GetGridData( i, G1_PK) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}

//================================================================================================
function OnAdd(oGrid)
{
	for (i = 1; i<oGrid.rows ; i++)
	{		 
        var col_val = oGrid.GetGridData( i, G1_PK);		
		
        if ( oGrid.GetGridControl().isSelected(i) == true && ( !CheckDataExist( idGrid2, col_val)) )
        {
            SetRowBackGroundColor( oGrid, col_val, 0x0000FF);           
    		
	        idGrid2.AddRow();
			idGrid2.SetGridText( idGrid2.rows-1, G2_PK, oGrid.GetGridData( i, G1_PK));
		
			idGrid2.SetGridText( idGrid2.rows-1, G2_ITEM_PK   , oGrid.GetGridData( i, G1_ITEM_PK   ));
			idGrid2.SetGridText( idGrid2.rows-1, G2_ITEM_CODE , oGrid.GetGridData( i, G1_ITEM_CODE ));
			idGrid2.SetGridText( idGrid2.rows-1, G2_ITEM_NAME , oGrid.GetGridData( i, G1_ITEM_NAME ));
			idGrid2.SetGridText( idGrid2.rows-1, G2_UOM       , oGrid.GetGridData( i, G1_UOM       ));
			idGrid2.SetGridText( idGrid2.rows-1, G2_LOT_NO    , oGrid.GetGridData( i, G1_LOT_NO    ));
						 
			if ( Number(oGrid.GetGridData( i, G1_PRE_QTY)) < 0 )
			{
				idGrid2.SetGridText( idGrid2.rows-1, G2_SHORTAGE , Number(oGrid.GetGridData( i, G1_STOCK_QTY )) );				
				idGrid2.SetGridText( idGrid2.rows-1, G2_SEL_QTY  , Number(oGrid.GetGridData( i, G1_STOCK_QTY )) );
			}
			else
			{							
				idGrid2.SetGridText( idGrid2.rows-1, G2_SHORTAGE , Number(oGrid.GetGridData( i, G1_PRE_QTY )) );				
				idGrid2.SetGridText( idGrid2.rows-1, G2_SEL_QTY  , Number(oGrid.GetGridData( i, G1_PRE_QTY )) );				
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
    	var col_val = idGrid2.GetGridData( idGrid2.row, G2_PK);
    	idGrid2.RemoveRowAt(idGrid2.row);
    	SetRowBackGroundColor(idGrid,col_val,0x000000); 
    	countItem();
  	}
}
//======================================================================
function OnGridEdit()
{    
    var col = event.col;
    var row = event.row;
	
    if ( col == G2_SEL_QTY )
    {
		var dQuantiy ;
        
        dQuantiy =  idGrid2.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                idGrid2.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
            }
            else
            {                 
                idGrid2.SetGridText( row, col, "");
            }
        }
        else
        {
            idGrid2.SetGridText(row,col,"") ;
        }  	
		//-------------------------------------
        var bal_qty = Number(idGrid2.GetGridData( row, G2_SHORTAGE)) - Number(idGrid2.GetGridData( row, G2_SEL_QTY));
		
        idGrid2.SetGridText( row, G2_BAL_QTY, System.Round( bal_qty, arr_FormatNumber[G2_BAL_QTY] ) );
		//-------------------------------------
    }
}
//======================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00290" onreceive="OnReceiveData(this)"> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00290" > 
                  <input bind="idGrid" > 
                    <input bind="lstWH" />
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
                    <input bind="lstLang1" />
					<input bind="lstOperator" />
					<input bind="chkLotNo" />
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
            <td style="width: 55%">
                <gw:list id="lstWH" styles="width:100%" onchange="OnSearch('1')" csstype="mandatory" />
            </td>  
			<td style="width: 15%; white-space: nowrap" align="center" colspan=2 >                            
				 <gw:checkbox id="chkLotNo" styles="width:30%" defaultvalue="Y|N" onchange="OnSearch('1')" />
                 Lot No				 
			</td>          
            <td style="width: 10%; white-space: nowrap" align="center" >                            
				<gw:list id="lstLang1" styles='width:60' onchange="OnSearch('1')" />				 
			</td>
			<td style="width: 10%; white-space: nowrap" align="center" >                            			 
				<gw:list id="lstOperator" styles='width:60' onchange="OnSearch('1')" />
			</td>
            <td style="width: 5%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch('1')" />
            </td>
        </tr>
		<tr style="height: 1%">                        
            <td style="width: 5%; white-space: nowrap" align="right">
                Group
            </td>
            <td style="width: 55%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch('1')" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
                <b>Item</b>
            </td>
            <td style="width: 35%" colspan=4 >
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('1')" />
            </td>			 
        </tr>
        <!---------------------------------------------------------------------------------------------->
        <tr style="height: 49%">
            <td colspan="10">
                <gw:grid id="idGrid" header="_PK|_ITEM_PK|Item Code|Item Name|UOM|Lot No|Stock Qty|Req Qty|Remain Qty"
                    format="0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|1|1|3|3|3" defaults="||||||||" editcol="0|0|0|0|0|0|0|0|0"
                    widths="0|0|2000|3500|800|1200|1200|1200|1200" styles="width:100%; height:100%" sorting="T"
                    oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="10">
                <table border="0">
                    <tr>
                        <td align="center" style="width: 100%">
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
            <td colspan="10">
                <gw:grid id="idGrid2" header="_PK|_ITEM_PK|Item Code|Item Name|UOM|Lot No|Remain|Sel Qty|Bal Qty"
                    format="0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|1|1|3|3|3" defaults="||||||||" editcol="0|0|0|0|0|0|0|1|0"
                    widths="0|0|2000|3500|800|1200|1200|1200|1200" styles="width:100%; height:100%" sorting="T" onafteredit="OnGridEdit()"/>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------------------------------->
</body>

</html>
