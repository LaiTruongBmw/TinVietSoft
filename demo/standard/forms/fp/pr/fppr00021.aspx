<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>POP UP GET ITEM FROM S/O</title>
</head>

<script>
// grdReqItemList   
var G1_SO_D_PK    		   = 0,  
    G1_PARTNER             = 1,
    G1_PO_NO               = 2,  
    G1_SO                  = 3,  
    G1_ETD                 = 4,  
    G1_TCO_ITEM_PK         = 5,  
    G1_ITEM_CODE           = 6,  
    G1_ITEM_NAME           = 7,
    G1_UOM                 = 8,      
    G1_ORD_QTY             = 9,  
    G1_UNIT_PRICE          = 10,   
    G1_AMOUNT	           = 11,
    G1_PROD_QTY            = 12,  
    G1_BALANCE_QTY         = 13,
    G1_TABLE_NM            = 14 ;  
	 
//================================================================================================
 function BodyInit()
 {
    System.Translate(document); 
	
    var callerWindowObj = dialogArguments;  
    var data="";  
    dtFromDate.SetDataText(System.AddDate(dtToDate.GetData(),-30));
	
    OnFormatGrid();
   
 } 

//================================================================================================

function OnFormatGrid()
{
    var trl;
    trl = grdReqList.GetGridControl();	
    trl.ColFormat(G1_ORD_QTY)         = "###,###,###,###,###.##";    
    trl.ColFormat(G1_UNIT_PRICE)      = "###,###,###,###,###.##";    
    trl.ColFormat(G1_AMOUNT)          = "###,###,###,###,###.##";    
	trl.ColFormat(G1_PROD_QTY)        = "###,###,###,###,###.##"; 
	trl.ColFormat(G1_BALANCE_QTY)     = "###,###,###,###,###.##"; 
	
    trl = grdItemSelect.GetGridControl();	
    trl.ColFormat(G1_ORD_QTY)         = "###,###,###,###,###.##";    
    trl.ColFormat(G1_UNIT_PRICE)      = "###,###,###,###,###.##";    
    trl.ColFormat(G1_AMOUNT)          = "###,###,###,###,###.##";    
	trl.ColFormat(G1_PROD_QTY)        = "###,###,###,###,###.##"; 
	trl.ColFormat(G1_BALANCE_QTY)     = "###,###,###,###,###.##";     
}

//================================================================================================

 function OnSearch(pos)
 {
      switch (pos)         
      {		        
        case 1 :
            data_fppr00021.Call("SELECT");
        break;
		
        
      }  
 }

//================================================================================================

 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
        case "data_fppr00021" :
            if(grdReqList.row > 0)
            {
                txtRequestPK.text = grdReqList.GetGridData(grdReqList.row,G1_TCO_STITEM_PK);     
                data_fppr00021_1.Call("SELECT");
            }
        break;
      }  
 }
 
//================================================================================================
function OnRemove()
{
  if(grdItemSelect.row > 0)
  {
    var col_val = grdItemSelect.GetGridData(grdItemSelect.row,G1_SO_D_PK);       
    grdItemSelect.RemoveRowAt(grdItemSelect.row);
    
   for (var i=1; i<grdReqItemList.rows; i++ )
   {
      if ( grdReqItemList.GetGridData(i,2) == col_val )
      {
         countItem();
         grdReqItemList.SetCellBgColor( i, 1 , i, G1_BALANCE_QTY  , 0x000000 );
         return;
      }
   }    
  }
}

 
//================================================================================================
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for (var i=1; i<p_oGrid.rows; i++ )
   {
      if ( p_oGrid.GetGridData(i,0) == p_col_val )
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}

//================================================================================================
function CheckDataExist(p_oGrid,p_value)
{
  for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData(i,G1_SO_D_PK) == p_value)
      {
         return true;
      }
      
   }
   return false;
}
//================================================================================================
    var gPreviousRow = -1 ;
//================================================================================================

function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == "grdReqList" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, G1_SO_D_PK );
            
            if ( event.row > 0 && ( !CheckDataExist(grdItemSelect,col_val)) )
            {
                SetRowBackGroundColor(oGrid,col_val,0x0000FF);
		        grdItemSelect.AddRow();
				
		        for(var i=0;i<oGrid.cols;i++)
		        {
		          	grdItemSelect.SetGridText(grdItemSelect.rows-1,i,oGrid.GetGridData(event.row,i));
		        }
            }
      }
      countItem()
} 
//================================================================================================

function OnGridCellClick(oGrid)
{
}

//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G1_SO_D_PK);		
		
        if ( row > 0 && ( !CheckDataExist( grdItemSelect, col_val)) )
        {
            SetRowBackGroundColor( oGrid, col_val, 0x0000FF);
            
	        grdItemSelect.AddRow();
    		
	        for(var j=0; j<oGrid.cols; j++)
	        {
	            grdItemSelect.SetGridText( grdItemSelect.rows-1, j, oGrid.GetGridData( row, j) );
	        }
        }		
	}
    
    countItem();    
}

//================================================================================================
function countItem()
{
    txtCount.text = grdItemSelect.rows-1 + " item(s)."
}
//================================================================================================
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
//================================================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00021" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0,1,2,3,4" function="<%=l_user%>lg_sel_fppr00021" > 
                <input>
                    <input bind="dtFromDate" /> 
                    <input bind="dtToDate" />  
                    <input bind="txtRequestNo" />
                    <input bind="chkBalance" />
                    <input bind="dtETDFrom" /> 
                    <input bind="dtETDTo" />  
                </input> 
                <output bind="grdReqList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <form id="form1" runat="server">
        <table width="100%" style="height: 100%" cellpadding="0" cellspacing="0" border="1">
            <tr style="width: 100%">
                <td style="width: 100%; height: 50%">
                    <table style="width: 100%; height: 100%" border="0">
                        <tr style="height: 1%">                           
                            <td align="right" style="width: 5%; white-space: nowrap">
                                SO/PO/Item
                            </td>
                            <td style="width: 30%">
                                <gw:textbox id="txtRequestNo" styles='width:100%' csstype="mandatory" onenterkey="OnSearch(1)" />
                            </td>
                            <td align='right' style="width: 5%; white-space: nowrap">
                                Doc Date
                            </td>
                            <td style="width: 20%">
                                <gw:datebox id="dtFromDate" lang="1" />
                                ~<gw:datebox id="dtToDate" lang="1" />
                            </td>
                             <td align='right' style="width: 5%; white-space: nowrap">
                                ETD</td>
                            <td style="width: 20%">
                                <gw:datebox id="dtETDFrom" lang="1" nullaccept />
                                ~<gw:datebox id="dtETDTo" lang="1" nullaccept />
                               
                            </td>
                            <td style="width: 14%" align="center">
                                <gw:checkbox id="chkBalance" styles="color:red" defaultvalue="Y|N" value="Y">Balance</gw:checkbox>
                            </td>                            
                            <td align="right" style="width: 1%">
                                <gw:imgbtn img="search" alt="Search" id="btnSearch_1" onclick="OnSearch(1)" />
                            </td>
                        </tr>
                        <tr id='top' style="height: 99%">
                            <td colspan="11">
								<table style="width: 100%; height: 100%" >
									<tr>
										<td style="width: 50%" >
											<gw:grid id='grdReqList' header='_tsa_saleorderd_pk|Partner|_P/O No|No|ETD|_tco_item_pk|Item Code|Item Name|UOM|Ord Qty|_Unit Price|_amount|Prod Qty|Bal Qty|_TABLE'
												format='0|0|0|0|4|0|0|0|0|0|0|0|0|0|0' 
												aligns='0|0|0|0|0|0|0|0|1|3|0|0|3|3|0'
												check='|||||||||||||||' 
												editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
												widths='0|2000|1500|1500|1200|0|1500|3500|800|1200|0|0|1200|1200|0'
												sorting='T' styles='width:100%; height:100%' 
												oncelldblclick='OnGridCellDoubleClick(this)'
												oncellclick='OnGridCellClick(this)' />
										</td>
										<td style="width: 50%" >
											<gw:grid id='grdCons' 
												header='_Process_PK|Seq|_PK|_BOG_BOM_PK|_TCO_ITEM_PK|Item Code|Item Name|UOM|Lot Qty|Cons Qty|Need Qty|Remark'
												format='0|0|0|0|0|0|0|0|0|0|0|0' 
												aligns='0|1|0|0|0|0|0|1|3|3|3|0' 
												check='||||||||||'
												editcol='1|1|0|0|0|0|0|0|0|0|0|0' 
												widths='2000|800|0|0|0|1200|3000|800|1200|1200|1000|1200'
												sorting='T' styles='width:100%; height:100%' 	
												oncelldblclick="OnGridCellDoubleClick(this)"													
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
                <td style="width: 100%; height: 50%">
                    <table style="width: 100%; height: 100%">
                        <tr style="height: 1%">
                            <td style="width: 97%" align="center">
                                <gw:label id="txtCount" styles='width:100%;color:cc0000;font:9pt' />
                            </td>
							<td align="right" style="width: 1%">
                                <gw:imgbtn id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(grdReqList)" />
                            </td>
                            <td align="right" style="width: 1%">
                                <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                            </td>
                            <td align="right" style="width: 1%"  >
                                <gw:imgbtn img="select" alt="Select" id="Select" onclick="OnSelect(grdItemSelect)" />
                            </td>
                        </tr>
                        <tr style="height: 99%">
                            <td colspan="7">
                                <gw:grid id='grdItemSelect' header='_tsa_saleorderd_pk|Partner|_P/O No|No|ETD|_tco_item_pk|Item Code|Item Name|UOM|Ord Qty|_Unit Price|_amount|Prod Qty|Bal Qty|_TABLE'
                                    format='0|0|0|0|4|0|0|0|0|0|0|0|0|0|0' 
                                    aligns='0|0|0|0|0|0|0|0|1|3|0|0|3|3|0'
                                    check='|||||||||||||||' 
                                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    widths='0|2000|1500|1500|1200|0|1500|3500|800|1200|0|0|1200|1200|0'
                                    sorting='T' styles='width:100%; height:100%' />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>   
 </body>
</html>
