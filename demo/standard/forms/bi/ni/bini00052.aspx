<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Item from P/O</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_PO_DEPT_PK	= 0,
	G_DEPT_ID		= 1,
	G_DEPT_NAME		= 2,
	G_REQ_DATE		= 3,
	G_PR_NO			= 4,
	G_PO_PO_D_PK	= 5,
	G_SEQ			= 6,
	G_PO_ITEM_PK	= 7,
	G_ITEM_CODE		= 8,
	G_ITEM_NAME		= 9,
	G_UOM			= 10,
	G_REQ_QTY		= 11,
	G_OUT_QTY		= 12,
	G_BAL_QTY		= 13,	
	G_UNIT_PRICE	= 14,
	G_DELI_DATE		= 15,
	G_DELI_TIME		= 16,
	G_PARTNER_PK	= 17,
	G_PARTNER_NAME	= 18;

//------------------------------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
	//------------------------- 
	
	var data = "DATA|1|REQ|2|DELI";
	
	lstDateType.SetDataText(data);
	lstDateType.value = 2;
	
 	var data = "<%=CtlLib.SetListDataSQL("select pk, DEPT_ID || ' * ' || DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>||"; 
    lstDept.SetDataText(data); 
	lstDept.value = '';    
	//---------------------------------------
	OnFormatGrid();
	//---------------------------------------
	
}
//------------------------------------------------------------------------------------------------
function OnFormatGrid()
{
    var trl;
    
    trl = idGrid.GetGridControl();	
	trl.ColFormat(G_REQ_QTY) 	= "###,###,###,###,###.##";
    trl.ColFormat(G_OUT_QTY) 	= "###,###,###,###,###.##"; 
	trl.ColFormat(G_BAL_QTY) 	= "###,###,###,###,###.##";
	trl.ColFormat(G_UNIT_PRICE) = "###,###,###,###,###.##";
       
    trl = idGrid2.GetGridControl();	
	trl.ColFormat(G_REQ_QTY)	= "###,###,###,###,###.##";
    trl.ColFormat(G_OUT_QTY) 	= "###,###,###,###,###.##"; 
	trl.ColFormat(G_BAL_QTY) 	= "###,###,###,###,###.##";   
	trl.ColFormat(G_UNIT_PRICE) = "###,###,###,###,###.##";    
}
//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                 data_bini00052.Call("SELECT");
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
    var col_val = idGrid2.GetGridData( idGrid2.row, G_PO_PO_D_PK);
    
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
      if(p_oGrid.GetGridData( i, G_PO_PO_D_PK) == p_col_val)
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
              if(p_oGrid.GetGridData(i, G_PO_PO_D_PK) == p_value)
              {
                 return true;
              }
       }
       return false;
}

var l_supplier_pk = '';
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == "idGrid" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, G_PO_PO_D_PK );
 
			if ( l_supplier_pk != oGrid.GetGridData( event.row, G_PARTNER_PK) && l_supplier_pk != '' )
			{
				alert("Khac Nha Cung Cap. Khong the chon mat hang nay.");
				
				return;
			}		
            //----------------
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
    if ( idGrid2.rows > 1 )
    {
		l_supplier_pk = idGrid2.GetGridData( 1, G_PARTNER_PK);
    }
    else
    {
		l_supplier_pk = '' ;
    }	
	
     	
    lblCount.text=idGrid2.rows-1 + " item(s)."
}
//======================================================================
function OnReceiveData(obj)
{
    switch(obj.id)
    {
        case 'data_bini00052':
            
		break;
    }
}
//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G_PO_PO_D_PK);		
		
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
    <gw:data id="data_bini00052" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_bini00052" > 
                  <input bind="idGrid" >
					<input bind="lstDateType" />
					
					<input bind="dtFrom" />
					<input bind="dtTo" />
					
					<input bind="txtSupplier" />
					
				  	<input bind="lstDept" /> 
                   
                    <input bind="txtItem" />
					<input bind="chkBalance" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">        
        <tr style="height: 1%">
			<td style="width: 5%; white-space: nowrap" align="right">
                <gw:list id="lstDateType" styles="width:50"  />
			</td>
            <td style="width: 20%; white-space: nowrap">
                <gw:datebox id="dtFrom" lang="1" width="10%" />
                ~
                <gw:datebox id="dtTo" lang="1" width="10%" />
            </td> 
			
			<td style="width: 5%" align="right">
                Supplier
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtSupplier" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
			
			<td style="width: 5%" align="right">
                Dept
            </td>
            <td style="width: 25%">
                <gw:list id="lstDept" styles="width:100%" onchange="OnSearch(1)" />
            </td>
		              
            <td style="width: 5%" align="right">
                Item
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
            <td style="width: 4%; white-space: nowrap" align="center">
				Bal
                <gw:checkbox id="chkBalance" styles="color:blue" defaultvalue="Y|N" value="Y" onclick="OnSearch()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="10">
                <gw:grid id="idGrid" 
					header="_DEPT_PK|_Dept ID|Dept Name|Req Date|P/R No|_PO_D_PK|Seq|_ITEM_PK|Item Code|Item Name|UOM|Req Qty|Out Qty|Bal Qty|U/Price|Deli Date|Deli Time|_PARTNER|Partner"
                    format="0|0|0|4|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0" 
					aligns="0|0|0|1|0|0|1|0|0|0|1|3|3|3|3|1|1|0|0"
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					widths="0|1500|2000|1200|1500|0|800|0|1500|3000|800|1200|1200|1200|1200|1200|1000|0|1200"
                    styles="width:100%; height:100%" sorting="T" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="10">
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
            <td colspan="10">
                <gw:grid id="idGrid2" 
					header="_DEPT_PK|_Dept ID|Dept Name|Req Date|P/R No|_PO_D_PK|Seq|_ITEM_PK|Item Code|Item Name|UOM|Req Qty|Out Qty|Bal Qty|U/Price|Deli Date|Deli Time|_PARTNER_PK|Partner"
                    format="0|0|0|4|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0" 
					aligns="0|0|0|1|0|0|1|0|0|0|1|3|3|3|3|1|1|0|0"
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					widths="0|1500|2000|1200|1500|0|800|0|1500|3000|800|1200|1200|1200|1200|1200|1000|0|1200"
                    styles="width:100%; height:100%" sorting="T" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
</body>
</html>
