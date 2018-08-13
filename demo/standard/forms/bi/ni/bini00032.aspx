<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>P/O Checking</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//======================================================================    
var  G_PARTNER_PK     = 0,
     G_PARTNER_ID     = 1,
     G_PARTNER_NAME   = 2,
     G_PO_M_PK        = 3,
     G_PO_NO    	  = 4,
     G_PO_DATE    	  = 5,
     G_REF_NO         = 6,
	 G_PO_D_PK 		  = 7,
	 G_SEQ        	  = 8,
	 G_ITEM_PK  	  = 9,
	 G_ITEM_CODE	  = 10,
	 G_ITEM_NAME	  = 11,
	 G_PO_UOM 		  = 12,
     G_PO_QTY         = 13,
     G_IN_QTY         = 14,
	 G_RET_QTY		  = 15,
     G_BAL_QTY        = 16,
     G_UPRICE         = 17,
     G_PO_AMT    	  = 18,
     G_TAX_RATE       = 19,
     G_TAX_AMT        = 20,
     G_TOTAL_AMT      = 21,
     G_PO_CCY         = 22,
     G_REMARK         = 23;
  
//======================================================================

function BodyInit()
{
     System.Translate(document);
	  
	 txtUserPK.text = "<%=session("USER_PK")%>";	 
     //---------------------------------------
     FormatGrid();
    
}  
//======================================================================

function FormatGrid()
 {           
  
	var data = "DATA|1|REQ|2|DELI";
	
	lstDateType.SetDataText(data);
	lstDateType.value = 2;
	  
    var ctrl = grdPOITEM.GetGridControl(); 
     
    ctrl.ColFormat(G_PO_QTY) 	= "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_IN_QTY)  	= "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_RET_QTY) 	= "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_BAL_QTY) 	= "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_UPRICE)  	= "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_PO_AMT) 	= "#,###,###,###,###,###.##";
	ctrl.ColFormat(G_TAX_RATE) 	= "#,###,###,###,###,###";
	ctrl.ColFormat(G_TAX_AMT) 	= "#,###,###,###,###,###.##";
	ctrl.ColFormat(G_TOTAL_AMT) = "#,###,###,###,###,###.##";
	ctrl.ColFormat(G_PO_AMT) 	= "#,###,###,###,###,###.##";
   
    grdPOITEM.GetGridControl().MergeCells  = 2 ;	
    grdPOITEM.GetGridControl().MergeCol(0) = true ;	
    grdPOITEM.GetGridControl().MergeCol(1) = true ;   	
    grdPOITEM.GetGridControl().MergeCol(2) = true ;	
    grdPOITEM.GetGridControl().MergeCol(3) = true ;	
    grdPOITEM.GetGridControl().MergeCol(4) = true ; 
	
	var ctrl = grdPOITEM2.GetGridControl(); 
     
    ctrl.ColFormat(G_PO_QTY) 	= "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_IN_QTY)  	= "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_RET_QTY) 	= "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_BAL_QTY) 	= "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_UPRICE)  	= "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_PO_AMT) 	= "#,###,###,###,###,###.##";
	ctrl.ColFormat(G_TAX_RATE) 	= "#,###,###,###,###,###";
	ctrl.ColFormat(G_TAX_AMT) 	= "#,###,###,###,###,###.##";
	ctrl.ColFormat(G_TOTAL_AMT) = "#,###,###,###,###,###.##";
	ctrl.ColFormat(G_PO_AMT) 	= "#,###,###,###,###,###.##";
      
	pro_bini00032.Call();
		
 }
           
   
 //======================================================================

function OnSearch()
{
    data_bini00032.Call("SELECT");
}        
//-----------------------------------------------------------------------------------------------
function OnSelect(oGrid)
{
	var arr_data = new Array();
	
	var l_po_no   = "";
    var l_pr_pk   = "";
  
    var l_comma   = "";
	
	var l_supplier_pk	= "";    
	var l_supplier_name	= "";
	var l_ccy        	= "";
	
    if ( oGrid.rows > 1 )
    {   
		for(var i=1;i<oGrid.rows;i++)
		{
			var arrTemp=new Array();
			
			if ( oGrid.id == "grdPOITEM2" )
			{
				if ( l_pr_pk != grdPOITEM2.GetGridData(i,G_PO_M_PK) )
				{
					l_po_no = l_po_no + l_comma + grdPOITEM2.GetGridData( i, G_PO_NO);
					l_pr_pk = grdPOITEM2.GetGridData( i, G_PO_M_PK);
					
					l_supplier_pk   = grdPOITEM2.GetGridData( i, G_PARTNER_PK   );
					l_supplier_name = grdPOITEM2.GetGridData( i, G_PARTNER_NAME );
					l_ccy			= grdPOITEM2.GetGridData( i, G_PO_CCY       );
					
					l_comma = ",";
				}
				//-------------------------------------
				for( var j=0; j<oGrid.cols; j++)
				{
					arrTemp[arrTemp.length] = oGrid.GetGridData(i,j);
				}
				//-------------------------------------
				arr_data[arr_data.length] = arrTemp;
				//-------------------------------------
			}
			else
			{
				if ( grdPOITEM.GetGridControl().isSelected(i) == true )
				{			
					if ( l_pr_pk != grdPOITEM.GetGridData(i,G_PO_M_PK) )
					{
						l_po_no = l_po_no + l_comma + grdPOITEM.GetGridData( i, G_PO_NO);
						l_pr_pk = grdPOITEM.GetGridData( i, G_PO_M_PK);
						
						l_supplier_pk   = grdPOITEM.GetGridData( i, G_PARTNER_PK   );
						l_supplier_name = grdPOITEM.GetGridData( i, G_PARTNER_NAME );
						l_ccy			= grdPOITEM.GetGridData( i, G_PO_CCY       );
						
						l_comma = ",";
					}
					//-------------------------------------
					for( var j=0; j<oGrid.cols; j++)
					{
						arrTemp[arrTemp.length] = oGrid.GetGridData(i,j);
					}
					//-------------------------------------
					arr_data[arr_data.length] = arrTemp;
					//-------------------------------------	
				}
				
			}			
			
		}
		
		//-------------------------------------
		if ( arr_data != null )
		{
			var callerWindowObj = dialogArguments;    
			  
			callerWindowObj.txtRefNo.text = l_po_no; 
			
			callerWindowObj.txtSupplierPK.text   = l_supplier_pk   ; 
			callerWindowObj.txtSupplierName.text = l_supplier_name ;
			
			callerWindowObj.lstCurrency.value = l_ccy ;			
		}	
		//-------------------------------------
		if ( arr_data != null )
		{
			window.returnValue =  arr_data;
			window.close();
		}
		else
		{
			alert("You have not selected data yet.");
		}
		//-------------------------------------
    }	  
	  
}

//======================================================================
function OnDataReceive(obj)
{
    if ( grdPOITEM.rows > 1 )
    {
         grdPOITEM.SetCellBgColor( 1, G_ITEM_CODE, grdPOITEM.rows-1, G_ITEM_NAME, 0xCCFFFF );
         grdPOITEM.SetCellBgColor( 1, G_BAL_QTY,   grdPOITEM.rows-1, G_BAL_QTY,   0xCCFFFF );
         
         grdPOITEM.SetCellBold( 1, G_PO_NO,     grdPOITEM.rows - 1, G_PO_NO,     true); 
         grdPOITEM.SetCellBold( 1, G_ITEM_CODE, grdPOITEM.rows - 1, G_ITEM_CODE, true);         
         grdPOITEM.SetCellBold( 1, G_PO_QTY,    grdPOITEM.rows - 1, G_PO_QTY,    true);  
    }
}
//======================================================================

var l_supplier_pk = '';

function OnGridCellDoubleClick(oGrid)
{
	if(oGrid.id == "grdPOITEM" && event.row > 0 )
	{
		if ( l_supplier_pk != oGrid.GetGridData( event.row, G_PARTNER_PK) && l_supplier_pk != '' )
		{
			alert("Khac Nha Cung Cap. Khong the chon mat hang nay.");
				
			return;
		}		
		//-------------
		var col_val_1 = oGrid.GetGridData(event.row, G_PO_D_PK );
		
		if(event.row > 0 && ( !CheckDataExist( grdPOITEM2, col_val_1) ) )
		{
				SetRowBackGroundColor( oGrid, col_val_1, 0x0000FF);		
				
				grdPOITEM2.AddRow();
				
				for(var i=0;i<oGrid.cols;i++)
				{
					grdPOITEM2.SetGridText(grdPOITEM2.rows-1,i,oGrid.GetGridData(event.row,i));
				}
				
				l_supplier_pk = oGrid.GetGridData( event.row, G_PARTNER_PK);
			
		}
	}
 
	countItem();
  
}

//======================================================================

function OnAdd()
{
      for(var r = 1; r < grdPOITEM.rows; r++ )
        {
            if ( grdPOITEM.GetGridControl().isSelected(r) == true )
            {
			
			    if ( l_supplier_pk != grdPOITEM.GetGridData( r, G_PARTNER_PK) && l_supplier_pk != '' )
				{
					alert("Khac Nha Cung Cap. Khong the chon mat hang nay.");
				
					return;
				}
			
                var col_val_1 = grdPOITEM.GetGridData(r, G_PO_D_PK );
				
                if(!CheckDataExist( grdPOITEM2, col_val_1)  )
                {
				
                    SetRowBackGroundColor( grdPOITEM, col_val_1, 0x0000FF);	
					
		            grdPOITEM2.AddRow();
					
		            for(var i=0;i<grdPOITEM.cols;i++)
                    {
                         grdPOITEM2.SetGridText(grdPOITEM2.rows-1,i,grdPOITEM.GetGridData(r,i));
                    }
						
					l_supplier_pk = grdPOITEM.GetGridData( r, G_PARTNER_PK);	
		
                }
            }
        }
		 
        countItem();
}

//======================================================================

function OnRemove()
{
  if(grdPOITEM2.row > 0)
  {
    var col_val = grdPOITEM2.GetGridData( grdPOITEM2.row, G_PO_D_PK);
    
    grdPOITEM2.RemoveRowAt(grdPOITEM2.row);
    
    SetRowBackGroundColor(grdPOITEM,col_val,0x000000); 
    
    countItem();
  }
}

//======================================================================

function countItem()
{

	if ( grdPOITEM2.rows > 1 )
    {
		l_supplier_pk = grdPOITEM2.GetGridData( 1, G_PARTNER_PK);
    }
    else
    {
		l_supplier_pk = '' ;
    }	
	
    lblCount.text=grdPOITEM2.rows-1 + " item(s)."
}

//================================================================================================

function CheckDataExist(p_oGrid,p_value_1)
{
    if ( chkDuplicate.value == 'Y' )
    {
        return false ;
    }
    
      for(var i=1;i<p_oGrid.rows;i++)
       {
          if(p_oGrid.GetGridData(i, G_PO_D_PK) == p_value_1)
          {
             return true;
          }
       }
       return false;
}

//================================================================================================

function SetRowBackGroundColor(p_oGrid, p_col_val_1, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if( p_oGrid.GetGridData( i, G_PO_D_PK) == p_col_val_1 )
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}

//======================================================================

</script>

<body>
    <!--------------------------------------------------------->
    <gw:data id="data_bini00032" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="st_lg_sel_bini00032" > 
                <input> 
					<input bind="lstDateType" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
					<input bind="txtPartnerNo" />
                    <input bind="txtItem" />
                    <input bind="chkBalance" />
					<input bind="lstDept" />
                </input> 
                <output bind="grdPOITEM" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="pro_bini00032" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="st_lg_pro_bini00032" >
                <input>
                    <input bind="txtUserPK" />
                </input>
                <output>
                    <output bind="lstDept" />
                </output>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            <gw:list id="lstDateType" styles="width:50"  />
						</td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" width="10%" />
                            ~
                            <gw:datebox id="dtTo" lang="1" width="10%" />
                        </td>
						<td style="width: 5%; white-space: nowrap" align="right">
                            No/Partner</td>
                        <td style="width: 15%">
                            <gw:textbox id="txtPartnerNo" styles="width:100%;" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Item</td>
                        <td style="width: 15%">
                            <gw:textbox id="txtItem" styles="width:100%;" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Dept</td>
                        <td style="width: 20%">
                            <gw:list id="lstDept" styles="width:100%" onchange="OnSearch()" />
                        </td>                     
                        <td style="width: 10%; white-space: nowrap">
							Bal
                            <gw:checkbox id="chkBalance" styles="color:blue" defaultvalue="Y|N" value="Y" onclick="OnSearch()" />
                        </td> 
						<td style="width: 3%">
						</td>                      
                        <td style="width: 1%">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnExit" img="Exit" alt="Exit" text="Exit" onclick="OnSelect(grdPOITEM)" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSelect" img="Select" alt="Select" text="Select" onclick="OnSelect(grdPOITEM)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="5">
                <gw:grid id='grdPOITEM' 
					header='_PARTNER_PK|Partner ID|Partner Name|_PO_M_PK|P/O No|P/O Date|Ref No|_PO_D_PK|Seq|_ITEM_PK|Item Code|Item name|UOM|P/O Qty|In Qty|Return Qty|Bal Qty|U/Price|P/O Amt|Tax (%)|Tax Amt|Total Amt|CCY|Deli Date|Deli Time|Remark'
                    format='0|0|0|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0' 
					aligns='0|0|0|0|0|1|0|0|1|0|0|0|1|3|3|3|3|3|3|3|3|3|1|1|0|0'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='0|1500|2000|0|1200|1200|1200|0|800|0|1500|2500|800|1200|1200|1200|1200|1200|1200|1000|1200|1200|1000|1200|1000|0'
                    sorting='T' styles='width:100%; height:100%'
					acceptnulldate="T"
					oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
         <tr style="height: 1%">
            <td colspan="10">
                <table border="0">
                    <tr>
                        <td align="center" style="width: 10%;white-space: nowrap">
                            
                        </td>
						
						<td align="center" style="width: 40%">
                          
                        </td>
						
						<td align="center" style="width: 40%">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
						
                        <td style="width: 7%" align="right" style="white-space: nowrap">
                            <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" />
                            Duplicate
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="ibtnAdd" img="new" alt="Add" onclick="OnAdd()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="ibtnRemove" img="delete" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%" align="right"  >
                            <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdPOITEM2)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
         <tr style="height: 49%">
            <td colspan="5">
                <gw:grid id='grdPOITEM2' 				 				
					header='_PARTNER_PK|Partner ID|Partner Name|_PO_M_PK|P/O No|P/O Date|Ref No|_PO_D_PK|Seq|_ITEM_PK|Item Code|Item name|UOM|P/O Qty|In Qty|Return Qty|Bal Qty|U/Price|P/O Amt|Tax (%)|Tax Amt|Total Amt|CCY|Deli Date|Deli Time|Remark'
                    format='0|0|0|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0' 
					aligns='0|0|0|0|0|1|0|0|1|0|0|0|1|3|3|3|3|3|3|3|3|3|1|1|0|0'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='0|1500|2000|0|1200|1200|1200|0|800|0|1500|2500|800|1200|1200|1200|1200|1200|1200|1000|1200|1200|1000|1200|1000|0'
                    sorting='T' styles='width:100%; height:100%'
					acceptnulldate="T" />
					
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
	<gw:textbox id="txtUserPK" styles="width: 100%;display: none" />
	
</body>
</html>
