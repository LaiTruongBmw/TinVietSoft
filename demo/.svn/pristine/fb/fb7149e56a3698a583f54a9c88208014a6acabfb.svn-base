<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Outgoing Req Item</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//======================================================================    

var G_SALEORDER_M_PK        = 0,
    G_SLIP_NO               = 1,
    G_ORDER_DT              = 2,  
    G_BILL_TO_NAME          = 3,
    G_SALEORDER_D_PK        = 4,
    G_ITEM_PK               = 5,
    G_ITEM_CODE             = 6,
    G_ITEM_NAME             = 7,
    G_ORD_UOM               = 8, 
	G_ORD_QTY				= 9;

var G1_SALEORDER_D_PK        = 0,
    G1_ITEM_PK               = 1,
    G1_ITEM_CODE             = 2,
    G1_ITEM_NAME             = 3,
    G1_UOM                   = 4,  
	G1_ORD_QTY				 = 5,
	G1_CONS_QTY              = 6,
	G1_NEED_QTY              = 7,
	G1_REMARK                = 8;
              
//======================================================================

function BodyInit()
{
    System.Translate(document);
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate = dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //----------------------------   
    FormatGrid();
    
}
//======================================================================
 function FormatGrid()
 {           
    var ctrl = idGrid2.GetGridControl(); 
    
    ctrl.ColFormat(G1_NEED_QTY) = "###,###,##0.##";
    //ctrl.ColFormat(G_TR_QTY)  = "#,###,###,###,###,###.##";
    //ctrl.ColFormat(G_BAL_QTY) = "#,###,###,###,###,###.##";
    
    grdDetail.GetGridControl().MergeCells  = 2 ;	
    grdDetail.GetGridControl().MergeCol(0) = true ;	
    grdDetail.GetGridControl().MergeCol(1) = true ;   	
    grdDetail.GetGridControl().MergeCol(2) = true ;	
    grdDetail.GetGridControl().MergeCol(3) = true ;	
    grdDetail.GetGridControl().MergeCol(4) = true ; 
    grdDetail.GetGridControl().MergeCol(5) = true ; 
    
    
 } 
//======================================================================

function OnSearch(pos)
{
  switch (pos)
    {
         case 'grdSearch':
            data_fppw00031_1.Call("SELECT");
         break;  
        case 'grdDetail':
            txtSaleOrdPK.text  = grdSearch.GetGridData(grdSearch.row,G_SALEORDER_D_PK);
            data_fppw00031_2.Call("SELECT");
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
function OnDataReceive(obj)
{
//    if ( grdDetail.rows > 1 )
//    {
//         grdDetail.SetCellBgColor( 1, G_ITEM_CODE, grdDetail.rows-1,  G_ITEM_NAME, 0xCCFFFF );
//         grdDetail.SetCellBgColor( 1, G_BAL_QTY, grdDetail.rows-1,    G_BAL_QTY, 0xCCFFFF );
//         
//         grdDetail.SetCellBold( 1, G_REF_NO, grdDetail.rows - 1,    G_REF_NO, true); 
//         grdDetail.SetCellBold( 1, G_ITEM_CODE, grdDetail.rows - 1, G_ITEM_CODE, true);
//         
//         grdDetail.SetCellBold( 1, G_REQ_QTY, grdDetail.rows - 1, G_BAL_QTY, true);  
//         grdDetail.SetCellBold( 1, G_LOT_NO,  grdDetail.rows - 1, G_LOT_NO,  true);
//    }
}
//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G1_SALEORDER_D_PK);		
		
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

function CheckDataExist(p_oGrid,p_value)
{
    if ( chkDuplicate.value == 'Y' )
    {
        return false ;
    }
    
      for(var i=1;i<p_oGrid.rows;i++)
       {
          if(p_oGrid.GetGridData(i, G1_ITEM_PK) == p_value)
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
      if(p_oGrid.GetGridData( i, G1_SALEORDER_D_PK ) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
//======================================================================
function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}
//======================================================================

function OnGridCellDoubleClick(oGrid)
{
  if(oGrid.id == "grdDetail" && event.row > 0 )
  {
    var col_val = oGrid.GetGridData(event.row, G1_ITEM_PK );
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
//-------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData( idGrid2.row, G1_SALEORDER_D_PK);
    
    idGrid2.RemoveRowAt(idGrid2.row);
    
    SetRowBackGroundColor(grdDetail,col_val,0x000000); 
    
    countItem()
  }
 }
 //======================================================================
function OnExit()
{
    window.close();
} 
//======================================================================

</script>

<body>
   <!--============================================= Search =====================================-->
    <gw:data id="data_fppw00031_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_sel_fppw00031_1" > 
                <input> 
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtCustomer" />
                    <input bind="txtItem" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    
    <!--============================================= Detail =====================================-->
    <gw:data id="data_fppw00031_2" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,3,4,5,6" function="<%=l_user%>lg_sel_fppw00031_2">
				<input	bind="grdDetail">					
					<input	bind="txtSaleOrdPK"	/>	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
	<!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="0">
     
        <tr style="height: 50%">
        <td colspan="5">
         <table style="width: 100%; height: 100%" border="0">
         <tr>      
             <td style="width: 50%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Date
                        </td>
                        <td style="white-space: nowrap; width: 85%">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~
                            <gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 5%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Customer
                        </td>
                        <td style="width: 85%" colspan="1">
                            <gw:textbox id="txtCustomer" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>                
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Item
                        </td>
                        <td style="width: 85%" colspan="1">
                            <gw:textbox id="txtItem" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                        
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="3">                 
                             <gw:grid id='grdSearch'
                            header='_TLG_SA_SALEORDER_M_PK|Slip No/Po No|Order DT|_Bill To Name|_TLG_SA_SALEORDER_D_PK|_TLG_IT_ITEM_PK|_ITEM_CODE|Item Name|UOM|Order Qty'
                            format='1|0|4|0|1|1|0|0|0|1'
                            aligns='0|1|1|1|0|0|1|0|1|0'
                            check='|||||||||'
                            editcol='0|0|0|0|0|0|0|0|0|0'
                            widths='0|1800|1200|2000|0|0|500|2000|600|800'        
                            styles='width:100%; height:100%' sorting="T" param="0,1,2,3" oncellclick="OnSearch('grdDetail')" 
                            />
                        </td>
                    </tr>
                </table>
            </td>
             <td style="width: 50%">
                <table style="width: 100%; height: 100%">           
                    <tr>
                        <td>                 
                            <gw:grid id='grdDetail'
                            header='_TLG_SA_SALEORDER_D_PK|_CHILD_PK|Item Code|Item Name|Uom|Order Qty|Cons. Qty|Need Qty|Remark(S/O detail)'
                            format='1|1|0|0|0|1|1|1|0'
                            aligns='0|0|1|0|0|0|0|0|0'
                            check='||||||||'
                            editcol='0|0|0|0|0|0|0|0|0'
                            widths='0|0|1200|2000|600|1000|1000|1500|1500'
                            sorting='T'              
                            styles='width:100%; height:100%'oncelldblclick="OnGridCellDoubleClick(this)"
                            /> 
                        </td>
                    </tr>
                </table>
            </td>
            </tr>
            </table>
            </td>
        </tr>     
        <tr>
            <td style="width: 96%" align="center">
                <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
            </td>
            <td style="width: 1%" align="right" style="white-space: nowrap">
                <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" />
                Duplicate
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(grdDetail)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSelect" img="select" alt="Select" text="Select" onclick="OnSelect(idGrid2)" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="5">
                <gw:grid id='idGrid2'            
                header='_TLG_SA_SALEORDER_D_PK|_CHILD_PK|Item Code|Item Name|Uom|Order Qty|Cons. Qty|Need Qty|Remark(S/O detail)'
                format='1|1|0|0|0|1|1|1|0'
                aligns='0|0|1|1|1|0|0|0|0'
                check='||||||||'
                editcol='0|0|0|0|0|0|0|1|0'
                widths='0|0|1200|4000|1000|1500|1500|1500|1500'
                sorting='T' styles='width:100%; height:100%' />                  
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
    <gw:textbox id="txtType" styles="width:100%;display:none" />
    <gw:textbox id="txtSaleOrdPK" text="" style="display: none" />
    <!-------------------------------------------------------------------------->
</body>
</html>
