<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Stock (ST Item/Spec)</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G1_PK        = 0,
    G1_WH_PK     = 1,
    G1_WH_Name   = 2,
    G1_ITEM_PK   = 3,
    G1_ITEM_CODE = 4,
    G1_ITEM_NAME = 5,
	G1_SPEC01	 = 6,
	G1_SPEC02	 = 7,
	G1_SPEC03	 = 8,
	G1_SPEC04	 = 9,
	G1_SPEC05	 = 10,
    G1_UOM       = 11,
    G1_STOCK_QTY = 12,
    G1_LOT_NO    = 13;  
    
var G_PK        = 0,
    G_WH_PK     = 1,
    G_WH_Name   = 2,
    G_ITEM_PK   = 3,
    G_ITEM_CODE = 4,
    G_ITEM_NAME = 5,
	G_SPEC01	= 6,
	G_SPEC02	= 7,
	G_SPEC03	= 8,
	G_SPEC04	= 9,
	G_SPEC05	= 10,
    G_UOM       = 11,
    G_STOCK_QTY  = 12,
    G_SELECT_QTY = 13,
    G_BAL_QTY   = 14,
    G_Lot_No    = 15;
	
var arr_FormatNumber = new Array(); 	  
//-------------------------------------------

function BodyInit()
{
	System.Translate(document);
	//-------------------------
	var p_group_type = "<%=Request.querystring("group_type")%>";
    var data = "";  
    
    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang.SetDataText(data);      
    lstLang.value = "<%=Session("SESSION_LANG")%>";
    
    data = "<%=CtlLib.SetListDataSQLPara("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and (PROD_YN ={0} or SALE_YN ={1} or MAT_YN ={2} or SUB_MAT_YN ={3} or SEMI_PROD_YN ={4} or PUR_YN ={5}) order by grp_cd ", Request.querystring("group_type")) %>||";     
    lstGroup.SetDataText(data);
    lstGroup.value = '';
    
    data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_name  FROM tlg_in_warehouse  WHERE del_if = 0  ORDER BY wh_name  ASC" )%>||";    
    lstWH.SetDataText(data);     
    lstWH.value = '';
    
    var group_pk = "<%=request.QueryString("group_pk")%>";
    
    if ( Number(group_pk) > 0 )
    {
        lstGroup.value = group_pk ;
        lstGroup.SetEnable(false);
    }    
	//----------------------------------
	OnFormatGrid();
	
	OnHiddenGrid();
	
	OnSearch('header');
}

//======================================================================

function OnHiddenGrid()
{

	idGrid2.GetGridControl().ColHidden(G_SPEC01) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC02) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC03) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC04) = true ;
	idGrid2.GetGridControl().ColHidden(G_SPEC05) = true ;
	
    idGrid.GetGridControl().ColHidden(G1_SPEC01) = true ;
	idGrid.GetGridControl().ColHidden(G1_SPEC02) = true ;
	idGrid.GetGridControl().ColHidden(G1_SPEC03) = true ;
	idGrid.GetGridControl().ColHidden(G1_SPEC04) = true ;
	idGrid.GetGridControl().ColHidden(G1_SPEC05) = true ;
}

//======================================================================

function OnFormatGrid()
{
    var trl;
    
    trl = idGrid.GetGridControl();	
    trl.ColFormat(G1_STOCK_QTY) = "###,###,###,###,###.##"; 
            
    trl = idGrid2.GetGridControl();	
    trl.ColFormat(G_STOCK_QTY)  = "###,###,###,###,###.##";   
    trl.ColFormat(G_SELECT_QTY) = "###,###,###,###,###.##"; 
    trl.ColFormat(G_BAL_QTY)    = "###,###,###,###,###.##"; 
	
	arr_FormatNumber[G_SELECT_QTY] = 2;    
	arr_FormatNumber[G_BAL_QTY]    = 2;
}

//======================================================================
function OnSearch(obj)
{ 
    switch(obj)
    {
        case '1' :
	            data_fpab00520.Call("SELECT");
        break;
		
		case 'header' :
				data_fpab00520_header.Call("SELECT");
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
        case 'data_fpab00520':
        break;
		
		case 'data_fpab00520_header':
		    if(grdHeader.rows>1)
            {
                var col1=grdHeader.GetGridData(1,2);
                var dis_col1=grdHeader.GetGridData(1,3);
                var col2=grdHeader.GetGridData(1,4);
                var dis_col2=grdHeader.GetGridData(1,5);
                var col3=grdHeader.GetGridData(1,6);
                var dis_col3=grdHeader.GetGridData(1,7);
                var col4=grdHeader.GetGridData(1,8);
                var dis_col4=grdHeader.GetGridData(1,9);
                var col5=grdHeader.GetGridData(1,10);
                var dis_col5=grdHeader.GetGridData(1,11);
				
                if(dis_col1!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC01,col1);
                    idGrid2.GetGridControl().ColHidden(G_SPEC01) = false ;  
					
					idGrid.SetGridText(0,G1_SPEC01,col1);
                    idGrid.GetGridControl().ColHidden(G1_SPEC01) = false ;  					                  
                }
                if (dis_col2!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC02,col1);
                    idGrid2.GetGridControl().ColHidden(G_SPEC02) = false ;  
					
					idGrid.SetGridText(0,G1_SPEC02,col1);
                    idGrid.GetGridControl().ColHidden(G1_SPEC02) = false ; 
                    
                }
                if (dis_col3!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC03,col1);
                    idGrid2.GetGridControl().ColHidden(G_SPEC03) = false ;  
					
					idGrid.SetGridText(0,G1_SPEC03,col1);
                    idGrid.GetGridControl().ColHidden(G1_SPEC03) = false ; 
                    
                }
                if (dis_col4!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC04,col1);
                    idGrid2.GetGridControl().ColHidden(G_SPEC04) = false ;  
					
					idGrid.SetGridText(0,G1_SPEC04,col1);
                    idGrid.GetGridControl().ColHidden(G1_SPEC04) = false ;                     
                }
                if (dis_col5!=0)
                {
                    idGrid2.SetGridText(0,G_SPEC05,col1);
                    idGrid2.GetGridControl().ColHidden(G_SPEC05) = false ;  
					
					idGrid.SetGridText(0,G1_SPEC05,col1);
                    idGrid.GetGridControl().ColHidden(G1_SPEC05) = false ;                     
                }
            }
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
		
		idGrid2.SetGridText( idGrid2.rows-1, G_PK,        oGrid.GetGridData( event.row, G1_PK        ));
		idGrid2.SetGridText( idGrid2.rows-1, G_WH_PK,     oGrid.GetGridData( event.row, G1_WH_PK     ));
		idGrid2.SetGridText( idGrid2.rows-1, G_WH_Name,   oGrid.GetGridData( event.row, G1_WH_Name   ));
		idGrid2.SetGridText( idGrid2.rows-1, G_ITEM_PK,   oGrid.GetGridData( event.row, G1_ITEM_PK   ));
		idGrid2.SetGridText( idGrid2.rows-1, G_ITEM_CODE, oGrid.GetGridData( event.row, G1_ITEM_CODE ));
		idGrid2.SetGridText( idGrid2.rows-1, G_ITEM_NAME, oGrid.GetGridData( event.row, G1_ITEM_NAME ));
		
		idGrid2.SetGridText( idGrid2.rows-1, G_SPEC01, oGrid.GetGridData( event.row, G1_SPEC01 ));
		idGrid2.SetGridText( idGrid2.rows-1, G_SPEC02, oGrid.GetGridData( event.row, G1_SPEC02 ));
		idGrid2.SetGridText( idGrid2.rows-1, G_SPEC03, oGrid.GetGridData( event.row, G1_SPEC03 ));
		idGrid2.SetGridText( idGrid2.rows-1, G_SPEC04, oGrid.GetGridData( event.row, G1_SPEC04 ));
		idGrid2.SetGridText( idGrid2.rows-1, G_SPEC05, oGrid.GetGridData( event.row, G1_SPEC05 ));
		
		idGrid2.SetGridText( idGrid2.rows-1, G_UOM,        oGrid.GetGridData( event.row, G1_UOM       ));
		idGrid2.SetGridText( idGrid2.rows-1, G_STOCK_QTY,  oGrid.GetGridData( event.row, G1_STOCK_QTY     ));
		idGrid2.SetGridText( idGrid2.rows-1, G_SELECT_QTY, oGrid.GetGridData( event.row, G1_STOCK_QTY     ));
        idGrid2.SetGridText( idGrid2.rows-1, G_Lot_No,     oGrid.GetGridData( event.row, G1_LOT_NO    ));
     }
  }
  countItem();
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
function OnGridEdit()
{
    var col = event.col;
    var row = event.row;
	
    if( col==G_SELECT_QTY )
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
        var bal_qty = Number(idGrid2.GetGridData(row,G_STOCK_QTY)) - Number(idGrid2.GetGridData(row,G_SELECT_QTY));
		
        idGrid2.SetGridText( row, G_BAL_QTY, System.Round( bal_qty, arr_FormatNumber[G_BAL_QTY] ) );
		//-------------------------------------
    }
	
}
//======================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00520_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_fpab00520_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00520" onreceive="OnReceiveData(this)"> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00520" > 
                  <input bind="idGrid" > 
                    <input bind="lstWH" />
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
                    <input bind="lstLang" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 11%; white-space: nowrap" align="right">
                <gw:list id="lstLang" styles='width:100%' onchange="OnSearch('1')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                W/H
            </td>
            <td style="width: 25%">
                <gw:list id="lstWH" styles="width:100%" onchange="OnSearch('1')" csstype="mandatory" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Group
            </td>
            <td style="width: 25%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch('1')" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
                <b>Item</b>
            </td>
            <td style="width: 43%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('1')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch('1')" />
            </td>
        </tr>
        <!---------------------------------------------------------------------------------------------->
        <tr style="height: 49%">
            <td colspan="9">
                <gw:grid id="idGrid" header="PK|_WH_PK|W/H Name|_ITEM_PK|Item Code|Item Name|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|UOM|Stock|Lot No"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					aligns="0|0|0|0|0|0|0|0|0|0|0|1|3|1" defaults="|||||||||||||" 
					editcol="0|0|0|0|0|00|0|0|0|0|0|0|0"
                    widths="0|0|2500|0|2000|2500|1500|1500|1500|1500|1500|800|1200|0" styles="width:100%; height:100%" sorting="T"
                    oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="7">
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
            <td colspan="8">
                <gw:grid id="idGrid2" header="_PK|_WH_PK|W/H Name|_ITEM_PK|Item Code|Item Name|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|UOM|Stock|Out Qty|Balance|Lot No"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					aligns="0|0|0|0|0|0|0|0|0|0|0|1|3|3|3|1" 
					defaults="|||||||||||||||" 
					editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0"
                    widths="0|0|2500|0|2000|2500|1500|1500|1500|1500|1500|800|1200|1200|1200|0" 
					styles="width:100%; height:100%" sorting="T" onafteredit="OnGridEdit()"/>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------------------------------->
	<gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' /> 		
</body>
</html>
