<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head>
    <title>Pop Up Get Many Item</title>
</head>


<script type="text/javascript" language="javascript" >

var G_TCO_ITEM_PK = 0,
    G_ITEM_CODE   = 1,
    G_ITEM_NAME   = 2,
    G_UOM         = 3,
    G_UNIT_PRICE  = 4,
    G_CCY         = 5,
    G_PRICE_TYPE  = 6,
    G_SUPPLIER_PK = 7,
    G_PARTNER 	  = 8,
	G_END_DATE	  = 9,	
	G_DEPT_PK	  =	10, 
	G_DEPT_NAME   = 11;
	
var G2_TCO_ITEM_PK = 0,
    G2_ITEM_CODE   = 1,
    G2_ITEM_NAME   = 2,
    G2_UOM         = 3,
    G2_UNIT_PRICE  = 4,
    G2_CCY         = 5,
	G2_SEL_QTY     = 6,
    G2_PRICE_TYPE  = 7,
    G2_SUPPLIER_PK = 8,
    G2_PARTNER 	   = 9,
	G2_END_DATE	   = 10,	
	G2_DEPT_PK	   = 11, 
	G2_DEPT_NAME   = 12;	

var arr_FormatNumber = new Array(); 
//------------------------------------------------------------------------------------------------
function BodyInit()
{
	System.Translate(document);
	
	txtUserPK.text = "<%=session("USER_PK")%>";	
	//-------------------------		
	OnFormatGrid();
	 
	//-----------
	if ( lstDept.value != '')
	{
		lstDept.SetEnable(false);
		
		if ( txtItem.text != '' )
		{
			OnSearch(1);
		}	
	}
	else
	{
		pro_fpab00074.Call();
	}
	//-----------
}
//------------------------------------------------------------------------------------------------
function OnFormatGrid()
{
	var data = "";  
    //-------------------------	
	var group_type = "<%=Request.querystring("group_type")%>";	
	
    data = "<%=CtlLib.SetListDataSQLPara("select a.pk, lpad('-',level ,'-')||a.grp_cd || ' - ' || a.grp_nm from tlg_it_itemgrp a where a.del_if = 0 and a.use_yn='Y' and a.group_type is not null and ( SALE_YN ={0} or PUR_YN ={1} or PROD_YN ={2} or SEMI_PROD_YN ={3} or MAT_YN ={4} or SUB_MAT_YN = {5} ) connect by prior a.pk = A.P_PK start with A.P_PK is null order siblings by grp_cd ", Request.querystring("group_type")) %>";     
    lstGroup.SetDataText(data);   
    //lstGroup.value="";
	
    data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0130') FROM DUAL" )%>||";    
    lstPriceType.SetDataText(data);    
    lstPriceType.value = '' ;
	
    data = "<%=CtlLib.SetListDataSQL("select pk,DEPT_ID || ' * '|| DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>||"; 
    lstDept.SetDataText(data);  
    lstDept.value = '' ;
	//-------------------------
	var p_item_code  = "<%=Request.querystring("p_item_code")%>";	
	var p_po_dept_pk = "<%=Request.querystring("p_po_dept_pk")%>";
	
	txtItem.text  = p_item_code;
	lstDept.value = p_po_dept_pk;
	
    var trl;
    
    trl = idGrid.GetGridControl();	
    trl.ColFormat(G_UNIT_PRICE) = "###,###,###,###,###.##"; 
       
    trl = idGrid2.GetGridControl();	
    trl.ColFormat(G2_UNIT_PRICE) = "###,###,###,###,###.##"; 
	trl.ColFormat(G2_SEL_QTY)    = "###,###,###,###,###.##";	
	
	arr_FormatNumber[G2_SEL_QTY] = 2;    
	
	idGrid2.GetGridControl().Cell( 7, 0, G2_SEL_QTY, 0, G2_SEL_QTY ) = 0x3300cc;
		
}
//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                 data_fpab00074_1.Call("SELECT");
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
    var col_val_1 = idGrid2.GetGridData( idGrid2.row, G2_TCO_ITEM_PK);
    var col_val_2 = idGrid2.GetGridData( idGrid2.row, G2_SUPPLIER_PK);
	
    idGrid2.RemoveRowAt(idGrid2.row);
    
    SetRowBackGroundColor(idGrid,col_val_1,col_val_2,0x000000); 
    
    countItem()
  }
}
//-------------------------------------------------------------------------------------------------
function SetRowBackGroundColor(p_oGrid, p_col_val_1, p_col_val_2, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if ( p_oGrid.GetGridData( i, G_TCO_ITEM_PK) == p_col_val_1 && p_oGrid.GetGridData( i, G_SUPPLIER_PK) == p_col_val_2 )
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
//-------------------------------------------------------------------------------------------------
function CheckDataExist( p_oGrid, p_row)
{
    if ( chkDuplicate.value == 'Y' )
    {
        return false ;
    }
    
    for(var i=1;i<p_oGrid.rows;i++)
    {
        if( (p_oGrid.GetGridData( i, G_TCO_ITEM_PK) == idGrid.GetGridData( p_row, G_TCO_ITEM_PK)) && (p_oGrid.GetGridData( i, G_SUPPLIER_PK) == idGrid.GetGridData( p_row, G_SUPPLIER_PK)) && (p_oGrid.GetGridData( i, G_PRICE_TYPE) == idGrid.GetGridData( p_row, G_PRICE_TYPE)) )
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
            var col_val_1 = oGrid.GetGridData(event.row, G_TCO_ITEM_PK );
			var col_val_2 = oGrid.GetGridData(event.row, G_SUPPLIER_PK );
            
            if ( event.row > 0 && ( !CheckDataExist(idGrid2,event.row)) )
            {
                SetRowBackGroundColor(oGrid,col_val_1,col_val_2,0x0000FF);
				
		        idGrid2.AddRow();
				 
				idGrid2.SetGridText( idGrid2.rows-1, G2_TCO_ITEM_PK, oGrid.GetGridData( event.row, G_TCO_ITEM_PK ));
				idGrid2.SetGridText( idGrid2.rows-1, G2_ITEM_CODE,   oGrid.GetGridData( event.row, G_ITEM_CODE   ));
				idGrid2.SetGridText( idGrid2.rows-1, G2_ITEM_NAME,   oGrid.GetGridData( event.row, G_ITEM_NAME   ));
				idGrid2.SetGridText( idGrid2.rows-1, G2_UOM,     	 oGrid.GetGridData( event.row, G_UOM         ));
				
				idGrid2.SetGridText( idGrid2.rows-1, G2_UNIT_PRICE,  oGrid.GetGridData( event.row, G_UNIT_PRICE  ));
				idGrid2.SetGridText( idGrid2.rows-1, G2_CCY,         oGrid.GetGridData( event.row, G_CCY         ));
				idGrid2.SetGridText( idGrid2.rows-1, G2_PRICE_TYPE,  oGrid.GetGridData( event.row, G_PRICE_TYPE  ));				
				idGrid2.SetGridText( idGrid2.rows-1, G2_SUPPLIER_PK, oGrid.GetGridData( event.row, G_SUPPLIER_PK ));
				idGrid2.SetGridText( idGrid2.rows-1, G2_PARTNER,     oGrid.GetGridData( event.row, G_PARTNER     ));
								
				idGrid2.SetGridText( idGrid2.rows-1, G2_END_DATE,    oGrid.GetGridData( event.row, G_END_DATE    ));
				idGrid2.SetGridText( idGrid2.rows-1, G2_DEPT_PK,     oGrid.GetGridData( event.row, G_DEPT_PK     ));
				idGrid2.SetGridText( idGrid2.rows-1, G2_DEPT_NAME,   oGrid.GetGridData( event.row, G_DEPT_NAME   ));

                idGrid2.SetCellBgColor( idGrid2.rows-1, G2_SEL_QTY, idGrid2.rows-1, G2_SEL_QTY, 0xCCFFFF );				
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
        case 'data_fpab00074_1':
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
		
        var col_val_1 = oGrid.GetGridData( row, G_TCO_ITEM_PK);
        var col_val_2 = oGrid.GetGridData( row, G_SUPPLIER_PK); 		
		
        if ( row > 0 && ( !CheckDataExist( idGrid2, row)) )
        {
            SetRowBackGroundColor( oGrid, col_val_1, col_val_2,0x0000FF);
            
			idGrid2.AddRow();
				
			idGrid2.SetGridText( idGrid2.rows-1, G2_TCO_ITEM_PK, oGrid.GetGridData( row, G_TCO_ITEM_PK ));
			idGrid2.SetGridText( idGrid2.rows-1, G2_ITEM_CODE,   oGrid.GetGridData( row, G_ITEM_CODE   ));
			idGrid2.SetGridText( idGrid2.rows-1, G2_ITEM_NAME,   oGrid.GetGridData( row, G_ITEM_NAME   ));
			idGrid2.SetGridText( idGrid2.rows-1, G2_UOM,     	 oGrid.GetGridData( row, G_UOM         ));
				
			idGrid2.SetGridText( idGrid2.rows-1, G2_UNIT_PRICE,  oGrid.GetGridData( row, G_UNIT_PRICE  ));
			idGrid2.SetGridText( idGrid2.rows-1, G2_CCY,         oGrid.GetGridData( row, G_CCY         ));
			idGrid2.SetGridText( idGrid2.rows-1, G2_PRICE_TYPE,  oGrid.GetGridData( row, G_PRICE_TYPE  ));				
			idGrid2.SetGridText( idGrid2.rows-1, G2_SUPPLIER_PK, oGrid.GetGridData( row, G_SUPPLIER_PK ));
			idGrid2.SetGridText( idGrid2.rows-1, G2_PARTNER,     oGrid.GetGridData( row, G_PARTNER     ));
								
			idGrid2.SetGridText( idGrid2.rows-1, G2_END_DATE,    oGrid.GetGridData( row, G_END_DATE    ));
			idGrid2.SetGridText( idGrid2.rows-1, G2_DEPT_PK,     oGrid.GetGridData( row, G_DEPT_PK     ));
			idGrid2.SetGridText( idGrid2.rows-1, G2_DEPT_NAME,   oGrid.GetGridData( row, G_DEPT_NAME   ));
        }		
	}
    
    countItem();    
} 

//================================================================================================

function CheckInput()
{
    
    var col = event.col;
    var row = event.row;
	
    if( col==G2_SEL_QTY )
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
    }
}

//================================================================================================
</script>

<body>     
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00074_1" onreceive="OnReceiveData(this)"> 
		<xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00074_1" > 
                  <input bind="idGrid" >
				  	<input bind="lstDept" />
				  	<input bind="lstGroup" />                     
                    <input bind="txtItem" />
					<input bind="lstPriceType" />
					<input bind="txtSupplier" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="pro_fpab00074" onreceive="OnReceiveData(this)">
        <xml>
            <dso  type="list" procedure="st_lg_pro_fpab00074" >
                <input>
                    <input bind="txtUserPK" />
                </input>
                <output>
                    <output bind="lstDept" />
                </output>
            </dso>
        </xml>
    </gw:data>	
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Dept
            </td>
            <td style="width: 35%" colspan=2 >
                <gw:list id="lstDept" styles="width:100%" onchange="OnSearch(1)" csstype="mandatory" />
            </td>             
            
			<td style="width: 5%; white-space: nowrap" align="right">
                Price Type
            </td>
            <td style="width: 30%" colspan=2 >
                <gw:list id="lstPriceType" styles='width:100%' />
            </td>			                       
        </tr> 
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Group
            </td>			
            <td style="width: 35%">
                <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch(1)" csstype="mandatory" />
            </td>             
            <td style="width: 25%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>			
            <td style="width: 5%; white-space: nowrap" align="right">
                Supplier
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtSupplier" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>			
            <td style="width: 5%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="8">
                 
				<gw:grid id='idGrid' 
					header='_tco_item_pk|Item Code|Item Name|UOM|U/Price|CCY|Price Type|_supplier_pk|Partner|End Date|_DEPT_PK|Dept'
                    format='0|0|0|0|1|0|0|0|0|4|0|0' 
					aligns='0|0|0|1|0|1|0|0|0|0|0|0' 
					check='|||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|1500|3500|800|1500|800|1200|0|2000|1200|0|1000' 
					sorting='T' 
					oncelldblclick="OnGridCellDoubleClick(this)"
					acceptnulldate="T"
                    styles='width:100%; height:100%' />
					
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="8">
                <table>
                    <tr>
                        <td style="width: 50%" align="center">
                            <gw:label id="lblRecord2" styles="color: blue; white-space:nowrap"></gw:label>
                        </td>
                        <td style="width: 46%" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 1%" style="white-space: nowrap">
                            <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" />
                        </td>
                        <td style="width: 1%" style="white-space: nowrap">
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
            <td colspan="8">                 
				<gw:grid id='idGrid2' 
					header='_tco_item_pk|Item Code|Item Name|UOM|U/Price|CCY|Sel Qty|Price Type|_supplier_pk|Partner|End Date|_DEPT_PK|Dept'
                    format='0|0|0|0|1|0|0|0|0|0|4|0|0' 
					aligns='0|0|0|1|0|1|3|0|0|0|0|0|0' 
					check='||||||||||||' 
					editcol='0|0|0|0|0|0|1|0|0|0|0|0|0'
                    widths='0|1500|3500|800|1500|800|1200|1200|0|2000|1200|0|1000' 
					sorting='T' 
					acceptnulldate="T"
                    styles='width:100%; height:100%' 
					onafteredit="CheckInput()"/>
					
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
	<gw:textbox id="txtUserPK" styles="width: 100%;display: none" />	
    <!---------------------------------------------------------------->
</body>
</html>
