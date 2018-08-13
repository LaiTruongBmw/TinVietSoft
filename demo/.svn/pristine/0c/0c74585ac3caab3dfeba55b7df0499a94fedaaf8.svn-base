<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>POP UP GET ITEM FROM SALE ORDER</title>
</head>

<script>
// grdDetail
   
var G1_PO_NO		= 0,
	G1_SO_ITEM_NO	= 1,		 
	G1_ITEM_PK		= 2,
	G1_ITEM_CODE	= 3,
	G1_ITEM_NAME	= 4,
	G1_UOM			= 5,
	G1_ORD_QTY 		= 6,	 
	G1_DELI_QTY		= 7,
	G1_DELI_BAL		= 8,		 
	G1_SO_D_PK		= 9, 	
	G1_REMARK		= 10; 
		
var G2_CHK			= 0,
	G2_LOT_NO		= 1,
	G2_STOCK_QTY	= 2,
	G2_WH_PK		= 3,
	G2_ITEM_PK		= 4,
	G2_ITEM_CDE		= 5,
	G2_ITEM_NAME	= 6,
	G2_UOM			= 7,
	G2_WH_NAME		= 8;
	
var G3_PO_NO			= 0,
	G3_SO_ITEM_NO		= 1,		 
	G3_REQ_ITEM_PK		= 2,
	G3_REQ_ITEM_CODE	= 3,
	G3_REQ_ITEM_NAME	= 4,
	G3_REQ_UOM			= 5,
	G3_DELI_BAL 		= 6,	 
	G3_STOCK_QTY		= 7,
	G3_LOT_NO			= 8,
	G3_STOCK_ITEM_PK	= 9,
	G3_STOCK_ITEM_CODE	= 10,
	G3_STOCK_ITEM_NAME	= 11,
	G3_STOCK_UOM		= 12,	 	 
	G3_SO_D_PK			= 13, 	
	G3_WH_PK			= 14,
	G3_WH_NAME			= 15,
	G3_REMARK			= 16;
	
	var arr_FormatNumber = new Array(); 
//==============================================================================================

 function BodyInit()
 {
    System.Translate(document);
    var callerWindowObj = dialogArguments;  
	
	txtCustPK.text = callerWindowObj.txtCustomerPK.text;
    lblCustName.text = callerWindowObj.txtCustomerName.text;	     
         
    dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-30));
	
    OnFormatGrid();
 } 

//==============================================================================================

function OnFormatGrid()
{
		var data = "";
        data = "DATA|O|Order|E|ETD";
        idList.SetDataText(data);
        idList.value = 'O';
		
		data = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 order by partner_name")%>||";
    	lstCompany.SetDataText(data);
    	lstCompany.value = "<%=Session("COMPANY_PK")%>" ;

		data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_id || ' * ' || wh_name  FROM tlg_in_warehouse  WHERE del_if = 0  ORDER BY wh_name  ASC" )%>||";    
		lstWH.SetDataText(data);     
		lstWH.value = '';		
		
		data = "<%=CtlLib.SetListDataSQLPara("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and ( SALE_YN ={0} or PUR_YN ={1} or  PROD_YN ={2} or  SEMI_PROD_YN ={3} or MAT_YN ={4} or SUB_MAT_YN ={5}) order by grp_cd ", Request.querystring("group_type")) %>||";     
		lstGroup.SetDataText(data);
		lstGroup.value = '';
	
    	var trl;
    	trl = grdDetail.GetGridControl();	
    	trl.ColFormat(G1_ORD_QTY)    = "###,###,###,###,###.##"; 
		trl.ColFormat(G1_DELI_QTY)   = "###,###,###,###,###.##";   
    	trl.ColFormat(G1_DELI_BAL)   = "###,###,###,###,###.##";    		 

    	trl = grdStock.GetGridControl();	
    	trl.ColFormat(G2_STOCK_QTY)    = "###,###,###,###,###.##"; 
	 	
		trl = grdItem.GetGridControl();	
    	trl.ColFormat(G3_DELI_BAL)    = "###,###,###,###,###.##"; 
		trl.ColFormat(G3_STOCK_QTY)   = "###,###,###,###,###.##";   
  		
		arr_FormatNumber[G3_STOCK_QTY] = 2;  
		
		grdDetail.GetGridControl().MergeCells  = 2 ;	
		grdDetail.GetGridControl().MergeCol(0) = true;  
		
		grdDetail.GetGridControl().Cell( 7, 0, G1_DELI_BAL, 0, G1_DELI_BAL ) = 0x3300cc;		
		grdItem.GetGridControl().Cell( 7, 0, G3_STOCK_QTY, 0, G3_STOCK_QTY ) = 0x3300cc;	
				
		lstCompany.value = "<%=Session("COMPANY_PK")%>" ;
}

//==============================================================================================

 function OnSearch(pos)
 {
	switch(pos)
	{
		case 'DETAIL':
			data_dscd00027.Call("SELECT");
		break;
		
		case 'STOCK':
			data_dscd00027_1.Call("SELECT");
		break;			
	}
       
 } 
 
//==============================================================================================

 function OnDataReceive(po_oData)
 {
      switch (po_oData.id)         
      {  
        case "data_dscd00027" :
            if ( grdDetail.rows > 1)
            {				
				grdDetail.GetGridControl().Cell( 7, 1, G1_DELI_BAL, grdDetail.rows - 1, G1_DELI_BAL ) = 0x3300cc;
            }
        break;
      }  
 }

//================================================================================================
function OnAdd()
{
	if ( grdDetail.row > 0 )
	{
		for (i = 1; i<grdStock.rows ; i++)
		{	
			if ( grdStock.GetGridData( i, G2_CHK) == -1 )
			{
				grdItem.AddRow();
				
				grdItem.SetGridText( grdItem.rows-1, G3_PO_NO, 			grdDetail.GetGridData( grdDetail.row, G1_PO_NO		) );			
				grdItem.SetGridText( grdItem.rows-1, G3_SO_ITEM_NO, 	grdDetail.GetGridData( grdDetail.row, G1_SO_ITEM_NO	) );
				grdItem.SetGridText( grdItem.rows-1, G3_REQ_ITEM_PK, 	grdDetail.GetGridData( grdDetail.row, G1_ITEM_PK	) );
				grdItem.SetGridText( grdItem.rows-1, G3_REQ_ITEM_CODE, 	grdDetail.GetGridData( grdDetail.row, G1_ITEM_CODE	) );
				grdItem.SetGridText( grdItem.rows-1, G3_REQ_ITEM_NAME, 	grdDetail.GetGridData( grdDetail.row, G1_ITEM_NAME	) );
				grdItem.SetGridText( grdItem.rows-1, G3_REQ_UOM, 		grdDetail.GetGridData( grdDetail.row, G1_UOM		) );
				
				grdItem.SetGridText( grdItem.rows-1, G3_DELI_BAL, grdDetail.GetGridData( grdDetail.row, G1_DELI_BAL	) );
				
				grdItem.SetGridText( grdItem.rows-1, G3_SO_D_PK, grdDetail.GetGridData( grdDetail.row, G1_SO_D_PK	) );
				grdItem.SetGridText( grdItem.rows-1, G3_REMARK,  grdDetail.GetGridData( grdDetail.row, G1_REMARK	) );
				
				grdItem.SetGridText( grdItem.rows-1, G3_STOCK_QTY, grdStock.GetGridData( i, G2_STOCK_QTY) );
				grdItem.SetGridText( grdItem.rows-1, G3_LOT_NO,    grdStock.GetGridData( i, G2_LOT_NO   ) );
				
				grdItem.SetGridText( grdItem.rows-1, G3_STOCK_ITEM_PK, 	 grdStock.GetGridData( i, G2_ITEM_PK  ) );
				grdItem.SetGridText( grdItem.rows-1, G3_STOCK_ITEM_CODE, grdStock.GetGridData( i, G2_ITEM_CDE ) );
				grdItem.SetGridText( grdItem.rows-1, G3_STOCK_ITEM_NAME, grdStock.GetGridData( i, G2_ITEM_NAME) );
				grdItem.SetGridText( grdItem.rows-1, G3_STOCK_UOM,		 grdStock.GetGridData( i, G2_UOM      ) );
				
				grdItem.SetGridText( grdItem.rows-1, G3_WH_PK,   grdStock.GetGridData( i, G2_WH_PK   ) );
				grdItem.SetGridText( grdItem.rows-1, G3_WH_NAME, grdStock.GetGridData( i, G2_WH_NAME ) );
			}
		}	
		
		if ( i == 1 )
		{
				grdItem.AddRow();
				
				grdItem.SetGridText( grdItem.rows-1, G3_PO_NO, 			grdDetail.GetGridData( grdDetail.row, G1_PO_NO		) );			
				grdItem.SetGridText( grdItem.rows-1, G3_SO_ITEM_NO, 	grdDetail.GetGridData( grdDetail.row, G1_SO_ITEM_NO	) );
				grdItem.SetGridText( grdItem.rows-1, G3_REQ_ITEM_PK, 	grdDetail.GetGridData( grdDetail.row, G1_ITEM_PK	) );
				grdItem.SetGridText( grdItem.rows-1, G3_REQ_ITEM_CODE, 	grdDetail.GetGridData( grdDetail.row, G1_ITEM_CODE	) );
				grdItem.SetGridText( grdItem.rows-1, G3_REQ_ITEM_NAME, 	grdDetail.GetGridData( grdDetail.row, G1_ITEM_NAME	) );
				grdItem.SetGridText( grdItem.rows-1, G3_REQ_UOM, 		grdDetail.GetGridData( grdDetail.row, G1_UOM		) );
				
				grdItem.SetGridText( grdItem.rows-1, G3_DELI_BAL, grdDetail.GetGridData( grdDetail.row, G1_DELI_BAL	) );
				
				grdItem.SetGridText( grdItem.rows-1, G3_SO_D_PK, grdDetail.GetGridData( grdDetail.row, G1_SO_D_PK	) );
				grdItem.SetGridText( grdItem.rows-1, G3_REMARK,  grdDetail.GetGridData( grdDetail.row, G1_REMARK	) );								
		}		
	}
	else
	{
		alert("PLS SELECT ONE P/O");
	}
		 
    countItem();    
}
 
//==============================================================================================
function OnRemove()
{
  if ( grdItem.row > 0 )
  {  
		grdItem.RemoveRowAt(grdItem.row);          
		
		countItem();
  }
}
//==============================================================================================

function countItem()
{
    lblCount.text=grdItem.rows-1 + " item(s)."
}

 
//==============================================================================================
function OnCheckInput()
{
    var col, row
    
    col = event.col
    row = event.row  

    if ( col == G3_STOCK_QTY )
	{
 		var dQuantiy ;
        
        dQuantiy =  grdItem.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdItem.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdItem.SetGridText( row, col, "");
            }
        }
        else
        {
            grdItem.SetGridText(row,col,"") ;
        }  	
	}	    
}

//==============================================================================================
function OnSelect(oGrid)
{
   var arr_data = new Array();
   
   var l_last_po_no = "";
   var l_comma = "";
   
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
				
				if ( l_last_po_no != oGrid.GetGridData(i,G3_PO_NO) )
				{
					txtArrayPONo.text = txtArrayPONo.text + l_comma + oGrid.GetGridData(i,G3_PO_NO);
					
					l_last_po_no = oGrid.GetGridData(i,G3_PO_NO);
					l_comma = ",";
				}		 
      }
      
	  if ( arr_data !=null )
	  {	  
	 		var callerWindowObj = dialogArguments;    

            callerWindowObj.txtRefNo.text = txtArrayPONo.text ;  
				
			window.returnValue =  arr_data;
			window.close();
	  }
	  else
	  {
	    alert("You have not selected data yet.");
	  }
   }	  
	  
}
//====================================================================
 
 
function OnGridCellClick(obj)
{
	switch(obj.id)
	{
		case 'grdDetail':
			txtStockItem.text = grdDetail.GetGridData( grdDetail.row, G1_ITEM_CODE);
		break;
	}	
}
 
//====================================================================
 
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_dscd00027" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0,1,2,3,4" function="st_lg_sel_dscd00027" > 
                <input>
					<input bind="lstCompany" />
					<input bind="txtCustPK" />
					<input bind="idList" />
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                    <input bind="txtSOPONo" />  
					<input bind="txtItem" />                  
                    <input bind="chkBal" />                 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="data_dscd00027_1" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_dscd00027_1" > 
                  <input bind="idGrid" > 
                    <input bind="lstWH" />
                    <input bind="lstGroup" />
                    <input bind="txtStockItem" />                
					<input bind="txtStockLotNo" /> 
                  </input> 
                <output bind="grdStock" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
		<tr style="height: 60%" >
			<td align="right" style="width: 60%" >
				<table style="width: 100%; height: 100%">
					<tr style="height: 1%">
						<td align="right" style="width: 10%" >
							Company
						</td>
						<td align="right" style="width: 20%">
							<gw:list id="lstCompany" styles='width:100%' onchange="OnSearch('DETAIL')" />
						</td>
						<td colspan="3">
							<gw:textbox id="txtCustPK" styles='display:none' />
							<gw:label id="lblCustName" styles='width:100%;color:cc0000;font:9pt' />
						</td>
						<td style="width: 8%" align="center">
						</td>
						<td align="right" style="width: 1%">
						</td>
						<td align="right" style="width: 1%">
							<gw:button img="search" alt="Search" id="btnSearch_1" onclick="OnSearch('DETAIL')" />
						</td>
					</tr>
					<tr style="height: 1%">
						<td align="right" style="width: 10%">
							<gw:list id="idList" styles="color:blue;width:100%" value="O" onchange="OnSearch('DETAIL')" />
						</td>
						<td style="width: 20%">
							<gw:datebox id="dtFrom" lang="1" />
							~<gw:datebox id="dtTo" lang="1" />
						</td>
						<td align="right" style="width: 5%; white-space: nowrap">
							SO/PO No</td>
						<td style="width: 25%">
							<gw:textbox id="txtSOPONo" styles='width:100%' onenterkey="OnSearch('DETAIL')" />
						</td>
						<td align="right" style="width: 5%">
							Item
						</td>
						<td style="width: 25%">
							<gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch('DETAIL')" />
						</td>
						<td style="width: 10%; white-space: nowrap" align="center" colspan="3">
							<gw:checkbox id="chkBal" styles="color:red" defaultvalue="Y|N" value="Y">Balance</gw:checkbox>
						</td>
					</tr>
					<tr style="height: 48%">
						<td colspan="9">
							<gw:grid id='grdDetail' header='P/O No|_S/O Item No|_ITEM_PK|Item Code|Item Name|UOM|Ord Qty|Deli Qty|Deli Bal|_SO_D_PK|Remark'
								format='0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|1|3|3|3|0|0' check='||||||||||'
								editcol='0|0|0|0|0|0|0|0|0|0|0' widths='1500|1500|0|1500|3000|800|1200|1200|1200|0|0'
								sorting='T' styles='width:100%; height:100%' oncellclick="OnGridCellClick(this)" />
						</td>
					</tr>
				</table>
			</td>
			<td align="right" style="width: 40%" >
				<table style="width: 100%; height: 100%">
					<tr style="height: 1%">		
						<td style="width: 5%; white-space: nowrap" align="right">
							Group
						</td>
						<td style="width: 40%">
							<gw:list id="lstGroup" styles="width:100%" onchange="OnSearch('STOCK')" csstype="mandatory" />
						</td>  
						
						<td style="width: 5%; white-space: nowrap" align="right">
							W/H
						</td>
						<td style="width: 40%">
							<gw:list id="lstWH" styles="width:100%" onchange="OnSearch('STOCK')" csstype="mandatory" />
						</td>						 
						<td style="width: 4%" align="right">              
						</td>
						<td style="width: 1%" align="right">
							<gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch('STOCK')" />
						</td>
					</tr>
					<tr style="height: 1%">		
						<td style="width: 5%; white-space: nowrap" align="right">
							Item
						</td>
						<td style="width: 40%">
							<gw:textbox id="txtStockItem" styles="width:100%" onenterkey="OnSearch('STOCK')" />
						</td>  						
						<td style="width: 5%; white-space: nowrap" align="right">
							Lot No
						</td>
						<td style="width: 40%">
							<gw:textbox id="txtStockLotNo" styles="width:100%" onenterkey="OnSearch('STOCK')" />
						</td>						         						
						<td style="width: 5%" align="right" colspan=2 > 							 
						</td>						 
					</tr>
					<tr style="height: 98%">
						<td colspan="9">
							<gw:grid id='grdStock' 
								header='-|Lot No|Stock Qty|_WH_PK|_ITEM_PK|Item Code|Item Name|UOM|W/H Name'
								format='3|0|0|0|0|0|0|0|0' 
								aligns='0|1|3|0|0|0|0|1|0'  
								editcol='0|0|0|0|0|0|0|0|0' 
								widths='800|1200|1200|0|0|1500|3000|800|1500'
								sorting='T' styles='width:100%; height:100%' />
						</td>
					</tr>					
				</table>
			</td>
		</tr>                      
        <tr style="height: 40%">
            <td colspan="2">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%" >
                        <td style="width: 50%" align="center">
                            <gw:label id="lblRecord2" styles="color: blue; white-space:nowrap"></gw:label>
                        </td>
                        <td style="width: 46%" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 1%" style="white-space: nowrap">
 
                        </td>
                        <td style="width: 1%" style="white-space: nowrap">
                       
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(grdDetail)" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdItem)" />
                        </td>
                    </tr>
					<tr style="height: 99%" >
						<td colspan=9>
							<gw:grid id='grdItem' 
								header='P/O|_S/O Item No|_REQ_PK|Item Code|Item Name|UOM|Deli Bal|Stock Qty|Lot No|_Stock_Item_PK|Stock Code|Stock Name|UOM|_SO_D_PK|_WH_PK|W/H Name|Remark'
								format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|0|0|1|3|3|1|0|0|0|0|0|0|0|0' 							 
								editcol='0|0|0|0|0|1|1|1|0|0|0|0|0|0|0|0|0' 
								widths='1500|1500|0|1500|2500|800|1200|1200|1500|0|1500|2500|800|0|0|1500|0'
								sorting='T' styles='width:100%; height:100%' onafteredit="OnCheckInput()" />
						</td>
					</tr>
                </table>
            </td>
        </tr>         
    </table>
    <gw:textbox id="txtArrayPONo" styles="width: 100%;display: none" />
</body>
</html>
